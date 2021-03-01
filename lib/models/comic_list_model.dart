class ComicListModel {
  Data data;

  ComicListModel({this.data});

  ComicListModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int offset;
  int limit;
  int total;
  int count;
  List<Comic> comics;

  Data({this.offset, this.limit, this.total, this.count, this.comics});

  Data.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      List<Comic> comics = [];
      json['results'].forEach((v) {
        comics.add(new Comic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['count'] = this.count;
    if (this.comics != null) {
      data['results'] = this.comics.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comic {
  int id;
  String title;
  String variantDescription;
  String description;
  int pageCount;
  Thumbnail thumbnail;
  List<Prices> prices;
  List<Dates> dates;
  List<Images> images;

  Comic(
      {this.id,
      this.title,
      this.variantDescription,
      this.description,
      this.pageCount,
      this.thumbnail,
      this.prices,
      this.dates,
      this.images});

  Comic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    variantDescription = json['variantDescription'];
    description = json['description'];
    pageCount = json['pageCount'];

    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    if (json['prices'] != null) {
      List<Prices> prices = [];
      json['prices'].forEach((v) {
        prices.add(new Prices.fromJson(v));
      });
    }
    if (json['dates'] != null) {
      List<Dates> dates = [];
      json['dates'].forEach((v) {
        dates.add(new Dates.fromJson(v));
      });
    }
    if (json['images'] != null) {
      List<Images> images = [];
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['variantDescription'] = this.variantDescription;
    data['description'] = this.description;
    data['pageCount'] = this.pageCount;
    if (this.prices != null) {
      data['prices'] = this.prices.map((v) => v.toJson()).toList();
    }
    if (this.dates != null) {
      data['dates'] = this.dates.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Thumbnail {
  String path;
  String extension;

  Thumbnail({this.path, this.extension});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['extension'] = this.extension;
    return data;
  }
}

class Images {
  String path;
  String extension;
  Images({this.path, this.extension});
  Images.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['extension'] = this.extension;
    return data;
  }
}

class Prices {
  String type;
  double price;

  Prices({this.type, this.price});

  Prices.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['price'] = this.price;
    return data;
  }
}

class Dates {
  String type;
  DateTime date;

  Dates({this.type, this.date});

  Dates.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['date'] = this.date;
    return data;
  }
}
