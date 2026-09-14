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
		collectible_item = if p1 == nil or p1.collectible_item == nil then {} else p1.collectible_item
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.badge ~= nil and next(self.badge) ~= nil then
		for i, v in self.badge do
			local var2, var3 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2, var67 = protoModule.writeString(var2, var3, i)
			local var4 = v:encode()
			var3, var69 = protoModule.writeTag(var2, var3, 2, protoModule.wireTypes.lengthDelimited)
			var3, var69 = protoModule.writeBuffer(var3, var69, var4, buffer.len(var4))
			local var5 = var3
			local var6 = var69
			local var7, var8 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var7, var73 = protoModule.writeBuffer(var7, var8, var5, var6)
			buff = var7
			var1 = var8
		end
	end
	if self.universe ~= nil and next(self.universe) ~= nil then
		for i, v in self.universe do
			local var9, var10 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var9, var75 = protoModule.writeString(var9, var10, i)
			local var11 = v:encode()
			var10, var77 = protoModule.writeTag(var9, var10, 2, protoModule.wireTypes.lengthDelimited)
			var10, var77 = protoModule.writeBuffer(var10, var77, var11, buffer.len(var11))
			local var12 = var10
			local var13 = var77
			local var14, var15 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var14, var81 = protoModule.writeBuffer(var14, var15, var12, var13)
			buff = var14
			var1 = var15
		end
	end
	if self.creator ~= nil and next(self.creator) ~= nil then
		for i, v in self.creator do
			local var16, var17 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var16, var83 = protoModule.writeString(var16, var17, i)
			local var18 = v:encode()
			var17, var85 = protoModule.writeTag(var16, var17, 2, protoModule.wireTypes.lengthDelimited)
			var17, var85 = protoModule.writeBuffer(var17, var85, var18, buffer.len(var18))
			local var19 = var17
			local var20 = var85
			local var21, var22 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var21, var89 = protoModule.writeBuffer(var21, var22, var19, var20)
			buff = var21
			var1 = var22
		end
	end
	if self.event ~= nil and next(self.event) ~= nil then
		for i, v in self.event do
			local var23, var24 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var23, var91 = protoModule.writeString(var23, var24, i)
			local var25 = v:encode()
			var24, var93 = protoModule.writeTag(var23, var24, 2, protoModule.wireTypes.lengthDelimited)
			var24, var93 = protoModule.writeBuffer(var24, var93, var25, buffer.len(var25))
			local var26 = var24
			local var27 = var93
			local var28, var29 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
			var28, var97 = protoModule.writeBuffer(var28, var29, var26, var27)
			buff = var28
			var1 = var29
		end
	end
	if self.song ~= nil and next(self.song) ~= nil then
		for i, v in self.song do
			local var30, var31 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var30, var99 = protoModule.writeString(var30, var31, i)
			local var32 = v:encode()
			var31, var101 = protoModule.writeTag(var30, var31, 2, protoModule.wireTypes.lengthDelimited)
			var31, var101 = protoModule.writeBuffer(var31, var101, var32, buffer.len(var32))
			local var33 = var31
			local var34 = var101
			local var35, var36 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
			var35, var105 = protoModule.writeBuffer(var35, var36, var33, var34)
			buff = var35
			var1 = var36
		end
	end
	if self.game_pass ~= nil and next(self.game_pass) ~= nil then
		for i, v in self.game_pass do
			local var37, var38 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var37, var107 = protoModule.writeString(var37, var38, i)
			local var39 = v:encode()
			var38, var109 = protoModule.writeTag(var37, var38, 2, protoModule.wireTypes.lengthDelimited)
			var38, var109 = protoModule.writeBuffer(var38, var109, var39, buffer.len(var39))
			local var40 = var38
			local var41 = var109
			local var42, var43 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
			var42, var113 = protoModule.writeBuffer(var42, var43, var40, var41)
			buff = var42
			var1 = var43
		end
	end
	if self.media_asset ~= nil and next(self.media_asset) ~= nil then
		for i, v in self.media_asset do
			local var44, var45 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var44, var115 = protoModule.writeString(var44, var45, i)
			local var46 = v:encode()
			var45, var117 = protoModule.writeTag(var44, var45, 2, protoModule.wireTypes.lengthDelimited)
			var45, var117 = protoModule.writeBuffer(var45, var117, var46, buffer.len(var46))
			local var47 = var45
			local var48 = var117
			local var49, var50 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
			var49, var121 = protoModule.writeBuffer(var49, var50, var47, var48)
			buff = var49
			var1 = var50
		end
	end
	if self.social_link ~= nil and next(self.social_link) ~= nil then
		for i, v in self.social_link do
			local var51, var52 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var51, var123 = protoModule.writeString(var51, var52, i)
			local var53 = v:encode()
			var52, var125 = protoModule.writeTag(var51, var52, 2, protoModule.wireTypes.lengthDelimited)
			var52, var125 = protoModule.writeBuffer(var52, var125, var53, buffer.len(var53))
			local var54 = var52
			local var55 = var125
			local var56, var57 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
			var56, var129 = protoModule.writeBuffer(var56, var57, var54, var55)
			buff = var56
			var1 = var57
		end
	end
	if self.game_developer_product ~= nil and next(self.game_developer_product) ~= nil then
		for i, v in self.game_developer_product do
			local var58, var59 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var58, var131 = protoModule.writeString(var58, var59, i)
			local var60 = v:encode()
			var59, var133 = protoModule.writeTag(var58, var59, 2, protoModule.wireTypes.lengthDelimited)
			var59, var133 = protoModule.writeBuffer(var59, var133, var60, buffer.len(var60))
			local var61 = var59
			local var62 = var133
			local var63, var64 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
			var63, var137 = protoModule.writeBuffer(var63, var64, var61, var62)
			buff = var63
			var1 = var64
		end
	end
	if self.game_subscription ~= nil and next(self.game_subscription) ~= nil then
		for i, v in self.game_subscription do
			local var65, var66 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var65, var139 = protoModule.writeString(var65, var66, i)
			local var67 = v:encode()
			var66, var141 = protoModule.writeTag(var65, var66, 2, protoModule.wireTypes.lengthDelimited)
			var66, var141 = protoModule.writeBuffer(var66, var141, var67, buffer.len(var67))
			local var68 = var66
			local var69 = var141
			local var70, var71 = protoModule.writeTag(buff, var1, 10, protoModule.wireTypes.lengthDelimited)
			var70, var145 = protoModule.writeBuffer(var70, var71, var68, var69)
			buff = var70
			var1 = var71
		end
	end
	if self.marketplace_catalog_category ~= nil and next(self.marketplace_catalog_category) ~= nil then
		for i, v in self.marketplace_catalog_category do
			local var72, var73 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var72, var147 = protoModule.writeString(var72, var73, i)
			local var74 = v:encode()
			var73, var149 = protoModule.writeTag(var72, var73, 2, protoModule.wireTypes.lengthDelimited)
			var73, var149 = protoModule.writeBuffer(var73, var149, var74, buffer.len(var74))
			local var75 = var73
			local var76 = var149
			local var77, var78 = protoModule.writeTag(buff, var1, 11, protoModule.wireTypes.lengthDelimited)
			var77, var153 = protoModule.writeBuffer(var77, var78, var75, var76)
			buff = var77
			var1 = var78
		end
	end
	if self.marketplace_asset ~= nil and next(self.marketplace_asset) ~= nil then
		for i, v in self.marketplace_asset do
			local var79, var80 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var79, var155 = protoModule.writeString(var79, var80, i)
			local var81 = v:encode()
			var80, var157 = protoModule.writeTag(var79, var80, 2, protoModule.wireTypes.lengthDelimited)
			var80, var157 = protoModule.writeBuffer(var80, var157, var81, buffer.len(var81))
			local var82 = var80
			local var83 = var157
			local var84, var85 = protoModule.writeTag(buff, var1, 12, protoModule.wireTypes.lengthDelimited)
			var84, var161 = protoModule.writeBuffer(var84, var85, var82, var83)
			buff = var84
			var1 = var85
		end
	end
	if self.marketplace_bundle ~= nil and next(self.marketplace_bundle) ~= nil then
		for i, v in self.marketplace_bundle do
			local var86, var87 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var86, var163 = protoModule.writeString(var86, var87, i)
			local var88 = v:encode()
			var87, var165 = protoModule.writeTag(var86, var87, 2, protoModule.wireTypes.lengthDelimited)
			var87, var165 = protoModule.writeBuffer(var87, var165, var88, buffer.len(var88))
			local var89 = var87
			local var90 = var165
			local var91, var92 = protoModule.writeTag(buff, var1, 13, protoModule.wireTypes.lengthDelimited)
			var91, var169 = protoModule.writeBuffer(var91, var92, var89, var90)
			buff = var91
			var1 = var92
		end
	end
	if self.marketplace_look ~= nil and next(self.marketplace_look) ~= nil then
		for i, v in self.marketplace_look do
			local var93, var94 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var93, var171 = protoModule.writeString(var93, var94, i)
			local var95 = v:encode()
			var94, var173 = protoModule.writeTag(var93, var94, 2, protoModule.wireTypes.lengthDelimited)
			var94, var173 = protoModule.writeBuffer(var94, var173, var95, buffer.len(var95))
			local var96 = var94
			local var97 = var173
			local var98, var99 = protoModule.writeTag(buff, var1, 14, protoModule.wireTypes.lengthDelimited)
			var98, var177 = protoModule.writeBuffer(var98, var99, var96, var97)
			buff = var98
			var1 = var99
		end
	end
	if self.catalog_sort ~= nil and next(self.catalog_sort) ~= nil then
		for i, v in self.catalog_sort do
			local var100, var101 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var100, var179 = protoModule.writeString(var100, var101, i)
			local var102 = v:encode()
			var101, var181 = protoModule.writeTag(var100, var101, 2, protoModule.wireTypes.lengthDelimited)
			var101, var181 = protoModule.writeBuffer(var101, var181, var102, buffer.len(var102))
			local var103 = var101
			local var104 = var181
			local var105, var106 = protoModule.writeTag(buff, var1, 15, protoModule.wireTypes.lengthDelimited)
			var105, var185 = protoModule.writeBuffer(var105, var106, var103, var104)
			buff = var105
			var1 = var106
		end
	end
	if self.age_recommendation ~= nil and next(self.age_recommendation) ~= nil then
		for i, v in self.age_recommendation do
			local var107, var108 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var107, var187 = protoModule.writeString(var107, var108, i)
			local var109 = v:encode()
			var108, var189 = protoModule.writeTag(var107, var108, 2, protoModule.wireTypes.lengthDelimited)
			var108, var189 = protoModule.writeBuffer(var108, var189, var109, buffer.len(var109))
			local var110 = var108
			local var111 = var189
			local var112, var113 = protoModule.writeTag(buff, var1, 16, protoModule.wireTypes.lengthDelimited)
			var112, var193 = protoModule.writeBuffer(var112, var113, var110, var111)
			buff = var112
			var1 = var113
		end
	end
	if self.universe_user_follow ~= nil and next(self.universe_user_follow) ~= nil then
		for i, v in self.universe_user_follow do
			local var114, var115 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var114, var195 = protoModule.writeString(var114, var115, i)
			local var116 = v:encode()
			var115, var197 = protoModule.writeTag(var114, var115, 2, protoModule.wireTypes.lengthDelimited)
			var115, var197 = protoModule.writeBuffer(var115, var197, var116, buffer.len(var116))
			local var117 = var115
			local var118 = var197
			local var119, var120 = protoModule.writeTag(buff, var1, 17, protoModule.wireTypes.lengthDelimited)
			var119, var201 = protoModule.writeBuffer(var119, var120, var117, var118)
			buff = var119
			var1 = var120
		end
	end
	if self.universe_user_vote ~= nil and next(self.universe_user_vote) ~= nil then
		for i, v in self.universe_user_vote do
			local var121, var122 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var121, var203 = protoModule.writeString(var121, var122, i)
			local var123 = v:encode()
			var122, var205 = protoModule.writeTag(var121, var122, 2, protoModule.wireTypes.lengthDelimited)
			var122, var205 = protoModule.writeBuffer(var122, var205, var123, buffer.len(var123))
			local var124 = var122
			local var125 = var205
			local var126, var127 = protoModule.writeTag(buff, var1, 18, protoModule.wireTypes.lengthDelimited)
			var126, var209 = protoModule.writeBuffer(var126, var127, var124, var125)
			buff = var126
			var1 = var127
		end
	end
	if self.user_profile ~= nil and next(self.user_profile) ~= nil then
		for i, v in self.user_profile do
			local var128, var129 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var128, var211 = protoModule.writeString(var128, var129, i)
			local var130 = v:encode()
			var129, var213 = protoModule.writeTag(var128, var129, 2, protoModule.wireTypes.lengthDelimited)
			var129, var213 = protoModule.writeBuffer(var129, var213, var130, buffer.len(var130))
			local var131 = var129
			local var132 = var213
			local var133, var134 = protoModule.writeTag(buff, var1, 19, protoModule.wireTypes.lengthDelimited)
			var133, var217 = protoModule.writeBuffer(var133, var134, var131, var132)
			buff = var133
			var1 = var134
		end
	end
	if self.universe_user_favorite ~= nil and next(self.universe_user_favorite) ~= nil then
		for i, v in self.universe_user_favorite do
			local var135, var136 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var135, var219 = protoModule.writeString(var135, var136, i)
			local var137 = v:encode()
			var136, var221 = protoModule.writeTag(var135, var136, 2, protoModule.wireTypes.lengthDelimited)
			var136, var221 = protoModule.writeBuffer(var136, var221, var137, buffer.len(var137))
			local var138 = var136
			local var139 = var221
			local var140, var141 = protoModule.writeTag(buff, var1, 20, protoModule.wireTypes.lengthDelimited)
			var140, var225 = protoModule.writeBuffer(var140, var141, var138, var139)
			buff = var140
			var1 = var141
		end
	end
	if self.playability ~= nil and next(self.playability) ~= nil then
		for i, v in self.playability do
			local var142, var143 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var142, var227 = protoModule.writeString(var142, var143, i)
			local var144 = v:encode()
			var143, var229 = protoModule.writeTag(var142, var143, 2, protoModule.wireTypes.lengthDelimited)
			var143, var229 = protoModule.writeBuffer(var143, var229, var144, buffer.len(var144))
			local var145 = var143
			local var146 = var229
			local var147, var148 = protoModule.writeTag(buff, var1, 21, protoModule.wireTypes.lengthDelimited)
			var147, var233 = protoModule.writeBuffer(var147, var148, var145, var146)
			buff = var147
			var1 = var148
		end
	end
	if self.universe_user_follow_limit ~= nil and next(self.universe_user_follow_limit) ~= nil then
		for i, v in self.universe_user_follow_limit do
			local var149, var150 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var149, var235 = protoModule.writeString(var149, var150, i)
			local var151 = v:encode()
			var150, var237 = protoModule.writeTag(var149, var150, 2, protoModule.wireTypes.lengthDelimited)
			var150, var237 = protoModule.writeBuffer(var150, var237, var151, buffer.len(var151))
			local var152 = var150
			local var153 = var237
			local var154, var155 = protoModule.writeTag(buff, var1, 22, protoModule.wireTypes.lengthDelimited)
			var154, var241 = protoModule.writeBuffer(var154, var155, var152, var153)
			buff = var154
			var1 = var155
		end
	end
	if self.universe_user_vote_feedback_metadata ~= nil and next(self.universe_user_vote_feedback_metadata) ~= nil then
		for i, v in self.universe_user_vote_feedback_metadata do
			local var156, var157 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var156, var243 = protoModule.writeString(var156, var157, i)
			local var158 = v:encode()
			var157, var245 = protoModule.writeTag(var156, var157, 2, protoModule.wireTypes.lengthDelimited)
			var157, var245 = protoModule.writeBuffer(var157, var245, var158, buffer.len(var158))
			local var159 = var157
			local var160 = var245
			local var161, var162 = protoModule.writeTag(buff, var1, 23, protoModule.wireTypes.lengthDelimited)
			var161, var249 = protoModule.writeBuffer(var161, var162, var159, var160)
			buff = var161
			var1 = var162
		end
	end
	if self.moment ~= nil and next(self.moment) ~= nil then
		for i, v in self.moment do
			local var163, var164 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var163, var251 = protoModule.writeString(var163, var164, i)
			local var165 = v:encode()
			var164, var253 = protoModule.writeTag(var163, var164, 2, protoModule.wireTypes.lengthDelimited)
			var164, var253 = protoModule.writeBuffer(var164, var253, var165, buffer.len(var165))
			local var166 = var164
			local var167 = var253
			local var168, var169 = protoModule.writeTag(buff, var1, 24, protoModule.wireTypes.lengthDelimited)
			var168, var257 = protoModule.writeBuffer(var168, var169, var166, var167)
			buff = var168
			var1 = var169
		end
	end
	if self.community ~= nil and next(self.community) ~= nil then
		for i, v in self.community do
			local var170, var171 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var170, var259 = protoModule.writeString(var170, var171, i)
			local var172 = v:encode()
			var171, var261 = protoModule.writeTag(var170, var171, 2, protoModule.wireTypes.lengthDelimited)
			var171, var261 = protoModule.writeBuffer(var171, var261, var172, buffer.len(var172))
			local var173 = var171
			local var174 = var261
			local var175, var176 = protoModule.writeTag(buff, var1, 25, protoModule.wireTypes.lengthDelimited)
			var175, var265 = protoModule.writeBuffer(var175, var176, var173, var174)
			buff = var175
			var1 = var176
		end
	end
	if self.community_user_membership ~= nil and next(self.community_user_membership) ~= nil then
		for i, v in self.community_user_membership do
			local var177, var178 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var177, var267 = protoModule.writeString(var177, var178, i)
			local var179 = v:encode()
			var178, var269 = protoModule.writeTag(var177, var178, 2, protoModule.wireTypes.lengthDelimited)
			var178, var269 = protoModule.writeBuffer(var178, var269, var179, buffer.len(var179))
			local var180 = var178
			local var181 = var269
			local var182, var183 = protoModule.writeTag(buff, var1, 26, protoModule.wireTypes.lengthDelimited)
			var182, var273 = protoModule.writeBuffer(var182, var183, var180, var181)
			buff = var182
			var1 = var183
		end
	end
	if self.friend_recommendation ~= nil and next(self.friend_recommendation) ~= nil then
		for i, v in self.friend_recommendation do
			local var184, var185 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var184, var275 = protoModule.writeString(var184, var185, i)
			local var186 = v:encode()
			var185, var277 = protoModule.writeTag(var184, var185, 2, protoModule.wireTypes.lengthDelimited)
			var185, var277 = protoModule.writeBuffer(var185, var277, var186, buffer.len(var186))
			local var187 = var185
			local var188 = var277
			local var189, var190 = protoModule.writeTag(buff, var1, 27, protoModule.wireTypes.lengthDelimited)
			var189, var281 = protoModule.writeBuffer(var189, var190, var187, var188)
			buff = var189
			var1 = var190
		end
	end
	if self.universe_private_server ~= nil and next(self.universe_private_server) ~= nil then
		for i, v in self.universe_private_server do
			local var191, var192 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var191, var283 = protoModule.writeString(var191, var192, i)
			local var193 = v:encode()
			var192, var285 = protoModule.writeTag(var191, var192, 2, protoModule.wireTypes.lengthDelimited)
			var192, var285 = protoModule.writeBuffer(var192, var285, var193, buffer.len(var193))
			local var194 = var192
			local var195 = var285
			local var196, var197 = protoModule.writeTag(buff, var1, 28, protoModule.wireTypes.lengthDelimited)
			var196, var289 = protoModule.writeBuffer(var196, var197, var194, var195)
			buff = var196
			var1 = var197
		end
	end
	if self.notification_badge ~= nil and next(self.notification_badge) ~= nil then
		for i, v in self.notification_badge do
			local var198, var199 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var198, var291 = protoModule.writeString(var198, var199, i)
			local var200 = v:encode()
			var199, var293 = protoModule.writeTag(var198, var199, 2, protoModule.wireTypes.lengthDelimited)
			var199, var293 = protoModule.writeBuffer(var199, var293, var200, buffer.len(var200))
			local var201 = var199
			local var202 = var293
			local var203, var204 = protoModule.writeTag(buff, var1, 29, protoModule.wireTypes.lengthDelimited)
			var203, var297 = protoModule.writeBuffer(var203, var204, var201, var202)
			buff = var203
			var1 = var204
		end
	end
	if self.collectible_item ~= nil and next(self.collectible_item) ~= nil then
		for i, v in self.collectible_item do
			local var205, var206 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var205, var299 = protoModule.writeString(var205, var206, i)
			local var207 = v:encode()
			var206, var301 = protoModule.writeTag(var205, var206, 2, protoModule.wireTypes.lengthDelimited)
			var206, var301 = protoModule.writeBuffer(var206, var301, var207, buffer.len(var207))
			local var208 = var206
			local var209 = var301
			local var210, var211 = protoModule.writeTag(buff, var1, 30, protoModule.wireTypes.lengthDelimited)
			var210, var305 = protoModule.writeBuffer(var210, var211, var208, var209)
			buff = var210
			var1 = var211
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), t (ref), badgeDataModule (ref), universeDataModule (ref), creatorDataModule (ref), eventDataModule (ref), songDataModule (ref), gamePassDataModule (ref), mediaAssetDataModule (ref), socialLinkDataModule (ref), gameDeveloperProductDataModule (ref), gameSubscriptionDataModule (ref), marketplaceCatalogCategoryDataModule (ref), marketplaceAssetDataModule (ref), marketplaceBundleDataModule (ref), marketplaceLookDataModule (ref), catalogSortDataModule (ref), ageRecommendationDataModule (ref), universeUserFollowDataModule (ref), universeUserVoteDataModule (ref), userProfileDataModule (ref), universeUserFavoriteDataModule (ref), playabilityDataModule (ref), universeUserFollowLimitDataModule (ref), universeUserVoteFeedbackMetadataDataModule (ref), momentDataModule (ref), communityDataModule (ref), communityUserMembershipDataModule (ref), friendRecommendationDataModule (ref), universePrivateServerDataModule (ref), notificationBadgeDataModule (ref), collectibleItemDataModule (ref)
	local var212 = t_1.new()
	local var213 = 0
	while var213 < buffer.len(p1) do
		local _ = nil
		local var214 = nil
		local var215, var216, var217 = protoModule.readTag(p1, var213)
		local var218 = var215
		var214 = var216
		var213 = var217
		
		if var214 == protoModule.wireTypes.varint then
			local _ = nil
			local var219, var220 = protoModule.readVarInt(p1, var213)
			local _ = var219
			var213 = var220
			continue
		end
		if var214 == protoModule.wireTypes.lengthDelimited then
			if var218 == 1 then
				local _ = nil
				local var221, var222 = protoModule.readBuffer(p1, var213)
				var213 = var222
				var221 = t.HydrationContent_BadgeEntry.decode(var221)
				var212.badge[var221.key or ""] = var221.value or badgeDataModule.BadgeData.new()
			elseif var218 == 2 then
				local _ = nil
				local var223, var224 = protoModule.readBuffer(p1, var213)
				var213 = var224
				var223 = t.HydrationContent_UniverseEntry.decode(var223)
				var212.universe[var223.key or ""] = var223.value or universeDataModule.UniverseData.new()
			elseif var218 == 3 then
				local _ = nil
				local var225, var226 = protoModule.readBuffer(p1, var213)
				var213 = var226
				var225 = t.HydrationContent_CreatorEntry.decode(var225)
				var212.creator[var225.key or ""] = var225.value or creatorDataModule.CreatorData.new()
			elseif var218 == 4 then
				local _ = nil
				local var227, var228 = protoModule.readBuffer(p1, var213)
				var213 = var228
				var227 = t.HydrationContent_EventEntry.decode(var227)
				var212.event[var227.key or ""] = var227.value or eventDataModule.EventData.new()
			elseif var218 == 5 then
				local _ = nil
				local var229, var230 = protoModule.readBuffer(p1, var213)
				var213 = var230
				var229 = t.HydrationContent_SongEntry.decode(var229)
				var212.song[var229.key or ""] = var229.value or songDataModule.SongData.new()
			elseif var218 == 6 then
				local _ = nil
				local var231, var232 = protoModule.readBuffer(p1, var213)
				var213 = var232
				var231 = t.HydrationContent_GamePassEntry.decode(var231)
				var212.game_pass[var231.key or ""] = var231.value or gamePassDataModule.GamePassData.new()
			elseif var218 == 7 then
				local _ = nil
				local var233, var234 = protoModule.readBuffer(p1, var213)
				var213 = var234
				var233 = t.HydrationContent_MediaAssetEntry.decode(var233)
				var212.media_asset[var233.key or ""] = var233.value or mediaAssetDataModule.MediaAssetData.new()
			elseif var218 == 8 then
				local _ = nil
				local var235, var236 = protoModule.readBuffer(p1, var213)
				var213 = var236
				var235 = t.HydrationContent_SocialLinkEntry.decode(var235)
				var212.social_link[var235.key or ""] = var235.value or socialLinkDataModule.SocialLinkData.new()
			elseif var218 == 9 then
				local _ = nil
				local var237, var238 = protoModule.readBuffer(p1, var213)
				var213 = var238
				var237 = t.HydrationContent_GameDeveloperProductEntry.decode(var237)
				var212.game_developer_product[var237.key or ""] = var237.value or gameDeveloperProductDataModule.GameDeveloperProductData.new()
			elseif var218 == 10 then
				local _ = nil
				local var239, var240 = protoModule.readBuffer(p1, var213)
				var213 = var240
				var239 = t.HydrationContent_GameSubscriptionEntry.decode(var239)
				var212.game_subscription[var239.key or ""] = var239.value or gameSubscriptionDataModule.GameSubscriptionData.new()
			elseif var218 == 11 then
				local _ = nil
				local var241, var242 = protoModule.readBuffer(p1, var213)
				var213 = var242
				var241 = t.HydrationContent_MarketplaceCatalogCategoryEntry.decode(var241)
				var212.marketplace_catalog_category[var241.key or ""] = var241.value or marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.new()
			elseif var218 == 12 then
				local _ = nil
				local var243, var244 = protoModule.readBuffer(p1, var213)
				var213 = var244
				var243 = t.HydrationContent_MarketplaceAssetEntry.decode(var243)
				var212.marketplace_asset[var243.key or ""] = var243.value or marketplaceAssetDataModule.MarketplaceAssetData.new()
			elseif var218 == 13 then
				local _ = nil
				local var245, var246 = protoModule.readBuffer(p1, var213)
				var213 = var246
				var245 = t.HydrationContent_MarketplaceBundleEntry.decode(var245)
				var212.marketplace_bundle[var245.key or ""] = var245.value or marketplaceBundleDataModule.MarketplaceBundleData.new()
			elseif var218 == 14 then
				local _ = nil
				local var247, var248 = protoModule.readBuffer(p1, var213)
				var213 = var248
				var247 = t.HydrationContent_MarketplaceLookEntry.decode(var247)
				var212.marketplace_look[var247.key or ""] = var247.value or marketplaceLookDataModule.MarketplaceLookData.new()
			elseif var218 == 15 then
				local _ = nil
				local var249, var250 = protoModule.readBuffer(p1, var213)
				var213 = var250
				var249 = t.HydrationContent_CatalogSortEntry.decode(var249)
				var212.catalog_sort[var249.key or ""] = var249.value or catalogSortDataModule.CatalogSortData.new()
			elseif var218 == 16 then
				local _ = nil
				local var251, var252 = protoModule.readBuffer(p1, var213)
				var213 = var252
				var251 = t.HydrationContent_AgeRecommendationEntry.decode(var251)
				var212.age_recommendation[var251.key or ""] = var251.value or ageRecommendationDataModule.AgeRecommendationData.new()
			elseif var218 == 17 then
				local _ = nil
				local var253, var254 = protoModule.readBuffer(p1, var213)
				var213 = var254
				var253 = t.HydrationContent_UniverseUserFollowEntry.decode(var253)
				var212.universe_user_follow[var253.key or ""] = var253.value or universeUserFollowDataModule.UniverseUserFollowData.new()
			elseif var218 == 18 then
				local _ = nil
				local var255, var256 = protoModule.readBuffer(p1, var213)
				var213 = var256
				var255 = t.HydrationContent_UniverseUserVoteEntry.decode(var255)
				var212.universe_user_vote[var255.key or ""] = var255.value or universeUserVoteDataModule.UniverseUserVoteData.new()
			elseif var218 == 19 then
				local _ = nil
				local var257, var258 = protoModule.readBuffer(p1, var213)
				var213 = var258
				var257 = t.HydrationContent_UserProfileEntry.decode(var257)
				var212.user_profile[var257.key or ""] = var257.value or userProfileDataModule.UserProfileData.new()
			elseif var218 == 20 then
				local _ = nil
				local var259, var260 = protoModule.readBuffer(p1, var213)
				var213 = var260
				var259 = t.HydrationContent_UniverseUserFavoriteEntry.decode(var259)
				var212.universe_user_favorite[var259.key or ""] = var259.value or universeUserFavoriteDataModule.UniverseUserFavoriteData.new()
			elseif var218 == 21 then
				local _ = nil
				local var261, var262 = protoModule.readBuffer(p1, var213)
				var213 = var262
				var261 = t.HydrationContent_PlayabilityEntry.decode(var261)
				var212.playability[var261.key or ""] = var261.value or playabilityDataModule.PlayabilityData.new()
			elseif var218 == 22 then
				local _ = nil
				local var263, var264 = protoModule.readBuffer(p1, var213)
				var213 = var264
				var263 = t.HydrationContent_UniverseUserFollowLimitEntry.decode(var263)
				var212.universe_user_follow_limit[var263.key or ""] = var263.value or universeUserFollowLimitDataModule.UniverseUserFollowLimitData.new()
			elseif var218 == 23 then
				local _ = nil
				local var265, var266 = protoModule.readBuffer(p1, var213)
				var213 = var266
				var265 = t.HydrationContent_UniverseUserVoteFeedbackMetadataEntry.decode(var265)
				var212.universe_user_vote_feedback_metadata[var265.key or ""] = var265.value or universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.new()
			elseif var218 == 24 then
				local _ = nil
				local var267, var268 = protoModule.readBuffer(p1, var213)
				var213 = var268
				var267 = t.HydrationContent_MomentEntry.decode(var267)
				var212.moment[var267.key or ""] = var267.value or momentDataModule.MomentData.new()
			elseif var218 == 25 then
				local _ = nil
				local var269, var270 = protoModule.readBuffer(p1, var213)
				var213 = var270
				var269 = t.HydrationContent_CommunityEntry.decode(var269)
				var212.community[var269.key or ""] = var269.value or communityDataModule.CommunityData.new()
			elseif var218 == 26 then
				local _ = nil
				local var271, var272 = protoModule.readBuffer(p1, var213)
				var213 = var272
				var271 = t.HydrationContent_CommunityUserMembershipEntry.decode(var271)
				var212.community_user_membership[var271.key or ""] = var271.value or communityUserMembershipDataModule.CommunityUserMembershipData.new()
			elseif var218 == 27 then
				local _ = nil
				local var273, var274 = protoModule.readBuffer(p1, var213)
				var213 = var274
				var273 = t.HydrationContent_FriendRecommendationEntry.decode(var273)
				var212.friend_recommendation[var273.key or ""] = var273.value or friendRecommendationDataModule.FriendRecommendationData.new()
			elseif var218 == 28 then
				local _ = nil
				local var275, var276 = protoModule.readBuffer(p1, var213)
				var213 = var276
				var275 = t.HydrationContent_UniversePrivateServerEntry.decode(var275)
				var212.universe_private_server[var275.key or ""] = var275.value or universePrivateServerDataModule.UniversePrivateServerData.new()
			elseif var218 == 29 then
				local _ = nil
				local var277, var278 = protoModule.readBuffer(p1, var213)
				var213 = var278
				var277 = t.HydrationContent_NotificationBadgeEntry.decode(var277)
				var212.notification_badge[var277.key or ""] = var277.value or notificationBadgeDataModule.NotificationBadgeData.new()
			elseif var218 == 30 then
				local _ = nil
				local var279, var280 = protoModule.readBuffer(p1, var213)
				var213 = var280
				var279 = t.HydrationContent_CollectibleItemEntry.decode(var279)
				var212.collectible_item[var279.key or ""] = var279.value or collectibleItemDataModule.CollectibleItemData.new()
			else
				local _ = nil
				local var281, var282 = protoModule.readVarInt(p1, var213)
				var213 = var282 + var281
			end
		elseif var214 == protoModule.wireTypes.i32 then
			local _ = nil
			local var283, var284 = protoModule.readFixed32(p1, var213)
			local _ = var283
			var213 = var284
		elseif var214 == protoModule.wireTypes.i64 then
			local _ = nil
			local var285, var286 = protoModule.readFixed64(p1, var213)
			local _ = var285
			var213 = var286
		else
			error("Unsupported wire type: " .. var309)
		end
	end
	return var212
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
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), badgeDataModule (ref), universeDataModule (ref), creatorDataModule (ref), eventDataModule (ref), songDataModule (ref), gamePassDataModule (ref), mediaAssetDataModule (ref), socialLinkDataModule (ref), gameDeveloperProductDataModule (ref), gameSubscriptionDataModule (ref), marketplaceCatalogCategoryDataModule (ref), marketplaceAssetDataModule (ref), marketplaceBundleDataModule (ref), marketplaceLookDataModule (ref), catalogSortDataModule (ref), ageRecommendationDataModule (ref), universeUserFollowDataModule (ref), universeUserVoteDataModule (ref), userProfileDataModule (ref), universeUserFavoriteDataModule (ref), playabilityDataModule (ref), universeUserFollowLimitDataModule (ref), universeUserVoteFeedbackMetadataDataModule (ref), momentDataModule (ref), communityDataModule (ref), communityUserMembershipDataModule (ref), friendRecommendationDataModule (ref), universePrivateServerDataModule (ref), notificationBadgeDataModule (ref), collectibleItemDataModule (ref)
	local var287 = t_1.new()
	
	if self.badge ~= nil then
		local t = {}
		
		for i, v in self.badge do
			t[i] = badgeDataModule.BadgeData.jsonDecode(v)
		end
		var287.badge = t
	end
	if self.universe ~= nil then
		local t = {}
		
		for i, v in self.universe do
			t[i] = universeDataModule.UniverseData.jsonDecode(v)
		end
		var287.universe = t
	end
	if self.creator ~= nil then
		local t = {}
		
		for i, v in self.creator do
			t[i] = creatorDataModule.CreatorData.jsonDecode(v)
		end
		var287.creator = t
	end
	if self.event ~= nil then
		local t = {}
		
		for i, v in self.event do
			t[i] = eventDataModule.EventData.jsonDecode(v)
		end
		var287.event = t
	end
	if self.song ~= nil then
		local t = {}
		
		for i, v in self.song do
			t[i] = songDataModule.SongData.jsonDecode(v)
		end
		var287.song = t
	end
	if self.game_pass ~= nil then
		local t = {}
		
		for i, v in self.game_pass do
			t[i] = gamePassDataModule.GamePassData.jsonDecode(v)
		end
		var287.game_pass = t
	end
	if self.gamePass ~= nil then
		local t = {}
		
		for i, v in self.gamePass do
			t[i] = gamePassDataModule.GamePassData.jsonDecode(v)
		end
		var287.game_pass = t
	end
	if self.media_asset ~= nil then
		local t = {}
		
		for i, v in self.media_asset do
			t[i] = mediaAssetDataModule.MediaAssetData.jsonDecode(v)
		end
		var287.media_asset = t
	end
	if self.mediaAsset ~= nil then
		local t = {}
		
		for i, v in self.mediaAsset do
			t[i] = mediaAssetDataModule.MediaAssetData.jsonDecode(v)
		end
		var287.media_asset = t
	end
	if self.social_link ~= nil then
		local t = {}
		
		for i, v in self.social_link do
			t[i] = socialLinkDataModule.SocialLinkData.jsonDecode(v)
		end
		var287.social_link = t
	end
	if self.socialLink ~= nil then
		local t = {}
		
		for i, v in self.socialLink do
			t[i] = socialLinkDataModule.SocialLinkData.jsonDecode(v)
		end
		var287.social_link = t
	end
	if self.game_developer_product ~= nil then
		local t = {}
		
		for i, v in self.game_developer_product do
			t[i] = gameDeveloperProductDataModule.GameDeveloperProductData.jsonDecode(v)
		end
		var287.game_developer_product = t
	end
	if self.gameDeveloperProduct ~= nil then
		local t = {}
		
		for i, v in self.gameDeveloperProduct do
			t[i] = gameDeveloperProductDataModule.GameDeveloperProductData.jsonDecode(v)
		end
		var287.game_developer_product = t
	end
	if self.game_subscription ~= nil then
		local t = {}
		
		for i, v in self.game_subscription do
			t[i] = gameSubscriptionDataModule.GameSubscriptionData.jsonDecode(v)
		end
		var287.game_subscription = t
	end
	if self.gameSubscription ~= nil then
		local t = {}
		
		for i, v in self.gameSubscription do
			t[i] = gameSubscriptionDataModule.GameSubscriptionData.jsonDecode(v)
		end
		var287.game_subscription = t
	end
	if self.marketplace_catalog_category ~= nil then
		local t = {}
		
		for i, v in self.marketplace_catalog_category do
			t[i] = marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.jsonDecode(v)
		end
		var287.marketplace_catalog_category = t
	end
	if self.marketplaceCatalogCategory ~= nil then
		local t = {}
		
		for i, v in self.marketplaceCatalogCategory do
			t[i] = marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.jsonDecode(v)
		end
		var287.marketplace_catalog_category = t
	end
	if self.marketplace_asset ~= nil then
		local t = {}
		
		for i, v in self.marketplace_asset do
			t[i] = marketplaceAssetDataModule.MarketplaceAssetData.jsonDecode(v)
		end
		var287.marketplace_asset = t
	end
	if self.marketplaceAsset ~= nil then
		local t = {}
		
		for i, v in self.marketplaceAsset do
			t[i] = marketplaceAssetDataModule.MarketplaceAssetData.jsonDecode(v)
		end
		var287.marketplace_asset = t
	end
	if self.marketplace_bundle ~= nil then
		local t = {}
		
		for i, v in self.marketplace_bundle do
			t[i] = marketplaceBundleDataModule.MarketplaceBundleData.jsonDecode(v)
		end
		var287.marketplace_bundle = t
	end
	if self.marketplaceBundle ~= nil then
		local t = {}
		
		for i, v in self.marketplaceBundle do
			t[i] = marketplaceBundleDataModule.MarketplaceBundleData.jsonDecode(v)
		end
		var287.marketplace_bundle = t
	end
	if self.marketplace_look ~= nil then
		local t = {}
		
		for i, v in self.marketplace_look do
			t[i] = marketplaceLookDataModule.MarketplaceLookData.jsonDecode(v)
		end
		var287.marketplace_look = t
	end
	if self.marketplaceLook ~= nil then
		local t = {}
		
		for i, v in self.marketplaceLook do
			t[i] = marketplaceLookDataModule.MarketplaceLookData.jsonDecode(v)
		end
		var287.marketplace_look = t
	end
	if self.catalog_sort ~= nil then
		local t = {}
		
		for i, v in self.catalog_sort do
			t[i] = catalogSortDataModule.CatalogSortData.jsonDecode(v)
		end
		var287.catalog_sort = t
	end
	if self.catalogSort ~= nil then
		local t = {}
		
		for i, v in self.catalogSort do
			t[i] = catalogSortDataModule.CatalogSortData.jsonDecode(v)
		end
		var287.catalog_sort = t
	end
	if self.age_recommendation ~= nil then
		local t = {}
		
		for i, v in self.age_recommendation do
			t[i] = ageRecommendationDataModule.AgeRecommendationData.jsonDecode(v)
		end
		var287.age_recommendation = t
	end
	if self.ageRecommendation ~= nil then
		local t = {}
		
		for i, v in self.ageRecommendation do
			t[i] = ageRecommendationDataModule.AgeRecommendationData.jsonDecode(v)
		end
		var287.age_recommendation = t
	end
	if self.universe_user_follow ~= nil then
		local t = {}
		
		for i, v in self.universe_user_follow do
			t[i] = universeUserFollowDataModule.UniverseUserFollowData.jsonDecode(v)
		end
		var287.universe_user_follow = t
	end
	if self.universeUserFollow ~= nil then
		local t = {}
		
		for i, v in self.universeUserFollow do
			t[i] = universeUserFollowDataModule.UniverseUserFollowData.jsonDecode(v)
		end
		var287.universe_user_follow = t
	end
	if self.universe_user_vote ~= nil then
		local t = {}
		
		for i, v in self.universe_user_vote do
			t[i] = universeUserVoteDataModule.UniverseUserVoteData.jsonDecode(v)
		end
		var287.universe_user_vote = t
	end
	if self.universeUserVote ~= nil then
		local t = {}
		
		for i, v in self.universeUserVote do
			t[i] = universeUserVoteDataModule.UniverseUserVoteData.jsonDecode(v)
		end
		var287.universe_user_vote = t
	end
	if self.user_profile ~= nil then
		local t = {}
		
		for i, v in self.user_profile do
			t[i] = userProfileDataModule.UserProfileData.jsonDecode(v)
		end
		var287.user_profile = t
	end
	if self.userProfile ~= nil then
		local t = {}
		
		for i, v in self.userProfile do
			t[i] = userProfileDataModule.UserProfileData.jsonDecode(v)
		end
		var287.user_profile = t
	end
	if self.universe_user_favorite ~= nil then
		local t = {}
		
		for i, v in self.universe_user_favorite do
			t[i] = universeUserFavoriteDataModule.UniverseUserFavoriteData.jsonDecode(v)
		end
		var287.universe_user_favorite = t
	end
	if self.universeUserFavorite ~= nil then
		local t = {}
		
		for i, v in self.universeUserFavorite do
			t[i] = universeUserFavoriteDataModule.UniverseUserFavoriteData.jsonDecode(v)
		end
		var287.universe_user_favorite = t
	end
	if self.playability ~= nil then
		local t = {}
		
		for i, v in self.playability do
			t[i] = playabilityDataModule.PlayabilityData.jsonDecode(v)
		end
		var287.playability = t
	end
	if self.universe_user_follow_limit ~= nil then
		local t = {}
		
		for i, v in self.universe_user_follow_limit do
			t[i] = universeUserFollowLimitDataModule.UniverseUserFollowLimitData.jsonDecode(v)
		end
		var287.universe_user_follow_limit = t
	end
	if self.universeUserFollowLimit ~= nil then
		local t = {}
		
		for i, v in self.universeUserFollowLimit do
			t[i] = universeUserFollowLimitDataModule.UniverseUserFollowLimitData.jsonDecode(v)
		end
		var287.universe_user_follow_limit = t
	end
	if self.universe_user_vote_feedback_metadata ~= nil then
		local t = {}
		
		for i, v in self.universe_user_vote_feedback_metadata do
			t[i] = universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.jsonDecode(v)
		end
		var287.universe_user_vote_feedback_metadata = t
	end
	if self.universeUserVoteFeedbackMetadata ~= nil then
		local t = {}
		
		for i, v in self.universeUserVoteFeedbackMetadata do
			t[i] = universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.jsonDecode(v)
		end
		var287.universe_user_vote_feedback_metadata = t
	end
	if self.moment ~= nil then
		local t = {}
		
		for i, v in self.moment do
			t[i] = momentDataModule.MomentData.jsonDecode(v)
		end
		var287.moment = t
	end
	if self.community ~= nil then
		local t = {}
		
		for i, v in self.community do
			t[i] = communityDataModule.CommunityData.jsonDecode(v)
		end
		var287.community = t
	end
	if self.community_user_membership ~= nil then
		local t = {}
		
		for i, v in self.community_user_membership do
			t[i] = communityUserMembershipDataModule.CommunityUserMembershipData.jsonDecode(v)
		end
		var287.community_user_membership = t
	end
	if self.communityUserMembership ~= nil then
		local t = {}
		
		for i, v in self.communityUserMembership do
			t[i] = communityUserMembershipDataModule.CommunityUserMembershipData.jsonDecode(v)
		end
		var287.community_user_membership = t
	end
	if self.friend_recommendation ~= nil then
		local t = {}
		
		for i, v in self.friend_recommendation do
			t[i] = friendRecommendationDataModule.FriendRecommendationData.jsonDecode(v)
		end
		var287.friend_recommendation = t
	end
	if self.friendRecommendation ~= nil then
		local t = {}
		
		for i, v in self.friendRecommendation do
			t[i] = friendRecommendationDataModule.FriendRecommendationData.jsonDecode(v)
		end
		var287.friend_recommendation = t
	end
	if self.universe_private_server ~= nil then
		local t = {}
		
		for i, v in self.universe_private_server do
			t[i] = universePrivateServerDataModule.UniversePrivateServerData.jsonDecode(v)
		end
		var287.universe_private_server = t
	end
	if self.universePrivateServer ~= nil then
		local t = {}
		
		for i, v in self.universePrivateServer do
			t[i] = universePrivateServerDataModule.UniversePrivateServerData.jsonDecode(v)
		end
		var287.universe_private_server = t
	end
	if self.notification_badge ~= nil then
		local t = {}
		
		for i, v in self.notification_badge do
			t[i] = notificationBadgeDataModule.NotificationBadgeData.jsonDecode(v)
		end
		var287.notification_badge = t
	end
	if self.notificationBadge ~= nil then
		local t = {}
		
		for i, v in self.notificationBadge do
			t[i] = notificationBadgeDataModule.NotificationBadgeData.jsonDecode(v)
		end
		var287.notification_badge = t
	end
	if self.collectible_item ~= nil then
		local t = {}
		
		for i, v in self.collectible_item do
			t[i] = collectibleItemDataModule.CollectibleItemData.jsonDecode(v)
		end
		var287.collectible_item = t
	end
	if self.collectibleItem ~= nil then
		local t = {}
		
		for i, v in self.collectibleItem do
			t[i] = collectibleItemDataModule.CollectibleItemData.jsonDecode(v)
		end
		var287.collectible_item = t
	end
	return var287
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
	local var288 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var289, var290 = protoModule.writeTag(buff, var288, 1, protoModule.wireTypes.lengthDelimited)
		var289, var469 = protoModule.writeString(var289, var290, self.key)
		buff = var289
		var288 = var290
	end
	if self.value ~= nil then
		local var291 = self.value:encode()
		local var292, var293 = protoModule.writeTag(buff, var288, 2, protoModule.wireTypes.lengthDelimited)
		var292, var472 = protoModule.writeBuffer(var292, var293, var291, buffer.len(var291))
		buff = var292
		var288 = var293
	end
	local buff_1 = buffer.create(var288)
	buffer.copy(buff_1, 0, buff, 0, var288)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), badgeDataModule (ref)
	local var288 = t_2.new()
	local var289 = 0
	while var289 < buffer.len(p2) do
		local _ = nil
		local var290 = nil
		local var291, var292, var293 = protoModule.readTag(p2, var289)
		local var294 = var291
		var290 = var292
		var289 = var293
		
		if var290 == protoModule.wireTypes.varint then
			local _ = nil
			local var295, var296 = protoModule.readVarInt(p2, var289)
			local _ = var295
			var289 = var296
			continue
		end
		if var290 == protoModule.wireTypes.lengthDelimited then
			if var294 == 1 then
				local _ = nil
				local var297, var298 = protoModule.readBuffer(p2, var289)
				var289 = var298
				var288.key = buffer.tostring(var297)
			elseif var294 == 2 then
				local _ = nil
				local var299, var300 = protoModule.readBuffer(p2, var289)
				var289 = var300
				var288.value = badgeDataModule.BadgeData.decode(var299)
			else
				local _ = nil
				local var301, var302 = protoModule.readVarInt(p2, var289)
				var289 = var302 + var301
			end
		elseif var290 == protoModule.wireTypes.i32 then
			local _ = nil
			local var303, var304 = protoModule.readFixed32(p2, var289)
			local _ = var303
			var289 = var304
		elseif var290 == protoModule.wireTypes.i64 then
			local _ = nil
			local var305, var306 = protoModule.readFixed64(p2, var289)
			local _ = var305
			var289 = var306
		else
			error("Unsupported wire type: " .. var476)
		end
	end
	return var288
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
	local var307 = t_2.new()
	
	if self.key ~= nil then
		var307.key = self.key
	end
	if self.value ~= nil then
		var307.value = badgeDataModule.BadgeData.jsonDecode(self.value)
	end
	return var307
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
	local var307 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var308, var309 = protoModule.writeTag(buff, var307, 1, protoModule.wireTypes.lengthDelimited)
		var308, var498 = protoModule.writeString(var308, var309, self.key)
		buff = var308
		var307 = var309
	end
	if self.value ~= nil then
		local var310 = self.value:encode()
		local var311, var312 = protoModule.writeTag(buff, var307, 2, protoModule.wireTypes.lengthDelimited)
		var311, var501 = protoModule.writeBuffer(var311, var312, var310, buffer.len(var310))
		buff = var311
		var307 = var312
	end
	local buff_1 = buffer.create(var307)
	buffer.copy(buff_1, 0, buff, 0, var307)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), universeDataModule (ref)
	local var307 = t_3.new()
	local var308 = 0
	while var308 < buffer.len(p3) do
		local _ = nil
		local var309 = nil
		local var310, var311, var312 = protoModule.readTag(p3, var308)
		local var313 = var310
		var309 = var311
		var308 = var312
		
		if var309 == protoModule.wireTypes.varint then
			local _ = nil
			local var314, var315 = protoModule.readVarInt(p3, var308)
			local _ = var314
			var308 = var315
			continue
		end
		if var309 == protoModule.wireTypes.lengthDelimited then
			if var313 == 1 then
				local _ = nil
				local var316, var317 = protoModule.readBuffer(p3, var308)
				var308 = var317
				var307.key = buffer.tostring(var316)
			elseif var313 == 2 then
				local _ = nil
				local var318, var319 = protoModule.readBuffer(p3, var308)
				var308 = var319
				var307.value = universeDataModule.UniverseData.decode(var318)
			else
				local _ = nil
				local var320, var321 = protoModule.readVarInt(p3, var308)
				var308 = var321 + var320
			end
		elseif var309 == protoModule.wireTypes.i32 then
			local _ = nil
			local var322, var323 = protoModule.readFixed32(p3, var308)
			local _ = var322
			var308 = var323
		elseif var309 == protoModule.wireTypes.i64 then
			local _ = nil
			local var324, var325 = protoModule.readFixed64(p3, var308)
			local _ = var324
			var308 = var325
		else
			error("Unsupported wire type: " .. var505)
		end
	end
	return var307
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
	local var326 = t_3.new()
	
	if self.key ~= nil then
		var326.key = self.key
	end
	if self.value ~= nil then
		var326.value = universeDataModule.UniverseData.jsonDecode(self.value)
	end
	return var326
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
	local var326 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var327, var328 = protoModule.writeTag(buff, var326, 1, protoModule.wireTypes.lengthDelimited)
		var327, var527 = protoModule.writeString(var327, var328, self.key)
		buff = var327
		var326 = var328
	end
	if self.value ~= nil then
		local var329 = self.value:encode()
		local var330, var331 = protoModule.writeTag(buff, var326, 2, protoModule.wireTypes.lengthDelimited)
		var330, var530 = protoModule.writeBuffer(var330, var331, var329, buffer.len(var329))
		buff = var330
		var326 = var331
	end
	local buff_1 = buffer.create(var326)
	buffer.copy(buff_1, 0, buff, 0, var326)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), creatorDataModule (ref)
	local var326 = t_4.new()
	local var327 = 0
	while var327 < buffer.len(p4) do
		local _ = nil
		local var328 = nil
		local var329, var330, var331 = protoModule.readTag(p4, var327)
		local var332 = var329
		var328 = var330
		var327 = var331
		
		if var328 == protoModule.wireTypes.varint then
			local _ = nil
			local var333, var334 = protoModule.readVarInt(p4, var327)
			local _ = var333
			var327 = var334
			continue
		end
		if var328 == protoModule.wireTypes.lengthDelimited then
			if var332 == 1 then
				local _ = nil
				local var335, var336 = protoModule.readBuffer(p4, var327)
				var327 = var336
				var326.key = buffer.tostring(var335)
			elseif var332 == 2 then
				local _ = nil
				local var337, var338 = protoModule.readBuffer(p4, var327)
				var327 = var338
				var326.value = creatorDataModule.CreatorData.decode(var337)
			else
				local _ = nil
				local var339, var340 = protoModule.readVarInt(p4, var327)
				var327 = var340 + var339
			end
		elseif var328 == protoModule.wireTypes.i32 then
			local _ = nil
			local var341, var342 = protoModule.readFixed32(p4, var327)
			local _ = var341
			var327 = var342
		elseif var328 == protoModule.wireTypes.i64 then
			local _ = nil
			local var343, var344 = protoModule.readFixed64(p4, var327)
			local _ = var343
			var327 = var344
		else
			error("Unsupported wire type: " .. var534)
		end
	end
	return var326
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
	local var345 = t_4.new()
	
	if self.key ~= nil then
		var345.key = self.key
	end
	if self.value ~= nil then
		var345.value = creatorDataModule.CreatorData.jsonDecode(self.value)
	end
	return var345
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
	local var345 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var346, var347 = protoModule.writeTag(buff, var345, 1, protoModule.wireTypes.lengthDelimited)
		var346, var556 = protoModule.writeString(var346, var347, self.key)
		buff = var346
		var345 = var347
	end
	if self.value ~= nil then
		local var348 = self.value:encode()
		local var349, var350 = protoModule.writeTag(buff, var345, 2, protoModule.wireTypes.lengthDelimited)
		var349, var559 = protoModule.writeBuffer(var349, var350, var348, buffer.len(var348))
		buff = var349
		var345 = var350
	end
	local buff_1 = buffer.create(var345)
	buffer.copy(buff_1, 0, buff, 0, var345)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref), eventDataModule (ref)
	local var345 = t_5.new()
	local var346 = 0
	while var346 < buffer.len(p5) do
		local _ = nil
		local var347 = nil
		local var348, var349, var350 = protoModule.readTag(p5, var346)
		local var351 = var348
		var347 = var349
		var346 = var350
		
		if var347 == protoModule.wireTypes.varint then
			local _ = nil
			local var352, var353 = protoModule.readVarInt(p5, var346)
			local _ = var352
			var346 = var353
			continue
		end
		if var347 == protoModule.wireTypes.lengthDelimited then
			if var351 == 1 then
				local _ = nil
				local var354, var355 = protoModule.readBuffer(p5, var346)
				var346 = var355
				var345.key = buffer.tostring(var354)
			elseif var351 == 2 then
				local _ = nil
				local var356, var357 = protoModule.readBuffer(p5, var346)
				var346 = var357
				var345.value = eventDataModule.EventData.decode(var356)
			else
				local _ = nil
				local var358, var359 = protoModule.readVarInt(p5, var346)
				var346 = var359 + var358
			end
		elseif var347 == protoModule.wireTypes.i32 then
			local _ = nil
			local var360, var361 = protoModule.readFixed32(p5, var346)
			local _ = var360
			var346 = var361
		elseif var347 == protoModule.wireTypes.i64 then
			local _ = nil
			local var362, var363 = protoModule.readFixed64(p5, var346)
			local _ = var362
			var346 = var363
		else
			error("Unsupported wire type: " .. var563)
		end
	end
	return var345
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
	local var364 = t_5.new()
	
	if self.key ~= nil then
		var364.key = self.key
	end
	if self.value ~= nil then
		var364.value = eventDataModule.EventData.jsonDecode(self.value)
	end
	return var364
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
	local var364 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var365, var366 = protoModule.writeTag(buff, var364, 1, protoModule.wireTypes.lengthDelimited)
		var365, var585 = protoModule.writeString(var365, var366, self.key)
		buff = var365
		var364 = var366
	end
	if self.value ~= nil then
		local var367 = self.value:encode()
		local var368, var369 = protoModule.writeTag(buff, var364, 2, protoModule.wireTypes.lengthDelimited)
		var368, var588 = protoModule.writeBuffer(var368, var369, var367, buffer.len(var367))
		buff = var368
		var364 = var369
	end
	local buff_1 = buffer.create(var364)
	buffer.copy(buff_1, 0, buff, 0, var364)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), songDataModule (ref)
	local var364 = t_6.new()
	local var365 = 0
	while var365 < buffer.len(p6) do
		local _ = nil
		local var366 = nil
		local var367, var368, var369 = protoModule.readTag(p6, var365)
		local var370 = var367
		var366 = var368
		var365 = var369
		
		if var366 == protoModule.wireTypes.varint then
			local _ = nil
			local var371, var372 = protoModule.readVarInt(p6, var365)
			local _ = var371
			var365 = var372
			continue
		end
		if var366 == protoModule.wireTypes.lengthDelimited then
			if var370 == 1 then
				local _ = nil
				local var373, var374 = protoModule.readBuffer(p6, var365)
				var365 = var374
				var364.key = buffer.tostring(var373)
			elseif var370 == 2 then
				local _ = nil
				local var375, var376 = protoModule.readBuffer(p6, var365)
				var365 = var376
				var364.value = songDataModule.SongData.decode(var375)
			else
				local _ = nil
				local var377, var378 = protoModule.readVarInt(p6, var365)
				var365 = var378 + var377
			end
		elseif var366 == protoModule.wireTypes.i32 then
			local _ = nil
			local var379, var380 = protoModule.readFixed32(p6, var365)
			local _ = var379
			var365 = var380
		elseif var366 == protoModule.wireTypes.i64 then
			local _ = nil
			local var381, var382 = protoModule.readFixed64(p6, var365)
			local _ = var381
			var365 = var382
		else
			error("Unsupported wire type: " .. var592)
		end
	end
	return var364
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
	local var383 = t_6.new()
	
	if self.key ~= nil then
		var383.key = self.key
	end
	if self.value ~= nil then
		var383.value = songDataModule.SongData.jsonDecode(self.value)
	end
	return var383
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
	local var383 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var384, var385 = protoModule.writeTag(buff, var383, 1, protoModule.wireTypes.lengthDelimited)
		var384, var614 = protoModule.writeString(var384, var385, self.key)
		buff = var384
		var383 = var385
	end
	if self.value ~= nil then
		local var386 = self.value:encode()
		local var387, var388 = protoModule.writeTag(buff, var383, 2, protoModule.wireTypes.lengthDelimited)
		var387, var617 = protoModule.writeBuffer(var387, var388, var386, buffer.len(var386))
		buff = var387
		var383 = var388
	end
	local buff_1 = buffer.create(var383)
	buffer.copy(buff_1, 0, buff, 0, var383)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref), gamePassDataModule (ref)
	local var383 = t_7.new()
	local var384 = 0
	while var384 < buffer.len(p7) do
		local _ = nil
		local var385 = nil
		local var386, var387, var388 = protoModule.readTag(p7, var384)
		local var389 = var386
		var385 = var387
		var384 = var388
		
		if var385 == protoModule.wireTypes.varint then
			local _ = nil
			local var390, var391 = protoModule.readVarInt(p7, var384)
			local _ = var390
			var384 = var391
			continue
		end
		if var385 == protoModule.wireTypes.lengthDelimited then
			if var389 == 1 then
				local _ = nil
				local var392, var393 = protoModule.readBuffer(p7, var384)
				var384 = var393
				var383.key = buffer.tostring(var392)
			elseif var389 == 2 then
				local _ = nil
				local var394, var395 = protoModule.readBuffer(p7, var384)
				var384 = var395
				var383.value = gamePassDataModule.GamePassData.decode(var394)
			else
				local _ = nil
				local var396, var397 = protoModule.readVarInt(p7, var384)
				var384 = var397 + var396
			end
		elseif var385 == protoModule.wireTypes.i32 then
			local _ = nil
			local var398, var399 = protoModule.readFixed32(p7, var384)
			local _ = var398
			var384 = var399
		elseif var385 == protoModule.wireTypes.i64 then
			local _ = nil
			local var400, var401 = protoModule.readFixed64(p7, var384)
			local _ = var400
			var384 = var401
		else
			error("Unsupported wire type: " .. var621)
		end
	end
	return var383
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
	local var402 = t_7.new()
	
	if self.key ~= nil then
		var402.key = self.key
	end
	if self.value ~= nil then
		var402.value = gamePassDataModule.GamePassData.jsonDecode(self.value)
	end
	return var402
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
	local var402 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var403, var404 = protoModule.writeTag(buff, var402, 1, protoModule.wireTypes.lengthDelimited)
		var403, var643 = protoModule.writeString(var403, var404, self.key)
		buff = var403
		var402 = var404
	end
	if self.value ~= nil then
		local var405 = self.value:encode()
		local var406, var407 = protoModule.writeTag(buff, var402, 2, protoModule.wireTypes.lengthDelimited)
		var406, var646 = protoModule.writeBuffer(var406, var407, var405, buffer.len(var405))
		buff = var406
		var402 = var407
	end
	local buff_1 = buffer.create(var402)
	buffer.copy(buff_1, 0, buff, 0, var402)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), mediaAssetDataModule (ref)
	local var402 = t_8.new()
	local var403 = 0
	while var403 < buffer.len(p8) do
		local _ = nil
		local var404 = nil
		local var405, var406, var407 = protoModule.readTag(p8, var403)
		local var408 = var405
		var404 = var406
		var403 = var407
		
		if var404 == protoModule.wireTypes.varint then
			local _ = nil
			local var409, var410 = protoModule.readVarInt(p8, var403)
			local _ = var409
			var403 = var410
			continue
		end
		if var404 == protoModule.wireTypes.lengthDelimited then
			if var408 == 1 then
				local _ = nil
				local var411, var412 = protoModule.readBuffer(p8, var403)
				var403 = var412
				var402.key = buffer.tostring(var411)
			elseif var408 == 2 then
				local _ = nil
				local var413, var414 = protoModule.readBuffer(p8, var403)
				var403 = var414
				var402.value = mediaAssetDataModule.MediaAssetData.decode(var413)
			else
				local _ = nil
				local var415, var416 = protoModule.readVarInt(p8, var403)
				var403 = var416 + var415
			end
		elseif var404 == protoModule.wireTypes.i32 then
			local _ = nil
			local var417, var418 = protoModule.readFixed32(p8, var403)
			local _ = var417
			var403 = var418
		elseif var404 == protoModule.wireTypes.i64 then
			local _ = nil
			local var419, var420 = protoModule.readFixed64(p8, var403)
			local _ = var419
			var403 = var420
		else
			error("Unsupported wire type: " .. var650)
		end
	end
	return var402
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
	local var421 = t_8.new()
	
	if self.key ~= nil then
		var421.key = self.key
	end
	if self.value ~= nil then
		var421.value = mediaAssetDataModule.MediaAssetData.jsonDecode(self.value)
	end
	return var421
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
	local var421 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var422, var423 = protoModule.writeTag(buff, var421, 1, protoModule.wireTypes.lengthDelimited)
		var422, var672 = protoModule.writeString(var422, var423, self.key)
		buff = var422
		var421 = var423
	end
	if self.value ~= nil then
		local var424 = self.value:encode()
		local var425, var426 = protoModule.writeTag(buff, var421, 2, protoModule.wireTypes.lengthDelimited)
		var425, var675 = protoModule.writeBuffer(var425, var426, var424, buffer.len(var424))
		buff = var425
		var421 = var426
	end
	local buff_1 = buffer.create(var421)
	buffer.copy(buff_1, 0, buff, 0, var421)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), socialLinkDataModule (ref)
	local var421 = t_9.new()
	local var422 = 0
	while var422 < buffer.len(p9) do
		local _ = nil
		local var423 = nil
		local var424, var425, var426 = protoModule.readTag(p9, var422)
		local var427 = var424
		var423 = var425
		var422 = var426
		
		if var423 == protoModule.wireTypes.varint then
			local _ = nil
			local var428, var429 = protoModule.readVarInt(p9, var422)
			local _ = var428
			var422 = var429
			continue
		end
		if var423 == protoModule.wireTypes.lengthDelimited then
			if var427 == 1 then
				local _ = nil
				local var430, var431 = protoModule.readBuffer(p9, var422)
				var422 = var431
				var421.key = buffer.tostring(var430)
			elseif var427 == 2 then
				local _ = nil
				local var432, var433 = protoModule.readBuffer(p9, var422)
				var422 = var433
				var421.value = socialLinkDataModule.SocialLinkData.decode(var432)
			else
				local _ = nil
				local var434, var435 = protoModule.readVarInt(p9, var422)
				var422 = var435 + var434
			end
		elseif var423 == protoModule.wireTypes.i32 then
			local _ = nil
			local var436, var437 = protoModule.readFixed32(p9, var422)
			local _ = var436
			var422 = var437
		elseif var423 == protoModule.wireTypes.i64 then
			local _ = nil
			local var438, var439 = protoModule.readFixed64(p9, var422)
			local _ = var438
			var422 = var439
		else
			error("Unsupported wire type: " .. var679)
		end
	end
	return var421
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
	local var440 = t_9.new()
	
	if self.key ~= nil then
		var440.key = self.key
	end
	if self.value ~= nil then
		var440.value = socialLinkDataModule.SocialLinkData.jsonDecode(self.value)
	end
	return var440
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
	local var440 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var441, var442 = protoModule.writeTag(buff, var440, 1, protoModule.wireTypes.lengthDelimited)
		var441, var701 = protoModule.writeString(var441, var442, self.key)
		buff = var441
		var440 = var442
	end
	if self.value ~= nil then
		local var443 = self.value:encode()
		local var444, var445 = protoModule.writeTag(buff, var440, 2, protoModule.wireTypes.lengthDelimited)
		var444, var704 = protoModule.writeBuffer(var444, var445, var443, buffer.len(var443))
		buff = var444
		var440 = var445
	end
	local buff_1 = buffer.create(var440)
	buffer.copy(buff_1, 0, buff, 0, var440)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref), gameDeveloperProductDataModule (ref)
	local var440 = t_10.new()
	local var441 = 0
	while var441 < buffer.len(p10) do
		local _ = nil
		local var442 = nil
		local var443, var444, var445 = protoModule.readTag(p10, var441)
		local var446 = var443
		var442 = var444
		var441 = var445
		
		if var442 == protoModule.wireTypes.varint then
			local _ = nil
			local var447, var448 = protoModule.readVarInt(p10, var441)
			local _ = var447
			var441 = var448
			continue
		end
		if var442 == protoModule.wireTypes.lengthDelimited then
			if var446 == 1 then
				local _ = nil
				local var449, var450 = protoModule.readBuffer(p10, var441)
				var441 = var450
				var440.key = buffer.tostring(var449)
			elseif var446 == 2 then
				local _ = nil
				local var451, var452 = protoModule.readBuffer(p10, var441)
				var441 = var452
				var440.value = gameDeveloperProductDataModule.GameDeveloperProductData.decode(var451)
			else
				local _ = nil
				local var453, var454 = protoModule.readVarInt(p10, var441)
				var441 = var454 + var453
			end
		elseif var442 == protoModule.wireTypes.i32 then
			local _ = nil
			local var455, var456 = protoModule.readFixed32(p10, var441)
			local _ = var455
			var441 = var456
		elseif var442 == protoModule.wireTypes.i64 then
			local _ = nil
			local var457, var458 = protoModule.readFixed64(p10, var441)
			local _ = var457
			var441 = var458
		else
			error("Unsupported wire type: " .. var708)
		end
	end
	return var440
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
	local var459 = t_10.new()
	
	if self.key ~= nil then
		var459.key = self.key
	end
	if self.value ~= nil then
		var459.value = gameDeveloperProductDataModule.GameDeveloperProductData.jsonDecode(self.value)
	end
	return var459
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
	local var459 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var460, var461 = protoModule.writeTag(buff, var459, 1, protoModule.wireTypes.lengthDelimited)
		var460, var730 = protoModule.writeString(var460, var461, self.key)
		buff = var460
		var459 = var461
	end
	if self.value ~= nil then
		local var462 = self.value:encode()
		local var463, var464 = protoModule.writeTag(buff, var459, 2, protoModule.wireTypes.lengthDelimited)
		var463, var733 = protoModule.writeBuffer(var463, var464, var462, buffer.len(var462))
		buff = var463
		var459 = var464
	end
	local buff_1 = buffer.create(var459)
	buffer.copy(buff_1, 0, buff, 0, var459)
	
	return buff_1
end

function t_11.decode(p11)
	-- upvalues: t_11 (ref), protoModule (ref), gameSubscriptionDataModule (ref)
	local var459 = t_11.new()
	local var460 = 0
	while var460 < buffer.len(p11) do
		local _ = nil
		local var461 = nil
		local var462, var463, var464 = protoModule.readTag(p11, var460)
		local var465 = var462
		var461 = var463
		var460 = var464
		
		if var461 == protoModule.wireTypes.varint then
			local _ = nil
			local var466, var467 = protoModule.readVarInt(p11, var460)
			local _ = var466
			var460 = var467
			continue
		end
		if var461 == protoModule.wireTypes.lengthDelimited then
			if var465 == 1 then
				local _ = nil
				local var468, var469 = protoModule.readBuffer(p11, var460)
				var460 = var469
				var459.key = buffer.tostring(var468)
			elseif var465 == 2 then
				local _ = nil
				local var470, var471 = protoModule.readBuffer(p11, var460)
				var460 = var471
				var459.value = gameSubscriptionDataModule.GameSubscriptionData.decode(var470)
			else
				local _ = nil
				local var472, var473 = protoModule.readVarInt(p11, var460)
				var460 = var473 + var472
			end
		elseif var461 == protoModule.wireTypes.i32 then
			local _ = nil
			local var474, var475 = protoModule.readFixed32(p11, var460)
			local _ = var474
			var460 = var475
		elseif var461 == protoModule.wireTypes.i64 then
			local _ = nil
			local var476, var477 = protoModule.readFixed64(p11, var460)
			local _ = var476
			var460 = var477
		else
			error("Unsupported wire type: " .. var737)
		end
	end
	return var459
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
	local var478 = t_11.new()
	
	if self.key ~= nil then
		var478.key = self.key
	end
	if self.value ~= nil then
		var478.value = gameSubscriptionDataModule.GameSubscriptionData.jsonDecode(self.value)
	end
	return var478
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
	local var478 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var479, var480 = protoModule.writeTag(buff, var478, 1, protoModule.wireTypes.lengthDelimited)
		var479, var759 = protoModule.writeString(var479, var480, self.key)
		buff = var479
		var478 = var480
	end
	if self.value ~= nil then
		local var481 = self.value:encode()
		local var482, var483 = protoModule.writeTag(buff, var478, 2, protoModule.wireTypes.lengthDelimited)
		var482, var762 = protoModule.writeBuffer(var482, var483, var481, buffer.len(var481))
		buff = var482
		var478 = var483
	end
	local buff_1 = buffer.create(var478)
	buffer.copy(buff_1, 0, buff, 0, var478)
	
	return buff_1
end

function t_12.decode(p12)
	-- upvalues: t_12 (ref), protoModule (ref), marketplaceCatalogCategoryDataModule (ref)
	local var478 = t_12.new()
	local var479 = 0
	while var479 < buffer.len(p12) do
		local _ = nil
		local var480 = nil
		local var481, var482, var483 = protoModule.readTag(p12, var479)
		local var484 = var481
		var480 = var482
		var479 = var483
		
		if var480 == protoModule.wireTypes.varint then
			local _ = nil
			local var485, var486 = protoModule.readVarInt(p12, var479)
			local _ = var485
			var479 = var486
			continue
		end
		if var480 == protoModule.wireTypes.lengthDelimited then
			if var484 == 1 then
				local _ = nil
				local var487, var488 = protoModule.readBuffer(p12, var479)
				var479 = var488
				var478.key = buffer.tostring(var487)
			elseif var484 == 2 then
				local _ = nil
				local var489, var490 = protoModule.readBuffer(p12, var479)
				var479 = var490
				var478.value = marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.decode(var489)
			else
				local _ = nil
				local var491, var492 = protoModule.readVarInt(p12, var479)
				var479 = var492 + var491
			end
		elseif var480 == protoModule.wireTypes.i32 then
			local _ = nil
			local var493, var494 = protoModule.readFixed32(p12, var479)
			local _ = var493
			var479 = var494
		elseif var480 == protoModule.wireTypes.i64 then
			local _ = nil
			local var495, var496 = protoModule.readFixed64(p12, var479)
			local _ = var495
			var479 = var496
		else
			error("Unsupported wire type: " .. var766)
		end
	end
	return var478
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
	local var497 = t_12.new()
	
	if self.key ~= nil then
		var497.key = self.key
	end
	if self.value ~= nil then
		var497.value = marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.jsonDecode(self.value)
	end
	return var497
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
	local var497 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var498, var499 = protoModule.writeTag(buff, var497, 1, protoModule.wireTypes.lengthDelimited)
		var498, var788 = protoModule.writeString(var498, var499, self.key)
		buff = var498
		var497 = var499
	end
	if self.value ~= nil then
		local var500 = self.value:encode()
		local var501, var502 = protoModule.writeTag(buff, var497, 2, protoModule.wireTypes.lengthDelimited)
		var501, var791 = protoModule.writeBuffer(var501, var502, var500, buffer.len(var500))
		buff = var501
		var497 = var502
	end
	local buff_1 = buffer.create(var497)
	buffer.copy(buff_1, 0, buff, 0, var497)
	
	return buff_1
end

function t_13.decode(p13)
	-- upvalues: t_13 (ref), protoModule (ref), marketplaceAssetDataModule (ref)
	local var497 = t_13.new()
	local var498 = 0
	while var498 < buffer.len(p13) do
		local _ = nil
		local var499 = nil
		local var500, var501, var502 = protoModule.readTag(p13, var498)
		local var503 = var500
		var499 = var501
		var498 = var502
		
		if var499 == protoModule.wireTypes.varint then
			local _ = nil
			local var504, var505 = protoModule.readVarInt(p13, var498)
			local _ = var504
			var498 = var505
			continue
		end
		if var499 == protoModule.wireTypes.lengthDelimited then
			if var503 == 1 then
				local _ = nil
				local var506, var507 = protoModule.readBuffer(p13, var498)
				var498 = var507
				var497.key = buffer.tostring(var506)
			elseif var503 == 2 then
				local _ = nil
				local var508, var509 = protoModule.readBuffer(p13, var498)
				var498 = var509
				var497.value = marketplaceAssetDataModule.MarketplaceAssetData.decode(var508)
			else
				local _ = nil
				local var510, var511 = protoModule.readVarInt(p13, var498)
				var498 = var511 + var510
			end
		elseif var499 == protoModule.wireTypes.i32 then
			local _ = nil
			local var512, var513 = protoModule.readFixed32(p13, var498)
			local _ = var512
			var498 = var513
		elseif var499 == protoModule.wireTypes.i64 then
			local _ = nil
			local var514, var515 = protoModule.readFixed64(p13, var498)
			local _ = var514
			var498 = var515
		else
			error("Unsupported wire type: " .. var795)
		end
	end
	return var497
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
	local var516 = t_13.new()
	
	if self.key ~= nil then
		var516.key = self.key
	end
	if self.value ~= nil then
		var516.value = marketplaceAssetDataModule.MarketplaceAssetData.jsonDecode(self.value)
	end
	return var516
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
	local var516 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var517, var518 = protoModule.writeTag(buff, var516, 1, protoModule.wireTypes.lengthDelimited)
		var517, var817 = protoModule.writeString(var517, var518, self.key)
		buff = var517
		var516 = var518
	end
	if self.value ~= nil then
		local var519 = self.value:encode()
		local var520, var521 = protoModule.writeTag(buff, var516, 2, protoModule.wireTypes.lengthDelimited)
		var520, var820 = protoModule.writeBuffer(var520, var521, var519, buffer.len(var519))
		buff = var520
		var516 = var521
	end
	local buff_1 = buffer.create(var516)
	buffer.copy(buff_1, 0, buff, 0, var516)
	
	return buff_1
end

function t_14.decode(p14)
	-- upvalues: t_14 (ref), protoModule (ref), marketplaceBundleDataModule (ref)
	local var516 = t_14.new()
	local var517 = 0
	while var517 < buffer.len(p14) do
		local _ = nil
		local var518 = nil
		local var519, var520, var521 = protoModule.readTag(p14, var517)
		local var522 = var519
		var518 = var520
		var517 = var521
		
		if var518 == protoModule.wireTypes.varint then
			local _ = nil
			local var523, var524 = protoModule.readVarInt(p14, var517)
			local _ = var523
			var517 = var524
			continue
		end
		if var518 == protoModule.wireTypes.lengthDelimited then
			if var522 == 1 then
				local _ = nil
				local var525, var526 = protoModule.readBuffer(p14, var517)
				var517 = var526
				var516.key = buffer.tostring(var525)
			elseif var522 == 2 then
				local _ = nil
				local var527, var528 = protoModule.readBuffer(p14, var517)
				var517 = var528
				var516.value = marketplaceBundleDataModule.MarketplaceBundleData.decode(var527)
			else
				local _ = nil
				local var529, var530 = protoModule.readVarInt(p14, var517)
				var517 = var530 + var529
			end
		elseif var518 == protoModule.wireTypes.i32 then
			local _ = nil
			local var531, var532 = protoModule.readFixed32(p14, var517)
			local _ = var531
			var517 = var532
		elseif var518 == protoModule.wireTypes.i64 then
			local _ = nil
			local var533, var534 = protoModule.readFixed64(p14, var517)
			local _ = var533
			var517 = var534
		else
			error("Unsupported wire type: " .. var824)
		end
	end
	return var516
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
	local var535 = t_14.new()
	
	if self.key ~= nil then
		var535.key = self.key
	end
	if self.value ~= nil then
		var535.value = marketplaceBundleDataModule.MarketplaceBundleData.jsonDecode(self.value)
	end
	return var535
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
	local var535 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var536, var537 = protoModule.writeTag(buff, var535, 1, protoModule.wireTypes.lengthDelimited)
		var536, var846 = protoModule.writeString(var536, var537, self.key)
		buff = var536
		var535 = var537
	end
	if self.value ~= nil then
		local var538 = self.value:encode()
		local var539, var540 = protoModule.writeTag(buff, var535, 2, protoModule.wireTypes.lengthDelimited)
		var539, var849 = protoModule.writeBuffer(var539, var540, var538, buffer.len(var538))
		buff = var539
		var535 = var540
	end
	local buff_1 = buffer.create(var535)
	buffer.copy(buff_1, 0, buff, 0, var535)
	
	return buff_1
end

function t_15.decode(p15)
	-- upvalues: t_15 (ref), protoModule (ref), marketplaceLookDataModule (ref)
	local var535 = t_15.new()
	local var536 = 0
	while var536 < buffer.len(p15) do
		local _ = nil
		local var537 = nil
		local var538, var539, var540 = protoModule.readTag(p15, var536)
		local var541 = var538
		var537 = var539
		var536 = var540
		
		if var537 == protoModule.wireTypes.varint then
			local _ = nil
			local var542, var543 = protoModule.readVarInt(p15, var536)
			local _ = var542
			var536 = var543
			continue
		end
		if var537 == protoModule.wireTypes.lengthDelimited then
			if var541 == 1 then
				local _ = nil
				local var544, var545 = protoModule.readBuffer(p15, var536)
				var536 = var545
				var535.key = buffer.tostring(var544)
			elseif var541 == 2 then
				local _ = nil
				local var546, var547 = protoModule.readBuffer(p15, var536)
				var536 = var547
				var535.value = marketplaceLookDataModule.MarketplaceLookData.decode(var546)
			else
				local _ = nil
				local var548, var549 = protoModule.readVarInt(p15, var536)
				var536 = var549 + var548
			end
		elseif var537 == protoModule.wireTypes.i32 then
			local _ = nil
			local var550, var551 = protoModule.readFixed32(p15, var536)
			local _ = var550
			var536 = var551
		elseif var537 == protoModule.wireTypes.i64 then
			local _ = nil
			local var552, var553 = protoModule.readFixed64(p15, var536)
			local _ = var552
			var536 = var553
		else
			error("Unsupported wire type: " .. var853)
		end
	end
	return var535
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
	local var554 = t_15.new()
	
	if self.key ~= nil then
		var554.key = self.key
	end
	if self.value ~= nil then
		var554.value = marketplaceLookDataModule.MarketplaceLookData.jsonDecode(self.value)
	end
	return var554
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
	local var554 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var555, var556 = protoModule.writeTag(buff, var554, 1, protoModule.wireTypes.lengthDelimited)
		var555, var875 = protoModule.writeString(var555, var556, self.key)
		buff = var555
		var554 = var556
	end
	if self.value ~= nil then
		local var557 = self.value:encode()
		local var558, var559 = protoModule.writeTag(buff, var554, 2, protoModule.wireTypes.lengthDelimited)
		var558, var878 = protoModule.writeBuffer(var558, var559, var557, buffer.len(var557))
		buff = var558
		var554 = var559
	end
	local buff_1 = buffer.create(var554)
	buffer.copy(buff_1, 0, buff, 0, var554)
	
	return buff_1
end

function t_16.decode(p16)
	-- upvalues: t_16 (ref), protoModule (ref), catalogSortDataModule (ref)
	local var554 = t_16.new()
	local var555 = 0
	while var555 < buffer.len(p16) do
		local _ = nil
		local var556 = nil
		local var557, var558, var559 = protoModule.readTag(p16, var555)
		local var560 = var557
		var556 = var558
		var555 = var559
		
		if var556 == protoModule.wireTypes.varint then
			local _ = nil
			local var561, var562 = protoModule.readVarInt(p16, var555)
			local _ = var561
			var555 = var562
			continue
		end
		if var556 == protoModule.wireTypes.lengthDelimited then
			if var560 == 1 then
				local _ = nil
				local var563, var564 = protoModule.readBuffer(p16, var555)
				var555 = var564
				var554.key = buffer.tostring(var563)
			elseif var560 == 2 then
				local _ = nil
				local var565, var566 = protoModule.readBuffer(p16, var555)
				var555 = var566
				var554.value = catalogSortDataModule.CatalogSortData.decode(var565)
			else
				local _ = nil
				local var567, var568 = protoModule.readVarInt(p16, var555)
				var555 = var568 + var567
			end
		elseif var556 == protoModule.wireTypes.i32 then
			local _ = nil
			local var569, var570 = protoModule.readFixed32(p16, var555)
			local _ = var569
			var555 = var570
		elseif var556 == protoModule.wireTypes.i64 then
			local _ = nil
			local var571, var572 = protoModule.readFixed64(p16, var555)
			local _ = var571
			var555 = var572
		else
			error("Unsupported wire type: " .. var882)
		end
	end
	return var554
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
	local var573 = t_16.new()
	
	if self.key ~= nil then
		var573.key = self.key
	end
	if self.value ~= nil then
		var573.value = catalogSortDataModule.CatalogSortData.jsonDecode(self.value)
	end
	return var573
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
	local var573 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var574, var575 = protoModule.writeTag(buff, var573, 1, protoModule.wireTypes.lengthDelimited)
		var574, var904 = protoModule.writeString(var574, var575, self.key)
		buff = var574
		var573 = var575
	end
	if self.value ~= nil then
		local var576 = self.value:encode()
		local var577, var578 = protoModule.writeTag(buff, var573, 2, protoModule.wireTypes.lengthDelimited)
		var577, var907 = protoModule.writeBuffer(var577, var578, var576, buffer.len(var576))
		buff = var577
		var573 = var578
	end
	local buff_1 = buffer.create(var573)
	buffer.copy(buff_1, 0, buff, 0, var573)
	
	return buff_1
end

function t_17.decode(p17)
	-- upvalues: t_17 (ref), protoModule (ref), ageRecommendationDataModule (ref)
	local var573 = t_17.new()
	local var574 = 0
	while var574 < buffer.len(p17) do
		local _ = nil
		local var575 = nil
		local var576, var577, var578 = protoModule.readTag(p17, var574)
		local var579 = var576
		var575 = var577
		var574 = var578
		
		if var575 == protoModule.wireTypes.varint then
			local _ = nil
			local var580, var581 = protoModule.readVarInt(p17, var574)
			local _ = var580
			var574 = var581
			continue
		end
		if var575 == protoModule.wireTypes.lengthDelimited then
			if var579 == 1 then
				local _ = nil
				local var582, var583 = protoModule.readBuffer(p17, var574)
				var574 = var583
				var573.key = buffer.tostring(var582)
			elseif var579 == 2 then
				local _ = nil
				local var584, var585 = protoModule.readBuffer(p17, var574)
				var574 = var585
				var573.value = ageRecommendationDataModule.AgeRecommendationData.decode(var584)
			else
				local _ = nil
				local var586, var587 = protoModule.readVarInt(p17, var574)
				var574 = var587 + var586
			end
		elseif var575 == protoModule.wireTypes.i32 then
			local _ = nil
			local var588, var589 = protoModule.readFixed32(p17, var574)
			local _ = var588
			var574 = var589
		elseif var575 == protoModule.wireTypes.i64 then
			local _ = nil
			local var590, var591 = protoModule.readFixed64(p17, var574)
			local _ = var590
			var574 = var591
		else
			error("Unsupported wire type: " .. var911)
		end
	end
	return var573
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
	local var592 = t_17.new()
	
	if self.key ~= nil then
		var592.key = self.key
	end
	if self.value ~= nil then
		var592.value = ageRecommendationDataModule.AgeRecommendationData.jsonDecode(self.value)
	end
	return var592
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
	local var592 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var593, var594 = protoModule.writeTag(buff, var592, 1, protoModule.wireTypes.lengthDelimited)
		var593, var933 = protoModule.writeString(var593, var594, self.key)
		buff = var593
		var592 = var594
	end
	if self.value ~= nil then
		local var595 = self.value:encode()
		local var596, var597 = protoModule.writeTag(buff, var592, 2, protoModule.wireTypes.lengthDelimited)
		var596, var936 = protoModule.writeBuffer(var596, var597, var595, buffer.len(var595))
		buff = var596
		var592 = var597
	end
	local buff_1 = buffer.create(var592)
	buffer.copy(buff_1, 0, buff, 0, var592)
	
	return buff_1
end

function t_18.decode(p18)
	-- upvalues: t_18 (ref), protoModule (ref), universeUserFollowDataModule (ref)
	local var592 = t_18.new()
	local var593 = 0
	while var593 < buffer.len(p18) do
		local _ = nil
		local var594 = nil
		local var595, var596, var597 = protoModule.readTag(p18, var593)
		local var598 = var595
		var594 = var596
		var593 = var597
		
		if var594 == protoModule.wireTypes.varint then
			local _ = nil
			local var599, var600 = protoModule.readVarInt(p18, var593)
			local _ = var599
			var593 = var600
			continue
		end
		if var594 == protoModule.wireTypes.lengthDelimited then
			if var598 == 1 then
				local _ = nil
				local var601, var602 = protoModule.readBuffer(p18, var593)
				var593 = var602
				var592.key = buffer.tostring(var601)
			elseif var598 == 2 then
				local _ = nil
				local var603, var604 = protoModule.readBuffer(p18, var593)
				var593 = var604
				var592.value = universeUserFollowDataModule.UniverseUserFollowData.decode(var603)
			else
				local _ = nil
				local var605, var606 = protoModule.readVarInt(p18, var593)
				var593 = var606 + var605
			end
		elseif var594 == protoModule.wireTypes.i32 then
			local _ = nil
			local var607, var608 = protoModule.readFixed32(p18, var593)
			local _ = var607
			var593 = var608
		elseif var594 == protoModule.wireTypes.i64 then
			local _ = nil
			local var609, var610 = protoModule.readFixed64(p18, var593)
			local _ = var609
			var593 = var610
		else
			error("Unsupported wire type: " .. var940)
		end
	end
	return var592
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
	local var611 = t_18.new()
	
	if self.key ~= nil then
		var611.key = self.key
	end
	if self.value ~= nil then
		var611.value = universeUserFollowDataModule.UniverseUserFollowData.jsonDecode(self.value)
	end
	return var611
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
	local var611 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var612, var613 = protoModule.writeTag(buff, var611, 1, protoModule.wireTypes.lengthDelimited)
		var612, var962 = protoModule.writeString(var612, var613, self.key)
		buff = var612
		var611 = var613
	end
	if self.value ~= nil then
		local var614 = self.value:encode()
		local var615, var616 = protoModule.writeTag(buff, var611, 2, protoModule.wireTypes.lengthDelimited)
		var615, var965 = protoModule.writeBuffer(var615, var616, var614, buffer.len(var614))
		buff = var615
		var611 = var616
	end
	local buff_1 = buffer.create(var611)
	buffer.copy(buff_1, 0, buff, 0, var611)
	
	return buff_1
end

function t_19.decode(p19)
	-- upvalues: t_19 (ref), protoModule (ref), universeUserVoteDataModule (ref)
	local var611 = t_19.new()
	local var612 = 0
	while var612 < buffer.len(p19) do
		local _ = nil
		local var613 = nil
		local var614, var615, var616 = protoModule.readTag(p19, var612)
		local var617 = var614
		var613 = var615
		var612 = var616
		
		if var613 == protoModule.wireTypes.varint then
			local _ = nil
			local var618, var619 = protoModule.readVarInt(p19, var612)
			local _ = var618
			var612 = var619
			continue
		end
		if var613 == protoModule.wireTypes.lengthDelimited then
			if var617 == 1 then
				local _ = nil
				local var620, var621 = protoModule.readBuffer(p19, var612)
				var612 = var621
				var611.key = buffer.tostring(var620)
			elseif var617 == 2 then
				local _ = nil
				local var622, var623 = protoModule.readBuffer(p19, var612)
				var612 = var623
				var611.value = universeUserVoteDataModule.UniverseUserVoteData.decode(var622)
			else
				local _ = nil
				local var624, var625 = protoModule.readVarInt(p19, var612)
				var612 = var625 + var624
			end
		elseif var613 == protoModule.wireTypes.i32 then
			local _ = nil
			local var626, var627 = protoModule.readFixed32(p19, var612)
			local _ = var626
			var612 = var627
		elseif var613 == protoModule.wireTypes.i64 then
			local _ = nil
			local var628, var629 = protoModule.readFixed64(p19, var612)
			local _ = var628
			var612 = var629
		else
			error("Unsupported wire type: " .. var969)
		end
	end
	return var611
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
	local var630 = t_19.new()
	
	if self.key ~= nil then
		var630.key = self.key
	end
	if self.value ~= nil then
		var630.value = universeUserVoteDataModule.UniverseUserVoteData.jsonDecode(self.value)
	end
	return var630
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
	local var630 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var631, var632 = protoModule.writeTag(buff, var630, 1, protoModule.wireTypes.lengthDelimited)
		var631, var991 = protoModule.writeString(var631, var632, self.key)
		buff = var631
		var630 = var632
	end
	if self.value ~= nil then
		local var633 = self.value:encode()
		local var634, var635 = protoModule.writeTag(buff, var630, 2, protoModule.wireTypes.lengthDelimited)
		var634, var994 = protoModule.writeBuffer(var634, var635, var633, buffer.len(var633))
		buff = var634
		var630 = var635
	end
	local buff_1 = buffer.create(var630)
	buffer.copy(buff_1, 0, buff, 0, var630)
	
	return buff_1
end

function t_20.decode(p20)
	-- upvalues: t_20 (ref), protoModule (ref), userProfileDataModule (ref)
	local var630 = t_20.new()
	local var631 = 0
	while var631 < buffer.len(p20) do
		local _ = nil
		local var632 = nil
		local var633, var634, var635 = protoModule.readTag(p20, var631)
		local var636 = var633
		var632 = var634
		var631 = var635
		
		if var632 == protoModule.wireTypes.varint then
			local _ = nil
			local var637, var638 = protoModule.readVarInt(p20, var631)
			local _ = var637
			var631 = var638
			continue
		end
		if var632 == protoModule.wireTypes.lengthDelimited then
			if var636 == 1 then
				local _ = nil
				local var639, var640 = protoModule.readBuffer(p20, var631)
				var631 = var640
				var630.key = buffer.tostring(var639)
			elseif var636 == 2 then
				local _ = nil
				local var641, var642 = protoModule.readBuffer(p20, var631)
				var631 = var642
				var630.value = userProfileDataModule.UserProfileData.decode(var641)
			else
				local _ = nil
				local var643, var644 = protoModule.readVarInt(p20, var631)
				var631 = var644 + var643
			end
		elseif var632 == protoModule.wireTypes.i32 then
			local _ = nil
			local var645, var646 = protoModule.readFixed32(p20, var631)
			local _ = var645
			var631 = var646
		elseif var632 == protoModule.wireTypes.i64 then
			local _ = nil
			local var647, var648 = protoModule.readFixed64(p20, var631)
			local _ = var647
			var631 = var648
		else
			error("Unsupported wire type: " .. var998)
		end
	end
	return var630
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
	local var649 = t_20.new()
	
	if self.key ~= nil then
		var649.key = self.key
	end
	if self.value ~= nil then
		var649.value = userProfileDataModule.UserProfileData.jsonDecode(self.value)
	end
	return var649
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
	local var649 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var650, var651 = protoModule.writeTag(buff, var649, 1, protoModule.wireTypes.lengthDelimited)
		var650, var1020 = protoModule.writeString(var650, var651, self.key)
		buff = var650
		var649 = var651
	end
	if self.value ~= nil then
		local var652 = self.value:encode()
		local var653, var654 = protoModule.writeTag(buff, var649, 2, protoModule.wireTypes.lengthDelimited)
		var653, var1023 = protoModule.writeBuffer(var653, var654, var652, buffer.len(var652))
		buff = var653
		var649 = var654
	end
	local buff_1 = buffer.create(var649)
	buffer.copy(buff_1, 0, buff, 0, var649)
	
	return buff_1
end

function t_21.decode(p21)
	-- upvalues: t_21 (ref), protoModule (ref), universeUserFavoriteDataModule (ref)
	local var649 = t_21.new()
	local var650 = 0
	while var650 < buffer.len(p21) do
		local _ = nil
		local var651 = nil
		local var652, var653, var654 = protoModule.readTag(p21, var650)
		local var655 = var652
		var651 = var653
		var650 = var654
		
		if var651 == protoModule.wireTypes.varint then
			local _ = nil
			local var656, var657 = protoModule.readVarInt(p21, var650)
			local _ = var656
			var650 = var657
			continue
		end
		if var651 == protoModule.wireTypes.lengthDelimited then
			if var655 == 1 then
				local _ = nil
				local var658, var659 = protoModule.readBuffer(p21, var650)
				var650 = var659
				var649.key = buffer.tostring(var658)
			elseif var655 == 2 then
				local _ = nil
				local var660, var661 = protoModule.readBuffer(p21, var650)
				var650 = var661
				var649.value = universeUserFavoriteDataModule.UniverseUserFavoriteData.decode(var660)
			else
				local _ = nil
				local var662, var663 = protoModule.readVarInt(p21, var650)
				var650 = var663 + var662
			end
		elseif var651 == protoModule.wireTypes.i32 then
			local _ = nil
			local var664, var665 = protoModule.readFixed32(p21, var650)
			local _ = var664
			var650 = var665
		elseif var651 == protoModule.wireTypes.i64 then
			local _ = nil
			local var666, var667 = protoModule.readFixed64(p21, var650)
			local _ = var666
			var650 = var667
		else
			error("Unsupported wire type: " .. var1027)
		end
	end
	return var649
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
	local var668 = t_21.new()
	
	if self.key ~= nil then
		var668.key = self.key
	end
	if self.value ~= nil then
		var668.value = universeUserFavoriteDataModule.UniverseUserFavoriteData.jsonDecode(self.value)
	end
	return var668
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
	local var668 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var669, var670 = protoModule.writeTag(buff, var668, 1, protoModule.wireTypes.lengthDelimited)
		var669, var1049 = protoModule.writeString(var669, var670, self.key)
		buff = var669
		var668 = var670
	end
	if self.value ~= nil then
		local var671 = self.value:encode()
		local var672, var673 = protoModule.writeTag(buff, var668, 2, protoModule.wireTypes.lengthDelimited)
		var672, var1052 = protoModule.writeBuffer(var672, var673, var671, buffer.len(var671))
		buff = var672
		var668 = var673
	end
	local buff_1 = buffer.create(var668)
	buffer.copy(buff_1, 0, buff, 0, var668)
	
	return buff_1
end

function t_22.decode(p22)
	-- upvalues: t_22 (ref), protoModule (ref), playabilityDataModule (ref)
	local var668 = t_22.new()
	local var669 = 0
	while var669 < buffer.len(p22) do
		local _ = nil
		local var670 = nil
		local var671, var672, var673 = protoModule.readTag(p22, var669)
		local var674 = var671
		var670 = var672
		var669 = var673
		
		if var670 == protoModule.wireTypes.varint then
			local _ = nil
			local var675, var676 = protoModule.readVarInt(p22, var669)
			local _ = var675
			var669 = var676
			continue
		end
		if var670 == protoModule.wireTypes.lengthDelimited then
			if var674 == 1 then
				local _ = nil
				local var677, var678 = protoModule.readBuffer(p22, var669)
				var669 = var678
				var668.key = buffer.tostring(var677)
			elseif var674 == 2 then
				local _ = nil
				local var679, var680 = protoModule.readBuffer(p22, var669)
				var669 = var680
				var668.value = playabilityDataModule.PlayabilityData.decode(var679)
			else
				local _ = nil
				local var681, var682 = protoModule.readVarInt(p22, var669)
				var669 = var682 + var681
			end
		elseif var670 == protoModule.wireTypes.i32 then
			local _ = nil
			local var683, var684 = protoModule.readFixed32(p22, var669)
			local _ = var683
			var669 = var684
		elseif var670 == protoModule.wireTypes.i64 then
			local _ = nil
			local var685, var686 = protoModule.readFixed64(p22, var669)
			local _ = var685
			var669 = var686
		else
			error("Unsupported wire type: " .. var1056)
		end
	end
	return var668
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
	local var687 = t_22.new()
	
	if self.key ~= nil then
		var687.key = self.key
	end
	if self.value ~= nil then
		var687.value = playabilityDataModule.PlayabilityData.jsonDecode(self.value)
	end
	return var687
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
	local var687 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var688, var689 = protoModule.writeTag(buff, var687, 1, protoModule.wireTypes.lengthDelimited)
		var688, var1078 = protoModule.writeString(var688, var689, self.key)
		buff = var688
		var687 = var689
	end
	if self.value ~= nil then
		local var690 = self.value:encode()
		local var691, var692 = protoModule.writeTag(buff, var687, 2, protoModule.wireTypes.lengthDelimited)
		var691, var1081 = protoModule.writeBuffer(var691, var692, var690, buffer.len(var690))
		buff = var691
		var687 = var692
	end
	local buff_1 = buffer.create(var687)
	buffer.copy(buff_1, 0, buff, 0, var687)
	
	return buff_1
end

function t_23.decode(p23)
	-- upvalues: t_23 (ref), protoModule (ref), universeUserFollowLimitDataModule (ref)
	local var687 = t_23.new()
	local var688 = 0
	while var688 < buffer.len(p23) do
		local _ = nil
		local var689 = nil
		local var690, var691, var692 = protoModule.readTag(p23, var688)
		local var693 = var690
		var689 = var691
		var688 = var692
		
		if var689 == protoModule.wireTypes.varint then
			local _ = nil
			local var694, var695 = protoModule.readVarInt(p23, var688)
			local _ = var694
			var688 = var695
			continue
		end
		if var689 == protoModule.wireTypes.lengthDelimited then
			if var693 == 1 then
				local _ = nil
				local var696, var697 = protoModule.readBuffer(p23, var688)
				var688 = var697
				var687.key = buffer.tostring(var696)
			elseif var693 == 2 then
				local _ = nil
				local var698, var699 = protoModule.readBuffer(p23, var688)
				var688 = var699
				var687.value = universeUserFollowLimitDataModule.UniverseUserFollowLimitData.decode(var698)
			else
				local _ = nil
				local var700, var701 = protoModule.readVarInt(p23, var688)
				var688 = var701 + var700
			end
		elseif var689 == protoModule.wireTypes.i32 then
			local _ = nil
			local var702, var703 = protoModule.readFixed32(p23, var688)
			local _ = var702
			var688 = var703
		elseif var689 == protoModule.wireTypes.i64 then
			local _ = nil
			local var704, var705 = protoModule.readFixed64(p23, var688)
			local _ = var704
			var688 = var705
		else
			error("Unsupported wire type: " .. var1085)
		end
	end
	return var687
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
	local var706 = t_23.new()
	
	if self.key ~= nil then
		var706.key = self.key
	end
	if self.value ~= nil then
		var706.value = universeUserFollowLimitDataModule.UniverseUserFollowLimitData.jsonDecode(self.value)
	end
	return var706
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
	local var706 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var707, var708 = protoModule.writeTag(buff, var706, 1, protoModule.wireTypes.lengthDelimited)
		var707, var1107 = protoModule.writeString(var707, var708, self.key)
		buff = var707
		var706 = var708
	end
	if self.value ~= nil then
		local var709 = self.value:encode()
		local var710, var711 = protoModule.writeTag(buff, var706, 2, protoModule.wireTypes.lengthDelimited)
		var710, var1110 = protoModule.writeBuffer(var710, var711, var709, buffer.len(var709))
		buff = var710
		var706 = var711
	end
	local buff_1 = buffer.create(var706)
	buffer.copy(buff_1, 0, buff, 0, var706)
	
	return buff_1
end

function t_24.decode(p24)
	-- upvalues: t_24 (ref), protoModule (ref), universeUserVoteFeedbackMetadataDataModule (ref)
	local var706 = t_24.new()
	local var707 = 0
	while var707 < buffer.len(p24) do
		local _ = nil
		local var708 = nil
		local var709, var710, var711 = protoModule.readTag(p24, var707)
		local var712 = var709
		var708 = var710
		var707 = var711
		
		if var708 == protoModule.wireTypes.varint then
			local _ = nil
			local var713, var714 = protoModule.readVarInt(p24, var707)
			local _ = var713
			var707 = var714
			continue
		end
		if var708 == protoModule.wireTypes.lengthDelimited then
			if var712 == 1 then
				local _ = nil
				local var715, var716 = protoModule.readBuffer(p24, var707)
				var707 = var716
				var706.key = buffer.tostring(var715)
			elseif var712 == 2 then
				local _ = nil
				local var717, var718 = protoModule.readBuffer(p24, var707)
				var707 = var718
				var706.value = universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.decode(var717)
			else
				local _ = nil
				local var719, var720 = protoModule.readVarInt(p24, var707)
				var707 = var720 + var719
			end
		elseif var708 == protoModule.wireTypes.i32 then
			local _ = nil
			local var721, var722 = protoModule.readFixed32(p24, var707)
			local _ = var721
			var707 = var722
		elseif var708 == protoModule.wireTypes.i64 then
			local _ = nil
			local var723, var724 = protoModule.readFixed64(p24, var707)
			local _ = var723
			var707 = var724
		else
			error("Unsupported wire type: " .. var1114)
		end
	end
	return var706
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
	local var725 = t_24.new()
	
	if self.key ~= nil then
		var725.key = self.key
	end
	if self.value ~= nil then
		var725.value = universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.jsonDecode(self.value)
	end
	return var725
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
	local var725 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var726, var727 = protoModule.writeTag(buff, var725, 1, protoModule.wireTypes.lengthDelimited)
		var726, var1136 = protoModule.writeString(var726, var727, self.key)
		buff = var726
		var725 = var727
	end
	if self.value ~= nil then
		local var728 = self.value:encode()
		local var729, var730 = protoModule.writeTag(buff, var725, 2, protoModule.wireTypes.lengthDelimited)
		var729, var1139 = protoModule.writeBuffer(var729, var730, var728, buffer.len(var728))
		buff = var729
		var725 = var730
	end
	local buff_1 = buffer.create(var725)
	buffer.copy(buff_1, 0, buff, 0, var725)
	
	return buff_1
end

function t_25.decode(p25)
	-- upvalues: t_25 (ref), protoModule (ref), momentDataModule (ref)
	local var725 = t_25.new()
	local var726 = 0
	while var726 < buffer.len(p25) do
		local _ = nil
		local var727 = nil
		local var728, var729, var730 = protoModule.readTag(p25, var726)
		local var731 = var728
		var727 = var729
		var726 = var730
		
		if var727 == protoModule.wireTypes.varint then
			local _ = nil
			local var732, var733 = protoModule.readVarInt(p25, var726)
			local _ = var732
			var726 = var733
			continue
		end
		if var727 == protoModule.wireTypes.lengthDelimited then
			if var731 == 1 then
				local _ = nil
				local var734, var735 = protoModule.readBuffer(p25, var726)
				var726 = var735
				var725.key = buffer.tostring(var734)
			elseif var731 == 2 then
				local _ = nil
				local var736, var737 = protoModule.readBuffer(p25, var726)
				var726 = var737
				var725.value = momentDataModule.MomentData.decode(var736)
			else
				local _ = nil
				local var738, var739 = protoModule.readVarInt(p25, var726)
				var726 = var739 + var738
			end
		elseif var727 == protoModule.wireTypes.i32 then
			local _ = nil
			local var740, var741 = protoModule.readFixed32(p25, var726)
			local _ = var740
			var726 = var741
		elseif var727 == protoModule.wireTypes.i64 then
			local _ = nil
			local var742, var743 = protoModule.readFixed64(p25, var726)
			local _ = var742
			var726 = var743
		else
			error("Unsupported wire type: " .. var1143)
		end
	end
	return var725
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
	local var744 = t_25.new()
	
	if self.key ~= nil then
		var744.key = self.key
	end
	if self.value ~= nil then
		var744.value = momentDataModule.MomentData.jsonDecode(self.value)
	end
	return var744
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
	local var744 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var745, var746 = protoModule.writeTag(buff, var744, 1, protoModule.wireTypes.lengthDelimited)
		var745, var1165 = protoModule.writeString(var745, var746, self.key)
		buff = var745
		var744 = var746
	end
	if self.value ~= nil then
		local var747 = self.value:encode()
		local var748, var749 = protoModule.writeTag(buff, var744, 2, protoModule.wireTypes.lengthDelimited)
		var748, var1168 = protoModule.writeBuffer(var748, var749, var747, buffer.len(var747))
		buff = var748
		var744 = var749
	end
	local buff_1 = buffer.create(var744)
	buffer.copy(buff_1, 0, buff, 0, var744)
	
	return buff_1
end

function t_26.decode(p26)
	-- upvalues: t_26 (ref), protoModule (ref), communityDataModule (ref)
	local var744 = t_26.new()
	local var745 = 0
	while var745 < buffer.len(p26) do
		local _ = nil
		local var746 = nil
		local var747, var748, var749 = protoModule.readTag(p26, var745)
		local var750 = var747
		var746 = var748
		var745 = var749
		
		if var746 == protoModule.wireTypes.varint then
			local _ = nil
			local var751, var752 = protoModule.readVarInt(p26, var745)
			local _ = var751
			var745 = var752
			continue
		end
		if var746 == protoModule.wireTypes.lengthDelimited then
			if var750 == 1 then
				local _ = nil
				local var753, var754 = protoModule.readBuffer(p26, var745)
				var745 = var754
				var744.key = buffer.tostring(var753)
			elseif var750 == 2 then
				local _ = nil
				local var755, var756 = protoModule.readBuffer(p26, var745)
				var745 = var756
				var744.value = communityDataModule.CommunityData.decode(var755)
			else
				local _ = nil
				local var757, var758 = protoModule.readVarInt(p26, var745)
				var745 = var758 + var757
			end
		elseif var746 == protoModule.wireTypes.i32 then
			local _ = nil
			local var759, var760 = protoModule.readFixed32(p26, var745)
			local _ = var759
			var745 = var760
		elseif var746 == protoModule.wireTypes.i64 then
			local _ = nil
			local var761, var762 = protoModule.readFixed64(p26, var745)
			local _ = var761
			var745 = var762
		else
			error("Unsupported wire type: " .. var1172)
		end
	end
	return var744
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
	local var763 = t_26.new()
	
	if self.key ~= nil then
		var763.key = self.key
	end
	if self.value ~= nil then
		var763.value = communityDataModule.CommunityData.jsonDecode(self.value)
	end
	return var763
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
	local var763 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var764, var765 = protoModule.writeTag(buff, var763, 1, protoModule.wireTypes.lengthDelimited)
		var764, var1194 = protoModule.writeString(var764, var765, self.key)
		buff = var764
		var763 = var765
	end
	if self.value ~= nil then
		local var766 = self.value:encode()
		local var767, var768 = protoModule.writeTag(buff, var763, 2, protoModule.wireTypes.lengthDelimited)
		var767, var1197 = protoModule.writeBuffer(var767, var768, var766, buffer.len(var766))
		buff = var767
		var763 = var768
	end
	local buff_1 = buffer.create(var763)
	buffer.copy(buff_1, 0, buff, 0, var763)
	
	return buff_1
end

function t_27.decode(p27)
	-- upvalues: t_27 (ref), protoModule (ref), communityUserMembershipDataModule (ref)
	local var763 = t_27.new()
	local var764 = 0
	while var764 < buffer.len(p27) do
		local _ = nil
		local var765 = nil
		local var766, var767, var768 = protoModule.readTag(p27, var764)
		local var769 = var766
		var765 = var767
		var764 = var768
		
		if var765 == protoModule.wireTypes.varint then
			local _ = nil
			local var770, var771 = protoModule.readVarInt(p27, var764)
			local _ = var770
			var764 = var771
			continue
		end
		if var765 == protoModule.wireTypes.lengthDelimited then
			if var769 == 1 then
				local _ = nil
				local var772, var773 = protoModule.readBuffer(p27, var764)
				var764 = var773
				var763.key = buffer.tostring(var772)
			elseif var769 == 2 then
				local _ = nil
				local var774, var775 = protoModule.readBuffer(p27, var764)
				var764 = var775
				var763.value = communityUserMembershipDataModule.CommunityUserMembershipData.decode(var774)
			else
				local _ = nil
				local var776, var777 = protoModule.readVarInt(p27, var764)
				var764 = var777 + var776
			end
		elseif var765 == protoModule.wireTypes.i32 then
			local _ = nil
			local var778, var779 = protoModule.readFixed32(p27, var764)
			local _ = var778
			var764 = var779
		elseif var765 == protoModule.wireTypes.i64 then
			local _ = nil
			local var780, var781 = protoModule.readFixed64(p27, var764)
			local _ = var780
			var764 = var781
		else
			error("Unsupported wire type: " .. var1201)
		end
	end
	return var763
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
	local var782 = t_27.new()
	
	if self.key ~= nil then
		var782.key = self.key
	end
	if self.value ~= nil then
		var782.value = communityUserMembershipDataModule.CommunityUserMembershipData.jsonDecode(self.value)
	end
	return var782
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
	local var782 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var783, var784 = protoModule.writeTag(buff, var782, 1, protoModule.wireTypes.lengthDelimited)
		var783, var1223 = protoModule.writeString(var783, var784, self.key)
		buff = var783
		var782 = var784
	end
	if self.value ~= nil then
		local var785 = self.value:encode()
		local var786, var787 = protoModule.writeTag(buff, var782, 2, protoModule.wireTypes.lengthDelimited)
		var786, var1226 = protoModule.writeBuffer(var786, var787, var785, buffer.len(var785))
		buff = var786
		var782 = var787
	end
	local buff_1 = buffer.create(var782)
	buffer.copy(buff_1, 0, buff, 0, var782)
	
	return buff_1
end

function t_28.decode(p28)
	-- upvalues: t_28 (ref), protoModule (ref), friendRecommendationDataModule (ref)
	local var782 = t_28.new()
	local var783 = 0
	while var783 < buffer.len(p28) do
		local _ = nil
		local var784 = nil
		local var785, var786, var787 = protoModule.readTag(p28, var783)
		local var788 = var785
		var784 = var786
		var783 = var787
		
		if var784 == protoModule.wireTypes.varint then
			local _ = nil
			local var789, var790 = protoModule.readVarInt(p28, var783)
			local _ = var789
			var783 = var790
			continue
		end
		if var784 == protoModule.wireTypes.lengthDelimited then
			if var788 == 1 then
				local _ = nil
				local var791, var792 = protoModule.readBuffer(p28, var783)
				var783 = var792
				var782.key = buffer.tostring(var791)
			elseif var788 == 2 then
				local _ = nil
				local var793, var794 = protoModule.readBuffer(p28, var783)
				var783 = var794
				var782.value = friendRecommendationDataModule.FriendRecommendationData.decode(var793)
			else
				local _ = nil
				local var795, var796 = protoModule.readVarInt(p28, var783)
				var783 = var796 + var795
			end
		elseif var784 == protoModule.wireTypes.i32 then
			local _ = nil
			local var797, var798 = protoModule.readFixed32(p28, var783)
			local _ = var797
			var783 = var798
		elseif var784 == protoModule.wireTypes.i64 then
			local _ = nil
			local var799, var800 = protoModule.readFixed64(p28, var783)
			local _ = var799
			var783 = var800
		else
			error("Unsupported wire type: " .. var1230)
		end
	end
	return var782
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
	local var801 = t_28.new()
	
	if self.key ~= nil then
		var801.key = self.key
	end
	if self.value ~= nil then
		var801.value = friendRecommendationDataModule.FriendRecommendationData.jsonDecode(self.value)
	end
	return var801
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
	local var801 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var802, var803 = protoModule.writeTag(buff, var801, 1, protoModule.wireTypes.lengthDelimited)
		var802, var1252 = protoModule.writeString(var802, var803, self.key)
		buff = var802
		var801 = var803
	end
	if self.value ~= nil then
		local var804 = self.value:encode()
		local var805, var806 = protoModule.writeTag(buff, var801, 2, protoModule.wireTypes.lengthDelimited)
		var805, var1255 = protoModule.writeBuffer(var805, var806, var804, buffer.len(var804))
		buff = var805
		var801 = var806
	end
	local buff_1 = buffer.create(var801)
	buffer.copy(buff_1, 0, buff, 0, var801)
	
	return buff_1
end

function t_29.decode(p29)
	-- upvalues: t_29 (ref), protoModule (ref), universePrivateServerDataModule (ref)
	local var801 = t_29.new()
	local var802 = 0
	while var802 < buffer.len(p29) do
		local _ = nil
		local var803 = nil
		local var804, var805, var806 = protoModule.readTag(p29, var802)
		local var807 = var804
		var803 = var805
		var802 = var806
		
		if var803 == protoModule.wireTypes.varint then
			local _ = nil
			local var808, var809 = protoModule.readVarInt(p29, var802)
			local _ = var808
			var802 = var809
			continue
		end
		if var803 == protoModule.wireTypes.lengthDelimited then
			if var807 == 1 then
				local _ = nil
				local var810, var811 = protoModule.readBuffer(p29, var802)
				var802 = var811
				var801.key = buffer.tostring(var810)
			elseif var807 == 2 then
				local _ = nil
				local var812, var813 = protoModule.readBuffer(p29, var802)
				var802 = var813
				var801.value = universePrivateServerDataModule.UniversePrivateServerData.decode(var812)
			else
				local _ = nil
				local var814, var815 = protoModule.readVarInt(p29, var802)
				var802 = var815 + var814
			end
		elseif var803 == protoModule.wireTypes.i32 then
			local _ = nil
			local var816, var817 = protoModule.readFixed32(p29, var802)
			local _ = var816
			var802 = var817
		elseif var803 == protoModule.wireTypes.i64 then
			local _ = nil
			local var818, var819 = protoModule.readFixed64(p29, var802)
			local _ = var818
			var802 = var819
		else
			error("Unsupported wire type: " .. var1259)
		end
	end
	return var801
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
	local var820 = t_29.new()
	
	if self.key ~= nil then
		var820.key = self.key
	end
	if self.value ~= nil then
		var820.value = universePrivateServerDataModule.UniversePrivateServerData.jsonDecode(self.value)
	end
	return var820
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
	local var820 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var821, var822 = protoModule.writeTag(buff, var820, 1, protoModule.wireTypes.lengthDelimited)
		var821, var1281 = protoModule.writeString(var821, var822, self.key)
		buff = var821
		var820 = var822
	end
	if self.value ~= nil then
		local var823 = self.value:encode()
		local var824, var825 = protoModule.writeTag(buff, var820, 2, protoModule.wireTypes.lengthDelimited)
		var824, var1284 = protoModule.writeBuffer(var824, var825, var823, buffer.len(var823))
		buff = var824
		var820 = var825
	end
	local buff_1 = buffer.create(var820)
	buffer.copy(buff_1, 0, buff, 0, var820)
	
	return buff_1
end

function t_30.decode(p30)
	-- upvalues: t_30 (ref), protoModule (ref), notificationBadgeDataModule (ref)
	local var820 = t_30.new()
	local var821 = 0
	while var821 < buffer.len(p30) do
		local _ = nil
		local var822 = nil
		local var823, var824, var825 = protoModule.readTag(p30, var821)
		local var826 = var823
		var822 = var824
		var821 = var825
		
		if var822 == protoModule.wireTypes.varint then
			local _ = nil
			local var827, var828 = protoModule.readVarInt(p30, var821)
			local _ = var827
			var821 = var828
			continue
		end
		if var822 == protoModule.wireTypes.lengthDelimited then
			if var826 == 1 then
				local _ = nil
				local var829, var830 = protoModule.readBuffer(p30, var821)
				var821 = var830
				var820.key = buffer.tostring(var829)
			elseif var826 == 2 then
				local _ = nil
				local var831, var832 = protoModule.readBuffer(p30, var821)
				var821 = var832
				var820.value = notificationBadgeDataModule.NotificationBadgeData.decode(var831)
			else
				local _ = nil
				local var833, var834 = protoModule.readVarInt(p30, var821)
				var821 = var834 + var833
			end
		elseif var822 == protoModule.wireTypes.i32 then
			local _ = nil
			local var835, var836 = protoModule.readFixed32(p30, var821)
			local _ = var835
			var821 = var836
		elseif var822 == protoModule.wireTypes.i64 then
			local _ = nil
			local var837, var838 = protoModule.readFixed64(p30, var821)
			local _ = var837
			var821 = var838
		else
			error("Unsupported wire type: " .. var1288)
		end
	end
	return var820
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
	local var839 = t_30.new()
	
	if self.key ~= nil then
		var839.key = self.key
	end
	if self.value ~= nil then
		var839.value = notificationBadgeDataModule.NotificationBadgeData.jsonDecode(self.value)
	end
	return var839
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
	local var839 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var840, var841 = protoModule.writeTag(buff, var839, 1, protoModule.wireTypes.lengthDelimited)
		var840, var1310 = protoModule.writeString(var840, var841, self.key)
		buff = var840
		var839 = var841
	end
	if self.value ~= nil then
		local var842 = self.value:encode()
		local var843, var844 = protoModule.writeTag(buff, var839, 2, protoModule.wireTypes.lengthDelimited)
		var843, var1313 = protoModule.writeBuffer(var843, var844, var842, buffer.len(var842))
		buff = var843
		var839 = var844
	end
	local buff_1 = buffer.create(var839)
	buffer.copy(buff_1, 0, buff, 0, var839)
	
	return buff_1
end

function t_31.decode(p31)
	-- upvalues: t_31 (ref), protoModule (ref), collectibleItemDataModule (ref)
	local var839 = t_31.new()
	local var840 = 0
	while var840 < buffer.len(p31) do
		local _ = nil
		local var841 = nil
		local var842, var843, var844 = protoModule.readTag(p31, var840)
		local var845 = var842
		var841 = var843
		var840 = var844
		
		if var841 == protoModule.wireTypes.varint then
			local _ = nil
			local var846, var847 = protoModule.readVarInt(p31, var840)
			local _ = var846
			var840 = var847
			continue
		end
		if var841 == protoModule.wireTypes.lengthDelimited then
			if var845 == 1 then
				local _ = nil
				local var848, var849 = protoModule.readBuffer(p31, var840)
				var840 = var849
				var839.key = buffer.tostring(var848)
			elseif var845 == 2 then
				local _ = nil
				local var850, var851 = protoModule.readBuffer(p31, var840)
				var840 = var851
				var839.value = collectibleItemDataModule.CollectibleItemData.decode(var850)
			else
				local _ = nil
				local var852, var853 = protoModule.readVarInt(p31, var840)
				var840 = var853 + var852
			end
		elseif var841 == protoModule.wireTypes.i32 then
			local _ = nil
			local var854, var855 = protoModule.readFixed32(p31, var840)
			local _ = var854
			var840 = var855
		elseif var841 == protoModule.wireTypes.i64 then
			local _ = nil
			local var856, var857 = protoModule.readFixed64(p31, var840)
			local _ = var856
			var840 = var857
		else
			error("Unsupported wire type: " .. var1317)
		end
	end
	return var839
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
	local var858 = t_31.new()
	
	if self.key ~= nil then
		var858.key = self.key
	end
	if self.value ~= nil then
		var858.value = collectibleItemDataModule.CollectibleItemData.jsonDecode(self.value)
	end
	return var858
end

t_31.descriptor = {
	name = "HydrationContent_CollectibleItemEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.CollectibleItemEntry"
}
t.HydrationContent_CollectibleItemEntry = t_31
typeRegistryModule.default:register(t.HydrationContent_CollectibleItemEntry)

return { HydrationContent = t.HydrationContent }