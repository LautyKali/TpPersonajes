import express from "express";
import {PersonajeServices, PeliculaYSerieServices} from './Services.js';

const app = express();
const port = 3000;

app.get('/personaje',async(req,res) =>{
    const personaje = await PersonajeServices.getAll()
    res.status(200).send(personaje)
})

app.get('/personaje/get/id/:id',async(req,res) =>{
    const personaje = await PersonajeServices.getById(req.params.id)
    res.status(200).send(personaje)
})

app.get('/personaje/get/nombre/:nombre',async(req,res) =>{
    const personaje = await PersonajeServices.getByNombre(req.params.nombre)
    res.status(200).send(personaje)
})

app.get('/personaje/get/edad',async(req,res) =>{
    const personaje = await PersonajeServices.getByEdad()
    res.status(200).send(personaje)
})
app.get('/personaje/get/peso',async(req,res) =>{
    const personaje = await PersonajeServices.getByPeso()
    res.status(200).send(personaje)
})
app.get('/personaje/get/pelicula',async(req,res) =>{
    const personaje = await PersonajeServices.getByPeli()
    res.status(200).send(personaje)
})


app.delete('/personaje/delete/:id', async(req,res) => {
    const personaje = await PersonajeServices.deleteById(req.params.id)
    res.status(202).send(personaje)
})

app.use(express.json())
app.post('/personaje/post', async(req,res) =>{
    try{
        console.log(req.body)
        await PersonajeServices.insert(req.body)
        res.status(201).json({message: 'Personaje creado'})
    } catch (error){
        console.log(error)
        res.status(500).json({error : 'Fallo la cracion del personaje'})
    }
})

app.put('/personaje/put',async(req,res) => {
    let personaje = await PersonajeServices.update(req.body);
    res.status(202).send(personaje);
})

app.get('/pelicula&serie',async(req,res) =>{
    const pelicula = await PeliculaYSerieServices.getAll()
    res.status(200).send(pelicula)
})

app.get('/pelicula&serie/get/:id',async(req,res) =>{
    const pelicula = await PeliculaYSerieServices.getById(req.params.id)
    res.status(200).send(pelicula)
})

app.get('/pelicula&serie/get/:titulo',async(req,res) =>{
    const pelicula = await PeliculaYSerieServices.getByTitulo(req.params.titulo)
    res.status(200).send(pelicula)
})

app.get('/pelicula&serie/get/fechacreacion',async(req,res) =>{
    const pelicula = await PeliculaYSerieServices.getByFechaCreacion()
    res.status(200).send(pelicula)
})


app.delete('/pelicula&serie/delete/:id', async(req,res) => {
    const pelicula = await PeliculaYSerieServices.deleteById(req.params.id)
    res.status(202).send(pelicula)
})

app.use(express.json())
app.post('/pelicula&serie/post', async(req,res) =>{
    try{
        console.log(req.body)
        await PeliculaYSerieServices.insert(req.body)
        res.status(201).json({message: 'Pelicula creado'})
    } catch (error){
        console.log(error)
        res.status(500).json({error : 'Fallo la cracion de la pelicula'})
    }
})

app.put('/pelicula&serie/put',async(req,res) => {
    let pelicula = await PeliculaYSerieServices.update(req.body);
    res.status(202).send(pelicula);
})

app.listen(port,() =>{
    console.log(`Example app listening on port ${port}`)
})