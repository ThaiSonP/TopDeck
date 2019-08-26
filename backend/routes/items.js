const express = require('express')
const router = express.Router()
const {getAllItems,
} = require ('../queries/items')

router.get('/',getAllItems)


module.exports = router;
