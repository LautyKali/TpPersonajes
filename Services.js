import config from './dbconfig.js';
import sql from 'mssql';
export class PersonajeServices {
    static getAll = async () => {
        let returnEntity = null;
        console.log("Estoy en: GetAll");
        try {
            let pool = await sql.connect(config)
            let result = await pool.request()
                .query("SELECT Imagen, Nombre, Id FROM Personaje");
            returnEntity = result.recordsets[0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity
    }
    static getById = async (id) => {
        let returnEntity = null;
        console.log("Estoy en: GetById");
        try {
            let pool = await sql.connect(config)
            let result = await pool.request()
                .input("pId", sql.Int, id)
                .query("SELECT P.Id as IdPersonaje,P.Nombre,P.Imagen as Imagen,P.Edad,P.Peso,P.Historia,PS.Id as IdPeli_Serie,PS.Titulo,PS.Imagen AS ImagenPeliSerie,PS.FechaCreacion,PS.Calificacion FROM PersonajeXPeli_Serie X INNER JOIN Personaje P on P.Id=X.fkPersonaje INNER JOIN Peli_Serie PS on PS.Id = X.fkPeli_Serie WHERE X.fkPersonaje =@pId");
            returnEntity = result.recordsets[0][0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity
    }


    static insert = async (personaje) => {
        console.log("Estoy en: insert");
        const { Nombre, Imagen, Edad, Peso, Historia } = personaje
        let pool = await sql.connect(config)

        let result = await pool.request()
            .input('Nombre', sql.NVarChar(50), Nombre)
            .input('Imagen', sql.NVarChar(4000), Imagen)
            .input('Edad', sql.Int, Edad)
            .input('Peso', sql.Float, Peso)
            .input('Historia', sql.NVarChar(4000), Historia)
            .query('INSERT INTO Personaje (Nombre,Imagen,Edad,Peso,Historia) VALUES (@Nombre, @Imagen,@Edad,@Peso,@Historia)')
    }

    static update = async (personaje) => {
        const { id, Nombre, Imagen, Edad, Peso, Historia } = personaje
        let returnEntity = null;
        console.log("Estoy en: update");
        try {
            let pool = await sql.connect(config)
            let result = await pool.request()
                .input('pId', sql.Int, id)
                .input('Nombre', sql.NVarChar(50), Nombre)
                .input('Imagen', sql.NVarChar(4000), Imagen)
                .input('Edad', sql.Int, Edad)
                .input('Peso', sql.Float, Peso)
                .input('Historia', sql.NVarChar(4000), Historia)
                .query('UPDATE Personaje SET Nombre = @Nombre, Imagen = @Imagen, Edad = @Edad, Peso = @Peso, Historia = @Historia  WHERE Personaje.id = @pId')
            returnEntity = result.recordsets[0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity;
    }


    static deleteById = async (id) => {
        let returnEntity = null;
        console.log("Estoy en: delete");
        try {
            let pool = await sql.connect(config)
            let result = await pool.request()
                .input("pId", sql.Int, id)
                .query("Delete FROM Personaje WHERE id = @pId");
            returnEntity = result.recordsets[0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity;
    }


    static getByNombre = async (nombre) =>{
        let returnEntity = null;
        console.log("Estoy en: GetByName");
        try {
            let pool = await sql.connect(config)
            let result = await pool.request()
                .input("pNombre", sql.NVarChar(4000), nombre)
                .query("SELECT Imagen, Nombre, Id FROM Personaje P WHERE P.Nombre = @pNombre");
            returnEntity = result.recordsets[0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity
    }

    static getByEdad = async () =>{
        let returnEntity = null;
        console.log("Estoy en: GetByEdad");
        try {
            let pool = await sql.connect(config)
            let result = await pool.request()
                .query("SELECT Imagen, Nombre, Id, Edad FROM Personaje P ORDER BY  P.Edad ASC");
            returnEntity = result.recordsets[0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity
    }

    static getByPeso = async () =>{
        let returnEntity = null;
        console.log("Estoy en: GetByPeso");
        try {
            let pool = await sql.connect(config)
            let result = await pool.request()
                .query("SELECT Imagen, Nombre, Id, Peso FROM Personaje P ORDER BY  P.Peso ASC");
            returnEntity = result.recordsets[0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity
    }
    static getByPeli = async (id) =>{
        let returnEntity = null; 
        console.log("Estoy en: GetByPeli");
        try {
            let pool = await sql.connect(config)
            let result = await pool.request()
                .input("pId", sql.Int, id)
                .query("SELECT P.Imagen, P.Nombre, P.Id, PS.Id AS IdPelicula FROM PersonajeXPeli_Serie X INNER JOIN Personaje P on P.Id=X.fkPersonaje INNER JOIN Peli_Serie PS on PS.Id = X.fkPeli_Serie WHERE PS.Id = @pId ORDER BY  P.Edad ASC");
            returnEntity = result.recordsets[0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity
    }
    }


export class PeliculaYSerieServices {
    static getAll = async () => {
        let returnEntity = null;
        console.log("Estoy en: GetAll");
        try {
            let pool = await sql.connect(config)
            let result = await pool.request()
                .query("SELECT Imagen, Titulo, FechaCreacion, Id FROM Peli_Serie");
            returnEntity = result.recordsets[0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity
    }
    static getById = async (id) => {
        let returnEntity = null;
        console.log("Estoy en: GetById");
        try {
            let pool = await sql.connect(config)
            let result = await pool.request()
                .input("pId", sql.Int, id)
                .query("SELECT P.Id as IdPersonaje,P.Nombre,P.Imagen,P.Edad,P.Peso,P.Historia,PS.Id as IdPeli_Serie,PS.Titulo,PS.Imagen,PS.FechaCreacion,PS.Calificacion FROM PersonajeXPeli_Serie X INNER JOIN Personaje P on P.Id=X.fkPersonaje INNER JOIN Peli_Serie PS on PS.Id = X.fkPeli_Serie WHERE X.fkPeli_Serie = @pId");
            returnEntity = result.recordsets[0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity
    }
    static insert = async (pelicula_serie) => {
        console.log("Estoy en: insert");
        const { Titulo, Imagen, FechaCreacion, Calificacion } = pelicula_serie
        let pool = await sql.connect(config)

        let result = await pool.request()
            .input('Titulo', sql.NVarChar(50), Titulo)
            .input('Imagen', sql.NVarChar(4000), Imagen)
            .input('FechaCreacion', sql.Date, FechaCreacion)
            .input('Calificacion', sql.Float, Calificacion)
            .query('INSERT INTO Peli_Serie (Titulo,Imagen,FechaCreacion,Calificacion) VALUES (@Titulo, @Imagen, @FechaCreacion, @Calificacion)')
    }

    static update = async (pelicula_serie) => {
        const { Id, Titulo, Imagen, FechaCreacion, Calificacion } = pelicula_serie
        let returnEntity = null;
        console.log("Estoy en: update");
        try {
            let pool = await sql.connect(config)
            let result = await pool.request()
                .input('pId', sql.Int, Id)
                .input('Titulo', sql.NVarChar(50), Titulo)
                .input('Imagen', sql.NVarChar(4000), Imagen)
                .input('FechaCreacion', sql.Date, FechaCreacion)
                .input('Calificacion', sql.Float, Calificacion)
                .query('UPDATE Peli_Serie  SET Titulo = @Titulo, Imagen = @Imagen, FechaCreacion = @FechaCreacion, Calificacion = @Calificacion  WHERE Peli_Serie.id = @pId')
            returnEntity = result.recordsets[0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity;
    }


    static deleteById = async (id) => {
        let returnEntity = null;
        console.log("Estoy en: delete");
        try {
            let pool = await sql.connect(config)
            let result = await pool.request()
                .input("pId", sql.Int, id)
                .query("Delete FROM Peli_Serie WHERE id = @pId");
            returnEntity = result.recordsets[0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity;
    }

    static getByTitulo = async (titulo) =>{
        console.log("Estoy en: GetByTitulo");
        let returnEntity = null;
        try {
            let pool = await sql.connect(config)
            let result = await pool.request()
                .input("pTitulo", sql.NVarChar(4000), titulo)
                .query("SELECT Imagen, Titulo, Id FROM Peli_Serie PS WHERE PS.Titulo = @pTitulo");
            returnEntity = result.recordsets[0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity
    }
    static getByFechaCreacion = async () =>{
        console.log("Estoy en: GetByFechaCreacion");
        let returnEntity=null;
        try {
            let pool = await sql.connect(config)
            let result = await pool.request()
            .query("SELECT Imagen, Titulo, Id, FechaCreacion FROM Peli_Serie PS ORDER BY  PS.FechaCreacion ASC ");
            returnEntity = result.recordsets[0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity
    }
}
