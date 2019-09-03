const express = require('express')
const router = express.Router()
const {getAllItems,getAllPrimary,getAPrimary
} = require ('../queries/items')

router.get('/primary',getAllPrimary)
router.get('/primary/:id',getAPrimary)

router.get('/:id',getAllItems)


module.exports = router;
