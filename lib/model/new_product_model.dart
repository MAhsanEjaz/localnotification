class NewProducts {
  List<MyProducts>? products;
  int? total;
  int? skip;
  int? limit;

  NewProducts({this.products, this.total, this.skip, this.limit});

  NewProducts.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <MyProducts>[];
      json['products'].forEach((v) {
        products!.add(new MyProducts.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class MyProducts {
  int? id;
  String? title;
  String? description;
  int? price;
  int qty = 1;

  // double? discountPercentage;
  // double? rating;
  double? totalPrice = 45;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  MyProducts(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.qty = 1,
      // this.discountPercentage,
      // this.rating,
      this.stock,
      this.totalPrice = 45,
      this.brand,
      this.category,
      this.thumbnail,
      this.images});

  MyProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    qty = json['qty'] ?? 1;
    // discountPercentage = json['discountPercentage'];
    // rating = json['rating'];
    stock = json['stock'];
    totalPrice = json['totalPrice'] ?? 45;
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['qty'] = this.qty;
    data['totalPrice'] = this.totalPrice;
    // data['discountPercentage'] = this.discountPercentage;
    // data['rating'] = this.rating;
    data['stock'] = this.stock;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;
    data['images'] = this.images;
    return data;
  }
}
