var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://127.0.0.1:27017/";

MongoClient.connect(url, function(err, db) {
  if (err) throw err;
  var dbo = db.db("MDBMusic");
  dbo.collection('Album').aggregate([
    { $lookup:
       {
         from: 'Utwor',
         localField: 'nazwaAlbum',
         foreignField: 'album',
         as: 'test'
       }
     }
    ]).toArray(function(err, res) {
		if (err) throw err;
		
		for(i = 0;i < res.length;i++){
			if(res[i].gatunek.includes("Rock")){
				//console.log(res[i].test);
				for(j = 0;j < res[i].test.length;j++){
					console.log(res[i].test[j].tytul, res[i].test[j].wykonawca);
				}
			}
		}
		
		
		db.close();
    });
});