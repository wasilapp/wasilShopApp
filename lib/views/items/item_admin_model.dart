

class AllCategories {
  int? id;
  Title? title;
  Title? description;
  double? commesion;
  String? imageUrl;
  String? type;
  int? deliveryFee;
  Null? expeditedFees;
  Null? schedulerFees;
  String? startWorkTime;
  String? endWorkTime;
  int? active;
  String? createdAt;
  String? updatedAt;
  List<SubCategories>? subCategories;

  List<SubAdminCategories>? subAdminCategories;

  AllCategories(
      {this.id,
        this.title,
        this.description,
        this.commesion,
        this.imageUrl,
        this.type,
        this.deliveryFee,
        this.expeditedFees,
        this.schedulerFees,
        this.startWorkTime,
        this.endWorkTime,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.subCategories,

        this.subAdminCategories});

  AllCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    description = json['description'] != null
        ? new Title.fromJson(json['description'])
        : null;
    commesion = json['commesion'];
    imageUrl = json['image_url'];
    type = json['type'];
    deliveryFee = json['delivery_fee'];
    expeditedFees = json['expedited_fees'];
    schedulerFees = json['scheduler_fees'];
    startWorkTime = json['start_work_time'];
    endWorkTime = json['end_work_time'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['sub_categories'] != null) {
      subCategories = <SubCategories>[];
      json['sub_categories'].forEach((v) {
        subCategories!.add(new SubCategories.fromJson(v));
      });
    }

    if (json['subAdminCategories'] != null) {
      subAdminCategories = <SubAdminCategories>[];
      json['subAdminCategories'].forEach((v) {
        subAdminCategories!.add(new SubAdminCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['commesion'] = this.commesion;
    data['image_url'] = this.imageUrl;
    data['type'] = this.type;
    data['delivery_fee'] = this.deliveryFee;
    data['expedited_fees'] = this.expeditedFees;
    data['scheduler_fees'] = this.schedulerFees;
    data['start_work_time'] = this.startWorkTime;
    data['end_work_time'] = this.endWorkTime;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.subCategories != null) {
      data['sub_categories'] =
          this.subCategories!.map((v) => v.toJson()).toList();
    }

    if (this.subAdminCategories != null) {
      data['subAdminCategories'] =
          this.subAdminCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Title {
  String? en;
  String? ar;

  Title({this.en, this.ar});

  Title.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['ar'] = this.ar;
    return data;
  }
}

class SubCategories {
  int? id;
  Title? title;
  Title? description;
  double? price;
  int? shopId;
  int? categoryId;
  int? active;
  int? isPrimary;
  String? imageUrl;
  int? isApproval;
  int? quantity;
  String? createdAt;
  String? updatedAt;

  SubCategories(
      {this.id,
        this.title,
        this.description,
        this.price,
        this.shopId,
        this.categoryId,
        this.active,
        this.isPrimary,
        this.imageUrl,
        this.isApproval,
        this.quantity,
        this.createdAt,
        this.updatedAt});

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    description = json['description'] != null
        ? new Title.fromJson(json['description'])
        : null;
    price = json['price'];
    shopId = json['shop_id'];
    categoryId = json['category_id'];
    active = json['active'];
    isPrimary = json['is_primary'];
    imageUrl = json['image_url'];
    isApproval = json['is_approval'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['price'] = this.price;
    data['shop_id'] = this.shopId;
    data['category_id'] = this.categoryId;
    data['active'] = this.active;
    data['is_primary'] = this.isPrimary;
    data['image_url'] = this.imageUrl;
    data['is_approval'] = this.isApproval;
    data['quantity'] = this.quantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class SubAdminCategories {
  int? id;
  Title? title;
  Title? description;
  double? price;
  Null? shopId;
  int? categoryId;
  int? active;
  int? isPrimary;
  String? imageUrl;
  int? isApproval;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  String? status;

  SubAdminCategories(
      {this.id,
        this.title,
        this.description,
        this.price,
        this.shopId,
        this.categoryId,
        this.active,
        this.isPrimary,
        this.imageUrl,
        this.isApproval,
        this.quantity,
        this.createdAt,
        this.updatedAt,
        this.status});

  SubAdminCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    description = json['description'] != null
        ? new Title.fromJson(json['description'])
        : null;
    price = json['price'];
    shopId = json['shop_id'];
    categoryId = json['category_id'];
    active = json['active'];
    isPrimary = json['is_primary'];
    imageUrl = json['image_url'];
    isApproval = json['is_approval'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['price'] = this.price;
    data['shop_id'] = this.shopId;
    data['category_id'] = this.categoryId;
    data['active'] = this.active;
    data['is_primary'] = this.isPrimary;
    data['image_url'] = this.imageUrl;
    data['is_approval'] = this.isApproval;
    data['quantity'] = this.quantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    return data;
  }
}
