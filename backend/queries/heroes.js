const {db} = require('../data/index')

const getAllHeroes = (req,res,next)=>{
  db.any('SELECT heroes.*, class.class AS class_1 , origin.origin AS origin_1 FROM heroes JOIN class ON heroes.class_id = class.id JOIN origin ON heroes.origin_id = origin.id')
  .then(heroes=>{
    res.status(200).json({
      status: 'success',
      class:heroes
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


const getAHero = (req,res,next) =>{
  let heroID = parseInt(req.params.id)
  db.any('SELECT heroes_stats.*, heroes.champion_name, class.class, origin.origin, class.id AS class_id, heroes.class_id_2, origin.id AS origin_id,   heroes.origin_id_2 FROM heroes_stats JOIN heroes ON heroes.id = heroes_stats.hero_id  JOIN class ON heroes.class_id = class.id  JOIN origin ON heroes.origin_id = origin.id WHERE heroes.id =$1',[heroID])
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
  getAllHeroes,
  getAHero
}
