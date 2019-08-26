const {db} = require ('../data/index')

const getAllItems = (req,res,next)=>{
  db.any('select * from primary_items join combined_items on item1 = primary_items.id ')
  .then(items=>{
    res.status(200).json({
      status:'success',
      items:items
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

// const getOneItem = (req,res,next=>{
//   db.any ('select * from primary_items ')
// })
module.exports={
  getAllItems
}
