use MDBMusic

db.Zespol.aggregate([
{
   $lookup:
     {
       from: "Album",
       localField: "nazwa",
       foreignField: "zespol",
       as: "licz"
     }
},
{
    $project: {
        nazwaZespolu: "$nazwa",
        liczbaAlbumow: { $size: "$licz" }
    }
}

]).forEach( doc => db.Zespol.updateOne( 
{ nazwa: doc.nazwaZespolu }, { $set: { liczbaAlbumow: doc.liczbaAlbumow } } 
))