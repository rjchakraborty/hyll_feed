import 'package:hyll/generated/json/base/json_field.dart';
import 'package:hyll/generated/json/feed_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class FeedEntity {
	int? id = 0;
	int? pk = 0;
	String? status = '';
	String? title = '';
	@JSONField(name: "area_location")
	FeedAreaLocation? areaLocation;
	@JSONField(name: "starting_location")
	FeedStartingLocation? startingLocation;
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
	List<FeedBadges>? badges;
	@JSONField(name: "bucket_list_count")
	int? bucketListCount = 0;
	List<FeedContents>? contents;
	@JSONField(name: "supply_info")
	FeedSupplyInfo? supplyInfo;
	@JSONField(name: "grid_info")
	List<FeedGridInfo>? gridInfo;
	@JSONField(name: "ticket_optional")
	bool? ticketOptional = false;
	@JSONField(name: "primary_description")
	String? primaryDescription = '';
	String? description = '';
	List<FeedFacts>? facts;

	FeedEntity();

	factory FeedEntity.fromJson(Map<String, dynamic> json) => $FeedEntityFromJson(json);

	Map<String, dynamic> toJson() => $FeedEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FeedAreaLocation {
	String? name = '';
	String? subtitle = '';
	int? distance = 0;
	@JSONField(name: "image_url")
	String? imageUrl = '';

	FeedAreaLocation();

	factory FeedAreaLocation.fromJson(Map<String, dynamic> json) => $FeedAreaLocationFromJson(json);

	Map<String, dynamic> toJson() => $FeedAreaLocationToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FeedStartingLocation {
	String? name = '';
	String? subtitle = '';
	int? distance = 0;
	@JSONField(name: "image_url")
	String? imageUrl = '';

	FeedStartingLocation();

	factory FeedStartingLocation.fromJson(Map<String, dynamic> json) => $FeedStartingLocationFromJson(json);

	Map<String, dynamic> toJson() => $FeedStartingLocationToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FeedBadges {
	String? title = '';
	String? icon = '';
	@JSONField(name: "color_scheme")
	String? colorScheme = '';

	FeedBadges();

	factory FeedBadges.fromJson(Map<String, dynamic> json) => $FeedBadgesFromJson(json);

	Map<String, dynamic> toJson() => $FeedBadgesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FeedContents {
	String? id = '';
	@JSONField(name: "content_type")
	String? contentType = '';
	@JSONField(name: "content_mode")
	String? contentMode = '';
	@JSONField(name: "content_url")
	String? contentUrl = '';
	@JSONField(name: "content_source")
	FeedContentsContentSource? contentSource;
	@JSONField(name: "is_header_for_the_plan")
	bool? isHeaderForThePlan = false;
	@JSONField(name: "is_private")
	bool? isPrivate = false;

	FeedContents();

	factory FeedContents.fromJson(Map<String, dynamic> json) => $FeedContentsFromJson(json);

	Map<String, dynamic> toJson() => $FeedContentsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FeedContentsContentSource {
	String? id = '';
	String? title = '';
	String? author = '';
	String? name = '';
	String? icon = '';
	String? url = '';
	String? creator = '';

	FeedContentsContentSource();

	factory FeedContentsContentSource.fromJson(Map<String, dynamic> json) => $FeedContentsContentSourceFromJson(json);

	Map<String, dynamic> toJson() => $FeedContentsContentSourceToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FeedSupplyInfo {
	@JSONField(name: "supplier_name")
	String? supplierName = '';
	@JSONField(name: "price_title")
	String? priceTitle = '';
	@JSONField(name: "price_subtitle")
	String? priceSubtitle = '';
	@JSONField(name: "button_type")
	String? buttonType = '';
	String? link = '';

	FeedSupplyInfo();

	factory FeedSupplyInfo.fromJson(Map<String, dynamic> json) => $FeedSupplyInfoFromJson(json);

	Map<String, dynamic> toJson() => $FeedSupplyInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FeedGridInfo {
	String? name = '';
	String? value = '';
	@JSONField(name: "icon_url")
	String? iconUrl = '';
	String? schema = '';

	FeedGridInfo();

	factory FeedGridInfo.fromJson(Map<String, dynamic> json) => $FeedGridInfoFromJson(json);

	Map<String, dynamic> toJson() => $FeedGridInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FeedFacts {
	String? name = '';
	String? value = '';
	String? unit = '';
	@JSONField(name: "icon_url")
	String? iconUrl = '';
	@JSONField(name: "display_section")
	String? displaySection = '';
	@JSONField(name: "fact_definition_id")
	int? factDefinitionId = 0;
	@JSONField(name: "adventure_fact_id")
	int? adventureFactId = 0;
	@JSONField(name: "background_color")
	String? backgroundColor = '';
	@JSONField(name: "icon_color")
	String? iconColor = '';
	@JSONField(name: "text_color")
	String? textColor = '';

	FeedFacts();

	factory FeedFacts.fromJson(Map<String, dynamic> json) => $FeedFactsFromJson(json);

	Map<String, dynamic> toJson() => $FeedFactsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}