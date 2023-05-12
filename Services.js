import config from './dbconfig.js';
import sql from 'mssql';

export class PersonajeServices{
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
                .query("SELECT P.Id as IdPersonaje,P.Nombre,P.Imagen,P.Edad,P.Peso,P.Historia,PS.Id as IdPeli_Serie,PS.Titulo,PS.Imagen,PS.FechaCreacion,PS.Calificacion FROM PersonajeXPeli_Serie X INNER JOIN Personaje P on P.Id=X.fkPersonaje INNER JOIN Peli_Serie PS on PS.Id = X.fkPeli_Serie WHERE X.fkPersonaje =@pId");
            returnEntity = result.recordsets[0][0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity
    }

    static insert = async (personaje) =>{
        console.log("Estoy en: insert");
            const {Nombre,Imagen,Edad,Peso,Historia} = personaje
            let pool = await sql.connect(config)

            let result = await pool.request()
            .input('Nombre',sql.NVarChar(50),Nombre)
            .input('Imagen',sql.NVarChar(4000),Imagen)
            .input('Edad',sql.Int,Edad)
            .input('Peso',sql.NVarChar(50),Peso)
            .input('Historia',sql.NVarChar(4000),Historia)
            .query('INSERT INTO personajes (Nombre,Imagen,Edad,Peso,Historia) VALUES (@Nombre, @Imagen,@Edad,@Peso,@Historia)')
    }

        static update = async (personaje) =>{
        const {id, Nombre,Imagen,Edad,Peso,Historia} = personaje
        let returnEntity = null;
        console.log("Estoy en: update");
        try{
            let pool = await sql.connect(config)
            let result = await pool.request()
            .input('pId',sql.Int,id)
            .input('Nombre',sql.NVarChar(50),Nombre)
            .input('Imagen',sql.NVarChar(4000),Imagen)
            .input('Edad',sql.Int,Edad)
            .input('Peso',sql.NVarChar(50),Peso)
            .input('Historia',sql.NVarChar(4000),Historia)
            .query('UPDATE personajes SET Nombre = @Nombre, Imagen = @Imagen, Edad = @Edad, Peso = @Peso, Historia = @Historia  WHERE Personaje.id = @pId')
            returnEntity = result.recordsets[0];
        } catch (error){
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
                .query("Delete FROM personajes WHERE id = @pId");
            returnEntity = result.recordsets[0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity;
    }
    
}