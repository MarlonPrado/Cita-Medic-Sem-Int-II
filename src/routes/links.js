const express = require('express');
const router = express.Router();

const pool = require('../database');
router.get('/add', (req,res) =>{
    res.render('links/add');
});

router.post('/add', async (req,res) =>{
    
    const {nombrep, edadp, eps, anioingres} = req.body;
    const newPaciente = {
        nombrep,
        edadp,
        eps,
        anioingres
    };


    await pool.query('INSERT INTO paciente set ?', [newPaciente]);
    res.send('Received');
});

router.get('/paciente' , async(req,res) => {
    const lpaciente = await pool.query('SELECT * FROM paciente');
    console.log(lpaciente);
    res.render('links/list', { lpaciente })
});

module.exports = router;