const {db} = require('../data/index')

const getAllOrigins = (req,res,next)=>{
  db.any('SELECT * FROM origin')
  .then(origin=>{
    res.status(200).json({
      status: 'success',
      origin:origin
    })
  })
  .catch(err=>{
    console.log(err)
    res.json({
      status:'failed',
      message:err
    })
    return next(err)
  })
}

const getHeroes = (req,res,next) =>{
  let originID = parseInt(req.params.id)
  db.any('SELECT heroes.champion_name, heroes.id as hero_id, origin.origin, origin.id as origin_id, heroes.origin_id_2 as origin_id_2 FROM origin JOIN heroes ON heroes.origin_id = origin.id WHERE heroes.origin_id = $1 OR heroes.origin_id_2 = $1',[originID])
  .then(heroes=>{
    res.status(200)
    .json({
      status: 'success',
      origin: heroes[0]['origin'],
      heroes: heroes
    })
  })
  .catch(err=>{
    console.log(err)
    res.json({
      status: 'failed',
      message:err
    })
    return next(err)
  })
}

module.exports = {
  getAllOrigins,
  getHeroes
}
