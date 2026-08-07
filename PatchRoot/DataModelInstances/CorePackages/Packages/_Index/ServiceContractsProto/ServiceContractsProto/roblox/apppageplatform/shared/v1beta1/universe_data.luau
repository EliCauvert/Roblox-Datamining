-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:18 2026 Pacific Standard Time.

local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 91 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		id = if p0 == nil or p0.id == nil then nil else p0.id,
		name = if p0 == nil or p0.name == nil then nil else p0.name,
		description = if p0 == nil or p0.description == nil then nil else p0.description,
		root_place_id = if p0 == nil or p0.root_place_id == nil then nil else p0.root_place_id,
		creator_type = if p0 == nil or p0.creator_type == nil then nil else p0.creator_type,
		creator_id = if p0 == nil or p0.creator_id == nil then nil else p0.creator_id,
		player_count = if p0 == nil or p0.player_count == nil then nil else p0.player_count,
		total_up_votes = if p0 == nil or p0.total_up_votes == nil then nil else p0.total_up_votes,
		total_down_votes = if p0 == nil or p0.total_down_votes == nil then nil else p0.total_down_votes,
		is_voice_supported = if p0 == nil or p0.is_voice_supported == nil then nil else p0.is_voice_supported,
		is_camera_supported = if p0 == nil or p0.is_camera_supported == nil then nil else p0.is_camera_supported,
		localized_fiat_price = if p0 == nil or p0.localized_fiat_price == nil then nil else p0.localized_fiat_price,
		genre_l1 = if p0 == nil or p0.genre_l1 == nil then nil else p0.genre_l1,
		genre_l2 = if p0 == nil or p0.genre_l2 == nil then nil else p0.genre_l2,
		maximum_server_size = if p0 == nil or p0.maximum_server_size == nil then nil else p0.maximum_server_size,
		created_date = if p0 == nil or p0.created_date == nil then nil else p0.created_date,
		updated_date = if p0 == nil or p0.updated_date == nil then nil else p0.updated_date,
		favorite_count = if p0 == nil or p0.favorite_count == nil then nil else p0.favorite_count,
		total_visits = if p0 == nil or p0.total_visits == nil then nil else p0.total_visits,
		canonical_url_path = if p0 == nil or p0.canonical_url_path == nil then nil else p0.canonical_url_path,
		game_minimum_age = if p0 == nil or p0.game_minimum_age == nil then nil else p0.game_minimum_age,
		game_age_display_name = if p0 == nil or p0.game_age_display_name == nil then nil else p0.game_age_display_name,
		content_maturity = if p0 == nil or p0.content_maturity == nil then nil else p0.content_maturity,
		is_officially_licensed = if p0 == nil or p0.is_officially_licensed == nil then nil else p0.is_officially_licensed,
		refund_policy_text = if p0 == nil or p0.refund_policy_text == nil then nil else p0.refund_policy_text,
		refund_article_id = if p0 == nil or p0.refund_article_id == nil then nil else p0.refund_article_id,
		preview_video_id = if p0 == nil or p0.preview_video_id == nil then nil else p0.preview_video_id
	}, t_1)
end

function t_1:encode() --[[ line: 133 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5 = 0
	
	if self.id ~= nil then
		local var6, var7 = protoModule.writeTag(buff, var5, 1, protoModule.wireTypes.varint)
		var6, var7 = protoModule.writeVarInt(var6, var7, self.id)
		buff = var6
		var5 = var7
	end
	if self.name ~= nil then
		local var8, var9 = protoModule.writeTag(buff, var5, 2, protoModule.wireTypes.lengthDelimited)
		var8, var9 = protoModule.writeString(var8, var9, self.name)
		buff = var8
		var5 = var9
	end
	if self.description ~= nil then
		local var10, var11 = protoModule.writeTag(buff, var5, 3, protoModule.wireTypes.lengthDelimited)
		var10, var11 = protoModule.writeString(var10, var11, self.description)
		buff = var10
		var5 = var11
	end
	if self.root_place_id ~= nil then
		local var12, var13 = protoModule.writeTag(buff, var5, 4, protoModule.wireTypes.varint)
		var12, var13 = protoModule.writeVarInt(var12, var13, self.root_place_id)
		buff = var12
		var5 = var13
	end
	if self.creator_type ~= nil then
		local var14, var15 = protoModule.writeTag(buff, var5, 5, protoModule.wireTypes.lengthDelimited)
		var14, var15 = protoModule.writeString(var14, var15, self.creator_type)
		buff = var14
		var5 = var15
	end
	if self.creator_id ~= nil then
		local var16, var17 = protoModule.writeTag(buff, var5, 6, protoModule.wireTypes.varint)
		var16, var17 = protoModule.writeVarInt(var16, var17, self.creator_id)
		buff = var16
		var5 = var17
	end
	if self.player_count ~= nil then
		local var18, var19 = protoModule.writeTag(buff, var5, 7, protoModule.wireTypes.varint)
		var18, var19 = protoModule.writeVarInt(var18, var19, self.player_count)
		buff = var18
		var5 = var19
	end
	if self.total_up_votes ~= nil then
		local var20, var21 = protoModule.writeTag(buff, var5, 8, protoModule.wireTypes.varint)
		var20, var21 = protoModule.writeVarInt(var20, var21, self.total_up_votes)
		buff = var20
		var5 = var21
	end
	if self.total_down_votes ~= nil then
		local var22, var23 = protoModule.writeTag(buff, var5, 9, protoModule.wireTypes.varint)
		var22, var23 = protoModule.writeVarInt(var22, var23, self.total_down_votes)
		buff = var22
		var5 = var23
	end
	if self.is_voice_supported ~= nil then
		local var24, var25 = protoModule.writeTag(buff, var5, 10, protoModule.wireTypes.varint)
		var24, var25 = protoModule.writeVarInt(var24, var25, if self.is_voice_supported then 1 else 0)
		buff = var24
		var5 = var25
	end
	if self.is_camera_supported ~= nil then
		local var26, var27 = protoModule.writeTag(buff, var5, 11, protoModule.wireTypes.varint)
		var26, var27 = protoModule.writeVarInt(var26, var27, if self.is_camera_supported then 1 else 0)
		buff = var26
		var5 = var27
	end
	if self.localized_fiat_price ~= nil then
		local var28, var29 = protoModule.writeTag(buff, var5, 12, protoModule.wireTypes.lengthDelimited)
		var28, var29 = protoModule.writeString(var28, var29, self.localized_fiat_price)
		buff = var28
		var5 = var29
	end
	if self.genre_l1 ~= nil then
		local var30, var31 = protoModule.writeTag(buff, var5, 13, protoModule.wireTypes.lengthDelimited)
		var30, var31 = protoModule.writeString(var30, var31, self.genre_l1)
		buff = var30
		var5 = var31
	end
	if self.genre_l2 ~= nil then
		local var32, var33 = protoModule.writeTag(buff, var5, 14, protoModule.wireTypes.lengthDelimited)
		var32, var33 = protoModule.writeString(var32, var33, self.genre_l2)
		buff = var32
		var5 = var33
	end
	if self.maximum_server_size ~= nil then
		local var34, var35 = protoModule.writeTag(buff, var5, 15, protoModule.wireTypes.varint)
		var34, var35 = protoModule.writeVarInt(var34, var35, self.maximum_server_size)
		buff = var34
		var5 = var35
	end
	if self.created_date ~= nil then
		local var36, var37 = protoModule.writeTag(buff, var5, 16, protoModule.wireTypes.lengthDelimited)
		var36, var37 = protoModule.writeString(var36, var37, self.created_date)
		buff = var36
		var5 = var37
	end
	if self.updated_date ~= nil then
		local var38, var39 = protoModule.writeTag(buff, var5, 17, protoModule.wireTypes.lengthDelimited)
		var38, var39 = protoModule.writeString(var38, var39, self.updated_date)
		buff = var38
		var5 = var39
	end
	if self.favorite_count ~= nil then
		local var40, var41 = protoModule.writeTag(buff, var5, 18, protoModule.wireTypes.varint)
		var40, var41 = protoModule.writeVarInt(var40, var41, self.favorite_count)
		buff = var40
		var5 = var41
	end
	if self.total_visits ~= nil then
		local var42, var43 = protoModule.writeTag(buff, var5, 19, protoModule.wireTypes.varint)
		var42, var43 = protoModule.writeVarInt(var42, var43, self.total_visits)
		buff = var42
		var5 = var43
	end
	if self.canonical_url_path ~= nil then
		local var44, var45 = protoModule.writeTag(buff, var5, 20, protoModule.wireTypes.lengthDelimited)
		var44, var45 = protoModule.writeString(var44, var45, self.canonical_url_path)
		buff = var44
		var5 = var45
	end
	if self.game_minimum_age ~= nil then
		local var46, var47 = protoModule.writeTag(buff, var5, 21, protoModule.wireTypes.varint)
		var46, var47 = protoModule.writeVarInt(var46, var47, self.game_minimum_age)
		buff = var46
		var5 = var47
	end
	if self.game_age_display_name ~= nil then
		local var48, var49 = protoModule.writeTag(buff, var5, 22, protoModule.wireTypes.lengthDelimited)
		var48, var49 = protoModule.writeString(var48, var49, self.game_age_display_name)
		buff = var48
		var5 = var49
	end
	if self.content_maturity ~= nil then
		local var50, var51 = protoModule.writeTag(buff, var5, 23, protoModule.wireTypes.lengthDelimited)
		var50, var51 = protoModule.writeString(var50, var51, self.content_maturity)
		buff = var50
		var5 = var51
	end
	if self.is_officially_licensed ~= nil then
		local var52, var53 = protoModule.writeTag(buff, var5, 24, protoModule.wireTypes.varint)
		var52, var53 = protoModule.writeVarInt(var52, var53, if self.is_officially_licensed then 1 else 0)
		buff = var52
		var5 = var53
	end
	if self.refund_policy_text ~= nil then
		local var54, var55 = protoModule.writeTag(buff, var5, 25, protoModule.wireTypes.lengthDelimited)
		var54, var55 = protoModule.writeString(var54, var55, self.refund_policy_text)
		buff = var54
		var5 = var55
	end
	if self.refund_article_id ~= nil then
		local var56, var57 = protoModule.writeTag(buff, var5, 26, protoModule.wireTypes.lengthDelimited)
		var56, var57 = protoModule.writeString(var56, var57, self.refund_article_id)
		buff = var56
		var5 = var57
	end
	if self.preview_video_id ~= nil then
		local var58, var59 = protoModule.writeTag(buff, var5, 27, protoModule.wireTypes.varint)
		var58, var59 = protoModule.writeVarInt(var58, var59, self.preview_video_id)
		buff = var58
		var5 = var59
	end
	local buff_1 = buffer.create(var5)
	buffer.copy(buff_1, 0, buff, 0, var5)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 277 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
	local var61 = t_1.new()
	local var62 = 0
	while var62 < buffer.len(p1) do
		local _ = nil
		local var63 = nil
		local var64, var65, var66 = protoModule.readTag(p1, var62)
		local var67 = var64
		var63 = var65
		var62 = var66
		
		if var63 == protoModule.wireTypes.varint then
			if var67 == 1 then
				local _ = nil
				local var68, var69 = protoModule.readVarIntI64(p1, var62)
				var62 = var69
				var61.id = var68
			elseif var67 == 4 then
				local _ = nil
				local var70, var71 = protoModule.readVarIntI64(p1, var62)
				var62 = var71
				var61.root_place_id = var70
			elseif var67 == 6 then
				local _ = nil
				local var72, var73 = protoModule.readVarIntI64(p1, var62)
				var62 = var73
				var61.creator_id = var72
			elseif var67 == 7 then
				local _ = nil
				local var74, var75 = protoModule.readVarIntI64(p1, var62)
				var62 = var75
				var61.player_count = var74
			elseif var67 == 8 then
				local _ = nil
				local var76, var77 = protoModule.readVarIntI64(p1, var62)
				var62 = var77
				var61.total_up_votes = var76
			elseif var67 == 9 then
				local _ = nil
				local var78, var79 = protoModule.readVarIntI64(p1, var62)
				var62 = var79
				var61.total_down_votes = var78
			elseif var67 == 10 then
				local _ = nil
				local var80, var81 = protoModule.readVarInt(p1, var62)
				var62 = var81
				var61.is_voice_supported = var80 ~= 0
			elseif var67 == 11 then
				local _ = nil
				local var82, var83 = protoModule.readVarInt(p1, var62)
				var62 = var83
				var61.is_camera_supported = var82 ~= 0
			elseif var67 == 15 then
				local _ = nil
				local var84, var85 = protoModule.readVarIntI64(p1, var62)
				var62 = var85
				var61.maximum_server_size = var84
			elseif var67 == 18 then
				local _ = nil
				local var86, var87 = protoModule.readVarIntI64(p1, var62)
				var62 = var87
				var61.favorite_count = var86
			elseif var67 == 19 then
				local _ = nil
				local var88, var89 = protoModule.readVarIntI64(p1, var62)
				var62 = var89
				var61.total_visits = var88
			elseif var67 == 21 then
				local _ = nil
				local var90, var91 = protoModule.readVarIntI32(p1, var62)
				var62 = var91
				var61.game_minimum_age = var90
			elseif var67 == 24 then
				local _ = nil
				local var92, var93 = protoModule.readVarInt(p1, var62)
				var62 = var93
				var61.is_officially_licensed = var92 ~= 0
			elseif var67 == 27 then
				local _ = nil
				local var94, var95 = protoModule.readVarIntI64(p1, var62)
				var62 = var95
				var61.preview_video_id = var94
			else
				local _ = nil
				local var96, var97 = protoModule.readVarInt(p1, var62)
				local _ = var96
				var62 = var97
			end
		end
		if var63 == protoModule.wireTypes.lengthDelimited then
			if var67 == 2 then
				local _ = nil
				local var98, var99 = protoModule.readBuffer(p1, var62)
				var62 = var99
				var61.name = buffer.tostring(var98)
			elseif var67 == 3 then
				local _ = nil
				local var100, var101 = protoModule.readBuffer(p1, var62)
				var62 = var101
				var61.description = buffer.tostring(var100)
			elseif var67 == 5 then
				local _ = nil
				local var102, var103 = protoModule.readBuffer(p1, var62)
				var62 = var103
				var61.creator_type = buffer.tostring(var102)
			elseif var67 == 12 then
				local _ = nil
				local var104, var105 = protoModule.readBuffer(p1, var62)
				var62 = var105
				var61.localized_fiat_price = buffer.tostring(var104)
			elseif var67 == 13 then
				local _ = nil
				local var106, var107 = protoModule.readBuffer(p1, var62)
				var62 = var107
				var61.genre_l1 = buffer.tostring(var106)
			elseif var67 == 14 then
				local _ = nil
				local var108, var109 = protoModule.readBuffer(p1, var62)
				var62 = var109
				var61.genre_l2 = buffer.tostring(var108)
			elseif var67 == 16 then
				local _ = nil
				local var110, var111 = protoModule.readBuffer(p1, var62)
				var62 = var111
				var61.created_date = buffer.tostring(var110)
			elseif var67 == 17 then
				local _ = nil
				local var112, var113 = protoModule.readBuffer(p1, var62)
				var62 = var113
				var61.updated_date = buffer.tostring(var112)
			elseif var67 == 20 then
				local _ = nil
				local var114, var115 = protoModule.readBuffer(p1, var62)
				var62 = var115
				var61.canonical_url_path = buffer.tostring(var114)
			elseif var67 == 22 then
				local _ = nil
				local var116, var117 = protoModule.readBuffer(p1, var62)
				var62 = var117
				var61.game_age_display_name = buffer.tostring(var116)
			elseif var67 == 23 then
				local _ = nil
				local var118, var119 = protoModule.readBuffer(p1, var62)
				var62 = var119
				var61.content_maturity = buffer.tostring(var118)
			elseif var67 == 25 then
				local _ = nil
				local var120, var121 = protoModule.readBuffer(p1, var62)
				var62 = var121
				var61.refund_policy_text = buffer.tostring(var120)
			elseif var67 == 26 then
				local _ = nil
				local var122, var123 = protoModule.readBuffer(p1, var62)
				var62 = var123
				var61.refund_article_id = buffer.tostring(var122)
			else
				local _ = nil
				local var124, var125 = protoModule.readVarInt(p1, var62)
				var62 = var125 + var124
			end
		elseif var63 == protoModule.wireTypes.i32 then
			local _ = nil
			local var126, var127 = protoModule.readFixed32(p1, var62)
			local _ = var126
			var62 = var127
		elseif var63 == protoModule.wireTypes.i64 then
			local _ = nil
			local var128, var129 = protoModule.readFixed64(p1, var62)
			local _ = var128
			var62 = var129
		else
			error("Unsupported wire type: " .. var63)
		end
	end
	return var61
end

function t_1:jsonEncode() --[[ line: 450 ]]
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
	return t
end

function t_1:jsonDecode() --[[ line: 564 ]]
	-- upvalues: t_1 (ref)
	local var131 = t_1.new()
	
	if self.id ~= nil then
		var131.id = self.id
	end
	if self.name ~= nil then
		var131.name = self.name
	end
	if self.description ~= nil then
		var131.description = self.description
	end
	if self.root_place_id ~= nil then
		var131.root_place_id = self.root_place_id
	end
	if self.rootPlaceId ~= nil then
		var131.root_place_id = self.rootPlaceId
	end
	if self.creator_type ~= nil then
		var131.creator_type = self.creator_type
	end
	if self.creatorType ~= nil then
		var131.creator_type = self.creatorType
	end
	if self.creator_id ~= nil then
		var131.creator_id = self.creator_id
	end
	if self.creatorId ~= nil then
		var131.creator_id = self.creatorId
	end
	if self.player_count ~= nil then
		var131.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		var131.player_count = self.playerCount
	end
	if self.total_up_votes ~= nil then
		var131.total_up_votes = self.total_up_votes
	end
	if self.totalUpVotes ~= nil then
		var131.total_up_votes = self.totalUpVotes
	end
	if self.total_down_votes ~= nil then
		var131.total_down_votes = self.total_down_votes
	end
	if self.totalDownVotes ~= nil then
		var131.total_down_votes = self.totalDownVotes
	end
	if self.is_voice_supported ~= nil then
		var131.is_voice_supported = self.is_voice_supported
	end
	if self.isVoiceSupported ~= nil then
		var131.is_voice_supported = self.isVoiceSupported
	end
	if self.is_camera_supported ~= nil then
		var131.is_camera_supported = self.is_camera_supported
	end
	if self.isCameraSupported ~= nil then
		var131.is_camera_supported = self.isCameraSupported
	end
	if self.localized_fiat_price ~= nil then
		var131.localized_fiat_price = self.localized_fiat_price
	end
	if self.localizedFiatPrice ~= nil then
		var131.localized_fiat_price = self.localizedFiatPrice
	end
	if self.genre_l1 ~= nil then
		var131.genre_l1 = self.genre_l1
	end
	if self.genreL1 ~= nil then
		var131.genre_l1 = self.genreL1
	end
	if self.genre_l2 ~= nil then
		var131.genre_l2 = self.genre_l2
	end
	if self.genreL2 ~= nil then
		var131.genre_l2 = self.genreL2
	end
	if self.maximum_server_size ~= nil then
		var131.maximum_server_size = self.maximum_server_size
	end
	if self.maximumServerSize ~= nil then
		var131.maximum_server_size = self.maximumServerSize
	end
	if self.created_date ~= nil then
		var131.created_date = self.created_date
	end
	if self.createdDate ~= nil then
		var131.created_date = self.createdDate
	end
	if self.updated_date ~= nil then
		var131.updated_date = self.updated_date
	end
	if self.updatedDate ~= nil then
		var131.updated_date = self.updatedDate
	end
	if self.favorite_count ~= nil then
		var131.favorite_count = self.favorite_count
	end
	if self.favoriteCount ~= nil then
		var131.favorite_count = self.favoriteCount
	end
	if self.total_visits ~= nil then
		var131.total_visits = self.total_visits
	end
	if self.totalVisits ~= nil then
		var131.total_visits = self.totalVisits
	end
	if self.canonical_url_path ~= nil then
		var131.canonical_url_path = self.canonical_url_path
	end
	if self.canonicalUrlPath ~= nil then
		var131.canonical_url_path = self.canonicalUrlPath
	end
	if self.game_minimum_age ~= nil then
		var131.game_minimum_age = self.game_minimum_age
	end
	if self.gameMinimumAge ~= nil then
		var131.game_minimum_age = self.gameMinimumAge
	end
	if self.game_age_display_name ~= nil then
		var131.game_age_display_name = self.game_age_display_name
	end
	if self.gameAgeDisplayName ~= nil then
		var131.game_age_display_name = self.gameAgeDisplayName
	end
	if self.content_maturity ~= nil then
		var131.content_maturity = self.content_maturity
	end
	if self.contentMaturity ~= nil then
		var131.content_maturity = self.contentMaturity
	end
	if self.is_officially_licensed ~= nil then
		var131.is_officially_licensed = self.is_officially_licensed
	end
	if self.isOfficiallyLicensed ~= nil then
		var131.is_officially_licensed = self.isOfficiallyLicensed
	end
	if self.refund_policy_text ~= nil then
		var131.refund_policy_text = self.refund_policy_text
	end
	if self.refundPolicyText ~= nil then
		var131.refund_policy_text = self.refundPolicyText
	end
	if self.refund_article_id ~= nil then
		var131.refund_article_id = self.refund_article_id
	end
	if self.refundArticleId ~= nil then
		var131.refund_article_id = self.refundArticleId
	end
	if self.preview_video_id ~= nil then
		var131.preview_video_id = self.preview_video_id
	end
	if self.previewVideoId ~= nil then
		var131.preview_video_id = self.previewVideoId
	end
	return var131
end

t_1.descriptor = {
	name = "UniverseData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseData"
}
t.UniverseData = t_1
typeRegistryModule.default:register(t.UniverseData)

return { UniverseData = t.UniverseData }