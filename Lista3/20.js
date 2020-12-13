use MDBMusic

db.Utwor.aggregate([
{ 
    $group: { 
        _id: "$album", 
        sumczas: { $sum: "$czastrwania" }
    }
},
{
	$sort: {"sumczas" : -1}
},
{
	$limit: 1
}

])