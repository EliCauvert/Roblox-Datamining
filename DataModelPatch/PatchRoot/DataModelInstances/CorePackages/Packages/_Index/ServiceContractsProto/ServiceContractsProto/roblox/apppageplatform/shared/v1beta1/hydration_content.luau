local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local BadgeDataModule = require(script.Parent.badge_data)
local UniverseDataModule = require(script.Parent.universe_data)
local UniverseUserFavoriteDataModule = require(script.Parent.universe_user_favorite_data)
local UniverseUserFollowDataModule = require(script.Parent.universe_user_follow_data)
local UniverseUserFollowLimitDataModule = require(script.Parent.universe_user_follow_limit_data)
local UniverseUserVoteDataModule = require(script.Parent.universe_user_vote_data)
local UniverseUserVoteFeedbackMetadataDataModule = require(script.Parent.universe_user_vote_feedback_metadata_data)
local CreatorDataModule = require(script.Parent.creator_data)
local EventDataModule = require(script.Parent.event_data)
local SongDataModule = require(script.Parent.song_data)
local GamePassDataModule = require(script.Parent.game_pass_data)
local PlayabilityDataModule = require(script.Parent.playability_data)
local MediaAssetDataModule = require(script.Parent.media_asset_data)
local SocialLinkDataModule = require(script.Parent.social_link_data)
local MarketplaceCatalogCategoryDataModule = require(script.Parent.marketplace_catalog_category_data)
local MarketplaceAssetDataModule = require(script.Parent.marketplace_asset_data)
local MarketplaceBundleDataModule = require(script.Parent.marketplace_bundle_data)
local MarketplaceLookDataModule = require(script.Parent.marketplace_look_data)
local CatalogSortDataModule = require(script.Parent.catalog_sort_data)
local GameDeveloperProductDataModule = require(script.Parent.game_developer_product_data)
local GameSubscriptionDataModule = require(script.Parent.game_subscription_data)
local AgeRecommendationDataModule = require(script.Parent.age_recommendation_data)
local UserProfileDataModule = require(script.Parent.user_profile_data)
local MomentDataModule = require(script.Parent.moment_data)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		badge = if p1 == nil or p1.badge == nil then {} else p1.badge,
		universe = if p1 == nil or p1.universe == nil then {} else p1.universe,
		creator = if p1 == nil or p1.creator == nil then {} else p1.creator,
		event = if p1 == nil or p1.event == nil then {} else p1.event,
		song = if p1 == nil or p1.song == nil then {} else p1.song,
		game_pass = if p1 == nil or p1.game_pass == nil then {} else p1.game_pass,
		media_asset = if p1 == nil or p1.media_asset == nil then {} else p1.media_asset,
		social_link = if p1 == nil or p1.social_link == nil then {} else p1.social_link,
		game_developer_product = if p1 == nil or p1.game_developer_product == nil then {} else p1.game_developer_product,
		game_subscription = if p1 == nil or p1.game_subscription == nil then {} else p1.game_subscription,
		marketplace_catalog_category = if p1 == nil or p1.marketplace_catalog_category == nil then {} else p1.marketplace_catalog_category,
		marketplace_asset = if p1 == nil or p1.marketplace_asset == nil then {} else p1.marketplace_asset,
		marketplace_bundle = if p1 == nil or p1.marketplace_bundle == nil then {} else p1.marketplace_bundle,
		marketplace_look = if p1 == nil or p1.marketplace_look == nil then {} else p1.marketplace_look,
		catalog_sort = if p1 == nil or p1.catalog_sort == nil then {} else p1.catalog_sort,
		age_recommendation = if p1 == nil or p1.age_recommendation == nil then {} else p1.age_recommendation,
		universe_user_follow = if p1 == nil or p1.universe_user_follow == nil then {} else p1.universe_user_follow,
		universe_user_vote = if p1 == nil or p1.universe_user_vote == nil then {} else p1.universe_user_vote,
		user_profile = if p1 == nil or p1.user_profile == nil then {} else p1.user_profile,
		universe_user_favorite = if p1 == nil or p1.universe_user_favorite == nil then {} else p1.universe_user_favorite,
		playability = if p1 == nil or p1.playability == nil then {} else p1.playability,
		universe_user_follow_limit = if p1 == nil or p1.universe_user_follow_limit == nil then {} else p1.universe_user_follow_limit,
		universe_user_vote_feedback_metadata = if p1 == nil or p1.universe_user_vote_feedback_metadata == nil then {} else p1.universe_user_vote_feedback_metadata,
		moment = if p1 == nil or p1.moment == nil then {} else p1.moment
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.badge ~= nil and next(self.badge) ~= nil then
		for i, value in self.badge do
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult, WriteTagResult2, i)
			local EncodeResult = value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult, WriteBufferResult2 = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, WriteBufferResult, WriteBufferResult2)
		end
	end
	if self.universe ~= nil and next(self.universe) ~= nil then
		for i3, value3 in self.universe do
			local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult4, WriteStringResult2_3 = ProtoModule.writeString(WriteTagResult10, WriteTagResult2_9, i3)
			local EncodeResult = value3:encode()
			local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(WriteStringResult4, WriteStringResult2_3, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult4, WriteBufferResult2_3 = ProtoModule.writeBuffer(WriteTagResult11, WriteTagResult2_10, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult12, WriteTagResult2_11 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult12, WriteTagResult2_11, WriteBufferResult4, WriteBufferResult2_3)
		end
	end
	if self.creator ~= nil and next(self.creator) ~= nil then
		for i4, value4 in self.creator do
			local WriteTagResult19, WriteTagResult2_18 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult7, WriteStringResult2_6 = ProtoModule.writeString(WriteTagResult19, WriteTagResult2_18, i4)
			local EncodeResult = value4:encode()
			local WriteTagResult20, WriteTagResult2_19 = ProtoModule.writeTag(WriteStringResult7, WriteStringResult2_6, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult7, WriteBufferResult2_6 = ProtoModule.writeBuffer(WriteTagResult20, WriteTagResult2_19, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult21, WriteTagResult2_20 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult21, WriteTagResult2_20, WriteBufferResult7, WriteBufferResult2_6)
		end
	end
	if self.event ~= nil and next(self.event) ~= nil then
		for i5, value5 in self.event do
			local WriteTagResult22, WriteTagResult2_21 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult8, WriteStringResult2_7 = ProtoModule.writeString(WriteTagResult22, WriteTagResult2_21, i5)
			local EncodeResult = value5:encode()
			local WriteTagResult23, WriteTagResult2_22 = ProtoModule.writeTag(WriteStringResult8, WriteStringResult2_7, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult8, WriteBufferResult2_7 = ProtoModule.writeBuffer(WriteTagResult23, WriteTagResult2_22, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult24, WriteTagResult2_23 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult24, WriteTagResult2_23, WriteBufferResult8, WriteBufferResult2_7)
		end
	end
	if self.song ~= nil and next(self.song) ~= nil then
		for i6, value6 in self.song do
			local WriteTagResult25, WriteTagResult2_24 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult9, WriteStringResult2_8 = ProtoModule.writeString(WriteTagResult25, WriteTagResult2_24, i6)
			local EncodeResult = value6:encode()
			local WriteTagResult26, WriteTagResult2_25 = ProtoModule.writeTag(WriteStringResult9, WriteStringResult2_8, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult9, WriteBufferResult2_8 = ProtoModule.writeBuffer(WriteTagResult26, WriteTagResult2_25, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult27, WriteTagResult2_26 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult27, WriteTagResult2_26, WriteBufferResult9, WriteBufferResult2_8)
		end
	end
	if self.game_pass ~= nil and next(self.game_pass) ~= nil then
		for i7, value7 in self.game_pass do
			local WriteTagResult31, WriteTagResult2_30 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult11, WriteStringResult2_10 = ProtoModule.writeString(WriteTagResult31, WriteTagResult2_30, i7)
			local EncodeResult = value7:encode()
			local WriteTagResult32, WriteTagResult2_31 = ProtoModule.writeTag(WriteStringResult11, WriteStringResult2_10, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult11, WriteBufferResult2_10 = ProtoModule.writeBuffer(WriteTagResult32, WriteTagResult2_31, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult33, WriteTagResult2_32 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult33, WriteTagResult2_32, WriteBufferResult11, WriteBufferResult2_10)
		end
	end
	if self.media_asset ~= nil and next(self.media_asset) ~= nil then
		for i8, value8 in self.media_asset do
			local WriteTagResult34, WriteTagResult2_33 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult12, WriteStringResult2_11 = ProtoModule.writeString(WriteTagResult34, WriteTagResult2_33, i8)
			local EncodeResult = value8:encode()
			local WriteTagResult35, WriteTagResult2_34 = ProtoModule.writeTag(WriteStringResult12, WriteStringResult2_11, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult12, WriteBufferResult2_11 = ProtoModule.writeBuffer(WriteTagResult35, WriteTagResult2_34, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult36, WriteTagResult2_35 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult36, WriteTagResult2_35, WriteBufferResult12, WriteBufferResult2_11)
		end
	end
	if self.social_link ~= nil and next(self.social_link) ~= nil then
		for i10, value10 in self.social_link do
			local WriteTagResult40, WriteTagResult2_39 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult14, WriteStringResult2_13 = ProtoModule.writeString(WriteTagResult40, WriteTagResult2_39, i10)
			local EncodeResult = value10:encode()
			local WriteTagResult41, WriteTagResult2_40 = ProtoModule.writeTag(WriteStringResult14, WriteStringResult2_13, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult14, WriteBufferResult2_13 = ProtoModule.writeBuffer(WriteTagResult41, WriteTagResult2_40, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult42, WriteTagResult2_41 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult42, WriteTagResult2_41, WriteBufferResult14, WriteBufferResult2_13)
		end
	end
	if self.game_developer_product ~= nil and next(self.game_developer_product) ~= nil then
		for i11, value11 in self.game_developer_product do
			local WriteTagResult49, WriteTagResult2_48 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult17, WriteStringResult2_16 = ProtoModule.writeString(WriteTagResult49, WriteTagResult2_48, i11)
			local EncodeResult = value11:encode()
			local WriteTagResult50, WriteTagResult2_49 = ProtoModule.writeTag(WriteStringResult17, WriteStringResult2_16, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult17, WriteBufferResult2_16 = ProtoModule.writeBuffer(WriteTagResult50, WriteTagResult2_49, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult51, WriteTagResult2_50 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult51, WriteTagResult2_50, WriteBufferResult17, WriteBufferResult2_16)
		end
	end
	if self.game_subscription ~= nil and next(self.game_subscription) ~= nil then
		for i2, value2 in self.game_subscription do
			local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult3, WriteStringResult2_2 = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, i2)
			local EncodeResult = value2:encode()
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(WriteStringResult3, WriteStringResult2_2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult3, WriteBufferResult2_2 = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult9, WriteTagResult2_8, WriteBufferResult3, WriteBufferResult2_2)
		end
	end
	if self.marketplace_catalog_category ~= nil and next(self.marketplace_catalog_category) ~= nil then
		for i1, value1 in self.marketplace_catalog_category do
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult1, WriteStringResult2_1 = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, i1)
			local EncodeResult = value1:encode()
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(WriteStringResult1, WriteStringResult2_1, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult1, WriteBufferResult2_1 = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, WriteBufferResult1, WriteBufferResult2_1)
		end
	end
	if self.marketplace_asset ~= nil and next(self.marketplace_asset) ~= nil then
		for i14, value14 in self.marketplace_asset do
			local WriteTagResult58, WriteTagResult2_57 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult20, WriteStringResult2_19 = ProtoModule.writeString(WriteTagResult58, WriteTagResult2_57, i14)
			local EncodeResult = value14:encode()
			local WriteTagResult59, WriteTagResult2_58 = ProtoModule.writeTag(WriteStringResult20, WriteStringResult2_19, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult20, WriteBufferResult2_19 = ProtoModule.writeBuffer(WriteTagResult59, WriteTagResult2_58, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult60, WriteTagResult2_59 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult60, WriteTagResult2_59, WriteBufferResult20, WriteBufferResult2_19)
		end
	end
	if self.marketplace_bundle ~= nil and next(self.marketplace_bundle) ~= nil then
		for i16, value16 in self.marketplace_bundle do
			local WriteTagResult61, WriteTagResult2_60 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult21, WriteStringResult2_20 = ProtoModule.writeString(WriteTagResult61, WriteTagResult2_60, i16)
			local EncodeResult = value16:encode()
			local WriteTagResult62, WriteTagResult2_61 = ProtoModule.writeTag(WriteStringResult21, WriteStringResult2_20, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult21, WriteBufferResult2_20 = ProtoModule.writeBuffer(WriteTagResult62, WriteTagResult2_61, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult63, WriteTagResult2_62 = ProtoModule.writeTag(Buf, Count, 13, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult63, WriteTagResult2_62, WriteBufferResult21, WriteBufferResult2_20)
		end
	end
	if self.marketplace_look ~= nil and next(self.marketplace_look) ~= nil then
		for i17, value17 in self.marketplace_look do
			local WriteTagResult46, WriteTagResult2_45 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult16, WriteStringResult2_15 = ProtoModule.writeString(WriteTagResult46, WriteTagResult2_45, i17)
			local EncodeResult = value17:encode()
			local WriteTagResult47, WriteTagResult2_46 = ProtoModule.writeTag(WriteStringResult16, WriteStringResult2_15, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult16, WriteBufferResult2_15 = ProtoModule.writeBuffer(WriteTagResult47, WriteTagResult2_46, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult48, WriteTagResult2_47 = ProtoModule.writeTag(Buf, Count, 14, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult48, WriteTagResult2_47, WriteBufferResult16, WriteBufferResult2_15)
		end
	end
	if self.catalog_sort ~= nil and next(self.catalog_sort) ~= nil then
		for i18, value18 in self.catalog_sort do
			local WriteTagResult13, WriteTagResult2_12 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult5, WriteStringResult2_4 = ProtoModule.writeString(WriteTagResult13, WriteTagResult2_12, i18)
			local EncodeResult = value18:encode()
			local WriteTagResult14, WriteTagResult2_13 = ProtoModule.writeTag(WriteStringResult5, WriteStringResult2_4, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult5, WriteBufferResult2_4 = ProtoModule.writeBuffer(WriteTagResult14, WriteTagResult2_13, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult15, WriteTagResult2_14 = ProtoModule.writeTag(Buf, Count, 15, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult15, WriteTagResult2_14, WriteBufferResult5, WriteBufferResult2_4)
		end
	end
	if self.age_recommendation ~= nil and next(self.age_recommendation) ~= nil then
		for i19, value19 in self.age_recommendation do
			local WriteTagResult28, WriteTagResult2_27 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult10, WriteStringResult2_9 = ProtoModule.writeString(WriteTagResult28, WriteTagResult2_27, i19)
			local EncodeResult = value19:encode()
			local WriteTagResult29, WriteTagResult2_28 = ProtoModule.writeTag(WriteStringResult10, WriteStringResult2_9, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult10, WriteBufferResult2_9 = ProtoModule.writeBuffer(WriteTagResult29, WriteTagResult2_28, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult30, WriteTagResult2_29 = ProtoModule.writeTag(Buf, Count, 16, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult30, WriteTagResult2_29, WriteBufferResult10, WriteBufferResult2_9)
		end
	end
	if self.universe_user_follow ~= nil and next(self.universe_user_follow) ~= nil then
		for i12, value12 in self.universe_user_follow do
			local WriteTagResult52, WriteTagResult2_51 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult18, WriteStringResult2_17 = ProtoModule.writeString(WriteTagResult52, WriteTagResult2_51, i12)
			local EncodeResult = value12:encode()
			local WriteTagResult53, WriteTagResult2_52 = ProtoModule.writeTag(WriteStringResult18, WriteStringResult2_17, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult18, WriteBufferResult2_17 = ProtoModule.writeBuffer(WriteTagResult53, WriteTagResult2_52, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult54, WriteTagResult2_53 = ProtoModule.writeTag(Buf, Count, 17, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult54, WriteTagResult2_53, WriteBufferResult18, WriteBufferResult2_17)
		end
	end
	if self.universe_user_vote ~= nil and next(self.universe_user_vote) ~= nil then
		for i21, value21 in self.universe_user_vote do
			local WriteTagResult16, WriteTagResult2_15 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult6, WriteStringResult2_5 = ProtoModule.writeString(WriteTagResult16, WriteTagResult2_15, i21)
			local EncodeResult = value21:encode()
			local WriteTagResult17, WriteTagResult2_16 = ProtoModule.writeTag(WriteStringResult6, WriteStringResult2_5, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult6, WriteBufferResult2_5 = ProtoModule.writeBuffer(WriteTagResult17, WriteTagResult2_16, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult18, WriteTagResult2_17 = ProtoModule.writeTag(Buf, Count, 18, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult18, WriteTagResult2_17, WriteBufferResult6, WriteBufferResult2_5)
		end
	end
	if self.user_profile ~= nil and next(self.user_profile) ~= nil then
		for i9, value9 in self.user_profile do
			local WriteTagResult37, WriteTagResult2_36 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult13, WriteStringResult2_12 = ProtoModule.writeString(WriteTagResult37, WriteTagResult2_36, i9)
			local EncodeResult = value9:encode()
			local WriteTagResult38, WriteTagResult2_37 = ProtoModule.writeTag(WriteStringResult13, WriteStringResult2_12, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult13, WriteBufferResult2_12 = ProtoModule.writeBuffer(WriteTagResult38, WriteTagResult2_37, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult39, WriteTagResult2_38 = ProtoModule.writeTag(Buf, Count, 19, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult39, WriteTagResult2_38, WriteBufferResult13, WriteBufferResult2_12)
		end
	end
	if self.universe_user_favorite ~= nil and next(self.universe_user_favorite) ~= nil then
		for i13, value13 in self.universe_user_favorite do
			local WriteTagResult55, WriteTagResult2_54 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult19, WriteStringResult2_18 = ProtoModule.writeString(WriteTagResult55, WriteTagResult2_54, i13)
			local EncodeResult = value13:encode()
			local WriteTagResult56, WriteTagResult2_55 = ProtoModule.writeTag(WriteStringResult19, WriteStringResult2_18, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult19, WriteBufferResult2_18 = ProtoModule.writeBuffer(WriteTagResult56, WriteTagResult2_55, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult57, WriteTagResult2_56 = ProtoModule.writeTag(Buf, Count, 20, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult57, WriteTagResult2_56, WriteBufferResult19, WriteBufferResult2_18)
		end
	end
	if self.playability ~= nil and next(self.playability) ~= nil then
		for i15, value15 in self.playability do
			local WriteTagResult43, WriteTagResult2_42 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult15, WriteStringResult2_14 = ProtoModule.writeString(WriteTagResult43, WriteTagResult2_42, i15)
			local EncodeResult = value15:encode()
			local WriteTagResult44, WriteTagResult2_43 = ProtoModule.writeTag(WriteStringResult15, WriteStringResult2_14, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult15, WriteBufferResult2_14 = ProtoModule.writeBuffer(WriteTagResult44, WriteTagResult2_43, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult45, WriteTagResult2_44 = ProtoModule.writeTag(Buf, Count, 21, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult45, WriteTagResult2_44, WriteBufferResult15, WriteBufferResult2_14)
		end
	end
	if self.universe_user_follow_limit ~= nil and next(self.universe_user_follow_limit) ~= nil then
		for i20, value20 in self.universe_user_follow_limit do
			local WriteTagResult64, WriteTagResult2_63 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult22, WriteStringResult2_21 = ProtoModule.writeString(WriteTagResult64, WriteTagResult2_63, i20)
			local EncodeResult = value20:encode()
			local WriteTagResult65, WriteTagResult2_64 = ProtoModule.writeTag(WriteStringResult22, WriteStringResult2_21, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult22, WriteBufferResult2_21 = ProtoModule.writeBuffer(WriteTagResult65, WriteTagResult2_64, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult66, WriteTagResult2_65 = ProtoModule.writeTag(Buf, Count, 22, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult66, WriteTagResult2_65, WriteBufferResult22, WriteBufferResult2_21)
		end
	end
	if self.universe_user_vote_feedback_metadata ~= nil and next(self.universe_user_vote_feedback_metadata) ~= nil then
		for i22, value22 in self.universe_user_vote_feedback_metadata do
			local WriteTagResult67, WriteTagResult2_66 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult23, WriteStringResult2_22 = ProtoModule.writeString(WriteTagResult67, WriteTagResult2_66, i22)
			local EncodeResult = value22:encode()
			local WriteTagResult68, WriteTagResult2_67 = ProtoModule.writeTag(WriteStringResult23, WriteStringResult2_22, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult23, WriteBufferResult2_22 = ProtoModule.writeBuffer(WriteTagResult68, WriteTagResult2_67, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult69, WriteTagResult2_68 = ProtoModule.writeTag(Buf, Count, 23, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult69, WriteTagResult2_68, WriteBufferResult23, WriteBufferResult2_22)
		end
	end
	if self.moment ~= nil and next(self.moment) ~= nil then
		for i23, value23 in self.moment do
			local WriteTagResult70, WriteTagResult2_69 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult24, WriteStringResult2_23 = ProtoModule.writeString(WriteTagResult70, WriteTagResult2_69, i23)
			local EncodeResult = value23:encode()
			local WriteTagResult71, WriteTagResult2_70 = ProtoModule.writeTag(WriteStringResult24, WriteStringResult2_23, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult24, WriteBufferResult2_23 = ProtoModule.writeBuffer(WriteTagResult71, WriteTagResult2_70, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult72, WriteTagResult2_71 = ProtoModule.writeTag(Buf, Count, 24, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult72, WriteTagResult2_71, WriteBufferResult24, WriteBufferResult2_23)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy), t (copy), BadgeDataModule (copy), UniverseDataModule (copy), CreatorDataModule (copy), EventDataModule (copy), SongDataModule (copy), GamePassDataModule (copy), MediaAssetDataModule (copy), SocialLinkDataModule (copy), GameDeveloperProductDataModule (copy), GameSubscriptionDataModule (copy), MarketplaceCatalogCategoryDataModule (copy), MarketplaceAssetDataModule (copy), MarketplaceBundleDataModule (copy), MarketplaceLookDataModule (copy), CatalogSortDataModule (copy), AgeRecommendationDataModule (copy), UniverseUserFollowDataModule (copy), UniverseUserVoteDataModule (copy), UserProfileDataModule (copy), UniverseUserFavoriteDataModule (copy), PlayabilityDataModule (copy), UniverseUserFollowLimitDataModule (copy), UniverseUserVoteFeedbackMetadataDataModule (copy), MomentDataModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v319 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v319 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_BadgeEntry.decode(Buffer1)
				local NewResult = BadgeDataModule.BadgeData.new()
				NewModule.badge[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_UniverseEntry.decode(Buffer2)
				local NewResult = UniverseDataModule.UniverseData.new()
				NewModule.universe[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_CreatorEntry.decode(Buffer3)
				local NewResult = CreatorDataModule.CreatorData.new()
				NewModule.creator[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_EventEntry.decode(Buffer4)
				local NewResult = EventDataModule.EventData.new()
				NewModule.event[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_SongEntry.decode(Buffer5)
				local NewResult = SongDataModule.SongData.new()
				NewModule.song[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_GamePassEntry.decode(Buffer6)
				local NewResult = GamePassDataModule.GamePassData.new()
				NewModule.game_pass[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_MediaAssetEntry.decode(Buffer7)
				local NewResult = MediaAssetDataModule.MediaAssetData.new()
				NewModule.media_asset[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 8 then
				local Buffer9
				Buffer9, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_SocialLinkEntry.decode(Buffer9)
				local NewResult = SocialLinkDataModule.SocialLinkData.new()
				NewModule.social_link[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 9 then
				local Buffer10
				Buffer10, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_GameDeveloperProductEntry.decode(Buffer10)
				local NewResult = GameDeveloperProductDataModule.GameDeveloperProductData.new()
				NewModule.game_developer_product[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 10 then
				local Buffer12
				Buffer12, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_GameSubscriptionEntry.decode(Buffer12)
				local NewResult = GameSubscriptionDataModule.GameSubscriptionData.new()
				NewModule.game_subscription[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 11 then
				local Buffer13
				Buffer13, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_MarketplaceCatalogCategoryEntry.decode(Buffer13)
				local NewResult = MarketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.new()
				NewModule.marketplace_catalog_category[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 12 then
				local Buffer14
				Buffer14, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_MarketplaceAssetEntry.decode(Buffer14)
				local NewResult = MarketplaceAssetDataModule.MarketplaceAssetData.new()
				NewModule.marketplace_asset[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 13 then
				local Buffer15
				Buffer15, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_MarketplaceBundleEntry.decode(Buffer15)
				local NewResult = MarketplaceBundleDataModule.MarketplaceBundleData.new()
				NewModule.marketplace_bundle[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 14 then
				local Buffer16
				Buffer16, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_MarketplaceLookEntry.decode(Buffer16)
				local NewResult = MarketplaceLookDataModule.MarketplaceLookData.new()
				NewModule.marketplace_look[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 15 then
				local Buffer17
				Buffer17, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_CatalogSortEntry.decode(Buffer17)
				local NewResult = CatalogSortDataModule.CatalogSortData.new()
				NewModule.catalog_sort[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 16 then
				local Buffer18
				Buffer18, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_AgeRecommendationEntry.decode(Buffer18)
				local NewResult = AgeRecommendationDataModule.AgeRecommendationData.new()
				NewModule.age_recommendation[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 17 then
				local Buffer19
				Buffer19, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_UniverseUserFollowEntry.decode(Buffer19)
				local NewResult = UniverseUserFollowDataModule.UniverseUserFollowData.new()
				NewModule.universe_user_follow[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 18 then
				local Buffer20
				Buffer20, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_UniverseUserVoteEntry.decode(Buffer20)
				local NewResult = UniverseUserVoteDataModule.UniverseUserVoteData.new()
				NewModule.universe_user_vote[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 19 then
				local Buffer21
				Buffer21, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_UserProfileEntry.decode(Buffer21)
				local NewResult = UserProfileDataModule.UserProfileData.new()
				NewModule.user_profile[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 20 then
				local Buffer8
				Buffer8, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_UniverseUserFavoriteEntry.decode(Buffer8)
				local NewResult = UniverseUserFavoriteDataModule.UniverseUserFavoriteData.new()
				NewModule.universe_user_favorite[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 21 then
				local Buffer22
				Buffer22, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_PlayabilityEntry.decode(Buffer22)
				local NewResult = PlayabilityDataModule.PlayabilityData.new()
				NewModule.playability[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 22 then
				local Buffer11
				Buffer11, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_UniverseUserFollowLimitEntry.decode(Buffer11)
				local NewResult = UniverseUserFollowLimitDataModule.UniverseUserFollowLimitData.new()
				NewModule.universe_user_follow_limit[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 23 then
				local Buffer23
				Buffer23, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_UniverseUserVoteFeedbackMetadataEntry.decode(Buffer23)
				local NewResult = UniverseUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.new()
				NewModule.universe_user_vote_feedback_metadata[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 24 then
				local Buffer24
				Buffer24, v319 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_MomentEntry.decode(Buffer24)
				local NewResult = MomentDataModule.MomentData.new()
				NewModule.moment[DecodeResult.key or ""] = DecodeResult.value or NewResult
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v319 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v319 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	local t = {}
	
	if self.badge ~= nil and next(self.badge) ~= nil then
		local Badge = {}
		
		for i, value in self.badge do
			Badge[i] = value:jsonEncode()
		end
		t.badge = Badge
	end
	if self.universe ~= nil and next(self.universe) ~= nil then
		local Universe = {}
		
		for i1, value1 in self.universe do
			Universe[i1] = value1:jsonEncode()
		end
		t.universe = Universe
	end
	if self.creator ~= nil and next(self.creator) ~= nil then
		local Creator = {}
		
		for i2, value2 in self.creator do
			Creator[i2] = value2:jsonEncode()
		end
		t.creator = Creator
	end
	if self.event ~= nil and next(self.event) ~= nil then
		local Event = {}
		
		for i3, value3 in self.event do
			Event[i3] = value3:jsonEncode()
		end
		t.event = Event
	end
	if self.song ~= nil and next(self.song) ~= nil then
		local Song = {}
		
		for i4, value4 in self.song do
			Song[i4] = value4:jsonEncode()
		end
		t.song = Song
	end
	if self.game_pass ~= nil and next(self.game_pass) ~= nil then
		local GamePass = {}
		
		for i5, value5 in self.game_pass do
			GamePass[i5] = value5:jsonEncode()
		end
		t.gamePass = GamePass
	end
	if self.media_asset ~= nil and next(self.media_asset) ~= nil then
		local MediaAsset = {}
		
		for i6, value6 in self.media_asset do
			MediaAsset[i6] = value6:jsonEncode()
		end
		t.mediaAsset = MediaAsset
	end
	if self.social_link ~= nil and next(self.social_link) ~= nil then
		local SocialLink = {}
		
		for i7, value7 in self.social_link do
			SocialLink[i7] = value7:jsonEncode()
		end
		t.socialLink = SocialLink
	end
	if self.game_developer_product ~= nil and next(self.game_developer_product) ~= nil then
		local GameDeveloperProduct = {}
		
		for i8, value8 in self.game_developer_product do
			GameDeveloperProduct[i8] = value8:jsonEncode()
		end
		t.gameDeveloperProduct = GameDeveloperProduct
	end
	if self.game_subscription ~= nil and next(self.game_subscription) ~= nil then
		local GameSubscription = {}
		
		for i9, value9 in self.game_subscription do
			GameSubscription[i9] = value9:jsonEncode()
		end
		t.gameSubscription = GameSubscription
	end
	if self.marketplace_catalog_category ~= nil and next(self.marketplace_catalog_category) ~= nil then
		local MarketplaceCatalogCategory = {}
		
		for i10, value10 in self.marketplace_catalog_category do
			MarketplaceCatalogCategory[i10] = value10:jsonEncode()
		end
		t.marketplaceCatalogCategory = MarketplaceCatalogCategory
	end
	if self.marketplace_asset ~= nil and next(self.marketplace_asset) ~= nil then
		local MarketplaceAsset = {}
		
		for i11, value11 in self.marketplace_asset do
			MarketplaceAsset[i11] = value11:jsonEncode()
		end
		t.marketplaceAsset = MarketplaceAsset
	end
	if self.marketplace_bundle ~= nil and next(self.marketplace_bundle) ~= nil then
		local MarketplaceBundle = {}
		
		for i12, value12 in self.marketplace_bundle do
			MarketplaceBundle[i12] = value12:jsonEncode()
		end
		t.marketplaceBundle = MarketplaceBundle
	end
	if self.marketplace_look ~= nil and next(self.marketplace_look) ~= nil then
		local MarketplaceLook = {}
		
		for i13, value13 in self.marketplace_look do
			MarketplaceLook[i13] = value13:jsonEncode()
		end
		t.marketplaceLook = MarketplaceLook
	end
	if self.catalog_sort ~= nil and next(self.catalog_sort) ~= nil then
		local CatalogSort = {}
		
		for i14, value14 in self.catalog_sort do
			CatalogSort[i14] = value14:jsonEncode()
		end
		t.catalogSort = CatalogSort
	end
	if self.age_recommendation ~= nil and next(self.age_recommendation) ~= nil then
		local AgeRecommendation = {}
		
		for i16, value16 in self.age_recommendation do
			AgeRecommendation[i16] = value16:jsonEncode()
		end
		t.ageRecommendation = AgeRecommendation
	end
	if self.universe_user_follow ~= nil and next(self.universe_user_follow) ~= nil then
		local UniverseUserFollow = {}
		
		for i18, value18 in self.universe_user_follow do
			UniverseUserFollow[i18] = value18:jsonEncode()
		end
		t.universeUserFollow = UniverseUserFollow
	end
	if self.universe_user_vote ~= nil and next(self.universe_user_vote) ~= nil then
		local UniverseUserVote = {}
		
		for i19, value19 in self.universe_user_vote do
			UniverseUserVote[i19] = value19:jsonEncode()
		end
		t.universeUserVote = UniverseUserVote
	end
	if self.user_profile ~= nil and next(self.user_profile) ~= nil then
		local UserProfile = {}
		
		for i20, value20 in self.user_profile do
			UserProfile[i20] = value20:jsonEncode()
		end
		t.userProfile = UserProfile
	end
	if self.universe_user_favorite ~= nil and next(self.universe_user_favorite) ~= nil then
		local UniverseUserFavorite = {}
		
		for i21, value21 in self.universe_user_favorite do
			UniverseUserFavorite[i21] = value21:jsonEncode()
		end
		t.universeUserFavorite = UniverseUserFavorite
	end
	if self.playability ~= nil and next(self.playability) ~= nil then
		local Playability = {}
		
		for i22, value22 in self.playability do
			Playability[i22] = value22:jsonEncode()
		end
		t.playability = Playability
	end
	if self.universe_user_follow_limit ~= nil and next(self.universe_user_follow_limit) ~= nil then
		local UniverseUserFollowLimit = {}
		
		for i17, value17 in self.universe_user_follow_limit do
			UniverseUserFollowLimit[i17] = value17:jsonEncode()
		end
		t.universeUserFollowLimit = UniverseUserFollowLimit
	end
	if self.universe_user_vote_feedback_metadata ~= nil and next(self.universe_user_vote_feedback_metadata) ~= nil then
		local UniverseUserVoteFeedbackMetadata = {}
		
		for i23, value23 in self.universe_user_vote_feedback_metadata do
			UniverseUserVoteFeedbackMetadata[i23] = value23:jsonEncode()
		end
		t.universeUserVoteFeedbackMetadata = UniverseUserVoteFeedbackMetadata
	end
	if self.moment ~= nil and next(self.moment) ~= nil then
		local Moment = {}
		
		for i15, value15 in self.moment do
			Moment[i15] = value15:jsonEncode()
		end
		t.moment = Moment
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), BadgeDataModule (copy), UniverseDataModule (copy), CreatorDataModule (copy), EventDataModule (copy), SongDataModule (copy), GamePassDataModule (copy), MediaAssetDataModule (copy), SocialLinkDataModule (copy), GameDeveloperProductDataModule (copy), GameSubscriptionDataModule (copy), MarketplaceCatalogCategoryDataModule (copy), MarketplaceAssetDataModule (copy), MarketplaceBundleDataModule (copy), MarketplaceLookDataModule (copy), CatalogSortDataModule (copy), AgeRecommendationDataModule (copy), UniverseUserFollowDataModule (copy), UniverseUserVoteDataModule (copy), UserProfileDataModule (copy), UniverseUserFavoriteDataModule (copy), PlayabilityDataModule (copy), UniverseUserFollowLimitDataModule (copy), UniverseUserVoteFeedbackMetadataDataModule (copy), MomentDataModule (copy)
	local NewModule = Module.new()
	
	if self.badge ~= nil then
		local Badge = {}
		
		for i, value in self.badge do
			Badge[i] = BadgeDataModule.BadgeData.jsonDecode(value)
		end
		NewModule.badge = Badge
	end
	if self.universe ~= nil then
		local Universe = {}
		
		for i1, value1 in self.universe do
			Universe[i1] = UniverseDataModule.UniverseData.jsonDecode(value1)
		end
		NewModule.universe = Universe
	end
	if self.creator ~= nil then
		local Creator = {}
		
		for i2, value2 in self.creator do
			Creator[i2] = CreatorDataModule.CreatorData.jsonDecode(value2)
		end
		NewModule.creator = Creator
	end
	if self.event ~= nil then
		local Event = {}
		
		for i3, value3 in self.event do
			Event[i3] = EventDataModule.EventData.jsonDecode(value3)
		end
		NewModule.event = Event
	end
	if self.song ~= nil then
		local Song = {}
		
		for i4, value4 in self.song do
			Song[i4] = SongDataModule.SongData.jsonDecode(value4)
		end
		NewModule.song = Song
	end
	if self.game_pass ~= nil then
		local Game_pass = {}
		
		for i5, value5 in self.game_pass do
			Game_pass[i5] = GamePassDataModule.GamePassData.jsonDecode(value5)
		end
		NewModule.game_pass = Game_pass
	end
	if self.gamePass ~= nil then
		local Game_pass = {}
		
		for i7, value7 in self.gamePass do
			Game_pass[i7] = GamePassDataModule.GamePassData.jsonDecode(value7)
		end
		NewModule.game_pass = Game_pass
	end
	if self.media_asset ~= nil then
		local Media_asset = {}
		
		for i8, value8 in self.media_asset do
			Media_asset[i8] = MediaAssetDataModule.MediaAssetData.jsonDecode(value8)
		end
		NewModule.media_asset = Media_asset
	end
	if self.mediaAsset ~= nil then
		local Media_asset = {}
		
		for i9, value9 in self.mediaAsset do
			Media_asset[i9] = MediaAssetDataModule.MediaAssetData.jsonDecode(value9)
		end
		NewModule.media_asset = Media_asset
	end
	if self.social_link ~= nil then
		local Social_link = {}
		
		for i10, value10 in self.social_link do
			Social_link[i10] = SocialLinkDataModule.SocialLinkData.jsonDecode(value10)
		end
		NewModule.social_link = Social_link
	end
	if self.socialLink ~= nil then
		local Social_link = {}
		
		for i11, value11 in self.socialLink do
			Social_link[i11] = SocialLinkDataModule.SocialLinkData.jsonDecode(value11)
		end
		NewModule.social_link = Social_link
	end
	if self.game_developer_product ~= nil then
		local Game_developer_product = {}
		
		for i12, value12 in self.game_developer_product do
			Game_developer_product[i12] = GameDeveloperProductDataModule.GameDeveloperProductData.jsonDecode(value12)
		end
		NewModule.game_developer_product = Game_developer_product
	end
	if self.gameDeveloperProduct ~= nil then
		local Game_developer_product = {}
		
		for i13, value13 in self.gameDeveloperProduct do
			Game_developer_product[i13] = GameDeveloperProductDataModule.GameDeveloperProductData.jsonDecode(value13)
		end
		NewModule.game_developer_product = Game_developer_product
	end
	if self.game_subscription ~= nil then
		local Game_subscription = {}
		
		for i14, value14 in self.game_subscription do
			Game_subscription[i14] = GameSubscriptionDataModule.GameSubscriptionData.jsonDecode(value14)
		end
		NewModule.game_subscription = Game_subscription
	end
	if self.gameSubscription ~= nil then
		local Game_subscription = {}
		
		for i15, value15 in self.gameSubscription do
			Game_subscription[i15] = GameSubscriptionDataModule.GameSubscriptionData.jsonDecode(value15)
		end
		NewModule.game_subscription = Game_subscription
	end
	if self.marketplace_catalog_category ~= nil then
		local Marketplace_catalog_category = {}
		
		for i17, value17 in self.marketplace_catalog_category do
			Marketplace_catalog_category[i17] = MarketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.jsonDecode(value17)
		end
		NewModule.marketplace_catalog_category = Marketplace_catalog_category
	end
	if self.marketplaceCatalogCategory ~= nil then
		local Marketplace_catalog_category = {}
		
		for i18, value18 in self.marketplaceCatalogCategory do
			Marketplace_catalog_category[i18] = MarketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.jsonDecode(value18)
		end
		NewModule.marketplace_catalog_category = Marketplace_catalog_category
	end
	if self.marketplace_asset ~= nil then
		local Marketplace_asset = {}
		
		for i19, value19 in self.marketplace_asset do
			Marketplace_asset[i19] = MarketplaceAssetDataModule.MarketplaceAssetData.jsonDecode(value19)
		end
		NewModule.marketplace_asset = Marketplace_asset
	end
	if self.marketplaceAsset ~= nil then
		local Marketplace_asset = {}
		
		for i20, value20 in self.marketplaceAsset do
			Marketplace_asset[i20] = MarketplaceAssetDataModule.MarketplaceAssetData.jsonDecode(value20)
		end
		NewModule.marketplace_asset = Marketplace_asset
	end
	if self.marketplace_bundle ~= nil then
		local Marketplace_bundle = {}
		
		for i21, value21 in self.marketplace_bundle do
			Marketplace_bundle[i21] = MarketplaceBundleDataModule.MarketplaceBundleData.jsonDecode(value21)
		end
		NewModule.marketplace_bundle = Marketplace_bundle
	end
	if self.marketplaceBundle ~= nil then
		local Marketplace_bundle = {}
		
		for i23, value23 in self.marketplaceBundle do
			Marketplace_bundle[i23] = MarketplaceBundleDataModule.MarketplaceBundleData.jsonDecode(value23)
		end
		NewModule.marketplace_bundle = Marketplace_bundle
	end
	if self.marketplace_look ~= nil then
		local Marketplace_look = {}
		
		for i24, value24 in self.marketplace_look do
			Marketplace_look[i24] = MarketplaceLookDataModule.MarketplaceLookData.jsonDecode(value24)
		end
		NewModule.marketplace_look = Marketplace_look
	end
	if self.marketplaceLook ~= nil then
		local Marketplace_look = {}
		
		for i26, value26 in self.marketplaceLook do
			Marketplace_look[i26] = MarketplaceLookDataModule.MarketplaceLookData.jsonDecode(value26)
		end
		NewModule.marketplace_look = Marketplace_look
	end
	if self.catalog_sort ~= nil then
		local Catalog_sort = {}
		
		for i27, value27 in self.catalog_sort do
			Catalog_sort[i27] = CatalogSortDataModule.CatalogSortData.jsonDecode(value27)
		end
		NewModule.catalog_sort = Catalog_sort
	end
	if self.catalogSort ~= nil then
		local Catalog_sort = {}
		
		for i28, value28 in self.catalogSort do
			Catalog_sort[i28] = CatalogSortDataModule.CatalogSortData.jsonDecode(value28)
		end
		NewModule.catalog_sort = Catalog_sort
	end
	if self.age_recommendation ~= nil then
		local Age_recommendation = {}
		
		for i25, value25 in self.age_recommendation do
			Age_recommendation[i25] = AgeRecommendationDataModule.AgeRecommendationData.jsonDecode(value25)
		end
		NewModule.age_recommendation = Age_recommendation
	end
	if self.ageRecommendation ~= nil then
		local Age_recommendation = {}
		
		for i29, value29 in self.ageRecommendation do
			Age_recommendation[i29] = AgeRecommendationDataModule.AgeRecommendationData.jsonDecode(value29)
		end
		NewModule.age_recommendation = Age_recommendation
	end
	if self.universe_user_follow ~= nil then
		local Universe_user_follow = {}
		
		for i30, value30 in self.universe_user_follow do
			Universe_user_follow[i30] = UniverseUserFollowDataModule.UniverseUserFollowData.jsonDecode(value30)
		end
		NewModule.universe_user_follow = Universe_user_follow
	end
	if self.universeUserFollow ~= nil then
		local Universe_user_follow = {}
		
		for i31, value31 in self.universeUserFollow do
			Universe_user_follow[i31] = UniverseUserFollowDataModule.UniverseUserFollowData.jsonDecode(value31)
		end
		NewModule.universe_user_follow = Universe_user_follow
	end
	if self.universe_user_vote ~= nil then
		local Universe_user_vote1 = {}
		
		for i22, value22 in self.universe_user_vote do
			Universe_user_vote1[i22] = UniverseUserVoteDataModule.UniverseUserVoteData.jsonDecode(value22)
		end
		NewModule.universe_user_vote = Universe_user_vote1
	end
	if self.universeUserVote ~= nil then
		local Universe_user_vote = {}
		
		for i16, value16 in self.universeUserVote do
			Universe_user_vote[i16] = UniverseUserVoteDataModule.UniverseUserVoteData.jsonDecode(value16)
		end
		NewModule.universe_user_vote = Universe_user_vote
	end
	if self.user_profile ~= nil then
		local User_profile = {}
		
		for i32, value32 in self.user_profile do
			User_profile[i32] = UserProfileDataModule.UserProfileData.jsonDecode(value32)
		end
		NewModule.user_profile = User_profile
	end
	if self.userProfile ~= nil then
		local User_profile = {}
		
		for i33, value33 in self.userProfile do
			User_profile[i33] = UserProfileDataModule.UserProfileData.jsonDecode(value33)
		end
		NewModule.user_profile = User_profile
	end
	if self.universe_user_favorite ~= nil then
		local Universe_user_favorite = {}
		
		for i34, value34 in self.universe_user_favorite do
			Universe_user_favorite[i34] = UniverseUserFavoriteDataModule.UniverseUserFavoriteData.jsonDecode(value34)
		end
		NewModule.universe_user_favorite = Universe_user_favorite
	end
	if self.universeUserFavorite ~= nil then
		local Universe_user_favorite = {}
		
		for i35, value35 in self.universeUserFavorite do
			Universe_user_favorite[i35] = UniverseUserFavoriteDataModule.UniverseUserFavoriteData.jsonDecode(value35)
		end
		NewModule.universe_user_favorite = Universe_user_favorite
	end
	if self.playability ~= nil then
		local Playability = {}
		
		for i36, value36 in self.playability do
			Playability[i36] = PlayabilityDataModule.PlayabilityData.jsonDecode(value36)
		end
		NewModule.playability = Playability
	end
	if self.universe_user_follow_limit ~= nil then
		local Universe_user_follow_limit1 = {}
		
		for i37, value37 in self.universe_user_follow_limit do
			Universe_user_follow_limit1[i37] = UniverseUserFollowLimitDataModule.UniverseUserFollowLimitData.jsonDecode(value37)
		end
		NewModule.universe_user_follow_limit = Universe_user_follow_limit1
	end
	if self.universeUserFollowLimit ~= nil then
		local Universe_user_follow_limit = {}
		
		for i6, value6 in self.universeUserFollowLimit do
			Universe_user_follow_limit[i6] = UniverseUserFollowLimitDataModule.UniverseUserFollowLimitData.jsonDecode(value6)
		end
		NewModule.universe_user_follow_limit = Universe_user_follow_limit
	end
	if self.universe_user_vote_feedback_metadata ~= nil then
		local Universe_user_vote_feedback_metadata = {}
		
		for i38, value38 in self.universe_user_vote_feedback_metadata do
			Universe_user_vote_feedback_metadata[i38] = UniverseUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.jsonDecode(value38)
		end
		NewModule.universe_user_vote_feedback_metadata = Universe_user_vote_feedback_metadata
	end
	if self.universeUserVoteFeedbackMetadata ~= nil then
		local Universe_user_vote_feedback_metadata = {}
		
		for i39, value39 in self.universeUserVoteFeedbackMetadata do
			Universe_user_vote_feedback_metadata[i39] = UniverseUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.jsonDecode(value39)
		end
		NewModule.universe_user_vote_feedback_metadata = Universe_user_vote_feedback_metadata
	end
	if self.moment ~= nil then
		local Moment = {}
		
		for i40, value40 in self.moment do
			Moment[i40] = MomentDataModule.MomentData.jsonDecode(value40)
		end
		NewModule.moment = Moment
	end
	return NewModule
end

Module.descriptor = {
	name = "HydrationContent",
	fullName = "roblox.apppageplatform.shared.v1beta1.HydrationContent"
}
t.HydrationContent = Module
TypeRegistryModule.default:register(t.HydrationContent)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1)
	-- upvalues: Module1 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module1))
end

function Module1:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf)
	-- upvalues: Module1 (copy), ProtoModule (copy), BadgeDataModule (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v474 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v474 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v474 = ProtoModule.readBuffer(Buf, v2)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v474 = ProtoModule.readBuffer(Buf, v2)
				NewModule.value = BadgeDataModule.BadgeData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v474 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v474 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module1:jsonDecode()
	-- upvalues: Module1 (copy), BadgeDataModule (copy)
	local NewModule = Module1.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = BadgeDataModule.BadgeData.jsonDecode(self.value)
	end
	return NewModule
end

Module1.descriptor = {
	name = "HydrationContent_BadgeEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeEntry"
}
t.HydrationContent_BadgeEntry = Module1
TypeRegistryModule.default:register(t.HydrationContent_BadgeEntry)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1)
	-- upvalues: Module2 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module2))
end

function Module2:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf)
	-- upvalues: Module2 (copy), ProtoModule (copy), UniverseDataModule (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v494 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v494 = ProtoModule.readVarInt(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v494 = ProtoModule.readBuffer(Buf, v3)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v494 = ProtoModule.readBuffer(Buf, v3)
				NewModule.value = UniverseDataModule.UniverseData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v494 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v494 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module2:jsonDecode()
	-- upvalues: Module2 (copy), UniverseDataModule (copy)
	local NewModule = Module2.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = UniverseDataModule.UniverseData.jsonDecode(self.value)
	end
	return NewModule
end

Module2.descriptor = {
	name = "HydrationContent_UniverseEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseEntry"
}
t.HydrationContent_UniverseEntry = Module2
TypeRegistryModule.default:register(t.HydrationContent_UniverseEntry)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1)
	-- upvalues: Module3 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module3))
end

function Module3:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf)
	-- upvalues: Module3 (copy), ProtoModule (copy), CreatorDataModule (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v514 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v514 = ProtoModule.readVarInt(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v514 = ProtoModule.readBuffer(Buf, v4)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v514 = ProtoModule.readBuffer(Buf, v4)
				NewModule.value = CreatorDataModule.CreatorData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v514 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v514 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module3:jsonDecode()
	-- upvalues: Module3 (copy), CreatorDataModule (copy)
	local NewModule = Module3.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = CreatorDataModule.CreatorData.jsonDecode(self.value)
	end
	return NewModule
end

Module3.descriptor = {
	name = "HydrationContent_CreatorEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.CreatorEntry"
}
t.HydrationContent_CreatorEntry = Module3
TypeRegistryModule.default:register(t.HydrationContent_CreatorEntry)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1)
	-- upvalues: Module4 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module4))
end

function Module4:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module4.decode(Buf)
	-- upvalues: Module4 (copy), ProtoModule (copy), EventDataModule (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v534 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v534 = ProtoModule.readVarInt(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v534 = ProtoModule.readBuffer(Buf, v5)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v534 = ProtoModule.readBuffer(Buf, v5)
				NewModule.value = EventDataModule.EventData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v534 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v534 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module4:jsonDecode()
	-- upvalues: Module4 (copy), EventDataModule (copy)
	local NewModule = Module4.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = EventDataModule.EventData.jsonDecode(self.value)
	end
	return NewModule
end

Module4.descriptor = {
	name = "HydrationContent_EventEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventEntry"
}
t.HydrationContent_EventEntry = Module4
TypeRegistryModule.default:register(t.HydrationContent_EventEntry)
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1)
	-- upvalues: Module5 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module5))
end

function Module5:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module5.decode(Buf)
	-- upvalues: Module5 (copy), ProtoModule (copy), SongDataModule (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v554 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v554 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v554 = ProtoModule.readBuffer(Buf, v6)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v554 = ProtoModule.readBuffer(Buf, v6)
				NewModule.value = SongDataModule.SongData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v554 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v554 = ProtoModule.readFixed64(Buf, v6)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module5:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module5:jsonDecode()
	-- upvalues: Module5 (copy), SongDataModule (copy)
	local NewModule = Module5.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = SongDataModule.SongData.jsonDecode(self.value)
	end
	return NewModule
end

Module5.descriptor = {
	name = "HydrationContent_SongEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongEntry"
}
t.HydrationContent_SongEntry = Module5
TypeRegistryModule.default:register(t.HydrationContent_SongEntry)
local Module6 = {}
Module6.__index = Module6

function Module6.new(p1)
	-- upvalues: Module6 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module6))
end

function Module6:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module6.decode(Buf)
	-- upvalues: Module6 (copy), ProtoModule (copy), GamePassDataModule (copy)
	local NewModule = Module6.new()
	local v7 = 0
	while v7 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v574 = ProtoModule.readTag(Buf, v7)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v574 = ProtoModule.readVarInt(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v574 = ProtoModule.readBuffer(Buf, v7)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v574 = ProtoModule.readBuffer(Buf, v7)
				NewModule.value = GamePassDataModule.GamePassData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v7)
				v7 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v574 = ProtoModule.readFixed32(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v574 = ProtoModule.readFixed64(Buf, v7)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module6:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module6:jsonDecode()
	-- upvalues: Module6 (copy), GamePassDataModule (copy)
	local NewModule = Module6.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = GamePassDataModule.GamePassData.jsonDecode(self.value)
	end
	return NewModule
end

Module6.descriptor = {
	name = "HydrationContent_GamePassEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassEntry"
}
t.HydrationContent_GamePassEntry = Module6
TypeRegistryModule.default:register(t.HydrationContent_GamePassEntry)
local Module7 = {}
Module7.__index = Module7

function Module7.new(p1)
	-- upvalues: Module7 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module7))
end

function Module7:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module7.decode(Buf)
	-- upvalues: Module7 (copy), ProtoModule (copy), MediaAssetDataModule (copy)
	local NewModule = Module7.new()
	local v8 = 0
	while v8 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v594 = ProtoModule.readTag(Buf, v8)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v594 = ProtoModule.readVarInt(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v594 = ProtoModule.readBuffer(Buf, v8)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v594 = ProtoModule.readBuffer(Buf, v8)
				NewModule.value = MediaAssetDataModule.MediaAssetData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v8)
				v8 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v594 = ProtoModule.readFixed32(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v594 = ProtoModule.readFixed64(Buf, v8)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module7:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module7:jsonDecode()
	-- upvalues: Module7 (copy), MediaAssetDataModule (copy)
	local NewModule = Module7.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = MediaAssetDataModule.MediaAssetData.jsonDecode(self.value)
	end
	return NewModule
end

Module7.descriptor = {
	name = "HydrationContent_MediaAssetEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MediaAssetEntry"
}
t.HydrationContent_MediaAssetEntry = Module7
TypeRegistryModule.default:register(t.HydrationContent_MediaAssetEntry)
local Module8 = {}
Module8.__index = Module8

function Module8.new(p1)
	-- upvalues: Module8 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module8))
end

function Module8:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module8.decode(Buf)
	-- upvalues: Module8 (copy), ProtoModule (copy), SocialLinkDataModule (copy)
	local NewModule = Module8.new()
	local v9 = 0
	while v9 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v614 = ProtoModule.readTag(Buf, v9)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v614 = ProtoModule.readVarInt(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v614 = ProtoModule.readBuffer(Buf, v9)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v614 = ProtoModule.readBuffer(Buf, v9)
				NewModule.value = SocialLinkDataModule.SocialLinkData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v9)
				v9 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v614 = ProtoModule.readFixed32(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v614 = ProtoModule.readFixed64(Buf, v9)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module8:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module8:jsonDecode()
	-- upvalues: Module8 (copy), SocialLinkDataModule (copy)
	local NewModule = Module8.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = SocialLinkDataModule.SocialLinkData.jsonDecode(self.value)
	end
	return NewModule
end

Module8.descriptor = {
	name = "HydrationContent_SocialLinkEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkEntry"
}
t.HydrationContent_SocialLinkEntry = Module8
TypeRegistryModule.default:register(t.HydrationContent_SocialLinkEntry)
local Module9 = {}
Module9.__index = Module9

function Module9.new(p1)
	-- upvalues: Module9 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module9))
end

function Module9:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module9.decode(Buf)
	-- upvalues: Module9 (copy), ProtoModule (copy), GameDeveloperProductDataModule (copy)
	local NewModule = Module9.new()
	local v10 = 0
	while v10 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v634 = ProtoModule.readTag(Buf, v10)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v634 = ProtoModule.readVarInt(Buf, v10)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v634 = ProtoModule.readBuffer(Buf, v10)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v634 = ProtoModule.readBuffer(Buf, v10)
				NewModule.value = GameDeveloperProductDataModule.GameDeveloperProductData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v10)
				v10 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v634 = ProtoModule.readFixed32(Buf, v10)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v634 = ProtoModule.readFixed64(Buf, v10)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module9:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module9:jsonDecode()
	-- upvalues: Module9 (copy), GameDeveloperProductDataModule (copy)
	local NewModule = Module9.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = GameDeveloperProductDataModule.GameDeveloperProductData.jsonDecode(self.value)
	end
	return NewModule
end

Module9.descriptor = {
	name = "HydrationContent_GameDeveloperProductEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameDeveloperProductEntry"
}
t.HydrationContent_GameDeveloperProductEntry = Module9
TypeRegistryModule.default:register(t.HydrationContent_GameDeveloperProductEntry)
local Module10 = {}
Module10.__index = Module10

function Module10.new(p1)
	-- upvalues: Module10 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module10))
end

function Module10:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module10.decode(Buf)
	-- upvalues: Module10 (copy), ProtoModule (copy), GameSubscriptionDataModule (copy)
	local NewModule = Module10.new()
	local v11 = 0
	while v11 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v654 = ProtoModule.readTag(Buf, v11)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v654 = ProtoModule.readVarInt(Buf, v11)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v654 = ProtoModule.readBuffer(Buf, v11)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v654 = ProtoModule.readBuffer(Buf, v11)
				NewModule.value = GameSubscriptionDataModule.GameSubscriptionData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v11)
				v11 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v654 = ProtoModule.readFixed32(Buf, v11)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v654 = ProtoModule.readFixed64(Buf, v11)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module10:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module10:jsonDecode()
	-- upvalues: Module10 (copy), GameSubscriptionDataModule (copy)
	local NewModule = Module10.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = GameSubscriptionDataModule.GameSubscriptionData.jsonDecode(self.value)
	end
	return NewModule
end

Module10.descriptor = {
	name = "HydrationContent_GameSubscriptionEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameSubscriptionEntry"
}
t.HydrationContent_GameSubscriptionEntry = Module10
TypeRegistryModule.default:register(t.HydrationContent_GameSubscriptionEntry)
local Module11 = {}
Module11.__index = Module11

function Module11.new(p1)
	-- upvalues: Module11 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module11))
end

function Module11:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module11.decode(Buf)
	-- upvalues: Module11 (copy), ProtoModule (copy), MarketplaceCatalogCategoryDataModule (copy)
	local NewModule = Module11.new()
	local v12 = 0
	while v12 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v674 = ProtoModule.readTag(Buf, v12)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v674 = ProtoModule.readVarInt(Buf, v12)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v674 = ProtoModule.readBuffer(Buf, v12)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v674 = ProtoModule.readBuffer(Buf, v12)
				NewModule.value = MarketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v12)
				v12 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v674 = ProtoModule.readFixed32(Buf, v12)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v674 = ProtoModule.readFixed64(Buf, v12)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module11:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module11:jsonDecode()
	-- upvalues: Module11 (copy), MarketplaceCatalogCategoryDataModule (copy)
	local NewModule = Module11.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = MarketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.jsonDecode(self.value)
	end
	return NewModule
end

Module11.descriptor = {
	name = "HydrationContent_MarketplaceCatalogCategoryEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryEntry"
}
t.HydrationContent_MarketplaceCatalogCategoryEntry = Module11
TypeRegistryModule.default:register(t.HydrationContent_MarketplaceCatalogCategoryEntry)
local Module12 = {}
Module12.__index = Module12

function Module12.new(p1)
	-- upvalues: Module12 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module12))
end

function Module12:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module12.decode(Buf)
	-- upvalues: Module12 (copy), ProtoModule (copy), MarketplaceAssetDataModule (copy)
	local NewModule = Module12.new()
	local v13 = 0
	while v13 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v694 = ProtoModule.readTag(Buf, v13)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v694 = ProtoModule.readVarInt(Buf, v13)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v694 = ProtoModule.readBuffer(Buf, v13)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v694 = ProtoModule.readBuffer(Buf, v13)
				NewModule.value = MarketplaceAssetDataModule.MarketplaceAssetData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v13)
				v13 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v694 = ProtoModule.readFixed32(Buf, v13)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v694 = ProtoModule.readFixed64(Buf, v13)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module12:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module12:jsonDecode()
	-- upvalues: Module12 (copy), MarketplaceAssetDataModule (copy)
	local NewModule = Module12.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = MarketplaceAssetDataModule.MarketplaceAssetData.jsonDecode(self.value)
	end
	return NewModule
end

Module12.descriptor = {
	name = "HydrationContent_MarketplaceAssetEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceAssetEntry"
}
t.HydrationContent_MarketplaceAssetEntry = Module12
TypeRegistryModule.default:register(t.HydrationContent_MarketplaceAssetEntry)
local Module13 = {}
Module13.__index = Module13

function Module13.new(p1)
	-- upvalues: Module13 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module13))
end

function Module13:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module13.decode(Buf)
	-- upvalues: Module13 (copy), ProtoModule (copy), MarketplaceBundleDataModule (copy)
	local NewModule = Module13.new()
	local v14 = 0
	while v14 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v714 = ProtoModule.readTag(Buf, v14)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v714 = ProtoModule.readVarInt(Buf, v14)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v714 = ProtoModule.readBuffer(Buf, v14)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v714 = ProtoModule.readBuffer(Buf, v14)
				NewModule.value = MarketplaceBundleDataModule.MarketplaceBundleData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v14)
				v14 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v714 = ProtoModule.readFixed32(Buf, v14)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v714 = ProtoModule.readFixed64(Buf, v14)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module13:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module13:jsonDecode()
	-- upvalues: Module13 (copy), MarketplaceBundleDataModule (copy)
	local NewModule = Module13.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = MarketplaceBundleDataModule.MarketplaceBundleData.jsonDecode(self.value)
	end
	return NewModule
end

Module13.descriptor = {
	name = "HydrationContent_MarketplaceBundleEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceBundleEntry"
}
t.HydrationContent_MarketplaceBundleEntry = Module13
TypeRegistryModule.default:register(t.HydrationContent_MarketplaceBundleEntry)
local Module14 = {}
Module14.__index = Module14

function Module14.new(p1)
	-- upvalues: Module14 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module14))
end

function Module14:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module14.decode(Buf)
	-- upvalues: Module14 (copy), ProtoModule (copy), MarketplaceLookDataModule (copy)
	local NewModule = Module14.new()
	local v15 = 0
	while v15 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v734 = ProtoModule.readTag(Buf, v15)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v734 = ProtoModule.readVarInt(Buf, v15)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v734 = ProtoModule.readBuffer(Buf, v15)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v734 = ProtoModule.readBuffer(Buf, v15)
				NewModule.value = MarketplaceLookDataModule.MarketplaceLookData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v15)
				v15 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v734 = ProtoModule.readFixed32(Buf, v15)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v734 = ProtoModule.readFixed64(Buf, v15)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module14:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module14:jsonDecode()
	-- upvalues: Module14 (copy), MarketplaceLookDataModule (copy)
	local NewModule = Module14.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = MarketplaceLookDataModule.MarketplaceLookData.jsonDecode(self.value)
	end
	return NewModule
end

Module14.descriptor = {
	name = "HydrationContent_MarketplaceLookEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceLookEntry"
}
t.HydrationContent_MarketplaceLookEntry = Module14
TypeRegistryModule.default:register(t.HydrationContent_MarketplaceLookEntry)
local Module15 = {}
Module15.__index = Module15

function Module15.new(p1)
	-- upvalues: Module15 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module15))
end

function Module15:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module15.decode(Buf)
	-- upvalues: Module15 (copy), ProtoModule (copy), CatalogSortDataModule (copy)
	local NewModule = Module15.new()
	local v16 = 0
	while v16 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v754 = ProtoModule.readTag(Buf, v16)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v754 = ProtoModule.readVarInt(Buf, v16)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v754 = ProtoModule.readBuffer(Buf, v16)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v754 = ProtoModule.readBuffer(Buf, v16)
				NewModule.value = CatalogSortDataModule.CatalogSortData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v16)
				v16 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v754 = ProtoModule.readFixed32(Buf, v16)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v754 = ProtoModule.readFixed64(Buf, v16)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module15:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module15:jsonDecode()
	-- upvalues: Module15 (copy), CatalogSortDataModule (copy)
	local NewModule = Module15.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = CatalogSortDataModule.CatalogSortData.jsonDecode(self.value)
	end
	return NewModule
end

Module15.descriptor = {
	name = "HydrationContent_CatalogSortEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortEntry"
}
t.HydrationContent_CatalogSortEntry = Module15
TypeRegistryModule.default:register(t.HydrationContent_CatalogSortEntry)
local Module16 = {}
Module16.__index = Module16

function Module16.new(p1)
	-- upvalues: Module16 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module16))
end

function Module16:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module16.decode(Buf)
	-- upvalues: Module16 (copy), ProtoModule (copy), AgeRecommendationDataModule (copy)
	local NewModule = Module16.new()
	local v17 = 0
	while v17 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v774 = ProtoModule.readTag(Buf, v17)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v774 = ProtoModule.readVarInt(Buf, v17)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v774 = ProtoModule.readBuffer(Buf, v17)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v774 = ProtoModule.readBuffer(Buf, v17)
				NewModule.value = AgeRecommendationDataModule.AgeRecommendationData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v17)
				v17 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v774 = ProtoModule.readFixed32(Buf, v17)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v774 = ProtoModule.readFixed64(Buf, v17)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module16:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module16:jsonDecode()
	-- upvalues: Module16 (copy), AgeRecommendationDataModule (copy)
	local NewModule = Module16.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = AgeRecommendationDataModule.AgeRecommendationData.jsonDecode(self.value)
	end
	return NewModule
end

Module16.descriptor = {
	name = "HydrationContent_AgeRecommendationEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeRecommendationEntry"
}
t.HydrationContent_AgeRecommendationEntry = Module16
TypeRegistryModule.default:register(t.HydrationContent_AgeRecommendationEntry)
local Module17 = {}
Module17.__index = Module17

function Module17.new(p1)
	-- upvalues: Module17 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module17))
end

function Module17:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module17.decode(Buf)
	-- upvalues: Module17 (copy), ProtoModule (copy), UniverseUserFollowDataModule (copy)
	local NewModule = Module17.new()
	local v18 = 0
	while v18 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v794 = ProtoModule.readTag(Buf, v18)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v794 = ProtoModule.readVarInt(Buf, v18)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v794 = ProtoModule.readBuffer(Buf, v18)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v794 = ProtoModule.readBuffer(Buf, v18)
				NewModule.value = UniverseUserFollowDataModule.UniverseUserFollowData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v18)
				v18 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v794 = ProtoModule.readFixed32(Buf, v18)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v794 = ProtoModule.readFixed64(Buf, v18)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module17:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module17:jsonDecode()
	-- upvalues: Module17 (copy), UniverseUserFollowDataModule (copy)
	local NewModule = Module17.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = UniverseUserFollowDataModule.UniverseUserFollowData.jsonDecode(self.value)
	end
	return NewModule
end

Module17.descriptor = {
	name = "HydrationContent_UniverseUserFollowEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserFollowEntry"
}
t.HydrationContent_UniverseUserFollowEntry = Module17
TypeRegistryModule.default:register(t.HydrationContent_UniverseUserFollowEntry)
local Module18 = {}
Module18.__index = Module18

function Module18.new(p1)
	-- upvalues: Module18 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module18))
end

function Module18:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module18.decode(Buf)
	-- upvalues: Module18 (copy), ProtoModule (copy), UniverseUserVoteDataModule (copy)
	local NewModule = Module18.new()
	local v19 = 0
	while v19 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v814 = ProtoModule.readTag(Buf, v19)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v814 = ProtoModule.readVarInt(Buf, v19)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v814 = ProtoModule.readBuffer(Buf, v19)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v814 = ProtoModule.readBuffer(Buf, v19)
				NewModule.value = UniverseUserVoteDataModule.UniverseUserVoteData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v19)
				v19 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v814 = ProtoModule.readFixed32(Buf, v19)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v814 = ProtoModule.readFixed64(Buf, v19)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module18:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module18:jsonDecode()
	-- upvalues: Module18 (copy), UniverseUserVoteDataModule (copy)
	local NewModule = Module18.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = UniverseUserVoteDataModule.UniverseUserVoteData.jsonDecode(self.value)
	end
	return NewModule
end

Module18.descriptor = {
	name = "HydrationContent_UniverseUserVoteEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserVoteEntry"
}
t.HydrationContent_UniverseUserVoteEntry = Module18
TypeRegistryModule.default:register(t.HydrationContent_UniverseUserVoteEntry)
local Module19 = {}
Module19.__index = Module19

function Module19.new(p1)
	-- upvalues: Module19 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module19))
end

function Module19:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module19.decode(Buf)
	-- upvalues: Module19 (copy), ProtoModule (copy), UserProfileDataModule (copy)
	local NewModule = Module19.new()
	local v20 = 0
	while v20 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v834 = ProtoModule.readTag(Buf, v20)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v834 = ProtoModule.readVarInt(Buf, v20)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v834 = ProtoModule.readBuffer(Buf, v20)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v834 = ProtoModule.readBuffer(Buf, v20)
				NewModule.value = UserProfileDataModule.UserProfileData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v20)
				v20 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v834 = ProtoModule.readFixed32(Buf, v20)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v834 = ProtoModule.readFixed64(Buf, v20)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module19:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module19:jsonDecode()
	-- upvalues: Module19 (copy), UserProfileDataModule (copy)
	local NewModule = Module19.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = UserProfileDataModule.UserProfileData.jsonDecode(self.value)
	end
	return NewModule
end

Module19.descriptor = {
	name = "HydrationContent_UserProfileEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserProfileEntry"
}
t.HydrationContent_UserProfileEntry = Module19
TypeRegistryModule.default:register(t.HydrationContent_UserProfileEntry)
local Module20 = {}
Module20.__index = Module20

function Module20.new(p1)
	-- upvalues: Module20 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module20))
end

function Module20:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module20.decode(Buf)
	-- upvalues: Module20 (copy), ProtoModule (copy), UniverseUserFavoriteDataModule (copy)
	local NewModule = Module20.new()
	local v21 = 0
	while v21 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v854 = ProtoModule.readTag(Buf, v21)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v854 = ProtoModule.readVarInt(Buf, v21)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v854 = ProtoModule.readBuffer(Buf, v21)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v854 = ProtoModule.readBuffer(Buf, v21)
				NewModule.value = UniverseUserFavoriteDataModule.UniverseUserFavoriteData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v21)
				v21 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v854 = ProtoModule.readFixed32(Buf, v21)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v854 = ProtoModule.readFixed64(Buf, v21)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module20:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module20:jsonDecode()
	-- upvalues: Module20 (copy), UniverseUserFavoriteDataModule (copy)
	local NewModule = Module20.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = UniverseUserFavoriteDataModule.UniverseUserFavoriteData.jsonDecode(self.value)
	end
	return NewModule
end

Module20.descriptor = {
	name = "HydrationContent_UniverseUserFavoriteEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserFavoriteEntry"
}
t.HydrationContent_UniverseUserFavoriteEntry = Module20
TypeRegistryModule.default:register(t.HydrationContent_UniverseUserFavoriteEntry)
local Module21 = {}
Module21.__index = Module21

function Module21.new(p1)
	-- upvalues: Module21 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module21))
end

function Module21:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module21.decode(Buf)
	-- upvalues: Module21 (copy), ProtoModule (copy), PlayabilityDataModule (copy)
	local NewModule = Module21.new()
	local v22 = 0
	while v22 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v874 = ProtoModule.readTag(Buf, v22)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v874 = ProtoModule.readVarInt(Buf, v22)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v874 = ProtoModule.readBuffer(Buf, v22)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v874 = ProtoModule.readBuffer(Buf, v22)
				NewModule.value = PlayabilityDataModule.PlayabilityData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v22)
				v22 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v874 = ProtoModule.readFixed32(Buf, v22)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v874 = ProtoModule.readFixed64(Buf, v22)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module21:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module21:jsonDecode()
	-- upvalues: Module21 (copy), PlayabilityDataModule (copy)
	local NewModule = Module21.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = PlayabilityDataModule.PlayabilityData.jsonDecode(self.value)
	end
	return NewModule
end

Module21.descriptor = {
	name = "HydrationContent_PlayabilityEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.PlayabilityEntry"
}
t.HydrationContent_PlayabilityEntry = Module21
TypeRegistryModule.default:register(t.HydrationContent_PlayabilityEntry)
local Module22 = {}
Module22.__index = Module22

function Module22.new(p1)
	-- upvalues: Module22 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module22))
end

function Module22:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module22.decode(Buf)
	-- upvalues: Module22 (copy), ProtoModule (copy), UniverseUserFollowLimitDataModule (copy)
	local NewModule = Module22.new()
	local v23 = 0
	while v23 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v894 = ProtoModule.readTag(Buf, v23)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v894 = ProtoModule.readVarInt(Buf, v23)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v894 = ProtoModule.readBuffer(Buf, v23)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v894 = ProtoModule.readBuffer(Buf, v23)
				NewModule.value = UniverseUserFollowLimitDataModule.UniverseUserFollowLimitData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v23)
				v23 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v894 = ProtoModule.readFixed32(Buf, v23)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v894 = ProtoModule.readFixed64(Buf, v23)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module22:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module22:jsonDecode()
	-- upvalues: Module22 (copy), UniverseUserFollowLimitDataModule (copy)
	local NewModule = Module22.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = UniverseUserFollowLimitDataModule.UniverseUserFollowLimitData.jsonDecode(self.value)
	end
	return NewModule
end

Module22.descriptor = {
	name = "HydrationContent_UniverseUserFollowLimitEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserFollowLimitEntry"
}
t.HydrationContent_UniverseUserFollowLimitEntry = Module22
TypeRegistryModule.default:register(t.HydrationContent_UniverseUserFollowLimitEntry)
local Module23 = {}
Module23.__index = Module23

function Module23.new(p1)
	-- upvalues: Module23 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module23))
end

function Module23:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module23.decode(Buf)
	-- upvalues: Module23 (copy), ProtoModule (copy), UniverseUserVoteFeedbackMetadataDataModule (copy)
	local NewModule = Module23.new()
	local v24 = 0
	while v24 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v914 = ProtoModule.readTag(Buf, v24)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v914 = ProtoModule.readVarInt(Buf, v24)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v914 = ProtoModule.readBuffer(Buf, v24)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v914 = ProtoModule.readBuffer(Buf, v24)
				NewModule.value = UniverseUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v24)
				v24 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v914 = ProtoModule.readFixed32(Buf, v24)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v914 = ProtoModule.readFixed64(Buf, v24)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module23:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module23:jsonDecode()
	-- upvalues: Module23 (copy), UniverseUserVoteFeedbackMetadataDataModule (copy)
	local NewModule = Module23.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = UniverseUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.jsonDecode(self.value)
	end
	return NewModule
end

Module23.descriptor = {
	name = "HydrationContent_UniverseUserVoteFeedbackMetadataEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserVoteFeedbackMetadataEntry"
}
t.HydrationContent_UniverseUserVoteFeedbackMetadataEntry = Module23
TypeRegistryModule.default:register(t.HydrationContent_UniverseUserVoteFeedbackMetadataEntry)
local Module24 = {}
Module24.__index = Module24

function Module24.new(p1)
	-- upvalues: Module24 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module24))
end

function Module24:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module24.decode(Buf)
	-- upvalues: Module24 (copy), ProtoModule (copy), MomentDataModule (copy)
	local NewModule = Module24.new()
	local v25 = 0
	while v25 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v934 = ProtoModule.readTag(Buf, v25)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v934 = ProtoModule.readVarInt(Buf, v25)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v934 = ProtoModule.readBuffer(Buf, v25)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v934 = ProtoModule.readBuffer(Buf, v25)
				NewModule.value = MomentDataModule.MomentData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v25)
				v25 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v934 = ProtoModule.readFixed32(Buf, v25)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v934 = ProtoModule.readFixed64(Buf, v25)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module24:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module24:jsonDecode()
	-- upvalues: Module24 (copy), MomentDataModule (copy)
	local NewModule = Module24.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = MomentDataModule.MomentData.jsonDecode(self.value)
	end
	return NewModule
end

Module24.descriptor = {
	name = "HydrationContent_MomentEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentEntry"
}
t.HydrationContent_MomentEntry = Module24
TypeRegistryModule.default:register(t.HydrationContent_MomentEntry)

return { HydrationContent = t.HydrationContent }