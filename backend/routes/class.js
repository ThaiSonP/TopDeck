const express = require('express')
const router = express.Router()
const {getAllClass,
  getHeroes} = require ('../queries/class')

router.get('/',getAllClass)
router.get('/:id',getHeroes)

module.exports = router;
