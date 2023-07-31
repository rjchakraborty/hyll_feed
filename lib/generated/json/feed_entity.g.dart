import 'package:hyll/generated/json/base/json_convert_content.dart';
import 'package:hyll/data/models/feed_entity.dart';

FeedEntity $FeedEntityFromJson(Map<String, dynamic> json) {
	final FeedEntity feedEntity = FeedEntity();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		feedEntity.id = id;
	}
	final int? pk = jsonConvert.convert<int>(json['pk']);
	if (pk != null) {
		feedEntity.pk = pk;
	}
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		feedEntity.status = status;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		feedEntity.title = title;
	}
	final FeedAreaLocation? areaLocation = jsonConvert.convert<FeedAreaLocation>(json['area_location']);
	if (areaLocation != null) {
		feedEntity.areaLocation = areaLocation;
	}
	final FeedStartingLocation? startingLocation = jsonConvert.convert<FeedStartingLocation>(json['starting_location']);
	if (startingLocation != null) {
		feedEntity.startingLocation = startingLocation;
	}
	final List<String>? tags = jsonConvert.convertListNotNull<String>(json['tags']);
	if (tags != null) {
		feedEntity.tags = tags;
	}
	final String? activity = jsonConvert.convert<String>(json['activity']);
	if (activity != null) {
		feedEntity.activity = activity;
	}
	final int? activityId = jsonConvert.convert<int>(json['activity_id']);
	if (activityId != null) {
		feedEntity.activityId = activityId;
	}
	final String? primaryImage = jsonConvert.convert<String>(json['primary_image']);
	if (primaryImage != null) {
		feedEntity.primaryImage = primaryImage;
	}
	final String? primaryVideo = jsonConvert.convert<String>(json['primary_video']);
	if (primaryVideo != null) {
		feedEntity.primaryVideo = primaryVideo;
	}
	final String? thumbnail = jsonConvert.convert<String>(json['thumbnail']);
	if (thumbnail != null) {
		feedEntity.thumbnail = thumbnail;
	}
	final String? activityIcon = jsonConvert.convert<String>(json['activity_icon']);
	if (activityIcon != null) {
		feedEntity.activityIcon = activityIcon;
	}
	final List<FeedBadges>? badges = jsonConvert.convertListNotNull<FeedBadges>(json['badges']);
	if (badges != null) {
		feedEntity.badges = badges;
	}
	final int? bucketListCount = jsonConvert.convert<int>(json['bucket_list_count']);
	if (bucketListCount != null) {
		feedEntity.bucketListCount = bucketListCount;
	}
	final List<FeedContents>? contents = jsonConvert.convertListNotNull<FeedContents>(json['contents']);
	if (contents != null) {
		feedEntity.contents = contents;
	}
	final FeedSupplyInfo? supplyInfo = jsonConvert.convert<FeedSupplyInfo>(json['supply_info']);
	if (supplyInfo != null) {
		feedEntity.supplyInfo = supplyInfo;
	}
	final List<FeedGridInfo>? gridInfo = jsonConvert.convertListNotNull<FeedGridInfo>(json['grid_info']);
	if (gridInfo != null) {
		feedEntity.gridInfo = gridInfo;
	}
	final bool? ticketOptional = jsonConvert.convert<bool>(json['ticket_optional']);
	if (ticketOptional != null) {
		feedEntity.ticketOptional = ticketOptional;
	}
	final String? primaryDescription = jsonConvert.convert<String>(json['primary_description']);
	if (primaryDescription != null) {
		feedEntity.primaryDescription = primaryDescription;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		feedEntity.description = description;
	}
	final List<FeedFacts>? facts = jsonConvert.convertListNotNull<FeedFacts>(json['facts']);
	if (facts != null) {
		feedEntity.facts = facts;
	}
	return feedEntity;
}

Map<String, dynamic> $FeedEntityToJson(FeedEntity entity) {
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
	data['badges'] =  entity.badges?.map((v) => v.toJson()).toList();
	data['bucket_list_count'] = entity.bucketListCount;
	data['contents'] =  entity.contents?.map((v) => v.toJson()).toList();
	data['supply_info'] = entity.supplyInfo?.toJson();
	data['grid_info'] =  entity.gridInfo?.map((v) => v.toJson()).toList();
	data['ticket_optional'] = entity.ticketOptional;
	data['primary_description'] = entity.primaryDescription;
	data['description'] = entity.description;
	data['facts'] =  entity.facts?.map((v) => v.toJson()).toList();
	return data;
}

FeedAreaLocation $FeedAreaLocationFromJson(Map<String, dynamic> json) {
	final FeedAreaLocation feedAreaLocation = FeedAreaLocation();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		feedAreaLocation.name = name;
	}
	final String? subtitle = jsonConvert.convert<String>(json['subtitle']);
	if (subtitle != null) {
		feedAreaLocation.subtitle = subtitle;
	}
	final int? distance = jsonConvert.convert<int>(json['distance']);
	if (distance != null) {
		feedAreaLocation.distance = distance;
	}
	final String? imageUrl = jsonConvert.convert<String>(json['image_url']);
	if (imageUrl != null) {
		feedAreaLocation.imageUrl = imageUrl;
	}
	return feedAreaLocation;
}

Map<String, dynamic> $FeedAreaLocationToJson(FeedAreaLocation entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['subtitle'] = entity.subtitle;
	data['distance'] = entity.distance;
	data['image_url'] = entity.imageUrl;
	return data;
}

FeedStartingLocation $FeedStartingLocationFromJson(Map<String, dynamic> json) {
	final FeedStartingLocation feedStartingLocation = FeedStartingLocation();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		feedStartingLocation.name = name;
	}
	final String? subtitle = jsonConvert.convert<String>(json['subtitle']);
	if (subtitle != null) {
		feedStartingLocation.subtitle = subtitle;
	}
	final int? distance = jsonConvert.convert<int>(json['distance']);
	if (distance != null) {
		feedStartingLocation.distance = distance;
	}
	final String? imageUrl = jsonConvert.convert<String>(json['image_url']);
	if (imageUrl != null) {
		feedStartingLocation.imageUrl = imageUrl;
	}
	return feedStartingLocation;
}

Map<String, dynamic> $FeedStartingLocationToJson(FeedStartingLocation entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['subtitle'] = entity.subtitle;
	data['distance'] = entity.distance;
	data['image_url'] = entity.imageUrl;
	return data;
}

FeedBadges $FeedBadgesFromJson(Map<String, dynamic> json) {
	final FeedBadges feedBadges = FeedBadges();
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		feedBadges.title = title;
	}
	final String? icon = jsonConvert.convert<String>(json['icon']);
	if (icon != null) {
		feedBadges.icon = icon;
	}
	final String? colorScheme = jsonConvert.convert<String>(json['color_scheme']);
	if (colorScheme != null) {
		feedBadges.colorScheme = colorScheme;
	}
	return feedBadges;
}

Map<String, dynamic> $FeedBadgesToJson(FeedBadges entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['title'] = entity.title;
	data['icon'] = entity.icon;
	data['color_scheme'] = entity.colorScheme;
	return data;
}

FeedContents $FeedContentsFromJson(Map<String, dynamic> json) {
	final FeedContents feedContents = FeedContents();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		feedContents.id = id;
	}
	final String? contentType = jsonConvert.convert<String>(json['content_type']);
	if (contentType != null) {
		feedContents.contentType = contentType;
	}
	final String? contentMode = jsonConvert.convert<String>(json['content_mode']);
	if (contentMode != null) {
		feedContents.contentMode = contentMode;
	}
	final String? contentUrl = jsonConvert.convert<String>(json['content_url']);
	if (contentUrl != null) {
		feedContents.contentUrl = contentUrl;
	}
	final FeedContentsContentSource? contentSource = jsonConvert.convert<FeedContentsContentSource>(json['content_source']);
	if (contentSource != null) {
		feedContents.contentSource = contentSource;
	}
	final bool? isHeaderForThePlan = jsonConvert.convert<bool>(json['is_header_for_the_plan']);
	if (isHeaderForThePlan != null) {
		feedContents.isHeaderForThePlan = isHeaderForThePlan;
	}
	final bool? isPrivate = jsonConvert.convert<bool>(json['is_private']);
	if (isPrivate != null) {
		feedContents.isPrivate = isPrivate;
	}
	return feedContents;
}

Map<String, dynamic> $FeedContentsToJson(FeedContents entity) {
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

FeedContentsContentSource $FeedContentsContentSourceFromJson(Map<String, dynamic> json) {
	final FeedContentsContentSource feedContentsContentSource = FeedContentsContentSource();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		feedContentsContentSource.id = id;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		feedContentsContentSource.title = title;
	}
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		feedContentsContentSource.author = author;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		feedContentsContentSource.name = name;
	}
	final String? icon = jsonConvert.convert<String>(json['icon']);
	if (icon != null) {
		feedContentsContentSource.icon = icon;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		feedContentsContentSource.url = url;
	}
	final String? creator = jsonConvert.convert<String>(json['creator']);
	if (creator != null) {
		feedContentsContentSource.creator = creator;
	}
	return feedContentsContentSource;
}

Map<String, dynamic> $FeedContentsContentSourceToJson(FeedContentsContentSource entity) {
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

FeedSupplyInfo $FeedSupplyInfoFromJson(Map<String, dynamic> json) {
	final FeedSupplyInfo feedSupplyInfo = FeedSupplyInfo();
	final String? supplierName = jsonConvert.convert<String>(json['supplier_name']);
	if (supplierName != null) {
		feedSupplyInfo.supplierName = supplierName;
	}
	final String? priceTitle = jsonConvert.convert<String>(json['price_title']);
	if (priceTitle != null) {
		feedSupplyInfo.priceTitle = priceTitle;
	}
	final String? priceSubtitle = jsonConvert.convert<String>(json['price_subtitle']);
	if (priceSubtitle != null) {
		feedSupplyInfo.priceSubtitle = priceSubtitle;
	}
	final String? buttonType = jsonConvert.convert<String>(json['button_type']);
	if (buttonType != null) {
		feedSupplyInfo.buttonType = buttonType;
	}
	final String? link = jsonConvert.convert<String>(json['link']);
	if (link != null) {
		feedSupplyInfo.link = link;
	}
	return feedSupplyInfo;
}

Map<String, dynamic> $FeedSupplyInfoToJson(FeedSupplyInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['supplier_name'] = entity.supplierName;
	data['price_title'] = entity.priceTitle;
	data['price_subtitle'] = entity.priceSubtitle;
	data['button_type'] = entity.buttonType;
	data['link'] = entity.link;
	return data;
}

FeedGridInfo $FeedGridInfoFromJson(Map<String, dynamic> json) {
	final FeedGridInfo feedGridInfo = FeedGridInfo();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		feedGridInfo.name = name;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		feedGridInfo.value = value;
	}
	final String? iconUrl = jsonConvert.convert<String>(json['icon_url']);
	if (iconUrl != null) {
		feedGridInfo.iconUrl = iconUrl;
	}
	final String? schema = jsonConvert.convert<String>(json['schema']);
	if (schema != null) {
		feedGridInfo.schema = schema;
	}
	return feedGridInfo;
}

Map<String, dynamic> $FeedGridInfoToJson(FeedGridInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['value'] = entity.value;
	data['icon_url'] = entity.iconUrl;
	data['schema'] = entity.schema;
	return data;
}

FeedFacts $FeedFactsFromJson(Map<String, dynamic> json) {
	final FeedFacts feedFacts = FeedFacts();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		feedFacts.name = name;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		feedFacts.value = value;
	}
	final String? unit = jsonConvert.convert<String>(json['unit']);
	if (unit != null) {
		feedFacts.unit = unit;
	}
	final String? iconUrl = jsonConvert.convert<String>(json['icon_url']);
	if (iconUrl != null) {
		feedFacts.iconUrl = iconUrl;
	}
	final String? displaySection = jsonConvert.convert<String>(json['display_section']);
	if (displaySection != null) {
		feedFacts.displaySection = displaySection;
	}
	final int? factDefinitionId = jsonConvert.convert<int>(json['fact_definition_id']);
	if (factDefinitionId != null) {
		feedFacts.factDefinitionId = factDefinitionId;
	}
	final int? adventureFactId = jsonConvert.convert<int>(json['adventure_fact_id']);
	if (adventureFactId != null) {
		feedFacts.adventureFactId = adventureFactId;
	}
	final String? backgroundColor = jsonConvert.convert<String>(json['background_color']);
	if (backgroundColor != null) {
		feedFacts.backgroundColor = backgroundColor;
	}
	final String? iconColor = jsonConvert.convert<String>(json['icon_color']);
	if (iconColor != null) {
		feedFacts.iconColor = iconColor;
	}
	final String? textColor = jsonConvert.convert<String>(json['text_color']);
	if (textColor != null) {
		feedFacts.textColor = textColor;
	}
	return feedFacts;
}

Map<String, dynamic> $FeedFactsToJson(FeedFacts entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['value'] = entity.value;
	data['unit'] = entity.unit;
	data['icon_url'] = entity.iconUrl;
	data['display_section'] = entity.displaySection;
	data['fact_definition_id'] = entity.factDefinitionId;
	data['adventure_fact_id'] = entity.adventureFactId;
	data['background_color'] = entity.backgroundColor;
	data['icon_color'] = entity.iconColor;
	data['text_color'] = entity.textColor;
	return data;
}