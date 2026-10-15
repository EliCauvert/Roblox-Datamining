local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local badgeDataModule = require(script.Parent.badge_data)
local universeDataModule = require(script.Parent.universe_data)
local universeUserFavoriteDataModule = require(script.Parent.universe_user_favorite_data)
local universeUserFollowDataModule = require(script.Parent.universe_user_follow_data)
local universeUserFollowLimitDataModule = require(script.Parent.universe_user_follow_limit_data)
local universeUserVoteDataModule = require(script.Parent.universe_user_vote_data)
local universeUserVoteFeedbackMetadataDataModule = require(script.Parent.universe_user_vote_feedback_metadata_data)
local creatorDataModule = require(script.Parent.creator_data)
local eventDataModule = require(script.Parent.event_data)
local songDataModule = require(script.Parent.song_data)
local gamePassDataModule = require(script.Parent.game_pass_data)
local playabilityDataModule = require(script.Parent.playability_data)
local mediaAssetDataModule = require(script.Parent.media_asset_data)
local socialLinkDataModule = require(script.Parent.social_link_data)
local marketplaceCatalogCategoryDataModule = require(script.Parent.marketplace_catalog_category_data)
local marketplaceAssetDataModule = require(script.Parent.marketplace_asset_data)
local marketplaceBundleDataModule = require(script.Parent.marketplace_bundle_data)
local marketplaceLookDataModule = require(script.Parent.marketplace_look_data)
local catalogSortDataModule = require(script.Parent.catalog_sort_data)
local gameDeveloperProductDataModule = require(script.Parent.game_developer_product_data)
local gameSubscriptionDataModule = require(script.Parent.game_subscription_data)
local ageRecommendationDataModule = require(script.Parent.age_recommendation_data)
local userProfileDataModule = require(script.Parent.user_profile_data)
local momentDataModule = require(script.Parent.moment_data)
local communityDataModule = require(script.Parent.community_data)
local communityUserMembershipDataModule = require(script.Parent.community_user_membership_data)
local friendRecommendationDataModule = require(script.Parent.friend_recommendation_data)
local notificationBadgeDataModule = require(script.Parent.notification_badge_data)
local universePrivateServerDataModule = require(script.Parent.universe_private_server_data)
local collectibleItemDataModule = require(script.Parent.collectible_item_data)
local leaderboardStatsDataModule = require(script.Parent.leaderboard_stats_data)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
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
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.badge ~= nil and next(self.badge) ~= nil then
		for i, v in self.badge do
			local var2, var3 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2, var69 = protoModule.writeString(var2, var3, i)
			local var4 = v:encode()
			var3, var71 = protoModule.writeTag(var2, var3, 2, protoModule.wireTypes.lengthDelimited)
			var3, var71 = protoModule.writeBuffer(var3, var71, var4, buffer.len(var4))
			local var5 = var3
			local var6 = var71
			local var7, var8 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var7, var75 = protoModule.writeBuffer(var7, var8, var5, var6)
			buff = var7
			var1 = var8
		end
	end
	if self.universe ~= nil and next(self.universe) ~= nil then
		for i, v in self.universe do
			local var9, var10 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var9, var77 = protoModule.writeString(var9, var10, i)
			local var11 = v:encode()
			var10, var79 = protoModule.writeTag(var9, var10, 2, protoModule.wireTypes.lengthDelimited)
			var10, var79 = protoModule.writeBuffer(var10, var79, var11, buffer.len(var11))
			local var12 = var10
			local var13 = var79
			local var14, var15 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var14, var83 = protoModule.writeBuffer(var14, var15, var12, var13)
			buff = var14
			var1 = var15
		end
	end
	if self.creator ~= nil and next(self.creator) ~= nil then
		for i, v in self.creator do
			local var16, var17 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var16, var85 = protoModule.writeString(var16, var17, i)
			local var18 = v:encode()
			var17, var87 = protoModule.writeTag(var16, var17, 2, protoModule.wireTypes.lengthDelimited)
			var17, var87 = protoModule.writeBuffer(var17, var87, var18, buffer.len(var18))
			local var19 = var17
			local var20 = var87
			local var21, var22 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var21, var91 = protoModule.writeBuffer(var21, var22, var19, var20)
			buff = var21
			var1 = var22
		end
	end
	if self.event ~= nil and next(self.event) ~= nil then
		for i, v in self.event do
			local var23, var24 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var23, var93 = protoModule.writeString(var23, var24, i)
			local var25 = v:encode()
			var24, var95 = protoModule.writeTag(var23, var24, 2, protoModule.wireTypes.lengthDelimited)
			var24, var95 = protoModule.writeBuffer(var24, var95, var25, buffer.len(var25))
			local var26 = var24
			local var27 = var95
			local var28, var29 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
			var28, var99 = protoModule.writeBuffer(var28, var29, var26, var27)
			buff = var28
			var1 = var29
		end
	end
	if self.song ~= nil and next(self.song) ~= nil then
		for i, v in self.song do
			local var30, var31 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var30, var101 = protoModule.writeString(var30, var31, i)
			local var32 = v:encode()
			var31, var103 = protoModule.writeTag(var30, var31, 2, protoModule.wireTypes.lengthDelimited)
			var31, var103 = protoModule.writeBuffer(var31, var103, var32, buffer.len(var32))
			local var33 = var31
			local var34 = var103
			local var35, var36 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
			var35, var107 = protoModule.writeBuffer(var35, var36, var33, var34)
			buff = var35
			var1 = var36
		end
	end
	if self.game_pass ~= nil and next(self.game_pass) ~= nil then
		for i, v in self.game_pass do
			local var37, var38 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var37, var109 = protoModule.writeString(var37, var38, i)
			local var39 = v:encode()
			var38, var111 = protoModule.writeTag(var37, var38, 2, protoModule.wireTypes.lengthDelimited)
			var38, var111 = protoModule.writeBuffer(var38, var111, var39, buffer.len(var39))
			local var40 = var38
			local var41 = var111
			local var42, var43 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
			var42, var115 = protoModule.writeBuffer(var42, var43, var40, var41)
			buff = var42
			var1 = var43
		end
	end
	if self.media_asset ~= nil and next(self.media_asset) ~= nil then
		for i, v in self.media_asset do
			local var44, var45 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var44, var117 = protoModule.writeString(var44, var45, i)
			local var46 = v:encode()
			var45, var119 = protoModule.writeTag(var44, var45, 2, protoModule.wireTypes.lengthDelimited)
			var45, var119 = protoModule.writeBuffer(var45, var119, var46, buffer.len(var46))
			local var47 = var45
			local var48 = var119
			local var49, var50 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
			var49, var123 = protoModule.writeBuffer(var49, var50, var47, var48)
			buff = var49
			var1 = var50
		end
	end
	if self.social_link ~= nil and next(self.social_link) ~= nil then
		for i, v in self.social_link do
			local var51, var52 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var51, var125 = protoModule.writeString(var51, var52, i)
			local var53 = v:encode()
			var52, var127 = protoModule.writeTag(var51, var52, 2, protoModule.wireTypes.lengthDelimited)
			var52, var127 = protoModule.writeBuffer(var52, var127, var53, buffer.len(var53))
			local var54 = var52
			local var55 = var127
			local var56, var57 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
			var56, var131 = protoModule.writeBuffer(var56, var57, var54, var55)
			buff = var56
			var1 = var57
		end
	end
	if self.game_developer_product ~= nil and next(self.game_developer_product) ~= nil then
		for i, v in self.game_developer_product do
			local var58, var59 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var58, var133 = protoModule.writeString(var58, var59, i)
			local var60 = v:encode()
			var59, var135 = protoModule.writeTag(var58, var59, 2, protoModule.wireTypes.lengthDelimited)
			var59, var135 = protoModule.writeBuffer(var59, var135, var60, buffer.len(var60))
			local var61 = var59
			local var62 = var135
			local var63, var64 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
			var63, var139 = protoModule.writeBuffer(var63, var64, var61, var62)
			buff = var63
			var1 = var64
		end
	end
	if self.game_subscription ~= nil and next(self.game_subscription) ~= nil then
		for i, v in self.game_subscription do
			local var65, var66 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var65, var141 = protoModule.writeString(var65, var66, i)
			local var67 = v:encode()
			var66, var143 = protoModule.writeTag(var65, var66, 2, protoModule.wireTypes.lengthDelimited)
			var66, var143 = protoModule.writeBuffer(var66, var143, var67, buffer.len(var67))
			local var68 = var66
			local var69 = var143
			local var70, var71 = protoModule.writeTag(buff, var1, 10, protoModule.wireTypes.lengthDelimited)
			var70, var147 = protoModule.writeBuffer(var70, var71, var68, var69)
			buff = var70
			var1 = var71
		end
	end
	if self.marketplace_catalog_category ~= nil and next(self.marketplace_catalog_category) ~= nil then
		for i, v in self.marketplace_catalog_category do
			local var72, var73 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var72, var149 = protoModule.writeString(var72, var73, i)
			local var74 = v:encode()
			var73, var151 = protoModule.writeTag(var72, var73, 2, protoModule.wireTypes.lengthDelimited)
			var73, var151 = protoModule.writeBuffer(var73, var151, var74, buffer.len(var74))
			local var75 = var73
			local var76 = var151
			local var77, var78 = protoModule.writeTag(buff, var1, 11, protoModule.wireTypes.lengthDelimited)
			var77, var155 = protoModule.writeBuffer(var77, var78, var75, var76)
			buff = var77
			var1 = var78
		end
	end
	if self.marketplace_asset ~= nil and next(self.marketplace_asset) ~= nil then
		for i, v in self.marketplace_asset do
			local var79, var80 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var79, var157 = protoModule.writeString(var79, var80, i)
			local var81 = v:encode()
			var80, var159 = protoModule.writeTag(var79, var80, 2, protoModule.wireTypes.lengthDelimited)
			var80, var159 = protoModule.writeBuffer(var80, var159, var81, buffer.len(var81))
			local var82 = var80
			local var83 = var159
			local var84, var85 = protoModule.writeTag(buff, var1, 12, protoModule.wireTypes.lengthDelimited)
			var84, var163 = protoModule.writeBuffer(var84, var85, var82, var83)
			buff = var84
			var1 = var85
		end
	end
	if self.marketplace_bundle ~= nil and next(self.marketplace_bundle) ~= nil then
		for i, v in self.marketplace_bundle do
			local var86, var87 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var86, var165 = protoModule.writeString(var86, var87, i)
			local var88 = v:encode()
			var87, var167 = protoModule.writeTag(var86, var87, 2, protoModule.wireTypes.lengthDelimited)
			var87, var167 = protoModule.writeBuffer(var87, var167, var88, buffer.len(var88))
			local var89 = var87
			local var90 = var167
			local var91, var92 = protoModule.writeTag(buff, var1, 13, protoModule.wireTypes.lengthDelimited)
			var91, var171 = protoModule.writeBuffer(var91, var92, var89, var90)
			buff = var91
			var1 = var92
		end
	end
	if self.marketplace_look ~= nil and next(self.marketplace_look) ~= nil then
		for i, v in self.marketplace_look do
			local var93, var94 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var93, var173 = protoModule.writeString(var93, var94, i)
			local var95 = v:encode()
			var94, var175 = protoModule.writeTag(var93, var94, 2, protoModule.wireTypes.lengthDelimited)
			var94, var175 = protoModule.writeBuffer(var94, var175, var95, buffer.len(var95))
			local var96 = var94
			local var97 = var175
			local var98, var99 = protoModule.writeTag(buff, var1, 14, protoModule.wireTypes.lengthDelimited)
			var98, var179 = protoModule.writeBuffer(var98, var99, var96, var97)
			buff = var98
			var1 = var99
		end
	end
	if self.catalog_sort ~= nil and next(self.catalog_sort) ~= nil then
		for i, v in self.catalog_sort do
			local var100, var101 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var100, var181 = protoModule.writeString(var100, var101, i)
			local var102 = v:encode()
			var101, var183 = protoModule.writeTag(var100, var101, 2, protoModule.wireTypes.lengthDelimited)
			var101, var183 = protoModule.writeBuffer(var101, var183, var102, buffer.len(var102))
			local var103 = var101
			local var104 = var183
			local var105, var106 = protoModule.writeTag(buff, var1, 15, protoModule.wireTypes.lengthDelimited)
			var105, var187 = protoModule.writeBuffer(var105, var106, var103, var104)
			buff = var105
			var1 = var106
		end
	end
	if self.age_recommendation ~= nil and next(self.age_recommendation) ~= nil then
		for i, v in self.age_recommendation do
			local var107, var108 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var107, var189 = protoModule.writeString(var107, var108, i)
			local var109 = v:encode()
			var108, var191 = protoModule.writeTag(var107, var108, 2, protoModule.wireTypes.lengthDelimited)
			var108, var191 = protoModule.writeBuffer(var108, var191, var109, buffer.len(var109))
			local var110 = var108
			local var111 = var191
			local var112, var113 = protoModule.writeTag(buff, var1, 16, protoModule.wireTypes.lengthDelimited)
			var112, var195 = protoModule.writeBuffer(var112, var113, var110, var111)
			buff = var112
			var1 = var113
		end
	end
	if self.universe_user_follow ~= nil and next(self.universe_user_follow) ~= nil then
		for i, v in self.universe_user_follow do
			local var114, var115 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var114, var197 = protoModule.writeString(var114, var115, i)
			local var116 = v:encode()
			var115, var199 = protoModule.writeTag(var114, var115, 2, protoModule.wireTypes.lengthDelimited)
			var115, var199 = protoModule.writeBuffer(var115, var199, var116, buffer.len(var116))
			local var117 = var115
			local var118 = var199
			local var119, var120 = protoModule.writeTag(buff, var1, 17, protoModule.wireTypes.lengthDelimited)
			var119, var203 = protoModule.writeBuffer(var119, var120, var117, var118)
			buff = var119
			var1 = var120
		end
	end
	if self.universe_user_vote ~= nil and next(self.universe_user_vote) ~= nil then
		for i, v in self.universe_user_vote do
			local var121, var122 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var121, var205 = protoModule.writeString(var121, var122, i)
			local var123 = v:encode()
			var122, var207 = protoModule.writeTag(var121, var122, 2, protoModule.wireTypes.lengthDelimited)
			var122, var207 = protoModule.writeBuffer(var122, var207, var123, buffer.len(var123))
			local var124 = var122
			local var125 = var207
			local var126, var127 = protoModule.writeTag(buff, var1, 18, protoModule.wireTypes.lengthDelimited)
			var126, var211 = protoModule.writeBuffer(var126, var127, var124, var125)
			buff = var126
			var1 = var127
		end
	end
	if self.user_profile ~= nil and next(self.user_profile) ~= nil then
		for i, v in self.user_profile do
			local var128, var129 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var128, var213 = protoModule.writeString(var128, var129, i)
			local var130 = v:encode()
			var129, var215 = protoModule.writeTag(var128, var129, 2, protoModule.wireTypes.lengthDelimited)
			var129, var215 = protoModule.writeBuffer(var129, var215, var130, buffer.len(var130))
			local var131 = var129
			local var132 = var215
			local var133, var134 = protoModule.writeTag(buff, var1, 19, protoModule.wireTypes.lengthDelimited)
			var133, var219 = protoModule.writeBuffer(var133, var134, var131, var132)
			buff = var133
			var1 = var134
		end
	end
	if self.universe_user_favorite ~= nil and next(self.universe_user_favorite) ~= nil then
		for i, v in self.universe_user_favorite do
			local var135, var136 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var135, var221 = protoModule.writeString(var135, var136, i)
			local var137 = v:encode()
			var136, var223 = protoModule.writeTag(var135, var136, 2, protoModule.wireTypes.lengthDelimited)
			var136, var223 = protoModule.writeBuffer(var136, var223, var137, buffer.len(var137))
			local var138 = var136
			local var139 = var223
			local var140, var141 = protoModule.writeTag(buff, var1, 20, protoModule.wireTypes.lengthDelimited)
			var140, var227 = protoModule.writeBuffer(var140, var141, var138, var139)
			buff = var140
			var1 = var141
		end
	end
	if self.playability ~= nil and next(self.playability) ~= nil then
		for i, v in self.playability do
			local var142, var143 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var142, var229 = protoModule.writeString(var142, var143, i)
			local var144 = v:encode()
			var143, var231 = protoModule.writeTag(var142, var143, 2, protoModule.wireTypes.lengthDelimited)
			var143, var231 = protoModule.writeBuffer(var143, var231, var144, buffer.len(var144))
			local var145 = var143
			local var146 = var231
			local var147, var148 = protoModule.writeTag(buff, var1, 21, protoModule.wireTypes.lengthDelimited)
			var147, var235 = protoModule.writeBuffer(var147, var148, var145, var146)
			buff = var147
			var1 = var148
		end
	end
	if self.universe_user_follow_limit ~= nil and next(self.universe_user_follow_limit) ~= nil then
		for i, v in self.universe_user_follow_limit do
			local var149, var150 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var149, var237 = protoModule.writeString(var149, var150, i)
			local var151 = v:encode()
			var150, var239 = protoModule.writeTag(var149, var150, 2, protoModule.wireTypes.lengthDelimited)
			var150, var239 = protoModule.writeBuffer(var150, var239, var151, buffer.len(var151))
			local var152 = var150
			local var153 = var239
			local var154, var155 = protoModule.writeTag(buff, var1, 22, protoModule.wireTypes.lengthDelimited)
			var154, var243 = protoModule.writeBuffer(var154, var155, var152, var153)
			buff = var154
			var1 = var155
		end
	end
	if self.universe_user_vote_feedback_metadata ~= nil and next(self.universe_user_vote_feedback_metadata) ~= nil then
		for i, v in self.universe_user_vote_feedback_metadata do
			local var156, var157 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var156, var245 = protoModule.writeString(var156, var157, i)
			local var158 = v:encode()
			var157, var247 = protoModule.writeTag(var156, var157, 2, protoModule.wireTypes.lengthDelimited)
			var157, var247 = protoModule.writeBuffer(var157, var247, var158, buffer.len(var158))
			local var159 = var157
			local var160 = var247
			local var161, var162 = protoModule.writeTag(buff, var1, 23, protoModule.wireTypes.lengthDelimited)
			var161, var251 = protoModule.writeBuffer(var161, var162, var159, var160)
			buff = var161
			var1 = var162
		end
	end
	if self.moment ~= nil and next(self.moment) ~= nil then
		for i, v in self.moment do
			local var163, var164 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var163, var253 = protoModule.writeString(var163, var164, i)
			local var165 = v:encode()
			var164, var255 = protoModule.writeTag(var163, var164, 2, protoModule.wireTypes.lengthDelimited)
			var164, var255 = protoModule.writeBuffer(var164, var255, var165, buffer.len(var165))
			local var166 = var164
			local var167 = var255
			local var168, var169 = protoModule.writeTag(buff, var1, 24, protoModule.wireTypes.lengthDelimited)
			var168, var259 = protoModule.writeBuffer(var168, var169, var166, var167)
			buff = var168
			var1 = var169
		end
	end
	if self.community ~= nil and next(self.community) ~= nil then
		for i, v in self.community do
			local var170, var171 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var170, var261 = protoModule.writeString(var170, var171, i)
			local var172 = v:encode()
			var171, var263 = protoModule.writeTag(var170, var171, 2, protoModule.wireTypes.lengthDelimited)
			var171, var263 = protoModule.writeBuffer(var171, var263, var172, buffer.len(var172))
			local var173 = var171
			local var174 = var263
			local var175, var176 = protoModule.writeTag(buff, var1, 25, protoModule.wireTypes.lengthDelimited)
			var175, var267 = protoModule.writeBuffer(var175, var176, var173, var174)
			buff = var175
			var1 = var176
		end
	end
	if self.community_user_membership ~= nil and next(self.community_user_membership) ~= nil then
		for i, v in self.community_user_membership do
			local var177, var178 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var177, var269 = protoModule.writeString(var177, var178, i)
			local var179 = v:encode()
			var178, var271 = protoModule.writeTag(var177, var178, 2, protoModule.wireTypes.lengthDelimited)
			var178, var271 = protoModule.writeBuffer(var178, var271, var179, buffer.len(var179))
			local var180 = var178
			local var181 = var271
			local var182, var183 = protoModule.writeTag(buff, var1, 26, protoModule.wireTypes.lengthDelimited)
			var182, var275 = protoModule.writeBuffer(var182, var183, var180, var181)
			buff = var182
			var1 = var183
		end
	end
	if self.friend_recommendation ~= nil and next(self.friend_recommendation) ~= nil then
		for i, v in self.friend_recommendation do
			local var184, var185 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var184, var277 = protoModule.writeString(var184, var185, i)
			local var186 = v:encode()
			var185, var279 = protoModule.writeTag(var184, var185, 2, protoModule.wireTypes.lengthDelimited)
			var185, var279 = protoModule.writeBuffer(var185, var279, var186, buffer.len(var186))
			local var187 = var185
			local var188 = var279
			local var189, var190 = protoModule.writeTag(buff, var1, 27, protoModule.wireTypes.lengthDelimited)
			var189, var283 = protoModule.writeBuffer(var189, var190, var187, var188)
			buff = var189
			var1 = var190
		end
	end
	if self.universe_private_server ~= nil and next(self.universe_private_server) ~= nil then
		for i, v in self.universe_private_server do
			local var191, var192 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var191, var285 = protoModule.writeString(var191, var192, i)
			local var193 = v:encode()
			var192, var287 = protoModule.writeTag(var191, var192, 2, protoModule.wireTypes.lengthDelimited)
			var192, var287 = protoModule.writeBuffer(var192, var287, var193, buffer.len(var193))
			local var194 = var192
			local var195 = var287
			local var196, var197 = protoModule.writeTag(buff, var1, 28, protoModule.wireTypes.lengthDelimited)
			var196, var291 = protoModule.writeBuffer(var196, var197, var194, var195)
			buff = var196
			var1 = var197
		end
	end
	if self.notification_badge ~= nil and next(self.notification_badge) ~= nil then
		for i, v in self.notification_badge do
			local var198, var199 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var198, var293 = protoModule.writeString(var198, var199, i)
			local var200 = v:encode()
			var199, var295 = protoModule.writeTag(var198, var199, 2, protoModule.wireTypes.lengthDelimited)
			var199, var295 = protoModule.writeBuffer(var199, var295, var200, buffer.len(var200))
			local var201 = var199
			local var202 = var295
			local var203, var204 = protoModule.writeTag(buff, var1, 29, protoModule.wireTypes.lengthDelimited)
			var203, var299 = protoModule.writeBuffer(var203, var204, var201, var202)
			buff = var203
			var1 = var204
		end
	end
	if self.collectible_item ~= nil and next(self.collectible_item) ~= nil then
		for i, v in self.collectible_item do
			local var205, var206 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var205, var301 = protoModule.writeString(var205, var206, i)
			local var207 = v:encode()
			var206, var303 = protoModule.writeTag(var205, var206, 2, protoModule.wireTypes.lengthDelimited)
			var206, var303 = protoModule.writeBuffer(var206, var303, var207, buffer.len(var207))
			local var208 = var206
			local var209 = var303
			local var210, var211 = protoModule.writeTag(buff, var1, 30, protoModule.wireTypes.lengthDelimited)
			var210, var307 = protoModule.writeBuffer(var210, var211, var208, var209)
			buff = var210
			var1 = var211
		end
	end
	if self.leaderboard_stats ~= nil and next(self.leaderboard_stats) ~= nil then
		for i, v in self.leaderboard_stats do
			local var212, var213 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var212, var309 = protoModule.writeString(var212, var213, i)
			local var214 = v:encode()
			var213, var311 = protoModule.writeTag(var212, var213, 2, protoModule.wireTypes.lengthDelimited)
			var213, var311 = protoModule.writeBuffer(var213, var311, var214, buffer.len(var214))
			local var215 = var213
			local var216 = var311
			local var217, var218 = protoModule.writeTag(buff, var1, 31, protoModule.wireTypes.lengthDelimited)
			var217, var315 = protoModule.writeBuffer(var217, var218, var215, var216)
			buff = var217
			var1 = var218
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), t (ref), badgeDataModule (ref), universeDataModule (ref), creatorDataModule (ref), eventDataModule (ref), songDataModule (ref), gamePassDataModule (ref), mediaAssetDataModule (ref), socialLinkDataModule (ref), gameDeveloperProductDataModule (ref), gameSubscriptionDataModule (ref), marketplaceCatalogCategoryDataModule (ref), marketplaceAssetDataModule (ref), marketplaceBundleDataModule (ref), marketplaceLookDataModule (ref), catalogSortDataModule (ref), ageRecommendationDataModule (ref), universeUserFollowDataModule (ref), universeUserVoteDataModule (ref), userProfileDataModule (ref), universeUserFavoriteDataModule (ref), playabilityDataModule (ref), universeUserFollowLimitDataModule (ref), universeUserVoteFeedbackMetadataDataModule (ref), momentDataModule (ref), communityDataModule (ref), communityUserMembershipDataModule (ref), friendRecommendationDataModule (ref), universePrivateServerDataModule (ref), notificationBadgeDataModule (ref), collectibleItemDataModule (ref), leaderboardStatsDataModule (ref)
	local var219 = t_1.new()
	local var220 = 0
	while var220 < buffer.len(p1) do
		local _ = nil
		local var221 = nil
		local var222, var223, var224 = protoModule.readTag(p1, var220)
		local var225 = var222
		var221 = var223
		var220 = var224
		
		if var221 == protoModule.wireTypes.varint then
			local _ = nil
			local var226, var227 = protoModule.readVarInt(p1, var220)
			local _ = var226
			var220 = var227
			continue
		end
		if var221 == protoModule.wireTypes.lengthDelimited then
			if var225 == 1 then
				local _ = nil
				local var228, var229 = protoModule.readBuffer(p1, var220)
				var220 = var229
				var228 = t.HydrationContent_BadgeEntry.decode(var228)
				var219.badge[var228.key or ""] = var228.value or badgeDataModule.BadgeData.new()
			elseif var225 == 2 then
				local _ = nil
				local var230, var231 = protoModule.readBuffer(p1, var220)
				var220 = var231
				var230 = t.HydrationContent_UniverseEntry.decode(var230)
				var219.universe[var230.key or ""] = var230.value or universeDataModule.UniverseData.new()
			elseif var225 == 3 then
				local _ = nil
				local var232, var233 = protoModule.readBuffer(p1, var220)
				var220 = var233
				var232 = t.HydrationContent_CreatorEntry.decode(var232)
				var219.creator[var232.key or ""] = var232.value or creatorDataModule.CreatorData.new()
			elseif var225 == 4 then
				local _ = nil
				local var234, var235 = protoModule.readBuffer(p1, var220)
				var220 = var235
				var234 = t.HydrationContent_EventEntry.decode(var234)
				var219.event[var234.key or ""] = var234.value or eventDataModule.EventData.new()
			elseif var225 == 5 then
				local _ = nil
				local var236, var237 = protoModule.readBuffer(p1, var220)
				var220 = var237
				var236 = t.HydrationContent_SongEntry.decode(var236)
				var219.song[var236.key or ""] = var236.value or songDataModule.SongData.new()
			elseif var225 == 6 then
				local _ = nil
				local var238, var239 = protoModule.readBuffer(p1, var220)
				var220 = var239
				var238 = t.HydrationContent_GamePassEntry.decode(var238)
				var219.game_pass[var238.key or ""] = var238.value or gamePassDataModule.GamePassData.new()
			elseif var225 == 7 then
				local _ = nil
				local var240, var241 = protoModule.readBuffer(p1, var220)
				var220 = var241
				var240 = t.HydrationContent_MediaAssetEntry.decode(var240)
				var219.media_asset[var240.key or ""] = var240.value or mediaAssetDataModule.MediaAssetData.new()
			elseif var225 == 8 then
				local _ = nil
				local var242, var243 = protoModule.readBuffer(p1, var220)
				var220 = var243
				var242 = t.HydrationContent_SocialLinkEntry.decode(var242)
				var219.social_link[var242.key or ""] = var242.value or socialLinkDataModule.SocialLinkData.new()
			elseif var225 == 9 then
				local _ = nil
				local var244, var245 = protoModule.readBuffer(p1, var220)
				var220 = var245
				var244 = t.HydrationContent_GameDeveloperProductEntry.decode(var244)
				var219.game_developer_product[var244.key or ""] = var244.value or gameDeveloperProductDataModule.GameDeveloperProductData.new()
			elseif var225 == 10 then
				local _ = nil
				local var246, var247 = protoModule.readBuffer(p1, var220)
				var220 = var247
				var246 = t.HydrationContent_GameSubscriptionEntry.decode(var246)
				var219.game_subscription[var246.key or ""] = var246.value or gameSubscriptionDataModule.GameSubscriptionData.new()
			elseif var225 == 11 then
				local _ = nil
				local var248, var249 = protoModule.readBuffer(p1, var220)
				var220 = var249
				var248 = t.HydrationContent_MarketplaceCatalogCategoryEntry.decode(var248)
				var219.marketplace_catalog_category[var248.key or ""] = var248.value or marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.new()
			elseif var225 == 12 then
				local _ = nil
				local var250, var251 = protoModule.readBuffer(p1, var220)
				var220 = var251
				var250 = t.HydrationContent_MarketplaceAssetEntry.decode(var250)
				var219.marketplace_asset[var250.key or ""] = var250.value or marketplaceAssetDataModule.MarketplaceAssetData.new()
			elseif var225 == 13 then
				local _ = nil
				local var252, var253 = protoModule.readBuffer(p1, var220)
				var220 = var253
				var252 = t.HydrationContent_MarketplaceBundleEntry.decode(var252)
				var219.marketplace_bundle[var252.key or ""] = var252.value or marketplaceBundleDataModule.MarketplaceBundleData.new()
			elseif var225 == 14 then
				local _ = nil
				local var254, var255 = protoModule.readBuffer(p1, var220)
				var220 = var255
				var254 = t.HydrationContent_MarketplaceLookEntry.decode(var254)
				var219.marketplace_look[var254.key or ""] = var254.value or marketplaceLookDataModule.MarketplaceLookData.new()
			elseif var225 == 15 then
				local _ = nil
				local var256, var257 = protoModule.readBuffer(p1, var220)
				var220 = var257
				var256 = t.HydrationContent_CatalogSortEntry.decode(var256)
				var219.catalog_sort[var256.key or ""] = var256.value or catalogSortDataModule.CatalogSortData.new()
			elseif var225 == 16 then
				local _ = nil
				local var258, var259 = protoModule.readBuffer(p1, var220)
				var220 = var259
				var258 = t.HydrationContent_AgeRecommendationEntry.decode(var258)
				var219.age_recommendation[var258.key or ""] = var258.value or ageRecommendationDataModule.AgeRecommendationData.new()
			elseif var225 == 17 then
				local _ = nil
				local var260, var261 = protoModule.readBuffer(p1, var220)
				var220 = var261
				var260 = t.HydrationContent_UniverseUserFollowEntry.decode(var260)
				var219.universe_user_follow[var260.key or ""] = var260.value or universeUserFollowDataModule.UniverseUserFollowData.new()
			elseif var225 == 18 then
				local _ = nil
				local var262, var263 = protoModule.readBuffer(p1, var220)
				var220 = var263
				var262 = t.HydrationContent_UniverseUserVoteEntry.decode(var262)
				var219.universe_user_vote[var262.key or ""] = var262.value or universeUserVoteDataModule.UniverseUserVoteData.new()
			elseif var225 == 19 then
				local _ = nil
				local var264, var265 = protoModule.readBuffer(p1, var220)
				var220 = var265
				var264 = t.HydrationContent_UserProfileEntry.decode(var264)
				var219.user_profile[var264.key or ""] = var264.value or userProfileDataModule.UserProfileData.new()
			elseif var225 == 20 then
				local _ = nil
				local var266, var267 = protoModule.readBuffer(p1, var220)
				var220 = var267
				var266 = t.HydrationContent_UniverseUserFavoriteEntry.decode(var266)
				var219.universe_user_favorite[var266.key or ""] = var266.value or universeUserFavoriteDataModule.UniverseUserFavoriteData.new()
			elseif var225 == 21 then
				local _ = nil
				local var268, var269 = protoModule.readBuffer(p1, var220)
				var220 = var269
				var268 = t.HydrationContent_PlayabilityEntry.decode(var268)
				var219.playability[var268.key or ""] = var268.value or playabilityDataModule.PlayabilityData.new()
			elseif var225 == 22 then
				local _ = nil
				local var270, var271 = protoModule.readBuffer(p1, var220)
				var220 = var271
				var270 = t.HydrationContent_UniverseUserFollowLimitEntry.decode(var270)
				var219.universe_user_follow_limit[var270.key or ""] = var270.value or universeUserFollowLimitDataModule.UniverseUserFollowLimitData.new()
			elseif var225 == 23 then
				local _ = nil
				local var272, var273 = protoModule.readBuffer(p1, var220)
				var220 = var273
				var272 = t.HydrationContent_UniverseUserVoteFeedbackMetadataEntry.decode(var272)
				var219.universe_user_vote_feedback_metadata[var272.key or ""] = var272.value or universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.new()
			elseif var225 == 24 then
				local _ = nil
				local var274, var275 = protoModule.readBuffer(p1, var220)
				var220 = var275
				var274 = t.HydrationContent_MomentEntry.decode(var274)
				var219.moment[var274.key or ""] = var274.value or momentDataModule.MomentData.new()
			elseif var225 == 25 then
				local _ = nil
				local var276, var277 = protoModule.readBuffer(p1, var220)
				var220 = var277
				var276 = t.HydrationContent_CommunityEntry.decode(var276)
				var219.community[var276.key or ""] = var276.value or communityDataModule.CommunityData.new()
			elseif var225 == 26 then
				local _ = nil
				local var278, var279 = protoModule.readBuffer(p1, var220)
				var220 = var279
				var278 = t.HydrationContent_CommunityUserMembershipEntry.decode(var278)
				var219.community_user_membership[var278.key or ""] = var278.value or communityUserMembershipDataModule.CommunityUserMembershipData.new()
			elseif var225 == 27 then
				local _ = nil
				local var280, var281 = protoModule.readBuffer(p1, var220)
				var220 = var281
				var280 = t.HydrationContent_FriendRecommendationEntry.decode(var280)
				var219.friend_recommendation[var280.key or ""] = var280.value or friendRecommendationDataModule.FriendRecommendationData.new()
			elseif var225 == 28 then
				local _ = nil
				local var282, var283 = protoModule.readBuffer(p1, var220)
				var220 = var283
				var282 = t.HydrationContent_UniversePrivateServerEntry.decode(var282)
				var219.universe_private_server[var282.key or ""] = var282.value or universePrivateServerDataModule.UniversePrivateServerData.new()
			elseif var225 == 29 then
				local _ = nil
				local var284, var285 = protoModule.readBuffer(p1, var220)
				var220 = var285
				var284 = t.HydrationContent_NotificationBadgeEntry.decode(var284)
				var219.notification_badge[var284.key or ""] = var284.value or notificationBadgeDataModule.NotificationBadgeData.new()
			elseif var225 == 30 then
				local _ = nil
				local var286, var287 = protoModule.readBuffer(p1, var220)
				var220 = var287
				var286 = t.HydrationContent_CollectibleItemEntry.decode(var286)
				var219.collectible_item[var286.key or ""] = var286.value or collectibleItemDataModule.CollectibleItemData.new()
			elseif var225 == 31 then
				local _ = nil
				local var288, var289 = protoModule.readBuffer(p1, var220)
				var220 = var289
				var288 = t.HydrationContent_LeaderboardStatsEntry.decode(var288)
				var219.leaderboard_stats[var288.key or ""] = var288.value or leaderboardStatsDataModule.LeaderboardStatsData.new()
			else
				local _ = nil
				local var290, var291 = protoModule.readVarInt(p1, var220)
				var220 = var291 + var290
			end
		elseif var221 == protoModule.wireTypes.i32 then
			local _ = nil
			local var292, var293 = protoModule.readFixed32(p1, var220)
			local _ = var292
			var220 = var293
		elseif var221 == protoModule.wireTypes.i64 then
			local _ = nil
			local var294, var295 = protoModule.readFixed64(p1, var220)
			local _ = var294
			var220 = var295
		else
			error("Unsupported wire type: " .. var319)
		end
	end
	return var219
end

function t_1:jsonEncode()
	local t = {}
	
	if self.badge ~= nil and next(self.badge) ~= nil then
		local t_1 = {}
		
		for i, v in self.badge do
			t_1[i] = v:jsonEncode()
		end
		t.badge = t_1
	end
	if self.universe ~= nil and next(self.universe) ~= nil then
		local t_1 = {}
		
		for i, v in self.universe do
			t_1[i] = v:jsonEncode()
		end
		t.universe = t_1
	end
	if self.creator ~= nil and next(self.creator) ~= nil then
		local t_1 = {}
		
		for i, v in self.creator do
			t_1[i] = v:jsonEncode()
		end
		t.creator = t_1
	end
	if self.event ~= nil and next(self.event) ~= nil then
		local t_1 = {}
		
		for i, v in self.event do
			t_1[i] = v:jsonEncode()
		end
		t.event = t_1
	end
	if self.song ~= nil and next(self.song) ~= nil then
		local t_1 = {}
		
		for i, v in self.song do
			t_1[i] = v:jsonEncode()
		end
		t.song = t_1
	end
	if self.game_pass ~= nil and next(self.game_pass) ~= nil then
		local t_1 = {}
		
		for i, v in self.game_pass do
			t_1[i] = v:jsonEncode()
		end
		t.gamePass = t_1
	end
	if self.media_asset ~= nil and next(self.media_asset) ~= nil then
		local t_1 = {}
		
		for i, v in self.media_asset do
			t_1[i] = v:jsonEncode()
		end
		t.mediaAsset = t_1
	end
	if self.social_link ~= nil and next(self.social_link) ~= nil then
		local t_1 = {}
		
		for i, v in self.social_link do
			t_1[i] = v:jsonEncode()
		end
		t.socialLink = t_1
	end
	if self.game_developer_product ~= nil and next(self.game_developer_product) ~= nil then
		local t_1 = {}
		
		for i, v in self.game_developer_product do
			t_1[i] = v:jsonEncode()
		end
		t.gameDeveloperProduct = t_1
	end
	if self.game_subscription ~= nil and next(self.game_subscription) ~= nil then
		local t_1 = {}
		
		for i, v in self.game_subscription do
			t_1[i] = v:jsonEncode()
		end
		t.gameSubscription = t_1
	end
	if self.marketplace_catalog_category ~= nil and next(self.marketplace_catalog_category) ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category do
			t_1[i] = v:jsonEncode()
		end
		t.marketplaceCatalogCategory = t_1
	end
	if self.marketplace_asset ~= nil and next(self.marketplace_asset) ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_asset do
			t_1[i] = v:jsonEncode()
		end
		t.marketplaceAsset = t_1
	end
	if self.marketplace_bundle ~= nil and next(self.marketplace_bundle) ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_bundle do
			t_1[i] = v:jsonEncode()
		end
		t.marketplaceBundle = t_1
	end
	if self.marketplace_look ~= nil and next(self.marketplace_look) ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_look do
			t_1[i] = v:jsonEncode()
		end
		t.marketplaceLook = t_1
	end
	if self.catalog_sort ~= nil and next(self.catalog_sort) ~= nil then
		local t_1 = {}
		
		for i, v in self.catalog_sort do
			t_1[i] = v:jsonEncode()
		end
		t.catalogSort = t_1
	end
	if self.age_recommendation ~= nil and next(self.age_recommendation) ~= nil then
		local t_1 = {}
		
		for i, v in self.age_recommendation do
			t_1[i] = v:jsonEncode()
		end
		t.ageRecommendation = t_1
	end
	if self.universe_user_follow ~= nil and next(self.universe_user_follow) ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_user_follow do
			t_1[i] = v:jsonEncode()
		end
		t.universeUserFollow = t_1
	end
	if self.universe_user_vote ~= nil and next(self.universe_user_vote) ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_user_vote do
			t_1[i] = v:jsonEncode()
		end
		t.universeUserVote = t_1
	end
	if self.user_profile ~= nil and next(self.user_profile) ~= nil then
		local t_1 = {}
		
		for i, v in self.user_profile do
			t_1[i] = v:jsonEncode()
		end
		t.userProfile = t_1
	end
	if self.universe_user_favorite ~= nil and next(self.universe_user_favorite) ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_user_favorite do
			t_1[i] = v:jsonEncode()
		end
		t.universeUserFavorite = t_1
	end
	if self.playability ~= nil and next(self.playability) ~= nil then
		local t_1 = {}
		
		for i, v in self.playability do
			t_1[i] = v:jsonEncode()
		end
		t.playability = t_1
	end
	if self.universe_user_follow_limit ~= nil and next(self.universe_user_follow_limit) ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_user_follow_limit do
			t_1[i] = v:jsonEncode()
		end
		t.universeUserFollowLimit = t_1
	end
	if self.universe_user_vote_feedback_metadata ~= nil and next(self.universe_user_vote_feedback_metadata) ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_user_vote_feedback_metadata do
			t_1[i] = v:jsonEncode()
		end
		t.universeUserVoteFeedbackMetadata = t_1
	end
	if self.moment ~= nil and next(self.moment) ~= nil then
		local t_1 = {}
		
		for i, v in self.moment do
			t_1[i] = v:jsonEncode()
		end
		t.moment = t_1
	end
	if self.community ~= nil and next(self.community) ~= nil then
		local t_1 = {}
		
		for i, v in self.community do
			t_1[i] = v:jsonEncode()
		end
		t.community = t_1
	end
	if self.community_user_membership ~= nil and next(self.community_user_membership) ~= nil then
		local t_1 = {}
		
		for i, v in self.community_user_membership do
			t_1[i] = v:jsonEncode()
		end
		t.communityUserMembership = t_1
	end
	if self.friend_recommendation ~= nil and next(self.friend_recommendation) ~= nil then
		local t_1 = {}
		
		for i, v in self.friend_recommendation do
			t_1[i] = v:jsonEncode()
		end
		t.friendRecommendation = t_1
	end
	if self.universe_private_server ~= nil and next(self.universe_private_server) ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_private_server do
			t_1[i] = v:jsonEncode()
		end
		t.universePrivateServer = t_1
	end
	if self.notification_badge ~= nil and next(self.notification_badge) ~= nil then
		local t_1 = {}
		
		for i, v in self.notification_badge do
			t_1[i] = v:jsonEncode()
		end
		t.notificationBadge = t_1
	end
	if self.collectible_item ~= nil and next(self.collectible_item) ~= nil then
		local t_1 = {}
		
		for i, v in self.collectible_item do
			t_1[i] = v:jsonEncode()
		end
		t.collectibleItem = t_1
	end
	if self.leaderboard_stats ~= nil and next(self.leaderboard_stats) ~= nil then
		local t_1 = {}
		
		for i, v in self.leaderboard_stats do
			t_1[i] = v:jsonEncode()
		end
		t.leaderboardStats = t_1
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), badgeDataModule (ref), universeDataModule (ref), creatorDataModule (ref), eventDataModule (ref), songDataModule (ref), gamePassDataModule (ref), mediaAssetDataModule (ref), socialLinkDataModule (ref), gameDeveloperProductDataModule (ref), gameSubscriptionDataModule (ref), marketplaceCatalogCategoryDataModule (ref), marketplaceAssetDataModule (ref), marketplaceBundleDataModule (ref), marketplaceLookDataModule (ref), catalogSortDataModule (ref), ageRecommendationDataModule (ref), universeUserFollowDataModule (ref), universeUserVoteDataModule (ref), userProfileDataModule (ref), universeUserFavoriteDataModule (ref), playabilityDataModule (ref), universeUserFollowLimitDataModule (ref), universeUserVoteFeedbackMetadataDataModule (ref), momentDataModule (ref), communityDataModule (ref), communityUserMembershipDataModule (ref), friendRecommendationDataModule (ref), universePrivateServerDataModule (ref), notificationBadgeDataModule (ref), collectibleItemDataModule (ref), leaderboardStatsDataModule (ref)
	local var296 = t_1.new()
	
	if self.badge ~= nil then
		local t = {}
		
		for i, v in self.badge do
			t[i] = badgeDataModule.BadgeData.jsonDecode(v)
		end
		var296.badge = t
	end
	if self.universe ~= nil then
		local t = {}
		
		for i, v in self.universe do
			t[i] = universeDataModule.UniverseData.jsonDecode(v)
		end
		var296.universe = t
	end
	if self.creator ~= nil then
		local t = {}
		
		for i, v in self.creator do
			t[i] = creatorDataModule.CreatorData.jsonDecode(v)
		end
		var296.creator = t
	end
	if self.event ~= nil then
		local t = {}
		
		for i, v in self.event do
			t[i] = eventDataModule.EventData.jsonDecode(v)
		end
		var296.event = t
	end
	if self.song ~= nil then
		local t = {}
		
		for i, v in self.song do
			t[i] = songDataModule.SongData.jsonDecode(v)
		end
		var296.song = t
	end
	if self.game_pass ~= nil then
		local t = {}
		
		for i, v in self.game_pass do
			t[i] = gamePassDataModule.GamePassData.jsonDecode(v)
		end
		var296.game_pass = t
	end
	if self.gamePass ~= nil then
		local t = {}
		
		for i, v in self.gamePass do
			t[i] = gamePassDataModule.GamePassData.jsonDecode(v)
		end
		var296.game_pass = t
	end
	if self.media_asset ~= nil then
		local t = {}
		
		for i, v in self.media_asset do
			t[i] = mediaAssetDataModule.MediaAssetData.jsonDecode(v)
		end
		var296.media_asset = t
	end
	if self.mediaAsset ~= nil then
		local t = {}
		
		for i, v in self.mediaAsset do
			t[i] = mediaAssetDataModule.MediaAssetData.jsonDecode(v)
		end
		var296.media_asset = t
	end
	if self.social_link ~= nil then
		local t = {}
		
		for i, v in self.social_link do
			t[i] = socialLinkDataModule.SocialLinkData.jsonDecode(v)
		end
		var296.social_link = t
	end
	if self.socialLink ~= nil then
		local t = {}
		
		for i, v in self.socialLink do
			t[i] = socialLinkDataModule.SocialLinkData.jsonDecode(v)
		end
		var296.social_link = t
	end
	if self.game_developer_product ~= nil then
		local t = {}
		
		for i, v in self.game_developer_product do
			t[i] = gameDeveloperProductDataModule.GameDeveloperProductData.jsonDecode(v)
		end
		var296.game_developer_product = t
	end
	if self.gameDeveloperProduct ~= nil then
		local t = {}
		
		for i, v in self.gameDeveloperProduct do
			t[i] = gameDeveloperProductDataModule.GameDeveloperProductData.jsonDecode(v)
		end
		var296.game_developer_product = t
	end
	if self.game_subscription ~= nil then
		local t = {}
		
		for i, v in self.game_subscription do
			t[i] = gameSubscriptionDataModule.GameSubscriptionData.jsonDecode(v)
		end
		var296.game_subscription = t
	end
	if self.gameSubscription ~= nil then
		local t = {}
		
		for i, v in self.gameSubscription do
			t[i] = gameSubscriptionDataModule.GameSubscriptionData.jsonDecode(v)
		end
		var296.game_subscription = t
	end
	if self.marketplace_catalog_category ~= nil then
		local t = {}
		
		for i, v in self.marketplace_catalog_category do
			t[i] = marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.jsonDecode(v)
		end
		var296.marketplace_catalog_category = t
	end
	if self.marketplaceCatalogCategory ~= nil then
		local t = {}
		
		for i, v in self.marketplaceCatalogCategory do
			t[i] = marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.jsonDecode(v)
		end
		var296.marketplace_catalog_category = t
	end
	if self.marketplace_asset ~= nil then
		local t = {}
		
		for i, v in self.marketplace_asset do
			t[i] = marketplaceAssetDataModule.MarketplaceAssetData.jsonDecode(v)
		end
		var296.marketplace_asset = t
	end
	if self.marketplaceAsset ~= nil then
		local t = {}
		
		for i, v in self.marketplaceAsset do
			t[i] = marketplaceAssetDataModule.MarketplaceAssetData.jsonDecode(v)
		end
		var296.marketplace_asset = t
	end
	if self.marketplace_bundle ~= nil then
		local t = {}
		
		for i, v in self.marketplace_bundle do
			t[i] = marketplaceBundleDataModule.MarketplaceBundleData.jsonDecode(v)
		end
		var296.marketplace_bundle = t
	end
	if self.marketplaceBundle ~= nil then
		local t = {}
		
		for i, v in self.marketplaceBundle do
			t[i] = marketplaceBundleDataModule.MarketplaceBundleData.jsonDecode(v)
		end
		var296.marketplace_bundle = t
	end
	if self.marketplace_look ~= nil then
		local t = {}
		
		for i, v in self.marketplace_look do
			t[i] = marketplaceLookDataModule.MarketplaceLookData.jsonDecode(v)
		end
		var296.marketplace_look = t
	end
	if self.marketplaceLook ~= nil then
		local t = {}
		
		for i, v in self.marketplaceLook do
			t[i] = marketplaceLookDataModule.MarketplaceLookData.jsonDecode(v)
		end
		var296.marketplace_look = t
	end
	if self.catalog_sort ~= nil then
		local t = {}
		
		for i, v in self.catalog_sort do
			t[i] = catalogSortDataModule.CatalogSortData.jsonDecode(v)
		end
		var296.catalog_sort = t
	end
	if self.catalogSort ~= nil then
		local t = {}
		
		for i, v in self.catalogSort do
			t[i] = catalogSortDataModule.CatalogSortData.jsonDecode(v)
		end
		var296.catalog_sort = t
	end
	if self.age_recommendation ~= nil then
		local t = {}
		
		for i, v in self.age_recommendation do
			t[i] = ageRecommendationDataModule.AgeRecommendationData.jsonDecode(v)
		end
		var296.age_recommendation = t
	end
	if self.ageRecommendation ~= nil then
		local t = {}
		
		for i, v in self.ageRecommendation do
			t[i] = ageRecommendationDataModule.AgeRecommendationData.jsonDecode(v)
		end
		var296.age_recommendation = t
	end
	if self.universe_user_follow ~= nil then
		local t = {}
		
		for i, v in self.universe_user_follow do
			t[i] = universeUserFollowDataModule.UniverseUserFollowData.jsonDecode(v)
		end
		var296.universe_user_follow = t
	end
	if self.universeUserFollow ~= nil then
		local t = {}
		
		for i, v in self.universeUserFollow do
			t[i] = universeUserFollowDataModule.UniverseUserFollowData.jsonDecode(v)
		end
		var296.universe_user_follow = t
	end
	if self.universe_user_vote ~= nil then
		local t = {}
		
		for i, v in self.universe_user_vote do
			t[i] = universeUserVoteDataModule.UniverseUserVoteData.jsonDecode(v)
		end
		var296.universe_user_vote = t
	end
	if self.universeUserVote ~= nil then
		local t = {}
		
		for i, v in self.universeUserVote do
			t[i] = universeUserVoteDataModule.UniverseUserVoteData.jsonDecode(v)
		end
		var296.universe_user_vote = t
	end
	if self.user_profile ~= nil then
		local t = {}
		
		for i, v in self.user_profile do
			t[i] = userProfileDataModule.UserProfileData.jsonDecode(v)
		end
		var296.user_profile = t
	end
	if self.userProfile ~= nil then
		local t = {}
		
		for i, v in self.userProfile do
			t[i] = userProfileDataModule.UserProfileData.jsonDecode(v)
		end
		var296.user_profile = t
	end
	if self.universe_user_favorite ~= nil then
		local t = {}
		
		for i, v in self.universe_user_favorite do
			t[i] = universeUserFavoriteDataModule.UniverseUserFavoriteData.jsonDecode(v)
		end
		var296.universe_user_favorite = t
	end
	if self.universeUserFavorite ~= nil then
		local t = {}
		
		for i, v in self.universeUserFavorite do
			t[i] = universeUserFavoriteDataModule.UniverseUserFavoriteData.jsonDecode(v)
		end
		var296.universe_user_favorite = t
	end
	if self.playability ~= nil then
		local t = {}
		
		for i, v in self.playability do
			t[i] = playabilityDataModule.PlayabilityData.jsonDecode(v)
		end
		var296.playability = t
	end
	if self.universe_user_follow_limit ~= nil then
		local t = {}
		
		for i, v in self.universe_user_follow_limit do
			t[i] = universeUserFollowLimitDataModule.UniverseUserFollowLimitData.jsonDecode(v)
		end
		var296.universe_user_follow_limit = t
	end
	if self.universeUserFollowLimit ~= nil then
		local t = {}
		
		for i, v in self.universeUserFollowLimit do
			t[i] = universeUserFollowLimitDataModule.UniverseUserFollowLimitData.jsonDecode(v)
		end
		var296.universe_user_follow_limit = t
	end
	if self.universe_user_vote_feedback_metadata ~= nil then
		local t = {}
		
		for i, v in self.universe_user_vote_feedback_metadata do
			t[i] = universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.jsonDecode(v)
		end
		var296.universe_user_vote_feedback_metadata = t
	end
	if self.universeUserVoteFeedbackMetadata ~= nil then
		local t = {}
		
		for i, v in self.universeUserVoteFeedbackMetadata do
			t[i] = universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.jsonDecode(v)
		end
		var296.universe_user_vote_feedback_metadata = t
	end
	if self.moment ~= nil then
		local t = {}
		
		for i, v in self.moment do
			t[i] = momentDataModule.MomentData.jsonDecode(v)
		end
		var296.moment = t
	end
	if self.community ~= nil then
		local t = {}
		
		for i, v in self.community do
			t[i] = communityDataModule.CommunityData.jsonDecode(v)
		end
		var296.community = t
	end
	if self.community_user_membership ~= nil then
		local t = {}
		
		for i, v in self.community_user_membership do
			t[i] = communityUserMembershipDataModule.CommunityUserMembershipData.jsonDecode(v)
		end
		var296.community_user_membership = t
	end
	if self.communityUserMembership ~= nil then
		local t = {}
		
		for i, v in self.communityUserMembership do
			t[i] = communityUserMembershipDataModule.CommunityUserMembershipData.jsonDecode(v)
		end
		var296.community_user_membership = t
	end
	if self.friend_recommendation ~= nil then
		local t = {}
		
		for i, v in self.friend_recommendation do
			t[i] = friendRecommendationDataModule.FriendRecommendationData.jsonDecode(v)
		end
		var296.friend_recommendation = t
	end
	if self.friendRecommendation ~= nil then
		local t = {}
		
		for i, v in self.friendRecommendation do
			t[i] = friendRecommendationDataModule.FriendRecommendationData.jsonDecode(v)
		end
		var296.friend_recommendation = t
	end
	if self.universe_private_server ~= nil then
		local t = {}
		
		for i, v in self.universe_private_server do
			t[i] = universePrivateServerDataModule.UniversePrivateServerData.jsonDecode(v)
		end
		var296.universe_private_server = t
	end
	if self.universePrivateServer ~= nil then
		local t = {}
		
		for i, v in self.universePrivateServer do
			t[i] = universePrivateServerDataModule.UniversePrivateServerData.jsonDecode(v)
		end
		var296.universe_private_server = t
	end
	if self.notification_badge ~= nil then
		local t = {}
		
		for i, v in self.notification_badge do
			t[i] = notificationBadgeDataModule.NotificationBadgeData.jsonDecode(v)
		end
		var296.notification_badge = t
	end
	if self.notificationBadge ~= nil then
		local t = {}
		
		for i, v in self.notificationBadge do
			t[i] = notificationBadgeDataModule.NotificationBadgeData.jsonDecode(v)
		end
		var296.notification_badge = t
	end
	if self.collectible_item ~= nil then
		local t = {}
		
		for i, v in self.collectible_item do
			t[i] = collectibleItemDataModule.CollectibleItemData.jsonDecode(v)
		end
		var296.collectible_item = t
	end
	if self.collectibleItem ~= nil then
		local t = {}
		
		for i, v in self.collectibleItem do
			t[i] = collectibleItemDataModule.CollectibleItemData.jsonDecode(v)
		end
		var296.collectible_item = t
	end
	if self.leaderboard_stats ~= nil then
		local t = {}
		
		for i, v in self.leaderboard_stats do
			t[i] = leaderboardStatsDataModule.LeaderboardStatsData.jsonDecode(v)
		end
		var296.leaderboard_stats = t
	end
	if self.leaderboardStats ~= nil then
		local t = {}
		
		for i, v in self.leaderboardStats do
			t[i] = leaderboardStatsDataModule.LeaderboardStatsData.jsonDecode(v)
		end
		var296.leaderboard_stats = t
	end
	return var296
end

t_1.descriptor = {
	name = "HydrationContent",
	fullName = "roblox.apppageplatform.shared.v1beta1.HydrationContent"
}
t.HydrationContent = t_1
typeRegistryModule.default:register(t.HydrationContent)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		key = if p2 == nil or p2.key == nil then "" else p2.key,
		value = if p2 == nil or p2.value == nil then nil else p2.value
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var297 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var298, var299 = protoModule.writeTag(buff, var297, 1, protoModule.wireTypes.lengthDelimited)
		var298, var484 = protoModule.writeString(var298, var299, self.key)
		buff = var298
		var297 = var299
	end
	if self.value ~= nil then
		local var300 = self.value:encode()
		local var301, var302 = protoModule.writeTag(buff, var297, 2, protoModule.wireTypes.lengthDelimited)
		var301, var487 = protoModule.writeBuffer(var301, var302, var300, buffer.len(var300))
		buff = var301
		var297 = var302
	end
	local buff_1 = buffer.create(var297)
	buffer.copy(buff_1, 0, buff, 0, var297)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), badgeDataModule (ref)
	local var297 = t_2.new()
	local var298 = 0
	while var298 < buffer.len(p2) do
		local _ = nil
		local var299 = nil
		local var300, var301, var302 = protoModule.readTag(p2, var298)
		local var303 = var300
		var299 = var301
		var298 = var302
		
		if var299 == protoModule.wireTypes.varint then
			local _ = nil
			local var304, var305 = protoModule.readVarInt(p2, var298)
			local _ = var304
			var298 = var305
			continue
		end
		if var299 == protoModule.wireTypes.lengthDelimited then
			if var303 == 1 then
				local _ = nil
				local var306, var307 = protoModule.readBuffer(p2, var298)
				var298 = var307
				var297.key = buffer.tostring(var306)
			elseif var303 == 2 then
				local _ = nil
				local var308, var309 = protoModule.readBuffer(p2, var298)
				var298 = var309
				var297.value = badgeDataModule.BadgeData.decode(var308)
			else
				local _ = nil
				local var310, var311 = protoModule.readVarInt(p2, var298)
				var298 = var311 + var310
			end
		elseif var299 == protoModule.wireTypes.i32 then
			local _ = nil
			local var312, var313 = protoModule.readFixed32(p2, var298)
			local _ = var312
			var298 = var313
		elseif var299 == protoModule.wireTypes.i64 then
			local _ = nil
			local var314, var315 = protoModule.readFixed64(p2, var298)
			local _ = var314
			var298 = var315
		else
			error("Unsupported wire type: " .. var491)
		end
	end
	return var297
end

function t_2:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), badgeDataModule (ref)
	local var316 = t_2.new()
	
	if self.key ~= nil then
		var316.key = self.key
	end
	if self.value ~= nil then
		var316.value = badgeDataModule.BadgeData.jsonDecode(self.value)
	end
	return var316
end

t_2.descriptor = {
	name = "HydrationContent_BadgeEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeEntry"
}
t.HydrationContent_BadgeEntry = t_2
typeRegistryModule.default:register(t.HydrationContent_BadgeEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		key = if p3 == nil or p3.key == nil then "" else p3.key,
		value = if p3 == nil or p3.value == nil then nil else p3.value
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var316 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var317, var318 = protoModule.writeTag(buff, var316, 1, protoModule.wireTypes.lengthDelimited)
		var317, var513 = protoModule.writeString(var317, var318, self.key)
		buff = var317
		var316 = var318
	end
	if self.value ~= nil then
		local var319 = self.value:encode()
		local var320, var321 = protoModule.writeTag(buff, var316, 2, protoModule.wireTypes.lengthDelimited)
		var320, var516 = protoModule.writeBuffer(var320, var321, var319, buffer.len(var319))
		buff = var320
		var316 = var321
	end
	local buff_1 = buffer.create(var316)
	buffer.copy(buff_1, 0, buff, 0, var316)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), universeDataModule (ref)
	local var316 = t_3.new()
	local var317 = 0
	while var317 < buffer.len(p3) do
		local _ = nil
		local var318 = nil
		local var319, var320, var321 = protoModule.readTag(p3, var317)
		local var322 = var319
		var318 = var320
		var317 = var321
		
		if var318 == protoModule.wireTypes.varint then
			local _ = nil
			local var323, var324 = protoModule.readVarInt(p3, var317)
			local _ = var323
			var317 = var324
			continue
		end
		if var318 == protoModule.wireTypes.lengthDelimited then
			if var322 == 1 then
				local _ = nil
				local var325, var326 = protoModule.readBuffer(p3, var317)
				var317 = var326
				var316.key = buffer.tostring(var325)
			elseif var322 == 2 then
				local _ = nil
				local var327, var328 = protoModule.readBuffer(p3, var317)
				var317 = var328
				var316.value = universeDataModule.UniverseData.decode(var327)
			else
				local _ = nil
				local var329, var330 = protoModule.readVarInt(p3, var317)
				var317 = var330 + var329
			end
		elseif var318 == protoModule.wireTypes.i32 then
			local _ = nil
			local var331, var332 = protoModule.readFixed32(p3, var317)
			local _ = var331
			var317 = var332
		elseif var318 == protoModule.wireTypes.i64 then
			local _ = nil
			local var333, var334 = protoModule.readFixed64(p3, var317)
			local _ = var333
			var317 = var334
		else
			error("Unsupported wire type: " .. var520)
		end
	end
	return var316
end

function t_3:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), universeDataModule (ref)
	local var335 = t_3.new()
	
	if self.key ~= nil then
		var335.key = self.key
	end
	if self.value ~= nil then
		var335.value = universeDataModule.UniverseData.jsonDecode(self.value)
	end
	return var335
end

t_3.descriptor = {
	name = "HydrationContent_UniverseEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseEntry"
}
t.HydrationContent_UniverseEntry = t_3
typeRegistryModule.default:register(t.HydrationContent_UniverseEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		key = if p4 == nil or p4.key == nil then "" else p4.key,
		value = if p4 == nil or p4.value == nil then nil else p4.value
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var335 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var336, var337 = protoModule.writeTag(buff, var335, 1, protoModule.wireTypes.lengthDelimited)
		var336, var542 = protoModule.writeString(var336, var337, self.key)
		buff = var336
		var335 = var337
	end
	if self.value ~= nil then
		local var338 = self.value:encode()
		local var339, var340 = protoModule.writeTag(buff, var335, 2, protoModule.wireTypes.lengthDelimited)
		var339, var545 = protoModule.writeBuffer(var339, var340, var338, buffer.len(var338))
		buff = var339
		var335 = var340
	end
	local buff_1 = buffer.create(var335)
	buffer.copy(buff_1, 0, buff, 0, var335)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), creatorDataModule (ref)
	local var335 = t_4.new()
	local var336 = 0
	while var336 < buffer.len(p4) do
		local _ = nil
		local var337 = nil
		local var338, var339, var340 = protoModule.readTag(p4, var336)
		local var341 = var338
		var337 = var339
		var336 = var340
		
		if var337 == protoModule.wireTypes.varint then
			local _ = nil
			local var342, var343 = protoModule.readVarInt(p4, var336)
			local _ = var342
			var336 = var343
			continue
		end
		if var337 == protoModule.wireTypes.lengthDelimited then
			if var341 == 1 then
				local _ = nil
				local var344, var345 = protoModule.readBuffer(p4, var336)
				var336 = var345
				var335.key = buffer.tostring(var344)
			elseif var341 == 2 then
				local _ = nil
				local var346, var347 = protoModule.readBuffer(p4, var336)
				var336 = var347
				var335.value = creatorDataModule.CreatorData.decode(var346)
			else
				local _ = nil
				local var348, var349 = protoModule.readVarInt(p4, var336)
				var336 = var349 + var348
			end
		elseif var337 == protoModule.wireTypes.i32 then
			local _ = nil
			local var350, var351 = protoModule.readFixed32(p4, var336)
			local _ = var350
			var336 = var351
		elseif var337 == protoModule.wireTypes.i64 then
			local _ = nil
			local var352, var353 = protoModule.readFixed64(p4, var336)
			local _ = var352
			var336 = var353
		else
			error("Unsupported wire type: " .. var549)
		end
	end
	return var335
end

function t_4:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref), creatorDataModule (ref)
	local var354 = t_4.new()
	
	if self.key ~= nil then
		var354.key = self.key
	end
	if self.value ~= nil then
		var354.value = creatorDataModule.CreatorData.jsonDecode(self.value)
	end
	return var354
end

t_4.descriptor = {
	name = "HydrationContent_CreatorEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.CreatorEntry"
}
t.HydrationContent_CreatorEntry = t_4
typeRegistryModule.default:register(t.HydrationContent_CreatorEntry)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p5)
	-- upvalues: t_5 (ref)
	return setmetatable({
		key = if p5 == nil or p5.key == nil then "" else p5.key,
		value = if p5 == nil or p5.value == nil then nil else p5.value
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var354 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var355, var356 = protoModule.writeTag(buff, var354, 1, protoModule.wireTypes.lengthDelimited)
		var355, var571 = protoModule.writeString(var355, var356, self.key)
		buff = var355
		var354 = var356
	end
	if self.value ~= nil then
		local var357 = self.value:encode()
		local var358, var359 = protoModule.writeTag(buff, var354, 2, protoModule.wireTypes.lengthDelimited)
		var358, var574 = protoModule.writeBuffer(var358, var359, var357, buffer.len(var357))
		buff = var358
		var354 = var359
	end
	local buff_1 = buffer.create(var354)
	buffer.copy(buff_1, 0, buff, 0, var354)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref), eventDataModule (ref)
	local var354 = t_5.new()
	local var355 = 0
	while var355 < buffer.len(p5) do
		local _ = nil
		local var356 = nil
		local var357, var358, var359 = protoModule.readTag(p5, var355)
		local var360 = var357
		var356 = var358
		var355 = var359
		
		if var356 == protoModule.wireTypes.varint then
			local _ = nil
			local var361, var362 = protoModule.readVarInt(p5, var355)
			local _ = var361
			var355 = var362
			continue
		end
		if var356 == protoModule.wireTypes.lengthDelimited then
			if var360 == 1 then
				local _ = nil
				local var363, var364 = protoModule.readBuffer(p5, var355)
				var355 = var364
				var354.key = buffer.tostring(var363)
			elseif var360 == 2 then
				local _ = nil
				local var365, var366 = protoModule.readBuffer(p5, var355)
				var355 = var366
				var354.value = eventDataModule.EventData.decode(var365)
			else
				local _ = nil
				local var367, var368 = protoModule.readVarInt(p5, var355)
				var355 = var368 + var367
			end
		elseif var356 == protoModule.wireTypes.i32 then
			local _ = nil
			local var369, var370 = protoModule.readFixed32(p5, var355)
			local _ = var369
			var355 = var370
		elseif var356 == protoModule.wireTypes.i64 then
			local _ = nil
			local var371, var372 = protoModule.readFixed64(p5, var355)
			local _ = var371
			var355 = var372
		else
			error("Unsupported wire type: " .. var578)
		end
	end
	return var354
end

function t_5:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_5:jsonDecode()
	-- upvalues: t_5 (ref), eventDataModule (ref)
	local var373 = t_5.new()
	
	if self.key ~= nil then
		var373.key = self.key
	end
	if self.value ~= nil then
		var373.value = eventDataModule.EventData.jsonDecode(self.value)
	end
	return var373
end

t_5.descriptor = {
	name = "HydrationContent_EventEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventEntry"
}
t.HydrationContent_EventEntry = t_5
typeRegistryModule.default:register(t.HydrationContent_EventEntry)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		key = if p6 == nil or p6.key == nil then "" else p6.key,
		value = if p6 == nil or p6.value == nil then nil else p6.value
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var373 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var374, var375 = protoModule.writeTag(buff, var373, 1, protoModule.wireTypes.lengthDelimited)
		var374, var600 = protoModule.writeString(var374, var375, self.key)
		buff = var374
		var373 = var375
	end
	if self.value ~= nil then
		local var376 = self.value:encode()
		local var377, var378 = protoModule.writeTag(buff, var373, 2, protoModule.wireTypes.lengthDelimited)
		var377, var603 = protoModule.writeBuffer(var377, var378, var376, buffer.len(var376))
		buff = var377
		var373 = var378
	end
	local buff_1 = buffer.create(var373)
	buffer.copy(buff_1, 0, buff, 0, var373)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), songDataModule (ref)
	local var373 = t_6.new()
	local var374 = 0
	while var374 < buffer.len(p6) do
		local _ = nil
		local var375 = nil
		local var376, var377, var378 = protoModule.readTag(p6, var374)
		local var379 = var376
		var375 = var377
		var374 = var378
		
		if var375 == protoModule.wireTypes.varint then
			local _ = nil
			local var380, var381 = protoModule.readVarInt(p6, var374)
			local _ = var380
			var374 = var381
			continue
		end
		if var375 == protoModule.wireTypes.lengthDelimited then
			if var379 == 1 then
				local _ = nil
				local var382, var383 = protoModule.readBuffer(p6, var374)
				var374 = var383
				var373.key = buffer.tostring(var382)
			elseif var379 == 2 then
				local _ = nil
				local var384, var385 = protoModule.readBuffer(p6, var374)
				var374 = var385
				var373.value = songDataModule.SongData.decode(var384)
			else
				local _ = nil
				local var386, var387 = protoModule.readVarInt(p6, var374)
				var374 = var387 + var386
			end
		elseif var375 == protoModule.wireTypes.i32 then
			local _ = nil
			local var388, var389 = protoModule.readFixed32(p6, var374)
			local _ = var388
			var374 = var389
		elseif var375 == protoModule.wireTypes.i64 then
			local _ = nil
			local var390, var391 = protoModule.readFixed64(p6, var374)
			local _ = var390
			var374 = var391
		else
			error("Unsupported wire type: " .. var607)
		end
	end
	return var373
end

function t_6:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_6:jsonDecode()
	-- upvalues: t_6 (ref), songDataModule (ref)
	local var392 = t_6.new()
	
	if self.key ~= nil then
		var392.key = self.key
	end
	if self.value ~= nil then
		var392.value = songDataModule.SongData.jsonDecode(self.value)
	end
	return var392
end

t_6.descriptor = {
	name = "HydrationContent_SongEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongEntry"
}
t.HydrationContent_SongEntry = t_6
typeRegistryModule.default:register(t.HydrationContent_SongEntry)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p7)
	-- upvalues: t_7 (ref)
	return setmetatable({
		key = if p7 == nil or p7.key == nil then "" else p7.key,
		value = if p7 == nil or p7.value == nil then nil else p7.value
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var392 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var393, var394 = protoModule.writeTag(buff, var392, 1, protoModule.wireTypes.lengthDelimited)
		var393, var629 = protoModule.writeString(var393, var394, self.key)
		buff = var393
		var392 = var394
	end
	if self.value ~= nil then
		local var395 = self.value:encode()
		local var396, var397 = protoModule.writeTag(buff, var392, 2, protoModule.wireTypes.lengthDelimited)
		var396, var632 = protoModule.writeBuffer(var396, var397, var395, buffer.len(var395))
		buff = var396
		var392 = var397
	end
	local buff_1 = buffer.create(var392)
	buffer.copy(buff_1, 0, buff, 0, var392)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref), gamePassDataModule (ref)
	local var392 = t_7.new()
	local var393 = 0
	while var393 < buffer.len(p7) do
		local _ = nil
		local var394 = nil
		local var395, var396, var397 = protoModule.readTag(p7, var393)
		local var398 = var395
		var394 = var396
		var393 = var397
		
		if var394 == protoModule.wireTypes.varint then
			local _ = nil
			local var399, var400 = protoModule.readVarInt(p7, var393)
			local _ = var399
			var393 = var400
			continue
		end
		if var394 == protoModule.wireTypes.lengthDelimited then
			if var398 == 1 then
				local _ = nil
				local var401, var402 = protoModule.readBuffer(p7, var393)
				var393 = var402
				var392.key = buffer.tostring(var401)
			elseif var398 == 2 then
				local _ = nil
				local var403, var404 = protoModule.readBuffer(p7, var393)
				var393 = var404
				var392.value = gamePassDataModule.GamePassData.decode(var403)
			else
				local _ = nil
				local var405, var406 = protoModule.readVarInt(p7, var393)
				var393 = var406 + var405
			end
		elseif var394 == protoModule.wireTypes.i32 then
			local _ = nil
			local var407, var408 = protoModule.readFixed32(p7, var393)
			local _ = var407
			var393 = var408
		elseif var394 == protoModule.wireTypes.i64 then
			local _ = nil
			local var409, var410 = protoModule.readFixed64(p7, var393)
			local _ = var409
			var393 = var410
		else
			error("Unsupported wire type: " .. var636)
		end
	end
	return var392
end

function t_7:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_7:jsonDecode()
	-- upvalues: t_7 (ref), gamePassDataModule (ref)
	local var411 = t_7.new()
	
	if self.key ~= nil then
		var411.key = self.key
	end
	if self.value ~= nil then
		var411.value = gamePassDataModule.GamePassData.jsonDecode(self.value)
	end
	return var411
end

t_7.descriptor = {
	name = "HydrationContent_GamePassEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassEntry"
}
t.HydrationContent_GamePassEntry = t_7
typeRegistryModule.default:register(t.HydrationContent_GamePassEntry)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p8)
	-- upvalues: t_8 (ref)
	return setmetatable({
		key = if p8 == nil or p8.key == nil then "" else p8.key,
		value = if p8 == nil or p8.value == nil then nil else p8.value
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var411 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var412, var413 = protoModule.writeTag(buff, var411, 1, protoModule.wireTypes.lengthDelimited)
		var412, var658 = protoModule.writeString(var412, var413, self.key)
		buff = var412
		var411 = var413
	end
	if self.value ~= nil then
		local var414 = self.value:encode()
		local var415, var416 = protoModule.writeTag(buff, var411, 2, protoModule.wireTypes.lengthDelimited)
		var415, var661 = protoModule.writeBuffer(var415, var416, var414, buffer.len(var414))
		buff = var415
		var411 = var416
	end
	local buff_1 = buffer.create(var411)
	buffer.copy(buff_1, 0, buff, 0, var411)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), mediaAssetDataModule (ref)
	local var411 = t_8.new()
	local var412 = 0
	while var412 < buffer.len(p8) do
		local _ = nil
		local var413 = nil
		local var414, var415, var416 = protoModule.readTag(p8, var412)
		local var417 = var414
		var413 = var415
		var412 = var416
		
		if var413 == protoModule.wireTypes.varint then
			local _ = nil
			local var418, var419 = protoModule.readVarInt(p8, var412)
			local _ = var418
			var412 = var419
			continue
		end
		if var413 == protoModule.wireTypes.lengthDelimited then
			if var417 == 1 then
				local _ = nil
				local var420, var421 = protoModule.readBuffer(p8, var412)
				var412 = var421
				var411.key = buffer.tostring(var420)
			elseif var417 == 2 then
				local _ = nil
				local var422, var423 = protoModule.readBuffer(p8, var412)
				var412 = var423
				var411.value = mediaAssetDataModule.MediaAssetData.decode(var422)
			else
				local _ = nil
				local var424, var425 = protoModule.readVarInt(p8, var412)
				var412 = var425 + var424
			end
		elseif var413 == protoModule.wireTypes.i32 then
			local _ = nil
			local var426, var427 = protoModule.readFixed32(p8, var412)
			local _ = var426
			var412 = var427
		elseif var413 == protoModule.wireTypes.i64 then
			local _ = nil
			local var428, var429 = protoModule.readFixed64(p8, var412)
			local _ = var428
			var412 = var429
		else
			error("Unsupported wire type: " .. var665)
		end
	end
	return var411
end

function t_8:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_8:jsonDecode()
	-- upvalues: t_8 (ref), mediaAssetDataModule (ref)
	local var430 = t_8.new()
	
	if self.key ~= nil then
		var430.key = self.key
	end
	if self.value ~= nil then
		var430.value = mediaAssetDataModule.MediaAssetData.jsonDecode(self.value)
	end
	return var430
end

t_8.descriptor = {
	name = "HydrationContent_MediaAssetEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MediaAssetEntry"
}
t.HydrationContent_MediaAssetEntry = t_8
typeRegistryModule.default:register(t.HydrationContent_MediaAssetEntry)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p9)
	-- upvalues: t_9 (ref)
	return setmetatable({
		key = if p9 == nil or p9.key == nil then "" else p9.key,
		value = if p9 == nil or p9.value == nil then nil else p9.value
	}, t_9)
end

function t_9:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var430 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var431, var432 = protoModule.writeTag(buff, var430, 1, protoModule.wireTypes.lengthDelimited)
		var431, var687 = protoModule.writeString(var431, var432, self.key)
		buff = var431
		var430 = var432
	end
	if self.value ~= nil then
		local var433 = self.value:encode()
		local var434, var435 = protoModule.writeTag(buff, var430, 2, protoModule.wireTypes.lengthDelimited)
		var434, var690 = protoModule.writeBuffer(var434, var435, var433, buffer.len(var433))
		buff = var434
		var430 = var435
	end
	local buff_1 = buffer.create(var430)
	buffer.copy(buff_1, 0, buff, 0, var430)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), socialLinkDataModule (ref)
	local var430 = t_9.new()
	local var431 = 0
	while var431 < buffer.len(p9) do
		local _ = nil
		local var432 = nil
		local var433, var434, var435 = protoModule.readTag(p9, var431)
		local var436 = var433
		var432 = var434
		var431 = var435
		
		if var432 == protoModule.wireTypes.varint then
			local _ = nil
			local var437, var438 = protoModule.readVarInt(p9, var431)
			local _ = var437
			var431 = var438
			continue
		end
		if var432 == protoModule.wireTypes.lengthDelimited then
			if var436 == 1 then
				local _ = nil
				local var439, var440 = protoModule.readBuffer(p9, var431)
				var431 = var440
				var430.key = buffer.tostring(var439)
			elseif var436 == 2 then
				local _ = nil
				local var441, var442 = protoModule.readBuffer(p9, var431)
				var431 = var442
				var430.value = socialLinkDataModule.SocialLinkData.decode(var441)
			else
				local _ = nil
				local var443, var444 = protoModule.readVarInt(p9, var431)
				var431 = var444 + var443
			end
		elseif var432 == protoModule.wireTypes.i32 then
			local _ = nil
			local var445, var446 = protoModule.readFixed32(p9, var431)
			local _ = var445
			var431 = var446
		elseif var432 == protoModule.wireTypes.i64 then
			local _ = nil
			local var447, var448 = protoModule.readFixed64(p9, var431)
			local _ = var447
			var431 = var448
		else
			error("Unsupported wire type: " .. var694)
		end
	end
	return var430
end

function t_9:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_9:jsonDecode()
	-- upvalues: t_9 (ref), socialLinkDataModule (ref)
	local var449 = t_9.new()
	
	if self.key ~= nil then
		var449.key = self.key
	end
	if self.value ~= nil then
		var449.value = socialLinkDataModule.SocialLinkData.jsonDecode(self.value)
	end
	return var449
end

t_9.descriptor = {
	name = "HydrationContent_SocialLinkEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkEntry"
}
t.HydrationContent_SocialLinkEntry = t_9
typeRegistryModule.default:register(t.HydrationContent_SocialLinkEntry)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p10)
	-- upvalues: t_10 (ref)
	return setmetatable({
		key = if p10 == nil or p10.key == nil then "" else p10.key,
		value = if p10 == nil or p10.value == nil then nil else p10.value
	}, t_10)
end

function t_10:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var449 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var450, var451 = protoModule.writeTag(buff, var449, 1, protoModule.wireTypes.lengthDelimited)
		var450, var716 = protoModule.writeString(var450, var451, self.key)
		buff = var450
		var449 = var451
	end
	if self.value ~= nil then
		local var452 = self.value:encode()
		local var453, var454 = protoModule.writeTag(buff, var449, 2, protoModule.wireTypes.lengthDelimited)
		var453, var719 = protoModule.writeBuffer(var453, var454, var452, buffer.len(var452))
		buff = var453
		var449 = var454
	end
	local buff_1 = buffer.create(var449)
	buffer.copy(buff_1, 0, buff, 0, var449)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref), gameDeveloperProductDataModule (ref)
	local var449 = t_10.new()
	local var450 = 0
	while var450 < buffer.len(p10) do
		local _ = nil
		local var451 = nil
		local var452, var453, var454 = protoModule.readTag(p10, var450)
		local var455 = var452
		var451 = var453
		var450 = var454
		
		if var451 == protoModule.wireTypes.varint then
			local _ = nil
			local var456, var457 = protoModule.readVarInt(p10, var450)
			local _ = var456
			var450 = var457
			continue
		end
		if var451 == protoModule.wireTypes.lengthDelimited then
			if var455 == 1 then
				local _ = nil
				local var458, var459 = protoModule.readBuffer(p10, var450)
				var450 = var459
				var449.key = buffer.tostring(var458)
			elseif var455 == 2 then
				local _ = nil
				local var460, var461 = protoModule.readBuffer(p10, var450)
				var450 = var461
				var449.value = gameDeveloperProductDataModule.GameDeveloperProductData.decode(var460)
			else
				local _ = nil
				local var462, var463 = protoModule.readVarInt(p10, var450)
				var450 = var463 + var462
			end
		elseif var451 == protoModule.wireTypes.i32 then
			local _ = nil
			local var464, var465 = protoModule.readFixed32(p10, var450)
			local _ = var464
			var450 = var465
		elseif var451 == protoModule.wireTypes.i64 then
			local _ = nil
			local var466, var467 = protoModule.readFixed64(p10, var450)
			local _ = var466
			var450 = var467
		else
			error("Unsupported wire type: " .. var723)
		end
	end
	return var449
end

function t_10:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_10:jsonDecode()
	-- upvalues: t_10 (ref), gameDeveloperProductDataModule (ref)
	local var468 = t_10.new()
	
	if self.key ~= nil then
		var468.key = self.key
	end
	if self.value ~= nil then
		var468.value = gameDeveloperProductDataModule.GameDeveloperProductData.jsonDecode(self.value)
	end
	return var468
end

t_10.descriptor = {
	name = "HydrationContent_GameDeveloperProductEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameDeveloperProductEntry"
}
t.HydrationContent_GameDeveloperProductEntry = t_10
typeRegistryModule.default:register(t.HydrationContent_GameDeveloperProductEntry)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p11)
	-- upvalues: t_11 (ref)
	return setmetatable({
		key = if p11 == nil or p11.key == nil then "" else p11.key,
		value = if p11 == nil or p11.value == nil then nil else p11.value
	}, t_11)
end

function t_11:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var468 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var469, var470 = protoModule.writeTag(buff, var468, 1, protoModule.wireTypes.lengthDelimited)
		var469, var745 = protoModule.writeString(var469, var470, self.key)
		buff = var469
		var468 = var470
	end
	if self.value ~= nil then
		local var471 = self.value:encode()
		local var472, var473 = protoModule.writeTag(buff, var468, 2, protoModule.wireTypes.lengthDelimited)
		var472, var748 = protoModule.writeBuffer(var472, var473, var471, buffer.len(var471))
		buff = var472
		var468 = var473
	end
	local buff_1 = buffer.create(var468)
	buffer.copy(buff_1, 0, buff, 0, var468)
	
	return buff_1
end

function t_11.decode(p11)
	-- upvalues: t_11 (ref), protoModule (ref), gameSubscriptionDataModule (ref)
	local var468 = t_11.new()
	local var469 = 0
	while var469 < buffer.len(p11) do
		local _ = nil
		local var470 = nil
		local var471, var472, var473 = protoModule.readTag(p11, var469)
		local var474 = var471
		var470 = var472
		var469 = var473
		
		if var470 == protoModule.wireTypes.varint then
			local _ = nil
			local var475, var476 = protoModule.readVarInt(p11, var469)
			local _ = var475
			var469 = var476
			continue
		end
		if var470 == protoModule.wireTypes.lengthDelimited then
			if var474 == 1 then
				local _ = nil
				local var477, var478 = protoModule.readBuffer(p11, var469)
				var469 = var478
				var468.key = buffer.tostring(var477)
			elseif var474 == 2 then
				local _ = nil
				local var479, var480 = protoModule.readBuffer(p11, var469)
				var469 = var480
				var468.value = gameSubscriptionDataModule.GameSubscriptionData.decode(var479)
			else
				local _ = nil
				local var481, var482 = protoModule.readVarInt(p11, var469)
				var469 = var482 + var481
			end
		elseif var470 == protoModule.wireTypes.i32 then
			local _ = nil
			local var483, var484 = protoModule.readFixed32(p11, var469)
			local _ = var483
			var469 = var484
		elseif var470 == protoModule.wireTypes.i64 then
			local _ = nil
			local var485, var486 = protoModule.readFixed64(p11, var469)
			local _ = var485
			var469 = var486
		else
			error("Unsupported wire type: " .. var752)
		end
	end
	return var468
end

function t_11:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_11:jsonDecode()
	-- upvalues: t_11 (ref), gameSubscriptionDataModule (ref)
	local var487 = t_11.new()
	
	if self.key ~= nil then
		var487.key = self.key
	end
	if self.value ~= nil then
		var487.value = gameSubscriptionDataModule.GameSubscriptionData.jsonDecode(self.value)
	end
	return var487
end

t_11.descriptor = {
	name = "HydrationContent_GameSubscriptionEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameSubscriptionEntry"
}
t.HydrationContent_GameSubscriptionEntry = t_11
typeRegistryModule.default:register(t.HydrationContent_GameSubscriptionEntry)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p12)
	-- upvalues: t_12 (ref)
	return setmetatable({
		key = if p12 == nil or p12.key == nil then "" else p12.key,
		value = if p12 == nil or p12.value == nil then nil else p12.value
	}, t_12)
end

function t_12:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var487 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var488, var489 = protoModule.writeTag(buff, var487, 1, protoModule.wireTypes.lengthDelimited)
		var488, var774 = protoModule.writeString(var488, var489, self.key)
		buff = var488
		var487 = var489
	end
	if self.value ~= nil then
		local var490 = self.value:encode()
		local var491, var492 = protoModule.writeTag(buff, var487, 2, protoModule.wireTypes.lengthDelimited)
		var491, var777 = protoModule.writeBuffer(var491, var492, var490, buffer.len(var490))
		buff = var491
		var487 = var492
	end
	local buff_1 = buffer.create(var487)
	buffer.copy(buff_1, 0, buff, 0, var487)
	
	return buff_1
end

function t_12.decode(p12)
	-- upvalues: t_12 (ref), protoModule (ref), marketplaceCatalogCategoryDataModule (ref)
	local var487 = t_12.new()
	local var488 = 0
	while var488 < buffer.len(p12) do
		local _ = nil
		local var489 = nil
		local var490, var491, var492 = protoModule.readTag(p12, var488)
		local var493 = var490
		var489 = var491
		var488 = var492
		
		if var489 == protoModule.wireTypes.varint then
			local _ = nil
			local var494, var495 = protoModule.readVarInt(p12, var488)
			local _ = var494
			var488 = var495
			continue
		end
		if var489 == protoModule.wireTypes.lengthDelimited then
			if var493 == 1 then
				local _ = nil
				local var496, var497 = protoModule.readBuffer(p12, var488)
				var488 = var497
				var487.key = buffer.tostring(var496)
			elseif var493 == 2 then
				local _ = nil
				local var498, var499 = protoModule.readBuffer(p12, var488)
				var488 = var499
				var487.value = marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.decode(var498)
			else
				local _ = nil
				local var500, var501 = protoModule.readVarInt(p12, var488)
				var488 = var501 + var500
			end
		elseif var489 == protoModule.wireTypes.i32 then
			local _ = nil
			local var502, var503 = protoModule.readFixed32(p12, var488)
			local _ = var502
			var488 = var503
		elseif var489 == protoModule.wireTypes.i64 then
			local _ = nil
			local var504, var505 = protoModule.readFixed64(p12, var488)
			local _ = var504
			var488 = var505
		else
			error("Unsupported wire type: " .. var781)
		end
	end
	return var487
end

function t_12:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_12:jsonDecode()
	-- upvalues: t_12 (ref), marketplaceCatalogCategoryDataModule (ref)
	local var506 = t_12.new()
	
	if self.key ~= nil then
		var506.key = self.key
	end
	if self.value ~= nil then
		var506.value = marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.jsonDecode(self.value)
	end
	return var506
end

t_12.descriptor = {
	name = "HydrationContent_MarketplaceCatalogCategoryEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryEntry"
}
t.HydrationContent_MarketplaceCatalogCategoryEntry = t_12
typeRegistryModule.default:register(t.HydrationContent_MarketplaceCatalogCategoryEntry)
local t_13 = {}
t_13.__index = t_13

function t_13.new(p13)
	-- upvalues: t_13 (ref)
	return setmetatable({
		key = if p13 == nil or p13.key == nil then "" else p13.key,
		value = if p13 == nil or p13.value == nil then nil else p13.value
	}, t_13)
end

function t_13:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var506 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var507, var508 = protoModule.writeTag(buff, var506, 1, protoModule.wireTypes.lengthDelimited)
		var507, var803 = protoModule.writeString(var507, var508, self.key)
		buff = var507
		var506 = var508
	end
	if self.value ~= nil then
		local var509 = self.value:encode()
		local var510, var511 = protoModule.writeTag(buff, var506, 2, protoModule.wireTypes.lengthDelimited)
		var510, var806 = protoModule.writeBuffer(var510, var511, var509, buffer.len(var509))
		buff = var510
		var506 = var511
	end
	local buff_1 = buffer.create(var506)
	buffer.copy(buff_1, 0, buff, 0, var506)
	
	return buff_1
end

function t_13.decode(p13)
	-- upvalues: t_13 (ref), protoModule (ref), marketplaceAssetDataModule (ref)
	local var506 = t_13.new()
	local var507 = 0
	while var507 < buffer.len(p13) do
		local _ = nil
		local var508 = nil
		local var509, var510, var511 = protoModule.readTag(p13, var507)
		local var512 = var509
		var508 = var510
		var507 = var511
		
		if var508 == protoModule.wireTypes.varint then
			local _ = nil
			local var513, var514 = protoModule.readVarInt(p13, var507)
			local _ = var513
			var507 = var514
			continue
		end
		if var508 == protoModule.wireTypes.lengthDelimited then
			if var512 == 1 then
				local _ = nil
				local var515, var516 = protoModule.readBuffer(p13, var507)
				var507 = var516
				var506.key = buffer.tostring(var515)
			elseif var512 == 2 then
				local _ = nil
				local var517, var518 = protoModule.readBuffer(p13, var507)
				var507 = var518
				var506.value = marketplaceAssetDataModule.MarketplaceAssetData.decode(var517)
			else
				local _ = nil
				local var519, var520 = protoModule.readVarInt(p13, var507)
				var507 = var520 + var519
			end
		elseif var508 == protoModule.wireTypes.i32 then
			local _ = nil
			local var521, var522 = protoModule.readFixed32(p13, var507)
			local _ = var521
			var507 = var522
		elseif var508 == protoModule.wireTypes.i64 then
			local _ = nil
			local var523, var524 = protoModule.readFixed64(p13, var507)
			local _ = var523
			var507 = var524
		else
			error("Unsupported wire type: " .. var810)
		end
	end
	return var506
end

function t_13:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_13:jsonDecode()
	-- upvalues: t_13 (ref), marketplaceAssetDataModule (ref)
	local var525 = t_13.new()
	
	if self.key ~= nil then
		var525.key = self.key
	end
	if self.value ~= nil then
		var525.value = marketplaceAssetDataModule.MarketplaceAssetData.jsonDecode(self.value)
	end
	return var525
end

t_13.descriptor = {
	name = "HydrationContent_MarketplaceAssetEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceAssetEntry"
}
t.HydrationContent_MarketplaceAssetEntry = t_13
typeRegistryModule.default:register(t.HydrationContent_MarketplaceAssetEntry)
local t_14 = {}
t_14.__index = t_14

function t_14.new(p14)
	-- upvalues: t_14 (ref)
	return setmetatable({
		key = if p14 == nil or p14.key == nil then "" else p14.key,
		value = if p14 == nil or p14.value == nil then nil else p14.value
	}, t_14)
end

function t_14:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var525 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var526, var527 = protoModule.writeTag(buff, var525, 1, protoModule.wireTypes.lengthDelimited)
		var526, var832 = protoModule.writeString(var526, var527, self.key)
		buff = var526
		var525 = var527
	end
	if self.value ~= nil then
		local var528 = self.value:encode()
		local var529, var530 = protoModule.writeTag(buff, var525, 2, protoModule.wireTypes.lengthDelimited)
		var529, var835 = protoModule.writeBuffer(var529, var530, var528, buffer.len(var528))
		buff = var529
		var525 = var530
	end
	local buff_1 = buffer.create(var525)
	buffer.copy(buff_1, 0, buff, 0, var525)
	
	return buff_1
end

function t_14.decode(p14)
	-- upvalues: t_14 (ref), protoModule (ref), marketplaceBundleDataModule (ref)
	local var525 = t_14.new()
	local var526 = 0
	while var526 < buffer.len(p14) do
		local _ = nil
		local var527 = nil
		local var528, var529, var530 = protoModule.readTag(p14, var526)
		local var531 = var528
		var527 = var529
		var526 = var530
		
		if var527 == protoModule.wireTypes.varint then
			local _ = nil
			local var532, var533 = protoModule.readVarInt(p14, var526)
			local _ = var532
			var526 = var533
			continue
		end
		if var527 == protoModule.wireTypes.lengthDelimited then
			if var531 == 1 then
				local _ = nil
				local var534, var535 = protoModule.readBuffer(p14, var526)
				var526 = var535
				var525.key = buffer.tostring(var534)
			elseif var531 == 2 then
				local _ = nil
				local var536, var537 = protoModule.readBuffer(p14, var526)
				var526 = var537
				var525.value = marketplaceBundleDataModule.MarketplaceBundleData.decode(var536)
			else
				local _ = nil
				local var538, var539 = protoModule.readVarInt(p14, var526)
				var526 = var539 + var538
			end
		elseif var527 == protoModule.wireTypes.i32 then
			local _ = nil
			local var540, var541 = protoModule.readFixed32(p14, var526)
			local _ = var540
			var526 = var541
		elseif var527 == protoModule.wireTypes.i64 then
			local _ = nil
			local var542, var543 = protoModule.readFixed64(p14, var526)
			local _ = var542
			var526 = var543
		else
			error("Unsupported wire type: " .. var839)
		end
	end
	return var525
end

function t_14:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_14:jsonDecode()
	-- upvalues: t_14 (ref), marketplaceBundleDataModule (ref)
	local var544 = t_14.new()
	
	if self.key ~= nil then
		var544.key = self.key
	end
	if self.value ~= nil then
		var544.value = marketplaceBundleDataModule.MarketplaceBundleData.jsonDecode(self.value)
	end
	return var544
end

t_14.descriptor = {
	name = "HydrationContent_MarketplaceBundleEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceBundleEntry"
}
t.HydrationContent_MarketplaceBundleEntry = t_14
typeRegistryModule.default:register(t.HydrationContent_MarketplaceBundleEntry)
local t_15 = {}
t_15.__index = t_15

function t_15.new(p15)
	-- upvalues: t_15 (ref)
	return setmetatable({
		key = if p15 == nil or p15.key == nil then "" else p15.key,
		value = if p15 == nil or p15.value == nil then nil else p15.value
	}, t_15)
end

function t_15:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var544 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var545, var546 = protoModule.writeTag(buff, var544, 1, protoModule.wireTypes.lengthDelimited)
		var545, var861 = protoModule.writeString(var545, var546, self.key)
		buff = var545
		var544 = var546
	end
	if self.value ~= nil then
		local var547 = self.value:encode()
		local var548, var549 = protoModule.writeTag(buff, var544, 2, protoModule.wireTypes.lengthDelimited)
		var548, var864 = protoModule.writeBuffer(var548, var549, var547, buffer.len(var547))
		buff = var548
		var544 = var549
	end
	local buff_1 = buffer.create(var544)
	buffer.copy(buff_1, 0, buff, 0, var544)
	
	return buff_1
end

function t_15.decode(p15)
	-- upvalues: t_15 (ref), protoModule (ref), marketplaceLookDataModule (ref)
	local var544 = t_15.new()
	local var545 = 0
	while var545 < buffer.len(p15) do
		local _ = nil
		local var546 = nil
		local var547, var548, var549 = protoModule.readTag(p15, var545)
		local var550 = var547
		var546 = var548
		var545 = var549
		
		if var546 == protoModule.wireTypes.varint then
			local _ = nil
			local var551, var552 = protoModule.readVarInt(p15, var545)
			local _ = var551
			var545 = var552
			continue
		end
		if var546 == protoModule.wireTypes.lengthDelimited then
			if var550 == 1 then
				local _ = nil
				local var553, var554 = protoModule.readBuffer(p15, var545)
				var545 = var554
				var544.key = buffer.tostring(var553)
			elseif var550 == 2 then
				local _ = nil
				local var555, var556 = protoModule.readBuffer(p15, var545)
				var545 = var556
				var544.value = marketplaceLookDataModule.MarketplaceLookData.decode(var555)
			else
				local _ = nil
				local var557, var558 = protoModule.readVarInt(p15, var545)
				var545 = var558 + var557
			end
		elseif var546 == protoModule.wireTypes.i32 then
			local _ = nil
			local var559, var560 = protoModule.readFixed32(p15, var545)
			local _ = var559
			var545 = var560
		elseif var546 == protoModule.wireTypes.i64 then
			local _ = nil
			local var561, var562 = protoModule.readFixed64(p15, var545)
			local _ = var561
			var545 = var562
		else
			error("Unsupported wire type: " .. var868)
		end
	end
	return var544
end

function t_15:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_15:jsonDecode()
	-- upvalues: t_15 (ref), marketplaceLookDataModule (ref)
	local var563 = t_15.new()
	
	if self.key ~= nil then
		var563.key = self.key
	end
	if self.value ~= nil then
		var563.value = marketplaceLookDataModule.MarketplaceLookData.jsonDecode(self.value)
	end
	return var563
end

t_15.descriptor = {
	name = "HydrationContent_MarketplaceLookEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceLookEntry"
}
t.HydrationContent_MarketplaceLookEntry = t_15
typeRegistryModule.default:register(t.HydrationContent_MarketplaceLookEntry)
local t_16 = {}
t_16.__index = t_16

function t_16.new(p16)
	-- upvalues: t_16 (ref)
	return setmetatable({
		key = if p16 == nil or p16.key == nil then "" else p16.key,
		value = if p16 == nil or p16.value == nil then nil else p16.value
	}, t_16)
end

function t_16:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var563 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var564, var565 = protoModule.writeTag(buff, var563, 1, protoModule.wireTypes.lengthDelimited)
		var564, var890 = protoModule.writeString(var564, var565, self.key)
		buff = var564
		var563 = var565
	end
	if self.value ~= nil then
		local var566 = self.value:encode()
		local var567, var568 = protoModule.writeTag(buff, var563, 2, protoModule.wireTypes.lengthDelimited)
		var567, var893 = protoModule.writeBuffer(var567, var568, var566, buffer.len(var566))
		buff = var567
		var563 = var568
	end
	local buff_1 = buffer.create(var563)
	buffer.copy(buff_1, 0, buff, 0, var563)
	
	return buff_1
end

function t_16.decode(p16)
	-- upvalues: t_16 (ref), protoModule (ref), catalogSortDataModule (ref)
	local var563 = t_16.new()
	local var564 = 0
	while var564 < buffer.len(p16) do
		local _ = nil
		local var565 = nil
		local var566, var567, var568 = protoModule.readTag(p16, var564)
		local var569 = var566
		var565 = var567
		var564 = var568
		
		if var565 == protoModule.wireTypes.varint then
			local _ = nil
			local var570, var571 = protoModule.readVarInt(p16, var564)
			local _ = var570
			var564 = var571
			continue
		end
		if var565 == protoModule.wireTypes.lengthDelimited then
			if var569 == 1 then
				local _ = nil
				local var572, var573 = protoModule.readBuffer(p16, var564)
				var564 = var573
				var563.key = buffer.tostring(var572)
			elseif var569 == 2 then
				local _ = nil
				local var574, var575 = protoModule.readBuffer(p16, var564)
				var564 = var575
				var563.value = catalogSortDataModule.CatalogSortData.decode(var574)
			else
				local _ = nil
				local var576, var577 = protoModule.readVarInt(p16, var564)
				var564 = var577 + var576
			end
		elseif var565 == protoModule.wireTypes.i32 then
			local _ = nil
			local var578, var579 = protoModule.readFixed32(p16, var564)
			local _ = var578
			var564 = var579
		elseif var565 == protoModule.wireTypes.i64 then
			local _ = nil
			local var580, var581 = protoModule.readFixed64(p16, var564)
			local _ = var580
			var564 = var581
		else
			error("Unsupported wire type: " .. var897)
		end
	end
	return var563
end

function t_16:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_16:jsonDecode()
	-- upvalues: t_16 (ref), catalogSortDataModule (ref)
	local var582 = t_16.new()
	
	if self.key ~= nil then
		var582.key = self.key
	end
	if self.value ~= nil then
		var582.value = catalogSortDataModule.CatalogSortData.jsonDecode(self.value)
	end
	return var582
end

t_16.descriptor = {
	name = "HydrationContent_CatalogSortEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortEntry"
}
t.HydrationContent_CatalogSortEntry = t_16
typeRegistryModule.default:register(t.HydrationContent_CatalogSortEntry)
local t_17 = {}
t_17.__index = t_17

function t_17.new(p17)
	-- upvalues: t_17 (ref)
	return setmetatable({
		key = if p17 == nil or p17.key == nil then "" else p17.key,
		value = if p17 == nil or p17.value == nil then nil else p17.value
	}, t_17)
end

function t_17:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var582 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var583, var584 = protoModule.writeTag(buff, var582, 1, protoModule.wireTypes.lengthDelimited)
		var583, var919 = protoModule.writeString(var583, var584, self.key)
		buff = var583
		var582 = var584
	end
	if self.value ~= nil then
		local var585 = self.value:encode()
		local var586, var587 = protoModule.writeTag(buff, var582, 2, protoModule.wireTypes.lengthDelimited)
		var586, var922 = protoModule.writeBuffer(var586, var587, var585, buffer.len(var585))
		buff = var586
		var582 = var587
	end
	local buff_1 = buffer.create(var582)
	buffer.copy(buff_1, 0, buff, 0, var582)
	
	return buff_1
end

function t_17.decode(p17)
	-- upvalues: t_17 (ref), protoModule (ref), ageRecommendationDataModule (ref)
	local var582 = t_17.new()
	local var583 = 0
	while var583 < buffer.len(p17) do
		local _ = nil
		local var584 = nil
		local var585, var586, var587 = protoModule.readTag(p17, var583)
		local var588 = var585
		var584 = var586
		var583 = var587
		
		if var584 == protoModule.wireTypes.varint then
			local _ = nil
			local var589, var590 = protoModule.readVarInt(p17, var583)
			local _ = var589
			var583 = var590
			continue
		end
		if var584 == protoModule.wireTypes.lengthDelimited then
			if var588 == 1 then
				local _ = nil
				local var591, var592 = protoModule.readBuffer(p17, var583)
				var583 = var592
				var582.key = buffer.tostring(var591)
			elseif var588 == 2 then
				local _ = nil
				local var593, var594 = protoModule.readBuffer(p17, var583)
				var583 = var594
				var582.value = ageRecommendationDataModule.AgeRecommendationData.decode(var593)
			else
				local _ = nil
				local var595, var596 = protoModule.readVarInt(p17, var583)
				var583 = var596 + var595
			end
		elseif var584 == protoModule.wireTypes.i32 then
			local _ = nil
			local var597, var598 = protoModule.readFixed32(p17, var583)
			local _ = var597
			var583 = var598
		elseif var584 == protoModule.wireTypes.i64 then
			local _ = nil
			local var599, var600 = protoModule.readFixed64(p17, var583)
			local _ = var599
			var583 = var600
		else
			error("Unsupported wire type: " .. var926)
		end
	end
	return var582
end

function t_17:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_17:jsonDecode()
	-- upvalues: t_17 (ref), ageRecommendationDataModule (ref)
	local var601 = t_17.new()
	
	if self.key ~= nil then
		var601.key = self.key
	end
	if self.value ~= nil then
		var601.value = ageRecommendationDataModule.AgeRecommendationData.jsonDecode(self.value)
	end
	return var601
end

t_17.descriptor = {
	name = "HydrationContent_AgeRecommendationEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeRecommendationEntry"
}
t.HydrationContent_AgeRecommendationEntry = t_17
typeRegistryModule.default:register(t.HydrationContent_AgeRecommendationEntry)
local t_18 = {}
t_18.__index = t_18

function t_18.new(p18)
	-- upvalues: t_18 (ref)
	return setmetatable({
		key = if p18 == nil or p18.key == nil then "" else p18.key,
		value = if p18 == nil or p18.value == nil then nil else p18.value
	}, t_18)
end

function t_18:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var601 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var602, var603 = protoModule.writeTag(buff, var601, 1, protoModule.wireTypes.lengthDelimited)
		var602, var948 = protoModule.writeString(var602, var603, self.key)
		buff = var602
		var601 = var603
	end
	if self.value ~= nil then
		local var604 = self.value:encode()
		local var605, var606 = protoModule.writeTag(buff, var601, 2, protoModule.wireTypes.lengthDelimited)
		var605, var951 = protoModule.writeBuffer(var605, var606, var604, buffer.len(var604))
		buff = var605
		var601 = var606
	end
	local buff_1 = buffer.create(var601)
	buffer.copy(buff_1, 0, buff, 0, var601)
	
	return buff_1
end

function t_18.decode(p18)
	-- upvalues: t_18 (ref), protoModule (ref), universeUserFollowDataModule (ref)
	local var601 = t_18.new()
	local var602 = 0
	while var602 < buffer.len(p18) do
		local _ = nil
		local var603 = nil
		local var604, var605, var606 = protoModule.readTag(p18, var602)
		local var607 = var604
		var603 = var605
		var602 = var606
		
		if var603 == protoModule.wireTypes.varint then
			local _ = nil
			local var608, var609 = protoModule.readVarInt(p18, var602)
			local _ = var608
			var602 = var609
			continue
		end
		if var603 == protoModule.wireTypes.lengthDelimited then
			if var607 == 1 then
				local _ = nil
				local var610, var611 = protoModule.readBuffer(p18, var602)
				var602 = var611
				var601.key = buffer.tostring(var610)
			elseif var607 == 2 then
				local _ = nil
				local var612, var613 = protoModule.readBuffer(p18, var602)
				var602 = var613
				var601.value = universeUserFollowDataModule.UniverseUserFollowData.decode(var612)
			else
				local _ = nil
				local var614, var615 = protoModule.readVarInt(p18, var602)
				var602 = var615 + var614
			end
		elseif var603 == protoModule.wireTypes.i32 then
			local _ = nil
			local var616, var617 = protoModule.readFixed32(p18, var602)
			local _ = var616
			var602 = var617
		elseif var603 == protoModule.wireTypes.i64 then
			local _ = nil
			local var618, var619 = protoModule.readFixed64(p18, var602)
			local _ = var618
			var602 = var619
		else
			error("Unsupported wire type: " .. var955)
		end
	end
	return var601
end

function t_18:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_18:jsonDecode()
	-- upvalues: t_18 (ref), universeUserFollowDataModule (ref)
	local var620 = t_18.new()
	
	if self.key ~= nil then
		var620.key = self.key
	end
	if self.value ~= nil then
		var620.value = universeUserFollowDataModule.UniverseUserFollowData.jsonDecode(self.value)
	end
	return var620
end

t_18.descriptor = {
	name = "HydrationContent_UniverseUserFollowEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserFollowEntry"
}
t.HydrationContent_UniverseUserFollowEntry = t_18
typeRegistryModule.default:register(t.HydrationContent_UniverseUserFollowEntry)
local t_19 = {}
t_19.__index = t_19

function t_19.new(p19)
	-- upvalues: t_19 (ref)
	return setmetatable({
		key = if p19 == nil or p19.key == nil then "" else p19.key,
		value = if p19 == nil or p19.value == nil then nil else p19.value
	}, t_19)
end

function t_19:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var620 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var621, var622 = protoModule.writeTag(buff, var620, 1, protoModule.wireTypes.lengthDelimited)
		var621, var977 = protoModule.writeString(var621, var622, self.key)
		buff = var621
		var620 = var622
	end
	if self.value ~= nil then
		local var623 = self.value:encode()
		local var624, var625 = protoModule.writeTag(buff, var620, 2, protoModule.wireTypes.lengthDelimited)
		var624, var980 = protoModule.writeBuffer(var624, var625, var623, buffer.len(var623))
		buff = var624
		var620 = var625
	end
	local buff_1 = buffer.create(var620)
	buffer.copy(buff_1, 0, buff, 0, var620)
	
	return buff_1
end

function t_19.decode(p19)
	-- upvalues: t_19 (ref), protoModule (ref), universeUserVoteDataModule (ref)
	local var620 = t_19.new()
	local var621 = 0
	while var621 < buffer.len(p19) do
		local _ = nil
		local var622 = nil
		local var623, var624, var625 = protoModule.readTag(p19, var621)
		local var626 = var623
		var622 = var624
		var621 = var625
		
		if var622 == protoModule.wireTypes.varint then
			local _ = nil
			local var627, var628 = protoModule.readVarInt(p19, var621)
			local _ = var627
			var621 = var628
			continue
		end
		if var622 == protoModule.wireTypes.lengthDelimited then
			if var626 == 1 then
				local _ = nil
				local var629, var630 = protoModule.readBuffer(p19, var621)
				var621 = var630
				var620.key = buffer.tostring(var629)
			elseif var626 == 2 then
				local _ = nil
				local var631, var632 = protoModule.readBuffer(p19, var621)
				var621 = var632
				var620.value = universeUserVoteDataModule.UniverseUserVoteData.decode(var631)
			else
				local _ = nil
				local var633, var634 = protoModule.readVarInt(p19, var621)
				var621 = var634 + var633
			end
		elseif var622 == protoModule.wireTypes.i32 then
			local _ = nil
			local var635, var636 = protoModule.readFixed32(p19, var621)
			local _ = var635
			var621 = var636
		elseif var622 == protoModule.wireTypes.i64 then
			local _ = nil
			local var637, var638 = protoModule.readFixed64(p19, var621)
			local _ = var637
			var621 = var638
		else
			error("Unsupported wire type: " .. var984)
		end
	end
	return var620
end

function t_19:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_19:jsonDecode()
	-- upvalues: t_19 (ref), universeUserVoteDataModule (ref)
	local var639 = t_19.new()
	
	if self.key ~= nil then
		var639.key = self.key
	end
	if self.value ~= nil then
		var639.value = universeUserVoteDataModule.UniverseUserVoteData.jsonDecode(self.value)
	end
	return var639
end

t_19.descriptor = {
	name = "HydrationContent_UniverseUserVoteEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserVoteEntry"
}
t.HydrationContent_UniverseUserVoteEntry = t_19
typeRegistryModule.default:register(t.HydrationContent_UniverseUserVoteEntry)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p20)
	-- upvalues: t_20 (ref)
	return setmetatable({
		key = if p20 == nil or p20.key == nil then "" else p20.key,
		value = if p20 == nil or p20.value == nil then nil else p20.value
	}, t_20)
end

function t_20:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var639 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var640, var641 = protoModule.writeTag(buff, var639, 1, protoModule.wireTypes.lengthDelimited)
		var640, var1006 = protoModule.writeString(var640, var641, self.key)
		buff = var640
		var639 = var641
	end
	if self.value ~= nil then
		local var642 = self.value:encode()
		local var643, var644 = protoModule.writeTag(buff, var639, 2, protoModule.wireTypes.lengthDelimited)
		var643, var1009 = protoModule.writeBuffer(var643, var644, var642, buffer.len(var642))
		buff = var643
		var639 = var644
	end
	local buff_1 = buffer.create(var639)
	buffer.copy(buff_1, 0, buff, 0, var639)
	
	return buff_1
end

function t_20.decode(p20)
	-- upvalues: t_20 (ref), protoModule (ref), userProfileDataModule (ref)
	local var639 = t_20.new()
	local var640 = 0
	while var640 < buffer.len(p20) do
		local _ = nil
		local var641 = nil
		local var642, var643, var644 = protoModule.readTag(p20, var640)
		local var645 = var642
		var641 = var643
		var640 = var644
		
		if var641 == protoModule.wireTypes.varint then
			local _ = nil
			local var646, var647 = protoModule.readVarInt(p20, var640)
			local _ = var646
			var640 = var647
			continue
		end
		if var641 == protoModule.wireTypes.lengthDelimited then
			if var645 == 1 then
				local _ = nil
				local var648, var649 = protoModule.readBuffer(p20, var640)
				var640 = var649
				var639.key = buffer.tostring(var648)
			elseif var645 == 2 then
				local _ = nil
				local var650, var651 = protoModule.readBuffer(p20, var640)
				var640 = var651
				var639.value = userProfileDataModule.UserProfileData.decode(var650)
			else
				local _ = nil
				local var652, var653 = protoModule.readVarInt(p20, var640)
				var640 = var653 + var652
			end
		elseif var641 == protoModule.wireTypes.i32 then
			local _ = nil
			local var654, var655 = protoModule.readFixed32(p20, var640)
			local _ = var654
			var640 = var655
		elseif var641 == protoModule.wireTypes.i64 then
			local _ = nil
			local var656, var657 = protoModule.readFixed64(p20, var640)
			local _ = var656
			var640 = var657
		else
			error("Unsupported wire type: " .. var1013)
		end
	end
	return var639
end

function t_20:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_20:jsonDecode()
	-- upvalues: t_20 (ref), userProfileDataModule (ref)
	local var658 = t_20.new()
	
	if self.key ~= nil then
		var658.key = self.key
	end
	if self.value ~= nil then
		var658.value = userProfileDataModule.UserProfileData.jsonDecode(self.value)
	end
	return var658
end

t_20.descriptor = {
	name = "HydrationContent_UserProfileEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserProfileEntry"
}
t.HydrationContent_UserProfileEntry = t_20
typeRegistryModule.default:register(t.HydrationContent_UserProfileEntry)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p21)
	-- upvalues: t_21 (ref)
	return setmetatable({
		key = if p21 == nil or p21.key == nil then "" else p21.key,
		value = if p21 == nil or p21.value == nil then nil else p21.value
	}, t_21)
end

function t_21:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var658 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var659, var660 = protoModule.writeTag(buff, var658, 1, protoModule.wireTypes.lengthDelimited)
		var659, var1035 = protoModule.writeString(var659, var660, self.key)
		buff = var659
		var658 = var660
	end
	if self.value ~= nil then
		local var661 = self.value:encode()
		local var662, var663 = protoModule.writeTag(buff, var658, 2, protoModule.wireTypes.lengthDelimited)
		var662, var1038 = protoModule.writeBuffer(var662, var663, var661, buffer.len(var661))
		buff = var662
		var658 = var663
	end
	local buff_1 = buffer.create(var658)
	buffer.copy(buff_1, 0, buff, 0, var658)
	
	return buff_1
end

function t_21.decode(p21)
	-- upvalues: t_21 (ref), protoModule (ref), universeUserFavoriteDataModule (ref)
	local var658 = t_21.new()
	local var659 = 0
	while var659 < buffer.len(p21) do
		local _ = nil
		local var660 = nil
		local var661, var662, var663 = protoModule.readTag(p21, var659)
		local var664 = var661
		var660 = var662
		var659 = var663
		
		if var660 == protoModule.wireTypes.varint then
			local _ = nil
			local var665, var666 = protoModule.readVarInt(p21, var659)
			local _ = var665
			var659 = var666
			continue
		end
		if var660 == protoModule.wireTypes.lengthDelimited then
			if var664 == 1 then
				local _ = nil
				local var667, var668 = protoModule.readBuffer(p21, var659)
				var659 = var668
				var658.key = buffer.tostring(var667)
			elseif var664 == 2 then
				local _ = nil
				local var669, var670 = protoModule.readBuffer(p21, var659)
				var659 = var670
				var658.value = universeUserFavoriteDataModule.UniverseUserFavoriteData.decode(var669)
			else
				local _ = nil
				local var671, var672 = protoModule.readVarInt(p21, var659)
				var659 = var672 + var671
			end
		elseif var660 == protoModule.wireTypes.i32 then
			local _ = nil
			local var673, var674 = protoModule.readFixed32(p21, var659)
			local _ = var673
			var659 = var674
		elseif var660 == protoModule.wireTypes.i64 then
			local _ = nil
			local var675, var676 = protoModule.readFixed64(p21, var659)
			local _ = var675
			var659 = var676
		else
			error("Unsupported wire type: " .. var1042)
		end
	end
	return var658
end

function t_21:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_21:jsonDecode()
	-- upvalues: t_21 (ref), universeUserFavoriteDataModule (ref)
	local var677 = t_21.new()
	
	if self.key ~= nil then
		var677.key = self.key
	end
	if self.value ~= nil then
		var677.value = universeUserFavoriteDataModule.UniverseUserFavoriteData.jsonDecode(self.value)
	end
	return var677
end

t_21.descriptor = {
	name = "HydrationContent_UniverseUserFavoriteEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserFavoriteEntry"
}
t.HydrationContent_UniverseUserFavoriteEntry = t_21
typeRegistryModule.default:register(t.HydrationContent_UniverseUserFavoriteEntry)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p22)
	-- upvalues: t_22 (ref)
	return setmetatable({
		key = if p22 == nil or p22.key == nil then "" else p22.key,
		value = if p22 == nil or p22.value == nil then nil else p22.value
	}, t_22)
end

function t_22:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var677 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var678, var679 = protoModule.writeTag(buff, var677, 1, protoModule.wireTypes.lengthDelimited)
		var678, var1064 = protoModule.writeString(var678, var679, self.key)
		buff = var678
		var677 = var679
	end
	if self.value ~= nil then
		local var680 = self.value:encode()
		local var681, var682 = protoModule.writeTag(buff, var677, 2, protoModule.wireTypes.lengthDelimited)
		var681, var1067 = protoModule.writeBuffer(var681, var682, var680, buffer.len(var680))
		buff = var681
		var677 = var682
	end
	local buff_1 = buffer.create(var677)
	buffer.copy(buff_1, 0, buff, 0, var677)
	
	return buff_1
end

function t_22.decode(p22)
	-- upvalues: t_22 (ref), protoModule (ref), playabilityDataModule (ref)
	local var677 = t_22.new()
	local var678 = 0
	while var678 < buffer.len(p22) do
		local _ = nil
		local var679 = nil
		local var680, var681, var682 = protoModule.readTag(p22, var678)
		local var683 = var680
		var679 = var681
		var678 = var682
		
		if var679 == protoModule.wireTypes.varint then
			local _ = nil
			local var684, var685 = protoModule.readVarInt(p22, var678)
			local _ = var684
			var678 = var685
			continue
		end
		if var679 == protoModule.wireTypes.lengthDelimited then
			if var683 == 1 then
				local _ = nil
				local var686, var687 = protoModule.readBuffer(p22, var678)
				var678 = var687
				var677.key = buffer.tostring(var686)
			elseif var683 == 2 then
				local _ = nil
				local var688, var689 = protoModule.readBuffer(p22, var678)
				var678 = var689
				var677.value = playabilityDataModule.PlayabilityData.decode(var688)
			else
				local _ = nil
				local var690, var691 = protoModule.readVarInt(p22, var678)
				var678 = var691 + var690
			end
		elseif var679 == protoModule.wireTypes.i32 then
			local _ = nil
			local var692, var693 = protoModule.readFixed32(p22, var678)
			local _ = var692
			var678 = var693
		elseif var679 == protoModule.wireTypes.i64 then
			local _ = nil
			local var694, var695 = protoModule.readFixed64(p22, var678)
			local _ = var694
			var678 = var695
		else
			error("Unsupported wire type: " .. var1071)
		end
	end
	return var677
end

function t_22:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_22:jsonDecode()
	-- upvalues: t_22 (ref), playabilityDataModule (ref)
	local var696 = t_22.new()
	
	if self.key ~= nil then
		var696.key = self.key
	end
	if self.value ~= nil then
		var696.value = playabilityDataModule.PlayabilityData.jsonDecode(self.value)
	end
	return var696
end

t_22.descriptor = {
	name = "HydrationContent_PlayabilityEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.PlayabilityEntry"
}
t.HydrationContent_PlayabilityEntry = t_22
typeRegistryModule.default:register(t.HydrationContent_PlayabilityEntry)
local t_23 = {}
t_23.__index = t_23

function t_23.new(p23)
	-- upvalues: t_23 (ref)
	return setmetatable({
		key = if p23 == nil or p23.key == nil then "" else p23.key,
		value = if p23 == nil or p23.value == nil then nil else p23.value
	}, t_23)
end

function t_23:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var696 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var697, var698 = protoModule.writeTag(buff, var696, 1, protoModule.wireTypes.lengthDelimited)
		var697, var1093 = protoModule.writeString(var697, var698, self.key)
		buff = var697
		var696 = var698
	end
	if self.value ~= nil then
		local var699 = self.value:encode()
		local var700, var701 = protoModule.writeTag(buff, var696, 2, protoModule.wireTypes.lengthDelimited)
		var700, var1096 = protoModule.writeBuffer(var700, var701, var699, buffer.len(var699))
		buff = var700
		var696 = var701
	end
	local buff_1 = buffer.create(var696)
	buffer.copy(buff_1, 0, buff, 0, var696)
	
	return buff_1
end

function t_23.decode(p23)
	-- upvalues: t_23 (ref), protoModule (ref), universeUserFollowLimitDataModule (ref)
	local var696 = t_23.new()
	local var697 = 0
	while var697 < buffer.len(p23) do
		local _ = nil
		local var698 = nil
		local var699, var700, var701 = protoModule.readTag(p23, var697)
		local var702 = var699
		var698 = var700
		var697 = var701
		
		if var698 == protoModule.wireTypes.varint then
			local _ = nil
			local var703, var704 = protoModule.readVarInt(p23, var697)
			local _ = var703
			var697 = var704
			continue
		end
		if var698 == protoModule.wireTypes.lengthDelimited then
			if var702 == 1 then
				local _ = nil
				local var705, var706 = protoModule.readBuffer(p23, var697)
				var697 = var706
				var696.key = buffer.tostring(var705)
			elseif var702 == 2 then
				local _ = nil
				local var707, var708 = protoModule.readBuffer(p23, var697)
				var697 = var708
				var696.value = universeUserFollowLimitDataModule.UniverseUserFollowLimitData.decode(var707)
			else
				local _ = nil
				local var709, var710 = protoModule.readVarInt(p23, var697)
				var697 = var710 + var709
			end
		elseif var698 == protoModule.wireTypes.i32 then
			local _ = nil
			local var711, var712 = protoModule.readFixed32(p23, var697)
			local _ = var711
			var697 = var712
		elseif var698 == protoModule.wireTypes.i64 then
			local _ = nil
			local var713, var714 = protoModule.readFixed64(p23, var697)
			local _ = var713
			var697 = var714
		else
			error("Unsupported wire type: " .. var1100)
		end
	end
	return var696
end

function t_23:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_23:jsonDecode()
	-- upvalues: t_23 (ref), universeUserFollowLimitDataModule (ref)
	local var715 = t_23.new()
	
	if self.key ~= nil then
		var715.key = self.key
	end
	if self.value ~= nil then
		var715.value = universeUserFollowLimitDataModule.UniverseUserFollowLimitData.jsonDecode(self.value)
	end
	return var715
end

t_23.descriptor = {
	name = "HydrationContent_UniverseUserFollowLimitEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserFollowLimitEntry"
}
t.HydrationContent_UniverseUserFollowLimitEntry = t_23
typeRegistryModule.default:register(t.HydrationContent_UniverseUserFollowLimitEntry)
local t_24 = {}
t_24.__index = t_24

function t_24.new(p24)
	-- upvalues: t_24 (ref)
	return setmetatable({
		key = if p24 == nil or p24.key == nil then "" else p24.key,
		value = if p24 == nil or p24.value == nil then nil else p24.value
	}, t_24)
end

function t_24:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var715 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var716, var717 = protoModule.writeTag(buff, var715, 1, protoModule.wireTypes.lengthDelimited)
		var716, var1122 = protoModule.writeString(var716, var717, self.key)
		buff = var716
		var715 = var717
	end
	if self.value ~= nil then
		local var718 = self.value:encode()
		local var719, var720 = protoModule.writeTag(buff, var715, 2, protoModule.wireTypes.lengthDelimited)
		var719, var1125 = protoModule.writeBuffer(var719, var720, var718, buffer.len(var718))
		buff = var719
		var715 = var720
	end
	local buff_1 = buffer.create(var715)
	buffer.copy(buff_1, 0, buff, 0, var715)
	
	return buff_1
end

function t_24.decode(p24)
	-- upvalues: t_24 (ref), protoModule (ref), universeUserVoteFeedbackMetadataDataModule (ref)
	local var715 = t_24.new()
	local var716 = 0
	while var716 < buffer.len(p24) do
		local _ = nil
		local var717 = nil
		local var718, var719, var720 = protoModule.readTag(p24, var716)
		local var721 = var718
		var717 = var719
		var716 = var720
		
		if var717 == protoModule.wireTypes.varint then
			local _ = nil
			local var722, var723 = protoModule.readVarInt(p24, var716)
			local _ = var722
			var716 = var723
			continue
		end
		if var717 == protoModule.wireTypes.lengthDelimited then
			if var721 == 1 then
				local _ = nil
				local var724, var725 = protoModule.readBuffer(p24, var716)
				var716 = var725
				var715.key = buffer.tostring(var724)
			elseif var721 == 2 then
				local _ = nil
				local var726, var727 = protoModule.readBuffer(p24, var716)
				var716 = var727
				var715.value = universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.decode(var726)
			else
				local _ = nil
				local var728, var729 = protoModule.readVarInt(p24, var716)
				var716 = var729 + var728
			end
		elseif var717 == protoModule.wireTypes.i32 then
			local _ = nil
			local var730, var731 = protoModule.readFixed32(p24, var716)
			local _ = var730
			var716 = var731
		elseif var717 == protoModule.wireTypes.i64 then
			local _ = nil
			local var732, var733 = protoModule.readFixed64(p24, var716)
			local _ = var732
			var716 = var733
		else
			error("Unsupported wire type: " .. var1129)
		end
	end
	return var715
end

function t_24:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_24:jsonDecode()
	-- upvalues: t_24 (ref), universeUserVoteFeedbackMetadataDataModule (ref)
	local var734 = t_24.new()
	
	if self.key ~= nil then
		var734.key = self.key
	end
	if self.value ~= nil then
		var734.value = universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.jsonDecode(self.value)
	end
	return var734
end

t_24.descriptor = {
	name = "HydrationContent_UniverseUserVoteFeedbackMetadataEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserVoteFeedbackMetadataEntry"
}
t.HydrationContent_UniverseUserVoteFeedbackMetadataEntry = t_24
typeRegistryModule.default:register(t.HydrationContent_UniverseUserVoteFeedbackMetadataEntry)
local t_25 = {}
t_25.__index = t_25

function t_25.new(p25)
	-- upvalues: t_25 (ref)
	return setmetatable({
		key = if p25 == nil or p25.key == nil then "" else p25.key,
		value = if p25 == nil or p25.value == nil then nil else p25.value
	}, t_25)
end

function t_25:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var734 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var735, var736 = protoModule.writeTag(buff, var734, 1, protoModule.wireTypes.lengthDelimited)
		var735, var1151 = protoModule.writeString(var735, var736, self.key)
		buff = var735
		var734 = var736
	end
	if self.value ~= nil then
		local var737 = self.value:encode()
		local var738, var739 = protoModule.writeTag(buff, var734, 2, protoModule.wireTypes.lengthDelimited)
		var738, var1154 = protoModule.writeBuffer(var738, var739, var737, buffer.len(var737))
		buff = var738
		var734 = var739
	end
	local buff_1 = buffer.create(var734)
	buffer.copy(buff_1, 0, buff, 0, var734)
	
	return buff_1
end

function t_25.decode(p25)
	-- upvalues: t_25 (ref), protoModule (ref), momentDataModule (ref)
	local var734 = t_25.new()
	local var735 = 0
	while var735 < buffer.len(p25) do
		local _ = nil
		local var736 = nil
		local var737, var738, var739 = protoModule.readTag(p25, var735)
		local var740 = var737
		var736 = var738
		var735 = var739
		
		if var736 == protoModule.wireTypes.varint then
			local _ = nil
			local var741, var742 = protoModule.readVarInt(p25, var735)
			local _ = var741
			var735 = var742
			continue
		end
		if var736 == protoModule.wireTypes.lengthDelimited then
			if var740 == 1 then
				local _ = nil
				local var743, var744 = protoModule.readBuffer(p25, var735)
				var735 = var744
				var734.key = buffer.tostring(var743)
			elseif var740 == 2 then
				local _ = nil
				local var745, var746 = protoModule.readBuffer(p25, var735)
				var735 = var746
				var734.value = momentDataModule.MomentData.decode(var745)
			else
				local _ = nil
				local var747, var748 = protoModule.readVarInt(p25, var735)
				var735 = var748 + var747
			end
		elseif var736 == protoModule.wireTypes.i32 then
			local _ = nil
			local var749, var750 = protoModule.readFixed32(p25, var735)
			local _ = var749
			var735 = var750
		elseif var736 == protoModule.wireTypes.i64 then
			local _ = nil
			local var751, var752 = protoModule.readFixed64(p25, var735)
			local _ = var751
			var735 = var752
		else
			error("Unsupported wire type: " .. var1158)
		end
	end
	return var734
end

function t_25:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_25:jsonDecode()
	-- upvalues: t_25 (ref), momentDataModule (ref)
	local var753 = t_25.new()
	
	if self.key ~= nil then
		var753.key = self.key
	end
	if self.value ~= nil then
		var753.value = momentDataModule.MomentData.jsonDecode(self.value)
	end
	return var753
end

t_25.descriptor = {
	name = "HydrationContent_MomentEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentEntry"
}
t.HydrationContent_MomentEntry = t_25
typeRegistryModule.default:register(t.HydrationContent_MomentEntry)
local t_26 = {}
t_26.__index = t_26

function t_26.new(p26)
	-- upvalues: t_26 (ref)
	return setmetatable({
		key = if p26 == nil or p26.key == nil then "" else p26.key,
		value = if p26 == nil or p26.value == nil then nil else p26.value
	}, t_26)
end

function t_26:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var753 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var754, var755 = protoModule.writeTag(buff, var753, 1, protoModule.wireTypes.lengthDelimited)
		var754, var1180 = protoModule.writeString(var754, var755, self.key)
		buff = var754
		var753 = var755
	end
	if self.value ~= nil then
		local var756 = self.value:encode()
		local var757, var758 = protoModule.writeTag(buff, var753, 2, protoModule.wireTypes.lengthDelimited)
		var757, var1183 = protoModule.writeBuffer(var757, var758, var756, buffer.len(var756))
		buff = var757
		var753 = var758
	end
	local buff_1 = buffer.create(var753)
	buffer.copy(buff_1, 0, buff, 0, var753)
	
	return buff_1
end

function t_26.decode(p26)
	-- upvalues: t_26 (ref), protoModule (ref), communityDataModule (ref)
	local var753 = t_26.new()
	local var754 = 0
	while var754 < buffer.len(p26) do
		local _ = nil
		local var755 = nil
		local var756, var757, var758 = protoModule.readTag(p26, var754)
		local var759 = var756
		var755 = var757
		var754 = var758
		
		if var755 == protoModule.wireTypes.varint then
			local _ = nil
			local var760, var761 = protoModule.readVarInt(p26, var754)
			local _ = var760
			var754 = var761
			continue
		end
		if var755 == protoModule.wireTypes.lengthDelimited then
			if var759 == 1 then
				local _ = nil
				local var762, var763 = protoModule.readBuffer(p26, var754)
				var754 = var763
				var753.key = buffer.tostring(var762)
			elseif var759 == 2 then
				local _ = nil
				local var764, var765 = protoModule.readBuffer(p26, var754)
				var754 = var765
				var753.value = communityDataModule.CommunityData.decode(var764)
			else
				local _ = nil
				local var766, var767 = protoModule.readVarInt(p26, var754)
				var754 = var767 + var766
			end
		elseif var755 == protoModule.wireTypes.i32 then
			local _ = nil
			local var768, var769 = protoModule.readFixed32(p26, var754)
			local _ = var768
			var754 = var769
		elseif var755 == protoModule.wireTypes.i64 then
			local _ = nil
			local var770, var771 = protoModule.readFixed64(p26, var754)
			local _ = var770
			var754 = var771
		else
			error("Unsupported wire type: " .. var1187)
		end
	end
	return var753
end

function t_26:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_26:jsonDecode()
	-- upvalues: t_26 (ref), communityDataModule (ref)
	local var772 = t_26.new()
	
	if self.key ~= nil then
		var772.key = self.key
	end
	if self.value ~= nil then
		var772.value = communityDataModule.CommunityData.jsonDecode(self.value)
	end
	return var772
end

t_26.descriptor = {
	name = "HydrationContent_CommunityEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunityEntry"
}
t.HydrationContent_CommunityEntry = t_26
typeRegistryModule.default:register(t.HydrationContent_CommunityEntry)
local t_27 = {}
t_27.__index = t_27

function t_27.new(p27)
	-- upvalues: t_27 (ref)
	return setmetatable({
		key = if p27 == nil or p27.key == nil then "" else p27.key,
		value = if p27 == nil or p27.value == nil then nil else p27.value
	}, t_27)
end

function t_27:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var772 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var773, var774 = protoModule.writeTag(buff, var772, 1, protoModule.wireTypes.lengthDelimited)
		var773, var1209 = protoModule.writeString(var773, var774, self.key)
		buff = var773
		var772 = var774
	end
	if self.value ~= nil then
		local var775 = self.value:encode()
		local var776, var777 = protoModule.writeTag(buff, var772, 2, protoModule.wireTypes.lengthDelimited)
		var776, var1212 = protoModule.writeBuffer(var776, var777, var775, buffer.len(var775))
		buff = var776
		var772 = var777
	end
	local buff_1 = buffer.create(var772)
	buffer.copy(buff_1, 0, buff, 0, var772)
	
	return buff_1
end

function t_27.decode(p27)
	-- upvalues: t_27 (ref), protoModule (ref), communityUserMembershipDataModule (ref)
	local var772 = t_27.new()
	local var773 = 0
	while var773 < buffer.len(p27) do
		local _ = nil
		local var774 = nil
		local var775, var776, var777 = protoModule.readTag(p27, var773)
		local var778 = var775
		var774 = var776
		var773 = var777
		
		if var774 == protoModule.wireTypes.varint then
			local _ = nil
			local var779, var780 = protoModule.readVarInt(p27, var773)
			local _ = var779
			var773 = var780
			continue
		end
		if var774 == protoModule.wireTypes.lengthDelimited then
			if var778 == 1 then
				local _ = nil
				local var781, var782 = protoModule.readBuffer(p27, var773)
				var773 = var782
				var772.key = buffer.tostring(var781)
			elseif var778 == 2 then
				local _ = nil
				local var783, var784 = protoModule.readBuffer(p27, var773)
				var773 = var784
				var772.value = communityUserMembershipDataModule.CommunityUserMembershipData.decode(var783)
			else
				local _ = nil
				local var785, var786 = protoModule.readVarInt(p27, var773)
				var773 = var786 + var785
			end
		elseif var774 == protoModule.wireTypes.i32 then
			local _ = nil
			local var787, var788 = protoModule.readFixed32(p27, var773)
			local _ = var787
			var773 = var788
		elseif var774 == protoModule.wireTypes.i64 then
			local _ = nil
			local var789, var790 = protoModule.readFixed64(p27, var773)
			local _ = var789
			var773 = var790
		else
			error("Unsupported wire type: " .. var1216)
		end
	end
	return var772
end

function t_27:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_27:jsonDecode()
	-- upvalues: t_27 (ref), communityUserMembershipDataModule (ref)
	local var791 = t_27.new()
	
	if self.key ~= nil then
		var791.key = self.key
	end
	if self.value ~= nil then
		var791.value = communityUserMembershipDataModule.CommunityUserMembershipData.jsonDecode(self.value)
	end
	return var791
end

t_27.descriptor = {
	name = "HydrationContent_CommunityUserMembershipEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunityUserMembershipEntry"
}
t.HydrationContent_CommunityUserMembershipEntry = t_27
typeRegistryModule.default:register(t.HydrationContent_CommunityUserMembershipEntry)
local t_28 = {}
t_28.__index = t_28

function t_28.new(p28)
	-- upvalues: t_28 (ref)
	return setmetatable({
		key = if p28 == nil or p28.key == nil then "" else p28.key,
		value = if p28 == nil or p28.value == nil then nil else p28.value
	}, t_28)
end

function t_28:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var791 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var792, var793 = protoModule.writeTag(buff, var791, 1, protoModule.wireTypes.lengthDelimited)
		var792, var1238 = protoModule.writeString(var792, var793, self.key)
		buff = var792
		var791 = var793
	end
	if self.value ~= nil then
		local var794 = self.value:encode()
		local var795, var796 = protoModule.writeTag(buff, var791, 2, protoModule.wireTypes.lengthDelimited)
		var795, var1241 = protoModule.writeBuffer(var795, var796, var794, buffer.len(var794))
		buff = var795
		var791 = var796
	end
	local buff_1 = buffer.create(var791)
	buffer.copy(buff_1, 0, buff, 0, var791)
	
	return buff_1
end

function t_28.decode(p28)
	-- upvalues: t_28 (ref), protoModule (ref), friendRecommendationDataModule (ref)
	local var791 = t_28.new()
	local var792 = 0
	while var792 < buffer.len(p28) do
		local _ = nil
		local var793 = nil
		local var794, var795, var796 = protoModule.readTag(p28, var792)
		local var797 = var794
		var793 = var795
		var792 = var796
		
		if var793 == protoModule.wireTypes.varint then
			local _ = nil
			local var798, var799 = protoModule.readVarInt(p28, var792)
			local _ = var798
			var792 = var799
			continue
		end
		if var793 == protoModule.wireTypes.lengthDelimited then
			if var797 == 1 then
				local _ = nil
				local var800, var801 = protoModule.readBuffer(p28, var792)
				var792 = var801
				var791.key = buffer.tostring(var800)
			elseif var797 == 2 then
				local _ = nil
				local var802, var803 = protoModule.readBuffer(p28, var792)
				var792 = var803
				var791.value = friendRecommendationDataModule.FriendRecommendationData.decode(var802)
			else
				local _ = nil
				local var804, var805 = protoModule.readVarInt(p28, var792)
				var792 = var805 + var804
			end
		elseif var793 == protoModule.wireTypes.i32 then
			local _ = nil
			local var806, var807 = protoModule.readFixed32(p28, var792)
			local _ = var806
			var792 = var807
		elseif var793 == protoModule.wireTypes.i64 then
			local _ = nil
			local var808, var809 = protoModule.readFixed64(p28, var792)
			local _ = var808
			var792 = var809
		else
			error("Unsupported wire type: " .. var1245)
		end
	end
	return var791
end

function t_28:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_28:jsonDecode()
	-- upvalues: t_28 (ref), friendRecommendationDataModule (ref)
	local var810 = t_28.new()
	
	if self.key ~= nil then
		var810.key = self.key
	end
	if self.value ~= nil then
		var810.value = friendRecommendationDataModule.FriendRecommendationData.jsonDecode(self.value)
	end
	return var810
end

t_28.descriptor = {
	name = "HydrationContent_FriendRecommendationEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.FriendRecommendationEntry"
}
t.HydrationContent_FriendRecommendationEntry = t_28
typeRegistryModule.default:register(t.HydrationContent_FriendRecommendationEntry)
local t_29 = {}
t_29.__index = t_29

function t_29.new(p29)
	-- upvalues: t_29 (ref)
	return setmetatable({
		key = if p29 == nil or p29.key == nil then "" else p29.key,
		value = if p29 == nil or p29.value == nil then nil else p29.value
	}, t_29)
end

function t_29:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var810 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var811, var812 = protoModule.writeTag(buff, var810, 1, protoModule.wireTypes.lengthDelimited)
		var811, var1267 = protoModule.writeString(var811, var812, self.key)
		buff = var811
		var810 = var812
	end
	if self.value ~= nil then
		local var813 = self.value:encode()
		local var814, var815 = protoModule.writeTag(buff, var810, 2, protoModule.wireTypes.lengthDelimited)
		var814, var1270 = protoModule.writeBuffer(var814, var815, var813, buffer.len(var813))
		buff = var814
		var810 = var815
	end
	local buff_1 = buffer.create(var810)
	buffer.copy(buff_1, 0, buff, 0, var810)
	
	return buff_1
end

function t_29.decode(p29)
	-- upvalues: t_29 (ref), protoModule (ref), universePrivateServerDataModule (ref)
	local var810 = t_29.new()
	local var811 = 0
	while var811 < buffer.len(p29) do
		local _ = nil
		local var812 = nil
		local var813, var814, var815 = protoModule.readTag(p29, var811)
		local var816 = var813
		var812 = var814
		var811 = var815
		
		if var812 == protoModule.wireTypes.varint then
			local _ = nil
			local var817, var818 = protoModule.readVarInt(p29, var811)
			local _ = var817
			var811 = var818
			continue
		end
		if var812 == protoModule.wireTypes.lengthDelimited then
			if var816 == 1 then
				local _ = nil
				local var819, var820 = protoModule.readBuffer(p29, var811)
				var811 = var820
				var810.key = buffer.tostring(var819)
			elseif var816 == 2 then
				local _ = nil
				local var821, var822 = protoModule.readBuffer(p29, var811)
				var811 = var822
				var810.value = universePrivateServerDataModule.UniversePrivateServerData.decode(var821)
			else
				local _ = nil
				local var823, var824 = protoModule.readVarInt(p29, var811)
				var811 = var824 + var823
			end
		elseif var812 == protoModule.wireTypes.i32 then
			local _ = nil
			local var825, var826 = protoModule.readFixed32(p29, var811)
			local _ = var825
			var811 = var826
		elseif var812 == protoModule.wireTypes.i64 then
			local _ = nil
			local var827, var828 = protoModule.readFixed64(p29, var811)
			local _ = var827
			var811 = var828
		else
			error("Unsupported wire type: " .. var1274)
		end
	end
	return var810
end

function t_29:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_29:jsonDecode()
	-- upvalues: t_29 (ref), universePrivateServerDataModule (ref)
	local var829 = t_29.new()
	
	if self.key ~= nil then
		var829.key = self.key
	end
	if self.value ~= nil then
		var829.value = universePrivateServerDataModule.UniversePrivateServerData.jsonDecode(self.value)
	end
	return var829
end

t_29.descriptor = {
	name = "HydrationContent_UniversePrivateServerEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniversePrivateServerEntry"
}
t.HydrationContent_UniversePrivateServerEntry = t_29
typeRegistryModule.default:register(t.HydrationContent_UniversePrivateServerEntry)
local t_30 = {}
t_30.__index = t_30

function t_30.new(p30)
	-- upvalues: t_30 (ref)
	return setmetatable({
		key = if p30 == nil or p30.key == nil then "" else p30.key,
		value = if p30 == nil or p30.value == nil then nil else p30.value
	}, t_30)
end

function t_30:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var829 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var830, var831 = protoModule.writeTag(buff, var829, 1, protoModule.wireTypes.lengthDelimited)
		var830, var1296 = protoModule.writeString(var830, var831, self.key)
		buff = var830
		var829 = var831
	end
	if self.value ~= nil then
		local var832 = self.value:encode()
		local var833, var834 = protoModule.writeTag(buff, var829, 2, protoModule.wireTypes.lengthDelimited)
		var833, var1299 = protoModule.writeBuffer(var833, var834, var832, buffer.len(var832))
		buff = var833
		var829 = var834
	end
	local buff_1 = buffer.create(var829)
	buffer.copy(buff_1, 0, buff, 0, var829)
	
	return buff_1
end

function t_30.decode(p30)
	-- upvalues: t_30 (ref), protoModule (ref), notificationBadgeDataModule (ref)
	local var829 = t_30.new()
	local var830 = 0
	while var830 < buffer.len(p30) do
		local _ = nil
		local var831 = nil
		local var832, var833, var834 = protoModule.readTag(p30, var830)
		local var835 = var832
		var831 = var833
		var830 = var834
		
		if var831 == protoModule.wireTypes.varint then
			local _ = nil
			local var836, var837 = protoModule.readVarInt(p30, var830)
			local _ = var836
			var830 = var837
			continue
		end
		if var831 == protoModule.wireTypes.lengthDelimited then
			if var835 == 1 then
				local _ = nil
				local var838, var839 = protoModule.readBuffer(p30, var830)
				var830 = var839
				var829.key = buffer.tostring(var838)
			elseif var835 == 2 then
				local _ = nil
				local var840, var841 = protoModule.readBuffer(p30, var830)
				var830 = var841
				var829.value = notificationBadgeDataModule.NotificationBadgeData.decode(var840)
			else
				local _ = nil
				local var842, var843 = protoModule.readVarInt(p30, var830)
				var830 = var843 + var842
			end
		elseif var831 == protoModule.wireTypes.i32 then
			local _ = nil
			local var844, var845 = protoModule.readFixed32(p30, var830)
			local _ = var844
			var830 = var845
		elseif var831 == protoModule.wireTypes.i64 then
			local _ = nil
			local var846, var847 = protoModule.readFixed64(p30, var830)
			local _ = var846
			var830 = var847
		else
			error("Unsupported wire type: " .. var1303)
		end
	end
	return var829
end

function t_30:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_30:jsonDecode()
	-- upvalues: t_30 (ref), notificationBadgeDataModule (ref)
	local var848 = t_30.new()
	
	if self.key ~= nil then
		var848.key = self.key
	end
	if self.value ~= nil then
		var848.value = notificationBadgeDataModule.NotificationBadgeData.jsonDecode(self.value)
	end
	return var848
end

t_30.descriptor = {
	name = "HydrationContent_NotificationBadgeEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.NotificationBadgeEntry"
}
t.HydrationContent_NotificationBadgeEntry = t_30
typeRegistryModule.default:register(t.HydrationContent_NotificationBadgeEntry)
local t_31 = {}
t_31.__index = t_31

function t_31.new(p31)
	-- upvalues: t_31 (ref)
	return setmetatable({
		key = if p31 == nil or p31.key == nil then "" else p31.key,
		value = if p31 == nil or p31.value == nil then nil else p31.value
	}, t_31)
end

function t_31:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var848 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var849, var850 = protoModule.writeTag(buff, var848, 1, protoModule.wireTypes.lengthDelimited)
		var849, var1325 = protoModule.writeString(var849, var850, self.key)
		buff = var849
		var848 = var850
	end
	if self.value ~= nil then
		local var851 = self.value:encode()
		local var852, var853 = protoModule.writeTag(buff, var848, 2, protoModule.wireTypes.lengthDelimited)
		var852, var1328 = protoModule.writeBuffer(var852, var853, var851, buffer.len(var851))
		buff = var852
		var848 = var853
	end
	local buff_1 = buffer.create(var848)
	buffer.copy(buff_1, 0, buff, 0, var848)
	
	return buff_1
end

function t_31.decode(p31)
	-- upvalues: t_31 (ref), protoModule (ref), collectibleItemDataModule (ref)
	local var848 = t_31.new()
	local var849 = 0
	while var849 < buffer.len(p31) do
		local _ = nil
		local var850 = nil
		local var851, var852, var853 = protoModule.readTag(p31, var849)
		local var854 = var851
		var850 = var852
		var849 = var853
		
		if var850 == protoModule.wireTypes.varint then
			local _ = nil
			local var855, var856 = protoModule.readVarInt(p31, var849)
			local _ = var855
			var849 = var856
			continue
		end
		if var850 == protoModule.wireTypes.lengthDelimited then
			if var854 == 1 then
				local _ = nil
				local var857, var858 = protoModule.readBuffer(p31, var849)
				var849 = var858
				var848.key = buffer.tostring(var857)
			elseif var854 == 2 then
				local _ = nil
				local var859, var860 = protoModule.readBuffer(p31, var849)
				var849 = var860
				var848.value = collectibleItemDataModule.CollectibleItemData.decode(var859)
			else
				local _ = nil
				local var861, var862 = protoModule.readVarInt(p31, var849)
				var849 = var862 + var861
			end
		elseif var850 == protoModule.wireTypes.i32 then
			local _ = nil
			local var863, var864 = protoModule.readFixed32(p31, var849)
			local _ = var863
			var849 = var864
		elseif var850 == protoModule.wireTypes.i64 then
			local _ = nil
			local var865, var866 = protoModule.readFixed64(p31, var849)
			local _ = var865
			var849 = var866
		else
			error("Unsupported wire type: " .. var1332)
		end
	end
	return var848
end

function t_31:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_31:jsonDecode()
	-- upvalues: t_31 (ref), collectibleItemDataModule (ref)
	local var867 = t_31.new()
	
	if self.key ~= nil then
		var867.key = self.key
	end
	if self.value ~= nil then
		var867.value = collectibleItemDataModule.CollectibleItemData.jsonDecode(self.value)
	end
	return var867
end

t_31.descriptor = {
	name = "HydrationContent_CollectibleItemEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.CollectibleItemEntry"
}
t.HydrationContent_CollectibleItemEntry = t_31
typeRegistryModule.default:register(t.HydrationContent_CollectibleItemEntry)
local t_32 = {}
t_32.__index = t_32

function t_32.new(p32)
	-- upvalues: t_32 (ref)
	return setmetatable({
		key = if p32 == nil or p32.key == nil then "" else p32.key,
		value = if p32 == nil or p32.value == nil then nil else p32.value
	}, t_32)
end

function t_32:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var867 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var868, var869 = protoModule.writeTag(buff, var867, 1, protoModule.wireTypes.lengthDelimited)
		var868, var1354 = protoModule.writeString(var868, var869, self.key)
		buff = var868
		var867 = var869
	end
	if self.value ~= nil then
		local var870 = self.value:encode()
		local var871, var872 = protoModule.writeTag(buff, var867, 2, protoModule.wireTypes.lengthDelimited)
		var871, var1357 = protoModule.writeBuffer(var871, var872, var870, buffer.len(var870))
		buff = var871
		var867 = var872
	end
	local buff_1 = buffer.create(var867)
	buffer.copy(buff_1, 0, buff, 0, var867)
	
	return buff_1
end

function t_32.decode(p32)
	-- upvalues: t_32 (ref), protoModule (ref), leaderboardStatsDataModule (ref)
	local var867 = t_32.new()
	local var868 = 0
	while var868 < buffer.len(p32) do
		local _ = nil
		local var869 = nil
		local var870, var871, var872 = protoModule.readTag(p32, var868)
		local var873 = var870
		var869 = var871
		var868 = var872
		
		if var869 == protoModule.wireTypes.varint then
			local _ = nil
			local var874, var875 = protoModule.readVarInt(p32, var868)
			local _ = var874
			var868 = var875
			continue
		end
		if var869 == protoModule.wireTypes.lengthDelimited then
			if var873 == 1 then
				local _ = nil
				local var876, var877 = protoModule.readBuffer(p32, var868)
				var868 = var877
				var867.key = buffer.tostring(var876)
			elseif var873 == 2 then
				local _ = nil
				local var878, var879 = protoModule.readBuffer(p32, var868)
				var868 = var879
				var867.value = leaderboardStatsDataModule.LeaderboardStatsData.decode(var878)
			else
				local _ = nil
				local var880, var881 = protoModule.readVarInt(p32, var868)
				var868 = var881 + var880
			end
		elseif var869 == protoModule.wireTypes.i32 then
			local _ = nil
			local var882, var883 = protoModule.readFixed32(p32, var868)
			local _ = var882
			var868 = var883
		elseif var869 == protoModule.wireTypes.i64 then
			local _ = nil
			local var884, var885 = protoModule.readFixed64(p32, var868)
			local _ = var884
			var868 = var885
		else
			error("Unsupported wire type: " .. var1361)
		end
	end
	return var867
end

function t_32:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_32:jsonDecode()
	-- upvalues: t_32 (ref), leaderboardStatsDataModule (ref)
	local var886 = t_32.new()
	
	if self.key ~= nil then
		var886.key = self.key
	end
	if self.value ~= nil then
		var886.value = leaderboardStatsDataModule.LeaderboardStatsData.jsonDecode(self.value)
	end
	return var886
end

t_32.descriptor = {
	name = "HydrationContent_LeaderboardStatsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.LeaderboardStatsEntry"
}
t.HydrationContent_LeaderboardStatsEntry = t_32
typeRegistryModule.default:register(t.HydrationContent_LeaderboardStatsEntry)

return { HydrationContent = t.HydrationContent }