import 'package:hyll/generated/json/base/json_convert_content.dart';
import 'package:hyll/entities/slider_entity.dart';

SliderEntity $SliderEntityFromJson(Map<String, dynamic> json) {
	final SliderEntity sliderEntity = SliderEntity();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		sliderEntity.id = id;
	}
	final int? pk = jsonConvert.convert<int>(json['pk']);
	if (pk != null) {
		sliderEntity.pk = pk;
	}
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		sliderEntity.status = status;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		sliderEntity.title = title;
	}
	final SliderAreaLocation? areaLocation = jsonConvert.convert<SliderAreaLocation>(json['area_location']);
	if (areaLocation != null) {
		sliderEntity.areaLocation = areaLocation;
	}
	final SliderStartingLocation? startingLocation = jsonConvert.convert<SliderStartingLocation>(json['starting_location']);
	if (startingLocation != null) {
		sliderEntity.startingLocation = startingLocation;
	}
	final List<String>? tags = jsonConvert.convertListNotNull<String>(json['tags']);
	if (tags != null) {
		sliderEntity.tags = tags;
	}
	final String? activity = jsonConvert.convert<String>(json['activity']);
	if (activity != null) {
		sliderEntity.activity = activity;
	}
	final int? activityId = jsonConvert.convert<int>(json['activity_id']);
	if (activityId != null) {
		sliderEntity.activityId = activityId;
	}
	final String? primaryImage = jsonConvert.convert<String>(json['primary_image']);
	if (primaryImage != null) {
		sliderEntity.primaryImage = primaryImage;
	}
	final String? primaryVideo = jsonConvert.convert<String>(json['primary_video']);
	if (primaryVideo != null) {
		sliderEntity.primaryVideo = primaryVideo;
	}
	final String? thumbnail = jsonConvert.convert<String>(json['thumbnail']);
	if (thumbnail != null) {
		sliderEntity.thumbnail = thumbnail;
	}
	final String? activityIcon = jsonConvert.convert<String>(json['activity_icon']);
	if (activityIcon != null) {
		sliderEntity.activityIcon = activityIcon;
	}
	final List<dynamic>? badges = jsonConvert.convertListNotNull<dynamic>(json['badges']);
	if (badges != null) {
		sliderEntity.badges = badges;
	}
	final int? bucketListCount = jsonConvert.convert<int>(json['bucket_list_count']);
	if (bucketListCount != null) {
		sliderEntity.bucketListCount = bucketListCount;
	}
	final List<SliderContents>? contents = jsonConvert.convertListNotNull<SliderContents>(json['contents']);
	if (contents != null) {
		sliderEntity.contents = contents;
	}
	final SliderSupplyInfo? supplyInfo = jsonConvert.convert<SliderSupplyInfo>(json['supply_info']);
	if (supplyInfo != null) {
		sliderEntity.supplyInfo = supplyInfo;
	}
	final List<SliderGridInfo>? gridInfo = jsonConvert.convertListNotNull<SliderGridInfo>(json['grid_info']);
	if (gridInfo != null) {
		sliderEntity.gridInfo = gridInfo;
	}
	final bool? ticketOptional = jsonConvert.convert<bool>(json['ticket_optional']);
	if (ticketOptional != null) {
		sliderEntity.ticketOptional = ticketOptional;
	}
	final List<dynamic>? bucketListedByFollowing = jsonConvert.convertListNotNull<dynamic>(json['bucket_listed_by_following']);
	if (bucketListedByFollowing != null) {
		sliderEntity.bucketListedByFollowing = bucketListedByFollowing;
	}
	final String? primaryDescription = jsonConvert.convert<String>(json['primary_description']);
	if (primaryDescription != null) {
		sliderEntity.primaryDescription = primaryDescription;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		sliderEntity.description = description;
	}
	final List<dynamic>? facts = jsonConvert.convertListNotNull<dynamic>(json['facts']);
	if (facts != null) {
		sliderEntity.facts = facts;
	}
	return sliderEntity;
}

Map<String, dynamic> $SliderEntityToJson(SliderEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['pk'] = entity.pk;
	data['status'] = entity.status;
	data['title'] = entity.title;
	data['area_location'] = entity.areaLocation?.toJson();
	data['starting_location'] = entity.startingLocation?.toJson();
	data['tags'] =  entity.tags;
	data['activity'] = entity.activity;
	data['activity_id'] = entity.activityId;
	data['primary_image'] = entity.primaryImage;
	data['primary_video'] = entity.primaryVideo;
	data['thumbnail'] = entity.thumbnail;
	data['activity_icon'] = entity.activityIcon;
	data['badges'] =  entity.badges;
	data['bucket_list_count'] = entity.bucketListCount;
	data['contents'] =  entity.contents?.map((v) => v.toJson()).toList();
	data['supply_info'] = entity.supplyInfo?.toJson();
	data['grid_info'] =  entity.gridInfo?.map((v) => v.toJson()).toList();
	data['ticket_optional'] = entity.ticketOptional;
	data['bucket_listed_by_following'] =  entity.bucketListedByFollowing;
	data['primary_description'] = entity.primaryDescription;
	data['description'] = entity.description;
	data['facts'] =  entity.facts;
	return data;
}

SliderAreaLocation $SliderAreaLocationFromJson(Map<String, dynamic> json) {
	final SliderAreaLocation sliderAreaLocation = SliderAreaLocation();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		sliderAreaLocation.name = name;
	}
	final dynamic subtitle = jsonConvert.convert<dynamic>(json['subtitle']);
	if (subtitle != null) {
		sliderAreaLocation.subtitle = subtitle;
	}
	final dynamic distance = jsonConvert.convert<dynamic>(json['distance']);
	if (distance != null) {
		sliderAreaLocation.distance = distance;
	}
	final dynamic imageUrl = jsonConvert.convert<dynamic>(json['image_url']);
	if (imageUrl != null) {
		sliderAreaLocation.imageUrl = imageUrl;
	}
	return sliderAreaLocation;
}

Map<String, dynamic> $SliderAreaLocationToJson(SliderAreaLocation entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['subtitle'] = entity.subtitle;
	data['distance'] = entity.distance;
	data['image_url'] = entity.imageUrl;
	return data;
}

SliderStartingLocation $SliderStartingLocationFromJson(Map<String, dynamic> json) {
	final SliderStartingLocation sliderStartingLocation = SliderStartingLocation();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		sliderStartingLocation.name = name;
	}
	final dynamic subtitle = jsonConvert.convert<dynamic>(json['subtitle']);
	if (subtitle != null) {
		sliderStartingLocation.subtitle = subtitle;
	}
	final dynamic distance = jsonConvert.convert<dynamic>(json['distance']);
	if (distance != null) {
		sliderStartingLocation.distance = distance;
	}
	final String? imageUrl = jsonConvert.convert<String>(json['image_url']);
	if (imageUrl != null) {
		sliderStartingLocation.imageUrl = imageUrl;
	}
	return sliderStartingLocation;
}

Map<String, dynamic> $SliderStartingLocationToJson(SliderStartingLocation entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['subtitle'] = entity.subtitle;
	data['distance'] = entity.distance;
	data['image_url'] = entity.imageUrl;
	return data;
}

SliderContents $SliderContentsFromJson(Map<String, dynamic> json) {
	final SliderContents sliderContents = SliderContents();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		sliderContents.id = id;
	}
	final String? contentType = jsonConvert.convert<String>(json['content_type']);
	if (contentType != null) {
		sliderContents.contentType = contentType;
	}
	final String? contentMode = jsonConvert.convert<String>(json['content_mode']);
	if (contentMode != null) {
		sliderContents.contentMode = contentMode;
	}
	final String? contentUrl = jsonConvert.convert<String>(json['content_url']);
	if (contentUrl != null) {
		sliderContents.contentUrl = contentUrl;
	}
	final SliderContentsContentSource? contentSource = jsonConvert.convert<SliderContentsContentSource>(json['content_source']);
	if (contentSource != null) {
		sliderContents.contentSource = contentSource;
	}
	final bool? isHeaderForThePlan = jsonConvert.convert<bool>(json['is_header_for_the_plan']);
	if (isHeaderForThePlan != null) {
		sliderContents.isHeaderForThePlan = isHeaderForThePlan;
	}
	final bool? isPrivate = jsonConvert.convert<bool>(json['is_private']);
	if (isPrivate != null) {
		sliderContents.isPrivate = isPrivate;
	}
	return sliderContents;
}

Map<String, dynamic> $SliderContentsToJson(SliderContents entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['content_type'] = entity.contentType;
	data['content_mode'] = entity.contentMode;
	data['content_url'] = entity.contentUrl;
	data['content_source'] = entity.contentSource?.toJson();
	data['is_header_for_the_plan'] = entity.isHeaderForThePlan;
	data['is_private'] = entity.isPrivate;
	return data;
}

SliderContentsContentSource $SliderContentsContentSourceFromJson(Map<String, dynamic> json) {
	final SliderContentsContentSource sliderContentsContentSource = SliderContentsContentSource();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		sliderContentsContentSource.id = id;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		sliderContentsContentSource.title = title;
	}
	final dynamic author = jsonConvert.convert<dynamic>(json['author']);
	if (author != null) {
		sliderContentsContentSource.author = author;
	}
	final dynamic name = jsonConvert.convert<dynamic>(json['name']);
	if (name != null) {
		sliderContentsContentSource.name = name;
	}
	final dynamic icon = jsonConvert.convert<dynamic>(json['icon']);
	if (icon != null) {
		sliderContentsContentSource.icon = icon;
	}
	final dynamic url = jsonConvert.convert<dynamic>(json['url']);
	if (url != null) {
		sliderContentsContentSource.url = url;
	}
	final dynamic creator = jsonConvert.convert<dynamic>(json['creator']);
	if (creator != null) {
		sliderContentsContentSource.creator = creator;
	}
	return sliderContentsContentSource;
}

Map<String, dynamic> $SliderContentsContentSourceToJson(SliderContentsContentSource entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['author'] = entity.author;
	data['name'] = entity.name;
	data['icon'] = entity.icon;
	data['url'] = entity.url;
	data['creator'] = entity.creator;
	return data;
}

SliderSupplyInfo $SliderSupplyInfoFromJson(Map<String, dynamic> json) {
	final SliderSupplyInfo sliderSupplyInfo = SliderSupplyInfo();
	final dynamic supplierName = jsonConvert.convert<dynamic>(json['supplier_name']);
	if (supplierName != null) {
		sliderSupplyInfo.supplierName = supplierName;
	}
	final String? priceTitle = jsonConvert.convert<String>(json['price_title']);
	if (priceTitle != null) {
		sliderSupplyInfo.priceTitle = priceTitle;
	}
	final String? priceSubtitle = jsonConvert.convert<String>(json['price_subtitle']);
	if (priceSubtitle != null) {
		sliderSupplyInfo.priceSubtitle = priceSubtitle;
	}
	final String? buttonType = jsonConvert.convert<String>(json['button_type']);
	if (buttonType != null) {
		sliderSupplyInfo.buttonType = buttonType;
	}
	final dynamic link = jsonConvert.convert<dynamic>(json['link']);
	if (link != null) {
		sliderSupplyInfo.link = link;
	}
	return sliderSupplyInfo;
}

Map<String, dynamic> $SliderSupplyInfoToJson(SliderSupplyInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['supplier_name'] = entity.supplierName;
	data['price_title'] = entity.priceTitle;
	data['price_subtitle'] = entity.priceSubtitle;
	data['button_type'] = entity.buttonType;
	data['link'] = entity.link;
	return data;
}

SliderGridInfo $SliderGridInfoFromJson(Map<String, dynamic> json) {
	final SliderGridInfo sliderGridInfo = SliderGridInfo();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		sliderGridInfo.name = name;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		sliderGridInfo.value = value;
	}
	final String? iconUrl = jsonConvert.convert<String>(json['icon_url']);
	if (iconUrl != null) {
		sliderGridInfo.iconUrl = iconUrl;
	}
	final String? schema = jsonConvert.convert<String>(json['schema']);
	if (schema != null) {
		sliderGridInfo.schema = schema;
	}
	return sliderGridInfo;
}

Map<String, dynamic> $SliderGridInfoToJson(SliderGridInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['value'] = entity.value;
	data['icon_url'] = entity.iconUrl;
	data['schema'] = entity.schema;
	return data;
}