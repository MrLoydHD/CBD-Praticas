
// a)

populatePhones = function (country, start, stop) {

  var prefixes = [21, 22, 231, 232, 233, 234 ];
  for (var i = start; i <= stop; i++) {

    var prefix = prefixes[(Math.random() * 6) << 0]
    var countryNumber = (prefix * Math.pow(10, 9 - prefix.toString().length)) + i;
    var num = (country * 1e9) + countryNumber;
    var fullNumber = "+" + country + "-" + countryNumber;

    db.phones.insert({
      _id: num,
      components: {
        country: country,
        prefix: prefix,
        number: i
      },
      display: fullNumber
    });
    print("Inserted number " + fullNumber);
  }
  print("Done!");
}

populatePhones(351, 1, 5)

//b)

db.phones.drop()
populatePhones(351, 1, 200000)

// Encontrar um número específico
db.phones.find({ "_id": 351210200000 })

// Contar o número total de documentos na coleção
db.phones.countDocuments()

// Exibir os 10 primeiros documentos
db.phones.find().limit(10)

// c) 
populatePhones(123, 1, 1000)
populatePhones(234, 1, 2000)

db.phones.aggregate([
    {
        $group :{
            _id:"$components.prefix", numTl: {$sum: 1}
        }
    }

])

// d) 

db.phones.insertOne({
  _id: 123454321, // Um número capicua de exemplo
  components: {
    country: 123,
    prefix: 45,
    number: 54321
  },
  display: "+123-123454321"
});


function findCapicuas(collection){
    var cursor = collection.find();
    var capicuas = [];

    cursor.forEach(function(doc){
        var num = doc.display.split("-")[1];
        var numStrReverse = num.split("").reverse().join("");
        if(numStr == numStrReverse){
            capicuas.push({number: num, value: numStr});
        }
    });
    return capicuas;
}

var capicuas = findCapicuas(db.phones);

print("Números capicuas encontrados na coleção: " + JSON.stringify(capicuas));

findSequence = function (collection, sequence){
    var cursor = collection.find().toArray();
    var matches = [];
    
    for (let i = 0; i < cursor.length; i++) {
        var numStr = cursor[i]._id.toString();
        if (numStr.includes(sequence)) {
            matches.push(numStr);
        }
    }

    return matches;
}

var sequence = findSequence(db.phones, "000");

print("Números com a sequência 000: ");
for (let i = 0; i < sequence.length; i++) {
    print(sequence[i]);
}