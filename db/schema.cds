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
    title    : String;
    author   : Association to Authors; //Asociacion a la entidad Authors 1..1 //Un libro solo puede tener un Autor
    Chapters : Composition of many Chapters
                   on Chapters.book = $self
}


entity Chapters : cuid, managed {
        number : Integer;
    key book   : Association to Books;
}


//Entidades nomenclatura en Plural y Mayuscula Primer
//Entidades-campos nomenclatura Minuscula
//Entidades-campos COMPOSICION(HJOS Y PADRES) Mayuscula Primer


/////////////////////
