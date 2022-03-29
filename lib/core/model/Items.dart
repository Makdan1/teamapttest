/// title : "Noom"
/// subtitle : "Gabo Vase"
/// asset : "chair"

class Items {
  Items({
    String? itemId,
    String? title,
      String? subtitle,
    String? description,
    String? asset,
    String? price,

  }){
    _itemId = itemId;
    _title = title;
    _subtitle = subtitle;
    _description = description;
    _asset = asset;
    _price = price;
}

  Items.fromJson(dynamic json) {
    _itemId = json["item_id"];
    _title = json['title'];
    _subtitle = json['subtitle'];
    _description = json["description"];
    _asset = json['asset'];
    _price= json['price'];

  }
  String? _itemId;
  String? _title;
  String? _subtitle;
  String? _description;
  String? _asset;
  String? _price;
Items copyWith({  String? itemId,
  String? title,
  String? subtitle,
  String? description,
  String? asset,
  String? price,
}) => Items(  itemId: itemId ?? _itemId,
  title: title ?? _title,
  subtitle: subtitle ?? _subtitle,
  description: _description,
  asset: asset ?? _asset,
  price: asset ?? _asset,

);
  String? get itemId => _itemId;
  String? get title => _title;
  String? get subtitle => _subtitle;
  String? get description => _description;
  String? get asset => _asset;
  String? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_id'] = _itemId;
    map['title'] = _title;
    map['subtitle'] = _subtitle;
    map["description"]  =_description;
    map['asset'] = _asset;
    map['price'] = _price;
    return map;
  }

}