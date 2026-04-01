using {
    cuid,
    managed
} from '@sap/cds/common'; //Usando aspect "cuid" de la libreria esa

//Aspects: Estructura para reutilizar y incluirla en entidades  //"Toma todo lo que define cuid y mételo dentro de mi entidad Books".

namespace tutorial.db; //Se le da un namespace para organizarlo mejor y luego importarlo en el servicio


entity Authors : cuid, managed {
    name  : String;
    books : Association to many Books //Books asociacion 1..* //Un autor puede tener muchos libros  //
                on books.author = $self //Se refiere al campo author que definiste arriba en la entidad Books //$self: Es una palabra clave que significa "esta instancia de Autor"
}

entity Books : cuid, managed {
    title       : String;
    author      : Association to Authors; //Asociacion a la entidad Authors 1..1 //Un libro solo puede tener un Autor
    genre       : String;
    publishedAt : Date;
    pages       : Integer;
    price       : Decimal(9, 2);
    stock       : Integer;
    status : Association to BookStatus;
    Chapters    : Composition of many Chapters
                      on Chapters.book = $self

}

entity BookStatus { //Entidad para el Status
    key code        : String(1) enum { //Type BookStatusCode para los codigos
            Available = 'A';
            Low_Stock = 'L';
            Unavailable = 'U';
            Rare = 'R';
            None = 'N';
        }
        criticality : Integer;
        displayText : String;
}


//Status enum de esta manera, pero se puede hacer directo en la entidad
// type BookStatusCode : String(1) enum{
//     Available = 'A';
//     Low_Stock = 'L';
//     Unavailable = 'U';
// }


entity Chapters : cuid, managed {
        number : Integer;
    key book   : Association to Books;
        title  : String;
        pages  : Integer;

}


//Entidades nomenclatura en Plural y Mayuscula Primer
//Entidades-campos nomenclatura Minuscula
//Entidades-campos COMPOSICION(HJOS Y PADRES) Mayuscula Primer


/////////////////////
