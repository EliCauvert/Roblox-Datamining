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
		notification_badge = if p1 == nil or p1.notification_badge == nil then {} else p1.notification_badge
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.badge ~= nil and next(self.badge) ~= nil then
		for i, v in self.badge do
			local var2, var3 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2, var65 = protoModule.writeString(var2, var3, i)
			local var4 = v:encode()
			var3, var67 = protoModule.writeTag(var2, var3, 2, protoModule.wireTypes.lengthDelimited)
			var3, var67 = protoModule.writeBuffer(var3, var67, var4, buffer.len(var4))
			local var5 = var3
			local var6 = var67
			local var7, var8 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var7, var71 = protoModule.writeBuffer(var7, var8, var5, var6)
			buff = var7
			var1 = var8
		end
	end
	if self.universe ~= nil and next(self.universe) ~= nil then
		for i, v in self.universe do
			local var9, var10 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var9, var73 = protoModule.writeString(var9, var10, i)
			local var11 = v:encode()
			var10, var75 = protoModule.writeTag(var9, var10, 2, protoModule.wireTypes.lengthDelimited)
			var10, var75 = protoModule.writeBuffer(var10, var75, var11, buffer.len(var11))
			local var12 = var10
			local var13 = var75
			local var14, var15 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var14, var79 = protoModule.writeBuffer(var14, var15, var12, var13)
			buff = var14
			var1 = var15
		end
	end
	if self.creator ~= nil and next(self.creator) ~= nil then
		for i, v in self.creator do
			local var16, var17 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var16, var81 = protoModule.writeString(var16, var17, i)
			local var18 = v:encode()
			var17, var83 = protoModule.writeTag(var16, var17, 2, protoModule.wireTypes.lengthDelimited)
			var17, var83 = protoModule.writeBuffer(var17, var83, var18, buffer.len(var18))
			local var19 = var17
			local var20 = var83
			local var21, var22 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var21, var87 = protoModule.writeBuffer(var21, var22, var19, var20)
			buff = var21
			var1 = var22
		end
	end
	if self.event ~= nil and next(self.event) ~= nil then
		for i, v in self.event do
			local var23, var24 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var23, var89 = protoModule.writeString(var23, var24, i)
			local var25 = v:encode()
			var24, var91 = protoModule.writeTag(var23, var24, 2, protoModule.wireTypes.lengthDelimited)
			var24, var91 = protoModule.writeBuffer(var24, var91, var25, buffer.len(var25))
			local var26 = var24
			local var27 = var91
			local var28, var29 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
			var28, var95 = protoModule.writeBuffer(var28, var29, var26, var27)
			buff = var28
			var1 = var29
		end
	end
	if self.song ~= nil and next(self.song) ~= nil then
		for i, v in self.song do
			local var30, var31 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var30, var97 = protoModule.writeString(var30, var31, i)
			local var32 = v:encode()
			var31, var99 = protoModule.writeTag(var30, var31, 2, protoModule.wireTypes.lengthDelimited)
			var31, var99 = protoModule.writeBuffer(var31, var99, var32, buffer.len(var32))
			local var33 = var31
			local var34 = var99
			local var35, var36 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
			var35, var103 = protoModule.writeBuffer(var35, var36, var33, var34)
			buff = var35
			var1 = var36
		end
	end
	if self.game_pass ~= nil and next(self.game_pass) ~= nil then
		for i, v in self.game_pass do
			local var37, var38 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var37, var105 = protoModule.writeString(var37, var38, i)
			local var39 = v:encode()
			var38, var107 = protoModule.writeTag(var37, var38, 2, protoModule.wireTypes.lengthDelimited)
			var38, var107 = protoModule.writeBuffer(var38, var107, var39, buffer.len(var39))
			local var40 = var38
			local var41 = var107
			local var42, var43 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
			var42, var111 = protoModule.writeBuffer(var42, var43, var40, var41)
			buff = var42
			var1 = var43
		end
	end
	if self.media_asset ~= nil and next(self.media_asset) ~= nil then
		for i, v in self.media_asset do
			local var44, var45 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var44, var113 = protoModule.writeString(var44, var45, i)
			local var46 = v:encode()
			var45, var115 = protoModule.writeTag(var44, var45, 2, protoModule.wireTypes.lengthDelimited)
			var45, var115 = protoModule.writeBuffer(var45, var115, var46, buffer.len(var46))
			local var47 = var45
			local var48 = var115
			local var49, var50 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
			var49, var119 = protoModule.writeBuffer(var49, var50, var47, var48)
			buff = var49
			var1 = var50
		end
	end
	if self.social_link ~= nil and next(self.social_link) ~= nil then
		for i, v in self.social_link do
			local var51, var52 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var51, var121 = protoModule.writeString(var51, var52, i)
			local var53 = v:encode()
			var52, var123 = protoModule.writeTag(var51, var52, 2, protoModule.wireTypes.lengthDelimited)
			var52, var123 = protoModule.writeBuffer(var52, var123, var53, buffer.len(var53))
			local var54 = var52
			local var55 = var123
			local var56, var57 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
			var56, var127 = protoModule.writeBuffer(var56, var57, var54, var55)
			buff = var56
			var1 = var57
		end
	end
	if self.game_developer_product ~= nil and next(self.game_developer_product) ~= nil then
		for i, v in self.game_developer_product do
			local var58, var59 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var58, var129 = protoModule.writeString(var58, var59, i)
			local var60 = v:encode()
			var59, var131 = protoModule.writeTag(var58, var59, 2, protoModule.wireTypes.lengthDelimited)
			var59, var131 = protoModule.writeBuffer(var59, var131, var60, buffer.len(var60))
			local var61 = var59
			local var62 = var131
			local var63, var64 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
			var63, var135 = protoModule.writeBuffer(var63, var64, var61, var62)
			buff = var63
			var1 = var64
		end
	end
	if self.game_subscription ~= nil and next(self.game_subscription) ~= nil then
		for i, v in self.game_subscription do
			local var65, var66 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var65, var137 = protoModule.writeString(var65, var66, i)
			local var67 = v:encode()
			var66, var139 = protoModule.writeTag(var65, var66, 2, protoModule.wireTypes.lengthDelimited)
			var66, var139 = protoModule.writeBuffer(var66, var139, var67, buffer.len(var67))
			local var68 = var66
			local var69 = var139
			local var70, var71 = protoModule.writeTag(buff, var1, 10, protoModule.wireTypes.lengthDelimited)
			var70, var143 = protoModule.writeBuffer(var70, var71, var68, var69)
			buff = var70
			var1 = var71
		end
	end
	if self.marketplace_catalog_category ~= nil and next(self.marketplace_catalog_category) ~= nil then
		for i, v in self.marketplace_catalog_category do
			local var72, var73 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var72, var145 = protoModule.writeString(var72, var73, i)
			local var74 = v:encode()
			var73, var147 = protoModule.writeTag(var72, var73, 2, protoModule.wireTypes.lengthDelimited)
			var73, var147 = protoModule.writeBuffer(var73, var147, var74, buffer.len(var74))
			local var75 = var73
			local var76 = var147
			local var77, var78 = protoModule.writeTag(buff, var1, 11, protoModule.wireTypes.lengthDelimited)
			var77, var151 = protoModule.writeBuffer(var77, var78, var75, var76)
			buff = var77
			var1 = var78
		end
	end
	if self.marketplace_asset ~= nil and next(self.marketplace_asset) ~= nil then
		for i, v in self.marketplace_asset do
			local var79, var80 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var79, var153 = protoModule.writeString(var79, var80, i)
			local var81 = v:encode()
			var80, var155 = protoModule.writeTag(var79, var80, 2, protoModule.wireTypes.lengthDelimited)
			var80, var155 = protoModule.writeBuffer(var80, var155, var81, buffer.len(var81))
			local var82 = var80
			local var83 = var155
			local var84, var85 = protoModule.writeTag(buff, var1, 12, protoModule.wireTypes.lengthDelimited)
			var84, var159 = protoModule.writeBuffer(var84, var85, var82, var83)
			buff = var84
			var1 = var85
		end
	end
	if self.marketplace_bundle ~= nil and next(self.marketplace_bundle) ~= nil then
		for i, v in self.marketplace_bundle do
			local var86, var87 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var86, var161 = protoModule.writeString(var86, var87, i)
			local var88 = v:encode()
			var87, var163 = protoModule.writeTag(var86, var87, 2, protoModule.wireTypes.lengthDelimited)
			var87, var163 = protoModule.writeBuffer(var87, var163, var88, buffer.len(var88))
			local var89 = var87
			local var90 = var163
			local var91, var92 = protoModule.writeTag(buff, var1, 13, protoModule.wireTypes.lengthDelimited)
			var91, var167 = protoModule.writeBuffer(var91, var92, var89, var90)
			buff = var91
			var1 = var92
		end
	end
	if self.marketplace_look ~= nil and next(self.marketplace_look) ~= nil then
		for i, v in self.marketplace_look do
			local var93, var94 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var93, var169 = protoModule.writeString(var93, var94, i)
			local var95 = v:encode()
			var94, var171 = protoModule.writeTag(var93, var94, 2, protoModule.wireTypes.lengthDelimited)
			var94, var171 = protoModule.writeBuffer(var94, var171, var95, buffer.len(var95))
			local var96 = var94
			local var97 = var171
			local var98, var99 = protoModule.writeTag(buff, var1, 14, protoModule.wireTypes.lengthDelimited)
			var98, var175 = protoModule.writeBuffer(var98, var99, var96, var97)
			buff = var98
			var1 = var99
		end
	end
	if self.catalog_sort ~= nil and next(self.catalog_sort) ~= nil then
		for i, v in self.catalog_sort do
			local var100, var101 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var100, var177 = protoModule.writeString(var100, var101, i)
			local var102 = v:encode()
			var101, var179 = protoModule.writeTag(var100, var101, 2, protoModule.wireTypes.lengthDelimited)
			var101, var179 = protoModule.writeBuffer(var101, var179, var102, buffer.len(var102))
			local var103 = var101
			local var104 = var179
			local var105, var106 = protoModule.writeTag(buff, var1, 15, protoModule.wireTypes.lengthDelimited)
			var105, var183 = protoModule.writeBuffer(var105, var106, var103, var104)
			buff = var105
			var1 = var106
		end
	end
	if self.age_recommendation ~= nil and next(self.age_recommendation) ~= nil then
		for i, v in self.age_recommendation do
			local var107, var108 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var107, var185 = protoModule.writeString(var107, var108, i)
			local var109 = v:encode()
			var108, var187 = protoModule.writeTag(var107, var108, 2, protoModule.wireTypes.lengthDelimited)
			var108, var187 = protoModule.writeBuffer(var108, var187, var109, buffer.len(var109))
			local var110 = var108
			local var111 = var187
			local var112, var113 = protoModule.writeTag(buff, var1, 16, protoModule.wireTypes.lengthDelimited)
			var112, var191 = protoModule.writeBuffer(var112, var113, var110, var111)
			buff = var112
			var1 = var113
		end
	end
	if self.universe_user_follow ~= nil and next(self.universe_user_follow) ~= nil then
		for i, v in self.universe_user_follow do
			local var114, var115 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var114, var193 = protoModule.writeString(var114, var115, i)
			local var116 = v:encode()
			var115, var195 = protoModule.writeTag(var114, var115, 2, protoModule.wireTypes.lengthDelimited)
			var115, var195 = protoModule.writeBuffer(var115, var195, var116, buffer.len(var116))
			local var117 = var115
			local var118 = var195
			local var119, var120 = protoModule.writeTag(buff, var1, 17, protoModule.wireTypes.lengthDelimited)
			var119, var199 = protoModule.writeBuffer(var119, var120, var117, var118)
			buff = var119
			var1 = var120
		end
	end
	if self.universe_user_vote ~= nil and next(self.universe_user_vote) ~= nil then
		for i, v in self.universe_user_vote do
			local var121, var122 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var121, var201 = protoModule.writeString(var121, var122, i)
			local var123 = v:encode()
			var122, var203 = protoModule.writeTag(var121, var122, 2, protoModule.wireTypes.lengthDelimited)
			var122, var203 = protoModule.writeBuffer(var122, var203, var123, buffer.len(var123))
			local var124 = var122
			local var125 = var203
			local var126, var127 = protoModule.writeTag(buff, var1, 18, protoModule.wireTypes.lengthDelimited)
			var126, var207 = protoModule.writeBuffer(var126, var127, var124, var125)
			buff = var126
			var1 = var127
		end
	end
	if self.user_profile ~= nil and next(self.user_profile) ~= nil then
		for i, v in self.user_profile do
			local var128, var129 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var128, var209 = protoModule.writeString(var128, var129, i)
			local var130 = v:encode()
			var129, var211 = protoModule.writeTag(var128, var129, 2, protoModule.wireTypes.lengthDelimited)
			var129, var211 = protoModule.writeBuffer(var129, var211, var130, buffer.len(var130))
			local var131 = var129
			local var132 = var211
			local var133, var134 = protoModule.writeTag(buff, var1, 19, protoModule.wireTypes.lengthDelimited)
			var133, var215 = protoModule.writeBuffer(var133, var134, var131, var132)
			buff = var133
			var1 = var134
		end
	end
	if self.universe_user_favorite ~= nil and next(self.universe_user_favorite) ~= nil then
		for i, v in self.universe_user_favorite do
			local var135, var136 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var135, var217 = protoModule.writeString(var135, var136, i)
			local var137 = v:encode()
			var136, var219 = protoModule.writeTag(var135, var136, 2, protoModule.wireTypes.lengthDelimited)
			var136, var219 = protoModule.writeBuffer(var136, var219, var137, buffer.len(var137))
			local var138 = var136
			local var139 = var219
			local var140, var141 = protoModule.writeTag(buff, var1, 20, protoModule.wireTypes.lengthDelimited)
			var140, var223 = protoModule.writeBuffer(var140, var141, var138, var139)
			buff = var140
			var1 = var141
		end
	end
	if self.playability ~= nil and next(self.playability) ~= nil then
		for i, v in self.playability do
			local var142, var143 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var142, var225 = protoModule.writeString(var142, var143, i)
			local var144 = v:encode()
			var143, var227 = protoModule.writeTag(var142, var143, 2, protoModule.wireTypes.lengthDelimited)
			var143, var227 = protoModule.writeBuffer(var143, var227, var144, buffer.len(var144))
			local var145 = var143
			local var146 = var227
			local var147, var148 = protoModule.writeTag(buff, var1, 21, protoModule.wireTypes.lengthDelimited)
			var147, var231 = protoModule.writeBuffer(var147, var148, var145, var146)
			buff = var147
			var1 = var148
		end
	end
	if self.universe_user_follow_limit ~= nil and next(self.universe_user_follow_limit) ~= nil then
		for i, v in self.universe_user_follow_limit do
			local var149, var150 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var149, var233 = protoModule.writeString(var149, var150, i)
			local var151 = v:encode()
			var150, var235 = protoModule.writeTag(var149, var150, 2, protoModule.wireTypes.lengthDelimited)
			var150, var235 = protoModule.writeBuffer(var150, var235, var151, buffer.len(var151))
			local var152 = var150
			local var153 = var235
			local var154, var155 = protoModule.writeTag(buff, var1, 22, protoModule.wireTypes.lengthDelimited)
			var154, var239 = protoModule.writeBuffer(var154, var155, var152, var153)
			buff = var154
			var1 = var155
		end
	end
	if self.universe_user_vote_feedback_metadata ~= nil and next(self.universe_user_vote_feedback_metadata) ~= nil then
		for i, v in self.universe_user_vote_feedback_metadata do
			local var156, var157 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var156, var241 = protoModule.writeString(var156, var157, i)
			local var158 = v:encode()
			var157, var243 = protoModule.writeTag(var156, var157, 2, protoModule.wireTypes.lengthDelimited)
			var157, var243 = protoModule.writeBuffer(var157, var243, var158, buffer.len(var158))
			local var159 = var157
			local var160 = var243
			local var161, var162 = protoModule.writeTag(buff, var1, 23, protoModule.wireTypes.lengthDelimited)
			var161, var247 = protoModule.writeBuffer(var161, var162, var159, var160)
			buff = var161
			var1 = var162
		end
	end
	if self.moment ~= nil and next(self.moment) ~= nil then
		for i, v in self.moment do
			local var163, var164 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var163, var249 = protoModule.writeString(var163, var164, i)
			local var165 = v:encode()
			var164, var251 = protoModule.writeTag(var163, var164, 2, protoModule.wireTypes.lengthDelimited)
			var164, var251 = protoModule.writeBuffer(var164, var251, var165, buffer.len(var165))
			local var166 = var164
			local var167 = var251
			local var168, var169 = protoModule.writeTag(buff, var1, 24, protoModule.wireTypes.lengthDelimited)
			var168, var255 = protoModule.writeBuffer(var168, var169, var166, var167)
			buff = var168
			var1 = var169
		end
	end
	if self.community ~= nil and next(self.community) ~= nil then
		for i, v in self.community do
			local var170, var171 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var170, var257 = protoModule.writeString(var170, var171, i)
			local var172 = v:encode()
			var171, var259 = protoModule.writeTag(var170, var171, 2, protoModule.wireTypes.lengthDelimited)
			var171, var259 = protoModule.writeBuffer(var171, var259, var172, buffer.len(var172))
			local var173 = var171
			local var174 = var259
			local var175, var176 = protoModule.writeTag(buff, var1, 25, protoModule.wireTypes.lengthDelimited)
			var175, var263 = protoModule.writeBuffer(var175, var176, var173, var174)
			buff = var175
			var1 = var176
		end
	end
	if self.community_user_membership ~= nil and next(self.community_user_membership) ~= nil then
		for i, v in self.community_user_membership do
			local var177, var178 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var177, var265 = protoModule.writeString(var177, var178, i)
			local var179 = v:encode()
			var178, var267 = protoModule.writeTag(var177, var178, 2, protoModule.wireTypes.lengthDelimited)
			var178, var267 = protoModule.writeBuffer(var178, var267, var179, buffer.len(var179))
			local var180 = var178
			local var181 = var267
			local var182, var183 = protoModule.writeTag(buff, var1, 26, protoModule.wireTypes.lengthDelimited)
			var182, var271 = protoModule.writeBuffer(var182, var183, var180, var181)
			buff = var182
			var1 = var183
		end
	end
	if self.friend_recommendation ~= nil and next(self.friend_recommendation) ~= nil then
		for i, v in self.friend_recommendation do
			local var184, var185 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var184, var273 = protoModule.writeString(var184, var185, i)
			local var186 = v:encode()
			var185, var275 = protoModule.writeTag(var184, var185, 2, protoModule.wireTypes.lengthDelimited)
			var185, var275 = protoModule.writeBuffer(var185, var275, var186, buffer.len(var186))
			local var187 = var185
			local var188 = var275
			local var189, var190 = protoModule.writeTag(buff, var1, 27, protoModule.wireTypes.lengthDelimited)
			var189, var279 = protoModule.writeBuffer(var189, var190, var187, var188)
			buff = var189
			var1 = var190
		end
	end
	if self.universe_private_server ~= nil and next(self.universe_private_server) ~= nil then
		for i, v in self.universe_private_server do
			local var191, var192 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var191, var281 = protoModule.writeString(var191, var192, i)
			local var193 = v:encode()
			var192, var283 = protoModule.writeTag(var191, var192, 2, protoModule.wireTypes.lengthDelimited)
			var192, var283 = protoModule.writeBuffer(var192, var283, var193, buffer.len(var193))
			local var194 = var192
			local var195 = var283
			local var196, var197 = protoModule.writeTag(buff, var1, 28, protoModule.wireTypes.lengthDelimited)
			var196, var287 = protoModule.writeBuffer(var196, var197, var194, var195)
			buff = var196
			var1 = var197
		end
	end
	if self.notification_badge ~= nil and next(self.notification_badge) ~= nil then
		for i, v in self.notification_badge do
			local var198, var199 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var198, var289 = protoModule.writeString(var198, var199, i)
			local var200 = v:encode()
			var199, var291 = protoModule.writeTag(var198, var199, 2, protoModule.wireTypes.lengthDelimited)
			var199, var291 = protoModule.writeBuffer(var199, var291, var200, buffer.len(var200))
			local var201 = var199
			local var202 = var291
			local var203, var204 = protoModule.writeTag(buff, var1, 29, protoModule.wireTypes.lengthDelimited)
			var203, var295 = protoModule.writeBuffer(var203, var204, var201, var202)
			buff = var203
			var1 = var204
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), t (ref), badgeDataModule (ref), universeDataModule (ref), creatorDataModule (ref), eventDataModule (ref), songDataModule (ref), gamePassDataModule (ref), mediaAssetDataModule (ref), socialLinkDataModule (ref), gameDeveloperProductDataModule (ref), gameSubscriptionDataModule (ref), marketplaceCatalogCategoryDataModule (ref), marketplaceAssetDataModule (ref), marketplaceBundleDataModule (ref), marketplaceLookDataModule (ref), catalogSortDataModule (ref), ageRecommendationDataModule (ref), universeUserFollowDataModule (ref), universeUserVoteDataModule (ref), userProfileDataModule (ref), universeUserFavoriteDataModule (ref), playabilityDataModule (ref), universeUserFollowLimitDataModule (ref), universeUserVoteFeedbackMetadataDataModule (ref), momentDataModule (ref), communityDataModule (ref), communityUserMembershipDataModule (ref), friendRecommendationDataModule (ref), universePrivateServerDataModule (ref), notificationBadgeDataModule (ref)
	local var205 = t_1.new()
	local var206 = 0
	while var206 < buffer.len(p1) do
		local _ = nil
		local var207 = nil
		local var208, var209, var210 = protoModule.readTag(p1, var206)
		local var211 = var208
		var207 = var209
		var206 = var210
		
		if var207 == protoModule.wireTypes.varint then
			local _ = nil
			local var212, var213 = protoModule.readVarInt(p1, var206)
			local _ = var212
			var206 = var213
			continue
		end
		if var207 == protoModule.wireTypes.lengthDelimited then
			if var211 == 1 then
				local _ = nil
				local var214, var215 = protoModule.readBuffer(p1, var206)
				var206 = var215
				var214 = t.HydrationContent_BadgeEntry.decode(var214)
				var205.badge[var214.key or ""] = var214.value or badgeDataModule.BadgeData.new()
			elseif var211 == 2 then
				local _ = nil
				local var216, var217 = protoModule.readBuffer(p1, var206)
				var206 = var217
				var216 = t.HydrationContent_UniverseEntry.decode(var216)
				var205.universe[var216.key or ""] = var216.value or universeDataModule.UniverseData.new()
			elseif var211 == 3 then
				local _ = nil
				local var218, var219 = protoModule.readBuffer(p1, var206)
				var206 = var219
				var218 = t.HydrationContent_CreatorEntry.decode(var218)
				var205.creator[var218.key or ""] = var218.value or creatorDataModule.CreatorData.new()
			elseif var211 == 4 then
				local _ = nil
				local var220, var221 = protoModule.readBuffer(p1, var206)
				var206 = var221
				var220 = t.HydrationContent_EventEntry.decode(var220)
				var205.event[var220.key or ""] = var220.value or eventDataModule.EventData.new()
			elseif var211 == 5 then
				local _ = nil
				local var222, var223 = protoModule.readBuffer(p1, var206)
				var206 = var223
				var222 = t.HydrationContent_SongEntry.decode(var222)
				var205.song[var222.key or ""] = var222.value or songDataModule.SongData.new()
			elseif var211 == 6 then
				local _ = nil
				local var224, var225 = protoModule.readBuffer(p1, var206)
				var206 = var225
				var224 = t.HydrationContent_GamePassEntry.decode(var224)
				var205.game_pass[var224.key or ""] = var224.value or gamePassDataModule.GamePassData.new()
			elseif var211 == 7 then
				local _ = nil
				local var226, var227 = protoModule.readBuffer(p1, var206)
				var206 = var227
				var226 = t.HydrationContent_MediaAssetEntry.decode(var226)
				var205.media_asset[var226.key or ""] = var226.value or mediaAssetDataModule.MediaAssetData.new()
			elseif var211 == 8 then
				local _ = nil
				local var228, var229 = protoModule.readBuffer(p1, var206)
				var206 = var229
				var228 = t.HydrationContent_SocialLinkEntry.decode(var228)
				var205.social_link[var228.key or ""] = var228.value or socialLinkDataModule.SocialLinkData.new()
			elseif var211 == 9 then
				local _ = nil
				local var230, var231 = protoModule.readBuffer(p1, var206)
				var206 = var231
				var230 = t.HydrationContent_GameDeveloperProductEntry.decode(var230)
				var205.game_developer_product[var230.key or ""] = var230.value or gameDeveloperProductDataModule.GameDeveloperProductData.new()
			elseif var211 == 10 then
				local _ = nil
				local var232, var233 = protoModule.readBuffer(p1, var206)
				var206 = var233
				var232 = t.HydrationContent_GameSubscriptionEntry.decode(var232)
				var205.game_subscription[var232.key or ""] = var232.value or gameSubscriptionDataModule.GameSubscriptionData.new()
			elseif var211 == 11 then
				local _ = nil
				local var234, var235 = protoModule.readBuffer(p1, var206)
				var206 = var235
				var234 = t.HydrationContent_MarketplaceCatalogCategoryEntry.decode(var234)
				var205.marketplace_catalog_category[var234.key or ""] = var234.value or marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.new()
			elseif var211 == 12 then
				local _ = nil
				local var236, var237 = protoModule.readBuffer(p1, var206)
				var206 = var237
				var236 = t.HydrationContent_MarketplaceAssetEntry.decode(var236)
				var205.marketplace_asset[var236.key or ""] = var236.value or marketplaceAssetDataModule.MarketplaceAssetData.new()
			elseif var211 == 13 then
				local _ = nil
				local var238, var239 = protoModule.readBuffer(p1, var206)
				var206 = var239
				var238 = t.HydrationContent_MarketplaceBundleEntry.decode(var238)
				var205.marketplace_bundle[var238.key or ""] = var238.value or marketplaceBundleDataModule.MarketplaceBundleData.new()
			elseif var211 == 14 then
				local _ = nil
				local var240, var241 = protoModule.readBuffer(p1, var206)
				var206 = var241
				var240 = t.HydrationContent_MarketplaceLookEntry.decode(var240)
				var205.marketplace_look[var240.key or ""] = var240.value or marketplaceLookDataModule.MarketplaceLookData.new()
			elseif var211 == 15 then
				local _ = nil
				local var242, var243 = protoModule.readBuffer(p1, var206)
				var206 = var243
				var242 = t.HydrationContent_CatalogSortEntry.decode(var242)
				var205.catalog_sort[var242.key or ""] = var242.value or catalogSortDataModule.CatalogSortData.new()
			elseif var211 == 16 then
				local _ = nil
				local var244, var245 = protoModule.readBuffer(p1, var206)
				var206 = var245
				var244 = t.HydrationContent_AgeRecommendationEntry.decode(var244)
				var205.age_recommendation[var244.key or ""] = var244.value or ageRecommendationDataModule.AgeRecommendationData.new()
			elseif var211 == 17 then
				local _ = nil
				local var246, var247 = protoModule.readBuffer(p1, var206)
				var206 = var247
				var246 = t.HydrationContent_UniverseUserFollowEntry.decode(var246)
				var205.universe_user_follow[var246.key or ""] = var246.value or universeUserFollowDataModule.UniverseUserFollowData.new()
			elseif var211 == 18 then
				local _ = nil
				local var248, var249 = protoModule.readBuffer(p1, var206)
				var206 = var249
				var248 = t.HydrationContent_UniverseUserVoteEntry.decode(var248)
				var205.universe_user_vote[var248.key or ""] = var248.value or universeUserVoteDataModule.UniverseUserVoteData.new()
			elseif var211 == 19 then
				local _ = nil
				local var250, var251 = protoModule.readBuffer(p1, var206)
				var206 = var251
				var250 = t.HydrationContent_UserProfileEntry.decode(var250)
				var205.user_profile[var250.key or ""] = var250.value or userProfileDataModule.UserProfileData.new()
			elseif var211 == 20 then
				local _ = nil
				local var252, var253 = protoModule.readBuffer(p1, var206)
				var206 = var253
				var252 = t.HydrationContent_UniverseUserFavoriteEntry.decode(var252)
				var205.universe_user_favorite[var252.key or ""] = var252.value or universeUserFavoriteDataModule.UniverseUserFavoriteData.new()
			elseif var211 == 21 then
				local _ = nil
				local var254, var255 = protoModule.readBuffer(p1, var206)
				var206 = var255
				var254 = t.HydrationContent_PlayabilityEntry.decode(var254)
				var205.playability[var254.key or ""] = var254.value or playabilityDataModule.PlayabilityData.new()
			elseif var211 == 22 then
				local _ = nil
				local var256, var257 = protoModule.readBuffer(p1, var206)
				var206 = var257
				var256 = t.HydrationContent_UniverseUserFollowLimitEntry.decode(var256)
				var205.universe_user_follow_limit[var256.key or ""] = var256.value or universeUserFollowLimitDataModule.UniverseUserFollowLimitData.new()
			elseif var211 == 23 then
				local _ = nil
				local var258, var259 = protoModule.readBuffer(p1, var206)
				var206 = var259
				var258 = t.HydrationContent_UniverseUserVoteFeedbackMetadataEntry.decode(var258)
				var205.universe_user_vote_feedback_metadata[var258.key or ""] = var258.value or universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.new()
			elseif var211 == 24 then
				local _ = nil
				local var260, var261 = protoModule.readBuffer(p1, var206)
				var206 = var261
				var260 = t.HydrationContent_MomentEntry.decode(var260)
				var205.moment[var260.key or ""] = var260.value or momentDataModule.MomentData.new()
			elseif var211 == 25 then
				local _ = nil
				local var262, var263 = protoModule.readBuffer(p1, var206)
				var206 = var263
				var262 = t.HydrationContent_CommunityEntry.decode(var262)
				var205.community[var262.key or ""] = var262.value or communityDataModule.CommunityData.new()
			elseif var211 == 26 then
				local _ = nil
				local var264, var265 = protoModule.readBuffer(p1, var206)
				var206 = var265
				var264 = t.HydrationContent_CommunityUserMembershipEntry.decode(var264)
				var205.community_user_membership[var264.key or ""] = var264.value or communityUserMembershipDataModule.CommunityUserMembershipData.new()
			elseif var211 == 27 then
				local _ = nil
				local var266, var267 = protoModule.readBuffer(p1, var206)
				var206 = var267
				var266 = t.HydrationContent_FriendRecommendationEntry.decode(var266)
				var205.friend_recommendation[var266.key or ""] = var266.value or friendRecommendationDataModule.FriendRecommendationData.new()
			elseif var211 == 28 then
				local _ = nil
				local var268, var269 = protoModule.readBuffer(p1, var206)
				var206 = var269
				var268 = t.HydrationContent_UniversePrivateServerEntry.decode(var268)
				var205.universe_private_server[var268.key or ""] = var268.value or universePrivateServerDataModule.UniversePrivateServerData.new()
			elseif var211 == 29 then
				local _ = nil
				local var270, var271 = protoModule.readBuffer(p1, var206)
				var206 = var271
				var270 = t.HydrationContent_NotificationBadgeEntry.decode(var270)
				var205.notification_badge[var270.key or ""] = var270.value or notificationBadgeDataModule.NotificationBadgeData.new()
			else
				local _ = nil
				local var272, var273 = protoModule.readVarInt(p1, var206)
				var206 = var273 + var272
			end
		elseif var207 == protoModule.wireTypes.i32 then
			local _ = nil
			local var274, var275 = protoModule.readFixed32(p1, var206)
			local _ = var274
			var206 = var275
		elseif var207 == protoModule.wireTypes.i64 then
			local _ = nil
			local var276, var277 = protoModule.readFixed64(p1, var206)
			local _ = var276
			var206 = var277
		else
			error("Unsupported wire type: " .. var299)
		end
	end
	return var205
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
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), badgeDataModule (ref), universeDataModule (ref), creatorDataModule (ref), eventDataModule (ref), songDataModule (ref), gamePassDataModule (ref), mediaAssetDataModule (ref), socialLinkDataModule (ref), gameDeveloperProductDataModule (ref), gameSubscriptionDataModule (ref), marketplaceCatalogCategoryDataModule (ref), marketplaceAssetDataModule (ref), marketplaceBundleDataModule (ref), marketplaceLookDataModule (ref), catalogSortDataModule (ref), ageRecommendationDataModule (ref), universeUserFollowDataModule (ref), universeUserVoteDataModule (ref), userProfileDataModule (ref), universeUserFavoriteDataModule (ref), playabilityDataModule (ref), universeUserFollowLimitDataModule (ref), universeUserVoteFeedbackMetadataDataModule (ref), momentDataModule (ref), communityDataModule (ref), communityUserMembershipDataModule (ref), friendRecommendationDataModule (ref), universePrivateServerDataModule (ref), notificationBadgeDataModule (ref)
	local var278 = t_1.new()
	
	if self.badge ~= nil then
		local t = {}
		
		for i, v in self.badge do
			t[i] = badgeDataModule.BadgeData.jsonDecode(v)
		end
		var278.badge = t
	end
	if self.universe ~= nil then
		local t = {}
		
		for i, v in self.universe do
			t[i] = universeDataModule.UniverseData.jsonDecode(v)
		end
		var278.universe = t
	end
	if self.creator ~= nil then
		local t = {}
		
		for i, v in self.creator do
			t[i] = creatorDataModule.CreatorData.jsonDecode(v)
		end
		var278.creator = t
	end
	if self.event ~= nil then
		local t = {}
		
		for i, v in self.event do
			t[i] = eventDataModule.EventData.jsonDecode(v)
		end
		var278.event = t
	end
	if self.song ~= nil then
		local t = {}
		
		for i, v in self.song do
			t[i] = songDataModule.SongData.jsonDecode(v)
		end
		var278.song = t
	end
	if self.game_pass ~= nil then
		local t = {}
		
		for i, v in self.game_pass do
			t[i] = gamePassDataModule.GamePassData.jsonDecode(v)
		end
		var278.game_pass = t
	end
	if self.gamePass ~= nil then
		local t = {}
		
		for i, v in self.gamePass do
			t[i] = gamePassDataModule.GamePassData.jsonDecode(v)
		end
		var278.game_pass = t
	end
	if self.media_asset ~= nil then
		local t = {}
		
		for i, v in self.media_asset do
			t[i] = mediaAssetDataModule.MediaAssetData.jsonDecode(v)
		end
		var278.media_asset = t
	end
	if self.mediaAsset ~= nil then
		local t = {}
		
		for i, v in self.mediaAsset do
			t[i] = mediaAssetDataModule.MediaAssetData.jsonDecode(v)
		end
		var278.media_asset = t
	end
	if self.social_link ~= nil then
		local t = {}
		
		for i, v in self.social_link do
			t[i] = socialLinkDataModule.SocialLinkData.jsonDecode(v)
		end
		var278.social_link = t
	end
	if self.socialLink ~= nil then
		local t = {}
		
		for i, v in self.socialLink do
			t[i] = socialLinkDataModule.SocialLinkData.jsonDecode(v)
		end
		var278.social_link = t
	end
	if self.game_developer_product ~= nil then
		local t = {}
		
		for i, v in self.game_developer_product do
			t[i] = gameDeveloperProductDataModule.GameDeveloperProductData.jsonDecode(v)
		end
		var278.game_developer_product = t
	end
	if self.gameDeveloperProduct ~= nil then
		local t = {}
		
		for i, v in self.gameDeveloperProduct do
			t[i] = gameDeveloperProductDataModule.GameDeveloperProductData.jsonDecode(v)
		end
		var278.game_developer_product = t
	end
	if self.game_subscription ~= nil then
		local t = {}
		
		for i, v in self.game_subscription do
			t[i] = gameSubscriptionDataModule.GameSubscriptionData.jsonDecode(v)
		end
		var278.game_subscription = t
	end
	if self.gameSubscription ~= nil then
		local t = {}
		
		for i, v in self.gameSubscription do
			t[i] = gameSubscriptionDataModule.GameSubscriptionData.jsonDecode(v)
		end
		var278.game_subscription = t
	end
	if self.marketplace_catalog_category ~= nil then
		local t = {}
		
		for i, v in self.marketplace_catalog_category do
			t[i] = marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.jsonDecode(v)
		end
		var278.marketplace_catalog_category = t
	end
	if self.marketplaceCatalogCategory ~= nil then
		local t = {}
		
		for i, v in self.marketplaceCatalogCategory do
			t[i] = marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.jsonDecode(v)
		end
		var278.marketplace_catalog_category = t
	end
	if self.marketplace_asset ~= nil then
		local t = {}
		
		for i, v in self.marketplace_asset do
			t[i] = marketplaceAssetDataModule.MarketplaceAssetData.jsonDecode(v)
		end
		var278.marketplace_asset = t
	end
	if self.marketplaceAsset ~= nil then
		local t = {}
		
		for i, v in self.marketplaceAsset do
			t[i] = marketplaceAssetDataModule.MarketplaceAssetData.jsonDecode(v)
		end
		var278.marketplace_asset = t
	end
	if self.marketplace_bundle ~= nil then
		local t = {}
		
		for i, v in self.marketplace_bundle do
			t[i] = marketplaceBundleDataModule.MarketplaceBundleData.jsonDecode(v)
		end
		var278.marketplace_bundle = t
	end
	if self.marketplaceBundle ~= nil then
		local t = {}
		
		for i, v in self.marketplaceBundle do
			t[i] = marketplaceBundleDataModule.MarketplaceBundleData.jsonDecode(v)
		end
		var278.marketplace_bundle = t
	end
	if self.marketplace_look ~= nil then
		local t = {}
		
		for i, v in self.marketplace_look do
			t[i] = marketplaceLookDataModule.MarketplaceLookData.jsonDecode(v)
		end
		var278.marketplace_look = t
	end
	if self.marketplaceLook ~= nil then
		local t = {}
		
		for i, v in self.marketplaceLook do
			t[i] = marketplaceLookDataModule.MarketplaceLookData.jsonDecode(v)
		end
		var278.marketplace_look = t
	end
	if self.catalog_sort ~= nil then
		local t = {}
		
		for i, v in self.catalog_sort do
			t[i] = catalogSortDataModule.CatalogSortData.jsonDecode(v)
		end
		var278.catalog_sort = t
	end
	if self.catalogSort ~= nil then
		local t = {}
		
		for i, v in self.catalogSort do
			t[i] = catalogSortDataModule.CatalogSortData.jsonDecode(v)
		end
		var278.catalog_sort = t
	end
	if self.age_recommendation ~= nil then
		local t = {}
		
		for i, v in self.age_recommendation do
			t[i] = ageRecommendationDataModule.AgeRecommendationData.jsonDecode(v)
		end
		var278.age_recommendation = t
	end
	if self.ageRecommendation ~= nil then
		local t = {}
		
		for i, v in self.ageRecommendation do
			t[i] = ageRecommendationDataModule.AgeRecommendationData.jsonDecode(v)
		end
		var278.age_recommendation = t
	end
	if self.universe_user_follow ~= nil then
		local t = {}
		
		for i, v in self.universe_user_follow do
			t[i] = universeUserFollowDataModule.UniverseUserFollowData.jsonDecode(v)
		end
		var278.universe_user_follow = t
	end
	if self.universeUserFollow ~= nil then
		local t = {}
		
		for i, v in self.universeUserFollow do
			t[i] = universeUserFollowDataModule.UniverseUserFollowData.jsonDecode(v)
		end
		var278.universe_user_follow = t
	end
	if self.universe_user_vote ~= nil then
		local t = {}
		
		for i, v in self.universe_user_vote do
			t[i] = universeUserVoteDataModule.UniverseUserVoteData.jsonDecode(v)
		end
		var278.universe_user_vote = t
	end
	if self.universeUserVote ~= nil then
		local t = {}
		
		for i, v in self.universeUserVote do
			t[i] = universeUserVoteDataModule.UniverseUserVoteData.jsonDecode(v)
		end
		var278.universe_user_vote = t
	end
	if self.user_profile ~= nil then
		local t = {}
		
		for i, v in self.user_profile do
			t[i] = userProfileDataModule.UserProfileData.jsonDecode(v)
		end
		var278.user_profile = t
	end
	if self.userProfile ~= nil then
		local t = {}
		
		for i, v in self.userProfile do
			t[i] = userProfileDataModule.UserProfileData.jsonDecode(v)
		end
		var278.user_profile = t
	end
	if self.universe_user_favorite ~= nil then
		local t = {}
		
		for i, v in self.universe_user_favorite do
			t[i] = universeUserFavoriteDataModule.UniverseUserFavoriteData.jsonDecode(v)
		end
		var278.universe_user_favorite = t
	end
	if self.universeUserFavorite ~= nil then
		local t = {}
		
		for i, v in self.universeUserFavorite do
			t[i] = universeUserFavoriteDataModule.UniverseUserFavoriteData.jsonDecode(v)
		end
		var278.universe_user_favorite = t
	end
	if self.playability ~= nil then
		local t = {}
		
		for i, v in self.playability do
			t[i] = playabilityDataModule.PlayabilityData.jsonDecode(v)
		end
		var278.playability = t
	end
	if self.universe_user_follow_limit ~= nil then
		local t = {}
		
		for i, v in self.universe_user_follow_limit do
			t[i] = universeUserFollowLimitDataModule.UniverseUserFollowLimitData.jsonDecode(v)
		end
		var278.universe_user_follow_limit = t
	end
	if self.universeUserFollowLimit ~= nil then
		local t = {}
		
		for i, v in self.universeUserFollowLimit do
			t[i] = universeUserFollowLimitDataModule.UniverseUserFollowLimitData.jsonDecode(v)
		end
		var278.universe_user_follow_limit = t
	end
	if self.universe_user_vote_feedback_metadata ~= nil then
		local t = {}
		
		for i, v in self.universe_user_vote_feedback_metadata do
			t[i] = universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.jsonDecode(v)
		end
		var278.universe_user_vote_feedback_metadata = t
	end
	if self.universeUserVoteFeedbackMetadata ~= nil then
		local t = {}
		
		for i, v in self.universeUserVoteFeedbackMetadata do
			t[i] = universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.jsonDecode(v)
		end
		var278.universe_user_vote_feedback_metadata = t
	end
	if self.moment ~= nil then
		local t = {}
		
		for i, v in self.moment do
			t[i] = momentDataModule.MomentData.jsonDecode(v)
		end
		var278.moment = t
	end
	if self.community ~= nil then
		local t = {}
		
		for i, v in self.community do
			t[i] = communityDataModule.CommunityData.jsonDecode(v)
		end
		var278.community = t
	end
	if self.community_user_membership ~= nil then
		local t = {}
		
		for i, v in self.community_user_membership do
			t[i] = communityUserMembershipDataModule.CommunityUserMembershipData.jsonDecode(v)
		end
		var278.community_user_membership = t
	end
	if self.communityUserMembership ~= nil then
		local t = {}
		
		for i, v in self.communityUserMembership do
			t[i] = communityUserMembershipDataModule.CommunityUserMembershipData.jsonDecode(v)
		end
		var278.community_user_membership = t
	end
	if self.friend_recommendation ~= nil then
		local t = {}
		
		for i, v in self.friend_recommendation do
			t[i] = friendRecommendationDataModule.FriendRecommendationData.jsonDecode(v)
		end
		var278.friend_recommendation = t
	end
	if self.friendRecommendation ~= nil then
		local t = {}
		
		for i, v in self.friendRecommendation do
			t[i] = friendRecommendationDataModule.FriendRecommendationData.jsonDecode(v)
		end
		var278.friend_recommendation = t
	end
	if self.universe_private_server ~= nil then
		local t = {}
		
		for i, v in self.universe_private_server do
			t[i] = universePrivateServerDataModule.UniversePrivateServerData.jsonDecode(v)
		end
		var278.universe_private_server = t
	end
	if self.universePrivateServer ~= nil then
		local t = {}
		
		for i, v in self.universePrivateServer do
			t[i] = universePrivateServerDataModule.UniversePrivateServerData.jsonDecode(v)
		end
		var278.universe_private_server = t
	end
	if self.notification_badge ~= nil then
		local t = {}
		
		for i, v in self.notification_badge do
			t[i] = notificationBadgeDataModule.NotificationBadgeData.jsonDecode(v)
		end
		var278.notification_badge = t
	end
	if self.notificationBadge ~= nil then
		local t = {}
		
		for i, v in self.notificationBadge do
			t[i] = notificationBadgeDataModule.NotificationBadgeData.jsonDecode(v)
		end
		var278.notification_badge = t
	end
	return var278
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
	local var279 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var280, var281 = protoModule.writeTag(buff, var279, 1, protoModule.wireTypes.lengthDelimited)
		var280, var454 = protoModule.writeString(var280, var281, self.key)
		buff = var280
		var279 = var281
	end
	if self.value ~= nil then
		local var282 = self.value:encode()
		local var283, var284 = protoModule.writeTag(buff, var279, 2, protoModule.wireTypes.lengthDelimited)
		var283, var457 = protoModule.writeBuffer(var283, var284, var282, buffer.len(var282))
		buff = var283
		var279 = var284
	end
	local buff_1 = buffer.create(var279)
	buffer.copy(buff_1, 0, buff, 0, var279)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), badgeDataModule (ref)
	local var279 = t_2.new()
	local var280 = 0
	while var280 < buffer.len(p2) do
		local _ = nil
		local var281 = nil
		local var282, var283, var284 = protoModule.readTag(p2, var280)
		local var285 = var282
		var281 = var283
		var280 = var284
		
		if var281 == protoModule.wireTypes.varint then
			local _ = nil
			local var286, var287 = protoModule.readVarInt(p2, var280)
			local _ = var286
			var280 = var287
			continue
		end
		if var281 == protoModule.wireTypes.lengthDelimited then
			if var285 == 1 then
				local _ = nil
				local var288, var289 = protoModule.readBuffer(p2, var280)
				var280 = var289
				var279.key = buffer.tostring(var288)
			elseif var285 == 2 then
				local _ = nil
				local var290, var291 = protoModule.readBuffer(p2, var280)
				var280 = var291
				var279.value = badgeDataModule.BadgeData.decode(var290)
			else
				local _ = nil
				local var292, var293 = protoModule.readVarInt(p2, var280)
				var280 = var293 + var292
			end
		elseif var281 == protoModule.wireTypes.i32 then
			local _ = nil
			local var294, var295 = protoModule.readFixed32(p2, var280)
			local _ = var294
			var280 = var295
		elseif var281 == protoModule.wireTypes.i64 then
			local _ = nil
			local var296, var297 = protoModule.readFixed64(p2, var280)
			local _ = var296
			var280 = var297
		else
			error("Unsupported wire type: " .. var461)
		end
	end
	return var279
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
	local var298 = t_2.new()
	
	if self.key ~= nil then
		var298.key = self.key
	end
	if self.value ~= nil then
		var298.value = badgeDataModule.BadgeData.jsonDecode(self.value)
	end
	return var298
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
	local var298 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var299, var300 = protoModule.writeTag(buff, var298, 1, protoModule.wireTypes.lengthDelimited)
		var299, var483 = protoModule.writeString(var299, var300, self.key)
		buff = var299
		var298 = var300
	end
	if self.value ~= nil then
		local var301 = self.value:encode()
		local var302, var303 = protoModule.writeTag(buff, var298, 2, protoModule.wireTypes.lengthDelimited)
		var302, var486 = protoModule.writeBuffer(var302, var303, var301, buffer.len(var301))
		buff = var302
		var298 = var303
	end
	local buff_1 = buffer.create(var298)
	buffer.copy(buff_1, 0, buff, 0, var298)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), universeDataModule (ref)
	local var298 = t_3.new()
	local var299 = 0
	while var299 < buffer.len(p3) do
		local _ = nil
		local var300 = nil
		local var301, var302, var303 = protoModule.readTag(p3, var299)
		local var304 = var301
		var300 = var302
		var299 = var303
		
		if var300 == protoModule.wireTypes.varint then
			local _ = nil
			local var305, var306 = protoModule.readVarInt(p3, var299)
			local _ = var305
			var299 = var306
			continue
		end
		if var300 == protoModule.wireTypes.lengthDelimited then
			if var304 == 1 then
				local _ = nil
				local var307, var308 = protoModule.readBuffer(p3, var299)
				var299 = var308
				var298.key = buffer.tostring(var307)
			elseif var304 == 2 then
				local _ = nil
				local var309, var310 = protoModule.readBuffer(p3, var299)
				var299 = var310
				var298.value = universeDataModule.UniverseData.decode(var309)
			else
				local _ = nil
				local var311, var312 = protoModule.readVarInt(p3, var299)
				var299 = var312 + var311
			end
		elseif var300 == protoModule.wireTypes.i32 then
			local _ = nil
			local var313, var314 = protoModule.readFixed32(p3, var299)
			local _ = var313
			var299 = var314
		elseif var300 == protoModule.wireTypes.i64 then
			local _ = nil
			local var315, var316 = protoModule.readFixed64(p3, var299)
			local _ = var315
			var299 = var316
		else
			error("Unsupported wire type: " .. var490)
		end
	end
	return var298
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
	local var317 = t_3.new()
	
	if self.key ~= nil then
		var317.key = self.key
	end
	if self.value ~= nil then
		var317.value = universeDataModule.UniverseData.jsonDecode(self.value)
	end
	return var317
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
	local var317 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var318, var319 = protoModule.writeTag(buff, var317, 1, protoModule.wireTypes.lengthDelimited)
		var318, var512 = protoModule.writeString(var318, var319, self.key)
		buff = var318
		var317 = var319
	end
	if self.value ~= nil then
		local var320 = self.value:encode()
		local var321, var322 = protoModule.writeTag(buff, var317, 2, protoModule.wireTypes.lengthDelimited)
		var321, var515 = protoModule.writeBuffer(var321, var322, var320, buffer.len(var320))
		buff = var321
		var317 = var322
	end
	local buff_1 = buffer.create(var317)
	buffer.copy(buff_1, 0, buff, 0, var317)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), creatorDataModule (ref)
	local var317 = t_4.new()
	local var318 = 0
	while var318 < buffer.len(p4) do
		local _ = nil
		local var319 = nil
		local var320, var321, var322 = protoModule.readTag(p4, var318)
		local var323 = var320
		var319 = var321
		var318 = var322
		
		if var319 == protoModule.wireTypes.varint then
			local _ = nil
			local var324, var325 = protoModule.readVarInt(p4, var318)
			local _ = var324
			var318 = var325
			continue
		end
		if var319 == protoModule.wireTypes.lengthDelimited then
			if var323 == 1 then
				local _ = nil
				local var326, var327 = protoModule.readBuffer(p4, var318)
				var318 = var327
				var317.key = buffer.tostring(var326)
			elseif var323 == 2 then
				local _ = nil
				local var328, var329 = protoModule.readBuffer(p4, var318)
				var318 = var329
				var317.value = creatorDataModule.CreatorData.decode(var328)
			else
				local _ = nil
				local var330, var331 = protoModule.readVarInt(p4, var318)
				var318 = var331 + var330
			end
		elseif var319 == protoModule.wireTypes.i32 then
			local _ = nil
			local var332, var333 = protoModule.readFixed32(p4, var318)
			local _ = var332
			var318 = var333
		elseif var319 == protoModule.wireTypes.i64 then
			local _ = nil
			local var334, var335 = protoModule.readFixed64(p4, var318)
			local _ = var334
			var318 = var335
		else
			error("Unsupported wire type: " .. var519)
		end
	end
	return var317
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
	local var336 = t_4.new()
	
	if self.key ~= nil then
		var336.key = self.key
	end
	if self.value ~= nil then
		var336.value = creatorDataModule.CreatorData.jsonDecode(self.value)
	end
	return var336
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
	local var336 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var337, var338 = protoModule.writeTag(buff, var336, 1, protoModule.wireTypes.lengthDelimited)
		var337, var541 = protoModule.writeString(var337, var338, self.key)
		buff = var337
		var336 = var338
	end
	if self.value ~= nil then
		local var339 = self.value:encode()
		local var340, var341 = protoModule.writeTag(buff, var336, 2, protoModule.wireTypes.lengthDelimited)
		var340, var544 = protoModule.writeBuffer(var340, var341, var339, buffer.len(var339))
		buff = var340
		var336 = var341
	end
	local buff_1 = buffer.create(var336)
	buffer.copy(buff_1, 0, buff, 0, var336)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref), eventDataModule (ref)
	local var336 = t_5.new()
	local var337 = 0
	while var337 < buffer.len(p5) do
		local _ = nil
		local var338 = nil
		local var339, var340, var341 = protoModule.readTag(p5, var337)
		local var342 = var339
		var338 = var340
		var337 = var341
		
		if var338 == protoModule.wireTypes.varint then
			local _ = nil
			local var343, var344 = protoModule.readVarInt(p5, var337)
			local _ = var343
			var337 = var344
			continue
		end
		if var338 == protoModule.wireTypes.lengthDelimited then
			if var342 == 1 then
				local _ = nil
				local var345, var346 = protoModule.readBuffer(p5, var337)
				var337 = var346
				var336.key = buffer.tostring(var345)
			elseif var342 == 2 then
				local _ = nil
				local var347, var348 = protoModule.readBuffer(p5, var337)
				var337 = var348
				var336.value = eventDataModule.EventData.decode(var347)
			else
				local _ = nil
				local var349, var350 = protoModule.readVarInt(p5, var337)
				var337 = var350 + var349
			end
		elseif var338 == protoModule.wireTypes.i32 then
			local _ = nil
			local var351, var352 = protoModule.readFixed32(p5, var337)
			local _ = var351
			var337 = var352
		elseif var338 == protoModule.wireTypes.i64 then
			local _ = nil
			local var353, var354 = protoModule.readFixed64(p5, var337)
			local _ = var353
			var337 = var354
		else
			error("Unsupported wire type: " .. var548)
		end
	end
	return var336
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
	local var355 = t_5.new()
	
	if self.key ~= nil then
		var355.key = self.key
	end
	if self.value ~= nil then
		var355.value = eventDataModule.EventData.jsonDecode(self.value)
	end
	return var355
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
	local var355 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var356, var357 = protoModule.writeTag(buff, var355, 1, protoModule.wireTypes.lengthDelimited)
		var356, var570 = protoModule.writeString(var356, var357, self.key)
		buff = var356
		var355 = var357
	end
	if self.value ~= nil then
		local var358 = self.value:encode()
		local var359, var360 = protoModule.writeTag(buff, var355, 2, protoModule.wireTypes.lengthDelimited)
		var359, var573 = protoModule.writeBuffer(var359, var360, var358, buffer.len(var358))
		buff = var359
		var355 = var360
	end
	local buff_1 = buffer.create(var355)
	buffer.copy(buff_1, 0, buff, 0, var355)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), songDataModule (ref)
	local var355 = t_6.new()
	local var356 = 0
	while var356 < buffer.len(p6) do
		local _ = nil
		local var357 = nil
		local var358, var359, var360 = protoModule.readTag(p6, var356)
		local var361 = var358
		var357 = var359
		var356 = var360
		
		if var357 == protoModule.wireTypes.varint then
			local _ = nil
			local var362, var363 = protoModule.readVarInt(p6, var356)
			local _ = var362
			var356 = var363
			continue
		end
		if var357 == protoModule.wireTypes.lengthDelimited then
			if var361 == 1 then
				local _ = nil
				local var364, var365 = protoModule.readBuffer(p6, var356)
				var356 = var365
				var355.key = buffer.tostring(var364)
			elseif var361 == 2 then
				local _ = nil
				local var366, var367 = protoModule.readBuffer(p6, var356)
				var356 = var367
				var355.value = songDataModule.SongData.decode(var366)
			else
				local _ = nil
				local var368, var369 = protoModule.readVarInt(p6, var356)
				var356 = var369 + var368
			end
		elseif var357 == protoModule.wireTypes.i32 then
			local _ = nil
			local var370, var371 = protoModule.readFixed32(p6, var356)
			local _ = var370
			var356 = var371
		elseif var357 == protoModule.wireTypes.i64 then
			local _ = nil
			local var372, var373 = protoModule.readFixed64(p6, var356)
			local _ = var372
			var356 = var373
		else
			error("Unsupported wire type: " .. var577)
		end
	end
	return var355
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
	local var374 = t_6.new()
	
	if self.key ~= nil then
		var374.key = self.key
	end
	if self.value ~= nil then
		var374.value = songDataModule.SongData.jsonDecode(self.value)
	end
	return var374
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
	local var374 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var375, var376 = protoModule.writeTag(buff, var374, 1, protoModule.wireTypes.lengthDelimited)
		var375, var599 = protoModule.writeString(var375, var376, self.key)
		buff = var375
		var374 = var376
	end
	if self.value ~= nil then
		local var377 = self.value:encode()
		local var378, var379 = protoModule.writeTag(buff, var374, 2, protoModule.wireTypes.lengthDelimited)
		var378, var602 = protoModule.writeBuffer(var378, var379, var377, buffer.len(var377))
		buff = var378
		var374 = var379
	end
	local buff_1 = buffer.create(var374)
	buffer.copy(buff_1, 0, buff, 0, var374)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref), gamePassDataModule (ref)
	local var374 = t_7.new()
	local var375 = 0
	while var375 < buffer.len(p7) do
		local _ = nil
		local var376 = nil
		local var377, var378, var379 = protoModule.readTag(p7, var375)
		local var380 = var377
		var376 = var378
		var375 = var379
		
		if var376 == protoModule.wireTypes.varint then
			local _ = nil
			local var381, var382 = protoModule.readVarInt(p7, var375)
			local _ = var381
			var375 = var382
			continue
		end
		if var376 == protoModule.wireTypes.lengthDelimited then
			if var380 == 1 then
				local _ = nil
				local var383, var384 = protoModule.readBuffer(p7, var375)
				var375 = var384
				var374.key = buffer.tostring(var383)
			elseif var380 == 2 then
				local _ = nil
				local var385, var386 = protoModule.readBuffer(p7, var375)
				var375 = var386
				var374.value = gamePassDataModule.GamePassData.decode(var385)
			else
				local _ = nil
				local var387, var388 = protoModule.readVarInt(p7, var375)
				var375 = var388 + var387
			end
		elseif var376 == protoModule.wireTypes.i32 then
			local _ = nil
			local var389, var390 = protoModule.readFixed32(p7, var375)
			local _ = var389
			var375 = var390
		elseif var376 == protoModule.wireTypes.i64 then
			local _ = nil
			local var391, var392 = protoModule.readFixed64(p7, var375)
			local _ = var391
			var375 = var392
		else
			error("Unsupported wire type: " .. var606)
		end
	end
	return var374
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
	local var393 = t_7.new()
	
	if self.key ~= nil then
		var393.key = self.key
	end
	if self.value ~= nil then
		var393.value = gamePassDataModule.GamePassData.jsonDecode(self.value)
	end
	return var393
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
	local var393 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var394, var395 = protoModule.writeTag(buff, var393, 1, protoModule.wireTypes.lengthDelimited)
		var394, var628 = protoModule.writeString(var394, var395, self.key)
		buff = var394
		var393 = var395
	end
	if self.value ~= nil then
		local var396 = self.value:encode()
		local var397, var398 = protoModule.writeTag(buff, var393, 2, protoModule.wireTypes.lengthDelimited)
		var397, var631 = protoModule.writeBuffer(var397, var398, var396, buffer.len(var396))
		buff = var397
		var393 = var398
	end
	local buff_1 = buffer.create(var393)
	buffer.copy(buff_1, 0, buff, 0, var393)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), mediaAssetDataModule (ref)
	local var393 = t_8.new()
	local var394 = 0
	while var394 < buffer.len(p8) do
		local _ = nil
		local var395 = nil
		local var396, var397, var398 = protoModule.readTag(p8, var394)
		local var399 = var396
		var395 = var397
		var394 = var398
		
		if var395 == protoModule.wireTypes.varint then
			local _ = nil
			local var400, var401 = protoModule.readVarInt(p8, var394)
			local _ = var400
			var394 = var401
			continue
		end
		if var395 == protoModule.wireTypes.lengthDelimited then
			if var399 == 1 then
				local _ = nil
				local var402, var403 = protoModule.readBuffer(p8, var394)
				var394 = var403
				var393.key = buffer.tostring(var402)
			elseif var399 == 2 then
				local _ = nil
				local var404, var405 = protoModule.readBuffer(p8, var394)
				var394 = var405
				var393.value = mediaAssetDataModule.MediaAssetData.decode(var404)
			else
				local _ = nil
				local var406, var407 = protoModule.readVarInt(p8, var394)
				var394 = var407 + var406
			end
		elseif var395 == protoModule.wireTypes.i32 then
			local _ = nil
			local var408, var409 = protoModule.readFixed32(p8, var394)
			local _ = var408
			var394 = var409
		elseif var395 == protoModule.wireTypes.i64 then
			local _ = nil
			local var410, var411 = protoModule.readFixed64(p8, var394)
			local _ = var410
			var394 = var411
		else
			error("Unsupported wire type: " .. var635)
		end
	end
	return var393
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
	local var412 = t_8.new()
	
	if self.key ~= nil then
		var412.key = self.key
	end
	if self.value ~= nil then
		var412.value = mediaAssetDataModule.MediaAssetData.jsonDecode(self.value)
	end
	return var412
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
	local var412 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var413, var414 = protoModule.writeTag(buff, var412, 1, protoModule.wireTypes.lengthDelimited)
		var413, var657 = protoModule.writeString(var413, var414, self.key)
		buff = var413
		var412 = var414
	end
	if self.value ~= nil then
		local var415 = self.value:encode()
		local var416, var417 = protoModule.writeTag(buff, var412, 2, protoModule.wireTypes.lengthDelimited)
		var416, var660 = protoModule.writeBuffer(var416, var417, var415, buffer.len(var415))
		buff = var416
		var412 = var417
	end
	local buff_1 = buffer.create(var412)
	buffer.copy(buff_1, 0, buff, 0, var412)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), socialLinkDataModule (ref)
	local var412 = t_9.new()
	local var413 = 0
	while var413 < buffer.len(p9) do
		local _ = nil
		local var414 = nil
		local var415, var416, var417 = protoModule.readTag(p9, var413)
		local var418 = var415
		var414 = var416
		var413 = var417
		
		if var414 == protoModule.wireTypes.varint then
			local _ = nil
			local var419, var420 = protoModule.readVarInt(p9, var413)
			local _ = var419
			var413 = var420
			continue
		end
		if var414 == protoModule.wireTypes.lengthDelimited then
			if var418 == 1 then
				local _ = nil
				local var421, var422 = protoModule.readBuffer(p9, var413)
				var413 = var422
				var412.key = buffer.tostring(var421)
			elseif var418 == 2 then
				local _ = nil
				local var423, var424 = protoModule.readBuffer(p9, var413)
				var413 = var424
				var412.value = socialLinkDataModule.SocialLinkData.decode(var423)
			else
				local _ = nil
				local var425, var426 = protoModule.readVarInt(p9, var413)
				var413 = var426 + var425
			end
		elseif var414 == protoModule.wireTypes.i32 then
			local _ = nil
			local var427, var428 = protoModule.readFixed32(p9, var413)
			local _ = var427
			var413 = var428
		elseif var414 == protoModule.wireTypes.i64 then
			local _ = nil
			local var429, var430 = protoModule.readFixed64(p9, var413)
			local _ = var429
			var413 = var430
		else
			error("Unsupported wire type: " .. var664)
		end
	end
	return var412
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
	local var431 = t_9.new()
	
	if self.key ~= nil then
		var431.key = self.key
	end
	if self.value ~= nil then
		var431.value = socialLinkDataModule.SocialLinkData.jsonDecode(self.value)
	end
	return var431
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
	local var431 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var432, var433 = protoModule.writeTag(buff, var431, 1, protoModule.wireTypes.lengthDelimited)
		var432, var686 = protoModule.writeString(var432, var433, self.key)
		buff = var432
		var431 = var433
	end
	if self.value ~= nil then
		local var434 = self.value:encode()
		local var435, var436 = protoModule.writeTag(buff, var431, 2, protoModule.wireTypes.lengthDelimited)
		var435, var689 = protoModule.writeBuffer(var435, var436, var434, buffer.len(var434))
		buff = var435
		var431 = var436
	end
	local buff_1 = buffer.create(var431)
	buffer.copy(buff_1, 0, buff, 0, var431)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref), gameDeveloperProductDataModule (ref)
	local var431 = t_10.new()
	local var432 = 0
	while var432 < buffer.len(p10) do
		local _ = nil
		local var433 = nil
		local var434, var435, var436 = protoModule.readTag(p10, var432)
		local var437 = var434
		var433 = var435
		var432 = var436
		
		if var433 == protoModule.wireTypes.varint then
			local _ = nil
			local var438, var439 = protoModule.readVarInt(p10, var432)
			local _ = var438
			var432 = var439
			continue
		end
		if var433 == protoModule.wireTypes.lengthDelimited then
			if var437 == 1 then
				local _ = nil
				local var440, var441 = protoModule.readBuffer(p10, var432)
				var432 = var441
				var431.key = buffer.tostring(var440)
			elseif var437 == 2 then
				local _ = nil
				local var442, var443 = protoModule.readBuffer(p10, var432)
				var432 = var443
				var431.value = gameDeveloperProductDataModule.GameDeveloperProductData.decode(var442)
			else
				local _ = nil
				local var444, var445 = protoModule.readVarInt(p10, var432)
				var432 = var445 + var444
			end
		elseif var433 == protoModule.wireTypes.i32 then
			local _ = nil
			local var446, var447 = protoModule.readFixed32(p10, var432)
			local _ = var446
			var432 = var447
		elseif var433 == protoModule.wireTypes.i64 then
			local _ = nil
			local var448, var449 = protoModule.readFixed64(p10, var432)
			local _ = var448
			var432 = var449
		else
			error("Unsupported wire type: " .. var693)
		end
	end
	return var431
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
	local var450 = t_10.new()
	
	if self.key ~= nil then
		var450.key = self.key
	end
	if self.value ~= nil then
		var450.value = gameDeveloperProductDataModule.GameDeveloperProductData.jsonDecode(self.value)
	end
	return var450
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
	local var450 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var451, var452 = protoModule.writeTag(buff, var450, 1, protoModule.wireTypes.lengthDelimited)
		var451, var715 = protoModule.writeString(var451, var452, self.key)
		buff = var451
		var450 = var452
	end
	if self.value ~= nil then
		local var453 = self.value:encode()
		local var454, var455 = protoModule.writeTag(buff, var450, 2, protoModule.wireTypes.lengthDelimited)
		var454, var718 = protoModule.writeBuffer(var454, var455, var453, buffer.len(var453))
		buff = var454
		var450 = var455
	end
	local buff_1 = buffer.create(var450)
	buffer.copy(buff_1, 0, buff, 0, var450)
	
	return buff_1
end

function t_11.decode(p11)
	-- upvalues: t_11 (ref), protoModule (ref), gameSubscriptionDataModule (ref)
	local var450 = t_11.new()
	local var451 = 0
	while var451 < buffer.len(p11) do
		local _ = nil
		local var452 = nil
		local var453, var454, var455 = protoModule.readTag(p11, var451)
		local var456 = var453
		var452 = var454
		var451 = var455
		
		if var452 == protoModule.wireTypes.varint then
			local _ = nil
			local var457, var458 = protoModule.readVarInt(p11, var451)
			local _ = var457
			var451 = var458
			continue
		end
		if var452 == protoModule.wireTypes.lengthDelimited then
			if var456 == 1 then
				local _ = nil
				local var459, var460 = protoModule.readBuffer(p11, var451)
				var451 = var460
				var450.key = buffer.tostring(var459)
			elseif var456 == 2 then
				local _ = nil
				local var461, var462 = protoModule.readBuffer(p11, var451)
				var451 = var462
				var450.value = gameSubscriptionDataModule.GameSubscriptionData.decode(var461)
			else
				local _ = nil
				local var463, var464 = protoModule.readVarInt(p11, var451)
				var451 = var464 + var463
			end
		elseif var452 == protoModule.wireTypes.i32 then
			local _ = nil
			local var465, var466 = protoModule.readFixed32(p11, var451)
			local _ = var465
			var451 = var466
		elseif var452 == protoModule.wireTypes.i64 then
			local _ = nil
			local var467, var468 = protoModule.readFixed64(p11, var451)
			local _ = var467
			var451 = var468
		else
			error("Unsupported wire type: " .. var722)
		end
	end
	return var450
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
	local var469 = t_11.new()
	
	if self.key ~= nil then
		var469.key = self.key
	end
	if self.value ~= nil then
		var469.value = gameSubscriptionDataModule.GameSubscriptionData.jsonDecode(self.value)
	end
	return var469
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
	local var469 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var470, var471 = protoModule.writeTag(buff, var469, 1, protoModule.wireTypes.lengthDelimited)
		var470, var744 = protoModule.writeString(var470, var471, self.key)
		buff = var470
		var469 = var471
	end
	if self.value ~= nil then
		local var472 = self.value:encode()
		local var473, var474 = protoModule.writeTag(buff, var469, 2, protoModule.wireTypes.lengthDelimited)
		var473, var747 = protoModule.writeBuffer(var473, var474, var472, buffer.len(var472))
		buff = var473
		var469 = var474
	end
	local buff_1 = buffer.create(var469)
	buffer.copy(buff_1, 0, buff, 0, var469)
	
	return buff_1
end

function t_12.decode(p12)
	-- upvalues: t_12 (ref), protoModule (ref), marketplaceCatalogCategoryDataModule (ref)
	local var469 = t_12.new()
	local var470 = 0
	while var470 < buffer.len(p12) do
		local _ = nil
		local var471 = nil
		local var472, var473, var474 = protoModule.readTag(p12, var470)
		local var475 = var472
		var471 = var473
		var470 = var474
		
		if var471 == protoModule.wireTypes.varint then
			local _ = nil
			local var476, var477 = protoModule.readVarInt(p12, var470)
			local _ = var476
			var470 = var477
			continue
		end
		if var471 == protoModule.wireTypes.lengthDelimited then
			if var475 == 1 then
				local _ = nil
				local var478, var479 = protoModule.readBuffer(p12, var470)
				var470 = var479
				var469.key = buffer.tostring(var478)
			elseif var475 == 2 then
				local _ = nil
				local var480, var481 = protoModule.readBuffer(p12, var470)
				var470 = var481
				var469.value = marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.decode(var480)
			else
				local _ = nil
				local var482, var483 = protoModule.readVarInt(p12, var470)
				var470 = var483 + var482
			end
		elseif var471 == protoModule.wireTypes.i32 then
			local _ = nil
			local var484, var485 = protoModule.readFixed32(p12, var470)
			local _ = var484
			var470 = var485
		elseif var471 == protoModule.wireTypes.i64 then
			local _ = nil
			local var486, var487 = protoModule.readFixed64(p12, var470)
			local _ = var486
			var470 = var487
		else
			error("Unsupported wire type: " .. var751)
		end
	end
	return var469
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
	local var488 = t_12.new()
	
	if self.key ~= nil then
		var488.key = self.key
	end
	if self.value ~= nil then
		var488.value = marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.jsonDecode(self.value)
	end
	return var488
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
	local var488 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var489, var490 = protoModule.writeTag(buff, var488, 1, protoModule.wireTypes.lengthDelimited)
		var489, var773 = protoModule.writeString(var489, var490, self.key)
		buff = var489
		var488 = var490
	end
	if self.value ~= nil then
		local var491 = self.value:encode()
		local var492, var493 = protoModule.writeTag(buff, var488, 2, protoModule.wireTypes.lengthDelimited)
		var492, var776 = protoModule.writeBuffer(var492, var493, var491, buffer.len(var491))
		buff = var492
		var488 = var493
	end
	local buff_1 = buffer.create(var488)
	buffer.copy(buff_1, 0, buff, 0, var488)
	
	return buff_1
end

function t_13.decode(p13)
	-- upvalues: t_13 (ref), protoModule (ref), marketplaceAssetDataModule (ref)
	local var488 = t_13.new()
	local var489 = 0
	while var489 < buffer.len(p13) do
		local _ = nil
		local var490 = nil
		local var491, var492, var493 = protoModule.readTag(p13, var489)
		local var494 = var491
		var490 = var492
		var489 = var493
		
		if var490 == protoModule.wireTypes.varint then
			local _ = nil
			local var495, var496 = protoModule.readVarInt(p13, var489)
			local _ = var495
			var489 = var496
			continue
		end
		if var490 == protoModule.wireTypes.lengthDelimited then
			if var494 == 1 then
				local _ = nil
				local var497, var498 = protoModule.readBuffer(p13, var489)
				var489 = var498
				var488.key = buffer.tostring(var497)
			elseif var494 == 2 then
				local _ = nil
				local var499, var500 = protoModule.readBuffer(p13, var489)
				var489 = var500
				var488.value = marketplaceAssetDataModule.MarketplaceAssetData.decode(var499)
			else
				local _ = nil
				local var501, var502 = protoModule.readVarInt(p13, var489)
				var489 = var502 + var501
			end
		elseif var490 == protoModule.wireTypes.i32 then
			local _ = nil
			local var503, var504 = protoModule.readFixed32(p13, var489)
			local _ = var503
			var489 = var504
		elseif var490 == protoModule.wireTypes.i64 then
			local _ = nil
			local var505, var506 = protoModule.readFixed64(p13, var489)
			local _ = var505
			var489 = var506
		else
			error("Unsupported wire type: " .. var780)
		end
	end
	return var488
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
	local var507 = t_13.new()
	
	if self.key ~= nil then
		var507.key = self.key
	end
	if self.value ~= nil then
		var507.value = marketplaceAssetDataModule.MarketplaceAssetData.jsonDecode(self.value)
	end
	return var507
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
	local var507 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var508, var509 = protoModule.writeTag(buff, var507, 1, protoModule.wireTypes.lengthDelimited)
		var508, var802 = protoModule.writeString(var508, var509, self.key)
		buff = var508
		var507 = var509
	end
	if self.value ~= nil then
		local var510 = self.value:encode()
		local var511, var512 = protoModule.writeTag(buff, var507, 2, protoModule.wireTypes.lengthDelimited)
		var511, var805 = protoModule.writeBuffer(var511, var512, var510, buffer.len(var510))
		buff = var511
		var507 = var512
	end
	local buff_1 = buffer.create(var507)
	buffer.copy(buff_1, 0, buff, 0, var507)
	
	return buff_1
end

function t_14.decode(p14)
	-- upvalues: t_14 (ref), protoModule (ref), marketplaceBundleDataModule (ref)
	local var507 = t_14.new()
	local var508 = 0
	while var508 < buffer.len(p14) do
		local _ = nil
		local var509 = nil
		local var510, var511, var512 = protoModule.readTag(p14, var508)
		local var513 = var510
		var509 = var511
		var508 = var512
		
		if var509 == protoModule.wireTypes.varint then
			local _ = nil
			local var514, var515 = protoModule.readVarInt(p14, var508)
			local _ = var514
			var508 = var515
			continue
		end
		if var509 == protoModule.wireTypes.lengthDelimited then
			if var513 == 1 then
				local _ = nil
				local var516, var517 = protoModule.readBuffer(p14, var508)
				var508 = var517
				var507.key = buffer.tostring(var516)
			elseif var513 == 2 then
				local _ = nil
				local var518, var519 = protoModule.readBuffer(p14, var508)
				var508 = var519
				var507.value = marketplaceBundleDataModule.MarketplaceBundleData.decode(var518)
			else
				local _ = nil
				local var520, var521 = protoModule.readVarInt(p14, var508)
				var508 = var521 + var520
			end
		elseif var509 == protoModule.wireTypes.i32 then
			local _ = nil
			local var522, var523 = protoModule.readFixed32(p14, var508)
			local _ = var522
			var508 = var523
		elseif var509 == protoModule.wireTypes.i64 then
			local _ = nil
			local var524, var525 = protoModule.readFixed64(p14, var508)
			local _ = var524
			var508 = var525
		else
			error("Unsupported wire type: " .. var809)
		end
	end
	return var507
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
	local var526 = t_14.new()
	
	if self.key ~= nil then
		var526.key = self.key
	end
	if self.value ~= nil then
		var526.value = marketplaceBundleDataModule.MarketplaceBundleData.jsonDecode(self.value)
	end
	return var526
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
	local var526 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var527, var528 = protoModule.writeTag(buff, var526, 1, protoModule.wireTypes.lengthDelimited)
		var527, var831 = protoModule.writeString(var527, var528, self.key)
		buff = var527
		var526 = var528
	end
	if self.value ~= nil then
		local var529 = self.value:encode()
		local var530, var531 = protoModule.writeTag(buff, var526, 2, protoModule.wireTypes.lengthDelimited)
		var530, var834 = protoModule.writeBuffer(var530, var531, var529, buffer.len(var529))
		buff = var530
		var526 = var531
	end
	local buff_1 = buffer.create(var526)
	buffer.copy(buff_1, 0, buff, 0, var526)
	
	return buff_1
end

function t_15.decode(p15)
	-- upvalues: t_15 (ref), protoModule (ref), marketplaceLookDataModule (ref)
	local var526 = t_15.new()
	local var527 = 0
	while var527 < buffer.len(p15) do
		local _ = nil
		local var528 = nil
		local var529, var530, var531 = protoModule.readTag(p15, var527)
		local var532 = var529
		var528 = var530
		var527 = var531
		
		if var528 == protoModule.wireTypes.varint then
			local _ = nil
			local var533, var534 = protoModule.readVarInt(p15, var527)
			local _ = var533
			var527 = var534
			continue
		end
		if var528 == protoModule.wireTypes.lengthDelimited then
			if var532 == 1 then
				local _ = nil
				local var535, var536 = protoModule.readBuffer(p15, var527)
				var527 = var536
				var526.key = buffer.tostring(var535)
			elseif var532 == 2 then
				local _ = nil
				local var537, var538 = protoModule.readBuffer(p15, var527)
				var527 = var538
				var526.value = marketplaceLookDataModule.MarketplaceLookData.decode(var537)
			else
				local _ = nil
				local var539, var540 = protoModule.readVarInt(p15, var527)
				var527 = var540 + var539
			end
		elseif var528 == protoModule.wireTypes.i32 then
			local _ = nil
			local var541, var542 = protoModule.readFixed32(p15, var527)
			local _ = var541
			var527 = var542
		elseif var528 == protoModule.wireTypes.i64 then
			local _ = nil
			local var543, var544 = protoModule.readFixed64(p15, var527)
			local _ = var543
			var527 = var544
		else
			error("Unsupported wire type: " .. var838)
		end
	end
	return var526
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
	local var545 = t_15.new()
	
	if self.key ~= nil then
		var545.key = self.key
	end
	if self.value ~= nil then
		var545.value = marketplaceLookDataModule.MarketplaceLookData.jsonDecode(self.value)
	end
	return var545
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
	local var545 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var546, var547 = protoModule.writeTag(buff, var545, 1, protoModule.wireTypes.lengthDelimited)
		var546, var860 = protoModule.writeString(var546, var547, self.key)
		buff = var546
		var545 = var547
	end
	if self.value ~= nil then
		local var548 = self.value:encode()
		local var549, var550 = protoModule.writeTag(buff, var545, 2, protoModule.wireTypes.lengthDelimited)
		var549, var863 = protoModule.writeBuffer(var549, var550, var548, buffer.len(var548))
		buff = var549
		var545 = var550
	end
	local buff_1 = buffer.create(var545)
	buffer.copy(buff_1, 0, buff, 0, var545)
	
	return buff_1
end

function t_16.decode(p16)
	-- upvalues: t_16 (ref), protoModule (ref), catalogSortDataModule (ref)
	local var545 = t_16.new()
	local var546 = 0
	while var546 < buffer.len(p16) do
		local _ = nil
		local var547 = nil
		local var548, var549, var550 = protoModule.readTag(p16, var546)
		local var551 = var548
		var547 = var549
		var546 = var550
		
		if var547 == protoModule.wireTypes.varint then
			local _ = nil
			local var552, var553 = protoModule.readVarInt(p16, var546)
			local _ = var552
			var546 = var553
			continue
		end
		if var547 == protoModule.wireTypes.lengthDelimited then
			if var551 == 1 then
				local _ = nil
				local var554, var555 = protoModule.readBuffer(p16, var546)
				var546 = var555
				var545.key = buffer.tostring(var554)
			elseif var551 == 2 then
				local _ = nil
				local var556, var557 = protoModule.readBuffer(p16, var546)
				var546 = var557
				var545.value = catalogSortDataModule.CatalogSortData.decode(var556)
			else
				local _ = nil
				local var558, var559 = protoModule.readVarInt(p16, var546)
				var546 = var559 + var558
			end
		elseif var547 == protoModule.wireTypes.i32 then
			local _ = nil
			local var560, var561 = protoModule.readFixed32(p16, var546)
			local _ = var560
			var546 = var561
		elseif var547 == protoModule.wireTypes.i64 then
			local _ = nil
			local var562, var563 = protoModule.readFixed64(p16, var546)
			local _ = var562
			var546 = var563
		else
			error("Unsupported wire type: " .. var867)
		end
	end
	return var545
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
	local var564 = t_16.new()
	
	if self.key ~= nil then
		var564.key = self.key
	end
	if self.value ~= nil then
		var564.value = catalogSortDataModule.CatalogSortData.jsonDecode(self.value)
	end
	return var564
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
	local var564 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var565, var566 = protoModule.writeTag(buff, var564, 1, protoModule.wireTypes.lengthDelimited)
		var565, var889 = protoModule.writeString(var565, var566, self.key)
		buff = var565
		var564 = var566
	end
	if self.value ~= nil then
		local var567 = self.value:encode()
		local var568, var569 = protoModule.writeTag(buff, var564, 2, protoModule.wireTypes.lengthDelimited)
		var568, var892 = protoModule.writeBuffer(var568, var569, var567, buffer.len(var567))
		buff = var568
		var564 = var569
	end
	local buff_1 = buffer.create(var564)
	buffer.copy(buff_1, 0, buff, 0, var564)
	
	return buff_1
end

function t_17.decode(p17)
	-- upvalues: t_17 (ref), protoModule (ref), ageRecommendationDataModule (ref)
	local var564 = t_17.new()
	local var565 = 0
	while var565 < buffer.len(p17) do
		local _ = nil
		local var566 = nil
		local var567, var568, var569 = protoModule.readTag(p17, var565)
		local var570 = var567
		var566 = var568
		var565 = var569
		
		if var566 == protoModule.wireTypes.varint then
			local _ = nil
			local var571, var572 = protoModule.readVarInt(p17, var565)
			local _ = var571
			var565 = var572
			continue
		end
		if var566 == protoModule.wireTypes.lengthDelimited then
			if var570 == 1 then
				local _ = nil
				local var573, var574 = protoModule.readBuffer(p17, var565)
				var565 = var574
				var564.key = buffer.tostring(var573)
			elseif var570 == 2 then
				local _ = nil
				local var575, var576 = protoModule.readBuffer(p17, var565)
				var565 = var576
				var564.value = ageRecommendationDataModule.AgeRecommendationData.decode(var575)
			else
				local _ = nil
				local var577, var578 = protoModule.readVarInt(p17, var565)
				var565 = var578 + var577
			end
		elseif var566 == protoModule.wireTypes.i32 then
			local _ = nil
			local var579, var580 = protoModule.readFixed32(p17, var565)
			local _ = var579
			var565 = var580
		elseif var566 == protoModule.wireTypes.i64 then
			local _ = nil
			local var581, var582 = protoModule.readFixed64(p17, var565)
			local _ = var581
			var565 = var582
		else
			error("Unsupported wire type: " .. var896)
		end
	end
	return var564
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
	local var583 = t_17.new()
	
	if self.key ~= nil then
		var583.key = self.key
	end
	if self.value ~= nil then
		var583.value = ageRecommendationDataModule.AgeRecommendationData.jsonDecode(self.value)
	end
	return var583
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
	local var583 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var584, var585 = protoModule.writeTag(buff, var583, 1, protoModule.wireTypes.lengthDelimited)
		var584, var918 = protoModule.writeString(var584, var585, self.key)
		buff = var584
		var583 = var585
	end
	if self.value ~= nil then
		local var586 = self.value:encode()
		local var587, var588 = protoModule.writeTag(buff, var583, 2, protoModule.wireTypes.lengthDelimited)
		var587, var921 = protoModule.writeBuffer(var587, var588, var586, buffer.len(var586))
		buff = var587
		var583 = var588
	end
	local buff_1 = buffer.create(var583)
	buffer.copy(buff_1, 0, buff, 0, var583)
	
	return buff_1
end

function t_18.decode(p18)
	-- upvalues: t_18 (ref), protoModule (ref), universeUserFollowDataModule (ref)
	local var583 = t_18.new()
	local var584 = 0
	while var584 < buffer.len(p18) do
		local _ = nil
		local var585 = nil
		local var586, var587, var588 = protoModule.readTag(p18, var584)
		local var589 = var586
		var585 = var587
		var584 = var588
		
		if var585 == protoModule.wireTypes.varint then
			local _ = nil
			local var590, var591 = protoModule.readVarInt(p18, var584)
			local _ = var590
			var584 = var591
			continue
		end
		if var585 == protoModule.wireTypes.lengthDelimited then
			if var589 == 1 then
				local _ = nil
				local var592, var593 = protoModule.readBuffer(p18, var584)
				var584 = var593
				var583.key = buffer.tostring(var592)
			elseif var589 == 2 then
				local _ = nil
				local var594, var595 = protoModule.readBuffer(p18, var584)
				var584 = var595
				var583.value = universeUserFollowDataModule.UniverseUserFollowData.decode(var594)
			else
				local _ = nil
				local var596, var597 = protoModule.readVarInt(p18, var584)
				var584 = var597 + var596
			end
		elseif var585 == protoModule.wireTypes.i32 then
			local _ = nil
			local var598, var599 = protoModule.readFixed32(p18, var584)
			local _ = var598
			var584 = var599
		elseif var585 == protoModule.wireTypes.i64 then
			local _ = nil
			local var600, var601 = protoModule.readFixed64(p18, var584)
			local _ = var600
			var584 = var601
		else
			error("Unsupported wire type: " .. var925)
		end
	end
	return var583
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
	local var602 = t_18.new()
	
	if self.key ~= nil then
		var602.key = self.key
	end
	if self.value ~= nil then
		var602.value = universeUserFollowDataModule.UniverseUserFollowData.jsonDecode(self.value)
	end
	return var602
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
	local var602 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var603, var604 = protoModule.writeTag(buff, var602, 1, protoModule.wireTypes.lengthDelimited)
		var603, var947 = protoModule.writeString(var603, var604, self.key)
		buff = var603
		var602 = var604
	end
	if self.value ~= nil then
		local var605 = self.value:encode()
		local var606, var607 = protoModule.writeTag(buff, var602, 2, protoModule.wireTypes.lengthDelimited)
		var606, var950 = protoModule.writeBuffer(var606, var607, var605, buffer.len(var605))
		buff = var606
		var602 = var607
	end
	local buff_1 = buffer.create(var602)
	buffer.copy(buff_1, 0, buff, 0, var602)
	
	return buff_1
end

function t_19.decode(p19)
	-- upvalues: t_19 (ref), protoModule (ref), universeUserVoteDataModule (ref)
	local var602 = t_19.new()
	local var603 = 0
	while var603 < buffer.len(p19) do
		local _ = nil
		local var604 = nil
		local var605, var606, var607 = protoModule.readTag(p19, var603)
		local var608 = var605
		var604 = var606
		var603 = var607
		
		if var604 == protoModule.wireTypes.varint then
			local _ = nil
			local var609, var610 = protoModule.readVarInt(p19, var603)
			local _ = var609
			var603 = var610
			continue
		end
		if var604 == protoModule.wireTypes.lengthDelimited then
			if var608 == 1 then
				local _ = nil
				local var611, var612 = protoModule.readBuffer(p19, var603)
				var603 = var612
				var602.key = buffer.tostring(var611)
			elseif var608 == 2 then
				local _ = nil
				local var613, var614 = protoModule.readBuffer(p19, var603)
				var603 = var614
				var602.value = universeUserVoteDataModule.UniverseUserVoteData.decode(var613)
			else
				local _ = nil
				local var615, var616 = protoModule.readVarInt(p19, var603)
				var603 = var616 + var615
			end
		elseif var604 == protoModule.wireTypes.i32 then
			local _ = nil
			local var617, var618 = protoModule.readFixed32(p19, var603)
			local _ = var617
			var603 = var618
		elseif var604 == protoModule.wireTypes.i64 then
			local _ = nil
			local var619, var620 = protoModule.readFixed64(p19, var603)
			local _ = var619
			var603 = var620
		else
			error("Unsupported wire type: " .. var954)
		end
	end
	return var602
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
	local var621 = t_19.new()
	
	if self.key ~= nil then
		var621.key = self.key
	end
	if self.value ~= nil then
		var621.value = universeUserVoteDataModule.UniverseUserVoteData.jsonDecode(self.value)
	end
	return var621
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
	local var621 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var622, var623 = protoModule.writeTag(buff, var621, 1, protoModule.wireTypes.lengthDelimited)
		var622, var976 = protoModule.writeString(var622, var623, self.key)
		buff = var622
		var621 = var623
	end
	if self.value ~= nil then
		local var624 = self.value:encode()
		local var625, var626 = protoModule.writeTag(buff, var621, 2, protoModule.wireTypes.lengthDelimited)
		var625, var979 = protoModule.writeBuffer(var625, var626, var624, buffer.len(var624))
		buff = var625
		var621 = var626
	end
	local buff_1 = buffer.create(var621)
	buffer.copy(buff_1, 0, buff, 0, var621)
	
	return buff_1
end

function t_20.decode(p20)
	-- upvalues: t_20 (ref), protoModule (ref), userProfileDataModule (ref)
	local var621 = t_20.new()
	local var622 = 0
	while var622 < buffer.len(p20) do
		local _ = nil
		local var623 = nil
		local var624, var625, var626 = protoModule.readTag(p20, var622)
		local var627 = var624
		var623 = var625
		var622 = var626
		
		if var623 == protoModule.wireTypes.varint then
			local _ = nil
			local var628, var629 = protoModule.readVarInt(p20, var622)
			local _ = var628
			var622 = var629
			continue
		end
		if var623 == protoModule.wireTypes.lengthDelimited then
			if var627 == 1 then
				local _ = nil
				local var630, var631 = protoModule.readBuffer(p20, var622)
				var622 = var631
				var621.key = buffer.tostring(var630)
			elseif var627 == 2 then
				local _ = nil
				local var632, var633 = protoModule.readBuffer(p20, var622)
				var622 = var633
				var621.value = userProfileDataModule.UserProfileData.decode(var632)
			else
				local _ = nil
				local var634, var635 = protoModule.readVarInt(p20, var622)
				var622 = var635 + var634
			end
		elseif var623 == protoModule.wireTypes.i32 then
			local _ = nil
			local var636, var637 = protoModule.readFixed32(p20, var622)
			local _ = var636
			var622 = var637
		elseif var623 == protoModule.wireTypes.i64 then
			local _ = nil
			local var638, var639 = protoModule.readFixed64(p20, var622)
			local _ = var638
			var622 = var639
		else
			error("Unsupported wire type: " .. var983)
		end
	end
	return var621
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
	local var640 = t_20.new()
	
	if self.key ~= nil then
		var640.key = self.key
	end
	if self.value ~= nil then
		var640.value = userProfileDataModule.UserProfileData.jsonDecode(self.value)
	end
	return var640
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
	local var640 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var641, var642 = protoModule.writeTag(buff, var640, 1, protoModule.wireTypes.lengthDelimited)
		var641, var1005 = protoModule.writeString(var641, var642, self.key)
		buff = var641
		var640 = var642
	end
	if self.value ~= nil then
		local var643 = self.value:encode()
		local var644, var645 = protoModule.writeTag(buff, var640, 2, protoModule.wireTypes.lengthDelimited)
		var644, var1008 = protoModule.writeBuffer(var644, var645, var643, buffer.len(var643))
		buff = var644
		var640 = var645
	end
	local buff_1 = buffer.create(var640)
	buffer.copy(buff_1, 0, buff, 0, var640)
	
	return buff_1
end

function t_21.decode(p21)
	-- upvalues: t_21 (ref), protoModule (ref), universeUserFavoriteDataModule (ref)
	local var640 = t_21.new()
	local var641 = 0
	while var641 < buffer.len(p21) do
		local _ = nil
		local var642 = nil
		local var643, var644, var645 = protoModule.readTag(p21, var641)
		local var646 = var643
		var642 = var644
		var641 = var645
		
		if var642 == protoModule.wireTypes.varint then
			local _ = nil
			local var647, var648 = protoModule.readVarInt(p21, var641)
			local _ = var647
			var641 = var648
			continue
		end
		if var642 == protoModule.wireTypes.lengthDelimited then
			if var646 == 1 then
				local _ = nil
				local var649, var650 = protoModule.readBuffer(p21, var641)
				var641 = var650
				var640.key = buffer.tostring(var649)
			elseif var646 == 2 then
				local _ = nil
				local var651, var652 = protoModule.readBuffer(p21, var641)
				var641 = var652
				var640.value = universeUserFavoriteDataModule.UniverseUserFavoriteData.decode(var651)
			else
				local _ = nil
				local var653, var654 = protoModule.readVarInt(p21, var641)
				var641 = var654 + var653
			end
		elseif var642 == protoModule.wireTypes.i32 then
			local _ = nil
			local var655, var656 = protoModule.readFixed32(p21, var641)
			local _ = var655
			var641 = var656
		elseif var642 == protoModule.wireTypes.i64 then
			local _ = nil
			local var657, var658 = protoModule.readFixed64(p21, var641)
			local _ = var657
			var641 = var658
		else
			error("Unsupported wire type: " .. var1012)
		end
	end
	return var640
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
	local var659 = t_21.new()
	
	if self.key ~= nil then
		var659.key = self.key
	end
	if self.value ~= nil then
		var659.value = universeUserFavoriteDataModule.UniverseUserFavoriteData.jsonDecode(self.value)
	end
	return var659
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
	local var659 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var660, var661 = protoModule.writeTag(buff, var659, 1, protoModule.wireTypes.lengthDelimited)
		var660, var1034 = protoModule.writeString(var660, var661, self.key)
		buff = var660
		var659 = var661
	end
	if self.value ~= nil then
		local var662 = self.value:encode()
		local var663, var664 = protoModule.writeTag(buff, var659, 2, protoModule.wireTypes.lengthDelimited)
		var663, var1037 = protoModule.writeBuffer(var663, var664, var662, buffer.len(var662))
		buff = var663
		var659 = var664
	end
	local buff_1 = buffer.create(var659)
	buffer.copy(buff_1, 0, buff, 0, var659)
	
	return buff_1
end

function t_22.decode(p22)
	-- upvalues: t_22 (ref), protoModule (ref), playabilityDataModule (ref)
	local var659 = t_22.new()
	local var660 = 0
	while var660 < buffer.len(p22) do
		local _ = nil
		local var661 = nil
		local var662, var663, var664 = protoModule.readTag(p22, var660)
		local var665 = var662
		var661 = var663
		var660 = var664
		
		if var661 == protoModule.wireTypes.varint then
			local _ = nil
			local var666, var667 = protoModule.readVarInt(p22, var660)
			local _ = var666
			var660 = var667
			continue
		end
		if var661 == protoModule.wireTypes.lengthDelimited then
			if var665 == 1 then
				local _ = nil
				local var668, var669 = protoModule.readBuffer(p22, var660)
				var660 = var669
				var659.key = buffer.tostring(var668)
			elseif var665 == 2 then
				local _ = nil
				local var670, var671 = protoModule.readBuffer(p22, var660)
				var660 = var671
				var659.value = playabilityDataModule.PlayabilityData.decode(var670)
			else
				local _ = nil
				local var672, var673 = protoModule.readVarInt(p22, var660)
				var660 = var673 + var672
			end
		elseif var661 == protoModule.wireTypes.i32 then
			local _ = nil
			local var674, var675 = protoModule.readFixed32(p22, var660)
			local _ = var674
			var660 = var675
		elseif var661 == protoModule.wireTypes.i64 then
			local _ = nil
			local var676, var677 = protoModule.readFixed64(p22, var660)
			local _ = var676
			var660 = var677
		else
			error("Unsupported wire type: " .. var1041)
		end
	end
	return var659
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
	local var678 = t_22.new()
	
	if self.key ~= nil then
		var678.key = self.key
	end
	if self.value ~= nil then
		var678.value = playabilityDataModule.PlayabilityData.jsonDecode(self.value)
	end
	return var678
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
	local var678 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var679, var680 = protoModule.writeTag(buff, var678, 1, protoModule.wireTypes.lengthDelimited)
		var679, var1063 = protoModule.writeString(var679, var680, self.key)
		buff = var679
		var678 = var680
	end
	if self.value ~= nil then
		local var681 = self.value:encode()
		local var682, var683 = protoModule.writeTag(buff, var678, 2, protoModule.wireTypes.lengthDelimited)
		var682, var1066 = protoModule.writeBuffer(var682, var683, var681, buffer.len(var681))
		buff = var682
		var678 = var683
	end
	local buff_1 = buffer.create(var678)
	buffer.copy(buff_1, 0, buff, 0, var678)
	
	return buff_1
end

function t_23.decode(p23)
	-- upvalues: t_23 (ref), protoModule (ref), universeUserFollowLimitDataModule (ref)
	local var678 = t_23.new()
	local var679 = 0
	while var679 < buffer.len(p23) do
		local _ = nil
		local var680 = nil
		local var681, var682, var683 = protoModule.readTag(p23, var679)
		local var684 = var681
		var680 = var682
		var679 = var683
		
		if var680 == protoModule.wireTypes.varint then
			local _ = nil
			local var685, var686 = protoModule.readVarInt(p23, var679)
			local _ = var685
			var679 = var686
			continue
		end
		if var680 == protoModule.wireTypes.lengthDelimited then
			if var684 == 1 then
				local _ = nil
				local var687, var688 = protoModule.readBuffer(p23, var679)
				var679 = var688
				var678.key = buffer.tostring(var687)
			elseif var684 == 2 then
				local _ = nil
				local var689, var690 = protoModule.readBuffer(p23, var679)
				var679 = var690
				var678.value = universeUserFollowLimitDataModule.UniverseUserFollowLimitData.decode(var689)
			else
				local _ = nil
				local var691, var692 = protoModule.readVarInt(p23, var679)
				var679 = var692 + var691
			end
		elseif var680 == protoModule.wireTypes.i32 then
			local _ = nil
			local var693, var694 = protoModule.readFixed32(p23, var679)
			local _ = var693
			var679 = var694
		elseif var680 == protoModule.wireTypes.i64 then
			local _ = nil
			local var695, var696 = protoModule.readFixed64(p23, var679)
			local _ = var695
			var679 = var696
		else
			error("Unsupported wire type: " .. var1070)
		end
	end
	return var678
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
	local var697 = t_23.new()
	
	if self.key ~= nil then
		var697.key = self.key
	end
	if self.value ~= nil then
		var697.value = universeUserFollowLimitDataModule.UniverseUserFollowLimitData.jsonDecode(self.value)
	end
	return var697
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
	local var697 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var698, var699 = protoModule.writeTag(buff, var697, 1, protoModule.wireTypes.lengthDelimited)
		var698, var1092 = protoModule.writeString(var698, var699, self.key)
		buff = var698
		var697 = var699
	end
	if self.value ~= nil then
		local var700 = self.value:encode()
		local var701, var702 = protoModule.writeTag(buff, var697, 2, protoModule.wireTypes.lengthDelimited)
		var701, var1095 = protoModule.writeBuffer(var701, var702, var700, buffer.len(var700))
		buff = var701
		var697 = var702
	end
	local buff_1 = buffer.create(var697)
	buffer.copy(buff_1, 0, buff, 0, var697)
	
	return buff_1
end

function t_24.decode(p24)
	-- upvalues: t_24 (ref), protoModule (ref), universeUserVoteFeedbackMetadataDataModule (ref)
	local var697 = t_24.new()
	local var698 = 0
	while var698 < buffer.len(p24) do
		local _ = nil
		local var699 = nil
		local var700, var701, var702 = protoModule.readTag(p24, var698)
		local var703 = var700
		var699 = var701
		var698 = var702
		
		if var699 == protoModule.wireTypes.varint then
			local _ = nil
			local var704, var705 = protoModule.readVarInt(p24, var698)
			local _ = var704
			var698 = var705
			continue
		end
		if var699 == protoModule.wireTypes.lengthDelimited then
			if var703 == 1 then
				local _ = nil
				local var706, var707 = protoModule.readBuffer(p24, var698)
				var698 = var707
				var697.key = buffer.tostring(var706)
			elseif var703 == 2 then
				local _ = nil
				local var708, var709 = protoModule.readBuffer(p24, var698)
				var698 = var709
				var697.value = universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.decode(var708)
			else
				local _ = nil
				local var710, var711 = protoModule.readVarInt(p24, var698)
				var698 = var711 + var710
			end
		elseif var699 == protoModule.wireTypes.i32 then
			local _ = nil
			local var712, var713 = protoModule.readFixed32(p24, var698)
			local _ = var712
			var698 = var713
		elseif var699 == protoModule.wireTypes.i64 then
			local _ = nil
			local var714, var715 = protoModule.readFixed64(p24, var698)
			local _ = var714
			var698 = var715
		else
			error("Unsupported wire type: " .. var1099)
		end
	end
	return var697
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
	local var716 = t_24.new()
	
	if self.key ~= nil then
		var716.key = self.key
	end
	if self.value ~= nil then
		var716.value = universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.jsonDecode(self.value)
	end
	return var716
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
	local var716 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var717, var718 = protoModule.writeTag(buff, var716, 1, protoModule.wireTypes.lengthDelimited)
		var717, var1121 = protoModule.writeString(var717, var718, self.key)
		buff = var717
		var716 = var718
	end
	if self.value ~= nil then
		local var719 = self.value:encode()
		local var720, var721 = protoModule.writeTag(buff, var716, 2, protoModule.wireTypes.lengthDelimited)
		var720, var1124 = protoModule.writeBuffer(var720, var721, var719, buffer.len(var719))
		buff = var720
		var716 = var721
	end
	local buff_1 = buffer.create(var716)
	buffer.copy(buff_1, 0, buff, 0, var716)
	
	return buff_1
end

function t_25.decode(p25)
	-- upvalues: t_25 (ref), protoModule (ref), momentDataModule (ref)
	local var716 = t_25.new()
	local var717 = 0
	while var717 < buffer.len(p25) do
		local _ = nil
		local var718 = nil
		local var719, var720, var721 = protoModule.readTag(p25, var717)
		local var722 = var719
		var718 = var720
		var717 = var721
		
		if var718 == protoModule.wireTypes.varint then
			local _ = nil
			local var723, var724 = protoModule.readVarInt(p25, var717)
			local _ = var723
			var717 = var724
			continue
		end
		if var718 == protoModule.wireTypes.lengthDelimited then
			if var722 == 1 then
				local _ = nil
				local var725, var726 = protoModule.readBuffer(p25, var717)
				var717 = var726
				var716.key = buffer.tostring(var725)
			elseif var722 == 2 then
				local _ = nil
				local var727, var728 = protoModule.readBuffer(p25, var717)
				var717 = var728
				var716.value = momentDataModule.MomentData.decode(var727)
			else
				local _ = nil
				local var729, var730 = protoModule.readVarInt(p25, var717)
				var717 = var730 + var729
			end
		elseif var718 == protoModule.wireTypes.i32 then
			local _ = nil
			local var731, var732 = protoModule.readFixed32(p25, var717)
			local _ = var731
			var717 = var732
		elseif var718 == protoModule.wireTypes.i64 then
			local _ = nil
			local var733, var734 = protoModule.readFixed64(p25, var717)
			local _ = var733
			var717 = var734
		else
			error("Unsupported wire type: " .. var1128)
		end
	end
	return var716
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
	local var735 = t_25.new()
	
	if self.key ~= nil then
		var735.key = self.key
	end
	if self.value ~= nil then
		var735.value = momentDataModule.MomentData.jsonDecode(self.value)
	end
	return var735
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
	local var735 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var736, var737 = protoModule.writeTag(buff, var735, 1, protoModule.wireTypes.lengthDelimited)
		var736, var1150 = protoModule.writeString(var736, var737, self.key)
		buff = var736
		var735 = var737
	end
	if self.value ~= nil then
		local var738 = self.value:encode()
		local var739, var740 = protoModule.writeTag(buff, var735, 2, protoModule.wireTypes.lengthDelimited)
		var739, var1153 = protoModule.writeBuffer(var739, var740, var738, buffer.len(var738))
		buff = var739
		var735 = var740
	end
	local buff_1 = buffer.create(var735)
	buffer.copy(buff_1, 0, buff, 0, var735)
	
	return buff_1
end

function t_26.decode(p26)
	-- upvalues: t_26 (ref), protoModule (ref), communityDataModule (ref)
	local var735 = t_26.new()
	local var736 = 0
	while var736 < buffer.len(p26) do
		local _ = nil
		local var737 = nil
		local var738, var739, var740 = protoModule.readTag(p26, var736)
		local var741 = var738
		var737 = var739
		var736 = var740
		
		if var737 == protoModule.wireTypes.varint then
			local _ = nil
			local var742, var743 = protoModule.readVarInt(p26, var736)
			local _ = var742
			var736 = var743
			continue
		end
		if var737 == protoModule.wireTypes.lengthDelimited then
			if var741 == 1 then
				local _ = nil
				local var744, var745 = protoModule.readBuffer(p26, var736)
				var736 = var745
				var735.key = buffer.tostring(var744)
			elseif var741 == 2 then
				local _ = nil
				local var746, var747 = protoModule.readBuffer(p26, var736)
				var736 = var747
				var735.value = communityDataModule.CommunityData.decode(var746)
			else
				local _ = nil
				local var748, var749 = protoModule.readVarInt(p26, var736)
				var736 = var749 + var748
			end
		elseif var737 == protoModule.wireTypes.i32 then
			local _ = nil
			local var750, var751 = protoModule.readFixed32(p26, var736)
			local _ = var750
			var736 = var751
		elseif var737 == protoModule.wireTypes.i64 then
			local _ = nil
			local var752, var753 = protoModule.readFixed64(p26, var736)
			local _ = var752
			var736 = var753
		else
			error("Unsupported wire type: " .. var1157)
		end
	end
	return var735
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
	local var754 = t_26.new()
	
	if self.key ~= nil then
		var754.key = self.key
	end
	if self.value ~= nil then
		var754.value = communityDataModule.CommunityData.jsonDecode(self.value)
	end
	return var754
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
	local var754 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var755, var756 = protoModule.writeTag(buff, var754, 1, protoModule.wireTypes.lengthDelimited)
		var755, var1179 = protoModule.writeString(var755, var756, self.key)
		buff = var755
		var754 = var756
	end
	if self.value ~= nil then
		local var757 = self.value:encode()
		local var758, var759 = protoModule.writeTag(buff, var754, 2, protoModule.wireTypes.lengthDelimited)
		var758, var1182 = protoModule.writeBuffer(var758, var759, var757, buffer.len(var757))
		buff = var758
		var754 = var759
	end
	local buff_1 = buffer.create(var754)
	buffer.copy(buff_1, 0, buff, 0, var754)
	
	return buff_1
end

function t_27.decode(p27)
	-- upvalues: t_27 (ref), protoModule (ref), communityUserMembershipDataModule (ref)
	local var754 = t_27.new()
	local var755 = 0
	while var755 < buffer.len(p27) do
		local _ = nil
		local var756 = nil
		local var757, var758, var759 = protoModule.readTag(p27, var755)
		local var760 = var757
		var756 = var758
		var755 = var759
		
		if var756 == protoModule.wireTypes.varint then
			local _ = nil
			local var761, var762 = protoModule.readVarInt(p27, var755)
			local _ = var761
			var755 = var762
			continue
		end
		if var756 == protoModule.wireTypes.lengthDelimited then
			if var760 == 1 then
				local _ = nil
				local var763, var764 = protoModule.readBuffer(p27, var755)
				var755 = var764
				var754.key = buffer.tostring(var763)
			elseif var760 == 2 then
				local _ = nil
				local var765, var766 = protoModule.readBuffer(p27, var755)
				var755 = var766
				var754.value = communityUserMembershipDataModule.CommunityUserMembershipData.decode(var765)
			else
				local _ = nil
				local var767, var768 = protoModule.readVarInt(p27, var755)
				var755 = var768 + var767
			end
		elseif var756 == protoModule.wireTypes.i32 then
			local _ = nil
			local var769, var770 = protoModule.readFixed32(p27, var755)
			local _ = var769
			var755 = var770
		elseif var756 == protoModule.wireTypes.i64 then
			local _ = nil
			local var771, var772 = protoModule.readFixed64(p27, var755)
			local _ = var771
			var755 = var772
		else
			error("Unsupported wire type: " .. var1186)
		end
	end
	return var754
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
	local var773 = t_27.new()
	
	if self.key ~= nil then
		var773.key = self.key
	end
	if self.value ~= nil then
		var773.value = communityUserMembershipDataModule.CommunityUserMembershipData.jsonDecode(self.value)
	end
	return var773
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
	local var773 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var774, var775 = protoModule.writeTag(buff, var773, 1, protoModule.wireTypes.lengthDelimited)
		var774, var1208 = protoModule.writeString(var774, var775, self.key)
		buff = var774
		var773 = var775
	end
	if self.value ~= nil then
		local var776 = self.value:encode()
		local var777, var778 = protoModule.writeTag(buff, var773, 2, protoModule.wireTypes.lengthDelimited)
		var777, var1211 = protoModule.writeBuffer(var777, var778, var776, buffer.len(var776))
		buff = var777
		var773 = var778
	end
	local buff_1 = buffer.create(var773)
	buffer.copy(buff_1, 0, buff, 0, var773)
	
	return buff_1
end

function t_28.decode(p28)
	-- upvalues: t_28 (ref), protoModule (ref), friendRecommendationDataModule (ref)
	local var773 = t_28.new()
	local var774 = 0
	while var774 < buffer.len(p28) do
		local _ = nil
		local var775 = nil
		local var776, var777, var778 = protoModule.readTag(p28, var774)
		local var779 = var776
		var775 = var777
		var774 = var778
		
		if var775 == protoModule.wireTypes.varint then
			local _ = nil
			local var780, var781 = protoModule.readVarInt(p28, var774)
			local _ = var780
			var774 = var781
			continue
		end
		if var775 == protoModule.wireTypes.lengthDelimited then
			if var779 == 1 then
				local _ = nil
				local var782, var783 = protoModule.readBuffer(p28, var774)
				var774 = var783
				var773.key = buffer.tostring(var782)
			elseif var779 == 2 then
				local _ = nil
				local var784, var785 = protoModule.readBuffer(p28, var774)
				var774 = var785
				var773.value = friendRecommendationDataModule.FriendRecommendationData.decode(var784)
			else
				local _ = nil
				local var786, var787 = protoModule.readVarInt(p28, var774)
				var774 = var787 + var786
			end
		elseif var775 == protoModule.wireTypes.i32 then
			local _ = nil
			local var788, var789 = protoModule.readFixed32(p28, var774)
			local _ = var788
			var774 = var789
		elseif var775 == protoModule.wireTypes.i64 then
			local _ = nil
			local var790, var791 = protoModule.readFixed64(p28, var774)
			local _ = var790
			var774 = var791
		else
			error("Unsupported wire type: " .. var1215)
		end
	end
	return var773
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
	local var792 = t_28.new()
	
	if self.key ~= nil then
		var792.key = self.key
	end
	if self.value ~= nil then
		var792.value = friendRecommendationDataModule.FriendRecommendationData.jsonDecode(self.value)
	end
	return var792
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
	local var792 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var793, var794 = protoModule.writeTag(buff, var792, 1, protoModule.wireTypes.lengthDelimited)
		var793, var1237 = protoModule.writeString(var793, var794, self.key)
		buff = var793
		var792 = var794
	end
	if self.value ~= nil then
		local var795 = self.value:encode()
		local var796, var797 = protoModule.writeTag(buff, var792, 2, protoModule.wireTypes.lengthDelimited)
		var796, var1240 = protoModule.writeBuffer(var796, var797, var795, buffer.len(var795))
		buff = var796
		var792 = var797
	end
	local buff_1 = buffer.create(var792)
	buffer.copy(buff_1, 0, buff, 0, var792)
	
	return buff_1
end

function t_29.decode(p29)
	-- upvalues: t_29 (ref), protoModule (ref), universePrivateServerDataModule (ref)
	local var792 = t_29.new()
	local var793 = 0
	while var793 < buffer.len(p29) do
		local _ = nil
		local var794 = nil
		local var795, var796, var797 = protoModule.readTag(p29, var793)
		local var798 = var795
		var794 = var796
		var793 = var797
		
		if var794 == protoModule.wireTypes.varint then
			local _ = nil
			local var799, var800 = protoModule.readVarInt(p29, var793)
			local _ = var799
			var793 = var800
			continue
		end
		if var794 == protoModule.wireTypes.lengthDelimited then
			if var798 == 1 then
				local _ = nil
				local var801, var802 = protoModule.readBuffer(p29, var793)
				var793 = var802
				var792.key = buffer.tostring(var801)
			elseif var798 == 2 then
				local _ = nil
				local var803, var804 = protoModule.readBuffer(p29, var793)
				var793 = var804
				var792.value = universePrivateServerDataModule.UniversePrivateServerData.decode(var803)
			else
				local _ = nil
				local var805, var806 = protoModule.readVarInt(p29, var793)
				var793 = var806 + var805
			end
		elseif var794 == protoModule.wireTypes.i32 then
			local _ = nil
			local var807, var808 = protoModule.readFixed32(p29, var793)
			local _ = var807
			var793 = var808
		elseif var794 == protoModule.wireTypes.i64 then
			local _ = nil
			local var809, var810 = protoModule.readFixed64(p29, var793)
			local _ = var809
			var793 = var810
		else
			error("Unsupported wire type: " .. var1244)
		end
	end
	return var792
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
	local var811 = t_29.new()
	
	if self.key ~= nil then
		var811.key = self.key
	end
	if self.value ~= nil then
		var811.value = universePrivateServerDataModule.UniversePrivateServerData.jsonDecode(self.value)
	end
	return var811
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
	local var811 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var812, var813 = protoModule.writeTag(buff, var811, 1, protoModule.wireTypes.lengthDelimited)
		var812, var1266 = protoModule.writeString(var812, var813, self.key)
		buff = var812
		var811 = var813
	end
	if self.value ~= nil then
		local var814 = self.value:encode()
		local var815, var816 = protoModule.writeTag(buff, var811, 2, protoModule.wireTypes.lengthDelimited)
		var815, var1269 = protoModule.writeBuffer(var815, var816, var814, buffer.len(var814))
		buff = var815
		var811 = var816
	end
	local buff_1 = buffer.create(var811)
	buffer.copy(buff_1, 0, buff, 0, var811)
	
	return buff_1
end

function t_30.decode(p30)
	-- upvalues: t_30 (ref), protoModule (ref), notificationBadgeDataModule (ref)
	local var811 = t_30.new()
	local var812 = 0
	while var812 < buffer.len(p30) do
		local _ = nil
		local var813 = nil
		local var814, var815, var816 = protoModule.readTag(p30, var812)
		local var817 = var814
		var813 = var815
		var812 = var816
		
		if var813 == protoModule.wireTypes.varint then
			local _ = nil
			local var818, var819 = protoModule.readVarInt(p30, var812)
			local _ = var818
			var812 = var819
			continue
		end
		if var813 == protoModule.wireTypes.lengthDelimited then
			if var817 == 1 then
				local _ = nil
				local var820, var821 = protoModule.readBuffer(p30, var812)
				var812 = var821
				var811.key = buffer.tostring(var820)
			elseif var817 == 2 then
				local _ = nil
				local var822, var823 = protoModule.readBuffer(p30, var812)
				var812 = var823
				var811.value = notificationBadgeDataModule.NotificationBadgeData.decode(var822)
			else
				local _ = nil
				local var824, var825 = protoModule.readVarInt(p30, var812)
				var812 = var825 + var824
			end
		elseif var813 == protoModule.wireTypes.i32 then
			local _ = nil
			local var826, var827 = protoModule.readFixed32(p30, var812)
			local _ = var826
			var812 = var827
		elseif var813 == protoModule.wireTypes.i64 then
			local _ = nil
			local var828, var829 = protoModule.readFixed64(p30, var812)
			local _ = var828
			var812 = var829
		else
			error("Unsupported wire type: " .. var1273)
		end
	end
	return var811
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
	local var830 = t_30.new()
	
	if self.key ~= nil then
		var830.key = self.key
	end
	if self.value ~= nil then
		var830.value = notificationBadgeDataModule.NotificationBadgeData.jsonDecode(self.value)
	end
	return var830
end

t_30.descriptor = {
	name = "HydrationContent_NotificationBadgeEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.NotificationBadgeEntry"
}
t.HydrationContent_NotificationBadgeEntry = t_30
typeRegistryModule.default:register(t.HydrationContent_NotificationBadgeEntry)

return { HydrationContent = t.HydrationContent }