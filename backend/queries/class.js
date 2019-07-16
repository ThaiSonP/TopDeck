const {db} = require('../data/index')

const getAllClass = (req,res,next)=>{
  db.any('SELECT * FROM class')
  .then(classes=>{
    res.status(200).json({
      status: 'success',
      class:classes
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
  let classID = parseInt(req.params.id)
  db.any('SELECT heroes.champion_name, heroes.id as hero_id, class.id as class_id FROM class JOIN heroes ON heroes.class_id = class.id WHERE heroes.class_id = $1 OR heroes.class_id_2 = $1',[classID])
  .then(heroes=>{
    res.status(200)
    .json({
      status: 'success',
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
  getAllClass,
  getHeroes
}
