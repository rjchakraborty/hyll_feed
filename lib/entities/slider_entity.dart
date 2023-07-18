import 'package:hyll/generated/json/base/json_field.dart';
import 'package:hyll/generated/json/slider_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class SliderEntity {
	int? id = 0;
	int? pk = 0;
	String? status = '';
	String? title = '';
	@JSONField(name: "area_location")
	SliderAreaLocation? areaLocation;
	@JSONField(name: "starting_location")
	SliderStartingLocation? startingLocation;
	List<String>? tags;
	String? activity = '';
	@JSONField(name: "activity_id")
	int? activityId = 0;
	@JSONField(name: "primary_image")
	String? primaryImage = '';
	@JSONField(name: "primary_video")
	String? primaryVideo = '';
	String? thumbnail = '';
	@JSONField(name: "activity_icon")
	String? activityIcon = '';
	List<dynamic>? badges;
	@JSONField(name: "bucket_list_count")
	int? bucketListCount = 0;
	List<SliderContents>? contents;
	@JSONField(name: "supply_info")
	SliderSupplyInfo? supplyInfo;
	@JSONField(name: "grid_info")
	List<SliderGridInfo>? gridInfo;
	@JSONField(name: "ticket_optional")
	bool? ticketOptional = false;
	@JSONField(name: "bucket_listed_by_following")
	List<dynamic>? bucketListedByFollowing;
	@JSONField(name: "primary_description")
	String? primaryDescription = '';
	String? description = '';
	List<dynamic>? facts;

	SliderEntity();

	factory SliderEntity.fromJson(Map<String, dynamic> json) => $SliderEntityFromJson(json);

	Map<String, dynamic> toJson() => $SliderEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SliderAreaLocation {
	String? name = '';
	dynamic subtitle;
	dynamic distance;
	@JSONField(name: "image_url")
	dynamic imageUrl;

	SliderAreaLocation();

	factory SliderAreaLocation.fromJson(Map<String, dynamic> json) => $SliderAreaLocationFromJson(json);

	Map<String, dynamic> toJson() => $SliderAreaLocationToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SliderStartingLocation {
	String? name = '';
	dynamic subtitle;
	dynamic distance;
	@JSONField(name: "image_url")
	String? imageUrl = '';

	SliderStartingLocation();

	factory SliderStartingLocation.fromJson(Map<String, dynamic> json) => $SliderStartingLocationFromJson(json);

	Map<String, dynamic> toJson() => $SliderStartingLocationToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SliderContents {
	String? id = '';
	@JSONField(name: "content_type")
	String? contentType = '';
	@JSONField(name: "content_mode")
	String? contentMode = '';
	@JSONField(name: "content_url")
	String? contentUrl = '';
	@JSONField(name: "content_source")
	SliderContentsContentSource? contentSource;
	@JSONField(name: "is_header_for_the_plan")
	bool? isHeaderForThePlan = false;
	@JSONField(name: "is_private")
	bool? isPrivate = false;

	SliderContents();

	factory SliderContents.fromJson(Map<String, dynamic> json) => $SliderContentsFromJson(json);

	Map<String, dynamic> toJson() => $SliderContentsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SliderContentsContentSource {
	String? id = '';
	String? title = '';
	dynamic author;
	dynamic name;
	dynamic icon;
	dynamic url;
	dynamic creator;

	SliderContentsContentSource();

	factory SliderContentsContentSource.fromJson(Map<String, dynamic> json) => $SliderContentsContentSourceFromJson(json);

	Map<String, dynamic> toJson() => $SliderContentsContentSourceToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SliderSupplyInfo {
	@JSONField(name: "supplier_name")
	dynamic supplierName;
	@JSONField(name: "price_title")
	String? priceTitle = '';
	@JSONField(name: "price_subtitle")
	String? priceSubtitle = '';
	@JSONField(name: "button_type")
	String? buttonType = '';
	dynamic link;

	SliderSupplyInfo();

	factory SliderSupplyInfo.fromJson(Map<String, dynamic> json) => $SliderSupplyInfoFromJson(json);

	Map<String, dynamic> toJson() => $SliderSupplyInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SliderGridInfo {
	String? name = '';
	String? value = '';
	@JSONField(name: "icon_url")
	String? iconUrl = '';
	String? schema = '';

	SliderGridInfo();

	factory SliderGridInfo.fromJson(Map<String, dynamic> json) => $SliderGridInfoFromJson(json);

	Map<String, dynamic> toJson() => $SliderGridInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}