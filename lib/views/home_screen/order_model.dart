//
//
// class Orders {
//   int? id;
//   int? status;
//   int? categoryId;
//   int? order;
//   int? shopRevenue;
//   Null? adminRevenue;
//   int? deliveryFee;
//   double? total;
//   int? otp;
//   Null? couponDiscount;
//   int? latitude;
//   int? longitude;
//   Null? couponId;
//   int? deliveryBoyId;
//   int? userId;
//   int? addressId;
//   int? shopId;
//   int? orderPaymentId;
//   String? orderType;
//   int? count;
//   int? type;
//   int? isNotification;
//   int? isPaid;
//   int? isWallet;
//   int? walletId;
//   Null? expeditedFees;
//   String? createdAt;
//   String? updatedAt;
//   String? shopEmail;
//   String? shopPassword;
//   String? shopMobile;
//   Null? shopAddress;
//   String? shopAvatarUrl;
//   String? shopLicense;
//   int? shopIsApproval;
//   String? orderDateTime;
//   Statu? statu;
//   List<Carts>? carts;
//   Shop? shop;
//   User? user;
//   Null? coupon;
//   Address? address;
//   Null? deliveryBoy;
//   OrderPayment? orderPayment;
//   OrderTime? orderTime;
//
//   Orders({this.id, this.status, this.categoryId, this.order, this.shopRevenue, this.adminRevenue, this.deliveryFee, this.total, this.otp, this.couponDiscount, this.latitude, this.longitude, this.couponId, this.deliveryBoyId, this.userId, this.addressId, this.shopId, this.orderPaymentId, this.orderType, this.count, this.type, this.isNotification, this.isPaid, this.isWallet, this.walletId, this.expeditedFees, this.createdAt, this.updatedAt, this.shopEmail, this.shopPassword, this.shopMobile, this.shopAddress, this.shopAvatarUrl, this.shopLicense, this.shopIsApproval, this.orderDateTime, this.statu, this.carts, this.shop, this.user, this.coupon, this.address, this.deliveryBoy, this.orderPayment, this.orderTime});
//
//   Orders.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     status = json['status'];
//     categoryId = json['category_id'];
//     order = json['order'];
//     shopRevenue = json['shop_revenue'];
//     adminRevenue = json['admin_revenue'];
//     deliveryFee = json['delivery_fee'];
//     total = json['total'];
//     otp = json['otp'];
//     couponDiscount = json['coupon_discount'];
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     couponId = json['coupon_id'];
//     deliveryBoyId = json['delivery_boy_id'];
//     userId = json['user_id'];
//     addressId = json['address_id'];
//     shopId = json['shop_id'];
//     orderPaymentId = json['order_payment_id'];
//     orderType = json['order_type'];
//     count = json['count'];
//     type = json['type'];
//     isNotification = json['is_notification'];
//     isPaid = json['is_paid'];
//     isWallet = json['is_wallet'];
//     walletId = json['wallet_id'];
//     expeditedFees = json['expedited_fees'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     shopEmail = json['shop_email'];
//     shopPassword = json['shop_password'];
//     shopMobile = json['shop_mobile'];
//     shopAddress = json['shop_address'];
//     shopAvatarUrl = json['shop_avatar_url'];
//     shopLicense = json['shop_license'];
//     shopIsApproval = json['shop_is_approval'];
//     orderDateTime = json['order_date_time'];
//     statu = json['statu'] != null ? new Statu.fromJson(json['statu']) : null;
//     if (json['carts'] != null) {
//       carts = <Carts>[];
//       json['carts'].forEach((v) { carts!.add(new Carts.fromJson(v)); });
//     }
//     shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//     coupon = json['coupon'];
//     address = json['address'] != null ? new Address.fromJson(json['address']) : null;
//     deliveryBoy = json['delivery_boy'];
//     orderPayment = json['order_payment'] != null ? new OrderPayment.fromJson(json['order_payment']) : null;
//     orderTime = json['order_time'] != null ? new OrderTime.fromJson(json['order_time']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['status'] = this.status;
//     data['category_id'] = this.categoryId;
//     data['order'] = this.order;
//     data['shop_revenue'] = this.shopRevenue;
//     data['admin_revenue'] = this.adminRevenue;
//     data['delivery_fee'] = this.deliveryFee;
//     data['total'] = this.total;
//     data['otp'] = this.otp;
//     data['coupon_discount'] = this.couponDiscount;
//     data['latitude'] = this.latitude;
//     data['longitude'] = this.longitude;
//     data['coupon_id'] = this.couponId;
//     data['delivery_boy_id'] = this.deliveryBoyId;
//     data['user_id'] = this.userId;
//     data['address_id'] = this.addressId;
//     data['shop_id'] = this.shopId;
//     data['order_payment_id'] = this.orderPaymentId;
//     data['order_type'] = this.orderType;
//     data['count'] = this.count;
//     data['type'] = this.type;
//     data['is_notification'] = this.isNotification;
//     data['is_paid'] = this.isPaid;
//     data['is_wallet'] = this.isWallet;
//     data['wallet_id'] = this.walletId;
//     data['expedited_fees'] = this.expeditedFees;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['shop_email'] = this.shopEmail;
//     data['shop_password'] = this.shopPassword;
//     data['shop_mobile'] = this.shopMobile;
//     data['shop_address'] = this.shopAddress;
//     data['shop_avatar_url'] = this.shopAvatarUrl;
//     data['shop_license'] = this.shopLicense;
//     data['shop_is_approval'] = this.shopIsApproval;
//     data['order_date_time'] = this.orderDateTime;
//     if (this.statu != null) {
//       data['statu'] = this.statu!.toJson();
//     }
//     if (this.carts != null) {
//       data['carts'] = this.carts!.map((v) => v.toJson()).toList();
//     }
//     if (this.shop != null) {
//       data['shop'] = this.shop!.toJson();
//     }
//     if (this.user != null) {
//       data['user'] = this.user!.toJson();
//     }
//     data['coupon'] = this.coupon;
//     if (this.address != null) {
//       data['address'] = this.address!.toJson();
//     }
//     data['delivery_boy'] = this.deliveryBoy;
//     if (this.orderPayment != null) {
//       data['order_payment'] = this.orderPayment!.toJson();
//     }
//     if (this.orderTime != null) {
//       data['order_time'] = this.orderTime!.toJson();
//     }
//     return data;
//   }
// }
//
// class Statu {
//   int? id;
//   Title? title;
//
//   Statu({this.id, this.title});
//
//   Statu.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'] != null ? new Title.fromJson(json['title']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     if (this.title != null) {
//       data['title'] = this.title!.toJson();
//     }
//     return data;
//   }
// }
//
// class Title {
//   String? en;
//   String? ar;
//
//   Title({this.en, this.ar});
//
//   Title.fromJson(Map<String, dynamic> json) {
//     en = json['en'];
//     ar = json['ar'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['en'] = this.en;
//     data['ar'] = this.ar;
//     return data;
//   }
// }
//
// class Carts {
//   int? id;
//   int? orderId;
//   int? subCategoriesId;
//   int? quantity;
//   int? price;
//   int? total;
//   String? createdAt;
//   String? updatedAt;
//
//   Carts({this.id, this.orderId, this.subCategoriesId, this.quantity, this.price, this.total, this.createdAt, this.updatedAt});
//
//   Carts.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     orderId = json['order_id'];
//     subCategoriesId = json['sub_categories_id'];
//     quantity = json['quantity'];
//     price = json['price'];
//     total = json['total'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['order_id'] = this.orderId;
//     data['sub_categories_id'] = this.subCategoriesId;
//     data['quantity'] = this.quantity;
//     data['price'] = this.price;
//     data['total'] = this.total;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
//
// class Shop {
//   int? id;
//   Title? name;
//   Null? email;
//   Null? mobile;
//   String? barcode;
//   int? latitude;
//   int? longitude;
//   String? address;
//   Null? imageUrl;
//   int? rating;
//   int? deliveryRange;
//   int? totalRating;
//   int? defaultTax;
//   int? availableForDelivery;
//   int? open;
//   int? managerId;
//   int? categoryId;
//   int? distance;
//   String? createdAt;
//   String? updatedAt;
//
//   Shop({this.id, this.name, this.email, this.mobile, this.barcode, this.latitude, this.longitude, this.address, this.imageUrl, this.rating, this.deliveryRange, this.totalRating, this.defaultTax, this.availableForDelivery, this.open, this.managerId, this.categoryId, this.distance, this.createdAt, this.updatedAt});
//
//   Shop.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'] != null ? new Title.fromJson(json['name']) : null;
//     email = json['email'];
//     mobile = json['mobile'];
//     barcode = json['barcode'];
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     address = json['address'];
//     imageUrl = json['image_url'];
//     rating = json['rating'];
//     deliveryRange = json['delivery_range'];
//     totalRating = json['total_rating'];
//     defaultTax = json['default_tax'];
//     availableForDelivery = json['available_for_delivery'];
//     open = json['open'];
//     managerId = json['manager_id'];
//     categoryId = json['category_id'];
//     distance = json['distance'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     if (this.name != null) {
//       data['name'] = this.name!.toJson();
//     }
//     data['email'] = this.email;
//     data['mobile'] = this.mobile;
//     data['barcode'] = this.barcode;
//     data['latitude'] = this.latitude;
//     data['longitude'] = this.longitude;
//     data['address'] = this.address;
//     data['image_url'] = this.imageUrl;
//     data['rating'] = this.rating;
//     data['delivery_range'] = this.deliveryRange;
//     data['total_rating'] = this.totalRating;
//     data['default_tax'] = this.defaultTax;
//     data['available_for_delivery'] = this.availableForDelivery;
//     data['open'] = this.open;
//     data['manager_id'] = this.managerId;
//     data['category_id'] = this.categoryId;
//     data['distance'] = this.distance;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
//
// class User {
//   int? id;
//   String? name;
//   String? email;
//   Null? emailVerifiedAt;
//   String? mobile;
//   int? mobileVerified;
//   Null? fcmToken;
//   Null? avatarUrl;
//   int? blocked;
//   int? accountType;
//   int? defaultt;
//   String? referrer;
//   Null? referrerLink;
//   Null? otp;
//   Null? otpExpiration;
//   String? createdAt;
//   String? updatedAt;
//
//   User({this.id, this.name, this.email, this.emailVerifiedAt, this.mobile, this.mobileVerified, this.fcmToken, this.avatarUrl, this.blocked, this.accountType, this.defaultt, this.referrer, this.referrerLink, this.otp, this.otpExpiration, this.createdAt, this.updatedAt});
//
//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     emailVerifiedAt = json['email_verified_at'];
//     mobile = json['mobile'];
//     mobileVerified = json['mobile_verified'];
//     fcmToken = json['fcm_token'];
//     avatarUrl = json['avatar_url'];
//     blocked = json['blocked'];
//     accountType = json['account_type'];
//     defaultt = json['default'];
//     referrer = json['referrer'];
//     referrerLink = json['referrer_link'];
//     otp = json['otp'];
//     otpExpiration = json['otp_expiration'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['email_verified_at'] = this.emailVerifiedAt;
//     data['mobile'] = this.mobile;
//     data['mobile_verified'] = this.mobileVerified;
//     data['fcm_token'] = this.fcmToken;
//     data['avatar_url'] = this.avatarUrl;
//     data['blocked'] = this.blocked;
//     data['account_type'] = this.accountType;
//     data['default'] = this.defaultt;
//     data['referrer'] = this.referrer;
//     data['referrer_link'] = this.referrerLink;
//     data['otp'] = this.otp;
//     data['otp_expiration'] = this.otpExpiration;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
//
// class Address {
//   int? id;
//   String? longitude;
//   String? latitude;
//   int? distance;
//   String? name;
//   String? street;
//   Null? buildingNumber;
//   String? city;
//   int? defaultt;
//   int? apartmentNum;
//   int? active;
//   int? type;
//   int? userId;
//   String? createdAt;
//   String? updatedAt;
//
//   Address({this.id, this.longitude, this.latitude, this.distance, this.name, this.street, this.buildingNumber, this.city, this.defaultt, this.apartmentNum, this.active, this.type, this.userId, this.createdAt, this.updatedAt});
//
//   Address.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     longitude = json['longitude'];
//     latitude = json['latitude'];
//     distance = json['distance'];
//     name = json['name'];
//     street = json['street'];
//     buildingNumber = json['building_number'];
//     city = json['city'];
//     defaultt = json['default'];
//     apartmentNum = json['apartment_num'];
//     active = json['active'];
//     type = json['type'];
//     userId = json['user_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['longitude'] = this.longitude;
//     data['latitude'] = this.latitude;
//     data['distance'] = this.distance;
//     data['name'] = this.name;
//     data['street'] = this.street;
//     data['building_number'] = this.buildingNumber;
//     data['city'] = this.city;
//     data['default'] = this.defaultt;
//     data['apartment_num'] = this.apartmentNum;
//     data['active'] = this.active;
//     data['type'] = this.type;
//     data['user_id'] = this.userId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
//
// class OrderPayment {
//   int? id;
//   int? paymentType;
//   int? success;
//   Null? paymentId;
//   String? createdAt;
//   String? updatedAt;
//
//   OrderPayment({this.id, this.paymentType, this.success, this.paymentId, this.createdAt, this.updatedAt});
//
//   OrderPayment.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     paymentType = json['payment_type'];
//     success = json['success'];
//     paymentId = json['payment_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['payment_type'] = this.paymentType;
//     data['success'] = this.success;
//     data['payment_id'] = this.paymentId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
//
// class OrderTime {
//   int? id;
//   String? orderDate;
//   String? orderTimeFrom;
//   String? orderTimeTo;
//   int? orderId;
//   String? createdAt;
//   String? updatedAt;
//
//   OrderTime({this.id, this.orderDate, this.orderTimeFrom, this.orderTimeTo, this.orderId, this.createdAt, this.updatedAt});
//
//   OrderTime.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     orderDate = json['order_date'];
//     orderTimeFrom = json['order_time_from'];
//     orderTimeTo = json['order_time_to'];
//     orderId = json['order_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['order_date'] = this.orderDate;
//     data['order_time_from'] = this.orderTimeFrom;
//     data['order_time_to'] = this.orderTimeTo;
//     data['order_id'] = this.orderId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
//
//


class Orders {
  int? id;
  int? status;
  int? categoryId;
  int? order;
  int? shopRevenue;
  double? adminRevenue;
  int? deliveryFee;
  dynamic? total;
  int? otp;
  String? couponDiscount;
  dynamic? latitude;
  dynamic? longitude;
  int? couponId;
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
  int? walletId;
  double? expeditedFees;
  String? createdAt;
  String? updatedAt;
  String? shopEmail;
  String? shopMobile;
  String ?shopAddress;
  String? shopAvatarUrl;
  String? shopLicense;
  int? shopIsApproval;
  String? orderDateTime;
  Statu? statu;
  List<Carts>? carts;
  Shop? shop;
  User? user;
  String ?coupon;
  Address? address;
  DeliveryBoy? deliveryBoy;
  OrderPayment? orderPayment;
  OrderTime? orderTime;

  Orders({this.id, this.status, this.categoryId, this.order, this.shopRevenue, this.adminRevenue, this.deliveryFee, this.total, this.otp, this.couponDiscount, this.latitude, this.longitude, this.couponId, this.deliveryBoyId, this.userId, this.addressId, this.shopId, this.orderPaymentId, this.orderType, this.count, this.type, this.isNotification, this.isPaid, this.isWallet, this.walletId, this.expeditedFees, this.createdAt, this.updatedAt, this.shopEmail, this.shopMobile, this.shopAddress, this.shopAvatarUrl, this.shopLicense, this.shopIsApproval, this.orderDateTime, this.statu, this.carts, this.shop, this.user, this.coupon, this.address, this.deliveryBoy, this.orderPayment, this.orderTime});

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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shopEmail = json['shop_email'];
    shopMobile = json['shop_mobile'];
    shopAddress = json['shop_address'];
    shopAvatarUrl = json['shop_avatar_url'];
    shopLicense = json['shop_license'];
    shopIsApproval = json['shop_is_approval'];
    orderDateTime = json['order_date_time'];
    statu = json['statu'] != null ? Statu.fromJson(json['statu']) : null;
    if (json['carts'] != null) {
      carts = <Carts>[];
      json['carts'].forEach((v) { carts!.add(Carts.fromJson(v)); });
    }
    shop = json['shop'] != null ? Shop.fromJson(json['shop']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    coupon = json['coupon'];
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    deliveryBoy = json['delivery_boy'] != null ? DeliveryBoy.fromJson(json['delivery_boy']) : null;
    orderPayment = json['order_payment'] != null ? OrderPayment.fromJson(json['order_payment']) : null;
    orderTime = json['order_time'] != null ? OrderTime.fromJson(json['order_time']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['category_id'] = categoryId;
    data['order'] = order;
    data['shop_revenue'] = shopRevenue;
    data['admin_revenue'] = adminRevenue;
    data['delivery_fee'] = deliveryFee;
    data['total'] = total;
    data['otp'] = otp;
    data['coupon_discount'] = couponDiscount;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['coupon_id'] = couponId;
    data['delivery_boy_id'] = deliveryBoyId;
    data['user_id'] = userId;
    data['address_id'] = addressId;
    data['shop_id'] = shopId;
    data['order_payment_id'] = orderPaymentId;
    data['order_type'] = orderType;
    data['count'] = count;
    data['type'] = type;
    data['is_notification'] = isNotification;
    data['is_paid'] = isPaid;
    data['is_wallet'] = isWallet;
    data['wallet_id'] = walletId;
    data['expedited_fees'] = expeditedFees;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['shop_email'] = shopEmail;
    data['shop_mobile'] = shopMobile;
    data['shop_address'] = shopAddress;
    data['shop_avatar_url'] = shopAvatarUrl;
    data['shop_license'] = shopLicense;
    data['shop_is_approval'] = shopIsApproval;
    data['order_date_time'] = orderDateTime;
    if (statu != null) {
      data['statu'] = statu!.toJson();
    }
    if (carts != null) {
      data['carts'] = carts!.map((v) => v.toJson()).toList();
    }
    if (shop != null) {
      data['shop'] = shop!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['coupon'] = coupon;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (deliveryBoy != null) {
      data['delivery_boy'] = deliveryBoy!.toJson();
    }
    if (orderPayment != null) {
      data['order_payment'] = orderPayment!.toJson();
    }
    if (orderTime != null) {
      data['order_time'] = orderTime!.toJson();
    }
    return data;
  }
}

class Statu {
  int? id;
  Title? title;

  Statu({this.id, this.title});

  Statu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (title != null) {
      data['title'] = title!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    data['ar'] = ar;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['sub_categories_id'] = subCategoriesId;
    data['quantity'] = quantity;
    data['price'] = price;
    data['total'] = total;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Shop {
  int? id;
  Title? name;
  String? email;
  String? mobile;
  String? barcode;
  dynamic? latitude;
  dynamic? longitude;
  String? address;
  String? imageUrl;
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
    name = json['name'] != null ? Title.fromJson(json['name']) : null;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['email'] = email;
    data['mobile'] = mobile;
    data['barcode'] = barcode;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['address'] = address;
    data['image_url'] = imageUrl;
    data['rating'] = rating;
    data['delivery_range'] = deliveryRange;
    data['total_rating'] = totalRating;
    data['default_tax'] = defaultTax;
    data['available_for_delivery'] = availableForDelivery;
    data['open'] = open;
    data['manager_id'] = managerId;
    data['category_id'] = categoryId;
    data['distance'] = distance;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  int ?emailVerifiedAt;
  String? mobile;
  int? mobileVerified;
  String ?fcmToken;
  String? avatarUrl;
  int? blocked;
  int? accountType;
  int? defaultt;
  String? referrer;
  String ? referrerLink;
  int? otp;
  String? otpExpiration;
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
final Map<String, dynamic> data = <String, dynamic>{};
data['id'] = id;
data['name'] = name;
data['email'] = email;
data['email_verified_at'] = emailVerifiedAt;
data['mobile'] = mobile;
data['mobile_verified'] = mobileVerified;
data['fcm_token'] = fcmToken;
data['avatar_url'] = avatarUrl;
data['blocked'] = blocked;
data['account_type'] = accountType;
data['default'] = defaultt;
data['referrer'] = referrer;
data['referrer_link'] = referrerLink;
data['otp'] = otp;
data['otp_expiration'] = otpExpiration;
data['created_at'] = createdAt;
data['updated_at'] = updatedAt;
return data;
}
}

class Address {
int? id;
String? longitude;
String? latitude;
int? distance;
String? name;
String? street;
dynamic? buildingNumber;
String? city;
int? defaultt;
int? apartmentNum;
int? active;
int? type;
int? userId;
String? createdAt;
String? updatedAt;

Address({this.id, this.longitude, this.latitude, this.distance, this.name, this.street, this.buildingNumber, this.city, this.defaultt, this.apartmentNum, this.active, this.type, this.userId, this.createdAt, this.updatedAt});

Address.fromJson(Map<String, dynamic> json) {
id = json['id'];
longitude = json['longitude'];
latitude = json['latitude'];
distance = json['distance'];
name = json['name'];
street = json['street'];
buildingNumber = json['building_number'];
city = json['city'];
defaultt = json['default'];
apartmentNum = json['apartment_num'];
active = json['active'];
type = json['type'];
userId = json['user_id'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = <String, dynamic>{};
data['id'] = id;
data['longitude'] = longitude;
data['latitude'] = latitude;
data['distance'] = distance;
data['name'] = name;
data['street'] = street;
data['building_number'] = buildingNumber;
data['city'] = city;
data['default'] = defaultt;
data['apartment_num'] = apartmentNum;
data['active'] = active;
data['type'] = type;
data['user_id'] = userId;
data['created_at'] = createdAt;
data['updated_at'] = updatedAt;
return data;
}
}

class DeliveryBoy {
int? id;
Title? name;
String? agencyName;
String? carNumber;
String? email;
String? emailVerifiedAt;
String? password;
String? fcmToken;
double? latitude;
double? longitude;
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
int? rememberToken;
int? isVerified;
String? drivingLicense;
int? isApproval;
int? distance;
String?otp;
int? fullGasBottles;
int? emptyGasBottles;
int? gasBottlesCapacity;
int? totalQuantity;
int? availableQuantity;
String? createdAt;
String? updatedAt;

DeliveryBoy({this.id, this.name, this.agencyName, this.carNumber, this.email, this.emailVerifiedAt, this.password, this.fcmToken, this.latitude, this.longitude, this.isFree, this.isOffline, this.isActive, this.avatarUrl, this.mobile, this.mobileVerified, this.rating, this.totalRating, this.categoryId, this.shopId, this.rememberToken, this.isVerified, this.drivingLicense, this.isApproval, this.distance, this.otp, this.fullGasBottles, this.emptyGasBottles, this.gasBottlesCapacity, this.totalQuantity, this.availableQuantity, this.createdAt, this.updatedAt});

DeliveryBoy.fromJson(Map<String, dynamic> json) {
id = json['id'];
name = json['name'] != null ? Title.fromJson(json['name']) : null;
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
isApproval = json['is_approval'];
distance = json['distance'];
otp = json['otp'];
fullGasBottles = json['full_gas_bottles'];
emptyGasBottles = json['empty_gas_bottles'];
gasBottlesCapacity = json['gas_bottles_capacity'];
totalQuantity = json['total_quantity'];
availableQuantity = json['available_quantity'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = <String, dynamic>{};
data['id'] = id;
if (name != null) {
data['name'] = name!.toJson();
}
data['agency_name'] = agencyName;
data['car_number'] = carNumber;
data['email'] = email;
data['email_verified_at'] = emailVerifiedAt;
data['password'] = password;
data['fcm_token'] = fcmToken;
data['latitude'] = latitude;
data['longitude'] = longitude;
data['is_free'] = isFree;
data['is_offline'] = isOffline;
data['is_active'] = isActive;
data['avatar_url'] = avatarUrl;
data['mobile'] = mobile;
data['mobile_verified'] = mobileVerified;
data['rating'] = rating;
data['total_rating'] = totalRating;
data['category_id'] = categoryId;
data['shop_id'] = shopId;
data['remember_token'] = rememberToken;
data['is_verified'] = isVerified;
data['driving_license'] = drivingLicense;
data['is_approval'] = isApproval;
data['distance'] = distance;
data['otp'] = otp;
data['full_gas_bottles'] = fullGasBottles;
data['empty_gas_bottles'] = emptyGasBottles;
data['gas_bottles_capacity'] = gasBottlesCapacity;
data['total_quantity'] = totalQuantity;
data['available_quantity'] = availableQuantity;
data['created_at'] = createdAt;
data['updated_at'] = updatedAt;
return data;
}
}

class OrderPayment {
int? id;
int? paymentType;
int? success;
int ?paymentId;
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
final Map<String, dynamic> data = <String, dynamic>{};
data['id'] = id;
data['payment_type'] = paymentType;
data['success'] = success;
data['payment_id'] = paymentId;
data['created_at'] = createdAt;
data['updated_at'] = updatedAt;
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
final Map<String, dynamic> data = <String, dynamic>{};
data['id'] = id;
data['order_date'] = orderDate;
data['order_time_from'] = orderTimeFrom;
data['order_time_to'] = orderTimeTo;
data['order_id'] = orderId;
data['created_at'] = createdAt;
data['updated_at'] = updatedAt;
return data;
}
}



