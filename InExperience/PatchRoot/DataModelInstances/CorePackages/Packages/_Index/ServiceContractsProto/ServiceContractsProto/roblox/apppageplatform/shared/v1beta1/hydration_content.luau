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
local CommunityDataModule = require(script.Parent.community_data)
local CommunityUserMembershipDataModule = require(script.Parent.community_user_membership_data)
local FriendRecommendationDataModule = require(script.Parent.friend_recommendation_data)
local NotificationBadgeDataModule = require(script.Parent.notification_badge_data)
local UniversePrivateServerDataModule = require(script.Parent.universe_private_server_data)
local CollectibleItemDataModule = require(script.Parent.collectible_item_data)
local LeaderboardStatsDataModule = require(script.Parent.leaderboard_stats_data)
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
		moment = if p1 == nil or p1.moment == nil then {} else p1.moment,
		community = if p1 == nil or p1.community == nil then {} else p1.community,
		community_user_membership = if p1 == nil or p1.community_user_membership == nil then {} else p1.community_user_membership,
		friend_recommendation = if p1 == nil or p1.friend_recommendation == nil then {} else p1.friend_recommendation,
		universe_private_server = if p1 == nil or p1.universe_private_server == nil then {} else p1.universe_private_server,
		notification_badge = if p1 == nil or p1.notification_badge == nil then {} else p1.notification_badge,
		collectible_item = if p1 == nil or p1.collectible_item == nil then {} else p1.collectible_item,
		leaderboard_stats = if p1 == nil or p1.leaderboard_stats == nil then {} else p1.leaderboard_stats
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
		for i18, value17 in self.marketplace_look do
			local WriteTagResult46, WriteTagResult2_45 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult16, WriteStringResult2_15 = ProtoModule.writeString(WriteTagResult46, WriteTagResult2_45, i18)
			local EncodeResult = value17:encode()
			local WriteTagResult47, WriteTagResult2_46 = ProtoModule.writeTag(WriteStringResult16, WriteStringResult2_15, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult16, WriteBufferResult2_15 = ProtoModule.writeBuffer(WriteTagResult47, WriteTagResult2_46, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult48, WriteTagResult2_47 = ProtoModule.writeTag(Buf, Count, 14, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult48, WriteTagResult2_47, WriteBufferResult16, WriteBufferResult2_15)
		end
	end
	if self.catalog_sort ~= nil and next(self.catalog_sort) ~= nil then
		for i19, value18 in self.catalog_sort do
			local WriteTagResult13, WriteTagResult2_12 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult5, WriteStringResult2_4 = ProtoModule.writeString(WriteTagResult13, WriteTagResult2_12, i19)
			local EncodeResult = value18:encode()
			local WriteTagResult14, WriteTagResult2_13 = ProtoModule.writeTag(WriteStringResult5, WriteStringResult2_4, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult5, WriteBufferResult2_4 = ProtoModule.writeBuffer(WriteTagResult14, WriteTagResult2_13, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult15, WriteTagResult2_14 = ProtoModule.writeTag(Buf, Count, 15, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult15, WriteTagResult2_14, WriteBufferResult5, WriteBufferResult2_4)
		end
	end
	if self.age_recommendation ~= nil and next(self.age_recommendation) ~= nil then
		for i20, value19 in self.age_recommendation do
			local WriteTagResult28, WriteTagResult2_27 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult10, WriteStringResult2_9 = ProtoModule.writeString(WriteTagResult28, WriteTagResult2_27, i20)
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
		for i23, value22 in self.universe_user_vote do
			local WriteTagResult16, WriteTagResult2_15 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult6, WriteStringResult2_5 = ProtoModule.writeString(WriteTagResult16, WriteTagResult2_15, i23)
			local EncodeResult = value22:encode()
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
		for i21, value20 in self.universe_user_follow_limit do
			local WriteTagResult67, WriteTagResult2_66 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult23, WriteStringResult2_22 = ProtoModule.writeString(WriteTagResult67, WriteTagResult2_66, i21)
			local EncodeResult = value20:encode()
			local WriteTagResult68, WriteTagResult2_67 = ProtoModule.writeTag(WriteStringResult23, WriteStringResult2_22, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult23, WriteBufferResult2_22 = ProtoModule.writeBuffer(WriteTagResult68, WriteTagResult2_67, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult69, WriteTagResult2_68 = ProtoModule.writeTag(Buf, Count, 22, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult69, WriteTagResult2_68, WriteBufferResult23, WriteBufferResult2_22)
		end
	end
	if self.universe_user_vote_feedback_metadata ~= nil and next(self.universe_user_vote_feedback_metadata) ~= nil then
		for i24, value23 in self.universe_user_vote_feedback_metadata do
			local WriteTagResult73, WriteTagResult2_72 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult25, WriteStringResult2_24 = ProtoModule.writeString(WriteTagResult73, WriteTagResult2_72, i24)
			local EncodeResult = value23:encode()
			local WriteTagResult74, WriteTagResult2_73 = ProtoModule.writeTag(WriteStringResult25, WriteStringResult2_24, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult25, WriteBufferResult2_24 = ProtoModule.writeBuffer(WriteTagResult74, WriteTagResult2_73, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult75, WriteTagResult2_74 = ProtoModule.writeTag(Buf, Count, 23, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult75, WriteTagResult2_74, WriteBufferResult25, WriteBufferResult2_24)
		end
	end
	if self.moment ~= nil and next(self.moment) ~= nil then
		for i25, value24 in self.moment do
			local WriteTagResult76, WriteTagResult2_75 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult26, WriteStringResult2_25 = ProtoModule.writeString(WriteTagResult76, WriteTagResult2_75, i25)
			local EncodeResult = value24:encode()
			local WriteTagResult77, WriteTagResult2_76 = ProtoModule.writeTag(WriteStringResult26, WriteStringResult2_25, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult26, WriteBufferResult2_25 = ProtoModule.writeBuffer(WriteTagResult77, WriteTagResult2_76, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult78, WriteTagResult2_77 = ProtoModule.writeTag(Buf, Count, 24, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult78, WriteTagResult2_77, WriteBufferResult26, WriteBufferResult2_25)
		end
	end
	if self.community ~= nil and next(self.community) ~= nil then
		for i27, value26 in self.community do
			local WriteTagResult82, WriteTagResult2_81 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult28, WriteStringResult2_27 = ProtoModule.writeString(WriteTagResult82, WriteTagResult2_81, i27)
			local EncodeResult = value26:encode()
			local WriteTagResult83, WriteTagResult2_82 = ProtoModule.writeTag(WriteStringResult28, WriteStringResult2_27, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult28, WriteBufferResult2_27 = ProtoModule.writeBuffer(WriteTagResult83, WriteTagResult2_82, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult84, WriteTagResult2_83 = ProtoModule.writeTag(Buf, Count, 25, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult84, WriteTagResult2_83, WriteBufferResult28, WriteBufferResult2_27)
		end
	end
	if self.community_user_membership ~= nil and next(self.community_user_membership) ~= nil then
		for i28, value27 in self.community_user_membership do
			local WriteTagResult85, WriteTagResult2_84 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult29, WriteStringResult2_28 = ProtoModule.writeString(WriteTagResult85, WriteTagResult2_84, i28)
			local EncodeResult = value27:encode()
			local WriteTagResult86, WriteTagResult2_85 = ProtoModule.writeTag(WriteStringResult29, WriteStringResult2_28, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult29, WriteBufferResult2_28 = ProtoModule.writeBuffer(WriteTagResult86, WriteTagResult2_85, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult87, WriteTagResult2_86 = ProtoModule.writeTag(Buf, Count, 26, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult87, WriteTagResult2_86, WriteBufferResult29, WriteBufferResult2_28)
		end
	end
	if self.friend_recommendation ~= nil and next(self.friend_recommendation) ~= nil then
		for i29, value28 in self.friend_recommendation do
			local WriteTagResult88, WriteTagResult2_87 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult30, WriteStringResult2_29 = ProtoModule.writeString(WriteTagResult88, WriteTagResult2_87, i29)
			local EncodeResult = value28:encode()
			local WriteTagResult89, WriteTagResult2_88 = ProtoModule.writeTag(WriteStringResult30, WriteStringResult2_29, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult30, WriteBufferResult2_29 = ProtoModule.writeBuffer(WriteTagResult89, WriteTagResult2_88, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult90, WriteTagResult2_89 = ProtoModule.writeTag(Buf, Count, 27, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult90, WriteTagResult2_89, WriteBufferResult30, WriteBufferResult2_29)
		end
	end
	if self.universe_private_server ~= nil and next(self.universe_private_server) ~= nil then
		for i26, value25 in self.universe_private_server do
			local WriteTagResult79, WriteTagResult2_78 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult27, WriteStringResult2_26 = ProtoModule.writeString(WriteTagResult79, WriteTagResult2_78, i26)
			local EncodeResult = value25:encode()
			local WriteTagResult80, WriteTagResult2_79 = ProtoModule.writeTag(WriteStringResult27, WriteStringResult2_26, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult27, WriteBufferResult2_26 = ProtoModule.writeBuffer(WriteTagResult80, WriteTagResult2_79, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult81, WriteTagResult2_80 = ProtoModule.writeTag(Buf, Count, 28, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult81, WriteTagResult2_80, WriteBufferResult27, WriteBufferResult2_26)
		end
	end
	if self.notification_badge ~= nil and next(self.notification_badge) ~= nil then
		for i30, value29 in self.notification_badge do
			local WriteTagResult91, WriteTagResult2_90 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult31, WriteStringResult2_30 = ProtoModule.writeString(WriteTagResult91, WriteTagResult2_90, i30)
			local EncodeResult = value29:encode()
			local WriteTagResult92, WriteTagResult2_91 = ProtoModule.writeTag(WriteStringResult31, WriteStringResult2_30, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult31, WriteBufferResult2_30 = ProtoModule.writeBuffer(WriteTagResult92, WriteTagResult2_91, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult93, WriteTagResult2_92 = ProtoModule.writeTag(Buf, Count, 29, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult93, WriteTagResult2_92, WriteBufferResult31, WriteBufferResult2_30)
		end
	end
	if self.collectible_item ~= nil and next(self.collectible_item) ~= nil then
		for i22, value21 in self.collectible_item do
			local WriteTagResult70, WriteTagResult2_69 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult24, WriteStringResult2_23 = ProtoModule.writeString(WriteTagResult70, WriteTagResult2_69, i22)
			local EncodeResult = value21:encode()
			local WriteTagResult71, WriteTagResult2_70 = ProtoModule.writeTag(WriteStringResult24, WriteStringResult2_23, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult24, WriteBufferResult2_23 = ProtoModule.writeBuffer(WriteTagResult71, WriteTagResult2_70, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult72, WriteTagResult2_71 = ProtoModule.writeTag(Buf, Count, 30, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult72, WriteTagResult2_71, WriteBufferResult24, WriteBufferResult2_23)
		end
	end
	if self.leaderboard_stats ~= nil and next(self.leaderboard_stats) ~= nil then
		for i17, leaderboardStat in self.leaderboard_stats do
			local WriteTagResult64, WriteTagResult2_63 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult22, WriteStringResult2_21 = ProtoModule.writeString(WriteTagResult64, WriteTagResult2_63, i17)
			local EncodeResult = leaderboardStat:encode()
			local WriteTagResult65, WriteTagResult2_64 = ProtoModule.writeTag(WriteStringResult22, WriteStringResult2_21, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult22, WriteBufferResult2_21 = ProtoModule.writeBuffer(WriteTagResult65, WriteTagResult2_64, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult66, WriteTagResult2_65 = ProtoModule.writeTag(Buf, Count, 31, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult66, WriteTagResult2_65, WriteBufferResult22, WriteBufferResult2_21)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy), t (copy), BadgeDataModule (copy), UniverseDataModule (copy), CreatorDataModule (copy), EventDataModule (copy), SongDataModule (copy), GamePassDataModule (copy), MediaAssetDataModule (copy), SocialLinkDataModule (copy), GameDeveloperProductDataModule (copy), GameSubscriptionDataModule (copy), MarketplaceCatalogCategoryDataModule (copy), MarketplaceAssetDataModule (copy), MarketplaceBundleDataModule (copy), MarketplaceLookDataModule (copy), CatalogSortDataModule (copy), AgeRecommendationDataModule (copy), UniverseUserFollowDataModule (copy), UniverseUserVoteDataModule (copy), UserProfileDataModule (copy), UniverseUserFavoriteDataModule (copy), PlayabilityDataModule (copy), UniverseUserFollowLimitDataModule (copy), UniverseUserVoteFeedbackMetadataDataModule (copy), MomentDataModule (copy), CommunityDataModule (copy), CommunityUserMembershipDataModule (copy), FriendRecommendationDataModule (copy), UniversePrivateServerDataModule (copy), NotificationBadgeDataModule (copy), CollectibleItemDataModule (copy), LeaderboardStatsDataModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v410 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v410 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer2
				Buffer2, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_BadgeEntry.decode(Buffer2)
				local NewResult = BadgeDataModule.BadgeData.new()
				NewModule.badge[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 2 then
				local Buffer3
				Buffer3, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_UniverseEntry.decode(Buffer3)
				local NewResult = UniverseDataModule.UniverseData.new()
				NewModule.universe[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 3 then
				local Buffer4
				Buffer4, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_CreatorEntry.decode(Buffer4)
				local NewResult = CreatorDataModule.CreatorData.new()
				NewModule.creator[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 4 then
				local Buffer5
				Buffer5, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_EventEntry.decode(Buffer5)
				local NewResult = EventDataModule.EventData.new()
				NewModule.event[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 5 then
				local Buffer6
				Buffer6, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_SongEntry.decode(Buffer6)
				local NewResult = SongDataModule.SongData.new()
				NewModule.song[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 6 then
				local Buffer7
				Buffer7, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_GamePassEntry.decode(Buffer7)
				local NewResult = GamePassDataModule.GamePassData.new()
				NewModule.game_pass[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 7 then
				local Buffer8
				Buffer8, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_MediaAssetEntry.decode(Buffer8)
				local NewResult = MediaAssetDataModule.MediaAssetData.new()
				NewModule.media_asset[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 8 then
				local Buffer10
				Buffer10, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_SocialLinkEntry.decode(Buffer10)
				local NewResult = SocialLinkDataModule.SocialLinkData.new()
				NewModule.social_link[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 9 then
				local Buffer11
				Buffer11, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_GameDeveloperProductEntry.decode(Buffer11)
				local NewResult = GameDeveloperProductDataModule.GameDeveloperProductData.new()
				NewModule.game_developer_product[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 10 then
				local Buffer13
				Buffer13, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_GameSubscriptionEntry.decode(Buffer13)
				local NewResult = GameSubscriptionDataModule.GameSubscriptionData.new()
				NewModule.game_subscription[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 11 then
				local Buffer14
				Buffer14, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_MarketplaceCatalogCategoryEntry.decode(Buffer14)
				local NewResult = MarketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.new()
				NewModule.marketplace_catalog_category[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 12 then
				local Buffer15
				Buffer15, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_MarketplaceAssetEntry.decode(Buffer15)
				local NewResult = MarketplaceAssetDataModule.MarketplaceAssetData.new()
				NewModule.marketplace_asset[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 13 then
				local Buffer16
				Buffer16, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_MarketplaceBundleEntry.decode(Buffer16)
				local NewResult = MarketplaceBundleDataModule.MarketplaceBundleData.new()
				NewModule.marketplace_bundle[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 14 then
				local Buffer17
				Buffer17, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_MarketplaceLookEntry.decode(Buffer17)
				local NewResult = MarketplaceLookDataModule.MarketplaceLookData.new()
				NewModule.marketplace_look[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 15 then
				local Buffer18
				Buffer18, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_CatalogSortEntry.decode(Buffer18)
				local NewResult = CatalogSortDataModule.CatalogSortData.new()
				NewModule.catalog_sort[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 16 then
				local Buffer19
				Buffer19, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_AgeRecommendationEntry.decode(Buffer19)
				local NewResult = AgeRecommendationDataModule.AgeRecommendationData.new()
				NewModule.age_recommendation[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 17 then
				local Buffer20
				Buffer20, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_UniverseUserFollowEntry.decode(Buffer20)
				local NewResult = UniverseUserFollowDataModule.UniverseUserFollowData.new()
				NewModule.universe_user_follow[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 18 then
				local Buffer21
				Buffer21, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_UniverseUserVoteEntry.decode(Buffer21)
				local NewResult = UniverseUserVoteDataModule.UniverseUserVoteData.new()
				NewModule.universe_user_vote[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 19 then
				local Buffer22
				Buffer22, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_UserProfileEntry.decode(Buffer22)
				local NewResult = UserProfileDataModule.UserProfileData.new()
				NewModule.user_profile[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 20 then
				local Buffer9
				Buffer9, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_UniverseUserFavoriteEntry.decode(Buffer9)
				local NewResult = UniverseUserFavoriteDataModule.UniverseUserFavoriteData.new()
				NewModule.universe_user_favorite[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 21 then
				local Buffer23
				Buffer23, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_PlayabilityEntry.decode(Buffer23)
				local NewResult = PlayabilityDataModule.PlayabilityData.new()
				NewModule.playability[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 22 then
				local Buffer12
				Buffer12, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_UniverseUserFollowLimitEntry.decode(Buffer12)
				local NewResult = UniverseUserFollowLimitDataModule.UniverseUserFollowLimitData.new()
				NewModule.universe_user_follow_limit[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 23 then
				local Buffer24
				Buffer24, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_UniverseUserVoteFeedbackMetadataEntry.decode(Buffer24)
				local NewResult = UniverseUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.new()
				NewModule.universe_user_vote_feedback_metadata[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 24 then
				local Buffer25
				Buffer25, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_MomentEntry.decode(Buffer25)
				local NewResult = MomentDataModule.MomentData.new()
				NewModule.moment[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 25 then
				local Buffer26
				Buffer26, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_CommunityEntry.decode(Buffer26)
				local NewResult = CommunityDataModule.CommunityData.new()
				NewModule.community[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 26 then
				local Buffer1
				Buffer1, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_CommunityUserMembershipEntry.decode(Buffer1)
				local NewResult = CommunityUserMembershipDataModule.CommunityUserMembershipData.new()
				NewModule.community_user_membership[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 27 then
				local Buffer27
				Buffer27, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_FriendRecommendationEntry.decode(Buffer27)
				local NewResult = FriendRecommendationDataModule.FriendRecommendationData.new()
				NewModule.friend_recommendation[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 28 then
				local Buffer28
				Buffer28, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_UniversePrivateServerEntry.decode(Buffer28)
				local NewResult = UniversePrivateServerDataModule.UniversePrivateServerData.new()
				NewModule.universe_private_server[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 29 then
				local Buffer29
				Buffer29, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_NotificationBadgeEntry.decode(Buffer29)
				local NewResult = NotificationBadgeDataModule.NotificationBadgeData.new()
				NewModule.notification_badge[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 30 then
				local Buffer30
				Buffer30, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_CollectibleItemEntry.decode(Buffer30)
				local NewResult = CollectibleItemDataModule.CollectibleItemData.new()
				NewModule.collectible_item[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 31 then
				local Buffer31
				Buffer31, v410 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.HydrationContent_LeaderboardStatsEntry.decode(Buffer31)
				local NewResult = LeaderboardStatsDataModule.LeaderboardStatsData.new()
				NewModule.leaderboard_stats[DecodeResult.key or ""] = DecodeResult.value or NewResult
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v410 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v410 = ProtoModule.readFixed64(Buf, v1)
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
		
		for i8, value8 in self.social_link do
			SocialLink[i8] = value8:jsonEncode()
		end
		t.socialLink = SocialLink
	end
	if self.game_developer_product ~= nil and next(self.game_developer_product) ~= nil then
		local GameDeveloperProduct = {}
		
		for i9, value9 in self.game_developer_product do
			GameDeveloperProduct[i9] = value9:jsonEncode()
		end
		t.gameDeveloperProduct = GameDeveloperProduct
	end
	if self.game_subscription ~= nil and next(self.game_subscription) ~= nil then
		local GameSubscription = {}
		
		for i10, value10 in self.game_subscription do
			GameSubscription[i10] = value10:jsonEncode()
		end
		t.gameSubscription = GameSubscription
	end
	if self.marketplace_catalog_category ~= nil and next(self.marketplace_catalog_category) ~= nil then
		local MarketplaceCatalogCategory = {}
		
		for i11, value11 in self.marketplace_catalog_category do
			MarketplaceCatalogCategory[i11] = value11:jsonEncode()
		end
		t.marketplaceCatalogCategory = MarketplaceCatalogCategory
	end
	if self.marketplace_asset ~= nil and next(self.marketplace_asset) ~= nil then
		local MarketplaceAsset = {}
		
		for i12, value12 in self.marketplace_asset do
			MarketplaceAsset[i12] = value12:jsonEncode()
		end
		t.marketplaceAsset = MarketplaceAsset
	end
	if self.marketplace_bundle ~= nil and next(self.marketplace_bundle) ~= nil then
		local MarketplaceBundle = {}
		
		for i13, value13 in self.marketplace_bundle do
			MarketplaceBundle[i13] = value13:jsonEncode()
		end
		t.marketplaceBundle = MarketplaceBundle
	end
	if self.marketplace_look ~= nil and next(self.marketplace_look) ~= nil then
		local MarketplaceLook = {}
		
		for i14, value14 in self.marketplace_look do
			MarketplaceLook[i14] = value14:jsonEncode()
		end
		t.marketplaceLook = MarketplaceLook
	end
	if self.catalog_sort ~= nil and next(self.catalog_sort) ~= nil then
		local CatalogSort = {}
		
		for i15, value15 in self.catalog_sort do
			CatalogSort[i15] = value15:jsonEncode()
		end
		t.catalogSort = CatalogSort
	end
	if self.age_recommendation ~= nil and next(self.age_recommendation) ~= nil then
		local AgeRecommendation = {}
		
		for i17, value17 in self.age_recommendation do
			AgeRecommendation[i17] = value17:jsonEncode()
		end
		t.ageRecommendation = AgeRecommendation
	end
	if self.universe_user_follow ~= nil and next(self.universe_user_follow) ~= nil then
		local UniverseUserFollow = {}
		
		for i19, value19 in self.universe_user_follow do
			UniverseUserFollow[i19] = value19:jsonEncode()
		end
		t.universeUserFollow = UniverseUserFollow
	end
	if self.universe_user_vote ~= nil and next(self.universe_user_vote) ~= nil then
		local UniverseUserVote = {}
		
		for i20, value20 in self.universe_user_vote do
			UniverseUserVote[i20] = value20:jsonEncode()
		end
		t.universeUserVote = UniverseUserVote
	end
	if self.user_profile ~= nil and next(self.user_profile) ~= nil then
		local UserProfile = {}
		
		for i21, value21 in self.user_profile do
			UserProfile[i21] = value21:jsonEncode()
		end
		t.userProfile = UserProfile
	end
	if self.universe_user_favorite ~= nil and next(self.universe_user_favorite) ~= nil then
		local UniverseUserFavorite = {}
		
		for i22, value22 in self.universe_user_favorite do
			UniverseUserFavorite[i22] = value22:jsonEncode()
		end
		t.universeUserFavorite = UniverseUserFavorite
	end
	if self.playability ~= nil and next(self.playability) ~= nil then
		local Playability = {}
		
		for i23, value23 in self.playability do
			Playability[i23] = value23:jsonEncode()
		end
		t.playability = Playability
	end
	if self.universe_user_follow_limit ~= nil and next(self.universe_user_follow_limit) ~= nil then
		local UniverseUserFollowLimit = {}
		
		for i18, value18 in self.universe_user_follow_limit do
			UniverseUserFollowLimit[i18] = value18:jsonEncode()
		end
		t.universeUserFollowLimit = UniverseUserFollowLimit
	end
	if self.universe_user_vote_feedback_metadata ~= nil and next(self.universe_user_vote_feedback_metadata) ~= nil then
		local UniverseUserVoteFeedbackMetadata = {}
		
		for i24, value24 in self.universe_user_vote_feedback_metadata do
			UniverseUserVoteFeedbackMetadata[i24] = value24:jsonEncode()
		end
		t.universeUserVoteFeedbackMetadata = UniverseUserVoteFeedbackMetadata
	end
	if self.moment ~= nil and next(self.moment) ~= nil then
		local Moment = {}
		
		for i16, value16 in self.moment do
			Moment[i16] = value16:jsonEncode()
		end
		t.moment = Moment
	end
	if self.community ~= nil and next(self.community) ~= nil then
		local Community = {}
		
		for i25, value25 in self.community do
			Community[i25] = value25:jsonEncode()
		end
		t.community = Community
	end
	if self.community_user_membership ~= nil and next(self.community_user_membership) ~= nil then
		local CommunityUserMembership = {}
		
		for i26, value26 in self.community_user_membership do
			CommunityUserMembership[i26] = value26:jsonEncode()
		end
		t.communityUserMembership = CommunityUserMembership
	end
	if self.friend_recommendation ~= nil and next(self.friend_recommendation) ~= nil then
		local FriendRecommendation = {}
		
		for i27, value27 in self.friend_recommendation do
			FriendRecommendation[i27] = value27:jsonEncode()
		end
		t.friendRecommendation = FriendRecommendation
	end
	if self.universe_private_server ~= nil and next(self.universe_private_server) ~= nil then
		local UniversePrivateServer = {}
		
		for i28, value28 in self.universe_private_server do
			UniversePrivateServer[i28] = value28:jsonEncode()
		end
		t.universePrivateServer = UniversePrivateServer
	end
	if self.notification_badge ~= nil and next(self.notification_badge) ~= nil then
		local NotificationBadge = {}
		
		for i29, value29 in self.notification_badge do
			NotificationBadge[i29] = value29:jsonEncode()
		end
		t.notificationBadge = NotificationBadge
	end
	if self.collectible_item ~= nil and next(self.collectible_item) ~= nil then
		local CollectibleItem = {}
		
		for i7, value7 in self.collectible_item do
			CollectibleItem[i7] = value7:jsonEncode()
		end
		t.collectibleItem = CollectibleItem
	end
	if self.leaderboard_stats ~= nil and next(self.leaderboard_stats) ~= nil then
		local LeaderboardStats = {}
		
		for i30, leaderboardStat in self.leaderboard_stats do
			LeaderboardStats[i30] = leaderboardStat:jsonEncode()
		end
		t.leaderboardStats = LeaderboardStats
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), BadgeDataModule (copy), UniverseDataModule (copy), CreatorDataModule (copy), EventDataModule (copy), SongDataModule (copy), GamePassDataModule (copy), MediaAssetDataModule (copy), SocialLinkDataModule (copy), GameDeveloperProductDataModule (copy), GameSubscriptionDataModule (copy), MarketplaceCatalogCategoryDataModule (copy), MarketplaceAssetDataModule (copy), MarketplaceBundleDataModule (copy), MarketplaceLookDataModule (copy), CatalogSortDataModule (copy), AgeRecommendationDataModule (copy), UniverseUserFollowDataModule (copy), UniverseUserVoteDataModule (copy), UserProfileDataModule (copy), UniverseUserFavoriteDataModule (copy), PlayabilityDataModule (copy), UniverseUserFollowLimitDataModule (copy), UniverseUserVoteFeedbackMetadataDataModule (copy), MomentDataModule (copy), CommunityDataModule (copy), CommunityUserMembershipDataModule (copy), FriendRecommendationDataModule (copy), UniversePrivateServerDataModule (copy), NotificationBadgeDataModule (copy), CollectibleItemDataModule (copy), LeaderboardStatsDataModule (copy)
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
		
		for i9, value9 in self.media_asset do
			Media_asset[i9] = MediaAssetDataModule.MediaAssetData.jsonDecode(value9)
		end
		NewModule.media_asset = Media_asset
	end
	if self.mediaAsset ~= nil then
		local Media_asset = {}
		
		for i10, value10 in self.mediaAsset do
			Media_asset[i10] = MediaAssetDataModule.MediaAssetData.jsonDecode(value10)
		end
		NewModule.media_asset = Media_asset
	end
	if self.social_link ~= nil then
		local Social_link = {}
		
		for i11, value11 in self.social_link do
			Social_link[i11] = SocialLinkDataModule.SocialLinkData.jsonDecode(value11)
		end
		NewModule.social_link = Social_link
	end
	if self.socialLink ~= nil then
		local Social_link = {}
		
		for i12, value12 in self.socialLink do
			Social_link[i12] = SocialLinkDataModule.SocialLinkData.jsonDecode(value12)
		end
		NewModule.social_link = Social_link
	end
	if self.game_developer_product ~= nil then
		local Game_developer_product = {}
		
		for i13, value13 in self.game_developer_product do
			Game_developer_product[i13] = GameDeveloperProductDataModule.GameDeveloperProductData.jsonDecode(value13)
		end
		NewModule.game_developer_product = Game_developer_product
	end
	if self.gameDeveloperProduct ~= nil then
		local Game_developer_product = {}
		
		for i14, value14 in self.gameDeveloperProduct do
			Game_developer_product[i14] = GameDeveloperProductDataModule.GameDeveloperProductData.jsonDecode(value14)
		end
		NewModule.game_developer_product = Game_developer_product
	end
	if self.game_subscription ~= nil then
		local Game_subscription = {}
		
		for i15, value15 in self.game_subscription do
			Game_subscription[i15] = GameSubscriptionDataModule.GameSubscriptionData.jsonDecode(value15)
		end
		NewModule.game_subscription = Game_subscription
	end
	if self.gameSubscription ~= nil then
		local Game_subscription = {}
		
		for i16, value16 in self.gameSubscription do
			Game_subscription[i16] = GameSubscriptionDataModule.GameSubscriptionData.jsonDecode(value16)
		end
		NewModule.game_subscription = Game_subscription
	end
	if self.marketplace_catalog_category ~= nil then
		local Marketplace_catalog_category = {}
		
		for i18, value18 in self.marketplace_catalog_category do
			Marketplace_catalog_category[i18] = MarketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.jsonDecode(value18)
		end
		NewModule.marketplace_catalog_category = Marketplace_catalog_category
	end
	if self.marketplaceCatalogCategory ~= nil then
		local Marketplace_catalog_category = {}
		
		for i19, value19 in self.marketplaceCatalogCategory do
			Marketplace_catalog_category[i19] = MarketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.jsonDecode(value19)
		end
		NewModule.marketplace_catalog_category = Marketplace_catalog_category
	end
	if self.marketplace_asset ~= nil then
		local Marketplace_asset = {}
		
		for i20, value20 in self.marketplace_asset do
			Marketplace_asset[i20] = MarketplaceAssetDataModule.MarketplaceAssetData.jsonDecode(value20)
		end
		NewModule.marketplace_asset = Marketplace_asset
	end
	if self.marketplaceAsset ~= nil then
		local Marketplace_asset = {}
		
		for i22, value21 in self.marketplaceAsset do
			Marketplace_asset[i22] = MarketplaceAssetDataModule.MarketplaceAssetData.jsonDecode(value21)
		end
		NewModule.marketplace_asset = Marketplace_asset
	end
	if self.marketplace_bundle ~= nil then
		local Marketplace_bundle = {}
		
		for i23, value22 in self.marketplace_bundle do
			Marketplace_bundle[i23] = MarketplaceBundleDataModule.MarketplaceBundleData.jsonDecode(value22)
		end
		NewModule.marketplace_bundle = Marketplace_bundle
	end
	if self.marketplaceBundle ~= nil then
		local Marketplace_bundle = {}
		
		for i26, value25 in self.marketplaceBundle do
			Marketplace_bundle[i26] = MarketplaceBundleDataModule.MarketplaceBundleData.jsonDecode(value25)
		end
		NewModule.marketplace_bundle = Marketplace_bundle
	end
	if self.marketplace_look ~= nil then
		local Marketplace_look = {}
		
		for i27, value26 in self.marketplace_look do
			Marketplace_look[i27] = MarketplaceLookDataModule.MarketplaceLookData.jsonDecode(value26)
		end
		NewModule.marketplace_look = Marketplace_look
	end
	if self.marketplaceLook ~= nil then
		local Marketplace_look = {}
		
		for i29, value28 in self.marketplaceLook do
			Marketplace_look[i29] = MarketplaceLookDataModule.MarketplaceLookData.jsonDecode(value28)
		end
		NewModule.marketplace_look = Marketplace_look
	end
	if self.catalog_sort ~= nil then
		local Catalog_sort = {}
		
		for i30, value29 in self.catalog_sort do
			Catalog_sort[i30] = CatalogSortDataModule.CatalogSortData.jsonDecode(value29)
		end
		NewModule.catalog_sort = Catalog_sort
	end
	if self.catalogSort ~= nil then
		local Catalog_sort = {}
		
		for i31, value30 in self.catalogSort do
			Catalog_sort[i31] = CatalogSortDataModule.CatalogSortData.jsonDecode(value30)
		end
		NewModule.catalog_sort = Catalog_sort
	end
	if self.age_recommendation ~= nil then
		local Age_recommendation = {}
		
		for i28, value27 in self.age_recommendation do
			Age_recommendation[i28] = AgeRecommendationDataModule.AgeRecommendationData.jsonDecode(value27)
		end
		NewModule.age_recommendation = Age_recommendation
	end
	if self.ageRecommendation ~= nil then
		local Age_recommendation = {}
		
		for i32, value31 in self.ageRecommendation do
			Age_recommendation[i32] = AgeRecommendationDataModule.AgeRecommendationData.jsonDecode(value31)
		end
		NewModule.age_recommendation = Age_recommendation
	end
	if self.universe_user_follow ~= nil then
		local Universe_user_follow = {}
		
		for i33, value32 in self.universe_user_follow do
			Universe_user_follow[i33] = UniverseUserFollowDataModule.UniverseUserFollowData.jsonDecode(value32)
		end
		NewModule.universe_user_follow = Universe_user_follow
	end
	if self.universeUserFollow ~= nil then
		local Universe_user_follow = {}
		
		for i34, value33 in self.universeUserFollow do
			Universe_user_follow[i34] = UniverseUserFollowDataModule.UniverseUserFollowData.jsonDecode(value33)
		end
		NewModule.universe_user_follow = Universe_user_follow
	end
	if self.universe_user_vote ~= nil then
		local Universe_user_vote1 = {}
		
		for i25, value24 in self.universe_user_vote do
			Universe_user_vote1[i25] = UniverseUserVoteDataModule.UniverseUserVoteData.jsonDecode(value24)
		end
		NewModule.universe_user_vote = Universe_user_vote1
	end
	if self.universeUserVote ~= nil then
		local Universe_user_vote = {}
		
		for i17, value17 in self.universeUserVote do
			Universe_user_vote[i17] = UniverseUserVoteDataModule.UniverseUserVoteData.jsonDecode(value17)
		end
		NewModule.universe_user_vote = Universe_user_vote
	end
	if self.user_profile ~= nil then
		local User_profile = {}
		
		for i35, value34 in self.user_profile do
			User_profile[i35] = UserProfileDataModule.UserProfileData.jsonDecode(value34)
		end
		NewModule.user_profile = User_profile
	end
	if self.userProfile ~= nil then
		local User_profile = {}
		
		for i36, value35 in self.userProfile do
			User_profile[i36] = UserProfileDataModule.UserProfileData.jsonDecode(value35)
		end
		NewModule.user_profile = User_profile
	end
	if self.universe_user_favorite ~= nil then
		local Universe_user_favorite = {}
		
		for i37, value36 in self.universe_user_favorite do
			Universe_user_favorite[i37] = UniverseUserFavoriteDataModule.UniverseUserFavoriteData.jsonDecode(value36)
		end
		NewModule.universe_user_favorite = Universe_user_favorite
	end
	if self.universeUserFavorite ~= nil then
		local Universe_user_favorite = {}
		
		for i39, value37 in self.universeUserFavorite do
			Universe_user_favorite[i39] = UniverseUserFavoriteDataModule.UniverseUserFavoriteData.jsonDecode(value37)
		end
		NewModule.universe_user_favorite = Universe_user_favorite
	end
	if self.playability ~= nil then
		local Playability = {}
		
		for i40, value38 in self.playability do
			Playability[i40] = PlayabilityDataModule.PlayabilityData.jsonDecode(value38)
		end
		NewModule.playability = Playability
	end
	if self.universe_user_follow_limit ~= nil then
		local Universe_user_follow_limit1 = {}
		
		for i41, value39 in self.universe_user_follow_limit do
			Universe_user_follow_limit1[i41] = UniverseUserFollowLimitDataModule.UniverseUserFollowLimitData.jsonDecode(value39)
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
		
		for i42, value40 in self.universe_user_vote_feedback_metadata do
			Universe_user_vote_feedback_metadata[i42] = UniverseUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.jsonDecode(value40)
		end
		NewModule.universe_user_vote_feedback_metadata = Universe_user_vote_feedback_metadata
	end
	if self.universeUserVoteFeedbackMetadata ~= nil then
		local Universe_user_vote_feedback_metadata = {}
		
		for i43, value41 in self.universeUserVoteFeedbackMetadata do
			Universe_user_vote_feedback_metadata[i43] = UniverseUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.jsonDecode(value41)
		end
		NewModule.universe_user_vote_feedback_metadata = Universe_user_vote_feedback_metadata
	end
	if self.moment ~= nil then
		local Moment = {}
		
		for i44, value42 in self.moment do
			Moment[i44] = MomentDataModule.MomentData.jsonDecode(value42)
		end
		NewModule.moment = Moment
	end
	if self.community ~= nil then
		local Community = {}
		
		for i45, value43 in self.community do
			Community[i45] = CommunityDataModule.CommunityData.jsonDecode(value43)
		end
		NewModule.community = Community
	end
	if self.community_user_membership ~= nil then
		local Community_user_membership = {}
		
		for i8, value8 in self.community_user_membership do
			Community_user_membership[i8] = CommunityUserMembershipDataModule.CommunityUserMembershipData.jsonDecode(value8)
		end
		NewModule.community_user_membership = Community_user_membership
	end
	if self.communityUserMembership ~= nil then
		local Community_user_membership = {}
		
		for i47, value45 in self.communityUserMembership do
			Community_user_membership[i47] = CommunityUserMembershipDataModule.CommunityUserMembershipData.jsonDecode(value45)
		end
		NewModule.community_user_membership = Community_user_membership
	end
	if self.friend_recommendation ~= nil then
		local Friend_recommendation = {}
		
		for i48, value46 in self.friend_recommendation do
			Friend_recommendation[i48] = FriendRecommendationDataModule.FriendRecommendationData.jsonDecode(value46)
		end
		NewModule.friend_recommendation = Friend_recommendation
	end
	if self.friendRecommendation ~= nil then
		local Friend_recommendation = {}
		
		for i49, value47 in self.friendRecommendation do
			Friend_recommendation[i49] = FriendRecommendationDataModule.FriendRecommendationData.jsonDecode(value47)
		end
		NewModule.friend_recommendation = Friend_recommendation
	end
	if self.universe_private_server ~= nil then
		local Universe_private_server = {}
		
		for i50, value48 in self.universe_private_server do
			Universe_private_server[i50] = UniversePrivateServerDataModule.UniversePrivateServerData.jsonDecode(value48)
		end
		NewModule.universe_private_server = Universe_private_server
	end
	if self.universePrivateServer ~= nil then
		local Universe_private_server = {}
		
		for i51, value49 in self.universePrivateServer do
			Universe_private_server[i51] = UniversePrivateServerDataModule.UniversePrivateServerData.jsonDecode(value49)
		end
		NewModule.universe_private_server = Universe_private_server
	end
	if self.notification_badge ~= nil then
		local Notification_badge = {}
		
		for i24, value23 in self.notification_badge do
			Notification_badge[i24] = NotificationBadgeDataModule.NotificationBadgeData.jsonDecode(value23)
		end
		NewModule.notification_badge = Notification_badge
	end
	if self.notificationBadge ~= nil then
		local Notification_badge = {}
		
		for i52, value50 in self.notificationBadge do
			Notification_badge[i52] = NotificationBadgeDataModule.NotificationBadgeData.jsonDecode(value50)
		end
		NewModule.notification_badge = Notification_badge
	end
	if self.collectible_item ~= nil then
		local Collectible_item = {}
		
		for i53, value51 in self.collectible_item do
			Collectible_item[i53] = CollectibleItemDataModule.CollectibleItemData.jsonDecode(value51)
		end
		NewModule.collectible_item = Collectible_item
	end
	if self.collectibleItem ~= nil then
		local Collectible_item = {}
		
		for i46, value44 in self.collectibleItem do
			Collectible_item[i46] = CollectibleItemDataModule.CollectibleItemData.jsonDecode(value44)
		end
		NewModule.collectible_item = Collectible_item
	end
	if self.leaderboard_stats ~= nil then
		local Leaderboard_stats = {}
		
		for i38, leaderboardStat1 in self.leaderboard_stats do
			Leaderboard_stats[i38] = LeaderboardStatsDataModule.LeaderboardStatsData.jsonDecode(leaderboardStat1)
		end
		NewModule.leaderboard_stats = Leaderboard_stats
	end
	if self.leaderboardStats ~= nil then
		local Leaderboard_stats = {}
		
		for i21, leaderboardStat in self.leaderboardStats do
			Leaderboard_stats[i21] = LeaderboardStatsDataModule.LeaderboardStatsData.jsonDecode(leaderboardStat)
		end
		NewModule.leaderboard_stats = Leaderboard_stats
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
		Tag, Tag2, v606 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v606 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v606 = ProtoModule.readBuffer(Buf, v2)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v606 = ProtoModule.readBuffer(Buf, v2)
				NewModule.value = BadgeDataModule.BadgeData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v606 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v606 = ProtoModule.readFixed64(Buf, v2)
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
		Tag, Tag2, v626 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v626 = ProtoModule.readVarInt(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v626 = ProtoModule.readBuffer(Buf, v3)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v626 = ProtoModule.readBuffer(Buf, v3)
				NewModule.value = UniverseDataModule.UniverseData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v626 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v626 = ProtoModule.readFixed64(Buf, v3)
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
		Tag, Tag2, v646 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v646 = ProtoModule.readVarInt(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v646 = ProtoModule.readBuffer(Buf, v4)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v646 = ProtoModule.readBuffer(Buf, v4)
				NewModule.value = CreatorDataModule.CreatorData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v646 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v646 = ProtoModule.readFixed64(Buf, v4)
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
		Tag, Tag2, v666 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v666 = ProtoModule.readVarInt(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v666 = ProtoModule.readBuffer(Buf, v5)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v666 = ProtoModule.readBuffer(Buf, v5)
				NewModule.value = EventDataModule.EventData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v666 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v666 = ProtoModule.readFixed64(Buf, v5)
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
		Tag, Tag2, v686 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v686 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v686 = ProtoModule.readBuffer(Buf, v6)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v686 = ProtoModule.readBuffer(Buf, v6)
				NewModule.value = SongDataModule.SongData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v686 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v686 = ProtoModule.readFixed64(Buf, v6)
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
		Tag, Tag2, v706 = ProtoModule.readTag(Buf, v7)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v706 = ProtoModule.readVarInt(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v706 = ProtoModule.readBuffer(Buf, v7)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v706 = ProtoModule.readBuffer(Buf, v7)
				NewModule.value = GamePassDataModule.GamePassData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v7)
				v7 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v706 = ProtoModule.readFixed32(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v706 = ProtoModule.readFixed64(Buf, v7)
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
		Tag, Tag2, v726 = ProtoModule.readTag(Buf, v8)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v726 = ProtoModule.readVarInt(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v726 = ProtoModule.readBuffer(Buf, v8)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v726 = ProtoModule.readBuffer(Buf, v8)
				NewModule.value = MediaAssetDataModule.MediaAssetData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v8)
				v8 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v726 = ProtoModule.readFixed32(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v726 = ProtoModule.readFixed64(Buf, v8)
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
		Tag, Tag2, v746 = ProtoModule.readTag(Buf, v9)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v746 = ProtoModule.readVarInt(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v746 = ProtoModule.readBuffer(Buf, v9)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v746 = ProtoModule.readBuffer(Buf, v9)
				NewModule.value = SocialLinkDataModule.SocialLinkData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v9)
				v9 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v746 = ProtoModule.readFixed32(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v746 = ProtoModule.readFixed64(Buf, v9)
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
		Tag, Tag2, v766 = ProtoModule.readTag(Buf, v10)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v766 = ProtoModule.readVarInt(Buf, v10)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v766 = ProtoModule.readBuffer(Buf, v10)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v766 = ProtoModule.readBuffer(Buf, v10)
				NewModule.value = GameDeveloperProductDataModule.GameDeveloperProductData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v10)
				v10 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v766 = ProtoModule.readFixed32(Buf, v10)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v766 = ProtoModule.readFixed64(Buf, v10)
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
		Tag, Tag2, v786 = ProtoModule.readTag(Buf, v11)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v786 = ProtoModule.readVarInt(Buf, v11)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v786 = ProtoModule.readBuffer(Buf, v11)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v786 = ProtoModule.readBuffer(Buf, v11)
				NewModule.value = GameSubscriptionDataModule.GameSubscriptionData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v11)
				v11 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v786 = ProtoModule.readFixed32(Buf, v11)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v786 = ProtoModule.readFixed64(Buf, v11)
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
		Tag, Tag2, v806 = ProtoModule.readTag(Buf, v12)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v806 = ProtoModule.readVarInt(Buf, v12)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v806 = ProtoModule.readBuffer(Buf, v12)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v806 = ProtoModule.readBuffer(Buf, v12)
				NewModule.value = MarketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v12)
				v12 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v806 = ProtoModule.readFixed32(Buf, v12)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v806 = ProtoModule.readFixed64(Buf, v12)
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
		Tag, Tag2, v826 = ProtoModule.readTag(Buf, v13)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v826 = ProtoModule.readVarInt(Buf, v13)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v826 = ProtoModule.readBuffer(Buf, v13)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v826 = ProtoModule.readBuffer(Buf, v13)
				NewModule.value = MarketplaceAssetDataModule.MarketplaceAssetData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v13)
				v13 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v826 = ProtoModule.readFixed32(Buf, v13)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v826 = ProtoModule.readFixed64(Buf, v13)
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
		Tag, Tag2, v846 = ProtoModule.readTag(Buf, v14)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v846 = ProtoModule.readVarInt(Buf, v14)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v846 = ProtoModule.readBuffer(Buf, v14)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v846 = ProtoModule.readBuffer(Buf, v14)
				NewModule.value = MarketplaceBundleDataModule.MarketplaceBundleData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v14)
				v14 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v846 = ProtoModule.readFixed32(Buf, v14)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v846 = ProtoModule.readFixed64(Buf, v14)
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
		Tag, Tag2, v866 = ProtoModule.readTag(Buf, v15)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v866 = ProtoModule.readVarInt(Buf, v15)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v866 = ProtoModule.readBuffer(Buf, v15)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v866 = ProtoModule.readBuffer(Buf, v15)
				NewModule.value = MarketplaceLookDataModule.MarketplaceLookData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v15)
				v15 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v866 = ProtoModule.readFixed32(Buf, v15)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v866 = ProtoModule.readFixed64(Buf, v15)
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
		Tag, Tag2, v886 = ProtoModule.readTag(Buf, v16)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v886 = ProtoModule.readVarInt(Buf, v16)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v886 = ProtoModule.readBuffer(Buf, v16)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v886 = ProtoModule.readBuffer(Buf, v16)
				NewModule.value = CatalogSortDataModule.CatalogSortData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v16)
				v16 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v886 = ProtoModule.readFixed32(Buf, v16)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v886 = ProtoModule.readFixed64(Buf, v16)
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
		Tag, Tag2, v906 = ProtoModule.readTag(Buf, v17)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v906 = ProtoModule.readVarInt(Buf, v17)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v906 = ProtoModule.readBuffer(Buf, v17)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v906 = ProtoModule.readBuffer(Buf, v17)
				NewModule.value = AgeRecommendationDataModule.AgeRecommendationData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v17)
				v17 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v906 = ProtoModule.readFixed32(Buf, v17)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v906 = ProtoModule.readFixed64(Buf, v17)
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
		Tag, Tag2, v926 = ProtoModule.readTag(Buf, v18)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v926 = ProtoModule.readVarInt(Buf, v18)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v926 = ProtoModule.readBuffer(Buf, v18)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v926 = ProtoModule.readBuffer(Buf, v18)
				NewModule.value = UniverseUserFollowDataModule.UniverseUserFollowData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v18)
				v18 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v926 = ProtoModule.readFixed32(Buf, v18)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v926 = ProtoModule.readFixed64(Buf, v18)
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
		Tag, Tag2, v946 = ProtoModule.readTag(Buf, v19)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v946 = ProtoModule.readVarInt(Buf, v19)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v946 = ProtoModule.readBuffer(Buf, v19)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v946 = ProtoModule.readBuffer(Buf, v19)
				NewModule.value = UniverseUserVoteDataModule.UniverseUserVoteData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v19)
				v19 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v946 = ProtoModule.readFixed32(Buf, v19)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v946 = ProtoModule.readFixed64(Buf, v19)
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
		Tag, Tag2, v966 = ProtoModule.readTag(Buf, v20)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v966 = ProtoModule.readVarInt(Buf, v20)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v966 = ProtoModule.readBuffer(Buf, v20)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v966 = ProtoModule.readBuffer(Buf, v20)
				NewModule.value = UserProfileDataModule.UserProfileData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v20)
				v20 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v966 = ProtoModule.readFixed32(Buf, v20)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v966 = ProtoModule.readFixed64(Buf, v20)
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
		Tag, Tag2, v986 = ProtoModule.readTag(Buf, v21)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v986 = ProtoModule.readVarInt(Buf, v21)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v986 = ProtoModule.readBuffer(Buf, v21)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v986 = ProtoModule.readBuffer(Buf, v21)
				NewModule.value = UniverseUserFavoriteDataModule.UniverseUserFavoriteData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v21)
				v21 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v986 = ProtoModule.readFixed32(Buf, v21)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v986 = ProtoModule.readFixed64(Buf, v21)
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
		Tag, Tag2, v1006 = ProtoModule.readTag(Buf, v22)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1006 = ProtoModule.readVarInt(Buf, v22)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1006 = ProtoModule.readBuffer(Buf, v22)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1006 = ProtoModule.readBuffer(Buf, v22)
				NewModule.value = PlayabilityDataModule.PlayabilityData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v22)
				v22 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1006 = ProtoModule.readFixed32(Buf, v22)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1006 = ProtoModule.readFixed64(Buf, v22)
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
		Tag, Tag2, v1026 = ProtoModule.readTag(Buf, v23)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1026 = ProtoModule.readVarInt(Buf, v23)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1026 = ProtoModule.readBuffer(Buf, v23)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1026 = ProtoModule.readBuffer(Buf, v23)
				NewModule.value = UniverseUserFollowLimitDataModule.UniverseUserFollowLimitData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v23)
				v23 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1026 = ProtoModule.readFixed32(Buf, v23)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1026 = ProtoModule.readFixed64(Buf, v23)
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
		Tag, Tag2, v1046 = ProtoModule.readTag(Buf, v24)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1046 = ProtoModule.readVarInt(Buf, v24)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1046 = ProtoModule.readBuffer(Buf, v24)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1046 = ProtoModule.readBuffer(Buf, v24)
				NewModule.value = UniverseUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v24)
				v24 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1046 = ProtoModule.readFixed32(Buf, v24)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1046 = ProtoModule.readFixed64(Buf, v24)
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
		Tag, Tag2, v1066 = ProtoModule.readTag(Buf, v25)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1066 = ProtoModule.readVarInt(Buf, v25)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1066 = ProtoModule.readBuffer(Buf, v25)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1066 = ProtoModule.readBuffer(Buf, v25)
				NewModule.value = MomentDataModule.MomentData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v25)
				v25 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1066 = ProtoModule.readFixed32(Buf, v25)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1066 = ProtoModule.readFixed64(Buf, v25)
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
local Module25 = {}
Module25.__index = Module25

function Module25.new(p1)
	-- upvalues: Module25 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module25))
end

function Module25:encode()
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

function Module25.decode(Buf)
	-- upvalues: Module25 (copy), ProtoModule (copy), CommunityDataModule (copy)
	local NewModule = Module25.new()
	local v26 = 0
	while v26 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1086 = ProtoModule.readTag(Buf, v26)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1086 = ProtoModule.readVarInt(Buf, v26)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1086 = ProtoModule.readBuffer(Buf, v26)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1086 = ProtoModule.readBuffer(Buf, v26)
				NewModule.value = CommunityDataModule.CommunityData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v26)
				v26 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1086 = ProtoModule.readFixed32(Buf, v26)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1086 = ProtoModule.readFixed64(Buf, v26)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module25:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module25:jsonDecode()
	-- upvalues: Module25 (copy), CommunityDataModule (copy)
	local NewModule = Module25.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = CommunityDataModule.CommunityData.jsonDecode(self.value)
	end
	return NewModule
end

Module25.descriptor = {
	name = "HydrationContent_CommunityEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunityEntry"
}
t.HydrationContent_CommunityEntry = Module25
TypeRegistryModule.default:register(t.HydrationContent_CommunityEntry)
local Module26 = {}
Module26.__index = Module26

function Module26.new(p1)
	-- upvalues: Module26 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module26))
end

function Module26:encode()
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

function Module26.decode(Buf)
	-- upvalues: Module26 (copy), ProtoModule (copy), CommunityUserMembershipDataModule (copy)
	local NewModule = Module26.new()
	local v27 = 0
	while v27 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1106 = ProtoModule.readTag(Buf, v27)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1106 = ProtoModule.readVarInt(Buf, v27)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1106 = ProtoModule.readBuffer(Buf, v27)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1106 = ProtoModule.readBuffer(Buf, v27)
				NewModule.value = CommunityUserMembershipDataModule.CommunityUserMembershipData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v27)
				v27 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1106 = ProtoModule.readFixed32(Buf, v27)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1106 = ProtoModule.readFixed64(Buf, v27)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module26:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module26:jsonDecode()
	-- upvalues: Module26 (copy), CommunityUserMembershipDataModule (copy)
	local NewModule = Module26.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = CommunityUserMembershipDataModule.CommunityUserMembershipData.jsonDecode(self.value)
	end
	return NewModule
end

Module26.descriptor = {
	name = "HydrationContent_CommunityUserMembershipEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunityUserMembershipEntry"
}
t.HydrationContent_CommunityUserMembershipEntry = Module26
TypeRegistryModule.default:register(t.HydrationContent_CommunityUserMembershipEntry)
local Module27 = {}
Module27.__index = Module27

function Module27.new(p1)
	-- upvalues: Module27 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module27))
end

function Module27:encode()
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

function Module27.decode(Buf)
	-- upvalues: Module27 (copy), ProtoModule (copy), FriendRecommendationDataModule (copy)
	local NewModule = Module27.new()
	local v28 = 0
	while v28 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1126 = ProtoModule.readTag(Buf, v28)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1126 = ProtoModule.readVarInt(Buf, v28)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1126 = ProtoModule.readBuffer(Buf, v28)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1126 = ProtoModule.readBuffer(Buf, v28)
				NewModule.value = FriendRecommendationDataModule.FriendRecommendationData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v28)
				v28 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1126 = ProtoModule.readFixed32(Buf, v28)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1126 = ProtoModule.readFixed64(Buf, v28)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module27:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module27:jsonDecode()
	-- upvalues: Module27 (copy), FriendRecommendationDataModule (copy)
	local NewModule = Module27.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = FriendRecommendationDataModule.FriendRecommendationData.jsonDecode(self.value)
	end
	return NewModule
end

Module27.descriptor = {
	name = "HydrationContent_FriendRecommendationEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.FriendRecommendationEntry"
}
t.HydrationContent_FriendRecommendationEntry = Module27
TypeRegistryModule.default:register(t.HydrationContent_FriendRecommendationEntry)
local Module28 = {}
Module28.__index = Module28

function Module28.new(p1)
	-- upvalues: Module28 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module28))
end

function Module28:encode()
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

function Module28.decode(Buf)
	-- upvalues: Module28 (copy), ProtoModule (copy), UniversePrivateServerDataModule (copy)
	local NewModule = Module28.new()
	local v29 = 0
	while v29 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1146 = ProtoModule.readTag(Buf, v29)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1146 = ProtoModule.readVarInt(Buf, v29)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1146 = ProtoModule.readBuffer(Buf, v29)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1146 = ProtoModule.readBuffer(Buf, v29)
				NewModule.value = UniversePrivateServerDataModule.UniversePrivateServerData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v29)
				v29 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1146 = ProtoModule.readFixed32(Buf, v29)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1146 = ProtoModule.readFixed64(Buf, v29)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module28:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module28:jsonDecode()
	-- upvalues: Module28 (copy), UniversePrivateServerDataModule (copy)
	local NewModule = Module28.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = UniversePrivateServerDataModule.UniversePrivateServerData.jsonDecode(self.value)
	end
	return NewModule
end

Module28.descriptor = {
	name = "HydrationContent_UniversePrivateServerEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniversePrivateServerEntry"
}
t.HydrationContent_UniversePrivateServerEntry = Module28
TypeRegistryModule.default:register(t.HydrationContent_UniversePrivateServerEntry)
local Module29 = {}
Module29.__index = Module29

function Module29.new(p1)
	-- upvalues: Module29 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module29))
end

function Module29:encode()
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

function Module29.decode(Buf)
	-- upvalues: Module29 (copy), ProtoModule (copy), NotificationBadgeDataModule (copy)
	local NewModule = Module29.new()
	local v30 = 0
	while v30 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1166 = ProtoModule.readTag(Buf, v30)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1166 = ProtoModule.readVarInt(Buf, v30)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1166 = ProtoModule.readBuffer(Buf, v30)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1166 = ProtoModule.readBuffer(Buf, v30)
				NewModule.value = NotificationBadgeDataModule.NotificationBadgeData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v30)
				v30 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1166 = ProtoModule.readFixed32(Buf, v30)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1166 = ProtoModule.readFixed64(Buf, v30)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module29:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module29:jsonDecode()
	-- upvalues: Module29 (copy), NotificationBadgeDataModule (copy)
	local NewModule = Module29.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = NotificationBadgeDataModule.NotificationBadgeData.jsonDecode(self.value)
	end
	return NewModule
end

Module29.descriptor = {
	name = "HydrationContent_NotificationBadgeEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.NotificationBadgeEntry"
}
t.HydrationContent_NotificationBadgeEntry = Module29
TypeRegistryModule.default:register(t.HydrationContent_NotificationBadgeEntry)
local Module30 = {}
Module30.__index = Module30

function Module30.new(p1)
	-- upvalues: Module30 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module30))
end

function Module30:encode()
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

function Module30.decode(Buf)
	-- upvalues: Module30 (copy), ProtoModule (copy), CollectibleItemDataModule (copy)
	local NewModule = Module30.new()
	local v31 = 0
	while v31 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1186 = ProtoModule.readTag(Buf, v31)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1186 = ProtoModule.readVarInt(Buf, v31)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1186 = ProtoModule.readBuffer(Buf, v31)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1186 = ProtoModule.readBuffer(Buf, v31)
				NewModule.value = CollectibleItemDataModule.CollectibleItemData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v31)
				v31 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1186 = ProtoModule.readFixed32(Buf, v31)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1186 = ProtoModule.readFixed64(Buf, v31)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module30:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module30:jsonDecode()
	-- upvalues: Module30 (copy), CollectibleItemDataModule (copy)
	local NewModule = Module30.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = CollectibleItemDataModule.CollectibleItemData.jsonDecode(self.value)
	end
	return NewModule
end

Module30.descriptor = {
	name = "HydrationContent_CollectibleItemEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.CollectibleItemEntry"
}
t.HydrationContent_CollectibleItemEntry = Module30
TypeRegistryModule.default:register(t.HydrationContent_CollectibleItemEntry)
local Module31 = {}
Module31.__index = Module31

function Module31.new(p1)
	-- upvalues: Module31 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module31))
end

function Module31:encode()
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

function Module31.decode(Buf)
	-- upvalues: Module31 (copy), ProtoModule (copy), LeaderboardStatsDataModule (copy)
	local NewModule = Module31.new()
	local v32 = 0
	while v32 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1206 = ProtoModule.readTag(Buf, v32)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1206 = ProtoModule.readVarInt(Buf, v32)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1206 = ProtoModule.readBuffer(Buf, v32)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1206 = ProtoModule.readBuffer(Buf, v32)
				NewModule.value = LeaderboardStatsDataModule.LeaderboardStatsData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v32)
				v32 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1206 = ProtoModule.readFixed32(Buf, v32)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1206 = ProtoModule.readFixed64(Buf, v32)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module31:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module31:jsonDecode()
	-- upvalues: Module31 (copy), LeaderboardStatsDataModule (copy)
	local NewModule = Module31.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = LeaderboardStatsDataModule.LeaderboardStatsData.jsonDecode(self.value)
	end
	return NewModule
end

Module31.descriptor = {
	name = "HydrationContent_LeaderboardStatsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.LeaderboardStatsEntry"
}
t.HydrationContent_LeaderboardStatsEntry = Module31
TypeRegistryModule.default:register(t.HydrationContent_LeaderboardStatsEntry)

return { HydrationContent = t.HydrationContent }