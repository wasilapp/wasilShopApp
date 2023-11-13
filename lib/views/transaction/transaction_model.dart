
class ShopDeliveryBoys {
  int? id;
  Name? name;
  Null? agencyName;
  String? carNumber;
  String? email;
  Null? emailVerifiedAt;
  String? password;
  Null? fcmToken;
  dynamic? latitude;
  dynamic? longitude;
  int? isFree;
  int? isOffline;
  int? isActive;
  String? avatarUrl;
  String? mobile;
  int? mobileVerified;
  int? rating;
  int? totalRating;
  int? categoryId;
  int? shopId;
  Null? rememberToken;
  int? isVerified;
  String? drivingLicense;
  Null? carLicense;
  int? isApproval;
  int? distance;
  Null? otp;
  int? totalCapacity;
  int? totalQuantity;
  int? availableQuantity;
  Null? referrer;
  Null? referrerLink;
  String? createdAt;
  String? updatedAt;
  int? orderTotalAmount;
  int? paidAmount;
  int? remainingAmount;
  List<SubCategory>? subCategory;
  Shop? shop;
  Category? category;
  List<Orders>? orders;

  ShopDeliveryBoys({this.id, this.name, this.agencyName, this.carNumber, this.email, this.emailVerifiedAt, this.password, this.fcmToken, this.latitude, this.longitude, this.isFree, this.isOffline, this.isActive, this.avatarUrl, this.mobile, this.mobileVerified, this.rating, this.totalRating, this.categoryId, this.shopId, this.rememberToken, this.isVerified, this.drivingLicense, this.carLicense, this.isApproval, this.distance, this.otp, this.totalCapacity, this.totalQuantity, this.availableQuantity, this.referrer, this.referrerLink, this.createdAt, this.updatedAt, this.orderTotalAmount, this.paidAmount, this.remainingAmount, this.subCategory, this.shop, this.category, this.orders});

  ShopDeliveryBoys.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    agencyName = json['agency_name'];
    carNumber = json['car_number'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    fcmToken = json['fcm_token'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isFree = json['is_free'];
    isOffline = json['is_offline'];
    isActive = json['is_active'];
    avatarUrl = json['avatar_url'];
    mobile = json['mobile'];
    mobileVerified = json['mobile_verified'];
    rating = json['rating'];
    totalRating = json['total_rating'];
    categoryId = json['category_id'];
    shopId = json['shop_id'];
    rememberToken = json['remember_token'];
    isVerified = json['is_verified'];
    drivingLicense = json['driving_license'];
    carLicense = json['car_license'];
    isApproval = json['is_approval'];
    distance = json['distance'];
    otp = json['otp'];
    totalCapacity = json['total_capacity'];
    totalQuantity = json['total_quantity'];
    availableQuantity = json['available_quantity'];
    referrer = json['referrer'];
    referrerLink = json['referrer_link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    orderTotalAmount = json['order_total_amount'];
    paidAmount = json['paid_amount'];
    remainingAmount = json['remaining_amount'];
    if (json['sub_category'] != null) {
      subCategory = <SubCategory>[];
      json['sub_category'].forEach((v) { subCategory!.add(new SubCategory.fromJson(v)); });
    }
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
    category = json['category'] != null ? new Category.fromJson(json['category']) : null;
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) { orders!.add(new Orders.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['agency_name'] = this.agencyName;
    data['car_number'] = this.carNumber;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['fcm_token'] = this.fcmToken;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['is_free'] = this.isFree;
    data['is_offline'] = this.isOffline;
    data['is_active'] = this.isActive;
    data['avatar_url'] = this.avatarUrl;
    data['mobile'] = this.mobile;
    data['mobile_verified'] = this.mobileVerified;
    data['rating'] = this.rating;
    data['total_rating'] = this.totalRating;
    data['category_id'] = this.categoryId;
    data['shop_id'] = this.shopId;
    data['remember_token'] = this.rememberToken;
    data['is_verified'] = this.isVerified;
    data['driving_license'] = this.drivingLicense;
    data['car_license'] = this.carLicense;
    data['is_approval'] = this.isApproval;
    data['distance'] = this.distance;
    data['otp'] = this.otp;
    data['total_capacity'] = this.totalCapacity;
    data['total_quantity'] = this.totalQuantity;
    data['available_quantity'] = this.availableQuantity;
    data['referrer'] = this.referrer;
    data['referrer_link'] = this.referrerLink;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['order_total_amount'] = this.orderTotalAmount;
    data['paid_amount'] = this.paidAmount;
    data['remaining_amount'] = this.remainingAmount;
    if (this.subCategory != null) {
      data['sub_category'] = this.subCategory!.map((v) => v.toJson()).toList();
    }
    if (this.shop != null) {
      data['shop'] = this.shop!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Name {
  String? en;
  String? ar;

  Name({this.en, this.ar});

  Name.fromJson(Map<String, dynamic> json) {
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

class SubCategory {
  int? id;
  Name? title;
  Name? description;
  dynamic? price;
  int? shopId;
  int? categoryId;
  int? active;
  int? isPrimary;
  String? imageUrl;
  int? isApproval;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  Details? details;

  SubCategory({this.id, this.title, this.description, this.price, this.shopId, this.categoryId, this.active, this.isPrimary, this.imageUrl, this.isApproval, this.quantity, this.createdAt, this.updatedAt, this.details});

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Name.fromJson(json['title']) : null;
    description = json['description'] != null ? new Name.fromJson(json['description']) : null;
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
    details = json['details'] != null ? new Details.fromJson(json['details']) : null;
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
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}

class Details {
  int? deliveryBoyId;
  int? subCategoryId;
  String? price;
  String? totalQuantity;
  String? availableQuantity;

  Details({this.deliveryBoyId, this.subCategoryId, this.price, this.totalQuantity, this.availableQuantity});

  Details.fromJson(Map<String, dynamic> json) {
    deliveryBoyId = json['delivery_boy_id'];
    subCategoryId = json['sub_category_id'];
    price = json['price'];
    totalQuantity = json['total_quantity'];
    availableQuantity = json['available_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivery_boy_id'] = this.deliveryBoyId;
    data['sub_category_id'] = this.subCategoryId;
    data['price'] = this.price;
    data['total_quantity'] = this.totalQuantity;
    data['available_quantity'] = this.availableQuantity;
    return data;
  }
}

class Shop {
  int? id;
  Name? name;
  Null? email;
  Null? mobile;
  String? barcode;
  dynamic? latitude;
  dynamic? longitude;
  String? address;
  Null? imageUrl;
  int? rating;
  int? deliveryRange;
  int? totalRating;
  int? defaultTax;
  int? availableForDelivery;
  int? open;
  int? managerId;
  int? categoryId;
  int? distance;
  String? createdAt;
  String? updatedAt;

  Shop({this.id, this.name, this.email, this.mobile, this.barcode, this.latitude, this.longitude, this.address, this.imageUrl, this.rating, this.deliveryRange, this.totalRating, this.defaultTax, this.availableForDelivery, this.open, this.managerId, this.categoryId, this.distance, this.createdAt, this.updatedAt});

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    email = json['email'];
    mobile = json['mobile'];
    barcode = json['barcode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    imageUrl = json['image_url'];
    rating = json['rating'];
    deliveryRange = json['delivery_range'];
    totalRating = json['total_rating'];
    defaultTax = json['default_tax'];
    availableForDelivery = json['available_for_delivery'];
    open = json['open'];
    managerId = json['manager_id'];
    categoryId = json['category_id'];
    distance = json['distance'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['barcode'] = this.barcode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['image_url'] = this.imageUrl;
    data['rating'] = this.rating;
    data['delivery_range'] = this.deliveryRange;
    data['total_rating'] = this.totalRating;
    data['default_tax'] = this.defaultTax;
    data['available_for_delivery'] = this.availableForDelivery;
    data['open'] = this.open;
    data['manager_id'] = this.managerId;
    data['category_id'] = this.categoryId;
    data['distance'] = this.distance;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Category {
  int? id;
  Name? title;
  Name? description;
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

  Category({this.id, this.title, this.description, this.commesion, this.imageUrl, this.type, this.deliveryFee, this.expeditedFees, this.schedulerFees, this.startWorkTime, this.endWorkTime, this.active, this.createdAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Name.fromJson(json['title']) : null;
    description = json['description'] != null ? new Name.fromJson(json['description']) : null;
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
    return data;
  }
}

class Orders {
  int? id;
  int? status;
  int? categoryId;
  int? order;
  int? shopRevenue;
  Null? adminRevenue;
  int? deliveryFee;
  int? total;
  int? otp;
  Null? couponDiscount;
  dynamic? latitude;
  dynamic? longitude;
  Null? couponId;
  int? deliveryBoyId;
  int? userId;
  int? addressId;
  int? shopId;
  int? orderPaymentId;
  String? orderType;
  int? count;
  int? type;
  int? isNotification;
  int? isPaid;
  int? isWallet;
  Null? walletId;
  Null? expeditedFees;
  Null? cancellationReason;
  String? createdAt;
  String? updatedAt;
  User? user;
  List<Carts>? carts;
  Null? coupon;
  OrderTime? orderTime;
  OrderPayment? orderPayment;

  Orders({this.id, this.status, this.categoryId, this.order, this.shopRevenue, this.adminRevenue, this.deliveryFee, this.total, this.otp, this.couponDiscount, this.latitude, this.longitude, this.couponId, this.deliveryBoyId, this.userId, this.addressId, this.shopId, this.orderPaymentId, this.orderType, this.count, this.type, this.isNotification, this.isPaid, this.isWallet, this.walletId, this.expeditedFees, this.cancellationReason, this.createdAt, this.updatedAt, this.user, this.carts, this.coupon, this.orderTime, this.orderPayment});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    categoryId = json['category_id'];
    order = json['order'];
    shopRevenue = json['shop_revenue'];
    adminRevenue = json['admin_revenue'];
    deliveryFee = json['delivery_fee'];
    total = json['total'];
    otp = json['otp'];
    couponDiscount = json['coupon_discount'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    couponId = json['coupon_id'];
    deliveryBoyId = json['delivery_boy_id'];
    userId = json['user_id'];
    addressId = json['address_id'];
    shopId = json['shop_id'];
    orderPaymentId = json['order_payment_id'];
    orderType = json['order_type'];
    count = json['count'];
    type = json['type'];
    isNotification = json['is_notification'];
    isPaid = json['is_paid'];
    isWallet = json['is_wallet'];
    walletId = json['wallet_id'];
    expeditedFees = json['expedited_fees'];
    cancellationReason = json['cancellation_reason'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['carts'] != null) {
      carts = <Carts>[];
      json['carts'].forEach((v) { carts!.add(new Carts.fromJson(v)); });
    }
    coupon = json['coupon'];
    orderTime = json['order_time'] != null ? new OrderTime.fromJson(json['order_time']) : null;
    orderPayment = json['order_payment'] != null ? new OrderPayment.fromJson(json['order_payment']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['category_id'] = this.categoryId;
    data['order'] = this.order;
    data['shop_revenue'] = this.shopRevenue;
    data['admin_revenue'] = this.adminRevenue;
    data['delivery_fee'] = this.deliveryFee;
    data['total'] = this.total;
    data['otp'] = this.otp;
    data['coupon_discount'] = this.couponDiscount;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['coupon_id'] = this.couponId;
    data['delivery_boy_id'] = this.deliveryBoyId;
    data['user_id'] = this.userId;
    data['address_id'] = this.addressId;
    data['shop_id'] = this.shopId;
    data['order_payment_id'] = this.orderPaymentId;
    data['order_type'] = this.orderType;
    data['count'] = this.count;
    data['type'] = this.type;
    data['is_notification'] = this.isNotification;
    data['is_paid'] = this.isPaid;
    data['is_wallet'] = this.isWallet;
    data['wallet_id'] = this.walletId;
    data['expedited_fees'] = this.expeditedFees;
    data['cancellation_reason'] = this.cancellationReason;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.carts != null) {
      data['carts'] = this.carts!.map((v) => v.toJson()).toList();
    }
    data['coupon'] = this.coupon;
    if (this.orderTime != null) {
      data['order_time'] = this.orderTime!.toJson();
    }
    if (this.orderPayment != null) {
      data['order_payment'] = this.orderPayment!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? mobile;
  int? mobileVerified;
  String? fcmToken;
  Null? avatarUrl;
  int? blocked;
  int? accountType;
  int? defaultt;
  String? referrer;
  Null? referrerLink;
  Null? otp;
  Null? otpExpiration;
  String? createdAt;
  String? updatedAt;

  User({this.id, this.name, this.email, this.emailVerifiedAt, this.mobile, this.mobileVerified, this.fcmToken, this.avatarUrl, this.blocked, this.accountType, this.defaultt, this.referrer, this.referrerLink, this.otp, this.otpExpiration, this.createdAt, this.updatedAt});

User.fromJson(Map<String, dynamic> json) {
id = json['id'];
name = json['name'];
email = json['email'];
emailVerifiedAt = json['email_verified_at'];
mobile = json['mobile'];
mobileVerified = json['mobile_verified'];
fcmToken = json['fcm_token'];
avatarUrl = json['avatar_url'];
blocked = json['blocked'];
accountType = json['account_type'];
defaultt = json['default'];
referrer = json['referrer'];
referrerLink = json['referrer_link'];
otp = json['otp'];
otpExpiration = json['otp_expiration'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['name'] = this.name;
data['email'] = this.email;
data['email_verified_at'] = this.emailVerifiedAt;
data['mobile'] = this.mobile;
data['mobile_verified'] = this.mobileVerified;
data['fcm_token'] = this.fcmToken;
data['avatar_url'] = this.avatarUrl;
data['blocked'] = this.blocked;
data['account_type'] = this.accountType;
data['default'] = this.defaultt;
data['referrer'] = this.referrer;
data['referrer_link'] = this.referrerLink;
data['otp'] = this.otp;
data['otp_expiration'] = this.otpExpiration;
data['created_at'] = this.createdAt;
data['updated_at'] = this.updatedAt;
return data;
}
}

class Carts {
int? id;
int? orderId;
int? subCategoriesId;
int? quantity;
int? price;
int? total;
String? createdAt;
String? updatedAt;

Carts({this.id, this.orderId, this.subCategoriesId, this.quantity, this.price, this.total, this.createdAt, this.updatedAt});

Carts.fromJson(Map<String, dynamic> json) {
id = json['id'];
orderId = json['order_id'];
subCategoriesId = json['sub_categories_id'];
quantity = json['quantity'];
price = json['price'];
total = json['total'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['order_id'] = this.orderId;
data['sub_categories_id'] = this.subCategoriesId;
data['quantity'] = this.quantity;
data['price'] = this.price;
data['total'] = this.total;
data['created_at'] = this.createdAt;
data['updated_at'] = this.updatedAt;
return data;
}
}

class OrderTime {
int? id;
String? orderDate;
String? orderTimeFrom;
String? orderTimeTo;
int? orderId;
String? createdAt;
String? updatedAt;

OrderTime({this.id, this.orderDate, this.orderTimeFrom, this.orderTimeTo, this.orderId, this.createdAt, this.updatedAt});

OrderTime.fromJson(Map<String, dynamic> json) {
id = json['id'];
orderDate = json['order_date'];
orderTimeFrom = json['order_time_from'];
orderTimeTo = json['order_time_to'];
orderId = json['order_id'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['order_date'] = this.orderDate;
data['order_time_from'] = this.orderTimeFrom;
data['order_time_to'] = this.orderTimeTo;
data['order_id'] = this.orderId;
data['created_at'] = this.createdAt;
data['updated_at'] = this.updatedAt;
return data;
}
}

class OrderPayment {
int? id;
int? paymentType;
int? success;
Null? paymentId;
String? createdAt;
String? updatedAt;

OrderPayment({this.id, this.paymentType, this.success, this.paymentId, this.createdAt, this.updatedAt});

OrderPayment.fromJson(Map<String, dynamic> json) {
id = json['id'];
paymentType = json['payment_type'];
success = json['success'];
paymentId = json['payment_id'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['payment_type'] = this.paymentType;
data['success'] = this.success;
data['payment_id'] = this.paymentId;
data['created_at'] = this.createdAt;
data['updated_at'] = this.updatedAt;
return data;
}
}



class DriverOneTransaction {
  int? id;
  Name? name;
  Null? agencyName;
  String? carNumber;
  String? email;
  Null? emailVerifiedAt;
  String? password;
  Null? fcmToken;
  Null? latitude;
  Null? longitude;
  int? isFree;
  int? isOffline;
  int? isActive;
  String? avatarUrl;
  String? mobile;
  int? mobileVerified;
  int? rating;
  int? totalRating;
  int? categoryId;
  int? shopId;
  Null? rememberToken;
  int? isVerified;
  String? drivingLicense;
  Null? carLicense;
  int? isApproval;
  int? distance;
  Null? otp;
  int? totalCapacity;
  int? totalQuantity;
  int? availableQuantity;
  Null? referrer;
  Null? referrerLink;
  String? createdAt;
  String? updatedAt;
  int? ordersTotal;
  // List<Null>? orders;

  DriverOneTransaction(
      {this.id,
        this.name,
        this.agencyName,
        this.carNumber,
        this.email,
        this.emailVerifiedAt,
        this.password,
        this.fcmToken,
        this.latitude,
        this.longitude,
        this.isFree,
        this.isOffline,
        this.isActive,
        this.avatarUrl,
        this.mobile,
        this.mobileVerified,
        this.rating,
        this.totalRating,
        this.categoryId,
        this.shopId,
        this.rememberToken,
        this.isVerified,
        this.drivingLicense,
        this.carLicense,
        this.isApproval,
        this.distance,
        this.otp,
        this.totalCapacity,
        this.totalQuantity,
        this.availableQuantity,
        this.referrer,
        this.referrerLink,
        this.createdAt,
        this.updatedAt,
        this.ordersTotal,
        //this.orders
      });

  DriverOneTransaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    agencyName = json['agency_name'];
    carNumber = json['car_number'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    fcmToken = json['fcm_token'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isFree = json['is_free'];
    isOffline = json['is_offline'];
    isActive = json['is_active'];
    avatarUrl = json['avatar_url'];
    mobile = json['mobile'];
    mobileVerified = json['mobile_verified'];
    rating = json['rating'];
    totalRating = json['total_rating'];
    categoryId = json['category_id'];
    shopId = json['shop_id'];
    rememberToken = json['remember_token'];
    isVerified = json['is_verified'];
    drivingLicense = json['driving_license'];
    carLicense = json['car_license'];
    isApproval = json['is_approval'];
    distance = json['distance'];
    otp = json['otp'];
    totalCapacity = json['total_capacity'];
    totalQuantity = json['total_quantity'];
    availableQuantity = json['available_quantity'];
    referrer = json['referrer'];
    referrerLink = json['referrer_link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    ordersTotal = json['orders_total'];
    // if (json['orders'] != null) {
    //   orders = <Null>[];
    //   json['orders'].forEach((v) {
    //     orders!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['agency_name'] = this.agencyName;
    data['car_number'] = this.carNumber;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['fcm_token'] = this.fcmToken;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['is_free'] = this.isFree;
    data['is_offline'] = this.isOffline;
    data['is_active'] = this.isActive;
    data['avatar_url'] = this.avatarUrl;
    data['mobile'] = this.mobile;
    data['mobile_verified'] = this.mobileVerified;
    data['rating'] = this.rating;
    data['total_rating'] = this.totalRating;
    data['category_id'] = this.categoryId;
    data['shop_id'] = this.shopId;
    data['remember_token'] = this.rememberToken;
    data['is_verified'] = this.isVerified;
    data['driving_license'] = this.drivingLicense;
    data['car_license'] = this.carLicense;
    data['is_approval'] = this.isApproval;
    data['distance'] = this.distance;
    data['otp'] = this.otp;
    data['total_capacity'] = this.totalCapacity;
    data['total_quantity'] = this.totalQuantity;
    data['available_quantity'] = this.availableQuantity;
    data['referrer'] = this.referrer;
    data['referrer_link'] = this.referrerLink;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['orders_total'] = this.ordersTotal;
    // if (this.orders != null) {
    //   data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}



