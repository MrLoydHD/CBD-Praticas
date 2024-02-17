use lab02_02

// NMEC: 108215

//1. Liste todos os documentos da coleção
db.restaurants.find()

//2. Apresente os campos restaurant_id, nome, localidade e gastronomia para todos os documentos da coleção.
db.restaurants.find({ }, {restaurant_id:1, nome:1, localidade:1, gastronomia:1})

//3. Apresente os campos restaurant_id, nome, localidade e código postal (zipcode), mas exclua o campo _id de todos os documentos da coleção.
db.restaurants.find({ }, { _id: 0,restaurant_id:1, nome:1, localidade:1, "address.zipcode": 1})

//4. Indique o total de restaurantes localizados no Bronx.
db.restaurants.find({localidade: "Bronx"}, {nome:1, localidade:1}).count()

//5. Apresente os primeiros 15 restaurantes localizados no Bronx, ordenados por ordem crescente de nome.
db.restaurants.find({localidade: "Bronx"}, {nome:1, localidade:1}).sort({nome:1}).limit(15)

//6. Liste todos os restaurantes que tenham pelo menos um score superior a 85.
db.restaurants.find({"grades.score": {$gt : 85}}, {nome:1, localidade: 1, restaurant_id:1, _id: 0, "grades.score": 1})

//7. Encontre os restaurantes que obtiveram uma ou mais pontuações (score) entre [80 e 100].
db.restaurants.find({"grades": {$elemMatch: {"score": { $gte: 80, $lte: 100 }}}}, { nome: 1, localidade: 1, restaurant_id: 1, _id: 0, "grades.score": 1})

//8. Indique os restaurantes com latitude inferior a -95,7.
db.restaurants.find({"address.coord.0": {$lt: -95.7}}, {nome:1, localidade: 1, restaurant_id:1, _id: 0})

//9. Indique os restaurantes que não têm gastronomia "American", tiveram uma (ou mais) pontuação superior a 70 e estão numa latitude inferior a -65.
db.restaurants.find({ gastronomia: { $ne: "American" }, "grades.score": { $gt: 70 }, "address.coord.0": { $lt: -65 }}, { nome: 1, gastronomia: 1, "grades.score": 1, "address.coord": 1})

//10 . Liste o restaurant_id, o nome, a localidade e gastronomia dos restaurantes cujo nome começam por "Wil"
db.restaurants.find({nome: {$regex: /^Ŵil/}}, {restaurant_id: 1, nome:1, localidade:1, gastronomia:1, _id:0})

//11. Liste o nome, a localidade e a gastronomia dos restaurantes que pertencem ao Bronx e cuja gastronomia é do tipo "American" ou "Chinese".
db.restaurants.find({localidade: "Bronx", 
    $or: [{gastronomia: "American"},{gastronomia: "Chinese"}]
  }, {nome: 1,
  localidade: 1,
  gastronomia: 1,
  _id:0
  })

//12. Liste o restaurant_id, o nome, a localidade e a gastronomia dos restaurantes localizados em "Staten Island", "Queens", ou "Brooklyn".
db.restaurants.find({ 
    $or: [{localidade: "Queens"},{localidade: "Brooklyn"},{localidade: "Staten Island"}]
  }, {restaurant_id:1,
  nome: 1,
  localidade: 1,
  gastronomia: 1,
  _id:0
  })
  
//13. Liste o nome, a localidade, o score e gastronomia dos restaurantes que alcançaram sempre pontuações inferiores ou igual a 3
db.restaurants.find({"grades.score": {$not: {$gt: 3}}} ,{nome: 1 , localidade: 1, "grades.score": 1, gastronomia: 1, _id: 0})

//14. Liste o nome e as avaliações dos restaurantes que obtiveram uma avaliação com um grade "A", um score 10 na data "2014-08-11T00: 00: 00Z" (ISODATE).
db.restaurants.find({grades: {"$elemMatch": {grade:"A", score: 10, date: ISODate("2014-08-11T00:00:00Z")}}}, {"_id": 0, "nome": 1, grades:1})

//15. Liste o restaurant_id, o nome e os score dos restaurantes nos quais a segunda avaliação foi grade "A" e ocorreu em ISODATE "2014-08-11T00: 00: 00Z".
db.restaurants.find({$and : [{"grades.1.grade": "A"}, {"grades.1.date" : ISODate("2014-08-11T00:00:00Z")}]}, {restaurant_id: 1, nome: 1, grades: 1, _id: 0})

//16. Liste o restaurant_id, o nome, o endereço (address) e as coordenadas geográficas (coord) dos restaurantes onde o 2º elemento da matriz de coordenadas tem um valor superior a 42 e inferior ou igual a 52.
db.restaurants.find({"address.coord.1": {$gt: 42, $lte: 52}}, {_id: 0, restaurant_id: 1, nome: 1, address: 1})

//17. Liste nome, gastronomia e localidade de todos os restaurantes ordenando por ordem crescente da gastronomia e, em segundo, por ordem decrescente de localidade.
db.restaurants.find({ }, {nome: 1, localidade: 1, gastronomia: 1, _id:0}).sort({gastronomia: 1 , localidade: -1})

//18. Liste nome, localidade, grade e gastronomia de todos os restaurantes localizados em Brooklyn que não incluem gastronomia "American" e obtiveram uma classificação (grade) "A". Deve apresentá-los por ordem decrescente de gastronomia.
db.restaurants.find({localidade: "Brooklyn", gastronomia: {$ne: "American"}, "grades.grade": "A"}, {_id: 0, nome: 1, localidade: 1, grade: 1, gastronomia: 1}).sort({gastronomia: -1})

//19. Indique o número total de avaliações (numGrades) na coleção.
db.restaurants.aggregate([
   {
    $unwind: "$grades"
  },
  {
    $group: {
      _id: null,
      numGrades: { $sum: 1 }
    }
  }
   ])

//20. Apresente o nome e número de avaliações (numGrades) dos 3 restaurante com mais avaliações.
db.restaurants.aggregate([
  {
    $project: {
      _id:0,
      nome: 1,
      numGrades: { $size: "$grades" }
    }
  },
  {
    $sort: { numGrades: -1 }
  },
  {
    $limit: 3
  }
])

//21. Apresente o número total de avaliações (numGrades) em cada dia da semana
db.restaurants.aggregate([
  {
    $unwind: "$grades"
  },
  {
    $project: {
      diaDaSemana: { $dayOfWeek: "$grades.date" },
    }
  },
  {
    $group: {
      _id: "$diaDaSemana",
      totalAvaliacoes: { $sum: 1 }
    }
  },
    {
    $sort: { _id: 1 } // Ordenar por dia da semana
  },
  {
    $project: {
      diaDaSemana: {
        $switch: {
          branches: [
            { case: { $eq: ["$_id", 1] }, then: "Domingo" },
            { case: { $eq: ["$_id", 2] }, then: "Segunda-feira" },
            { case: { $eq: ["$_id", 3] }, then: "Terça-feira" },
            { case: { $eq: ["$_id", 4] }, then: "Quarta-feira" },
            { case: { $eq: ["$_id", 5] }, then: "Quinta-feira" },
            { case: { $eq: ["$_id", 6] }, then: "Sexta-feira" },
            { case: { $eq: ["$_id", 7] }, then: "Sábado" },
          ],
          default: "Desconhecido" // Valor padrão caso o ID não corresponda a nenhum dia
        }
      },
      totalAvaliacoes: 1,
      _id: 0 // Remove o campo _id do resultado
    }
  },
])

//22. Conte o total de restaurante existentes em cada localidade.
db.restaurants.aggregate([{$group:{_id: "$localidade", restaurantsNum : {$sum: 1}}},
    {$project : {
        _id: 0, // Isso remove o campo _id do resultado
        localidade: "$_id", // Renomeia o campo _id para localidade
        restaurantsNum: 1
    }}
])

//23. . Indique os restaurantes que têm gastronomia "Portuguese", o somatório de score é superior a 50 e estão numa latitude inferior a -60.
db.restaurants.aggregate([
  {
    $match: {
      gastronomia: "Portuguese"
    }
  },
  {
    $project: {
      nome: 1,
      gastronomia: 1,
      totalScore: { $sum: "$grades.score" },
      latitude: { $arrayElemAt: ["$address.coord", 0] }
    }
  },
  {
    $match: {
      totalScore: { $gt: 50 },
      latitude: { $lt: -60 }
    }
  }
])

//24. Apresente o número de gastronomias diferentes na rua "Fifth Avenue"
db.restaurants.distinct("gastronomia", { "address.rua": "Fifth Avenue" }).length

//ou

db.restaurants.aggregate([
  {
    $match: {
      "address.rua": "Fifth Avenue"
    }
  },
  {
    $group: {
      _id: "$gastronomia",
      restaurantes: { $addToSet: "$nome" }
    }
  },
  {
    $project: {
      _id: 0,
      gastronomia: "$_id",
      numRestaurantes: { $size: "$restaurantes" },
      restaurantes: 1
    }
  }
])

//25. Apresente o nome e o score médio (avgScore) e número de avaliações (numGrades) dos restaurantes com score médio superior a 30 desde 1-Jan-2014.

db.restaurants.aggregate([
    {
        $unwind: "$grades"
    },
    {
        $match: {
            "grades.date": {$gte : ISODate("2014-01-01T00:00:00Z") }
        }
    },
    {
        $group: {
            _id: "$_id",
            nome: {$first: "$nome"},
            avgScore: {$avg: "$grades.score"},
            numGrades: {$sum: 1}
        }
    },
    {
        $match: {
            avgScore : {$gt : 30}
        }
    },
    {
        $project:{
            _id : 0,
            nome: 1,
            avgScore: 1,
            numGrades: 1
        }
    }
])

//26. Apresente os restaurantes que têm mais de uma avaliação no mesmo dia
db.restaurants.aggregate([
    {
     $unwind: "$grades"
    },
    {
      $group: {
          _id: {
              restaurant: "$nome",
              dataAvaliacao: "$grades.date"
          },
          numAval : {$sum: 1}
      }
    } ,
    {
        $match : {
            numAval: {$gt :1 }
        }
    } , 
    {
        $project:{
            _id: 0,
            restaurante:"$_id.restaurant",
            dataAvaliacao: {
                $dateToString: {
                    format: "%Y-%m-%d",
                    date: "$_id.dataAvaliacao"
                }
            },
            numAval: 1
        }
    }
])

//27. Listte as diferentes gastronomias localizados na cidade de Manhattan
db.restaurants.distinct("gastronomia", {localidade: "Manhattan"})

//28. Liste os 5 restauraantes com maior quantidade de avaliações "A"
db.restaurants.aggregate([
    {
        $unwind: "$grades"
    },
    {
        $match: {
            "grades.grade": "A"
        }
    }, 
    {
        $group:{
            _id: "$nome",
            numAvaliacao: {$sum : 1 }
        }
    },
    {
        $sort:{
            numAvaliacao: -1
        }
    },
    {
        $limit:5
    },
    {
        $project : {
            _id: 0,
            nomeRestaurant: "$_id",
            numAvaliacao: 1
        }
    }  
])

//29. Apresenta os 3 restaurantes mais presentes em diferentes localidades.
db.restaurants.aggregate([
    {
        $group: {
            _id: "$nome",
            localidades: {$addToSet: "$localidade" },
            numLocalidades: {$sum : 1}
        }
    }, 
    {
        $sort: {
            numLocalidades: -1
        }    
    },
    {
        $limit:3
    },
        {
        $project: {
            _id: 0,
            restaurante: "$_id",
            localidades: 1,
            totalLocalidades: { $size: "$localidades" }
        }
    }
])

//30. Apresenta o score médio de todos os restaurantes.
db.restaurants.aggregate([
    {
        $unwind: "$grades"
    },
    {
        $group: {
            _id: "$nome",
            scoreMedio: {$avg: "$grades.score"}
        }
    },
    {
         $project:{
             _id: 0,
             restaurant: "$_id",
             scoreMedio: 1
         }   
    }
])







