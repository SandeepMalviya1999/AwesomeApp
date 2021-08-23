class UnSplashModel {
  late String id;
  late String createdAt;
  late String updatedAt;
  late String promotedAt;
  late int width;
  late int height;
  late String color;
  late String blurHash;
  late String description;
  late String altDescription;
  late Urls? urls;
  late Links? links;
  late List<String>? categories;
  late int likes;
  late bool likedByUser;
  late List<String>? currentUserCollections;
  late Sponsorship? sponsorship;
  late User? user;

  UnSplashModel(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.promotedAt,
      required this.width,
      required this.height,
      required this.color,
      required this.blurHash,
      required this.description,
      required this.altDescription,
      required this.urls,
      required this.links,
      required this.categories,
      required this.likes,
      required this.likedByUser,
      required this.currentUserCollections,
      required this.sponsorship,
      required this.user});

  UnSplashModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    promotedAt = json['promoted_at'] != null ? json['promoted_at'] : '';
    width = json['width'];
    height = json['height'];
    color = json['color'];
    blurHash = json['blur_hash'] != null ? json['blur_hash'] : '';
    description = json['description'] != null ? json['description'] : '';
    altDescription = json['alt_description'] != null ? json['alt_description'] : '';
    urls = json['urls'] != null ? new Urls.fromJson(json['urls']) : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories!.add(v.toString());
      });
    }
    likes = json['likes'];
    likedByUser = json['liked_by_user'];
    if (json['current_user_collections'] != null) {
      currentUserCollections = [];
      json['current_user_collections'].forEach((v) {
        currentUserCollections!.add(v.toString());
      });
    }
    sponsorship = json['sponsorship'] != null
        ? new Sponsorship.fromJson(json['sponsorship'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['promoted_at'] = this.promotedAt;
    data['width'] = this.width;
    data['height'] = this.height;
    data['color'] = this.color;
    data['blur_hash'] = this.blurHash;
    data['description'] = this.description;
    data['alt_description'] = this.altDescription;
    if (this.urls != null) {
      data['urls'] = this.urls!.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toString()).toList();
    }
    data['likes'] = this.likes;
    data['liked_by_user'] = this.likedByUser;
    if (this.currentUserCollections != null) {
      data['current_user_collections'] =
          this.currentUserCollections!.map((v) => v.toString()).toList();
    }
    if (this.sponsorship != null) {
      data['sponsorship'] = this.sponsorship!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Urls {
  late String raw;
  late String full;
  late String regular;
  late String small;
  late String thumb;

  Urls(
      {required this.raw,
      required this.full,
      required this.regular,
      required this.small,
      required this.thumb});

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw'] = this.raw;
    data['full'] = this.full;
    data['regular'] = this.regular;
    data['small'] = this.small;
    data['thumb'] = this.thumb;
    return data;
  }
}

class Links {
  late String self;
  late String html;
  late String? download;
  late String downloadLocation;

  Links(
      {required this.self,
      required this.html,
      required this.download,
      required this.downloadLocation});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
    download = json['download'] != null ? json['download'] : '';
    downloadLocation = json['download_location'] != null ? json['download_location'] : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    data['html'] = this.html;
    data['download'] = this.download;
    data['download_location'] = this.downloadLocation;
    return data;
  }
}

class Sponsorship {
  late List<String> impressionUrls;
  late String tagline;
  late String taglineUrl;
  late Sponsor? sponsor;

  Sponsorship(
      {required this.impressionUrls,
      required this.tagline,
      required this.taglineUrl,
      required this.sponsor});

  Sponsorship.fromJson(Map<String, dynamic> json) {
    impressionUrls = json['impression_urls'].cast<String>();
    tagline = json['tagline'];
    taglineUrl = json['tagline_url'];
    sponsor =
        json['sponsor'] != null ? new Sponsor.fromJson(json['sponsor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['impression_urls'] = this.impressionUrls;
    data['tagline'] = this.tagline;
    data['tagline_url'] = this.taglineUrl;
    if (this.sponsor != null) {
      data['sponsor'] = this.sponsor!.toJson();
    }
    return data;
  }
}

class Sponsor {
  late String id;
  late String updatedAt;
  late String username;
  late String name;
  late String firstName;
  late String lastName;
  late String twitterUsername;
  late String portfolioUrl;
  late String bio;
  late String location;
  late SponserLinks? links;
  late ProfileImage? profileImage;
  late String instagramUsername;
  late int totalCollections;
  late int totalLikes;
  late int totalPhotos;
  late bool acceptedTos;
  late bool forHire;
  late Social? social;

  Sponsor(
      {required this.id,
      required this.updatedAt,
      required this.username,
      required this.name,
      required this.firstName,
      required this.lastName,
      required this.twitterUsername,
      required this.portfolioUrl,
      required this.bio,
      required this.location,
      required this.links,
      required this.profileImage,
      required this.instagramUsername,
      required this.totalCollections,
      required this.totalLikes,
      required this.totalPhotos,
      required this.acceptedTos,
      required this.forHire,
      required this.social});

  Sponsor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    updatedAt = json['updated_at'];
    username = json['username'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'] != null ? json['last_name'] : '';
    twitterUsername = json['twitter_username'];
    portfolioUrl = json['portfolio_url'];
    bio = json['bio'];
    location = json['location'] != null ? json['location'] : '';
    links =
        json['links'] != null ? new SponserLinks.fromJson(json['links']) : null;
    profileImage = json['profile_image'] != null
        ? new ProfileImage.fromJson(json['profile_image'])
        : null;
    instagramUsername = json['instagram_username'] != null ?  json['instagram_username']: '';
    totalCollections = json['total_collections'];
    totalLikes = json['total_likes'];
    totalPhotos = json['total_photos'];
    acceptedTos = json['accepted_tos'];
    forHire = json['for_hire'];
    social =
        json['social'] != null ? new Social.fromJson(json['social']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['updated_at'] = this.updatedAt;
    data['username'] = this.username;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['twitter_username'] = this.twitterUsername;
    data['portfolio_url'] = this.portfolioUrl;
    data['bio'] = this.bio;
    data['location'] = this.location;
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.profileImage != null) {
      data['profile_image'] = this.profileImage!.toJson();
    }
    data['instagram_username'] = this.instagramUsername;
    data['total_collections'] = this.totalCollections;
    data['total_likes'] = this.totalLikes;
    data['total_photos'] = this.totalPhotos;
    data['accepted_tos'] = this.acceptedTos;
    data['for_hire'] = this.forHire;
    if (this.social != null) {
      data['social'] = this.social!.toJson();
    }
    return data;
  }
}

class SponserLinks {
  late String self;
  late String html;
  late String photos;
  late String likes;
  late String portfolio;
  late String following;
  late String followers;

  SponserLinks(
      {required this.self,
      required this.html,
      required this.photos,
      required this.likes,
      required this.portfolio,
      required this.following,
      required this.followers});

  SponserLinks.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
    photos = json['photos'];
    likes = json['likes'];
    portfolio = json['portfolio'];
    following = json['following'];
    followers = json['followers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    data['html'] = this.html;
    data['photos'] = this.photos;
    data['likes'] = this.likes;
    data['portfolio'] = this.portfolio;
    data['following'] = this.following;
    data['followers'] = this.followers;
    return data;
  }
}

class ProfileImage {
  late String small;
  late String medium;
  late String large;

  ProfileImage(
      {required this.small, required this.medium, required this.large});

  ProfileImage.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['medium'] = this.medium;
    data['large'] = this.large;
    return data;
  }
}

class Social {
  late String instagramUsername;
  late String portfolioUrl;
  late String twitterUsername;
  late Null paypalEmail;

  Social(
      {required this.instagramUsername,
      required this.portfolioUrl,
      required this.twitterUsername,
      required this.paypalEmail});

  Social.fromJson(Map<String, dynamic> json) {
    instagramUsername = json['instagram_username'] != null ? json['instagram_username'] : '';
    portfolioUrl = json['portfolio_url'] != null ? json['portfolio_url'] : '';
    twitterUsername = json['twitter_username'] != null ? json['twitter_username']: '';
    paypalEmail = json['paypal_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['instagram_username'] = this.instagramUsername;
    data['portfolio_url'] = this.portfolioUrl;
    data['twitter_username'] = this.twitterUsername;
    data['paypal_email'] = this.paypalEmail;
    return data;
  }
}

class User {
  late String id;
  late String updatedAt;
  late String username;
  late String name;
  late String firstName;
  late String lastName;
  late String twitterUsername;
  late String portfolioUrl;
  late String? bio;
  late String location;
  late Links? links;
  late ProfileImage? profileImage;
  late String instagramUsername;
  late int totalCollections;
  late int totalLikes;
  late int totalPhotos;
  late bool acceptedTos;
  late bool forHire;
  late Social? social;

  User(
      {required this.id,
      required this.updatedAt,
      required this.username,
      required this.name,
      required this.firstName,
      required this.lastName,
      required this.twitterUsername,
      required this.portfolioUrl,
      required this.bio,
      required this.location,
      required this.links,
      required this.profileImage,
      required this.instagramUsername,
      required this.totalCollections,
      required this.totalLikes,
      required this.totalPhotos,
      required this.acceptedTos,
      required this.forHire,
      required this.social});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    updatedAt = json['updated_at'];
    username = json['username'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'] != null ? json['last_name'] : '';
    twitterUsername = json['twitter_username'] != null ? json['twitter_username'] : '';
    portfolioUrl = json['portfolio_url'] != null ? json['portfolio_url'] :'';
    bio = json['bio'];
    location = json['location'] != null ? json['location'] : '';
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    profileImage = json['profile_image'] != null
        ? new ProfileImage.fromJson(json['profile_image'])
        : null;
    instagramUsername = json['instagram_username'] != null ? json['instagram_username'] : '';
    totalCollections = json['total_collections'];
    totalLikes = json['total_likes'];
    totalPhotos = json['total_photos'];
    acceptedTos = json['accepted_tos'];
    forHire = json['for_hire'];
    social =
        json['social'] != null ? new Social.fromJson(json['social']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['updated_at'] = this.updatedAt;
    data['username'] = this.username;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['twitter_username'] = this.twitterUsername;
    data['portfolio_url'] = this.portfolioUrl;
    data['bio'] = this.bio;
    data['location'] = this.location;
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.profileImage != null) {
      data['profile_image'] = this.profileImage!.toJson();
    }
    data['instagram_username'] = this.instagramUsername;
    data['total_collections'] = this.totalCollections;
    data['total_likes'] = this.totalLikes;
    data['total_photos'] = this.totalPhotos;
    data['accepted_tos'] = this.acceptedTos;
    data['for_hire'] = this.forHire;
    if (this.social != null) {
      data['social'] = this.social!.toJson();
    }
    return data;
  }
}
