const express = require('express')
const router = express.Router()
const {getAllOrigins,
  getHeroes} = require ('../queries/origin')

router.get('/',getAllOrigins)
router.get('/:id',getHeroes)

module.exports = router;
