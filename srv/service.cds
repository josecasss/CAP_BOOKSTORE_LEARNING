
using {tutorial.db as db} from '../db/schema'; // Importamos el namespace y le damos un alias

//Servicio para la entidad
service BookstoreService{
    entity Authors as projection on db.Authors;
    entity Books as projection on db.Books;
    entity Chapters as projection on db.Chapters;
    entity BookStatus as projection on db.BookStatus;
}