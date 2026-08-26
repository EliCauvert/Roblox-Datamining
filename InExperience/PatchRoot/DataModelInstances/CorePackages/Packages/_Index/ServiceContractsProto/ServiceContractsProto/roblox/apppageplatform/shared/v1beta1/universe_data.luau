local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local _ = require(script.Parent.custom_options)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		id = if p1 == nil or p1.id == nil then nil else p1.id,
		name = if p1 == nil or p1.name == nil then nil else p1.name,
		description = if p1 == nil or p1.description == nil then nil else p1.description,
		root_place_id = if p1 == nil or p1.root_place_id == nil then nil else p1.root_place_id,
		creator_type = if p1 == nil or p1.creator_type == nil then nil else p1.creator_type,
		creator_id = if p1 == nil or p1.creator_id == nil then nil else p1.creator_id,
		player_count = if p1 == nil or p1.player_count == nil then nil else p1.player_count,
		total_up_votes = if p1 == nil or p1.total_up_votes == nil then nil else p1.total_up_votes,
		total_down_votes = if p1 == nil or p1.total_down_votes == nil then nil else p1.total_down_votes,
		is_voice_supported = if p1 == nil or p1.is_voice_supported == nil then nil else p1.is_voice_supported,
		is_camera_supported = if p1 == nil or p1.is_camera_supported == nil then nil else p1.is_camera_supported,
		localized_fiat_price = if p1 == nil or p1.localized_fiat_price == nil then nil else p1.localized_fiat_price,
		genre_l1 = if p1 == nil or p1.genre_l1 == nil then nil else p1.genre_l1,
		genre_l2 = if p1 == nil or p1.genre_l2 == nil then nil else p1.genre_l2,
		maximum_server_size = if p1 == nil or p1.maximum_server_size == nil then nil else p1.maximum_server_size,
		created_date = if p1 == nil or p1.created_date == nil then nil else p1.created_date,
		updated_date = if p1 == nil or p1.updated_date == nil then nil else p1.updated_date,
		favorite_count = if p1 == nil or p1.favorite_count == nil then nil else p1.favorite_count,
		total_visits = if p1 == nil or p1.total_visits == nil then nil else p1.total_visits,
		canonical_url_path = if p1 == nil or p1.canonical_url_path == nil then nil else p1.canonical_url_path,
		game_minimum_age = if p1 == nil or p1.game_minimum_age == nil then nil else p1.game_minimum_age,
		game_age_display_name = if p1 == nil or p1.game_age_display_name == nil then nil else p1.game_age_display_name,
		content_maturity = if p1 == nil or p1.content_maturity == nil then nil else p1.content_maturity,
		is_officially_licensed = if p1 == nil or p1.is_officially_licensed == nil then nil else p1.is_officially_licensed,
		refund_policy_text = if p1 == nil or p1.refund_policy_text == nil then nil else p1.refund_policy_text,
		refund_article_id = if p1 == nil or p1.refund_article_id == nil then nil else p1.refund_article_id,
		preview_video_id = if p1 == nil or p1.preview_video_id == nil then nil else p1.preview_video_id,
		creation_source = if p1 == nil or p1.creation_source == nil then nil else p1.creation_source
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.id ~= nil then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var7 = protoModule.writeVarInt(var2, var3, self.id)
		buff = var2
		var1 = var3
	end
	if self.name ~= nil then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var9 = protoModule.writeString(var4, var5, self.name)
		buff = var4
		var1 = var5
	end
	if self.description ~= nil then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var11 = protoModule.writeString(var6, var7, self.description)
		buff = var6
		var1 = var7
	end
	if self.root_place_id ~= nil then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.varint)
		var8, var13 = protoModule.writeVarInt(var8, var9, self.root_place_id)
		buff = var8
		var1 = var9
	end
	if self.creator_type ~= nil then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var10, var15 = protoModule.writeString(var10, var11, self.creator_type)
		buff = var10
		var1 = var11
	end
	if self.creator_id ~= nil then
		local var12, var13 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.varint)
		var12, var17 = protoModule.writeVarInt(var12, var13, self.creator_id)
		buff = var12
		var1 = var13
	end
	if self.player_count ~= nil then
		local var14, var15 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.varint)
		var14, var19 = protoModule.writeVarInt(var14, var15, self.player_count)
		buff = var14
		var1 = var15
	end
	if self.total_up_votes ~= nil then
		local var16, var17 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.varint)
		var16, var21 = protoModule.writeVarInt(var16, var17, self.total_up_votes)
		buff = var16
		var1 = var17
	end
	if self.total_down_votes ~= nil then
		local var18, var19 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.varint)
		var18, var23 = protoModule.writeVarInt(var18, var19, self.total_down_votes)
		buff = var18
		var1 = var19
	end
	if self.is_voice_supported ~= nil then
		local var20, var21 = protoModule.writeTag(buff, var1, 10, protoModule.wireTypes.varint)
		var20, var25 = protoModule.writeVarInt(var20, var21, if self.is_voice_supported then 1 else 0)
		buff = var20
		var1 = var21
	end
	if self.is_camera_supported ~= nil then
		local var22, var23 = protoModule.writeTag(buff, var1, 11, protoModule.wireTypes.varint)
		var22, var27 = protoModule.writeVarInt(var22, var23, if self.is_camera_supported then 1 else 0)
		buff = var22
		var1 = var23
	end
	if self.localized_fiat_price ~= nil then
		local var24, var25 = protoModule.writeTag(buff, var1, 12, protoModule.wireTypes.lengthDelimited)
		var24, var29 = protoModule.writeString(var24, var25, self.localized_fiat_price)
		buff = var24
		var1 = var25
	end
	if self.genre_l1 ~= nil then
		local var26, var27 = protoModule.writeTag(buff, var1, 13, protoModule.wireTypes.lengthDelimited)
		var26, var31 = protoModule.writeString(var26, var27, self.genre_l1)
		buff = var26
		var1 = var27
	end
	if self.genre_l2 ~= nil then
		local var28, var29 = protoModule.writeTag(buff, var1, 14, protoModule.wireTypes.lengthDelimited)
		var28, var33 = protoModule.writeString(var28, var29, self.genre_l2)
		buff = var28
		var1 = var29
	end
	if self.maximum_server_size ~= nil then
		local var30, var31 = protoModule.writeTag(buff, var1, 15, protoModule.wireTypes.varint)
		var30, var35 = protoModule.writeVarInt(var30, var31, self.maximum_server_size)
		buff = var30
		var1 = var31
	end
	if self.created_date ~= nil then
		local var32, var33 = protoModule.writeTag(buff, var1, 16, protoModule.wireTypes.lengthDelimited)
		var32, var37 = protoModule.writeString(var32, var33, self.created_date)
		buff = var32
		var1 = var33
	end
	if self.updated_date ~= nil then
		local var34, var35 = protoModule.writeTag(buff, var1, 17, protoModule.wireTypes.lengthDelimited)
		var34, var39 = protoModule.writeString(var34, var35, self.updated_date)
		buff = var34
		var1 = var35
	end
	if self.favorite_count ~= nil then
		local var36, var37 = protoModule.writeTag(buff, var1, 18, protoModule.wireTypes.varint)
		var36, var41 = protoModule.writeVarInt(var36, var37, self.favorite_count)
		buff = var36
		var1 = var37
	end
	if self.total_visits ~= nil then
		local var38, var39 = protoModule.writeTag(buff, var1, 19, protoModule.wireTypes.varint)
		var38, var43 = protoModule.writeVarInt(var38, var39, self.total_visits)
		buff = var38
		var1 = var39
	end
	if self.canonical_url_path ~= nil then
		local var40, var41 = protoModule.writeTag(buff, var1, 20, protoModule.wireTypes.lengthDelimited)
		var40, var45 = protoModule.writeString(var40, var41, self.canonical_url_path)
		buff = var40
		var1 = var41
	end
	if self.game_minimum_age ~= nil then
		local var42, var43 = protoModule.writeTag(buff, var1, 21, protoModule.wireTypes.varint)
		var42, var47 = protoModule.writeVarInt(var42, var43, self.game_minimum_age)
		buff = var42
		var1 = var43
	end
	if self.game_age_display_name ~= nil then
		local var44, var45 = protoModule.writeTag(buff, var1, 22, protoModule.wireTypes.lengthDelimited)
		var44, var49 = protoModule.writeString(var44, var45, self.game_age_display_name)
		buff = var44
		var1 = var45
	end
	if self.content_maturity ~= nil then
		local var46, var47 = protoModule.writeTag(buff, var1, 23, protoModule.wireTypes.lengthDelimited)
		var46, var51 = protoModule.writeString(var46, var47, self.content_maturity)
		buff = var46
		var1 = var47
	end
	if self.is_officially_licensed ~= nil then
		local var48, var49 = protoModule.writeTag(buff, var1, 24, protoModule.wireTypes.varint)
		var48, var53 = protoModule.writeVarInt(var48, var49, if self.is_officially_licensed then 1 else 0)
		buff = var48
		var1 = var49
	end
	if self.refund_policy_text ~= nil then
		local var50, var51 = protoModule.writeTag(buff, var1, 25, protoModule.wireTypes.lengthDelimited)
		var50, var55 = protoModule.writeString(var50, var51, self.refund_policy_text)
		buff = var50
		var1 = var51
	end
	if self.refund_article_id ~= nil then
		local var52, var53 = protoModule.writeTag(buff, var1, 26, protoModule.wireTypes.lengthDelimited)
		var52, var57 = protoModule.writeString(var52, var53, self.refund_article_id)
		buff = var52
		var1 = var53
	end
	if self.preview_video_id ~= nil then
		local var54, var55 = protoModule.writeTag(buff, var1, 27, protoModule.wireTypes.varint)
		var54, var59 = protoModule.writeVarInt(var54, var55, self.preview_video_id)
		buff = var54
		var1 = var55
	end
	if self.creation_source ~= nil then
		local var56, var57 = protoModule.writeTag(buff, var1, 28, protoModule.wireTypes.lengthDelimited)
		var56, var61 = protoModule.writeString(var56, var57, self.creation_source)
		buff = var56
		var1 = var57
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref)
	local var1 = t_1.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI64(p1, var2)
				var2 = var9
				var1.id = var8
			elseif var7 == 4 then
				local _ = nil
				local var10, var11 = protoModule.readVarIntI64(p1, var2)
				var2 = var11
				var1.root_place_id = var10
			elseif var7 == 6 then
				local _ = nil
				local var12, var13 = protoModule.readVarIntI64(p1, var2)
				var2 = var13
				var1.creator_id = var12
			elseif var7 == 7 then
				local _ = nil
				local var14, var15 = protoModule.readVarIntI64(p1, var2)
				var2 = var15
				var1.player_count = var14
			elseif var7 == 8 then
				local _ = nil
				local var16, var17 = protoModule.readVarIntI64(p1, var2)
				var2 = var17
				var1.total_up_votes = var16
			elseif var7 == 9 then
				local _ = nil
				local var18, var19 = protoModule.readVarIntI64(p1, var2)
				var2 = var19
				var1.total_down_votes = var18
			elseif var7 == 10 then
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var2)
				var2 = var21
				var1.is_voice_supported = var20 ~= 0
			elseif var7 == 11 then
				local _ = nil
				local var22, var23 = protoModule.readVarInt(p1, var2)
				var2 = var23
				var1.is_camera_supported = var22 ~= 0
			elseif var7 == 15 then
				local _ = nil
				local var24, var25 = protoModule.readVarIntI64(p1, var2)
				var2 = var25
				var1.maximum_server_size = var24
			elseif var7 == 18 then
				local _ = nil
				local var26, var27 = protoModule.readVarIntI64(p1, var2)
				var2 = var27
				var1.favorite_count = var26
			elseif var7 == 19 then
				local _ = nil
				local var28, var29 = protoModule.readVarIntI64(p1, var2)
				var2 = var29
				var1.total_visits = var28
			elseif var7 == 21 then
				local _ = nil
				local var30, var31 = protoModule.readVarIntI32(p1, var2)
				var2 = var31
				var1.game_minimum_age = var30
			elseif var7 == 24 then
				local _ = nil
				local var32, var33 = protoModule.readVarInt(p1, var2)
				var2 = var33
				var1.is_officially_licensed = var32 ~= 0
			elseif var7 == 27 then
				local _ = nil
				local var34, var35 = protoModule.readVarIntI64(p1, var2)
				var2 = var35
				var1.preview_video_id = var34
			else
				local _ = nil
				local var36, var37 = protoModule.readVarInt(p1, var2)
				local _ = var36
				var2 = var37
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var38, var39 = protoModule.readBuffer(p1, var2)
				var2 = var39
				var1.name = buffer.tostring(var38)
			elseif var7 == 3 then
				local _ = nil
				local var40, var41 = protoModule.readBuffer(p1, var2)
				var2 = var41
				var1.description = buffer.tostring(var40)
			elseif var7 == 5 then
				local _ = nil
				local var42, var43 = protoModule.readBuffer(p1, var2)
				var2 = var43
				var1.creator_type = buffer.tostring(var42)
			elseif var7 == 12 then
				local _ = nil
				local var44, var45 = protoModule.readBuffer(p1, var2)
				var2 = var45
				var1.localized_fiat_price = buffer.tostring(var44)
			elseif var7 == 13 then
				local _ = nil
				local var46, var47 = protoModule.readBuffer(p1, var2)
				var2 = var47
				var1.genre_l1 = buffer.tostring(var46)
			elseif var7 == 14 then
				local _ = nil
				local var48, var49 = protoModule.readBuffer(p1, var2)
				var2 = var49
				var1.genre_l2 = buffer.tostring(var48)
			elseif var7 == 16 then
				local _ = nil
				local var50, var51 = protoModule.readBuffer(p1, var2)
				var2 = var51
				var1.created_date = buffer.tostring(var50)
			elseif var7 == 17 then
				local _ = nil
				local var52, var53 = protoModule.readBuffer(p1, var2)
				var2 = var53
				var1.updated_date = buffer.tostring(var52)
			elseif var7 == 20 then
				local _ = nil
				local var54, var55 = protoModule.readBuffer(p1, var2)
				var2 = var55
				var1.canonical_url_path = buffer.tostring(var54)
			elseif var7 == 22 then
				local _ = nil
				local var56, var57 = protoModule.readBuffer(p1, var2)
				var2 = var57
				var1.game_age_display_name = buffer.tostring(var56)
			elseif var7 == 23 then
				local _ = nil
				local var58, var59 = protoModule.readBuffer(p1, var2)
				var2 = var59
				var1.content_maturity = buffer.tostring(var58)
			elseif var7 == 25 then
				local _ = nil
				local var60, var61 = protoModule.readBuffer(p1, var2)
				var2 = var61
				var1.refund_policy_text = buffer.tostring(var60)
			elseif var7 == 26 then
				local _ = nil
				local var62, var63 = protoModule.readBuffer(p1, var2)
				var2 = var63
				var1.refund_article_id = buffer.tostring(var62)
			elseif var7 == 28 then
				local _ = nil
				local var64, var65 = protoModule.readBuffer(p1, var2)
				var2 = var65
				var1.creation_source = buffer.tostring(var64)
			else
				local _ = nil
				local var66, var67 = protoModule.readVarInt(p1, var2)
				var2 = var67 + var66
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var68, var69 = protoModule.readFixed32(p1, var2)
			local _ = var68
			var2 = var69
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var70, var71 = protoModule.readFixed64(p1, var2)
			local _ = var70
			var2 = var71
		else
			error("Unsupported wire type: " .. var65)
		end
	end
	return var1
end

function t_1:jsonEncode()
	local t = {}
	
	if self.id ~= nil then
		t.id = self.id
	end
	if self.name ~= nil then
		t.name = self.name
	end
	if self.description ~= nil then
		t.description = self.description
	end
	if self.root_place_id ~= nil then
		t.rootPlaceId = self.root_place_id
	end
	if self.creator_type ~= nil then
		t.creatorType = self.creator_type
	end
	if self.creator_id ~= nil then
		t.creatorId = self.creator_id
	end
	if self.player_count ~= nil then
		t.playerCount = self.player_count
	end
	if self.total_up_votes ~= nil then
		t.totalUpVotes = self.total_up_votes
	end
	if self.total_down_votes ~= nil then
		t.totalDownVotes = self.total_down_votes
	end
	if self.is_voice_supported ~= nil then
		t.isVoiceSupported = self.is_voice_supported
	end
	if self.is_camera_supported ~= nil then
		t.isCameraSupported = self.is_camera_supported
	end
	if self.localized_fiat_price ~= nil then
		t.localizedFiatPrice = self.localized_fiat_price
	end
	if self.genre_l1 ~= nil then
		t.genreL1 = self.genre_l1
	end
	if self.genre_l2 ~= nil then
		t.genreL2 = self.genre_l2
	end
	if self.maximum_server_size ~= nil then
		t.maximumServerSize = self.maximum_server_size
	end
	if self.created_date ~= nil then
		t.createdDate = self.created_date
	end
	if self.updated_date ~= nil then
		t.updatedDate = self.updated_date
	end
	if self.favorite_count ~= nil then
		t.favoriteCount = self.favorite_count
	end
	if self.total_visits ~= nil then
		t.totalVisits = self.total_visits
	end
	if self.canonical_url_path ~= nil then
		t.canonicalUrlPath = self.canonical_url_path
	end
	if self.game_minimum_age ~= nil then
		t.gameMinimumAge = self.game_minimum_age
	end
	if self.game_age_display_name ~= nil then
		t.gameAgeDisplayName = self.game_age_display_name
	end
	if self.content_maturity ~= nil then
		t.contentMaturity = self.content_maturity
	end
	if self.is_officially_licensed ~= nil then
		t.isOfficiallyLicensed = self.is_officially_licensed
	end
	if self.refund_policy_text ~= nil then
		t.refundPolicyText = self.refund_policy_text
	end
	if self.refund_article_id ~= nil then
		t.refundArticleId = self.refund_article_id
	end
	if self.preview_video_id ~= nil then
		t.previewVideoId = self.preview_video_id
	end
	if self.creation_source ~= nil then
		t.creationSource = self.creation_source
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var72 = t_1.new()
	
	if self.id ~= nil then
		var72.id = self.id
	end
	if self.name ~= nil then
		var72.name = self.name
	end
	if self.description ~= nil then
		var72.description = self.description
	end
	if self.root_place_id ~= nil then
		var72.root_place_id = self.root_place_id
	end
	if self.rootPlaceId ~= nil then
		var72.root_place_id = self.rootPlaceId
	end
	if self.creator_type ~= nil then
		var72.creator_type = self.creator_type
	end
	if self.creatorType ~= nil then
		var72.creator_type = self.creatorType
	end
	if self.creator_id ~= nil then
		var72.creator_id = self.creator_id
	end
	if self.creatorId ~= nil then
		var72.creator_id = self.creatorId
	end
	if self.player_count ~= nil then
		var72.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		var72.player_count = self.playerCount
	end
	if self.total_up_votes ~= nil then
		var72.total_up_votes = self.total_up_votes
	end
	if self.totalUpVotes ~= nil then
		var72.total_up_votes = self.totalUpVotes
	end
	if self.total_down_votes ~= nil then
		var72.total_down_votes = self.total_down_votes
	end
	if self.totalDownVotes ~= nil then
		var72.total_down_votes = self.totalDownVotes
	end
	if self.is_voice_supported ~= nil then
		var72.is_voice_supported = self.is_voice_supported
	end
	if self.isVoiceSupported ~= nil then
		var72.is_voice_supported = self.isVoiceSupported
	end
	if self.is_camera_supported ~= nil then
		var72.is_camera_supported = self.is_camera_supported
	end
	if self.isCameraSupported ~= nil then
		var72.is_camera_supported = self.isCameraSupported
	end
	if self.localized_fiat_price ~= nil then
		var72.localized_fiat_price = self.localized_fiat_price
	end
	if self.localizedFiatPrice ~= nil then
		var72.localized_fiat_price = self.localizedFiatPrice
	end
	if self.genre_l1 ~= nil then
		var72.genre_l1 = self.genre_l1
	end
	if self.genreL1 ~= nil then
		var72.genre_l1 = self.genreL1
	end
	if self.genre_l2 ~= nil then
		var72.genre_l2 = self.genre_l2
	end
	if self.genreL2 ~= nil then
		var72.genre_l2 = self.genreL2
	end
	if self.maximum_server_size ~= nil then
		var72.maximum_server_size = self.maximum_server_size
	end
	if self.maximumServerSize ~= nil then
		var72.maximum_server_size = self.maximumServerSize
	end
	if self.created_date ~= nil then
		var72.created_date = self.created_date
	end
	if self.createdDate ~= nil then
		var72.created_date = self.createdDate
	end
	if self.updated_date ~= nil then
		var72.updated_date = self.updated_date
	end
	if self.updatedDate ~= nil then
		var72.updated_date = self.updatedDate
	end
	if self.favorite_count ~= nil then
		var72.favorite_count = self.favorite_count
	end
	if self.favoriteCount ~= nil then
		var72.favorite_count = self.favoriteCount
	end
	if self.total_visits ~= nil then
		var72.total_visits = self.total_visits
	end
	if self.totalVisits ~= nil then
		var72.total_visits = self.totalVisits
	end
	if self.canonical_url_path ~= nil then
		var72.canonical_url_path = self.canonical_url_path
	end
	if self.canonicalUrlPath ~= nil then
		var72.canonical_url_path = self.canonicalUrlPath
	end
	if self.game_minimum_age ~= nil then
		var72.game_minimum_age = self.game_minimum_age
	end
	if self.gameMinimumAge ~= nil then
		var72.game_minimum_age = self.gameMinimumAge
	end
	if self.game_age_display_name ~= nil then
		var72.game_age_display_name = self.game_age_display_name
	end
	if self.gameAgeDisplayName ~= nil then
		var72.game_age_display_name = self.gameAgeDisplayName
	end
	if self.content_maturity ~= nil then
		var72.content_maturity = self.content_maturity
	end
	if self.contentMaturity ~= nil then
		var72.content_maturity = self.contentMaturity
	end
	if self.is_officially_licensed ~= nil then
		var72.is_officially_licensed = self.is_officially_licensed
	end
	if self.isOfficiallyLicensed ~= nil then
		var72.is_officially_licensed = self.isOfficiallyLicensed
	end
	if self.refund_policy_text ~= nil then
		var72.refund_policy_text = self.refund_policy_text
	end
	if self.refundPolicyText ~= nil then
		var72.refund_policy_text = self.refundPolicyText
	end
	if self.refund_article_id ~= nil then
		var72.refund_article_id = self.refund_article_id
	end
	if self.refundArticleId ~= nil then
		var72.refund_article_id = self.refundArticleId
	end
	if self.preview_video_id ~= nil then
		var72.preview_video_id = self.preview_video_id
	end
	if self.previewVideoId ~= nil then
		var72.preview_video_id = self.previewVideoId
	end
	if self.creation_source ~= nil then
		var72.creation_source = self.creation_source
	end
	if self.creationSource ~= nil then
		var72.creation_source = self.creationSource
	end
	return var72
end

t_1.descriptor = {
	name = "UniverseData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseData"
}
t.UniverseData = t_1
typeRegistryModule.default:register(t.UniverseData)

return { UniverseData = t.UniverseData }