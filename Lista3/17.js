var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/";

var n=0
var end=false;
var max=-1;
MongoClient.connect(url, function(err, db) {
  if (err) throw err;
  var dbo = db.db("MDBMusic");
  var query = {};
  dbo.collection("Zespol").find(query).toArray(function(err, result) {
    if (err) throw err;
    //console.log("RESULT");
    //console.log(result);
	
	for (i = 0; i < result.length; i++) {
		  if(result[i].liczbaAlbumow > max){
			max = result[i].liczbaAlbumow;
		  }
		}
	
	while(!end){
		var ileZespolow = 0;
		//console.log(n);
		for (i = 0; i < result.length; i++) {
		  //console.log(result[i].liczbaAlbumow + " --- " + n);
		  if(result[i].liczbaAlbumow == n){
			//end=true;
			ileZespolow = ileZespolow + 1;
		  }
		}
		if (ileZespolow > 3 || n > max) {
			end = true;
			console.log("Odpowiedz "+n);
		}
		n = n + 1;
	}
	
    db.close();
  });
});


