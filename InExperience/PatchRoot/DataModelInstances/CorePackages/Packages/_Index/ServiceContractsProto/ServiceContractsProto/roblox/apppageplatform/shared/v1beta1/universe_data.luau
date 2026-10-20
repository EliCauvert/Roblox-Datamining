local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local _ = require(script.Parent.custom_options)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
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
		creation_source = if p1 == nil or p1.creation_source == nil then nil else p1.creation_source,
		promotional_text = if p1 == nil or p1.promotional_text == nil then nil else p1.promotional_text,
		moment_video_asset_id = if p1 == nil or p1.moment_video_asset_id == nil then nil else p1.moment_video_asset_id,
		is_community_licensed = if p1 == nil or p1.is_community_licensed == nil then nil else p1.is_community_licensed
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.id)
	end
	if self.name ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.name)
	end
	if self.description ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.description)
	end
	if self.root_place_id ~= nil then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, self.root_place_id)
	end
	if self.creator_type ~= nil then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.creator_type)
	end
	if self.creator_id ~= nil then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult6, WriteTagResult2_5, self.creator_id)
	end
	if self.player_count ~= nil then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult7, WriteTagResult2_6, self.player_count)
	end
	if self.total_up_votes ~= nil then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult8, WriteTagResult2_7, self.total_up_votes)
	end
	if self.total_down_votes ~= nil then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult9, WriteTagResult2_8, self.total_down_votes)
	end
	if self.is_voice_supported ~= nil then
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult10, WriteTagResult2_9, if self.is_voice_supported then 1 else 0)
	end
	if self.is_camera_supported ~= nil then
		local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult11, WriteTagResult2_10, if self.is_camera_supported then 1 else 0)
	end
	if self.localized_fiat_price ~= nil then
		local WriteTagResult12, WriteTagResult2_11 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult12, WriteTagResult2_11, self.localized_fiat_price)
	end
	if self.genre_l1 ~= nil then
		local WriteTagResult13, WriteTagResult2_12 = ProtoModule.writeTag(Buf, Count, 13, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult13, WriteTagResult2_12, self.genre_l1)
	end
	if self.genre_l2 ~= nil then
		local WriteTagResult14, WriteTagResult2_13 = ProtoModule.writeTag(Buf, Count, 14, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult14, WriteTagResult2_13, self.genre_l2)
	end
	if self.maximum_server_size ~= nil then
		local WriteTagResult15, WriteTagResult2_14 = ProtoModule.writeTag(Buf, Count, 15, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult15, WriteTagResult2_14, self.maximum_server_size)
	end
	if self.created_date ~= nil then
		local WriteTagResult16, WriteTagResult2_15 = ProtoModule.writeTag(Buf, Count, 16, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult16, WriteTagResult2_15, self.created_date)
	end
	if self.updated_date ~= nil then
		local WriteTagResult17, WriteTagResult2_16 = ProtoModule.writeTag(Buf, Count, 17, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult17, WriteTagResult2_16, self.updated_date)
	end
	if self.favorite_count ~= nil then
		local WriteTagResult18, WriteTagResult2_17 = ProtoModule.writeTag(Buf, Count, 18, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult18, WriteTagResult2_17, self.favorite_count)
	end
	if self.total_visits ~= nil then
		local WriteTagResult19, WriteTagResult2_18 = ProtoModule.writeTag(Buf, Count, 19, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult19, WriteTagResult2_18, self.total_visits)
	end
	if self.canonical_url_path ~= nil then
		local WriteTagResult20, WriteTagResult2_19 = ProtoModule.writeTag(Buf, Count, 20, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult20, WriteTagResult2_19, self.canonical_url_path)
	end
	if self.game_minimum_age ~= nil then
		local WriteTagResult21, WriteTagResult2_20 = ProtoModule.writeTag(Buf, Count, 21, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult21, WriteTagResult2_20, self.game_minimum_age)
	end
	if self.game_age_display_name ~= nil then
		local WriteTagResult22, WriteTagResult2_21 = ProtoModule.writeTag(Buf, Count, 22, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult22, WriteTagResult2_21, self.game_age_display_name)
	end
	if self.content_maturity ~= nil then
		local WriteTagResult23, WriteTagResult2_22 = ProtoModule.writeTag(Buf, Count, 23, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult23, WriteTagResult2_22, self.content_maturity)
	end
	if self.is_officially_licensed ~= nil then
		local WriteTagResult24, WriteTagResult2_23 = ProtoModule.writeTag(Buf, Count, 24, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult24, WriteTagResult2_23, if self.is_officially_licensed then 1 else 0)
	end
	if self.refund_policy_text ~= nil then
		local WriteTagResult25, WriteTagResult2_24 = ProtoModule.writeTag(Buf, Count, 25, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult25, WriteTagResult2_24, self.refund_policy_text)
	end
	if self.refund_article_id ~= nil then
		local WriteTagResult26, WriteTagResult2_25 = ProtoModule.writeTag(Buf, Count, 26, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult26, WriteTagResult2_25, self.refund_article_id)
	end
	if self.preview_video_id ~= nil then
		local WriteTagResult27, WriteTagResult2_26 = ProtoModule.writeTag(Buf, Count, 27, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult27, WriteTagResult2_26, self.preview_video_id)
	end
	if self.creation_source ~= nil then
		local WriteTagResult28, WriteTagResult2_27 = ProtoModule.writeTag(Buf, Count, 28, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult28, WriteTagResult2_27, self.creation_source)
	end
	if self.promotional_text ~= nil then
		local WriteTagResult29, WriteTagResult2_28 = ProtoModule.writeTag(Buf, Count, 29, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult29, WriteTagResult2_28, self.promotional_text)
	end
	if self.moment_video_asset_id ~= nil then
		local WriteTagResult30, WriteTagResult2_29 = ProtoModule.writeTag(Buf, Count, 30, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult30, WriteTagResult2_29, self.moment_video_asset_id)
	end
	if self.is_community_licensed ~= nil then
		local WriteTagResult31, WriteTagResult2_30 = ProtoModule.writeTag(Buf, Count, 31, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult31, WriteTagResult2_30, if self.is_community_licensed then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v70 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.id, v70 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 4 then
				NewModule.root_place_id, v70 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 6 then
				NewModule.creator_id, v70 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 7 then
				NewModule.player_count, v70 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 8 then
				NewModule.total_up_votes, v70 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 9 then
				NewModule.total_down_votes, v70 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 10 then
				local VarInt
				VarInt, v70 = ProtoModule.readVarInt(Buf, v1)
				NewModule.is_voice_supported = VarInt ~= 0
			elseif Tag == 11 then
				local VarInt1
				VarInt1, v70 = ProtoModule.readVarInt(Buf, v1)
				NewModule.is_camera_supported = VarInt1 ~= 0
			elseif Tag == 15 then
				NewModule.maximum_server_size, v70 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 18 then
				NewModule.favorite_count, v70 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 19 then
				NewModule.total_visits, v70 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 21 then
				NewModule.game_minimum_age, v70 = ProtoModule.readVarIntI32(Buf, v1)
			elseif Tag == 24 then
				local VarInt2
				VarInt2, v70 = ProtoModule.readVarInt(Buf, v1)
				NewModule.is_officially_licensed = VarInt2 ~= 0
			elseif Tag == 27 then
				NewModule.preview_video_id, v70 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 30 then
				NewModule.moment_video_asset_id, v70 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 31 then
				local VarInt3
				VarInt3, v70 = ProtoModule.readVarInt(Buf, v1)
				NewModule.is_community_licensed = VarInt3 ~= 0
			else
				local _
				_, v70 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v70 = ProtoModule.readBuffer(Buf, v1)
				NewModule.name = buffer.tostring(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v70 = ProtoModule.readBuffer(Buf, v1)
				NewModule.description = buffer.tostring(Buffer2)
			elseif Tag == 5 then
				local Buffer3
				Buffer3, v70 = ProtoModule.readBuffer(Buf, v1)
				NewModule.creator_type = buffer.tostring(Buffer3)
			elseif Tag == 12 then
				local Buffer4
				Buffer4, v70 = ProtoModule.readBuffer(Buf, v1)
				NewModule.localized_fiat_price = buffer.tostring(Buffer4)
			elseif Tag == 13 then
				local Buffer5
				Buffer5, v70 = ProtoModule.readBuffer(Buf, v1)
				NewModule.genre_l1 = buffer.tostring(Buffer5)
			elseif Tag == 14 then
				local Buffer6
				Buffer6, v70 = ProtoModule.readBuffer(Buf, v1)
				NewModule.genre_l2 = buffer.tostring(Buffer6)
			elseif Tag == 16 then
				local Buffer7
				Buffer7, v70 = ProtoModule.readBuffer(Buf, v1)
				NewModule.created_date = buffer.tostring(Buffer7)
			elseif Tag == 17 then
				local Buffer8
				Buffer8, v70 = ProtoModule.readBuffer(Buf, v1)
				NewModule.updated_date = buffer.tostring(Buffer8)
			elseif Tag == 20 then
				local Buffer9
				Buffer9, v70 = ProtoModule.readBuffer(Buf, v1)
				NewModule.canonical_url_path = buffer.tostring(Buffer9)
			elseif Tag == 22 then
				local Buffer10
				Buffer10, v70 = ProtoModule.readBuffer(Buf, v1)
				NewModule.game_age_display_name = buffer.tostring(Buffer10)
			elseif Tag == 23 then
				local Buffer11
				Buffer11, v70 = ProtoModule.readBuffer(Buf, v1)
				NewModule.content_maturity = buffer.tostring(Buffer11)
			elseif Tag == 25 then
				local Buffer12
				Buffer12, v70 = ProtoModule.readBuffer(Buf, v1)
				NewModule.refund_policy_text = buffer.tostring(Buffer12)
			elseif Tag == 26 then
				local Buffer13
				Buffer13, v70 = ProtoModule.readBuffer(Buf, v1)
				NewModule.refund_article_id = buffer.tostring(Buffer13)
			elseif Tag == 28 then
				local Buffer14
				Buffer14, v70 = ProtoModule.readBuffer(Buf, v1)
				NewModule.creation_source = buffer.tostring(Buffer14)
			elseif Tag == 29 then
				local Buffer15
				Buffer15, v70 = ProtoModule.readBuffer(Buf, v1)
				NewModule.promotional_text = buffer.tostring(Buffer15)
			else
				local VarInt4, VarInt2_1 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2_1 + VarInt4
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v70 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v70 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
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
	if self.promotional_text ~= nil then
		t.promotionalText = self.promotional_text
	end
	if self.moment_video_asset_id ~= nil then
		t.momentVideoAssetId = self.moment_video_asset_id
	end
	if self.is_community_licensed ~= nil then
		t.isCommunityLicensed = self.is_community_licensed
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.name ~= nil then
		NewModule.name = self.name
	end
	if self.description ~= nil then
		NewModule.description = self.description
	end
	if self.root_place_id ~= nil then
		NewModule.root_place_id = self.root_place_id
	end
	if self.rootPlaceId ~= nil then
		NewModule.root_place_id = self.rootPlaceId
	end
	if self.creator_type ~= nil then
		NewModule.creator_type = self.creator_type
	end
	if self.creatorType ~= nil then
		NewModule.creator_type = self.creatorType
	end
	if self.creator_id ~= nil then
		NewModule.creator_id = self.creator_id
	end
	if self.creatorId ~= nil then
		NewModule.creator_id = self.creatorId
	end
	if self.player_count ~= nil then
		NewModule.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		NewModule.player_count = self.playerCount
	end
	if self.total_up_votes ~= nil then
		NewModule.total_up_votes = self.total_up_votes
	end
	if self.totalUpVotes ~= nil then
		NewModule.total_up_votes = self.totalUpVotes
	end
	if self.total_down_votes ~= nil then
		NewModule.total_down_votes = self.total_down_votes
	end
	if self.totalDownVotes ~= nil then
		NewModule.total_down_votes = self.totalDownVotes
	end
	if self.is_voice_supported ~= nil then
		NewModule.is_voice_supported = self.is_voice_supported
	end
	if self.isVoiceSupported ~= nil then
		NewModule.is_voice_supported = self.isVoiceSupported
	end
	if self.is_camera_supported ~= nil then
		NewModule.is_camera_supported = self.is_camera_supported
	end
	if self.isCameraSupported ~= nil then
		NewModule.is_camera_supported = self.isCameraSupported
	end
	if self.localized_fiat_price ~= nil then
		NewModule.localized_fiat_price = self.localized_fiat_price
	end
	if self.localizedFiatPrice ~= nil then
		NewModule.localized_fiat_price = self.localizedFiatPrice
	end
	if self.genre_l1 ~= nil then
		NewModule.genre_l1 = self.genre_l1
	end
	if self.genreL1 ~= nil then
		NewModule.genre_l1 = self.genreL1
	end
	if self.genre_l2 ~= nil then
		NewModule.genre_l2 = self.genre_l2
	end
	if self.genreL2 ~= nil then
		NewModule.genre_l2 = self.genreL2
	end
	if self.maximum_server_size ~= nil then
		NewModule.maximum_server_size = self.maximum_server_size
	end
	if self.maximumServerSize ~= nil then
		NewModule.maximum_server_size = self.maximumServerSize
	end
	if self.created_date ~= nil then
		NewModule.created_date = self.created_date
	end
	if self.createdDate ~= nil then
		NewModule.created_date = self.createdDate
	end
	if self.updated_date ~= nil then
		NewModule.updated_date = self.updated_date
	end
	if self.updatedDate ~= nil then
		NewModule.updated_date = self.updatedDate
	end
	if self.favorite_count ~= nil then
		NewModule.favorite_count = self.favorite_count
	end
	if self.favoriteCount ~= nil then
		NewModule.favorite_count = self.favoriteCount
	end
	if self.total_visits ~= nil then
		NewModule.total_visits = self.total_visits
	end
	if self.totalVisits ~= nil then
		NewModule.total_visits = self.totalVisits
	end
	if self.canonical_url_path ~= nil then
		NewModule.canonical_url_path = self.canonical_url_path
	end
	if self.canonicalUrlPath ~= nil then
		NewModule.canonical_url_path = self.canonicalUrlPath
	end
	if self.game_minimum_age ~= nil then
		NewModule.game_minimum_age = self.game_minimum_age
	end
	if self.gameMinimumAge ~= nil then
		NewModule.game_minimum_age = self.gameMinimumAge
	end
	if self.game_age_display_name ~= nil then
		NewModule.game_age_display_name = self.game_age_display_name
	end
	if self.gameAgeDisplayName ~= nil then
		NewModule.game_age_display_name = self.gameAgeDisplayName
	end
	if self.content_maturity ~= nil then
		NewModule.content_maturity = self.content_maturity
	end
	if self.contentMaturity ~= nil then
		NewModule.content_maturity = self.contentMaturity
	end
	if self.is_officially_licensed ~= nil then
		NewModule.is_officially_licensed = self.is_officially_licensed
	end
	if self.isOfficiallyLicensed ~= nil then
		NewModule.is_officially_licensed = self.isOfficiallyLicensed
	end
	if self.refund_policy_text ~= nil then
		NewModule.refund_policy_text = self.refund_policy_text
	end
	if self.refundPolicyText ~= nil then
		NewModule.refund_policy_text = self.refundPolicyText
	end
	if self.refund_article_id ~= nil then
		NewModule.refund_article_id = self.refund_article_id
	end
	if self.refundArticleId ~= nil then
		NewModule.refund_article_id = self.refundArticleId
	end
	if self.preview_video_id ~= nil then
		NewModule.preview_video_id = self.preview_video_id
	end
	if self.previewVideoId ~= nil then
		NewModule.preview_video_id = self.previewVideoId
	end
	if self.creation_source ~= nil then
		NewModule.creation_source = self.creation_source
	end
	if self.creationSource ~= nil then
		NewModule.creation_source = self.creationSource
	end
	if self.promotional_text ~= nil then
		NewModule.promotional_text = self.promotional_text
	end
	if self.promotionalText ~= nil then
		NewModule.promotional_text = self.promotionalText
	end
	if self.moment_video_asset_id ~= nil then
		NewModule.moment_video_asset_id = self.moment_video_asset_id
	end
	if self.momentVideoAssetId ~= nil then
		NewModule.moment_video_asset_id = self.momentVideoAssetId
	end
	if self.is_community_licensed ~= nil then
		NewModule.is_community_licensed = self.is_community_licensed
	end
	if self.isCommunityLicensed ~= nil then
		NewModule.is_community_licensed = self.isCommunityLicensed
	end
	return NewModule
end

Module.descriptor = {
	name = "UniverseData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseData"
}
local config = { UniverseData = Module }
TypeRegistryModule.default:register(config.UniverseData)

return { UniverseData = config.UniverseData }