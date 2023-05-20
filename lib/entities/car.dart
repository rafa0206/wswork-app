class Car {

  // int id;
  // int brandId;
  // String brandName;
  // String modelName;
  // int year;
  // String fuel;
  // int numDoors;
  // double fipeValue;
  // String color;
  // int timestampRegister;
  // bool? isSelected;

  int id;
  int brandId;
  String brandName;
  String modelName;
  dynamic year;
  String fuel;
  int numDoors;
  dynamic fipeValue;
  String color;
  dynamic timestampRegister;
  bool? isSelected;

  Car({required this.id,
    required this.brandId,
    required this.brandName,
    required this.modelName,
    required this.year,
    required this.fuel,
    required this.numDoors,
    required this.fipeValue,
    required this.color,
    required this.timestampRegister,
    this.isSelected
  });

  // factory Car.fromJson(Map<String, dynamic> json){
  //   return Car(
  //     id: (json['id'] as num).toInt(),
  //     brandId: (json['marca_id'] as num).toInt(),
  //     brandName: (json['marca_nome'] as String),
  //     modelName: (json['nome_modelo'] as String),
  //     year: (json['ano'] as num).toInt(),
  //     fuel: (json['combustivel'] as String),
  //     numDoors: (json['num_portas'] as num).toInt(),
  //     fipeValue: (json['valor_fipe'] as num).toDouble(),
  //     color: (json['cor'] as String),
  //     timestampRegister: (json['timestamp_cadastro'] as num).toInt(),
  //   );
  // }

  factory Car.fromJson(Map<String, dynamic> json){
    return Car(
      id: (json['id'] as num).toInt(),
      brandId: (json['marca_id'] as num).toInt(),
      brandName: (json['marca_nome'] as String),
      modelName: (json['nome_modelo'] as String),
      year: (json['ano'] as dynamic),
      fuel: (json['combustivel'] as String),
      numDoors: (json['num_portas'] as num).toInt(),
      fipeValue: (json['valor_fipe'] as dynamic),
      color: (json['cor'] as String),
      timestampRegister: (json['timestamp_cadastro'] as dynamic),
    );
  }

  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      'id': id,
      'marca_id': brandId,
      'marca_nome': brandName,
      'nome_modelo': modelName,
      'ano': year,
      'combustivel': fuel,
      'num_portas': numDoors,
      'valor_fipe': fipeValue,
      'cor': color,
      'timestamp_cadastro': timestampRegister,
    };
  }



}