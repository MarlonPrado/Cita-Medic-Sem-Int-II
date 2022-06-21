const express = require('express');
const router = express.Router();

const pool = require('../database');

const passport = require('passport');

router.get('/login', (req,res) =>{
    res.render('links/login');
});
router.get('/registro', (req,res) =>{
    res.render('links/register');

});

router.get('/registroPaciente', (req,res) =>{
    res.render('links/registrarPaciente');
    
});

router.get('/odontograma', (req,res) =>{
    res.render('links/OdonctogramaGenerator');
    
});


router.get('/deleteC/:id', async (req, res) => {
    const { id } = req.params;
    await pool.query('DELETE FROM cita WHERE idc = ?', [id]);
    
    
    res.render('links/registrarPaciente');
});

router.post('/registroPaciente', async (req,res) =>{
    
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

router.post('/agendarCitaOdontologica', async (req,res) =>{
    
    const { idc,  nombrep,  motivo , descrp, fechai , fechaf , nombreo} = req.body;
    const estado = "Agendado";
    const newCita = {
        idc,  
        nombrep,  
        motivo , 
        descrp, 
        fechai , 
        fechaf , 
        nombreo,
        estado
    };


    await pool.query('INSERT INTO cita set ?', [newCita]);
    const lpac = await pool.query('SELECT * FROM paciente');
    console.log(lpac);
    const lcita = await pool.query('SELECT * FROM cita');
    console.log(lcita);
    res.render('links/AgendarCitaMedica', { lpac , lcita})
});




router.post('/registro',  passport.authenticate('local.registro', {
        successRedirect: '/login',
        failureRedirect: '/registro'
    
}));

router.post('/login', (req,res,next) =>{
     passport.authenticate('local.login', {
    successRedirect: '/listPaciente',
    failureRedirect: '/login'
     } )(req,res,next);
});


router.get('/listPaciente' , async(req,res) => {
    const lpaciente = await pool.query('SELECT * FROM paciente');
    console.log(lpaciente);

    

    res.render('links/listPaciente', { lpaciente })
});

router.get('/agendarCitaOdontologica' , async(req,res) => {
    const lpac = await pool.query('SELECT * FROM paciente');
    console.log(lpac);
    const lcita = await pool.query('SELECT * FROM cita');
    console.log(lcita);
    res.render('links/AgendarCitaMedica', { lpac , lcita})
});



router.get('/triste', (req,res) =>{
    res.send(':c algo fallo!')
});

module.exports = router;
