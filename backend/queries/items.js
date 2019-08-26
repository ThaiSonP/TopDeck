const {db} = require ('../data/index')

const getAllItems = (req,res,next)=>{
  let item1 = parseInt(req.params.id)
  db.any('select * from combined_items where  combined_items.item1 = $1 ',[item1])
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

const getAllPrimary = (req,res,next)=>{
  db.any('select * from primary_items')
  .then(primary=>{
    res.status(200).json({
      status:"success",
      items:primary
    })
  })
  .catch(err=>{
    console.log(err)
    res.json({
      status:'failed',
      message: err
    })
    return next(err)
  })
}

// const getOneItem = (req,res,next=>{
//   db.any ('select * from primary_items ')
// })
module.exports={
  getAllItems,
  getAllPrimary
}
