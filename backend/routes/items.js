const express = require('express')
const router = express.Router()
const {getAllItems,getAllPrimary
} = require ('../queries/items')

router.get('/primary',getAllPrimary)
router.get('/:id',getAllItems)


module.exports = router;
