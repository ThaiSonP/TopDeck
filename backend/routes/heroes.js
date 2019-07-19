const express = require('express')
const router = express.Router()
const {getAllHeroes,
  getAHero} = require ('../queries/heroes')

router.get('/',getAllHeroes)
router.get('/:id',getAHero)

module.exports = router;
