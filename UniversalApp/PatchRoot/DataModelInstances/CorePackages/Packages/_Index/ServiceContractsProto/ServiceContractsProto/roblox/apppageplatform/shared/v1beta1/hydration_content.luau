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
local userRecommendationDataModule = require(script.Parent.user_recommendation_data)
local contactDataModule = require(script.Parent.contact_data)
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
		user_recommendation = if p1 == nil or p1.user_recommendation == nil then {} else p1.user_recommendation,
		contact = if p1 == nil or p1.contact == nil then {} else p1.contact
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.badge ~= nil and next(self.badge) ~= nil then
		for i, v in self.badge do
			local var2, var3 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2, var63 = protoModule.writeString(var2, var3, i)
			local var4 = v:encode()
			var3, var65 = protoModule.writeTag(var2, var3, 2, protoModule.wireTypes.lengthDelimited)
			var3, var65 = protoModule.writeBuffer(var3, var65, var4, buffer.len(var4))
			local var5 = var3
			local var6 = var65
			local var7, var8 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var7, var69 = protoModule.writeBuffer(var7, var8, var5, var6)
			buff = var7
			var1 = var8
		end
	end
	if self.universe ~= nil and next(self.universe) ~= nil then
		for i, v in self.universe do
			local var9, var10 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var9, var71 = protoModule.writeString(var9, var10, i)
			local var11 = v:encode()
			var10, var73 = protoModule.writeTag(var9, var10, 2, protoModule.wireTypes.lengthDelimited)
			var10, var73 = protoModule.writeBuffer(var10, var73, var11, buffer.len(var11))
			local var12 = var10
			local var13 = var73
			local var14, var15 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var14, var77 = protoModule.writeBuffer(var14, var15, var12, var13)
			buff = var14
			var1 = var15
		end
	end
	if self.creator ~= nil and next(self.creator) ~= nil then
		for i, v in self.creator do
			local var16, var17 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var16, var79 = protoModule.writeString(var16, var17, i)
			local var18 = v:encode()
			var17, var81 = protoModule.writeTag(var16, var17, 2, protoModule.wireTypes.lengthDelimited)
			var17, var81 = protoModule.writeBuffer(var17, var81, var18, buffer.len(var18))
			local var19 = var17
			local var20 = var81
			local var21, var22 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var21, var85 = protoModule.writeBuffer(var21, var22, var19, var20)
			buff = var21
			var1 = var22
		end
	end
	if self.event ~= nil and next(self.event) ~= nil then
		for i, v in self.event do
			local var23, var24 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var23, var87 = protoModule.writeString(var23, var24, i)
			local var25 = v:encode()
			var24, var89 = protoModule.writeTag(var23, var24, 2, protoModule.wireTypes.lengthDelimited)
			var24, var89 = protoModule.writeBuffer(var24, var89, var25, buffer.len(var25))
			local var26 = var24
			local var27 = var89
			local var28, var29 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
			var28, var93 = protoModule.writeBuffer(var28, var29, var26, var27)
			buff = var28
			var1 = var29
		end
	end
	if self.song ~= nil and next(self.song) ~= nil then
		for i, v in self.song do
			local var30, var31 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var30, var95 = protoModule.writeString(var30, var31, i)
			local var32 = v:encode()
			var31, var97 = protoModule.writeTag(var30, var31, 2, protoModule.wireTypes.lengthDelimited)
			var31, var97 = protoModule.writeBuffer(var31, var97, var32, buffer.len(var32))
			local var33 = var31
			local var34 = var97
			local var35, var36 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
			var35, var101 = protoModule.writeBuffer(var35, var36, var33, var34)
			buff = var35
			var1 = var36
		end
	end
	if self.game_pass ~= nil and next(self.game_pass) ~= nil then
		for i, v in self.game_pass do
			local var37, var38 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var37, var103 = protoModule.writeString(var37, var38, i)
			local var39 = v:encode()
			var38, var105 = protoModule.writeTag(var37, var38, 2, protoModule.wireTypes.lengthDelimited)
			var38, var105 = protoModule.writeBuffer(var38, var105, var39, buffer.len(var39))
			local var40 = var38
			local var41 = var105
			local var42, var43 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
			var42, var109 = protoModule.writeBuffer(var42, var43, var40, var41)
			buff = var42
			var1 = var43
		end
	end
	if self.media_asset ~= nil and next(self.media_asset) ~= nil then
		for i, v in self.media_asset do
			local var44, var45 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var44, var111 = protoModule.writeString(var44, var45, i)
			local var46 = v:encode()
			var45, var113 = protoModule.writeTag(var44, var45, 2, protoModule.wireTypes.lengthDelimited)
			var45, var113 = protoModule.writeBuffer(var45, var113, var46, buffer.len(var46))
			local var47 = var45
			local var48 = var113
			local var49, var50 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
			var49, var117 = protoModule.writeBuffer(var49, var50, var47, var48)
			buff = var49
			var1 = var50
		end
	end
	if self.social_link ~= nil and next(self.social_link) ~= nil then
		for i, v in self.social_link do
			local var51, var52 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var51, var119 = protoModule.writeString(var51, var52, i)
			local var53 = v:encode()
			var52, var121 = protoModule.writeTag(var51, var52, 2, protoModule.wireTypes.lengthDelimited)
			var52, var121 = protoModule.writeBuffer(var52, var121, var53, buffer.len(var53))
			local var54 = var52
			local var55 = var121
			local var56, var57 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
			var56, var125 = protoModule.writeBuffer(var56, var57, var54, var55)
			buff = var56
			var1 = var57
		end
	end
	if self.game_developer_product ~= nil and next(self.game_developer_product) ~= nil then
		for i, v in self.game_developer_product do
			local var58, var59 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var58, var127 = protoModule.writeString(var58, var59, i)
			local var60 = v:encode()
			var59, var129 = protoModule.writeTag(var58, var59, 2, protoModule.wireTypes.lengthDelimited)
			var59, var129 = protoModule.writeBuffer(var59, var129, var60, buffer.len(var60))
			local var61 = var59
			local var62 = var129
			local var63, var64 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
			var63, var133 = protoModule.writeBuffer(var63, var64, var61, var62)
			buff = var63
			var1 = var64
		end
	end
	if self.game_subscription ~= nil and next(self.game_subscription) ~= nil then
		for i, v in self.game_subscription do
			local var65, var66 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var65, var135 = protoModule.writeString(var65, var66, i)
			local var67 = v:encode()
			var66, var137 = protoModule.writeTag(var65, var66, 2, protoModule.wireTypes.lengthDelimited)
			var66, var137 = protoModule.writeBuffer(var66, var137, var67, buffer.len(var67))
			local var68 = var66
			local var69 = var137
			local var70, var71 = protoModule.writeTag(buff, var1, 10, protoModule.wireTypes.lengthDelimited)
			var70, var141 = protoModule.writeBuffer(var70, var71, var68, var69)
			buff = var70
			var1 = var71
		end
	end
	if self.marketplace_catalog_category ~= nil and next(self.marketplace_catalog_category) ~= nil then
		for i, v in self.marketplace_catalog_category do
			local var72, var73 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var72, var143 = protoModule.writeString(var72, var73, i)
			local var74 = v:encode()
			var73, var145 = protoModule.writeTag(var72, var73, 2, protoModule.wireTypes.lengthDelimited)
			var73, var145 = protoModule.writeBuffer(var73, var145, var74, buffer.len(var74))
			local var75 = var73
			local var76 = var145
			local var77, var78 = protoModule.writeTag(buff, var1, 11, protoModule.wireTypes.lengthDelimited)
			var77, var149 = protoModule.writeBuffer(var77, var78, var75, var76)
			buff = var77
			var1 = var78
		end
	end
	if self.marketplace_asset ~= nil and next(self.marketplace_asset) ~= nil then
		for i, v in self.marketplace_asset do
			local var79, var80 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var79, var151 = protoModule.writeString(var79, var80, i)
			local var81 = v:encode()
			var80, var153 = protoModule.writeTag(var79, var80, 2, protoModule.wireTypes.lengthDelimited)
			var80, var153 = protoModule.writeBuffer(var80, var153, var81, buffer.len(var81))
			local var82 = var80
			local var83 = var153
			local var84, var85 = protoModule.writeTag(buff, var1, 12, protoModule.wireTypes.lengthDelimited)
			var84, var157 = protoModule.writeBuffer(var84, var85, var82, var83)
			buff = var84
			var1 = var85
		end
	end
	if self.marketplace_bundle ~= nil and next(self.marketplace_bundle) ~= nil then
		for i, v in self.marketplace_bundle do
			local var86, var87 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var86, var159 = protoModule.writeString(var86, var87, i)
			local var88 = v:encode()
			var87, var161 = protoModule.writeTag(var86, var87, 2, protoModule.wireTypes.lengthDelimited)
			var87, var161 = protoModule.writeBuffer(var87, var161, var88, buffer.len(var88))
			local var89 = var87
			local var90 = var161
			local var91, var92 = protoModule.writeTag(buff, var1, 13, protoModule.wireTypes.lengthDelimited)
			var91, var165 = protoModule.writeBuffer(var91, var92, var89, var90)
			buff = var91
			var1 = var92
		end
	end
	if self.marketplace_look ~= nil and next(self.marketplace_look) ~= nil then
		for i, v in self.marketplace_look do
			local var93, var94 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var93, var167 = protoModule.writeString(var93, var94, i)
			local var95 = v:encode()
			var94, var169 = protoModule.writeTag(var93, var94, 2, protoModule.wireTypes.lengthDelimited)
			var94, var169 = protoModule.writeBuffer(var94, var169, var95, buffer.len(var95))
			local var96 = var94
			local var97 = var169
			local var98, var99 = protoModule.writeTag(buff, var1, 14, protoModule.wireTypes.lengthDelimited)
			var98, var173 = protoModule.writeBuffer(var98, var99, var96, var97)
			buff = var98
			var1 = var99
		end
	end
	if self.catalog_sort ~= nil and next(self.catalog_sort) ~= nil then
		for i, v in self.catalog_sort do
			local var100, var101 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var100, var175 = protoModule.writeString(var100, var101, i)
			local var102 = v:encode()
			var101, var177 = protoModule.writeTag(var100, var101, 2, protoModule.wireTypes.lengthDelimited)
			var101, var177 = protoModule.writeBuffer(var101, var177, var102, buffer.len(var102))
			local var103 = var101
			local var104 = var177
			local var105, var106 = protoModule.writeTag(buff, var1, 15, protoModule.wireTypes.lengthDelimited)
			var105, var181 = protoModule.writeBuffer(var105, var106, var103, var104)
			buff = var105
			var1 = var106
		end
	end
	if self.age_recommendation ~= nil and next(self.age_recommendation) ~= nil then
		for i, v in self.age_recommendation do
			local var107, var108 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var107, var183 = protoModule.writeString(var107, var108, i)
			local var109 = v:encode()
			var108, var185 = protoModule.writeTag(var107, var108, 2, protoModule.wireTypes.lengthDelimited)
			var108, var185 = protoModule.writeBuffer(var108, var185, var109, buffer.len(var109))
			local var110 = var108
			local var111 = var185
			local var112, var113 = protoModule.writeTag(buff, var1, 16, protoModule.wireTypes.lengthDelimited)
			var112, var189 = protoModule.writeBuffer(var112, var113, var110, var111)
			buff = var112
			var1 = var113
		end
	end
	if self.universe_user_follow ~= nil and next(self.universe_user_follow) ~= nil then
		for i, v in self.universe_user_follow do
			local var114, var115 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var114, var191 = protoModule.writeString(var114, var115, i)
			local var116 = v:encode()
			var115, var193 = protoModule.writeTag(var114, var115, 2, protoModule.wireTypes.lengthDelimited)
			var115, var193 = protoModule.writeBuffer(var115, var193, var116, buffer.len(var116))
			local var117 = var115
			local var118 = var193
			local var119, var120 = protoModule.writeTag(buff, var1, 17, protoModule.wireTypes.lengthDelimited)
			var119, var197 = protoModule.writeBuffer(var119, var120, var117, var118)
			buff = var119
			var1 = var120
		end
	end
	if self.universe_user_vote ~= nil and next(self.universe_user_vote) ~= nil then
		for i, v in self.universe_user_vote do
			local var121, var122 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var121, var199 = protoModule.writeString(var121, var122, i)
			local var123 = v:encode()
			var122, var201 = protoModule.writeTag(var121, var122, 2, protoModule.wireTypes.lengthDelimited)
			var122, var201 = protoModule.writeBuffer(var122, var201, var123, buffer.len(var123))
			local var124 = var122
			local var125 = var201
			local var126, var127 = protoModule.writeTag(buff, var1, 18, protoModule.wireTypes.lengthDelimited)
			var126, var205 = protoModule.writeBuffer(var126, var127, var124, var125)
			buff = var126
			var1 = var127
		end
	end
	if self.user_profile ~= nil and next(self.user_profile) ~= nil then
		for i, v in self.user_profile do
			local var128, var129 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var128, var207 = protoModule.writeString(var128, var129, i)
			local var130 = v:encode()
			var129, var209 = protoModule.writeTag(var128, var129, 2, protoModule.wireTypes.lengthDelimited)
			var129, var209 = protoModule.writeBuffer(var129, var209, var130, buffer.len(var130))
			local var131 = var129
			local var132 = var209
			local var133, var134 = protoModule.writeTag(buff, var1, 19, protoModule.wireTypes.lengthDelimited)
			var133, var213 = protoModule.writeBuffer(var133, var134, var131, var132)
			buff = var133
			var1 = var134
		end
	end
	if self.universe_user_favorite ~= nil and next(self.universe_user_favorite) ~= nil then
		for i, v in self.universe_user_favorite do
			local var135, var136 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var135, var215 = protoModule.writeString(var135, var136, i)
			local var137 = v:encode()
			var136, var217 = protoModule.writeTag(var135, var136, 2, protoModule.wireTypes.lengthDelimited)
			var136, var217 = protoModule.writeBuffer(var136, var217, var137, buffer.len(var137))
			local var138 = var136
			local var139 = var217
			local var140, var141 = protoModule.writeTag(buff, var1, 20, protoModule.wireTypes.lengthDelimited)
			var140, var221 = protoModule.writeBuffer(var140, var141, var138, var139)
			buff = var140
			var1 = var141
		end
	end
	if self.playability ~= nil and next(self.playability) ~= nil then
		for i, v in self.playability do
			local var142, var143 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var142, var223 = protoModule.writeString(var142, var143, i)
			local var144 = v:encode()
			var143, var225 = protoModule.writeTag(var142, var143, 2, protoModule.wireTypes.lengthDelimited)
			var143, var225 = protoModule.writeBuffer(var143, var225, var144, buffer.len(var144))
			local var145 = var143
			local var146 = var225
			local var147, var148 = protoModule.writeTag(buff, var1, 21, protoModule.wireTypes.lengthDelimited)
			var147, var229 = protoModule.writeBuffer(var147, var148, var145, var146)
			buff = var147
			var1 = var148
		end
	end
	if self.universe_user_follow_limit ~= nil and next(self.universe_user_follow_limit) ~= nil then
		for i, v in self.universe_user_follow_limit do
			local var149, var150 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var149, var231 = protoModule.writeString(var149, var150, i)
			local var151 = v:encode()
			var150, var233 = protoModule.writeTag(var149, var150, 2, protoModule.wireTypes.lengthDelimited)
			var150, var233 = protoModule.writeBuffer(var150, var233, var151, buffer.len(var151))
			local var152 = var150
			local var153 = var233
			local var154, var155 = protoModule.writeTag(buff, var1, 22, protoModule.wireTypes.lengthDelimited)
			var154, var237 = protoModule.writeBuffer(var154, var155, var152, var153)
			buff = var154
			var1 = var155
		end
	end
	if self.universe_user_vote_feedback_metadata ~= nil and next(self.universe_user_vote_feedback_metadata) ~= nil then
		for i, v in self.universe_user_vote_feedback_metadata do
			local var156, var157 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var156, var239 = protoModule.writeString(var156, var157, i)
			local var158 = v:encode()
			var157, var241 = protoModule.writeTag(var156, var157, 2, protoModule.wireTypes.lengthDelimited)
			var157, var241 = protoModule.writeBuffer(var157, var241, var158, buffer.len(var158))
			local var159 = var157
			local var160 = var241
			local var161, var162 = protoModule.writeTag(buff, var1, 23, protoModule.wireTypes.lengthDelimited)
			var161, var245 = protoModule.writeBuffer(var161, var162, var159, var160)
			buff = var161
			var1 = var162
		end
	end
	if self.moment ~= nil and next(self.moment) ~= nil then
		for i, v in self.moment do
			local var163, var164 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var163, var247 = protoModule.writeString(var163, var164, i)
			local var165 = v:encode()
			var164, var249 = protoModule.writeTag(var163, var164, 2, protoModule.wireTypes.lengthDelimited)
			var164, var249 = protoModule.writeBuffer(var164, var249, var165, buffer.len(var165))
			local var166 = var164
			local var167 = var249
			local var168, var169 = protoModule.writeTag(buff, var1, 24, protoModule.wireTypes.lengthDelimited)
			var168, var253 = protoModule.writeBuffer(var168, var169, var166, var167)
			buff = var168
			var1 = var169
		end
	end
	if self.community ~= nil and next(self.community) ~= nil then
		for i, v in self.community do
			local var170, var171 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var170, var255 = protoModule.writeString(var170, var171, i)
			local var172 = v:encode()
			var171, var257 = protoModule.writeTag(var170, var171, 2, protoModule.wireTypes.lengthDelimited)
			var171, var257 = protoModule.writeBuffer(var171, var257, var172, buffer.len(var172))
			local var173 = var171
			local var174 = var257
			local var175, var176 = protoModule.writeTag(buff, var1, 25, protoModule.wireTypes.lengthDelimited)
			var175, var261 = protoModule.writeBuffer(var175, var176, var173, var174)
			buff = var175
			var1 = var176
		end
	end
	if self.community_user_membership ~= nil and next(self.community_user_membership) ~= nil then
		for i, v in self.community_user_membership do
			local var177, var178 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var177, var263 = protoModule.writeString(var177, var178, i)
			local var179 = v:encode()
			var178, var265 = protoModule.writeTag(var177, var178, 2, protoModule.wireTypes.lengthDelimited)
			var178, var265 = protoModule.writeBuffer(var178, var265, var179, buffer.len(var179))
			local var180 = var178
			local var181 = var265
			local var182, var183 = protoModule.writeTag(buff, var1, 26, protoModule.wireTypes.lengthDelimited)
			var182, var269 = protoModule.writeBuffer(var182, var183, var180, var181)
			buff = var182
			var1 = var183
		end
	end
	if self.user_recommendation ~= nil and next(self.user_recommendation) ~= nil then
		for i, v in self.user_recommendation do
			local var184, var185 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var184, var271 = protoModule.writeString(var184, var185, i)
			local var186 = v:encode()
			var185, var273 = protoModule.writeTag(var184, var185, 2, protoModule.wireTypes.lengthDelimited)
			var185, var273 = protoModule.writeBuffer(var185, var273, var186, buffer.len(var186))
			local var187 = var185
			local var188 = var273
			local var189, var190 = protoModule.writeTag(buff, var1, 27, protoModule.wireTypes.lengthDelimited)
			var189, var277 = protoModule.writeBuffer(var189, var190, var187, var188)
			buff = var189
			var1 = var190
		end
	end
	if self.contact ~= nil and next(self.contact) ~= nil then
		for i, v in self.contact do
			local var191, var192 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var191, var279 = protoModule.writeString(var191, var192, i)
			local var193 = v:encode()
			var192, var281 = protoModule.writeTag(var191, var192, 2, protoModule.wireTypes.lengthDelimited)
			var192, var281 = protoModule.writeBuffer(var192, var281, var193, buffer.len(var193))
			local var194 = var192
			local var195 = var281
			local var196, var197 = protoModule.writeTag(buff, var1, 28, protoModule.wireTypes.lengthDelimited)
			var196, var285 = protoModule.writeBuffer(var196, var197, var194, var195)
			buff = var196
			var1 = var197
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), t (ref), badgeDataModule (ref), universeDataModule (ref), creatorDataModule (ref), eventDataModule (ref), songDataModule (ref), gamePassDataModule (ref), mediaAssetDataModule (ref), socialLinkDataModule (ref), gameDeveloperProductDataModule (ref), gameSubscriptionDataModule (ref), marketplaceCatalogCategoryDataModule (ref), marketplaceAssetDataModule (ref), marketplaceBundleDataModule (ref), marketplaceLookDataModule (ref), catalogSortDataModule (ref), ageRecommendationDataModule (ref), universeUserFollowDataModule (ref), universeUserVoteDataModule (ref), userProfileDataModule (ref), universeUserFavoriteDataModule (ref), playabilityDataModule (ref), universeUserFollowLimitDataModule (ref), universeUserVoteFeedbackMetadataDataModule (ref), momentDataModule (ref), communityDataModule (ref), communityUserMembershipDataModule (ref), userRecommendationDataModule (ref), contactDataModule (ref)
	local var198 = t_1.new()
	local var199 = 0
	while var199 < buffer.len(p1) do
		local _ = nil
		local var200 = nil
		local var201, var202, var203 = protoModule.readTag(p1, var199)
		local var204 = var201
		var200 = var202
		var199 = var203
		
		if var200 == protoModule.wireTypes.varint then
			local _ = nil
			local var205, var206 = protoModule.readVarInt(p1, var199)
			local _ = var205
			var199 = var206
			continue
		end
		if var200 == protoModule.wireTypes.lengthDelimited then
			if var204 == 1 then
				local _ = nil
				local var207, var208 = protoModule.readBuffer(p1, var199)
				var199 = var208
				var207 = t.HydrationContent_BadgeEntry.decode(var207)
				var198.badge[var207.key or ""] = var207.value or badgeDataModule.BadgeData.new()
			elseif var204 == 2 then
				local _ = nil
				local var209, var210 = protoModule.readBuffer(p1, var199)
				var199 = var210
				var209 = t.HydrationContent_UniverseEntry.decode(var209)
				var198.universe[var209.key or ""] = var209.value or universeDataModule.UniverseData.new()
			elseif var204 == 3 then
				local _ = nil
				local var211, var212 = protoModule.readBuffer(p1, var199)
				var199 = var212
				var211 = t.HydrationContent_CreatorEntry.decode(var211)
				var198.creator[var211.key or ""] = var211.value or creatorDataModule.CreatorData.new()
			elseif var204 == 4 then
				local _ = nil
				local var213, var214 = protoModule.readBuffer(p1, var199)
				var199 = var214
				var213 = t.HydrationContent_EventEntry.decode(var213)
				var198.event[var213.key or ""] = var213.value or eventDataModule.EventData.new()
			elseif var204 == 5 then
				local _ = nil
				local var215, var216 = protoModule.readBuffer(p1, var199)
				var199 = var216
				var215 = t.HydrationContent_SongEntry.decode(var215)
				var198.song[var215.key or ""] = var215.value or songDataModule.SongData.new()
			elseif var204 == 6 then
				local _ = nil
				local var217, var218 = protoModule.readBuffer(p1, var199)
				var199 = var218
				var217 = t.HydrationContent_GamePassEntry.decode(var217)
				var198.game_pass[var217.key or ""] = var217.value or gamePassDataModule.GamePassData.new()
			elseif var204 == 7 then
				local _ = nil
				local var219, var220 = protoModule.readBuffer(p1, var199)
				var199 = var220
				var219 = t.HydrationContent_MediaAssetEntry.decode(var219)
				var198.media_asset[var219.key or ""] = var219.value or mediaAssetDataModule.MediaAssetData.new()
			elseif var204 == 8 then
				local _ = nil
				local var221, var222 = protoModule.readBuffer(p1, var199)
				var199 = var222
				var221 = t.HydrationContent_SocialLinkEntry.decode(var221)
				var198.social_link[var221.key or ""] = var221.value or socialLinkDataModule.SocialLinkData.new()
			elseif var204 == 9 then
				local _ = nil
				local var223, var224 = protoModule.readBuffer(p1, var199)
				var199 = var224
				var223 = t.HydrationContent_GameDeveloperProductEntry.decode(var223)
				var198.game_developer_product[var223.key or ""] = var223.value or gameDeveloperProductDataModule.GameDeveloperProductData.new()
			elseif var204 == 10 then
				local _ = nil
				local var225, var226 = protoModule.readBuffer(p1, var199)
				var199 = var226
				var225 = t.HydrationContent_GameSubscriptionEntry.decode(var225)
				var198.game_subscription[var225.key or ""] = var225.value or gameSubscriptionDataModule.GameSubscriptionData.new()
			elseif var204 == 11 then
				local _ = nil
				local var227, var228 = protoModule.readBuffer(p1, var199)
				var199 = var228
				var227 = t.HydrationContent_MarketplaceCatalogCategoryEntry.decode(var227)
				var198.marketplace_catalog_category[var227.key or ""] = var227.value or marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.new()
			elseif var204 == 12 then
				local _ = nil
				local var229, var230 = protoModule.readBuffer(p1, var199)
				var199 = var230
				var229 = t.HydrationContent_MarketplaceAssetEntry.decode(var229)
				var198.marketplace_asset[var229.key or ""] = var229.value or marketplaceAssetDataModule.MarketplaceAssetData.new()
			elseif var204 == 13 then
				local _ = nil
				local var231, var232 = protoModule.readBuffer(p1, var199)
				var199 = var232
				var231 = t.HydrationContent_MarketplaceBundleEntry.decode(var231)
				var198.marketplace_bundle[var231.key or ""] = var231.value or marketplaceBundleDataModule.MarketplaceBundleData.new()
			elseif var204 == 14 then
				local _ = nil
				local var233, var234 = protoModule.readBuffer(p1, var199)
				var199 = var234
				var233 = t.HydrationContent_MarketplaceLookEntry.decode(var233)
				var198.marketplace_look[var233.key or ""] = var233.value or marketplaceLookDataModule.MarketplaceLookData.new()
			elseif var204 == 15 then
				local _ = nil
				local var235, var236 = protoModule.readBuffer(p1, var199)
				var199 = var236
				var235 = t.HydrationContent_CatalogSortEntry.decode(var235)
				var198.catalog_sort[var235.key or ""] = var235.value or catalogSortDataModule.CatalogSortData.new()
			elseif var204 == 16 then
				local _ = nil
				local var237, var238 = protoModule.readBuffer(p1, var199)
				var199 = var238
				var237 = t.HydrationContent_AgeRecommendationEntry.decode(var237)
				var198.age_recommendation[var237.key or ""] = var237.value or ageRecommendationDataModule.AgeRecommendationData.new()
			elseif var204 == 17 then
				local _ = nil
				local var239, var240 = protoModule.readBuffer(p1, var199)
				var199 = var240
				var239 = t.HydrationContent_UniverseUserFollowEntry.decode(var239)
				var198.universe_user_follow[var239.key or ""] = var239.value or universeUserFollowDataModule.UniverseUserFollowData.new()
			elseif var204 == 18 then
				local _ = nil
				local var241, var242 = protoModule.readBuffer(p1, var199)
				var199 = var242
				var241 = t.HydrationContent_UniverseUserVoteEntry.decode(var241)
				var198.universe_user_vote[var241.key or ""] = var241.value or universeUserVoteDataModule.UniverseUserVoteData.new()
			elseif var204 == 19 then
				local _ = nil
				local var243, var244 = protoModule.readBuffer(p1, var199)
				var199 = var244
				var243 = t.HydrationContent_UserProfileEntry.decode(var243)
				var198.user_profile[var243.key or ""] = var243.value or userProfileDataModule.UserProfileData.new()
			elseif var204 == 20 then
				local _ = nil
				local var245, var246 = protoModule.readBuffer(p1, var199)
				var199 = var246
				var245 = t.HydrationContent_UniverseUserFavoriteEntry.decode(var245)
				var198.universe_user_favorite[var245.key or ""] = var245.value or universeUserFavoriteDataModule.UniverseUserFavoriteData.new()
			elseif var204 == 21 then
				local _ = nil
				local var247, var248 = protoModule.readBuffer(p1, var199)
				var199 = var248
				var247 = t.HydrationContent_PlayabilityEntry.decode(var247)
				var198.playability[var247.key or ""] = var247.value or playabilityDataModule.PlayabilityData.new()
			elseif var204 == 22 then
				local _ = nil
				local var249, var250 = protoModule.readBuffer(p1, var199)
				var199 = var250
				var249 = t.HydrationContent_UniverseUserFollowLimitEntry.decode(var249)
				var198.universe_user_follow_limit[var249.key or ""] = var249.value or universeUserFollowLimitDataModule.UniverseUserFollowLimitData.new()
			elseif var204 == 23 then
				local _ = nil
				local var251, var252 = protoModule.readBuffer(p1, var199)
				var199 = var252
				var251 = t.HydrationContent_UniverseUserVoteFeedbackMetadataEntry.decode(var251)
				var198.universe_user_vote_feedback_metadata[var251.key or ""] = var251.value or universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.new()
			elseif var204 == 24 then
				local _ = nil
				local var253, var254 = protoModule.readBuffer(p1, var199)
				var199 = var254
				var253 = t.HydrationContent_MomentEntry.decode(var253)
				var198.moment[var253.key or ""] = var253.value or momentDataModule.MomentData.new()
			elseif var204 == 25 then
				local _ = nil
				local var255, var256 = protoModule.readBuffer(p1, var199)
				var199 = var256
				var255 = t.HydrationContent_CommunityEntry.decode(var255)
				var198.community[var255.key or ""] = var255.value or communityDataModule.CommunityData.new()
			elseif var204 == 26 then
				local _ = nil
				local var257, var258 = protoModule.readBuffer(p1, var199)
				var199 = var258
				var257 = t.HydrationContent_CommunityUserMembershipEntry.decode(var257)
				var198.community_user_membership[var257.key or ""] = var257.value or communityUserMembershipDataModule.CommunityUserMembershipData.new()
			elseif var204 == 27 then
				local _ = nil
				local var259, var260 = protoModule.readBuffer(p1, var199)
				var199 = var260
				var259 = t.HydrationContent_UserRecommendationEntry.decode(var259)
				var198.user_recommendation[var259.key or ""] = var259.value or userRecommendationDataModule.UserRecommendationData.new()
			elseif var204 == 28 then
				local _ = nil
				local var261, var262 = protoModule.readBuffer(p1, var199)
				var199 = var262
				var261 = t.HydrationContent_ContactEntry.decode(var261)
				var198.contact[var261.key or ""] = var261.value or contactDataModule.ContactData.new()
			else
				local _ = nil
				local var263, var264 = protoModule.readVarInt(p1, var199)
				var199 = var264 + var263
			end
		elseif var200 == protoModule.wireTypes.i32 then
			local _ = nil
			local var265, var266 = protoModule.readFixed32(p1, var199)
			local _ = var265
			var199 = var266
		elseif var200 == protoModule.wireTypes.i64 then
			local _ = nil
			local var267, var268 = protoModule.readFixed64(p1, var199)
			local _ = var267
			var199 = var268
		else
			error("Unsupported wire type: " .. var289)
		end
	end
	return var198
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
	if self.user_recommendation ~= nil and next(self.user_recommendation) ~= nil then
		local t_1 = {}
		
		for i, v in self.user_recommendation do
			t_1[i] = v:jsonEncode()
		end
		t.userRecommendation = t_1
	end
	if self.contact ~= nil and next(self.contact) ~= nil then
		local t_1 = {}
		
		for i, v in self.contact do
			t_1[i] = v:jsonEncode()
		end
		t.contact = t_1
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), badgeDataModule (ref), universeDataModule (ref), creatorDataModule (ref), eventDataModule (ref), songDataModule (ref), gamePassDataModule (ref), mediaAssetDataModule (ref), socialLinkDataModule (ref), gameDeveloperProductDataModule (ref), gameSubscriptionDataModule (ref), marketplaceCatalogCategoryDataModule (ref), marketplaceAssetDataModule (ref), marketplaceBundleDataModule (ref), marketplaceLookDataModule (ref), catalogSortDataModule (ref), ageRecommendationDataModule (ref), universeUserFollowDataModule (ref), universeUserVoteDataModule (ref), userProfileDataModule (ref), universeUserFavoriteDataModule (ref), playabilityDataModule (ref), universeUserFollowLimitDataModule (ref), universeUserVoteFeedbackMetadataDataModule (ref), momentDataModule (ref), communityDataModule (ref), communityUserMembershipDataModule (ref), userRecommendationDataModule (ref), contactDataModule (ref)
	local var269 = t_1.new()
	
	if self.badge ~= nil then
		local t = {}
		
		for i, v in self.badge do
			t[i] = badgeDataModule.BadgeData.jsonDecode(v)
		end
		var269.badge = t
	end
	if self.universe ~= nil then
		local t = {}
		
		for i, v in self.universe do
			t[i] = universeDataModule.UniverseData.jsonDecode(v)
		end
		var269.universe = t
	end
	if self.creator ~= nil then
		local t = {}
		
		for i, v in self.creator do
			t[i] = creatorDataModule.CreatorData.jsonDecode(v)
		end
		var269.creator = t
	end
	if self.event ~= nil then
		local t = {}
		
		for i, v in self.event do
			t[i] = eventDataModule.EventData.jsonDecode(v)
		end
		var269.event = t
	end
	if self.song ~= nil then
		local t = {}
		
		for i, v in self.song do
			t[i] = songDataModule.SongData.jsonDecode(v)
		end
		var269.song = t
	end
	if self.game_pass ~= nil then
		local t = {}
		
		for i, v in self.game_pass do
			t[i] = gamePassDataModule.GamePassData.jsonDecode(v)
		end
		var269.game_pass = t
	end
	if self.gamePass ~= nil then
		local t = {}
		
		for i, v in self.gamePass do
			t[i] = gamePassDataModule.GamePassData.jsonDecode(v)
		end
		var269.game_pass = t
	end
	if self.media_asset ~= nil then
		local t = {}
		
		for i, v in self.media_asset do
			t[i] = mediaAssetDataModule.MediaAssetData.jsonDecode(v)
		end
		var269.media_asset = t
	end
	if self.mediaAsset ~= nil then
		local t = {}
		
		for i, v in self.mediaAsset do
			t[i] = mediaAssetDataModule.MediaAssetData.jsonDecode(v)
		end
		var269.media_asset = t
	end
	if self.social_link ~= nil then
		local t = {}
		
		for i, v in self.social_link do
			t[i] = socialLinkDataModule.SocialLinkData.jsonDecode(v)
		end
		var269.social_link = t
	end
	if self.socialLink ~= nil then
		local t = {}
		
		for i, v in self.socialLink do
			t[i] = socialLinkDataModule.SocialLinkData.jsonDecode(v)
		end
		var269.social_link = t
	end
	if self.game_developer_product ~= nil then
		local t = {}
		
		for i, v in self.game_developer_product do
			t[i] = gameDeveloperProductDataModule.GameDeveloperProductData.jsonDecode(v)
		end
		var269.game_developer_product = t
	end
	if self.gameDeveloperProduct ~= nil then
		local t = {}
		
		for i, v in self.gameDeveloperProduct do
			t[i] = gameDeveloperProductDataModule.GameDeveloperProductData.jsonDecode(v)
		end
		var269.game_developer_product = t
	end
	if self.game_subscription ~= nil then
		local t = {}
		
		for i, v in self.game_subscription do
			t[i] = gameSubscriptionDataModule.GameSubscriptionData.jsonDecode(v)
		end
		var269.game_subscription = t
	end
	if self.gameSubscription ~= nil then
		local t = {}
		
		for i, v in self.gameSubscription do
			t[i] = gameSubscriptionDataModule.GameSubscriptionData.jsonDecode(v)
		end
		var269.game_subscription = t
	end
	if self.marketplace_catalog_category ~= nil then
		local t = {}
		
		for i, v in self.marketplace_catalog_category do
			t[i] = marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.jsonDecode(v)
		end
		var269.marketplace_catalog_category = t
	end
	if self.marketplaceCatalogCategory ~= nil then
		local t = {}
		
		for i, v in self.marketplaceCatalogCategory do
			t[i] = marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.jsonDecode(v)
		end
		var269.marketplace_catalog_category = t
	end
	if self.marketplace_asset ~= nil then
		local t = {}
		
		for i, v in self.marketplace_asset do
			t[i] = marketplaceAssetDataModule.MarketplaceAssetData.jsonDecode(v)
		end
		var269.marketplace_asset = t
	end
	if self.marketplaceAsset ~= nil then
		local t = {}
		
		for i, v in self.marketplaceAsset do
			t[i] = marketplaceAssetDataModule.MarketplaceAssetData.jsonDecode(v)
		end
		var269.marketplace_asset = t
	end
	if self.marketplace_bundle ~= nil then
		local t = {}
		
		for i, v in self.marketplace_bundle do
			t[i] = marketplaceBundleDataModule.MarketplaceBundleData.jsonDecode(v)
		end
		var269.marketplace_bundle = t
	end
	if self.marketplaceBundle ~= nil then
		local t = {}
		
		for i, v in self.marketplaceBundle do
			t[i] = marketplaceBundleDataModule.MarketplaceBundleData.jsonDecode(v)
		end
		var269.marketplace_bundle = t
	end
	if self.marketplace_look ~= nil then
		local t = {}
		
		for i, v in self.marketplace_look do
			t[i] = marketplaceLookDataModule.MarketplaceLookData.jsonDecode(v)
		end
		var269.marketplace_look = t
	end
	if self.marketplaceLook ~= nil then
		local t = {}
		
		for i, v in self.marketplaceLook do
			t[i] = marketplaceLookDataModule.MarketplaceLookData.jsonDecode(v)
		end
		var269.marketplace_look = t
	end
	if self.catalog_sort ~= nil then
		local t = {}
		
		for i, v in self.catalog_sort do
			t[i] = catalogSortDataModule.CatalogSortData.jsonDecode(v)
		end
		var269.catalog_sort = t
	end
	if self.catalogSort ~= nil then
		local t = {}
		
		for i, v in self.catalogSort do
			t[i] = catalogSortDataModule.CatalogSortData.jsonDecode(v)
		end
		var269.catalog_sort = t
	end
	if self.age_recommendation ~= nil then
		local t = {}
		
		for i, v in self.age_recommendation do
			t[i] = ageRecommendationDataModule.AgeRecommendationData.jsonDecode(v)
		end
		var269.age_recommendation = t
	end
	if self.ageRecommendation ~= nil then
		local t = {}
		
		for i, v in self.ageRecommendation do
			t[i] = ageRecommendationDataModule.AgeRecommendationData.jsonDecode(v)
		end
		var269.age_recommendation = t
	end
	if self.universe_user_follow ~= nil then
		local t = {}
		
		for i, v in self.universe_user_follow do
			t[i] = universeUserFollowDataModule.UniverseUserFollowData.jsonDecode(v)
		end
		var269.universe_user_follow = t
	end
	if self.universeUserFollow ~= nil then
		local t = {}
		
		for i, v in self.universeUserFollow do
			t[i] = universeUserFollowDataModule.UniverseUserFollowData.jsonDecode(v)
		end
		var269.universe_user_follow = t
	end
	if self.universe_user_vote ~= nil then
		local t = {}
		
		for i, v in self.universe_user_vote do
			t[i] = universeUserVoteDataModule.UniverseUserVoteData.jsonDecode(v)
		end
		var269.universe_user_vote = t
	end
	if self.universeUserVote ~= nil then
		local t = {}
		
		for i, v in self.universeUserVote do
			t[i] = universeUserVoteDataModule.UniverseUserVoteData.jsonDecode(v)
		end
		var269.universe_user_vote = t
	end
	if self.user_profile ~= nil then
		local t = {}
		
		for i, v in self.user_profile do
			t[i] = userProfileDataModule.UserProfileData.jsonDecode(v)
		end
		var269.user_profile = t
	end
	if self.userProfile ~= nil then
		local t = {}
		
		for i, v in self.userProfile do
			t[i] = userProfileDataModule.UserProfileData.jsonDecode(v)
		end
		var269.user_profile = t
	end
	if self.universe_user_favorite ~= nil then
		local t = {}
		
		for i, v in self.universe_user_favorite do
			t[i] = universeUserFavoriteDataModule.UniverseUserFavoriteData.jsonDecode(v)
		end
		var269.universe_user_favorite = t
	end
	if self.universeUserFavorite ~= nil then
		local t = {}
		
		for i, v in self.universeUserFavorite do
			t[i] = universeUserFavoriteDataModule.UniverseUserFavoriteData.jsonDecode(v)
		end
		var269.universe_user_favorite = t
	end
	if self.playability ~= nil then
		local t = {}
		
		for i, v in self.playability do
			t[i] = playabilityDataModule.PlayabilityData.jsonDecode(v)
		end
		var269.playability = t
	end
	if self.universe_user_follow_limit ~= nil then
		local t = {}
		
		for i, v in self.universe_user_follow_limit do
			t[i] = universeUserFollowLimitDataModule.UniverseUserFollowLimitData.jsonDecode(v)
		end
		var269.universe_user_follow_limit = t
	end
	if self.universeUserFollowLimit ~= nil then
		local t = {}
		
		for i, v in self.universeUserFollowLimit do
			t[i] = universeUserFollowLimitDataModule.UniverseUserFollowLimitData.jsonDecode(v)
		end
		var269.universe_user_follow_limit = t
	end
	if self.universe_user_vote_feedback_metadata ~= nil then
		local t = {}
		
		for i, v in self.universe_user_vote_feedback_metadata do
			t[i] = universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.jsonDecode(v)
		end
		var269.universe_user_vote_feedback_metadata = t
	end
	if self.universeUserVoteFeedbackMetadata ~= nil then
		local t = {}
		
		for i, v in self.universeUserVoteFeedbackMetadata do
			t[i] = universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.jsonDecode(v)
		end
		var269.universe_user_vote_feedback_metadata = t
	end
	if self.moment ~= nil then
		local t = {}
		
		for i, v in self.moment do
			t[i] = momentDataModule.MomentData.jsonDecode(v)
		end
		var269.moment = t
	end
	if self.community ~= nil then
		local t = {}
		
		for i, v in self.community do
			t[i] = communityDataModule.CommunityData.jsonDecode(v)
		end
		var269.community = t
	end
	if self.community_user_membership ~= nil then
		local t = {}
		
		for i, v in self.community_user_membership do
			t[i] = communityUserMembershipDataModule.CommunityUserMembershipData.jsonDecode(v)
		end
		var269.community_user_membership = t
	end
	if self.communityUserMembership ~= nil then
		local t = {}
		
		for i, v in self.communityUserMembership do
			t[i] = communityUserMembershipDataModule.CommunityUserMembershipData.jsonDecode(v)
		end
		var269.community_user_membership = t
	end
	if self.user_recommendation ~= nil then
		local t = {}
		
		for i, v in self.user_recommendation do
			t[i] = userRecommendationDataModule.UserRecommendationData.jsonDecode(v)
		end
		var269.user_recommendation = t
	end
	if self.userRecommendation ~= nil then
		local t = {}
		
		for i, v in self.userRecommendation do
			t[i] = userRecommendationDataModule.UserRecommendationData.jsonDecode(v)
		end
		var269.user_recommendation = t
	end
	if self.contact ~= nil then
		local t = {}
		
		for i, v in self.contact do
			t[i] = contactDataModule.ContactData.jsonDecode(v)
		end
		var269.contact = t
	end
	return var269
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
	local var270 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var271, var272 = protoModule.writeTag(buff, var270, 1, protoModule.wireTypes.lengthDelimited)
		var271, var438 = protoModule.writeString(var271, var272, self.key)
		buff = var271
		var270 = var272
	end
	if self.value ~= nil then
		local var273 = self.value:encode()
		local var274, var275 = protoModule.writeTag(buff, var270, 2, protoModule.wireTypes.lengthDelimited)
		var274, var441 = protoModule.writeBuffer(var274, var275, var273, buffer.len(var273))
		buff = var274
		var270 = var275
	end
	local buff_1 = buffer.create(var270)
	buffer.copy(buff_1, 0, buff, 0, var270)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), badgeDataModule (ref)
	local var270 = t_2.new()
	local var271 = 0
	while var271 < buffer.len(p2) do
		local _ = nil
		local var272 = nil
		local var273, var274, var275 = protoModule.readTag(p2, var271)
		local var276 = var273
		var272 = var274
		var271 = var275
		
		if var272 == protoModule.wireTypes.varint then
			local _ = nil
			local var277, var278 = protoModule.readVarInt(p2, var271)
			local _ = var277
			var271 = var278
			continue
		end
		if var272 == protoModule.wireTypes.lengthDelimited then
			if var276 == 1 then
				local _ = nil
				local var279, var280 = protoModule.readBuffer(p2, var271)
				var271 = var280
				var270.key = buffer.tostring(var279)
			elseif var276 == 2 then
				local _ = nil
				local var281, var282 = protoModule.readBuffer(p2, var271)
				var271 = var282
				var270.value = badgeDataModule.BadgeData.decode(var281)
			else
				local _ = nil
				local var283, var284 = protoModule.readVarInt(p2, var271)
				var271 = var284 + var283
			end
		elseif var272 == protoModule.wireTypes.i32 then
			local _ = nil
			local var285, var286 = protoModule.readFixed32(p2, var271)
			local _ = var285
			var271 = var286
		elseif var272 == protoModule.wireTypes.i64 then
			local _ = nil
			local var287, var288 = protoModule.readFixed64(p2, var271)
			local _ = var287
			var271 = var288
		else
			error("Unsupported wire type: " .. var445)
		end
	end
	return var270
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
	local var289 = t_2.new()
	
	if self.key ~= nil then
		var289.key = self.key
	end
	if self.value ~= nil then
		var289.value = badgeDataModule.BadgeData.jsonDecode(self.value)
	end
	return var289
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
	local var289 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var290, var291 = protoModule.writeTag(buff, var289, 1, protoModule.wireTypes.lengthDelimited)
		var290, var467 = protoModule.writeString(var290, var291, self.key)
		buff = var290
		var289 = var291
	end
	if self.value ~= nil then
		local var292 = self.value:encode()
		local var293, var294 = protoModule.writeTag(buff, var289, 2, protoModule.wireTypes.lengthDelimited)
		var293, var470 = protoModule.writeBuffer(var293, var294, var292, buffer.len(var292))
		buff = var293
		var289 = var294
	end
	local buff_1 = buffer.create(var289)
	buffer.copy(buff_1, 0, buff, 0, var289)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), universeDataModule (ref)
	local var289 = t_3.new()
	local var290 = 0
	while var290 < buffer.len(p3) do
		local _ = nil
		local var291 = nil
		local var292, var293, var294 = protoModule.readTag(p3, var290)
		local var295 = var292
		var291 = var293
		var290 = var294
		
		if var291 == protoModule.wireTypes.varint then
			local _ = nil
			local var296, var297 = protoModule.readVarInt(p3, var290)
			local _ = var296
			var290 = var297
			continue
		end
		if var291 == protoModule.wireTypes.lengthDelimited then
			if var295 == 1 then
				local _ = nil
				local var298, var299 = protoModule.readBuffer(p3, var290)
				var290 = var299
				var289.key = buffer.tostring(var298)
			elseif var295 == 2 then
				local _ = nil
				local var300, var301 = protoModule.readBuffer(p3, var290)
				var290 = var301
				var289.value = universeDataModule.UniverseData.decode(var300)
			else
				local _ = nil
				local var302, var303 = protoModule.readVarInt(p3, var290)
				var290 = var303 + var302
			end
		elseif var291 == protoModule.wireTypes.i32 then
			local _ = nil
			local var304, var305 = protoModule.readFixed32(p3, var290)
			local _ = var304
			var290 = var305
		elseif var291 == protoModule.wireTypes.i64 then
			local _ = nil
			local var306, var307 = protoModule.readFixed64(p3, var290)
			local _ = var306
			var290 = var307
		else
			error("Unsupported wire type: " .. var474)
		end
	end
	return var289
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
	local var308 = t_3.new()
	
	if self.key ~= nil then
		var308.key = self.key
	end
	if self.value ~= nil then
		var308.value = universeDataModule.UniverseData.jsonDecode(self.value)
	end
	return var308
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
	local var308 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var309, var310 = protoModule.writeTag(buff, var308, 1, protoModule.wireTypes.lengthDelimited)
		var309, var496 = protoModule.writeString(var309, var310, self.key)
		buff = var309
		var308 = var310
	end
	if self.value ~= nil then
		local var311 = self.value:encode()
		local var312, var313 = protoModule.writeTag(buff, var308, 2, protoModule.wireTypes.lengthDelimited)
		var312, var499 = protoModule.writeBuffer(var312, var313, var311, buffer.len(var311))
		buff = var312
		var308 = var313
	end
	local buff_1 = buffer.create(var308)
	buffer.copy(buff_1, 0, buff, 0, var308)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), creatorDataModule (ref)
	local var308 = t_4.new()
	local var309 = 0
	while var309 < buffer.len(p4) do
		local _ = nil
		local var310 = nil
		local var311, var312, var313 = protoModule.readTag(p4, var309)
		local var314 = var311
		var310 = var312
		var309 = var313
		
		if var310 == protoModule.wireTypes.varint then
			local _ = nil
			local var315, var316 = protoModule.readVarInt(p4, var309)
			local _ = var315
			var309 = var316
			continue
		end
		if var310 == protoModule.wireTypes.lengthDelimited then
			if var314 == 1 then
				local _ = nil
				local var317, var318 = protoModule.readBuffer(p4, var309)
				var309 = var318
				var308.key = buffer.tostring(var317)
			elseif var314 == 2 then
				local _ = nil
				local var319, var320 = protoModule.readBuffer(p4, var309)
				var309 = var320
				var308.value = creatorDataModule.CreatorData.decode(var319)
			else
				local _ = nil
				local var321, var322 = protoModule.readVarInt(p4, var309)
				var309 = var322 + var321
			end
		elseif var310 == protoModule.wireTypes.i32 then
			local _ = nil
			local var323, var324 = protoModule.readFixed32(p4, var309)
			local _ = var323
			var309 = var324
		elseif var310 == protoModule.wireTypes.i64 then
			local _ = nil
			local var325, var326 = protoModule.readFixed64(p4, var309)
			local _ = var325
			var309 = var326
		else
			error("Unsupported wire type: " .. var503)
		end
	end
	return var308
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
	local var327 = t_4.new()
	
	if self.key ~= nil then
		var327.key = self.key
	end
	if self.value ~= nil then
		var327.value = creatorDataModule.CreatorData.jsonDecode(self.value)
	end
	return var327
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
	local var327 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var328, var329 = protoModule.writeTag(buff, var327, 1, protoModule.wireTypes.lengthDelimited)
		var328, var525 = protoModule.writeString(var328, var329, self.key)
		buff = var328
		var327 = var329
	end
	if self.value ~= nil then
		local var330 = self.value:encode()
		local var331, var332 = protoModule.writeTag(buff, var327, 2, protoModule.wireTypes.lengthDelimited)
		var331, var528 = protoModule.writeBuffer(var331, var332, var330, buffer.len(var330))
		buff = var331
		var327 = var332
	end
	local buff_1 = buffer.create(var327)
	buffer.copy(buff_1, 0, buff, 0, var327)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref), eventDataModule (ref)
	local var327 = t_5.new()
	local var328 = 0
	while var328 < buffer.len(p5) do
		local _ = nil
		local var329 = nil
		local var330, var331, var332 = protoModule.readTag(p5, var328)
		local var333 = var330
		var329 = var331
		var328 = var332
		
		if var329 == protoModule.wireTypes.varint then
			local _ = nil
			local var334, var335 = protoModule.readVarInt(p5, var328)
			local _ = var334
			var328 = var335
			continue
		end
		if var329 == protoModule.wireTypes.lengthDelimited then
			if var333 == 1 then
				local _ = nil
				local var336, var337 = protoModule.readBuffer(p5, var328)
				var328 = var337
				var327.key = buffer.tostring(var336)
			elseif var333 == 2 then
				local _ = nil
				local var338, var339 = protoModule.readBuffer(p5, var328)
				var328 = var339
				var327.value = eventDataModule.EventData.decode(var338)
			else
				local _ = nil
				local var340, var341 = protoModule.readVarInt(p5, var328)
				var328 = var341 + var340
			end
		elseif var329 == protoModule.wireTypes.i32 then
			local _ = nil
			local var342, var343 = protoModule.readFixed32(p5, var328)
			local _ = var342
			var328 = var343
		elseif var329 == protoModule.wireTypes.i64 then
			local _ = nil
			local var344, var345 = protoModule.readFixed64(p5, var328)
			local _ = var344
			var328 = var345
		else
			error("Unsupported wire type: " .. var532)
		end
	end
	return var327
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
	local var346 = t_5.new()
	
	if self.key ~= nil then
		var346.key = self.key
	end
	if self.value ~= nil then
		var346.value = eventDataModule.EventData.jsonDecode(self.value)
	end
	return var346
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
	local var346 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var347, var348 = protoModule.writeTag(buff, var346, 1, protoModule.wireTypes.lengthDelimited)
		var347, var554 = protoModule.writeString(var347, var348, self.key)
		buff = var347
		var346 = var348
	end
	if self.value ~= nil then
		local var349 = self.value:encode()
		local var350, var351 = protoModule.writeTag(buff, var346, 2, protoModule.wireTypes.lengthDelimited)
		var350, var557 = protoModule.writeBuffer(var350, var351, var349, buffer.len(var349))
		buff = var350
		var346 = var351
	end
	local buff_1 = buffer.create(var346)
	buffer.copy(buff_1, 0, buff, 0, var346)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), songDataModule (ref)
	local var346 = t_6.new()
	local var347 = 0
	while var347 < buffer.len(p6) do
		local _ = nil
		local var348 = nil
		local var349, var350, var351 = protoModule.readTag(p6, var347)
		local var352 = var349
		var348 = var350
		var347 = var351
		
		if var348 == protoModule.wireTypes.varint then
			local _ = nil
			local var353, var354 = protoModule.readVarInt(p6, var347)
			local _ = var353
			var347 = var354
			continue
		end
		if var348 == protoModule.wireTypes.lengthDelimited then
			if var352 == 1 then
				local _ = nil
				local var355, var356 = protoModule.readBuffer(p6, var347)
				var347 = var356
				var346.key = buffer.tostring(var355)
			elseif var352 == 2 then
				local _ = nil
				local var357, var358 = protoModule.readBuffer(p6, var347)
				var347 = var358
				var346.value = songDataModule.SongData.decode(var357)
			else
				local _ = nil
				local var359, var360 = protoModule.readVarInt(p6, var347)
				var347 = var360 + var359
			end
		elseif var348 == protoModule.wireTypes.i32 then
			local _ = nil
			local var361, var362 = protoModule.readFixed32(p6, var347)
			local _ = var361
			var347 = var362
		elseif var348 == protoModule.wireTypes.i64 then
			local _ = nil
			local var363, var364 = protoModule.readFixed64(p6, var347)
			local _ = var363
			var347 = var364
		else
			error("Unsupported wire type: " .. var561)
		end
	end
	return var346
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
	local var365 = t_6.new()
	
	if self.key ~= nil then
		var365.key = self.key
	end
	if self.value ~= nil then
		var365.value = songDataModule.SongData.jsonDecode(self.value)
	end
	return var365
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
	local var365 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var366, var367 = protoModule.writeTag(buff, var365, 1, protoModule.wireTypes.lengthDelimited)
		var366, var583 = protoModule.writeString(var366, var367, self.key)
		buff = var366
		var365 = var367
	end
	if self.value ~= nil then
		local var368 = self.value:encode()
		local var369, var370 = protoModule.writeTag(buff, var365, 2, protoModule.wireTypes.lengthDelimited)
		var369, var586 = protoModule.writeBuffer(var369, var370, var368, buffer.len(var368))
		buff = var369
		var365 = var370
	end
	local buff_1 = buffer.create(var365)
	buffer.copy(buff_1, 0, buff, 0, var365)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref), gamePassDataModule (ref)
	local var365 = t_7.new()
	local var366 = 0
	while var366 < buffer.len(p7) do
		local _ = nil
		local var367 = nil
		local var368, var369, var370 = protoModule.readTag(p7, var366)
		local var371 = var368
		var367 = var369
		var366 = var370
		
		if var367 == protoModule.wireTypes.varint then
			local _ = nil
			local var372, var373 = protoModule.readVarInt(p7, var366)
			local _ = var372
			var366 = var373
			continue
		end
		if var367 == protoModule.wireTypes.lengthDelimited then
			if var371 == 1 then
				local _ = nil
				local var374, var375 = protoModule.readBuffer(p7, var366)
				var366 = var375
				var365.key = buffer.tostring(var374)
			elseif var371 == 2 then
				local _ = nil
				local var376, var377 = protoModule.readBuffer(p7, var366)
				var366 = var377
				var365.value = gamePassDataModule.GamePassData.decode(var376)
			else
				local _ = nil
				local var378, var379 = protoModule.readVarInt(p7, var366)
				var366 = var379 + var378
			end
		elseif var367 == protoModule.wireTypes.i32 then
			local _ = nil
			local var380, var381 = protoModule.readFixed32(p7, var366)
			local _ = var380
			var366 = var381
		elseif var367 == protoModule.wireTypes.i64 then
			local _ = nil
			local var382, var383 = protoModule.readFixed64(p7, var366)
			local _ = var382
			var366 = var383
		else
			error("Unsupported wire type: " .. var590)
		end
	end
	return var365
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
	local var384 = t_7.new()
	
	if self.key ~= nil then
		var384.key = self.key
	end
	if self.value ~= nil then
		var384.value = gamePassDataModule.GamePassData.jsonDecode(self.value)
	end
	return var384
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
	local var384 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var385, var386 = protoModule.writeTag(buff, var384, 1, protoModule.wireTypes.lengthDelimited)
		var385, var612 = protoModule.writeString(var385, var386, self.key)
		buff = var385
		var384 = var386
	end
	if self.value ~= nil then
		local var387 = self.value:encode()
		local var388, var389 = protoModule.writeTag(buff, var384, 2, protoModule.wireTypes.lengthDelimited)
		var388, var615 = protoModule.writeBuffer(var388, var389, var387, buffer.len(var387))
		buff = var388
		var384 = var389
	end
	local buff_1 = buffer.create(var384)
	buffer.copy(buff_1, 0, buff, 0, var384)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), mediaAssetDataModule (ref)
	local var384 = t_8.new()
	local var385 = 0
	while var385 < buffer.len(p8) do
		local _ = nil
		local var386 = nil
		local var387, var388, var389 = protoModule.readTag(p8, var385)
		local var390 = var387
		var386 = var388
		var385 = var389
		
		if var386 == protoModule.wireTypes.varint then
			local _ = nil
			local var391, var392 = protoModule.readVarInt(p8, var385)
			local _ = var391
			var385 = var392
			continue
		end
		if var386 == protoModule.wireTypes.lengthDelimited then
			if var390 == 1 then
				local _ = nil
				local var393, var394 = protoModule.readBuffer(p8, var385)
				var385 = var394
				var384.key = buffer.tostring(var393)
			elseif var390 == 2 then
				local _ = nil
				local var395, var396 = protoModule.readBuffer(p8, var385)
				var385 = var396
				var384.value = mediaAssetDataModule.MediaAssetData.decode(var395)
			else
				local _ = nil
				local var397, var398 = protoModule.readVarInt(p8, var385)
				var385 = var398 + var397
			end
		elseif var386 == protoModule.wireTypes.i32 then
			local _ = nil
			local var399, var400 = protoModule.readFixed32(p8, var385)
			local _ = var399
			var385 = var400
		elseif var386 == protoModule.wireTypes.i64 then
			local _ = nil
			local var401, var402 = protoModule.readFixed64(p8, var385)
			local _ = var401
			var385 = var402
		else
			error("Unsupported wire type: " .. var619)
		end
	end
	return var384
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
	local var403 = t_8.new()
	
	if self.key ~= nil then
		var403.key = self.key
	end
	if self.value ~= nil then
		var403.value = mediaAssetDataModule.MediaAssetData.jsonDecode(self.value)
	end
	return var403
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
	local var403 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var404, var405 = protoModule.writeTag(buff, var403, 1, protoModule.wireTypes.lengthDelimited)
		var404, var641 = protoModule.writeString(var404, var405, self.key)
		buff = var404
		var403 = var405
	end
	if self.value ~= nil then
		local var406 = self.value:encode()
		local var407, var408 = protoModule.writeTag(buff, var403, 2, protoModule.wireTypes.lengthDelimited)
		var407, var644 = protoModule.writeBuffer(var407, var408, var406, buffer.len(var406))
		buff = var407
		var403 = var408
	end
	local buff_1 = buffer.create(var403)
	buffer.copy(buff_1, 0, buff, 0, var403)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), socialLinkDataModule (ref)
	local var403 = t_9.new()
	local var404 = 0
	while var404 < buffer.len(p9) do
		local _ = nil
		local var405 = nil
		local var406, var407, var408 = protoModule.readTag(p9, var404)
		local var409 = var406
		var405 = var407
		var404 = var408
		
		if var405 == protoModule.wireTypes.varint then
			local _ = nil
			local var410, var411 = protoModule.readVarInt(p9, var404)
			local _ = var410
			var404 = var411
			continue
		end
		if var405 == protoModule.wireTypes.lengthDelimited then
			if var409 == 1 then
				local _ = nil
				local var412, var413 = protoModule.readBuffer(p9, var404)
				var404 = var413
				var403.key = buffer.tostring(var412)
			elseif var409 == 2 then
				local _ = nil
				local var414, var415 = protoModule.readBuffer(p9, var404)
				var404 = var415
				var403.value = socialLinkDataModule.SocialLinkData.decode(var414)
			else
				local _ = nil
				local var416, var417 = protoModule.readVarInt(p9, var404)
				var404 = var417 + var416
			end
		elseif var405 == protoModule.wireTypes.i32 then
			local _ = nil
			local var418, var419 = protoModule.readFixed32(p9, var404)
			local _ = var418
			var404 = var419
		elseif var405 == protoModule.wireTypes.i64 then
			local _ = nil
			local var420, var421 = protoModule.readFixed64(p9, var404)
			local _ = var420
			var404 = var421
		else
			error("Unsupported wire type: " .. var648)
		end
	end
	return var403
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
	local var422 = t_9.new()
	
	if self.key ~= nil then
		var422.key = self.key
	end
	if self.value ~= nil then
		var422.value = socialLinkDataModule.SocialLinkData.jsonDecode(self.value)
	end
	return var422
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
	local var422 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var423, var424 = protoModule.writeTag(buff, var422, 1, protoModule.wireTypes.lengthDelimited)
		var423, var670 = protoModule.writeString(var423, var424, self.key)
		buff = var423
		var422 = var424
	end
	if self.value ~= nil then
		local var425 = self.value:encode()
		local var426, var427 = protoModule.writeTag(buff, var422, 2, protoModule.wireTypes.lengthDelimited)
		var426, var673 = protoModule.writeBuffer(var426, var427, var425, buffer.len(var425))
		buff = var426
		var422 = var427
	end
	local buff_1 = buffer.create(var422)
	buffer.copy(buff_1, 0, buff, 0, var422)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref), gameDeveloperProductDataModule (ref)
	local var422 = t_10.new()
	local var423 = 0
	while var423 < buffer.len(p10) do
		local _ = nil
		local var424 = nil
		local var425, var426, var427 = protoModule.readTag(p10, var423)
		local var428 = var425
		var424 = var426
		var423 = var427
		
		if var424 == protoModule.wireTypes.varint then
			local _ = nil
			local var429, var430 = protoModule.readVarInt(p10, var423)
			local _ = var429
			var423 = var430
			continue
		end
		if var424 == protoModule.wireTypes.lengthDelimited then
			if var428 == 1 then
				local _ = nil
				local var431, var432 = protoModule.readBuffer(p10, var423)
				var423 = var432
				var422.key = buffer.tostring(var431)
			elseif var428 == 2 then
				local _ = nil
				local var433, var434 = protoModule.readBuffer(p10, var423)
				var423 = var434
				var422.value = gameDeveloperProductDataModule.GameDeveloperProductData.decode(var433)
			else
				local _ = nil
				local var435, var436 = protoModule.readVarInt(p10, var423)
				var423 = var436 + var435
			end
		elseif var424 == protoModule.wireTypes.i32 then
			local _ = nil
			local var437, var438 = protoModule.readFixed32(p10, var423)
			local _ = var437
			var423 = var438
		elseif var424 == protoModule.wireTypes.i64 then
			local _ = nil
			local var439, var440 = protoModule.readFixed64(p10, var423)
			local _ = var439
			var423 = var440
		else
			error("Unsupported wire type: " .. var677)
		end
	end
	return var422
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
	local var441 = t_10.new()
	
	if self.key ~= nil then
		var441.key = self.key
	end
	if self.value ~= nil then
		var441.value = gameDeveloperProductDataModule.GameDeveloperProductData.jsonDecode(self.value)
	end
	return var441
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
	local var441 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var442, var443 = protoModule.writeTag(buff, var441, 1, protoModule.wireTypes.lengthDelimited)
		var442, var699 = protoModule.writeString(var442, var443, self.key)
		buff = var442
		var441 = var443
	end
	if self.value ~= nil then
		local var444 = self.value:encode()
		local var445, var446 = protoModule.writeTag(buff, var441, 2, protoModule.wireTypes.lengthDelimited)
		var445, var702 = protoModule.writeBuffer(var445, var446, var444, buffer.len(var444))
		buff = var445
		var441 = var446
	end
	local buff_1 = buffer.create(var441)
	buffer.copy(buff_1, 0, buff, 0, var441)
	
	return buff_1
end

function t_11.decode(p11)
	-- upvalues: t_11 (ref), protoModule (ref), gameSubscriptionDataModule (ref)
	local var441 = t_11.new()
	local var442 = 0
	while var442 < buffer.len(p11) do
		local _ = nil
		local var443 = nil
		local var444, var445, var446 = protoModule.readTag(p11, var442)
		local var447 = var444
		var443 = var445
		var442 = var446
		
		if var443 == protoModule.wireTypes.varint then
			local _ = nil
			local var448, var449 = protoModule.readVarInt(p11, var442)
			local _ = var448
			var442 = var449
			continue
		end
		if var443 == protoModule.wireTypes.lengthDelimited then
			if var447 == 1 then
				local _ = nil
				local var450, var451 = protoModule.readBuffer(p11, var442)
				var442 = var451
				var441.key = buffer.tostring(var450)
			elseif var447 == 2 then
				local _ = nil
				local var452, var453 = protoModule.readBuffer(p11, var442)
				var442 = var453
				var441.value = gameSubscriptionDataModule.GameSubscriptionData.decode(var452)
			else
				local _ = nil
				local var454, var455 = protoModule.readVarInt(p11, var442)
				var442 = var455 + var454
			end
		elseif var443 == protoModule.wireTypes.i32 then
			local _ = nil
			local var456, var457 = protoModule.readFixed32(p11, var442)
			local _ = var456
			var442 = var457
		elseif var443 == protoModule.wireTypes.i64 then
			local _ = nil
			local var458, var459 = protoModule.readFixed64(p11, var442)
			local _ = var458
			var442 = var459
		else
			error("Unsupported wire type: " .. var706)
		end
	end
	return var441
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
	local var460 = t_11.new()
	
	if self.key ~= nil then
		var460.key = self.key
	end
	if self.value ~= nil then
		var460.value = gameSubscriptionDataModule.GameSubscriptionData.jsonDecode(self.value)
	end
	return var460
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
	local var460 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var461, var462 = protoModule.writeTag(buff, var460, 1, protoModule.wireTypes.lengthDelimited)
		var461, var728 = protoModule.writeString(var461, var462, self.key)
		buff = var461
		var460 = var462
	end
	if self.value ~= nil then
		local var463 = self.value:encode()
		local var464, var465 = protoModule.writeTag(buff, var460, 2, protoModule.wireTypes.lengthDelimited)
		var464, var731 = protoModule.writeBuffer(var464, var465, var463, buffer.len(var463))
		buff = var464
		var460 = var465
	end
	local buff_1 = buffer.create(var460)
	buffer.copy(buff_1, 0, buff, 0, var460)
	
	return buff_1
end

function t_12.decode(p12)
	-- upvalues: t_12 (ref), protoModule (ref), marketplaceCatalogCategoryDataModule (ref)
	local var460 = t_12.new()
	local var461 = 0
	while var461 < buffer.len(p12) do
		local _ = nil
		local var462 = nil
		local var463, var464, var465 = protoModule.readTag(p12, var461)
		local var466 = var463
		var462 = var464
		var461 = var465
		
		if var462 == protoModule.wireTypes.varint then
			local _ = nil
			local var467, var468 = protoModule.readVarInt(p12, var461)
			local _ = var467
			var461 = var468
			continue
		end
		if var462 == protoModule.wireTypes.lengthDelimited then
			if var466 == 1 then
				local _ = nil
				local var469, var470 = protoModule.readBuffer(p12, var461)
				var461 = var470
				var460.key = buffer.tostring(var469)
			elseif var466 == 2 then
				local _ = nil
				local var471, var472 = protoModule.readBuffer(p12, var461)
				var461 = var472
				var460.value = marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.decode(var471)
			else
				local _ = nil
				local var473, var474 = protoModule.readVarInt(p12, var461)
				var461 = var474 + var473
			end
		elseif var462 == protoModule.wireTypes.i32 then
			local _ = nil
			local var475, var476 = protoModule.readFixed32(p12, var461)
			local _ = var475
			var461 = var476
		elseif var462 == protoModule.wireTypes.i64 then
			local _ = nil
			local var477, var478 = protoModule.readFixed64(p12, var461)
			local _ = var477
			var461 = var478
		else
			error("Unsupported wire type: " .. var735)
		end
	end
	return var460
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
	local var479 = t_12.new()
	
	if self.key ~= nil then
		var479.key = self.key
	end
	if self.value ~= nil then
		var479.value = marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.jsonDecode(self.value)
	end
	return var479
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
	local var479 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var480, var481 = protoModule.writeTag(buff, var479, 1, protoModule.wireTypes.lengthDelimited)
		var480, var757 = protoModule.writeString(var480, var481, self.key)
		buff = var480
		var479 = var481
	end
	if self.value ~= nil then
		local var482 = self.value:encode()
		local var483, var484 = protoModule.writeTag(buff, var479, 2, protoModule.wireTypes.lengthDelimited)
		var483, var760 = protoModule.writeBuffer(var483, var484, var482, buffer.len(var482))
		buff = var483
		var479 = var484
	end
	local buff_1 = buffer.create(var479)
	buffer.copy(buff_1, 0, buff, 0, var479)
	
	return buff_1
end

function t_13.decode(p13)
	-- upvalues: t_13 (ref), protoModule (ref), marketplaceAssetDataModule (ref)
	local var479 = t_13.new()
	local var480 = 0
	while var480 < buffer.len(p13) do
		local _ = nil
		local var481 = nil
		local var482, var483, var484 = protoModule.readTag(p13, var480)
		local var485 = var482
		var481 = var483
		var480 = var484
		
		if var481 == protoModule.wireTypes.varint then
			local _ = nil
			local var486, var487 = protoModule.readVarInt(p13, var480)
			local _ = var486
			var480 = var487
			continue
		end
		if var481 == protoModule.wireTypes.lengthDelimited then
			if var485 == 1 then
				local _ = nil
				local var488, var489 = protoModule.readBuffer(p13, var480)
				var480 = var489
				var479.key = buffer.tostring(var488)
			elseif var485 == 2 then
				local _ = nil
				local var490, var491 = protoModule.readBuffer(p13, var480)
				var480 = var491
				var479.value = marketplaceAssetDataModule.MarketplaceAssetData.decode(var490)
			else
				local _ = nil
				local var492, var493 = protoModule.readVarInt(p13, var480)
				var480 = var493 + var492
			end
		elseif var481 == protoModule.wireTypes.i32 then
			local _ = nil
			local var494, var495 = protoModule.readFixed32(p13, var480)
			local _ = var494
			var480 = var495
		elseif var481 == protoModule.wireTypes.i64 then
			local _ = nil
			local var496, var497 = protoModule.readFixed64(p13, var480)
			local _ = var496
			var480 = var497
		else
			error("Unsupported wire type: " .. var764)
		end
	end
	return var479
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
	local var498 = t_13.new()
	
	if self.key ~= nil then
		var498.key = self.key
	end
	if self.value ~= nil then
		var498.value = marketplaceAssetDataModule.MarketplaceAssetData.jsonDecode(self.value)
	end
	return var498
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
	local var498 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var499, var500 = protoModule.writeTag(buff, var498, 1, protoModule.wireTypes.lengthDelimited)
		var499, var786 = protoModule.writeString(var499, var500, self.key)
		buff = var499
		var498 = var500
	end
	if self.value ~= nil then
		local var501 = self.value:encode()
		local var502, var503 = protoModule.writeTag(buff, var498, 2, protoModule.wireTypes.lengthDelimited)
		var502, var789 = protoModule.writeBuffer(var502, var503, var501, buffer.len(var501))
		buff = var502
		var498 = var503
	end
	local buff_1 = buffer.create(var498)
	buffer.copy(buff_1, 0, buff, 0, var498)
	
	return buff_1
end

function t_14.decode(p14)
	-- upvalues: t_14 (ref), protoModule (ref), marketplaceBundleDataModule (ref)
	local var498 = t_14.new()
	local var499 = 0
	while var499 < buffer.len(p14) do
		local _ = nil
		local var500 = nil
		local var501, var502, var503 = protoModule.readTag(p14, var499)
		local var504 = var501
		var500 = var502
		var499 = var503
		
		if var500 == protoModule.wireTypes.varint then
			local _ = nil
			local var505, var506 = protoModule.readVarInt(p14, var499)
			local _ = var505
			var499 = var506
			continue
		end
		if var500 == protoModule.wireTypes.lengthDelimited then
			if var504 == 1 then
				local _ = nil
				local var507, var508 = protoModule.readBuffer(p14, var499)
				var499 = var508
				var498.key = buffer.tostring(var507)
			elseif var504 == 2 then
				local _ = nil
				local var509, var510 = protoModule.readBuffer(p14, var499)
				var499 = var510
				var498.value = marketplaceBundleDataModule.MarketplaceBundleData.decode(var509)
			else
				local _ = nil
				local var511, var512 = protoModule.readVarInt(p14, var499)
				var499 = var512 + var511
			end
		elseif var500 == protoModule.wireTypes.i32 then
			local _ = nil
			local var513, var514 = protoModule.readFixed32(p14, var499)
			local _ = var513
			var499 = var514
		elseif var500 == protoModule.wireTypes.i64 then
			local _ = nil
			local var515, var516 = protoModule.readFixed64(p14, var499)
			local _ = var515
			var499 = var516
		else
			error("Unsupported wire type: " .. var793)
		end
	end
	return var498
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
	local var517 = t_14.new()
	
	if self.key ~= nil then
		var517.key = self.key
	end
	if self.value ~= nil then
		var517.value = marketplaceBundleDataModule.MarketplaceBundleData.jsonDecode(self.value)
	end
	return var517
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
	local var517 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var518, var519 = protoModule.writeTag(buff, var517, 1, protoModule.wireTypes.lengthDelimited)
		var518, var815 = protoModule.writeString(var518, var519, self.key)
		buff = var518
		var517 = var519
	end
	if self.value ~= nil then
		local var520 = self.value:encode()
		local var521, var522 = protoModule.writeTag(buff, var517, 2, protoModule.wireTypes.lengthDelimited)
		var521, var818 = protoModule.writeBuffer(var521, var522, var520, buffer.len(var520))
		buff = var521
		var517 = var522
	end
	local buff_1 = buffer.create(var517)
	buffer.copy(buff_1, 0, buff, 0, var517)
	
	return buff_1
end

function t_15.decode(p15)
	-- upvalues: t_15 (ref), protoModule (ref), marketplaceLookDataModule (ref)
	local var517 = t_15.new()
	local var518 = 0
	while var518 < buffer.len(p15) do
		local _ = nil
		local var519 = nil
		local var520, var521, var522 = protoModule.readTag(p15, var518)
		local var523 = var520
		var519 = var521
		var518 = var522
		
		if var519 == protoModule.wireTypes.varint then
			local _ = nil
			local var524, var525 = protoModule.readVarInt(p15, var518)
			local _ = var524
			var518 = var525
			continue
		end
		if var519 == protoModule.wireTypes.lengthDelimited then
			if var523 == 1 then
				local _ = nil
				local var526, var527 = protoModule.readBuffer(p15, var518)
				var518 = var527
				var517.key = buffer.tostring(var526)
			elseif var523 == 2 then
				local _ = nil
				local var528, var529 = protoModule.readBuffer(p15, var518)
				var518 = var529
				var517.value = marketplaceLookDataModule.MarketplaceLookData.decode(var528)
			else
				local _ = nil
				local var530, var531 = protoModule.readVarInt(p15, var518)
				var518 = var531 + var530
			end
		elseif var519 == protoModule.wireTypes.i32 then
			local _ = nil
			local var532, var533 = protoModule.readFixed32(p15, var518)
			local _ = var532
			var518 = var533
		elseif var519 == protoModule.wireTypes.i64 then
			local _ = nil
			local var534, var535 = protoModule.readFixed64(p15, var518)
			local _ = var534
			var518 = var535
		else
			error("Unsupported wire type: " .. var822)
		end
	end
	return var517
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
	local var536 = t_15.new()
	
	if self.key ~= nil then
		var536.key = self.key
	end
	if self.value ~= nil then
		var536.value = marketplaceLookDataModule.MarketplaceLookData.jsonDecode(self.value)
	end
	return var536
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
	local var536 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var537, var538 = protoModule.writeTag(buff, var536, 1, protoModule.wireTypes.lengthDelimited)
		var537, var844 = protoModule.writeString(var537, var538, self.key)
		buff = var537
		var536 = var538
	end
	if self.value ~= nil then
		local var539 = self.value:encode()
		local var540, var541 = protoModule.writeTag(buff, var536, 2, protoModule.wireTypes.lengthDelimited)
		var540, var847 = protoModule.writeBuffer(var540, var541, var539, buffer.len(var539))
		buff = var540
		var536 = var541
	end
	local buff_1 = buffer.create(var536)
	buffer.copy(buff_1, 0, buff, 0, var536)
	
	return buff_1
end

function t_16.decode(p16)
	-- upvalues: t_16 (ref), protoModule (ref), catalogSortDataModule (ref)
	local var536 = t_16.new()
	local var537 = 0
	while var537 < buffer.len(p16) do
		local _ = nil
		local var538 = nil
		local var539, var540, var541 = protoModule.readTag(p16, var537)
		local var542 = var539
		var538 = var540
		var537 = var541
		
		if var538 == protoModule.wireTypes.varint then
			local _ = nil
			local var543, var544 = protoModule.readVarInt(p16, var537)
			local _ = var543
			var537 = var544
			continue
		end
		if var538 == protoModule.wireTypes.lengthDelimited then
			if var542 == 1 then
				local _ = nil
				local var545, var546 = protoModule.readBuffer(p16, var537)
				var537 = var546
				var536.key = buffer.tostring(var545)
			elseif var542 == 2 then
				local _ = nil
				local var547, var548 = protoModule.readBuffer(p16, var537)
				var537 = var548
				var536.value = catalogSortDataModule.CatalogSortData.decode(var547)
			else
				local _ = nil
				local var549, var550 = protoModule.readVarInt(p16, var537)
				var537 = var550 + var549
			end
		elseif var538 == protoModule.wireTypes.i32 then
			local _ = nil
			local var551, var552 = protoModule.readFixed32(p16, var537)
			local _ = var551
			var537 = var552
		elseif var538 == protoModule.wireTypes.i64 then
			local _ = nil
			local var553, var554 = protoModule.readFixed64(p16, var537)
			local _ = var553
			var537 = var554
		else
			error("Unsupported wire type: " .. var851)
		end
	end
	return var536
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
	local var555 = t_16.new()
	
	if self.key ~= nil then
		var555.key = self.key
	end
	if self.value ~= nil then
		var555.value = catalogSortDataModule.CatalogSortData.jsonDecode(self.value)
	end
	return var555
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
	local var555 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var556, var557 = protoModule.writeTag(buff, var555, 1, protoModule.wireTypes.lengthDelimited)
		var556, var873 = protoModule.writeString(var556, var557, self.key)
		buff = var556
		var555 = var557
	end
	if self.value ~= nil then
		local var558 = self.value:encode()
		local var559, var560 = protoModule.writeTag(buff, var555, 2, protoModule.wireTypes.lengthDelimited)
		var559, var876 = protoModule.writeBuffer(var559, var560, var558, buffer.len(var558))
		buff = var559
		var555 = var560
	end
	local buff_1 = buffer.create(var555)
	buffer.copy(buff_1, 0, buff, 0, var555)
	
	return buff_1
end

function t_17.decode(p17)
	-- upvalues: t_17 (ref), protoModule (ref), ageRecommendationDataModule (ref)
	local var555 = t_17.new()
	local var556 = 0
	while var556 < buffer.len(p17) do
		local _ = nil
		local var557 = nil
		local var558, var559, var560 = protoModule.readTag(p17, var556)
		local var561 = var558
		var557 = var559
		var556 = var560
		
		if var557 == protoModule.wireTypes.varint then
			local _ = nil
			local var562, var563 = protoModule.readVarInt(p17, var556)
			local _ = var562
			var556 = var563
			continue
		end
		if var557 == protoModule.wireTypes.lengthDelimited then
			if var561 == 1 then
				local _ = nil
				local var564, var565 = protoModule.readBuffer(p17, var556)
				var556 = var565
				var555.key = buffer.tostring(var564)
			elseif var561 == 2 then
				local _ = nil
				local var566, var567 = protoModule.readBuffer(p17, var556)
				var556 = var567
				var555.value = ageRecommendationDataModule.AgeRecommendationData.decode(var566)
			else
				local _ = nil
				local var568, var569 = protoModule.readVarInt(p17, var556)
				var556 = var569 + var568
			end
		elseif var557 == protoModule.wireTypes.i32 then
			local _ = nil
			local var570, var571 = protoModule.readFixed32(p17, var556)
			local _ = var570
			var556 = var571
		elseif var557 == protoModule.wireTypes.i64 then
			local _ = nil
			local var572, var573 = protoModule.readFixed64(p17, var556)
			local _ = var572
			var556 = var573
		else
			error("Unsupported wire type: " .. var880)
		end
	end
	return var555
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
	local var574 = t_17.new()
	
	if self.key ~= nil then
		var574.key = self.key
	end
	if self.value ~= nil then
		var574.value = ageRecommendationDataModule.AgeRecommendationData.jsonDecode(self.value)
	end
	return var574
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
	local var574 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var575, var576 = protoModule.writeTag(buff, var574, 1, protoModule.wireTypes.lengthDelimited)
		var575, var902 = protoModule.writeString(var575, var576, self.key)
		buff = var575
		var574 = var576
	end
	if self.value ~= nil then
		local var577 = self.value:encode()
		local var578, var579 = protoModule.writeTag(buff, var574, 2, protoModule.wireTypes.lengthDelimited)
		var578, var905 = protoModule.writeBuffer(var578, var579, var577, buffer.len(var577))
		buff = var578
		var574 = var579
	end
	local buff_1 = buffer.create(var574)
	buffer.copy(buff_1, 0, buff, 0, var574)
	
	return buff_1
end

function t_18.decode(p18)
	-- upvalues: t_18 (ref), protoModule (ref), universeUserFollowDataModule (ref)
	local var574 = t_18.new()
	local var575 = 0
	while var575 < buffer.len(p18) do
		local _ = nil
		local var576 = nil
		local var577, var578, var579 = protoModule.readTag(p18, var575)
		local var580 = var577
		var576 = var578
		var575 = var579
		
		if var576 == protoModule.wireTypes.varint then
			local _ = nil
			local var581, var582 = protoModule.readVarInt(p18, var575)
			local _ = var581
			var575 = var582
			continue
		end
		if var576 == protoModule.wireTypes.lengthDelimited then
			if var580 == 1 then
				local _ = nil
				local var583, var584 = protoModule.readBuffer(p18, var575)
				var575 = var584
				var574.key = buffer.tostring(var583)
			elseif var580 == 2 then
				local _ = nil
				local var585, var586 = protoModule.readBuffer(p18, var575)
				var575 = var586
				var574.value = universeUserFollowDataModule.UniverseUserFollowData.decode(var585)
			else
				local _ = nil
				local var587, var588 = protoModule.readVarInt(p18, var575)
				var575 = var588 + var587
			end
		elseif var576 == protoModule.wireTypes.i32 then
			local _ = nil
			local var589, var590 = protoModule.readFixed32(p18, var575)
			local _ = var589
			var575 = var590
		elseif var576 == protoModule.wireTypes.i64 then
			local _ = nil
			local var591, var592 = protoModule.readFixed64(p18, var575)
			local _ = var591
			var575 = var592
		else
			error("Unsupported wire type: " .. var909)
		end
	end
	return var574
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
	local var593 = t_18.new()
	
	if self.key ~= nil then
		var593.key = self.key
	end
	if self.value ~= nil then
		var593.value = universeUserFollowDataModule.UniverseUserFollowData.jsonDecode(self.value)
	end
	return var593
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
	local var593 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var594, var595 = protoModule.writeTag(buff, var593, 1, protoModule.wireTypes.lengthDelimited)
		var594, var931 = protoModule.writeString(var594, var595, self.key)
		buff = var594
		var593 = var595
	end
	if self.value ~= nil then
		local var596 = self.value:encode()
		local var597, var598 = protoModule.writeTag(buff, var593, 2, protoModule.wireTypes.lengthDelimited)
		var597, var934 = protoModule.writeBuffer(var597, var598, var596, buffer.len(var596))
		buff = var597
		var593 = var598
	end
	local buff_1 = buffer.create(var593)
	buffer.copy(buff_1, 0, buff, 0, var593)
	
	return buff_1
end

function t_19.decode(p19)
	-- upvalues: t_19 (ref), protoModule (ref), universeUserVoteDataModule (ref)
	local var593 = t_19.new()
	local var594 = 0
	while var594 < buffer.len(p19) do
		local _ = nil
		local var595 = nil
		local var596, var597, var598 = protoModule.readTag(p19, var594)
		local var599 = var596
		var595 = var597
		var594 = var598
		
		if var595 == protoModule.wireTypes.varint then
			local _ = nil
			local var600, var601 = protoModule.readVarInt(p19, var594)
			local _ = var600
			var594 = var601
			continue
		end
		if var595 == protoModule.wireTypes.lengthDelimited then
			if var599 == 1 then
				local _ = nil
				local var602, var603 = protoModule.readBuffer(p19, var594)
				var594 = var603
				var593.key = buffer.tostring(var602)
			elseif var599 == 2 then
				local _ = nil
				local var604, var605 = protoModule.readBuffer(p19, var594)
				var594 = var605
				var593.value = universeUserVoteDataModule.UniverseUserVoteData.decode(var604)
			else
				local _ = nil
				local var606, var607 = protoModule.readVarInt(p19, var594)
				var594 = var607 + var606
			end
		elseif var595 == protoModule.wireTypes.i32 then
			local _ = nil
			local var608, var609 = protoModule.readFixed32(p19, var594)
			local _ = var608
			var594 = var609
		elseif var595 == protoModule.wireTypes.i64 then
			local _ = nil
			local var610, var611 = protoModule.readFixed64(p19, var594)
			local _ = var610
			var594 = var611
		else
			error("Unsupported wire type: " .. var938)
		end
	end
	return var593
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
	local var612 = t_19.new()
	
	if self.key ~= nil then
		var612.key = self.key
	end
	if self.value ~= nil then
		var612.value = universeUserVoteDataModule.UniverseUserVoteData.jsonDecode(self.value)
	end
	return var612
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
	local var612 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var613, var614 = protoModule.writeTag(buff, var612, 1, protoModule.wireTypes.lengthDelimited)
		var613, var960 = protoModule.writeString(var613, var614, self.key)
		buff = var613
		var612 = var614
	end
	if self.value ~= nil then
		local var615 = self.value:encode()
		local var616, var617 = protoModule.writeTag(buff, var612, 2, protoModule.wireTypes.lengthDelimited)
		var616, var963 = protoModule.writeBuffer(var616, var617, var615, buffer.len(var615))
		buff = var616
		var612 = var617
	end
	local buff_1 = buffer.create(var612)
	buffer.copy(buff_1, 0, buff, 0, var612)
	
	return buff_1
end

function t_20.decode(p20)
	-- upvalues: t_20 (ref), protoModule (ref), userProfileDataModule (ref)
	local var612 = t_20.new()
	local var613 = 0
	while var613 < buffer.len(p20) do
		local _ = nil
		local var614 = nil
		local var615, var616, var617 = protoModule.readTag(p20, var613)
		local var618 = var615
		var614 = var616
		var613 = var617
		
		if var614 == protoModule.wireTypes.varint then
			local _ = nil
			local var619, var620 = protoModule.readVarInt(p20, var613)
			local _ = var619
			var613 = var620
			continue
		end
		if var614 == protoModule.wireTypes.lengthDelimited then
			if var618 == 1 then
				local _ = nil
				local var621, var622 = protoModule.readBuffer(p20, var613)
				var613 = var622
				var612.key = buffer.tostring(var621)
			elseif var618 == 2 then
				local _ = nil
				local var623, var624 = protoModule.readBuffer(p20, var613)
				var613 = var624
				var612.value = userProfileDataModule.UserProfileData.decode(var623)
			else
				local _ = nil
				local var625, var626 = protoModule.readVarInt(p20, var613)
				var613 = var626 + var625
			end
		elseif var614 == protoModule.wireTypes.i32 then
			local _ = nil
			local var627, var628 = protoModule.readFixed32(p20, var613)
			local _ = var627
			var613 = var628
		elseif var614 == protoModule.wireTypes.i64 then
			local _ = nil
			local var629, var630 = protoModule.readFixed64(p20, var613)
			local _ = var629
			var613 = var630
		else
			error("Unsupported wire type: " .. var967)
		end
	end
	return var612
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
	local var631 = t_20.new()
	
	if self.key ~= nil then
		var631.key = self.key
	end
	if self.value ~= nil then
		var631.value = userProfileDataModule.UserProfileData.jsonDecode(self.value)
	end
	return var631
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
	local var631 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var632, var633 = protoModule.writeTag(buff, var631, 1, protoModule.wireTypes.lengthDelimited)
		var632, var989 = protoModule.writeString(var632, var633, self.key)
		buff = var632
		var631 = var633
	end
	if self.value ~= nil then
		local var634 = self.value:encode()
		local var635, var636 = protoModule.writeTag(buff, var631, 2, protoModule.wireTypes.lengthDelimited)
		var635, var992 = protoModule.writeBuffer(var635, var636, var634, buffer.len(var634))
		buff = var635
		var631 = var636
	end
	local buff_1 = buffer.create(var631)
	buffer.copy(buff_1, 0, buff, 0, var631)
	
	return buff_1
end

function t_21.decode(p21)
	-- upvalues: t_21 (ref), protoModule (ref), universeUserFavoriteDataModule (ref)
	local var631 = t_21.new()
	local var632 = 0
	while var632 < buffer.len(p21) do
		local _ = nil
		local var633 = nil
		local var634, var635, var636 = protoModule.readTag(p21, var632)
		local var637 = var634
		var633 = var635
		var632 = var636
		
		if var633 == protoModule.wireTypes.varint then
			local _ = nil
			local var638, var639 = protoModule.readVarInt(p21, var632)
			local _ = var638
			var632 = var639
			continue
		end
		if var633 == protoModule.wireTypes.lengthDelimited then
			if var637 == 1 then
				local _ = nil
				local var640, var641 = protoModule.readBuffer(p21, var632)
				var632 = var641
				var631.key = buffer.tostring(var640)
			elseif var637 == 2 then
				local _ = nil
				local var642, var643 = protoModule.readBuffer(p21, var632)
				var632 = var643
				var631.value = universeUserFavoriteDataModule.UniverseUserFavoriteData.decode(var642)
			else
				local _ = nil
				local var644, var645 = protoModule.readVarInt(p21, var632)
				var632 = var645 + var644
			end
		elseif var633 == protoModule.wireTypes.i32 then
			local _ = nil
			local var646, var647 = protoModule.readFixed32(p21, var632)
			local _ = var646
			var632 = var647
		elseif var633 == protoModule.wireTypes.i64 then
			local _ = nil
			local var648, var649 = protoModule.readFixed64(p21, var632)
			local _ = var648
			var632 = var649
		else
			error("Unsupported wire type: " .. var996)
		end
	end
	return var631
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
	local var650 = t_21.new()
	
	if self.key ~= nil then
		var650.key = self.key
	end
	if self.value ~= nil then
		var650.value = universeUserFavoriteDataModule.UniverseUserFavoriteData.jsonDecode(self.value)
	end
	return var650
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
	local var650 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var651, var652 = protoModule.writeTag(buff, var650, 1, protoModule.wireTypes.lengthDelimited)
		var651, var1018 = protoModule.writeString(var651, var652, self.key)
		buff = var651
		var650 = var652
	end
	if self.value ~= nil then
		local var653 = self.value:encode()
		local var654, var655 = protoModule.writeTag(buff, var650, 2, protoModule.wireTypes.lengthDelimited)
		var654, var1021 = protoModule.writeBuffer(var654, var655, var653, buffer.len(var653))
		buff = var654
		var650 = var655
	end
	local buff_1 = buffer.create(var650)
	buffer.copy(buff_1, 0, buff, 0, var650)
	
	return buff_1
end

function t_22.decode(p22)
	-- upvalues: t_22 (ref), protoModule (ref), playabilityDataModule (ref)
	local var650 = t_22.new()
	local var651 = 0
	while var651 < buffer.len(p22) do
		local _ = nil
		local var652 = nil
		local var653, var654, var655 = protoModule.readTag(p22, var651)
		local var656 = var653
		var652 = var654
		var651 = var655
		
		if var652 == protoModule.wireTypes.varint then
			local _ = nil
			local var657, var658 = protoModule.readVarInt(p22, var651)
			local _ = var657
			var651 = var658
			continue
		end
		if var652 == protoModule.wireTypes.lengthDelimited then
			if var656 == 1 then
				local _ = nil
				local var659, var660 = protoModule.readBuffer(p22, var651)
				var651 = var660
				var650.key = buffer.tostring(var659)
			elseif var656 == 2 then
				local _ = nil
				local var661, var662 = protoModule.readBuffer(p22, var651)
				var651 = var662
				var650.value = playabilityDataModule.PlayabilityData.decode(var661)
			else
				local _ = nil
				local var663, var664 = protoModule.readVarInt(p22, var651)
				var651 = var664 + var663
			end
		elseif var652 == protoModule.wireTypes.i32 then
			local _ = nil
			local var665, var666 = protoModule.readFixed32(p22, var651)
			local _ = var665
			var651 = var666
		elseif var652 == protoModule.wireTypes.i64 then
			local _ = nil
			local var667, var668 = protoModule.readFixed64(p22, var651)
			local _ = var667
			var651 = var668
		else
			error("Unsupported wire type: " .. var1025)
		end
	end
	return var650
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
	local var669 = t_22.new()
	
	if self.key ~= nil then
		var669.key = self.key
	end
	if self.value ~= nil then
		var669.value = playabilityDataModule.PlayabilityData.jsonDecode(self.value)
	end
	return var669
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
	local var669 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var670, var671 = protoModule.writeTag(buff, var669, 1, protoModule.wireTypes.lengthDelimited)
		var670, var1047 = protoModule.writeString(var670, var671, self.key)
		buff = var670
		var669 = var671
	end
	if self.value ~= nil then
		local var672 = self.value:encode()
		local var673, var674 = protoModule.writeTag(buff, var669, 2, protoModule.wireTypes.lengthDelimited)
		var673, var1050 = protoModule.writeBuffer(var673, var674, var672, buffer.len(var672))
		buff = var673
		var669 = var674
	end
	local buff_1 = buffer.create(var669)
	buffer.copy(buff_1, 0, buff, 0, var669)
	
	return buff_1
end

function t_23.decode(p23)
	-- upvalues: t_23 (ref), protoModule (ref), universeUserFollowLimitDataModule (ref)
	local var669 = t_23.new()
	local var670 = 0
	while var670 < buffer.len(p23) do
		local _ = nil
		local var671 = nil
		local var672, var673, var674 = protoModule.readTag(p23, var670)
		local var675 = var672
		var671 = var673
		var670 = var674
		
		if var671 == protoModule.wireTypes.varint then
			local _ = nil
			local var676, var677 = protoModule.readVarInt(p23, var670)
			local _ = var676
			var670 = var677
			continue
		end
		if var671 == protoModule.wireTypes.lengthDelimited then
			if var675 == 1 then
				local _ = nil
				local var678, var679 = protoModule.readBuffer(p23, var670)
				var670 = var679
				var669.key = buffer.tostring(var678)
			elseif var675 == 2 then
				local _ = nil
				local var680, var681 = protoModule.readBuffer(p23, var670)
				var670 = var681
				var669.value = universeUserFollowLimitDataModule.UniverseUserFollowLimitData.decode(var680)
			else
				local _ = nil
				local var682, var683 = protoModule.readVarInt(p23, var670)
				var670 = var683 + var682
			end
		elseif var671 == protoModule.wireTypes.i32 then
			local _ = nil
			local var684, var685 = protoModule.readFixed32(p23, var670)
			local _ = var684
			var670 = var685
		elseif var671 == protoModule.wireTypes.i64 then
			local _ = nil
			local var686, var687 = protoModule.readFixed64(p23, var670)
			local _ = var686
			var670 = var687
		else
			error("Unsupported wire type: " .. var1054)
		end
	end
	return var669
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
	local var688 = t_23.new()
	
	if self.key ~= nil then
		var688.key = self.key
	end
	if self.value ~= nil then
		var688.value = universeUserFollowLimitDataModule.UniverseUserFollowLimitData.jsonDecode(self.value)
	end
	return var688
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
	local var688 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var689, var690 = protoModule.writeTag(buff, var688, 1, protoModule.wireTypes.lengthDelimited)
		var689, var1076 = protoModule.writeString(var689, var690, self.key)
		buff = var689
		var688 = var690
	end
	if self.value ~= nil then
		local var691 = self.value:encode()
		local var692, var693 = protoModule.writeTag(buff, var688, 2, protoModule.wireTypes.lengthDelimited)
		var692, var1079 = protoModule.writeBuffer(var692, var693, var691, buffer.len(var691))
		buff = var692
		var688 = var693
	end
	local buff_1 = buffer.create(var688)
	buffer.copy(buff_1, 0, buff, 0, var688)
	
	return buff_1
end

function t_24.decode(p24)
	-- upvalues: t_24 (ref), protoModule (ref), universeUserVoteFeedbackMetadataDataModule (ref)
	local var688 = t_24.new()
	local var689 = 0
	while var689 < buffer.len(p24) do
		local _ = nil
		local var690 = nil
		local var691, var692, var693 = protoModule.readTag(p24, var689)
		local var694 = var691
		var690 = var692
		var689 = var693
		
		if var690 == protoModule.wireTypes.varint then
			local _ = nil
			local var695, var696 = protoModule.readVarInt(p24, var689)
			local _ = var695
			var689 = var696
			continue
		end
		if var690 == protoModule.wireTypes.lengthDelimited then
			if var694 == 1 then
				local _ = nil
				local var697, var698 = protoModule.readBuffer(p24, var689)
				var689 = var698
				var688.key = buffer.tostring(var697)
			elseif var694 == 2 then
				local _ = nil
				local var699, var700 = protoModule.readBuffer(p24, var689)
				var689 = var700
				var688.value = universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.decode(var699)
			else
				local _ = nil
				local var701, var702 = protoModule.readVarInt(p24, var689)
				var689 = var702 + var701
			end
		elseif var690 == protoModule.wireTypes.i32 then
			local _ = nil
			local var703, var704 = protoModule.readFixed32(p24, var689)
			local _ = var703
			var689 = var704
		elseif var690 == protoModule.wireTypes.i64 then
			local _ = nil
			local var705, var706 = protoModule.readFixed64(p24, var689)
			local _ = var705
			var689 = var706
		else
			error("Unsupported wire type: " .. var1083)
		end
	end
	return var688
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
	local var707 = t_24.new()
	
	if self.key ~= nil then
		var707.key = self.key
	end
	if self.value ~= nil then
		var707.value = universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.jsonDecode(self.value)
	end
	return var707
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
	local var707 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var708, var709 = protoModule.writeTag(buff, var707, 1, protoModule.wireTypes.lengthDelimited)
		var708, var1105 = protoModule.writeString(var708, var709, self.key)
		buff = var708
		var707 = var709
	end
	if self.value ~= nil then
		local var710 = self.value:encode()
		local var711, var712 = protoModule.writeTag(buff, var707, 2, protoModule.wireTypes.lengthDelimited)
		var711, var1108 = protoModule.writeBuffer(var711, var712, var710, buffer.len(var710))
		buff = var711
		var707 = var712
	end
	local buff_1 = buffer.create(var707)
	buffer.copy(buff_1, 0, buff, 0, var707)
	
	return buff_1
end

function t_25.decode(p25)
	-- upvalues: t_25 (ref), protoModule (ref), momentDataModule (ref)
	local var707 = t_25.new()
	local var708 = 0
	while var708 < buffer.len(p25) do
		local _ = nil
		local var709 = nil
		local var710, var711, var712 = protoModule.readTag(p25, var708)
		local var713 = var710
		var709 = var711
		var708 = var712
		
		if var709 == protoModule.wireTypes.varint then
			local _ = nil
			local var714, var715 = protoModule.readVarInt(p25, var708)
			local _ = var714
			var708 = var715
			continue
		end
		if var709 == protoModule.wireTypes.lengthDelimited then
			if var713 == 1 then
				local _ = nil
				local var716, var717 = protoModule.readBuffer(p25, var708)
				var708 = var717
				var707.key = buffer.tostring(var716)
			elseif var713 == 2 then
				local _ = nil
				local var718, var719 = protoModule.readBuffer(p25, var708)
				var708 = var719
				var707.value = momentDataModule.MomentData.decode(var718)
			else
				local _ = nil
				local var720, var721 = protoModule.readVarInt(p25, var708)
				var708 = var721 + var720
			end
		elseif var709 == protoModule.wireTypes.i32 then
			local _ = nil
			local var722, var723 = protoModule.readFixed32(p25, var708)
			local _ = var722
			var708 = var723
		elseif var709 == protoModule.wireTypes.i64 then
			local _ = nil
			local var724, var725 = protoModule.readFixed64(p25, var708)
			local _ = var724
			var708 = var725
		else
			error("Unsupported wire type: " .. var1112)
		end
	end
	return var707
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
	local var726 = t_25.new()
	
	if self.key ~= nil then
		var726.key = self.key
	end
	if self.value ~= nil then
		var726.value = momentDataModule.MomentData.jsonDecode(self.value)
	end
	return var726
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
	local var726 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var727, var728 = protoModule.writeTag(buff, var726, 1, protoModule.wireTypes.lengthDelimited)
		var727, var1134 = protoModule.writeString(var727, var728, self.key)
		buff = var727
		var726 = var728
	end
	if self.value ~= nil then
		local var729 = self.value:encode()
		local var730, var731 = protoModule.writeTag(buff, var726, 2, protoModule.wireTypes.lengthDelimited)
		var730, var1137 = protoModule.writeBuffer(var730, var731, var729, buffer.len(var729))
		buff = var730
		var726 = var731
	end
	local buff_1 = buffer.create(var726)
	buffer.copy(buff_1, 0, buff, 0, var726)
	
	return buff_1
end

function t_26.decode(p26)
	-- upvalues: t_26 (ref), protoModule (ref), communityDataModule (ref)
	local var726 = t_26.new()
	local var727 = 0
	while var727 < buffer.len(p26) do
		local _ = nil
		local var728 = nil
		local var729, var730, var731 = protoModule.readTag(p26, var727)
		local var732 = var729
		var728 = var730
		var727 = var731
		
		if var728 == protoModule.wireTypes.varint then
			local _ = nil
			local var733, var734 = protoModule.readVarInt(p26, var727)
			local _ = var733
			var727 = var734
			continue
		end
		if var728 == protoModule.wireTypes.lengthDelimited then
			if var732 == 1 then
				local _ = nil
				local var735, var736 = protoModule.readBuffer(p26, var727)
				var727 = var736
				var726.key = buffer.tostring(var735)
			elseif var732 == 2 then
				local _ = nil
				local var737, var738 = protoModule.readBuffer(p26, var727)
				var727 = var738
				var726.value = communityDataModule.CommunityData.decode(var737)
			else
				local _ = nil
				local var739, var740 = protoModule.readVarInt(p26, var727)
				var727 = var740 + var739
			end
		elseif var728 == protoModule.wireTypes.i32 then
			local _ = nil
			local var741, var742 = protoModule.readFixed32(p26, var727)
			local _ = var741
			var727 = var742
		elseif var728 == protoModule.wireTypes.i64 then
			local _ = nil
			local var743, var744 = protoModule.readFixed64(p26, var727)
			local _ = var743
			var727 = var744
		else
			error("Unsupported wire type: " .. var1141)
		end
	end
	return var726
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
	local var745 = t_26.new()
	
	if self.key ~= nil then
		var745.key = self.key
	end
	if self.value ~= nil then
		var745.value = communityDataModule.CommunityData.jsonDecode(self.value)
	end
	return var745
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
	local var745 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var746, var747 = protoModule.writeTag(buff, var745, 1, protoModule.wireTypes.lengthDelimited)
		var746, var1163 = protoModule.writeString(var746, var747, self.key)
		buff = var746
		var745 = var747
	end
	if self.value ~= nil then
		local var748 = self.value:encode()
		local var749, var750 = protoModule.writeTag(buff, var745, 2, protoModule.wireTypes.lengthDelimited)
		var749, var1166 = protoModule.writeBuffer(var749, var750, var748, buffer.len(var748))
		buff = var749
		var745 = var750
	end
	local buff_1 = buffer.create(var745)
	buffer.copy(buff_1, 0, buff, 0, var745)
	
	return buff_1
end

function t_27.decode(p27)
	-- upvalues: t_27 (ref), protoModule (ref), communityUserMembershipDataModule (ref)
	local var745 = t_27.new()
	local var746 = 0
	while var746 < buffer.len(p27) do
		local _ = nil
		local var747 = nil
		local var748, var749, var750 = protoModule.readTag(p27, var746)
		local var751 = var748
		var747 = var749
		var746 = var750
		
		if var747 == protoModule.wireTypes.varint then
			local _ = nil
			local var752, var753 = protoModule.readVarInt(p27, var746)
			local _ = var752
			var746 = var753
			continue
		end
		if var747 == protoModule.wireTypes.lengthDelimited then
			if var751 == 1 then
				local _ = nil
				local var754, var755 = protoModule.readBuffer(p27, var746)
				var746 = var755
				var745.key = buffer.tostring(var754)
			elseif var751 == 2 then
				local _ = nil
				local var756, var757 = protoModule.readBuffer(p27, var746)
				var746 = var757
				var745.value = communityUserMembershipDataModule.CommunityUserMembershipData.decode(var756)
			else
				local _ = nil
				local var758, var759 = protoModule.readVarInt(p27, var746)
				var746 = var759 + var758
			end
		elseif var747 == protoModule.wireTypes.i32 then
			local _ = nil
			local var760, var761 = protoModule.readFixed32(p27, var746)
			local _ = var760
			var746 = var761
		elseif var747 == protoModule.wireTypes.i64 then
			local _ = nil
			local var762, var763 = protoModule.readFixed64(p27, var746)
			local _ = var762
			var746 = var763
		else
			error("Unsupported wire type: " .. var1170)
		end
	end
	return var745
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
	local var764 = t_27.new()
	
	if self.key ~= nil then
		var764.key = self.key
	end
	if self.value ~= nil then
		var764.value = communityUserMembershipDataModule.CommunityUserMembershipData.jsonDecode(self.value)
	end
	return var764
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
	local var764 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var765, var766 = protoModule.writeTag(buff, var764, 1, protoModule.wireTypes.lengthDelimited)
		var765, var1192 = protoModule.writeString(var765, var766, self.key)
		buff = var765
		var764 = var766
	end
	if self.value ~= nil then
		local var767 = self.value:encode()
		local var768, var769 = protoModule.writeTag(buff, var764, 2, protoModule.wireTypes.lengthDelimited)
		var768, var1195 = protoModule.writeBuffer(var768, var769, var767, buffer.len(var767))
		buff = var768
		var764 = var769
	end
	local buff_1 = buffer.create(var764)
	buffer.copy(buff_1, 0, buff, 0, var764)
	
	return buff_1
end

function t_28.decode(p28)
	-- upvalues: t_28 (ref), protoModule (ref), userRecommendationDataModule (ref)
	local var764 = t_28.new()
	local var765 = 0
	while var765 < buffer.len(p28) do
		local _ = nil
		local var766 = nil
		local var767, var768, var769 = protoModule.readTag(p28, var765)
		local var770 = var767
		var766 = var768
		var765 = var769
		
		if var766 == protoModule.wireTypes.varint then
			local _ = nil
			local var771, var772 = protoModule.readVarInt(p28, var765)
			local _ = var771
			var765 = var772
			continue
		end
		if var766 == protoModule.wireTypes.lengthDelimited then
			if var770 == 1 then
				local _ = nil
				local var773, var774 = protoModule.readBuffer(p28, var765)
				var765 = var774
				var764.key = buffer.tostring(var773)
			elseif var770 == 2 then
				local _ = nil
				local var775, var776 = protoModule.readBuffer(p28, var765)
				var765 = var776
				var764.value = userRecommendationDataModule.UserRecommendationData.decode(var775)
			else
				local _ = nil
				local var777, var778 = protoModule.readVarInt(p28, var765)
				var765 = var778 + var777
			end
		elseif var766 == protoModule.wireTypes.i32 then
			local _ = nil
			local var779, var780 = protoModule.readFixed32(p28, var765)
			local _ = var779
			var765 = var780
		elseif var766 == protoModule.wireTypes.i64 then
			local _ = nil
			local var781, var782 = protoModule.readFixed64(p28, var765)
			local _ = var781
			var765 = var782
		else
			error("Unsupported wire type: " .. var1199)
		end
	end
	return var764
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
	-- upvalues: t_28 (ref), userRecommendationDataModule (ref)
	local var783 = t_28.new()
	
	if self.key ~= nil then
		var783.key = self.key
	end
	if self.value ~= nil then
		var783.value = userRecommendationDataModule.UserRecommendationData.jsonDecode(self.value)
	end
	return var783
end

t_28.descriptor = {
	name = "HydrationContent_UserRecommendationEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserRecommendationEntry"
}
t.HydrationContent_UserRecommendationEntry = t_28
typeRegistryModule.default:register(t.HydrationContent_UserRecommendationEntry)
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
	local var783 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var784, var785 = protoModule.writeTag(buff, var783, 1, protoModule.wireTypes.lengthDelimited)
		var784, var1221 = protoModule.writeString(var784, var785, self.key)
		buff = var784
		var783 = var785
	end
	if self.value ~= nil then
		local var786 = self.value:encode()
		local var787, var788 = protoModule.writeTag(buff, var783, 2, protoModule.wireTypes.lengthDelimited)
		var787, var1224 = protoModule.writeBuffer(var787, var788, var786, buffer.len(var786))
		buff = var787
		var783 = var788
	end
	local buff_1 = buffer.create(var783)
	buffer.copy(buff_1, 0, buff, 0, var783)
	
	return buff_1
end

function t_29.decode(p29)
	-- upvalues: t_29 (ref), protoModule (ref), contactDataModule (ref)
	local var783 = t_29.new()
	local var784 = 0
	while var784 < buffer.len(p29) do
		local _ = nil
		local var785 = nil
		local var786, var787, var788 = protoModule.readTag(p29, var784)
		local var789 = var786
		var785 = var787
		var784 = var788
		
		if var785 == protoModule.wireTypes.varint then
			local _ = nil
			local var790, var791 = protoModule.readVarInt(p29, var784)
			local _ = var790
			var784 = var791
			continue
		end
		if var785 == protoModule.wireTypes.lengthDelimited then
			if var789 == 1 then
				local _ = nil
				local var792, var793 = protoModule.readBuffer(p29, var784)
				var784 = var793
				var783.key = buffer.tostring(var792)
			elseif var789 == 2 then
				local _ = nil
				local var794, var795 = protoModule.readBuffer(p29, var784)
				var784 = var795
				var783.value = contactDataModule.ContactData.decode(var794)
			else
				local _ = nil
				local var796, var797 = protoModule.readVarInt(p29, var784)
				var784 = var797 + var796
			end
		elseif var785 == protoModule.wireTypes.i32 then
			local _ = nil
			local var798, var799 = protoModule.readFixed32(p29, var784)
			local _ = var798
			var784 = var799
		elseif var785 == protoModule.wireTypes.i64 then
			local _ = nil
			local var800, var801 = protoModule.readFixed64(p29, var784)
			local _ = var800
			var784 = var801
		else
			error("Unsupported wire type: " .. var1228)
		end
	end
	return var783
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
	-- upvalues: t_29 (ref), contactDataModule (ref)
	local var802 = t_29.new()
	
	if self.key ~= nil then
		var802.key = self.key
	end
	if self.value ~= nil then
		var802.value = contactDataModule.ContactData.jsonDecode(self.value)
	end
	return var802
end

t_29.descriptor = {
	name = "HydrationContent_ContactEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContactEntry"
}
t.HydrationContent_ContactEntry = t_29
typeRegistryModule.default:register(t.HydrationContent_ContactEntry)

return { HydrationContent = t.HydrationContent }