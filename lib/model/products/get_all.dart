class GetAllModel {
  List<GetAllModelProducts>? products;
  int? total;
  int? skip;
  int? limit;

  GetAllModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  GetAllModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = (json['products'] as List)
          .map((e) => GetAllModelProducts.fromJson(e))
          .toList();
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products?.map((e) => e.toJson()).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }
}

class GetAllModelProducts {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  GetAllModelProducts({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  GetAllModelProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title']?.toString();
    description = json['description']?.toString();
    price = json['price'];
    discountPercentage = json['discountPercentage']?.toDouble();
    rating = json['rating']?.toDouble();
    stock = json['stock'];
    brand = json['brand']?.toString();
    category = json['category']?.toString();
    thumbnail = json['thumbnail']?.toString();
    if (json['images'] != null) {
      images =
          (json['images'] as List).map<String>((e) => e.toString()).toList();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'brand': brand,
      'category': category,
      'thumbnail': thumbnail,
      'images': images,
    };
  }
}
