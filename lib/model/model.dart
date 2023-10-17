///////////////////models///////////////

class UserType {
  final int userTypeID;
  final String userTypeName;

  UserType({
    required this.userTypeID,
    required this.userTypeName,
  });
}

class Users {
  final int userID;
  final String userFirstName;
  final String userSurName;
  final String? userEmail;
  final String userPassword;
  final String userPhoneNumber;
  final int userIdentityNumber;
  final int userTypeID;

  Users({
    required this.userID,
    required this.userFirstName,
    required this.userSurName,
    this.userEmail,
    required this.userPassword,
    required this.userPhoneNumber,
    required this.userIdentityNumber,
    required this.userTypeID,
  });
}

class Supplier {
  final int supplierID;
  final int userID;
  final String supplierName;
  final String? supplierBannerPath;
  final String? supplierProfilePhotoPath;
  final int supplierVkn;

  Supplier({
    required this.supplierID,
    required this.userID,
    required this.supplierName,
    this.supplierBannerPath,
    this.supplierProfilePhotoPath,
    required this.supplierVkn,
  });
}

class SupplierTelNumbers {
  final int supplierTelID;
  final int supplierID;
  final String supplierTel;

  SupplierTelNumbers({
    required this.supplierTelID,
    required this.supplierID,
    required this.supplierTel,
  });
}

class SupplierAreas {
  final int areaID;
  final int supplierID;
  final String areaName;
  final String? areaLocation;

  SupplierAreas({
    required this.areaID,
    required this.supplierID,
    required this.areaName,
    this.areaLocation,
  });
}

class SupplierCertifacetes {
  final int certifaceteID;
  final int supplierID;
  final String certificateName;
  final String certificatePhotoPath;

  SupplierCertifacetes({
    required this.certifaceteID,
    required this.supplierID,
    required this.certificateName,
    required this.certificatePhotoPath,
  });
}

class Farmers {
  final int farmerID;
  final int userID;
  final String? farmerCks;
  final bool? farmerCksIsAccepted;
  final String? farmerArea;

  Farmers({
    required this.farmerID,
    required this.userID,
    this.farmerCks,
    this.farmerCksIsAccepted,
    this.farmerArea,
  });
}

class FarmerAddress {
  final int farmerAddressID;
  final int farmerID;
  final String addressContent;
  final String? addressLocation;
  final String? addressType;

  FarmerAddress({
    required this.farmerAddressID,
    required this.farmerID,
    required this.addressContent,
    this.addressLocation,
    this.addressType,
  });
}

class Posts {
  final int postID;
  final int userID;
  final String content;
  final DateTime? dataPosted;

  Posts({
    required this.postID,
    required this.userID,
    required this.content,
    this.dataPosted,
  });
}

class Likes {
  final int likeID;
  final int postID;
  final int userID;

  Likes({
    required this.likeID,
    required this.postID,
    required this.userID,
  });
}

class Comments {
  final int commentID;
  final int postID;
  final int userID;
  final String? content;
  final DateTime? datecommented;

  Comments({
    required this.commentID,
    required this.postID,
    required this.userID,
    this.content,
    this.datecommented,
  });
}

class Followers {
  final int followerID;
  final int followerUserID;
  final int followingUserID;

  Followers({
    required this.followerID,
    required this.followerUserID,
    required this.followingUserID,
  });
}

class Messages {
  final int messageID;
  final int senderID;
  final int receiverID;
  final String? content;
  final DateTime? datasent;

  Messages({
    required this.messageID,
    required this.senderID,
    required this.receiverID,
    this.content,
    this.datasent,
  });
}

class ProductCategory {
  final int productCategoryID;
  final String productCategoryName;

  ProductCategory({
    required this.productCategoryID,
    required this.productCategoryName,
  });
}

class Products {
  final int productID;
  final int supplierID;
  final String? productName;
  final int productCategory;
  final double price;
  final int stock;
  final String? productDetails;
  final String? productUnit;

  Products({
    required this.productID,
    required this.supplierID,
    this.productName,
    required this.productCategory,
    required this.price,
    required this.stock,
    this.productDetails,
    this.productUnit,
  });
}

class ProductReviews {
  final int productReviewID;
  final int farmerID;
  final int productID;
  final int rating;
  final String? comment;
  final DateTime? reviewDate;

  ProductReviews({
    required this.productReviewID,
    required this.farmerID,
    required this.productID,
    required this.rating,
    this.comment,
    this.reviewDate,
  });
}

class SupplierReviews {
  final int supplierReviewID;
  final int farmerID;
  final int supplierID;
  final int rating;
  final String? comment;
  final DateTime? reviewDate;

  SupplierReviews({
    required this.supplierReviewID,
    required this.farmerID,
    required this.supplierID,
    required this.rating,
    this.comment,
    this.reviewDate,
  });
}

class Carts {
  final int cartID;
  final int farmerID;
  final int productID;
  final int quantity;

  Carts({
    required this.cartID,
    required this.farmerID,
    required this.productID,
    required this.quantity,
  });
}

class Orders {
  final int orderID;
  final int farmerID;
  final int productID;
  final int quantity;
  final double totalPrice;
  final String status;
  final DateTime? orderDate;

  Orders({
    required this.orderID,
    required this.farmerID,
    required this.productID,
    required this.quantity,
    required this.totalPrice,
    required this.status,
    this.orderDate,
  });
}
