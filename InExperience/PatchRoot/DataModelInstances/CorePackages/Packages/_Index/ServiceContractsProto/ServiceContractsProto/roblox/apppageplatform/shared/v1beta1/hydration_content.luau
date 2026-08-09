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
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 894 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		badge = if p0 == nil or p0.badge == nil then {} else p0.badge,
		universe = if p0 == nil or p0.universe == nil then {} else p0.universe,
		creator = if p0 == nil or p0.creator == nil then {} else p0.creator,
		event = if p0 == nil or p0.event == nil then {} else p0.event,
		song = if p0 == nil or p0.song == nil then {} else p0.song,
		game_pass = if p0 == nil or p0.game_pass == nil then {} else p0.game_pass,
		media_asset = if p0 == nil or p0.media_asset == nil then {} else p0.media_asset,
		social_link = if p0 == nil or p0.social_link == nil then {} else p0.social_link,
		game_developer_product = if p0 == nil or p0.game_developer_product == nil then {} else p0.game_developer_product,
		game_subscription = if p0 == nil or p0.game_subscription == nil then {} else p0.game_subscription,
		marketplace_catalog_category = if p0 == nil or p0.marketplace_catalog_category == nil then {} else p0.marketplace_catalog_category,
		marketplace_asset = if p0 == nil or p0.marketplace_asset == nil then {} else p0.marketplace_asset,
		marketplace_bundle = if p0 == nil or p0.marketplace_bundle == nil then {} else p0.marketplace_bundle,
		marketplace_look = if p0 == nil or p0.marketplace_look == nil then {} else p0.marketplace_look,
		catalog_sort = if p0 == nil or p0.catalog_sort == nil then {} else p0.catalog_sort,
		age_recommendation = if p0 == nil or p0.age_recommendation == nil then {} else p0.age_recommendation,
		universe_user_follow = if p0 == nil or p0.universe_user_follow == nil then {} else p0.universe_user_follow,
		universe_user_vote = if p0 == nil or p0.universe_user_vote == nil then {} else p0.universe_user_vote,
		user_profile = if p0 == nil or p0.user_profile == nil then {} else p0.user_profile,
		universe_user_favorite = if p0 == nil or p0.universe_user_favorite == nil then {} else p0.universe_user_favorite,
		playability = if p0 == nil or p0.playability == nil then {} else p0.playability,
		universe_user_follow_limit = if p0 == nil or p0.universe_user_follow_limit == nil then {} else p0.universe_user_follow_limit,
		universe_user_vote_feedback_metadata = if p0 == nil or p0.universe_user_vote_feedback_metadata == nil then {} else p0.universe_user_vote_feedback_metadata,
		moment = if p0 == nil or p0.moment == nil then {} else p0.moment
	}, t_1)
end

function t_1:encode() --[[ line: 936 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var53 = 0
	
	if self.badge ~= nil and next(self.badge) ~= nil then
		for i, v in self.badge do
			local var54, var55 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var54, var55 = protoModule.writeString(var54, var55, i)
			local var56 = v:encode()
			var55, var57 = protoModule.writeTag(var54, var55, 2, protoModule.wireTypes.lengthDelimited)
			var55, var57 = protoModule.writeBuffer(var55, var57, var56, buffer.len(var56))
			local var58 = var55
			local var59 = var57
			local var60, var61 = protoModule.writeTag(buff, var53, 1, protoModule.wireTypes.lengthDelimited)
			var60, var61 = protoModule.writeBuffer(var60, var61, var58, var59)
			buff = var60
			var53 = var61
		end
	end
	if self.universe ~= nil and next(self.universe) ~= nil then
		for i, v in self.universe do
			local var62, var63 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var62, var63 = protoModule.writeString(var62, var63, i)
			local var64 = v:encode()
			var63, var65 = protoModule.writeTag(var62, var63, 2, protoModule.wireTypes.lengthDelimited)
			var63, var65 = protoModule.writeBuffer(var63, var65, var64, buffer.len(var64))
			local var66 = var63
			local var67 = var65
			local var68, var69 = protoModule.writeTag(buff, var53, 2, protoModule.wireTypes.lengthDelimited)
			var68, var69 = protoModule.writeBuffer(var68, var69, var66, var67)
			buff = var68
			var53 = var69
		end
	end
	if self.creator ~= nil and next(self.creator) ~= nil then
		for i, v in self.creator do
			local var70, var71 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var70, var71 = protoModule.writeString(var70, var71, i)
			local var72 = v:encode()
			var71, var73 = protoModule.writeTag(var70, var71, 2, protoModule.wireTypes.lengthDelimited)
			var71, var73 = protoModule.writeBuffer(var71, var73, var72, buffer.len(var72))
			local var74 = var71
			local var75 = var73
			local var76, var77 = protoModule.writeTag(buff, var53, 3, protoModule.wireTypes.lengthDelimited)
			var76, var77 = protoModule.writeBuffer(var76, var77, var74, var75)
			buff = var76
			var53 = var77
		end
	end
	if self.event ~= nil and next(self.event) ~= nil then
		for i, v in self.event do
			local var78, var79 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var78, var79 = protoModule.writeString(var78, var79, i)
			local var80 = v:encode()
			var79, var81 = protoModule.writeTag(var78, var79, 2, protoModule.wireTypes.lengthDelimited)
			var79, var81 = protoModule.writeBuffer(var79, var81, var80, buffer.len(var80))
			local var82 = var79
			local var83 = var81
			local var84, var85 = protoModule.writeTag(buff, var53, 4, protoModule.wireTypes.lengthDelimited)
			var84, var85 = protoModule.writeBuffer(var84, var85, var82, var83)
			buff = var84
			var53 = var85
		end
	end
	if self.song ~= nil and next(self.song) ~= nil then
		for i, v in self.song do
			local var86, var87 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var86, var87 = protoModule.writeString(var86, var87, i)
			local var88 = v:encode()
			var87, var89 = protoModule.writeTag(var86, var87, 2, protoModule.wireTypes.lengthDelimited)
			var87, var89 = protoModule.writeBuffer(var87, var89, var88, buffer.len(var88))
			local var90 = var87
			local var91 = var89
			local var92, var93 = protoModule.writeTag(buff, var53, 5, protoModule.wireTypes.lengthDelimited)
			var92, var93 = protoModule.writeBuffer(var92, var93, var90, var91)
			buff = var92
			var53 = var93
		end
	end
	if self.game_pass ~= nil and next(self.game_pass) ~= nil then
		for i, v in self.game_pass do
			local var94, var95 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var94, var95 = protoModule.writeString(var94, var95, i)
			local var96 = v:encode()
			var95, var97 = protoModule.writeTag(var94, var95, 2, protoModule.wireTypes.lengthDelimited)
			var95, var97 = protoModule.writeBuffer(var95, var97, var96, buffer.len(var96))
			local var98 = var95
			local var99 = var97
			local var100, var101 = protoModule.writeTag(buff, var53, 6, protoModule.wireTypes.lengthDelimited)
			var100, var101 = protoModule.writeBuffer(var100, var101, var98, var99)
			buff = var100
			var53 = var101
		end
	end
	if self.media_asset ~= nil and next(self.media_asset) ~= nil then
		for i, v in self.media_asset do
			local var102, var103 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var102, var103 = protoModule.writeString(var102, var103, i)
			local var104 = v:encode()
			var103, var105 = protoModule.writeTag(var102, var103, 2, protoModule.wireTypes.lengthDelimited)
			var103, var105 = protoModule.writeBuffer(var103, var105, var104, buffer.len(var104))
			local var106 = var103
			local var107 = var105
			local var108, var109 = protoModule.writeTag(buff, var53, 7, protoModule.wireTypes.lengthDelimited)
			var108, var109 = protoModule.writeBuffer(var108, var109, var106, var107)
			buff = var108
			var53 = var109
		end
	end
	if self.social_link ~= nil and next(self.social_link) ~= nil then
		for i, v in self.social_link do
			local var110, var111 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var110, var111 = protoModule.writeString(var110, var111, i)
			local var112 = v:encode()
			var111, var113 = protoModule.writeTag(var110, var111, 2, protoModule.wireTypes.lengthDelimited)
			var111, var113 = protoModule.writeBuffer(var111, var113, var112, buffer.len(var112))
			local var114 = var111
			local var115 = var113
			local var116, var117 = protoModule.writeTag(buff, var53, 8, protoModule.wireTypes.lengthDelimited)
			var116, var117 = protoModule.writeBuffer(var116, var117, var114, var115)
			buff = var116
			var53 = var117
		end
	end
	if self.game_developer_product ~= nil and next(self.game_developer_product) ~= nil then
		for i, v in self.game_developer_product do
			local var118, var119 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var118, var119 = protoModule.writeString(var118, var119, i)
			local var120 = v:encode()
			var119, var121 = protoModule.writeTag(var118, var119, 2, protoModule.wireTypes.lengthDelimited)
			var119, var121 = protoModule.writeBuffer(var119, var121, var120, buffer.len(var120))
			local var122 = var119
			local var123 = var121
			local var124, var125 = protoModule.writeTag(buff, var53, 9, protoModule.wireTypes.lengthDelimited)
			var124, var125 = protoModule.writeBuffer(var124, var125, var122, var123)
			buff = var124
			var53 = var125
		end
	end
	if self.game_subscription ~= nil and next(self.game_subscription) ~= nil then
		for i, v in self.game_subscription do
			local var126, var127 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var126, var127 = protoModule.writeString(var126, var127, i)
			local var128 = v:encode()
			var127, var129 = protoModule.writeTag(var126, var127, 2, protoModule.wireTypes.lengthDelimited)
			var127, var129 = protoModule.writeBuffer(var127, var129, var128, buffer.len(var128))
			local var130 = var127
			local var131 = var129
			local var132, var133 = protoModule.writeTag(buff, var53, 10, protoModule.wireTypes.lengthDelimited)
			var132, var133 = protoModule.writeBuffer(var132, var133, var130, var131)
			buff = var132
			var53 = var133
		end
	end
	if self.marketplace_catalog_category ~= nil and next(self.marketplace_catalog_category) ~= nil then
		for i, v in self.marketplace_catalog_category do
			local var134, var135 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var134, var135 = protoModule.writeString(var134, var135, i)
			local var136 = v:encode()
			var135, var137 = protoModule.writeTag(var134, var135, 2, protoModule.wireTypes.lengthDelimited)
			var135, var137 = protoModule.writeBuffer(var135, var137, var136, buffer.len(var136))
			local var138 = var135
			local var139 = var137
			local var140, var141 = protoModule.writeTag(buff, var53, 11, protoModule.wireTypes.lengthDelimited)
			var140, var141 = protoModule.writeBuffer(var140, var141, var138, var139)
			buff = var140
			var53 = var141
		end
	end
	if self.marketplace_asset ~= nil and next(self.marketplace_asset) ~= nil then
		for i, v in self.marketplace_asset do
			local var142, var143 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var142, var143 = protoModule.writeString(var142, var143, i)
			local var144 = v:encode()
			var143, var145 = protoModule.writeTag(var142, var143, 2, protoModule.wireTypes.lengthDelimited)
			var143, var145 = protoModule.writeBuffer(var143, var145, var144, buffer.len(var144))
			local var146 = var143
			local var147 = var145
			local var148, var149 = protoModule.writeTag(buff, var53, 12, protoModule.wireTypes.lengthDelimited)
			var148, var149 = protoModule.writeBuffer(var148, var149, var146, var147)
			buff = var148
			var53 = var149
		end
	end
	if self.marketplace_bundle ~= nil and next(self.marketplace_bundle) ~= nil then
		for i, v in self.marketplace_bundle do
			local var150, var151 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var150, var151 = protoModule.writeString(var150, var151, i)
			local var152 = v:encode()
			var151, var153 = protoModule.writeTag(var150, var151, 2, protoModule.wireTypes.lengthDelimited)
			var151, var153 = protoModule.writeBuffer(var151, var153, var152, buffer.len(var152))
			local var154 = var151
			local var155 = var153
			local var156, var157 = protoModule.writeTag(buff, var53, 13, protoModule.wireTypes.lengthDelimited)
			var156, var157 = protoModule.writeBuffer(var156, var157, var154, var155)
			buff = var156
			var53 = var157
		end
	end
	if self.marketplace_look ~= nil and next(self.marketplace_look) ~= nil then
		for i, v in self.marketplace_look do
			local var158, var159 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var158, var159 = protoModule.writeString(var158, var159, i)
			local var160 = v:encode()
			var159, var161 = protoModule.writeTag(var158, var159, 2, protoModule.wireTypes.lengthDelimited)
			var159, var161 = protoModule.writeBuffer(var159, var161, var160, buffer.len(var160))
			local var162 = var159
			local var163 = var161
			local var164, var165 = protoModule.writeTag(buff, var53, 14, protoModule.wireTypes.lengthDelimited)
			var164, var165 = protoModule.writeBuffer(var164, var165, var162, var163)
			buff = var164
			var53 = var165
		end
	end
	if self.catalog_sort ~= nil and next(self.catalog_sort) ~= nil then
		for i, v in self.catalog_sort do
			local var166, var167 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var166, var167 = protoModule.writeString(var166, var167, i)
			local var168 = v:encode()
			var167, var169 = protoModule.writeTag(var166, var167, 2, protoModule.wireTypes.lengthDelimited)
			var167, var169 = protoModule.writeBuffer(var167, var169, var168, buffer.len(var168))
			local var170 = var167
			local var171 = var169
			local var172, var173 = protoModule.writeTag(buff, var53, 15, protoModule.wireTypes.lengthDelimited)
			var172, var173 = protoModule.writeBuffer(var172, var173, var170, var171)
			buff = var172
			var53 = var173
		end
	end
	if self.age_recommendation ~= nil and next(self.age_recommendation) ~= nil then
		for i, v in self.age_recommendation do
			local var174, var175 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var174, var175 = protoModule.writeString(var174, var175, i)
			local var176 = v:encode()
			var175, var177 = protoModule.writeTag(var174, var175, 2, protoModule.wireTypes.lengthDelimited)
			var175, var177 = protoModule.writeBuffer(var175, var177, var176, buffer.len(var176))
			local var178 = var175
			local var179 = var177
			local var180, var181 = protoModule.writeTag(buff, var53, 16, protoModule.wireTypes.lengthDelimited)
			var180, var181 = protoModule.writeBuffer(var180, var181, var178, var179)
			buff = var180
			var53 = var181
		end
	end
	if self.universe_user_follow ~= nil and next(self.universe_user_follow) ~= nil then
		for i, v in self.universe_user_follow do
			local var182, var183 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var182, var183 = protoModule.writeString(var182, var183, i)
			local var184 = v:encode()
			var183, var185 = protoModule.writeTag(var182, var183, 2, protoModule.wireTypes.lengthDelimited)
			var183, var185 = protoModule.writeBuffer(var183, var185, var184, buffer.len(var184))
			local var186 = var183
			local var187 = var185
			local var188, var189 = protoModule.writeTag(buff, var53, 17, protoModule.wireTypes.lengthDelimited)
			var188, var189 = protoModule.writeBuffer(var188, var189, var186, var187)
			buff = var188
			var53 = var189
		end
	end
	if self.universe_user_vote ~= nil and next(self.universe_user_vote) ~= nil then
		for i, v in self.universe_user_vote do
			local var190, var191 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var190, var191 = protoModule.writeString(var190, var191, i)
			local var192 = v:encode()
			var191, var193 = protoModule.writeTag(var190, var191, 2, protoModule.wireTypes.lengthDelimited)
			var191, var193 = protoModule.writeBuffer(var191, var193, var192, buffer.len(var192))
			local var194 = var191
			local var195 = var193
			local var196, var197 = protoModule.writeTag(buff, var53, 18, protoModule.wireTypes.lengthDelimited)
			var196, var197 = protoModule.writeBuffer(var196, var197, var194, var195)
			buff = var196
			var53 = var197
		end
	end
	if self.user_profile ~= nil and next(self.user_profile) ~= nil then
		for i, v in self.user_profile do
			local var198, var199 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var198, var199 = protoModule.writeString(var198, var199, i)
			local var200 = v:encode()
			var199, var201 = protoModule.writeTag(var198, var199, 2, protoModule.wireTypes.lengthDelimited)
			var199, var201 = protoModule.writeBuffer(var199, var201, var200, buffer.len(var200))
			local var202 = var199
			local var203 = var201
			local var204, var205 = protoModule.writeTag(buff, var53, 19, protoModule.wireTypes.lengthDelimited)
			var204, var205 = protoModule.writeBuffer(var204, var205, var202, var203)
			buff = var204
			var53 = var205
		end
	end
	if self.universe_user_favorite ~= nil and next(self.universe_user_favorite) ~= nil then
		for i, v in self.universe_user_favorite do
			local var206, var207 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var206, var207 = protoModule.writeString(var206, var207, i)
			local var208 = v:encode()
			var207, var209 = protoModule.writeTag(var206, var207, 2, protoModule.wireTypes.lengthDelimited)
			var207, var209 = protoModule.writeBuffer(var207, var209, var208, buffer.len(var208))
			local var210 = var207
			local var211 = var209
			local var212, var213 = protoModule.writeTag(buff, var53, 20, protoModule.wireTypes.lengthDelimited)
			var212, var213 = protoModule.writeBuffer(var212, var213, var210, var211)
			buff = var212
			var53 = var213
		end
	end
	if self.playability ~= nil and next(self.playability) ~= nil then
		for i, v in self.playability do
			local var214, var215 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var214, var215 = protoModule.writeString(var214, var215, i)
			local var216 = v:encode()
			var215, var217 = protoModule.writeTag(var214, var215, 2, protoModule.wireTypes.lengthDelimited)
			var215, var217 = protoModule.writeBuffer(var215, var217, var216, buffer.len(var216))
			local var218 = var215
			local var219 = var217
			local var220, var221 = protoModule.writeTag(buff, var53, 21, protoModule.wireTypes.lengthDelimited)
			var220, var221 = protoModule.writeBuffer(var220, var221, var218, var219)
			buff = var220
			var53 = var221
		end
	end
	if self.universe_user_follow_limit ~= nil and next(self.universe_user_follow_limit) ~= nil then
		for i, v in self.universe_user_follow_limit do
			local var222, var223 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var222, var223 = protoModule.writeString(var222, var223, i)
			local var224 = v:encode()
			var223, var225 = protoModule.writeTag(var222, var223, 2, protoModule.wireTypes.lengthDelimited)
			var223, var225 = protoModule.writeBuffer(var223, var225, var224, buffer.len(var224))
			local var226 = var223
			local var227 = var225
			local var228, var229 = protoModule.writeTag(buff, var53, 22, protoModule.wireTypes.lengthDelimited)
			var228, var229 = protoModule.writeBuffer(var228, var229, var226, var227)
			buff = var228
			var53 = var229
		end
	end
	if self.universe_user_vote_feedback_metadata ~= nil and next(self.universe_user_vote_feedback_metadata) ~= nil then
		for i, v in self.universe_user_vote_feedback_metadata do
			local var230, var231 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var230, var231 = protoModule.writeString(var230, var231, i)
			local var232 = v:encode()
			var231, var233 = protoModule.writeTag(var230, var231, 2, protoModule.wireTypes.lengthDelimited)
			var231, var233 = protoModule.writeBuffer(var231, var233, var232, buffer.len(var232))
			local var234 = var231
			local var235 = var233
			local var236, var237 = protoModule.writeTag(buff, var53, 23, protoModule.wireTypes.lengthDelimited)
			var236, var237 = protoModule.writeBuffer(var236, var237, var234, var235)
			buff = var236
			var53 = var237
		end
	end
	if self.moment ~= nil and next(self.moment) ~= nil then
		for i, v in self.moment do
			local var238, var239 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var238, var239 = protoModule.writeString(var238, var239, i)
			local var240 = v:encode()
			var239, var241 = protoModule.writeTag(var238, var239, 2, protoModule.wireTypes.lengthDelimited)
			var239, var241 = protoModule.writeBuffer(var239, var241, var240, buffer.len(var240))
			local var242 = var239
			local var243 = var241
			local var244, var245 = protoModule.writeTag(buff, var53, 24, protoModule.wireTypes.lengthDelimited)
			var244, var245 = protoModule.writeBuffer(var244, var245, var242, var243)
			buff = var244
			var53 = var245
		end
	end
	local buff_1 = buffer.create(var53)
	buffer.copy(buff_1, 0, buff, 0, var53)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 1284 ]]
	-- upvalues: t_1 (ref), protoModule (ref), t (ref), badgeDataModule (ref), universeDataModule (ref), creatorDataModule (ref), eventDataModule (ref), songDataModule (ref), gamePassDataModule (ref), mediaAssetDataModule (ref), socialLinkDataModule (ref), gameDeveloperProductDataModule (ref), gameSubscriptionDataModule (ref), marketplaceCatalogCategoryDataModule (ref), marketplaceAssetDataModule (ref), marketplaceBundleDataModule (ref), marketplaceLookDataModule (ref), catalogSortDataModule (ref), ageRecommendationDataModule (ref), universeUserFollowDataModule (ref), universeUserVoteDataModule (ref), userProfileDataModule (ref), universeUserFavoriteDataModule (ref), playabilityDataModule (ref), universeUserFollowLimitDataModule (ref), universeUserVoteFeedbackMetadataDataModule (ref), momentDataModule (ref)
	local var247 = t_1.new()
	local var248 = 0
	while var248 < buffer.len(p1) do
		local _ = nil
		local var249 = nil
		local var250, var251, var252 = protoModule.readTag(p1, var248)
		local var253 = var250
		var249 = var251
		var248 = var252
		
		if var249 == protoModule.wireTypes.varint then
			local _ = nil
			local var254, var255 = protoModule.readVarInt(p1, var248)
			local _ = var254
			var248 = var255
			continue
		end
		if var249 == protoModule.wireTypes.lengthDelimited then
			if var253 == 1 then
				local _ = nil
				local var256, var257 = protoModule.readBuffer(p1, var248)
				var248 = var257
				var256 = t.HydrationContent_BadgeEntry.decode(var256)
				var247.badge[var256.key or ""] = var256.value or badgeDataModule.BadgeData.new()
			elseif var253 == 2 then
				local _ = nil
				local var258, var259 = protoModule.readBuffer(p1, var248)
				var248 = var259
				var258 = t.HydrationContent_UniverseEntry.decode(var258)
				var247.universe[var258.key or ""] = var258.value or universeDataModule.UniverseData.new()
			elseif var253 == 3 then
				local _ = nil
				local var260, var261 = protoModule.readBuffer(p1, var248)
				var248 = var261
				var260 = t.HydrationContent_CreatorEntry.decode(var260)
				var247.creator[var260.key or ""] = var260.value or creatorDataModule.CreatorData.new()
			elseif var253 == 4 then
				local _ = nil
				local var262, var263 = protoModule.readBuffer(p1, var248)
				var248 = var263
				var262 = t.HydrationContent_EventEntry.decode(var262)
				var247.event[var262.key or ""] = var262.value or eventDataModule.EventData.new()
			elseif var253 == 5 then
				local _ = nil
				local var264, var265 = protoModule.readBuffer(p1, var248)
				var248 = var265
				var264 = t.HydrationContent_SongEntry.decode(var264)
				var247.song[var264.key or ""] = var264.value or songDataModule.SongData.new()
			elseif var253 == 6 then
				local _ = nil
				local var266, var267 = protoModule.readBuffer(p1, var248)
				var248 = var267
				var266 = t.HydrationContent_GamePassEntry.decode(var266)
				var247.game_pass[var266.key or ""] = var266.value or gamePassDataModule.GamePassData.new()
			elseif var253 == 7 then
				local _ = nil
				local var268, var269 = protoModule.readBuffer(p1, var248)
				var248 = var269
				var268 = t.HydrationContent_MediaAssetEntry.decode(var268)
				var247.media_asset[var268.key or ""] = var268.value or mediaAssetDataModule.MediaAssetData.new()
			elseif var253 == 8 then
				local _ = nil
				local var270, var271 = protoModule.readBuffer(p1, var248)
				var248 = var271
				var270 = t.HydrationContent_SocialLinkEntry.decode(var270)
				var247.social_link[var270.key or ""] = var270.value or socialLinkDataModule.SocialLinkData.new()
			elseif var253 == 9 then
				local _ = nil
				local var272, var273 = protoModule.readBuffer(p1, var248)
				var248 = var273
				var272 = t.HydrationContent_GameDeveloperProductEntry.decode(var272)
				var247.game_developer_product[var272.key or ""] = var272.value or gameDeveloperProductDataModule.GameDeveloperProductData.new()
			elseif var253 == 10 then
				local _ = nil
				local var274, var275 = protoModule.readBuffer(p1, var248)
				var248 = var275
				var274 = t.HydrationContent_GameSubscriptionEntry.decode(var274)
				var247.game_subscription[var274.key or ""] = var274.value or gameSubscriptionDataModule.GameSubscriptionData.new()
			elseif var253 == 11 then
				local _ = nil
				local var276, var277 = protoModule.readBuffer(p1, var248)
				var248 = var277
				var276 = t.HydrationContent_MarketplaceCatalogCategoryEntry.decode(var276)
				var247.marketplace_catalog_category[var276.key or ""] = var276.value or marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.new()
			elseif var253 == 12 then
				local _ = nil
				local var278, var279 = protoModule.readBuffer(p1, var248)
				var248 = var279
				var278 = t.HydrationContent_MarketplaceAssetEntry.decode(var278)
				var247.marketplace_asset[var278.key or ""] = var278.value or marketplaceAssetDataModule.MarketplaceAssetData.new()
			elseif var253 == 13 then
				local _ = nil
				local var280, var281 = protoModule.readBuffer(p1, var248)
				var248 = var281
				var280 = t.HydrationContent_MarketplaceBundleEntry.decode(var280)
				var247.marketplace_bundle[var280.key or ""] = var280.value or marketplaceBundleDataModule.MarketplaceBundleData.new()
			elseif var253 == 14 then
				local _ = nil
				local var282, var283 = protoModule.readBuffer(p1, var248)
				var248 = var283
				var282 = t.HydrationContent_MarketplaceLookEntry.decode(var282)
				var247.marketplace_look[var282.key or ""] = var282.value or marketplaceLookDataModule.MarketplaceLookData.new()
			elseif var253 == 15 then
				local _ = nil
				local var284, var285 = protoModule.readBuffer(p1, var248)
				var248 = var285
				var284 = t.HydrationContent_CatalogSortEntry.decode(var284)
				var247.catalog_sort[var284.key or ""] = var284.value or catalogSortDataModule.CatalogSortData.new()
			elseif var253 == 16 then
				local _ = nil
				local var286, var287 = protoModule.readBuffer(p1, var248)
				var248 = var287
				var286 = t.HydrationContent_AgeRecommendationEntry.decode(var286)
				var247.age_recommendation[var286.key or ""] = var286.value or ageRecommendationDataModule.AgeRecommendationData.new()
			elseif var253 == 17 then
				local _ = nil
				local var288, var289 = protoModule.readBuffer(p1, var248)
				var248 = var289
				var288 = t.HydrationContent_UniverseUserFollowEntry.decode(var288)
				var247.universe_user_follow[var288.key or ""] = var288.value or universeUserFollowDataModule.UniverseUserFollowData.new()
			elseif var253 == 18 then
				local _ = nil
				local var290, var291 = protoModule.readBuffer(p1, var248)
				var248 = var291
				var290 = t.HydrationContent_UniverseUserVoteEntry.decode(var290)
				var247.universe_user_vote[var290.key or ""] = var290.value or universeUserVoteDataModule.UniverseUserVoteData.new()
			elseif var253 == 19 then
				local _ = nil
				local var292, var293 = protoModule.readBuffer(p1, var248)
				var248 = var293
				var292 = t.HydrationContent_UserProfileEntry.decode(var292)
				var247.user_profile[var292.key or ""] = var292.value or userProfileDataModule.UserProfileData.new()
			elseif var253 == 20 then
				local _ = nil
				local var294, var295 = protoModule.readBuffer(p1, var248)
				var248 = var295
				var294 = t.HydrationContent_UniverseUserFavoriteEntry.decode(var294)
				var247.universe_user_favorite[var294.key or ""] = var294.value or universeUserFavoriteDataModule.UniverseUserFavoriteData.new()
			elseif var253 == 21 then
				local _ = nil
				local var296, var297 = protoModule.readBuffer(p1, var248)
				var248 = var297
				var296 = t.HydrationContent_PlayabilityEntry.decode(var296)
				var247.playability[var296.key or ""] = var296.value or playabilityDataModule.PlayabilityData.new()
			elseif var253 == 22 then
				local _ = nil
				local var298, var299 = protoModule.readBuffer(p1, var248)
				var248 = var299
				var298 = t.HydrationContent_UniverseUserFollowLimitEntry.decode(var298)
				var247.universe_user_follow_limit[var298.key or ""] = var298.value or universeUserFollowLimitDataModule.UniverseUserFollowLimitData.new()
			elseif var253 == 23 then
				local _ = nil
				local var300, var301 = protoModule.readBuffer(p1, var248)
				var248 = var301
				var300 = t.HydrationContent_UniverseUserVoteFeedbackMetadataEntry.decode(var300)
				var247.universe_user_vote_feedback_metadata[var300.key or ""] = var300.value or universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.new()
			elseif var253 == 24 then
				local _ = nil
				local var302, var303 = protoModule.readBuffer(p1, var248)
				var248 = var303
				var302 = t.HydrationContent_MomentEntry.decode(var302)
				var247.moment[var302.key or ""] = var302.value or momentDataModule.MomentData.new()
			else
				local _ = nil
				local var304, var305 = protoModule.readVarInt(p1, var248)
				var248 = var305 + var304
			end
		elseif var249 == protoModule.wireTypes.i32 then
			local _ = nil
			local var306, var307 = protoModule.readFixed32(p1, var248)
			local _ = var306
			var248 = var307
		elseif var249 == protoModule.wireTypes.i64 then
			local _ = nil
			local var308, var309 = protoModule.readFixed64(p1, var248)
			local _ = var308
			var248 = var309
		else
			error("Unsupported wire type: " .. var249)
		end
	end
	return var247
end

function t_1:jsonEncode() --[[ line: 1623 ]]
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
	return t
end

function t_1:jsonDecode() --[[ line: 1824 ]]
	-- upvalues: t_1 (ref), badgeDataModule (ref), universeDataModule (ref), creatorDataModule (ref), eventDataModule (ref), songDataModule (ref), gamePassDataModule (ref), mediaAssetDataModule (ref), socialLinkDataModule (ref), gameDeveloperProductDataModule (ref), gameSubscriptionDataModule (ref), marketplaceCatalogCategoryDataModule (ref), marketplaceAssetDataModule (ref), marketplaceBundleDataModule (ref), marketplaceLookDataModule (ref), catalogSortDataModule (ref), ageRecommendationDataModule (ref), universeUserFollowDataModule (ref), universeUserVoteDataModule (ref), userProfileDataModule (ref), universeUserFavoriteDataModule (ref), playabilityDataModule (ref), universeUserFollowLimitDataModule (ref), universeUserVoteFeedbackMetadataDataModule (ref), momentDataModule (ref)
	local var335 = t_1.new()
	
	if self.badge ~= nil then
		local t = {}
		
		for i, v in self.badge do
			t[i] = badgeDataModule.BadgeData.jsonDecode(v)
		end
		var335.badge = t
	end
	if self.universe ~= nil then
		local t = {}
		
		for i, v in self.universe do
			t[i] = universeDataModule.UniverseData.jsonDecode(v)
		end
		var335.universe = t
	end
	if self.creator ~= nil then
		local t = {}
		
		for i, v in self.creator do
			t[i] = creatorDataModule.CreatorData.jsonDecode(v)
		end
		var335.creator = t
	end
	if self.event ~= nil then
		local t = {}
		
		for i, v in self.event do
			t[i] = eventDataModule.EventData.jsonDecode(v)
		end
		var335.event = t
	end
	if self.song ~= nil then
		local t = {}
		
		for i, v in self.song do
			t[i] = songDataModule.SongData.jsonDecode(v)
		end
		var335.song = t
	end
	if self.game_pass ~= nil then
		local t = {}
		
		for i, v in self.game_pass do
			t[i] = gamePassDataModule.GamePassData.jsonDecode(v)
		end
		var335.game_pass = t
	end
	if self.gamePass ~= nil then
		local t = {}
		
		for i, v in self.gamePass do
			t[i] = gamePassDataModule.GamePassData.jsonDecode(v)
		end
		var335.game_pass = t
	end
	if self.media_asset ~= nil then
		local t = {}
		
		for i, v in self.media_asset do
			t[i] = mediaAssetDataModule.MediaAssetData.jsonDecode(v)
		end
		var335.media_asset = t
	end
	if self.mediaAsset ~= nil then
		local t = {}
		
		for i, v in self.mediaAsset do
			t[i] = mediaAssetDataModule.MediaAssetData.jsonDecode(v)
		end
		var335.media_asset = t
	end
	if self.social_link ~= nil then
		local t = {}
		
		for i, v in self.social_link do
			t[i] = socialLinkDataModule.SocialLinkData.jsonDecode(v)
		end
		var335.social_link = t
	end
	if self.socialLink ~= nil then
		local t = {}
		
		for i, v in self.socialLink do
			t[i] = socialLinkDataModule.SocialLinkData.jsonDecode(v)
		end
		var335.social_link = t
	end
	if self.game_developer_product ~= nil then
		local t = {}
		
		for i, v in self.game_developer_product do
			t[i] = gameDeveloperProductDataModule.GameDeveloperProductData.jsonDecode(v)
		end
		var335.game_developer_product = t
	end
	if self.gameDeveloperProduct ~= nil then
		local t = {}
		
		for i, v in self.gameDeveloperProduct do
			t[i] = gameDeveloperProductDataModule.GameDeveloperProductData.jsonDecode(v)
		end
		var335.game_developer_product = t
	end
	if self.game_subscription ~= nil then
		local t = {}
		
		for i, v in self.game_subscription do
			t[i] = gameSubscriptionDataModule.GameSubscriptionData.jsonDecode(v)
		end
		var335.game_subscription = t
	end
	if self.gameSubscription ~= nil then
		local t = {}
		
		for i, v in self.gameSubscription do
			t[i] = gameSubscriptionDataModule.GameSubscriptionData.jsonDecode(v)
		end
		var335.game_subscription = t
	end
	if self.marketplace_catalog_category ~= nil then
		local t = {}
		
		for i, v in self.marketplace_catalog_category do
			t[i] = marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.jsonDecode(v)
		end
		var335.marketplace_catalog_category = t
	end
	if self.marketplaceCatalogCategory ~= nil then
		local t = {}
		
		for i, v in self.marketplaceCatalogCategory do
			t[i] = marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.jsonDecode(v)
		end
		var335.marketplace_catalog_category = t
	end
	if self.marketplace_asset ~= nil then
		local t = {}
		
		for i, v in self.marketplace_asset do
			t[i] = marketplaceAssetDataModule.MarketplaceAssetData.jsonDecode(v)
		end
		var335.marketplace_asset = t
	end
	if self.marketplaceAsset ~= nil then
		local t = {}
		
		for i, v in self.marketplaceAsset do
			t[i] = marketplaceAssetDataModule.MarketplaceAssetData.jsonDecode(v)
		end
		var335.marketplace_asset = t
	end
	if self.marketplace_bundle ~= nil then
		local t = {}
		
		for i, v in self.marketplace_bundle do
			t[i] = marketplaceBundleDataModule.MarketplaceBundleData.jsonDecode(v)
		end
		var335.marketplace_bundle = t
	end
	if self.marketplaceBundle ~= nil then
		local t = {}
		
		for i, v in self.marketplaceBundle do
			t[i] = marketplaceBundleDataModule.MarketplaceBundleData.jsonDecode(v)
		end
		var335.marketplace_bundle = t
	end
	if self.marketplace_look ~= nil then
		local t = {}
		
		for i, v in self.marketplace_look do
			t[i] = marketplaceLookDataModule.MarketplaceLookData.jsonDecode(v)
		end
		var335.marketplace_look = t
	end
	if self.marketplaceLook ~= nil then
		local t = {}
		
		for i, v in self.marketplaceLook do
			t[i] = marketplaceLookDataModule.MarketplaceLookData.jsonDecode(v)
		end
		var335.marketplace_look = t
	end
	if self.catalog_sort ~= nil then
		local t = {}
		
		for i, v in self.catalog_sort do
			t[i] = catalogSortDataModule.CatalogSortData.jsonDecode(v)
		end
		var335.catalog_sort = t
	end
	if self.catalogSort ~= nil then
		local t = {}
		
		for i, v in self.catalogSort do
			t[i] = catalogSortDataModule.CatalogSortData.jsonDecode(v)
		end
		var335.catalog_sort = t
	end
	if self.age_recommendation ~= nil then
		local t = {}
		
		for i, v in self.age_recommendation do
			t[i] = ageRecommendationDataModule.AgeRecommendationData.jsonDecode(v)
		end
		var335.age_recommendation = t
	end
	if self.ageRecommendation ~= nil then
		local t = {}
		
		for i, v in self.ageRecommendation do
			t[i] = ageRecommendationDataModule.AgeRecommendationData.jsonDecode(v)
		end
		var335.age_recommendation = t
	end
	if self.universe_user_follow ~= nil then
		local t = {}
		
		for i, v in self.universe_user_follow do
			t[i] = universeUserFollowDataModule.UniverseUserFollowData.jsonDecode(v)
		end
		var335.universe_user_follow = t
	end
	if self.universeUserFollow ~= nil then
		local t = {}
		
		for i, v in self.universeUserFollow do
			t[i] = universeUserFollowDataModule.UniverseUserFollowData.jsonDecode(v)
		end
		var335.universe_user_follow = t
	end
	if self.universe_user_vote ~= nil then
		local t = {}
		
		for i, v in self.universe_user_vote do
			t[i] = universeUserVoteDataModule.UniverseUserVoteData.jsonDecode(v)
		end
		var335.universe_user_vote = t
	end
	if self.universeUserVote ~= nil then
		local t = {}
		
		for i, v in self.universeUserVote do
			t[i] = universeUserVoteDataModule.UniverseUserVoteData.jsonDecode(v)
		end
		var335.universe_user_vote = t
	end
	if self.user_profile ~= nil then
		local t = {}
		
		for i, v in self.user_profile do
			t[i] = userProfileDataModule.UserProfileData.jsonDecode(v)
		end
		var335.user_profile = t
	end
	if self.userProfile ~= nil then
		local t = {}
		
		for i, v in self.userProfile do
			t[i] = userProfileDataModule.UserProfileData.jsonDecode(v)
		end
		var335.user_profile = t
	end
	if self.universe_user_favorite ~= nil then
		local t = {}
		
		for i, v in self.universe_user_favorite do
			t[i] = universeUserFavoriteDataModule.UniverseUserFavoriteData.jsonDecode(v)
		end
		var335.universe_user_favorite = t
	end
	if self.universeUserFavorite ~= nil then
		local t = {}
		
		for i, v in self.universeUserFavorite do
			t[i] = universeUserFavoriteDataModule.UniverseUserFavoriteData.jsonDecode(v)
		end
		var335.universe_user_favorite = t
	end
	if self.playability ~= nil then
		local t = {}
		
		for i, v in self.playability do
			t[i] = playabilityDataModule.PlayabilityData.jsonDecode(v)
		end
		var335.playability = t
	end
	if self.universe_user_follow_limit ~= nil then
		local t = {}
		
		for i, v in self.universe_user_follow_limit do
			t[i] = universeUserFollowLimitDataModule.UniverseUserFollowLimitData.jsonDecode(v)
		end
		var335.universe_user_follow_limit = t
	end
	if self.universeUserFollowLimit ~= nil then
		local t = {}
		
		for i, v in self.universeUserFollowLimit do
			t[i] = universeUserFollowLimitDataModule.UniverseUserFollowLimitData.jsonDecode(v)
		end
		var335.universe_user_follow_limit = t
	end
	if self.universe_user_vote_feedback_metadata ~= nil then
		local t = {}
		
		for i, v in self.universe_user_vote_feedback_metadata do
			t[i] = universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.jsonDecode(v)
		end
		var335.universe_user_vote_feedback_metadata = t
	end
	if self.universeUserVoteFeedbackMetadata ~= nil then
		local t = {}
		
		for i, v in self.universeUserVoteFeedbackMetadata do
			t[i] = universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.jsonDecode(v)
		end
		var335.universe_user_vote_feedback_metadata = t
	end
	if self.moment ~= nil then
		local t = {}
		
		for i, v in self.moment do
			t[i] = momentDataModule.MomentData.jsonDecode(v)
		end
		var335.moment = t
	end
	return var335
end

t_1.descriptor = {
	name = "HydrationContent",
	fullName = "roblox.apppageplatform.shared.v1beta1.HydrationContent"
}
t.HydrationContent = t_1
typeRegistryModule.default:register(t.HydrationContent)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 2318 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		key = if p2 == nil or p2.key == nil then "" else p2.key,
		value = if p2 == nil or p2.value == nil then nil else p2.value
	}, t_2)
end

function t_2:encode() --[[ line: 2327 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var378 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var379, var380 = protoModule.writeTag(buff, var378, 1, protoModule.wireTypes.lengthDelimited)
		var379, var380 = protoModule.writeString(var379, var380, self.key)
		buff = var379
		var378 = var380
	end
	if self.value ~= nil then
		local var381 = self.value:encode()
		local var382, var383 = protoModule.writeTag(buff, var378, 2, protoModule.wireTypes.lengthDelimited)
		var382, var383 = protoModule.writeBuffer(var382, var383, var381, buffer.len(var381))
		buff = var382
		var378 = var383
	end
	local buff_1 = buffer.create(var378)
	buffer.copy(buff_1, 0, buff, 0, var378)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 2347 ]]
	-- upvalues: t_2 (ref), protoModule (ref), badgeDataModule (ref)
	local var385 = t_2.new()
	local var386 = 0
	while var386 < buffer.len(p3) do
		local _ = nil
		local var387 = nil
		local var388, var389, var390 = protoModule.readTag(p3, var386)
		local var391 = var388
		var387 = var389
		var386 = var390
		
		if var387 == protoModule.wireTypes.varint then
			local _ = nil
			local var392, var393 = protoModule.readVarInt(p3, var386)
			local _ = var392
			var386 = var393
			continue
		end
		if var387 == protoModule.wireTypes.lengthDelimited then
			if var391 == 1 then
				local _ = nil
				local var394, var395 = protoModule.readBuffer(p3, var386)
				var386 = var395
				var385.key = buffer.tostring(var394)
			elseif var391 == 2 then
				local _ = nil
				local var396, var397 = protoModule.readBuffer(p3, var386)
				var386 = var397
				var385.value = badgeDataModule.BadgeData.decode(var396)
			else
				local _ = nil
				local var398, var399 = protoModule.readVarInt(p3, var386)
				var386 = var399 + var398
			end
		elseif var387 == protoModule.wireTypes.i32 then
			local _ = nil
			local var400, var401 = protoModule.readFixed32(p3, var386)
			local _ = var400
			var386 = var401
		elseif var387 == protoModule.wireTypes.i64 then
			local _ = nil
			local var402, var403 = protoModule.readFixed64(p3, var386)
			local _ = var402
			var386 = var403
		else
			error("Unsupported wire type: " .. var387)
		end
	end
	return var385
end

function t_2:jsonEncode() --[[ line: 2395 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_2:jsonDecode() --[[ line: 2409 ]]
	-- upvalues: t_2 (ref), badgeDataModule (ref)
	local var405 = t_2.new()
	
	if self.key ~= nil then
		var405.key = self.key
	end
	if self.value ~= nil then
		var405.value = badgeDataModule.BadgeData.jsonDecode(self.value)
	end
	return var405
end

t_2.descriptor = {
	name = "HydrationContent_BadgeEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeEntry"
}
t.HydrationContent_BadgeEntry = t_2
typeRegistryModule.default:register(t.HydrationContent_BadgeEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 2437 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		key = if p4 == nil or p4.key == nil then "" else p4.key,
		value = if p4 == nil or p4.value == nil then nil else p4.value
	}, t_3)
end

function t_3:encode() --[[ line: 2446 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var407 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var408, var409 = protoModule.writeTag(buff, var407, 1, protoModule.wireTypes.lengthDelimited)
		var408, var409 = protoModule.writeString(var408, var409, self.key)
		buff = var408
		var407 = var409
	end
	if self.value ~= nil then
		local var410 = self.value:encode()
		local var411, var412 = protoModule.writeTag(buff, var407, 2, protoModule.wireTypes.lengthDelimited)
		var411, var412 = protoModule.writeBuffer(var411, var412, var410, buffer.len(var410))
		buff = var411
		var407 = var412
	end
	local buff_1 = buffer.create(var407)
	buffer.copy(buff_1, 0, buff, 0, var407)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 2466 ]]
	-- upvalues: t_3 (ref), protoModule (ref), universeDataModule (ref)
	local var414 = t_3.new()
	local var415 = 0
	while var415 < buffer.len(p5) do
		local _ = nil
		local var416 = nil
		local var417, var418, var419 = protoModule.readTag(p5, var415)
		local var420 = var417
		var416 = var418
		var415 = var419
		
		if var416 == protoModule.wireTypes.varint then
			local _ = nil
			local var421, var422 = protoModule.readVarInt(p5, var415)
			local _ = var421
			var415 = var422
			continue
		end
		if var416 == protoModule.wireTypes.lengthDelimited then
			if var420 == 1 then
				local _ = nil
				local var423, var424 = protoModule.readBuffer(p5, var415)
				var415 = var424
				var414.key = buffer.tostring(var423)
			elseif var420 == 2 then
				local _ = nil
				local var425, var426 = protoModule.readBuffer(p5, var415)
				var415 = var426
				var414.value = universeDataModule.UniverseData.decode(var425)
			else
				local _ = nil
				local var427, var428 = protoModule.readVarInt(p5, var415)
				var415 = var428 + var427
			end
		elseif var416 == protoModule.wireTypes.i32 then
			local _ = nil
			local var429, var430 = protoModule.readFixed32(p5, var415)
			local _ = var429
			var415 = var430
		elseif var416 == protoModule.wireTypes.i64 then
			local _ = nil
			local var431, var432 = protoModule.readFixed64(p5, var415)
			local _ = var431
			var415 = var432
		else
			error("Unsupported wire type: " .. var416)
		end
	end
	return var414
end

function t_3:jsonEncode() --[[ line: 2514 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_3:jsonDecode() --[[ line: 2528 ]]
	-- upvalues: t_3 (ref), universeDataModule (ref)
	local var434 = t_3.new()
	
	if self.key ~= nil then
		var434.key = self.key
	end
	if self.value ~= nil then
		var434.value = universeDataModule.UniverseData.jsonDecode(self.value)
	end
	return var434
end

t_3.descriptor = {
	name = "HydrationContent_UniverseEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseEntry"
}
t.HydrationContent_UniverseEntry = t_3
typeRegistryModule.default:register(t.HydrationContent_UniverseEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 2556 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		key = if p6 == nil or p6.key == nil then "" else p6.key,
		value = if p6 == nil or p6.value == nil then nil else p6.value
	}, t_4)
end

function t_4:encode() --[[ line: 2565 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var436 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var437, var438 = protoModule.writeTag(buff, var436, 1, protoModule.wireTypes.lengthDelimited)
		var437, var438 = protoModule.writeString(var437, var438, self.key)
		buff = var437
		var436 = var438
	end
	if self.value ~= nil then
		local var439 = self.value:encode()
		local var440, var441 = protoModule.writeTag(buff, var436, 2, protoModule.wireTypes.lengthDelimited)
		var440, var441 = protoModule.writeBuffer(var440, var441, var439, buffer.len(var439))
		buff = var440
		var436 = var441
	end
	local buff_1 = buffer.create(var436)
	buffer.copy(buff_1, 0, buff, 0, var436)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 2585 ]]
	-- upvalues: t_4 (ref), protoModule (ref), creatorDataModule (ref)
	local var443 = t_4.new()
	local var444 = 0
	while var444 < buffer.len(p7) do
		local _ = nil
		local var445 = nil
		local var446, var447, var448 = protoModule.readTag(p7, var444)
		local var449 = var446
		var445 = var447
		var444 = var448
		
		if var445 == protoModule.wireTypes.varint then
			local _ = nil
			local var450, var451 = protoModule.readVarInt(p7, var444)
			local _ = var450
			var444 = var451
			continue
		end
		if var445 == protoModule.wireTypes.lengthDelimited then
			if var449 == 1 then
				local _ = nil
				local var452, var453 = protoModule.readBuffer(p7, var444)
				var444 = var453
				var443.key = buffer.tostring(var452)
			elseif var449 == 2 then
				local _ = nil
				local var454, var455 = protoModule.readBuffer(p7, var444)
				var444 = var455
				var443.value = creatorDataModule.CreatorData.decode(var454)
			else
				local _ = nil
				local var456, var457 = protoModule.readVarInt(p7, var444)
				var444 = var457 + var456
			end
		elseif var445 == protoModule.wireTypes.i32 then
			local _ = nil
			local var458, var459 = protoModule.readFixed32(p7, var444)
			local _ = var458
			var444 = var459
		elseif var445 == protoModule.wireTypes.i64 then
			local _ = nil
			local var460, var461 = protoModule.readFixed64(p7, var444)
			local _ = var460
			var444 = var461
		else
			error("Unsupported wire type: " .. var445)
		end
	end
	return var443
end

function t_4:jsonEncode() --[[ line: 2633 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_4:jsonDecode() --[[ line: 2647 ]]
	-- upvalues: t_4 (ref), creatorDataModule (ref)
	local var463 = t_4.new()
	
	if self.key ~= nil then
		var463.key = self.key
	end
	if self.value ~= nil then
		var463.value = creatorDataModule.CreatorData.jsonDecode(self.value)
	end
	return var463
end

t_4.descriptor = {
	name = "HydrationContent_CreatorEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.CreatorEntry"
}
t.HydrationContent_CreatorEntry = t_4
typeRegistryModule.default:register(t.HydrationContent_CreatorEntry)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8) --[[ line: 2675 ]]
	-- upvalues: t_5 (ref)
	return setmetatable({
		key = if p8 == nil or p8.key == nil then "" else p8.key,
		value = if p8 == nil or p8.value == nil then nil else p8.value
	}, t_5)
end

function t_5:encode() --[[ line: 2684 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var465 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var466, var467 = protoModule.writeTag(buff, var465, 1, protoModule.wireTypes.lengthDelimited)
		var466, var467 = protoModule.writeString(var466, var467, self.key)
		buff = var466
		var465 = var467
	end
	if self.value ~= nil then
		local var468 = self.value:encode()
		local var469, var470 = protoModule.writeTag(buff, var465, 2, protoModule.wireTypes.lengthDelimited)
		var469, var470 = protoModule.writeBuffer(var469, var470, var468, buffer.len(var468))
		buff = var469
		var465 = var470
	end
	local buff_1 = buffer.create(var465)
	buffer.copy(buff_1, 0, buff, 0, var465)
	
	return buff_1
end

function t_5.decode(p9) --[[ line: 2704 ]]
	-- upvalues: t_5 (ref), protoModule (ref), eventDataModule (ref)
	local var472 = t_5.new()
	local var473 = 0
	while var473 < buffer.len(p9) do
		local _ = nil
		local var474 = nil
		local var475, var476, var477 = protoModule.readTag(p9, var473)
		local var478 = var475
		var474 = var476
		var473 = var477
		
		if var474 == protoModule.wireTypes.varint then
			local _ = nil
			local var479, var480 = protoModule.readVarInt(p9, var473)
			local _ = var479
			var473 = var480
			continue
		end
		if var474 == protoModule.wireTypes.lengthDelimited then
			if var478 == 1 then
				local _ = nil
				local var481, var482 = protoModule.readBuffer(p9, var473)
				var473 = var482
				var472.key = buffer.tostring(var481)
			elseif var478 == 2 then
				local _ = nil
				local var483, var484 = protoModule.readBuffer(p9, var473)
				var473 = var484
				var472.value = eventDataModule.EventData.decode(var483)
			else
				local _ = nil
				local var485, var486 = protoModule.readVarInt(p9, var473)
				var473 = var486 + var485
			end
		elseif var474 == protoModule.wireTypes.i32 then
			local _ = nil
			local var487, var488 = protoModule.readFixed32(p9, var473)
			local _ = var487
			var473 = var488
		elseif var474 == protoModule.wireTypes.i64 then
			local _ = nil
			local var489, var490 = protoModule.readFixed64(p9, var473)
			local _ = var489
			var473 = var490
		else
			error("Unsupported wire type: " .. var474)
		end
	end
	return var472
end

function t_5:jsonEncode() --[[ line: 2752 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_5:jsonDecode() --[[ line: 2766 ]]
	-- upvalues: t_5 (ref), eventDataModule (ref)
	local var492 = t_5.new()
	
	if self.key ~= nil then
		var492.key = self.key
	end
	if self.value ~= nil then
		var492.value = eventDataModule.EventData.jsonDecode(self.value)
	end
	return var492
end

t_5.descriptor = {
	name = "HydrationContent_EventEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventEntry"
}
t.HydrationContent_EventEntry = t_5
typeRegistryModule.default:register(t.HydrationContent_EventEntry)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10) --[[ line: 2794 ]]
	-- upvalues: t_6 (ref)
	return setmetatable({
		key = if p10 == nil or p10.key == nil then "" else p10.key,
		value = if p10 == nil or p10.value == nil then nil else p10.value
	}, t_6)
end

function t_6:encode() --[[ line: 2803 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var494 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var495, var496 = protoModule.writeTag(buff, var494, 1, protoModule.wireTypes.lengthDelimited)
		var495, var496 = protoModule.writeString(var495, var496, self.key)
		buff = var495
		var494 = var496
	end
	if self.value ~= nil then
		local var497 = self.value:encode()
		local var498, var499 = protoModule.writeTag(buff, var494, 2, protoModule.wireTypes.lengthDelimited)
		var498, var499 = protoModule.writeBuffer(var498, var499, var497, buffer.len(var497))
		buff = var498
		var494 = var499
	end
	local buff_1 = buffer.create(var494)
	buffer.copy(buff_1, 0, buff, 0, var494)
	
	return buff_1
end

function t_6.decode(p11) --[[ line: 2823 ]]
	-- upvalues: t_6 (ref), protoModule (ref), songDataModule (ref)
	local var501 = t_6.new()
	local var502 = 0
	while var502 < buffer.len(p11) do
		local _ = nil
		local var503 = nil
		local var504, var505, var506 = protoModule.readTag(p11, var502)
		local var507 = var504
		var503 = var505
		var502 = var506
		
		if var503 == protoModule.wireTypes.varint then
			local _ = nil
			local var508, var509 = protoModule.readVarInt(p11, var502)
			local _ = var508
			var502 = var509
			continue
		end
		if var503 == protoModule.wireTypes.lengthDelimited then
			if var507 == 1 then
				local _ = nil
				local var510, var511 = protoModule.readBuffer(p11, var502)
				var502 = var511
				var501.key = buffer.tostring(var510)
			elseif var507 == 2 then
				local _ = nil
				local var512, var513 = protoModule.readBuffer(p11, var502)
				var502 = var513
				var501.value = songDataModule.SongData.decode(var512)
			else
				local _ = nil
				local var514, var515 = protoModule.readVarInt(p11, var502)
				var502 = var515 + var514
			end
		elseif var503 == protoModule.wireTypes.i32 then
			local _ = nil
			local var516, var517 = protoModule.readFixed32(p11, var502)
			local _ = var516
			var502 = var517
		elseif var503 == protoModule.wireTypes.i64 then
			local _ = nil
			local var518, var519 = protoModule.readFixed64(p11, var502)
			local _ = var518
			var502 = var519
		else
			error("Unsupported wire type: " .. var503)
		end
	end
	return var501
end

function t_6:jsonEncode() --[[ line: 2871 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_6:jsonDecode() --[[ line: 2885 ]]
	-- upvalues: t_6 (ref), songDataModule (ref)
	local var521 = t_6.new()
	
	if self.key ~= nil then
		var521.key = self.key
	end
	if self.value ~= nil then
		var521.value = songDataModule.SongData.jsonDecode(self.value)
	end
	return var521
end

t_6.descriptor = {
	name = "HydrationContent_SongEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongEntry"
}
t.HydrationContent_SongEntry = t_6
typeRegistryModule.default:register(t.HydrationContent_SongEntry)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p12) --[[ line: 2913 ]]
	-- upvalues: t_7 (ref)
	return setmetatable({
		key = if p12 == nil or p12.key == nil then "" else p12.key,
		value = if p12 == nil or p12.value == nil then nil else p12.value
	}, t_7)
end

function t_7:encode() --[[ line: 2922 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var523 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var524, var525 = protoModule.writeTag(buff, var523, 1, protoModule.wireTypes.lengthDelimited)
		var524, var525 = protoModule.writeString(var524, var525, self.key)
		buff = var524
		var523 = var525
	end
	if self.value ~= nil then
		local var526 = self.value:encode()
		local var527, var528 = protoModule.writeTag(buff, var523, 2, protoModule.wireTypes.lengthDelimited)
		var527, var528 = protoModule.writeBuffer(var527, var528, var526, buffer.len(var526))
		buff = var527
		var523 = var528
	end
	local buff_1 = buffer.create(var523)
	buffer.copy(buff_1, 0, buff, 0, var523)
	
	return buff_1
end

function t_7.decode(p13) --[[ line: 2942 ]]
	-- upvalues: t_7 (ref), protoModule (ref), gamePassDataModule (ref)
	local var530 = t_7.new()
	local var531 = 0
	while var531 < buffer.len(p13) do
		local _ = nil
		local var532 = nil
		local var533, var534, var535 = protoModule.readTag(p13, var531)
		local var536 = var533
		var532 = var534
		var531 = var535
		
		if var532 == protoModule.wireTypes.varint then
			local _ = nil
			local var537, var538 = protoModule.readVarInt(p13, var531)
			local _ = var537
			var531 = var538
			continue
		end
		if var532 == protoModule.wireTypes.lengthDelimited then
			if var536 == 1 then
				local _ = nil
				local var539, var540 = protoModule.readBuffer(p13, var531)
				var531 = var540
				var530.key = buffer.tostring(var539)
			elseif var536 == 2 then
				local _ = nil
				local var541, var542 = protoModule.readBuffer(p13, var531)
				var531 = var542
				var530.value = gamePassDataModule.GamePassData.decode(var541)
			else
				local _ = nil
				local var543, var544 = protoModule.readVarInt(p13, var531)
				var531 = var544 + var543
			end
		elseif var532 == protoModule.wireTypes.i32 then
			local _ = nil
			local var545, var546 = protoModule.readFixed32(p13, var531)
			local _ = var545
			var531 = var546
		elseif var532 == protoModule.wireTypes.i64 then
			local _ = nil
			local var547, var548 = protoModule.readFixed64(p13, var531)
			local _ = var547
			var531 = var548
		else
			error("Unsupported wire type: " .. var532)
		end
	end
	return var530
end

function t_7:jsonEncode() --[[ line: 2990 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_7:jsonDecode() --[[ line: 3004 ]]
	-- upvalues: t_7 (ref), gamePassDataModule (ref)
	local var550 = t_7.new()
	
	if self.key ~= nil then
		var550.key = self.key
	end
	if self.value ~= nil then
		var550.value = gamePassDataModule.GamePassData.jsonDecode(self.value)
	end
	return var550
end

t_7.descriptor = {
	name = "HydrationContent_GamePassEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassEntry"
}
t.HydrationContent_GamePassEntry = t_7
typeRegistryModule.default:register(t.HydrationContent_GamePassEntry)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p14) --[[ line: 3032 ]]
	-- upvalues: t_8 (ref)
	return setmetatable({
		key = if p14 == nil or p14.key == nil then "" else p14.key,
		value = if p14 == nil or p14.value == nil then nil else p14.value
	}, t_8)
end

function t_8:encode() --[[ line: 3041 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var552 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var553, var554 = protoModule.writeTag(buff, var552, 1, protoModule.wireTypes.lengthDelimited)
		var553, var554 = protoModule.writeString(var553, var554, self.key)
		buff = var553
		var552 = var554
	end
	if self.value ~= nil then
		local var555 = self.value:encode()
		local var556, var557 = protoModule.writeTag(buff, var552, 2, protoModule.wireTypes.lengthDelimited)
		var556, var557 = protoModule.writeBuffer(var556, var557, var555, buffer.len(var555))
		buff = var556
		var552 = var557
	end
	local buff_1 = buffer.create(var552)
	buffer.copy(buff_1, 0, buff, 0, var552)
	
	return buff_1
end

function t_8.decode(p15) --[[ line: 3061 ]]
	-- upvalues: t_8 (ref), protoModule (ref), mediaAssetDataModule (ref)
	local var559 = t_8.new()
	local var560 = 0
	while var560 < buffer.len(p15) do
		local _ = nil
		local var561 = nil
		local var562, var563, var564 = protoModule.readTag(p15, var560)
		local var565 = var562
		var561 = var563
		var560 = var564
		
		if var561 == protoModule.wireTypes.varint then
			local _ = nil
			local var566, var567 = protoModule.readVarInt(p15, var560)
			local _ = var566
			var560 = var567
			continue
		end
		if var561 == protoModule.wireTypes.lengthDelimited then
			if var565 == 1 then
				local _ = nil
				local var568, var569 = protoModule.readBuffer(p15, var560)
				var560 = var569
				var559.key = buffer.tostring(var568)
			elseif var565 == 2 then
				local _ = nil
				local var570, var571 = protoModule.readBuffer(p15, var560)
				var560 = var571
				var559.value = mediaAssetDataModule.MediaAssetData.decode(var570)
			else
				local _ = nil
				local var572, var573 = protoModule.readVarInt(p15, var560)
				var560 = var573 + var572
			end
		elseif var561 == protoModule.wireTypes.i32 then
			local _ = nil
			local var574, var575 = protoModule.readFixed32(p15, var560)
			local _ = var574
			var560 = var575
		elseif var561 == protoModule.wireTypes.i64 then
			local _ = nil
			local var576, var577 = protoModule.readFixed64(p15, var560)
			local _ = var576
			var560 = var577
		else
			error("Unsupported wire type: " .. var561)
		end
	end
	return var559
end

function t_8:jsonEncode() --[[ line: 3109 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_8:jsonDecode() --[[ line: 3123 ]]
	-- upvalues: t_8 (ref), mediaAssetDataModule (ref)
	local var579 = t_8.new()
	
	if self.key ~= nil then
		var579.key = self.key
	end
	if self.value ~= nil then
		var579.value = mediaAssetDataModule.MediaAssetData.jsonDecode(self.value)
	end
	return var579
end

t_8.descriptor = {
	name = "HydrationContent_MediaAssetEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MediaAssetEntry"
}
t.HydrationContent_MediaAssetEntry = t_8
typeRegistryModule.default:register(t.HydrationContent_MediaAssetEntry)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p16) --[[ line: 3153 ]]
	-- upvalues: t_9 (ref)
	return setmetatable({
		key = if p16 == nil or p16.key == nil then "" else p16.key,
		value = if p16 == nil or p16.value == nil then nil else p16.value
	}, t_9)
end

function t_9:encode() --[[ line: 3162 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var581 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var582, var583 = protoModule.writeTag(buff, var581, 1, protoModule.wireTypes.lengthDelimited)
		var582, var583 = protoModule.writeString(var582, var583, self.key)
		buff = var582
		var581 = var583
	end
	if self.value ~= nil then
		local var584 = self.value:encode()
		local var585, var586 = protoModule.writeTag(buff, var581, 2, protoModule.wireTypes.lengthDelimited)
		var585, var586 = protoModule.writeBuffer(var585, var586, var584, buffer.len(var584))
		buff = var585
		var581 = var586
	end
	local buff_1 = buffer.create(var581)
	buffer.copy(buff_1, 0, buff, 0, var581)
	
	return buff_1
end

function t_9.decode(p17) --[[ line: 3182 ]]
	-- upvalues: t_9 (ref), protoModule (ref), socialLinkDataModule (ref)
	local var588 = t_9.new()
	local var589 = 0
	while var589 < buffer.len(p17) do
		local _ = nil
		local var590 = nil
		local var591, var592, var593 = protoModule.readTag(p17, var589)
		local var594 = var591
		var590 = var592
		var589 = var593
		
		if var590 == protoModule.wireTypes.varint then
			local _ = nil
			local var595, var596 = protoModule.readVarInt(p17, var589)
			local _ = var595
			var589 = var596
			continue
		end
		if var590 == protoModule.wireTypes.lengthDelimited then
			if var594 == 1 then
				local _ = nil
				local var597, var598 = protoModule.readBuffer(p17, var589)
				var589 = var598
				var588.key = buffer.tostring(var597)
			elseif var594 == 2 then
				local _ = nil
				local var599, var600 = protoModule.readBuffer(p17, var589)
				var589 = var600
				var588.value = socialLinkDataModule.SocialLinkData.decode(var599)
			else
				local _ = nil
				local var601, var602 = protoModule.readVarInt(p17, var589)
				var589 = var602 + var601
			end
		elseif var590 == protoModule.wireTypes.i32 then
			local _ = nil
			local var603, var604 = protoModule.readFixed32(p17, var589)
			local _ = var603
			var589 = var604
		elseif var590 == protoModule.wireTypes.i64 then
			local _ = nil
			local var605, var606 = protoModule.readFixed64(p17, var589)
			local _ = var605
			var589 = var606
		else
			error("Unsupported wire type: " .. var590)
		end
	end
	return var588
end

function t_9:jsonEncode() --[[ line: 3230 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_9:jsonDecode() --[[ line: 3244 ]]
	-- upvalues: t_9 (ref), socialLinkDataModule (ref)
	local var608 = t_9.new()
	
	if self.key ~= nil then
		var608.key = self.key
	end
	if self.value ~= nil then
		var608.value = socialLinkDataModule.SocialLinkData.jsonDecode(self.value)
	end
	return var608
end

t_9.descriptor = {
	name = "HydrationContent_SocialLinkEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkEntry"
}
t.HydrationContent_SocialLinkEntry = t_9
typeRegistryModule.default:register(t.HydrationContent_SocialLinkEntry)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p18) --[[ line: 3274 ]]
	-- upvalues: t_10 (ref)
	return setmetatable({
		key = if p18 == nil or p18.key == nil then "" else p18.key,
		value = if p18 == nil or p18.value == nil then nil else p18.value
	}, t_10)
end

function t_10:encode() --[[ line: 3283 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var610 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var611, var612 = protoModule.writeTag(buff, var610, 1, protoModule.wireTypes.lengthDelimited)
		var611, var612 = protoModule.writeString(var611, var612, self.key)
		buff = var611
		var610 = var612
	end
	if self.value ~= nil then
		local var613 = self.value:encode()
		local var614, var615 = protoModule.writeTag(buff, var610, 2, protoModule.wireTypes.lengthDelimited)
		var614, var615 = protoModule.writeBuffer(var614, var615, var613, buffer.len(var613))
		buff = var614
		var610 = var615
	end
	local buff_1 = buffer.create(var610)
	buffer.copy(buff_1, 0, buff, 0, var610)
	
	return buff_1
end

function t_10.decode(p19) --[[ line: 3305 ]]
	-- upvalues: t_10 (ref), protoModule (ref), gameDeveloperProductDataModule (ref)
	local var617 = t_10.new()
	local var618 = 0
	while var618 < buffer.len(p19) do
		local _ = nil
		local var619 = nil
		local var620, var621, var622 = protoModule.readTag(p19, var618)
		local var623 = var620
		var619 = var621
		var618 = var622
		
		if var619 == protoModule.wireTypes.varint then
			local _ = nil
			local var624, var625 = protoModule.readVarInt(p19, var618)
			local _ = var624
			var618 = var625
			continue
		end
		if var619 == protoModule.wireTypes.lengthDelimited then
			if var623 == 1 then
				local _ = nil
				local var626, var627 = protoModule.readBuffer(p19, var618)
				var618 = var627
				var617.key = buffer.tostring(var626)
			elseif var623 == 2 then
				local _ = nil
				local var628, var629 = protoModule.readBuffer(p19, var618)
				var618 = var629
				var617.value = gameDeveloperProductDataModule.GameDeveloperProductData.decode(var628)
			else
				local _ = nil
				local var630, var631 = protoModule.readVarInt(p19, var618)
				var618 = var631 + var630
			end
		elseif var619 == protoModule.wireTypes.i32 then
			local _ = nil
			local var632, var633 = protoModule.readFixed32(p19, var618)
			local _ = var632
			var618 = var633
		elseif var619 == protoModule.wireTypes.i64 then
			local _ = nil
			local var634, var635 = protoModule.readFixed64(p19, var618)
			local _ = var634
			var618 = var635
		else
			error("Unsupported wire type: " .. var619)
		end
	end
	return var617
end

function t_10:jsonEncode() --[[ line: 3358 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_10:jsonDecode() --[[ line: 3374 ]]
	-- upvalues: t_10 (ref), gameDeveloperProductDataModule (ref)
	local var637 = t_10.new()
	
	if self.key ~= nil then
		var637.key = self.key
	end
	if self.value ~= nil then
		var637.value = gameDeveloperProductDataModule.GameDeveloperProductData.jsonDecode(self.value)
	end
	return var637
end

t_10.descriptor = {
	name = "HydrationContent_GameDeveloperProductEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameDeveloperProductEntry"
}
t.HydrationContent_GameDeveloperProductEntry = t_10
typeRegistryModule.default:register(t.HydrationContent_GameDeveloperProductEntry)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p20) --[[ line: 3407 ]]
	-- upvalues: t_11 (ref)
	return setmetatable({
		key = if p20 == nil or p20.key == nil then "" else p20.key,
		value = if p20 == nil or p20.value == nil then nil else p20.value
	}, t_11)
end

function t_11:encode() --[[ line: 3416 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var639 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var640, var641 = protoModule.writeTag(buff, var639, 1, protoModule.wireTypes.lengthDelimited)
		var640, var641 = protoModule.writeString(var640, var641, self.key)
		buff = var640
		var639 = var641
	end
	if self.value ~= nil then
		local var642 = self.value:encode()
		local var643, var644 = protoModule.writeTag(buff, var639, 2, protoModule.wireTypes.lengthDelimited)
		var643, var644 = protoModule.writeBuffer(var643, var644, var642, buffer.len(var642))
		buff = var643
		var639 = var644
	end
	local buff_1 = buffer.create(var639)
	buffer.copy(buff_1, 0, buff, 0, var639)
	
	return buff_1
end

function t_11.decode(p21) --[[ line: 3436 ]]
	-- upvalues: t_11 (ref), protoModule (ref), gameSubscriptionDataModule (ref)
	local var646 = t_11.new()
	local var647 = 0
	while var647 < buffer.len(p21) do
		local _ = nil
		local var648 = nil
		local var649, var650, var651 = protoModule.readTag(p21, var647)
		local var652 = var649
		var648 = var650
		var647 = var651
		
		if var648 == protoModule.wireTypes.varint then
			local _ = nil
			local var653, var654 = protoModule.readVarInt(p21, var647)
			local _ = var653
			var647 = var654
			continue
		end
		if var648 == protoModule.wireTypes.lengthDelimited then
			if var652 == 1 then
				local _ = nil
				local var655, var656 = protoModule.readBuffer(p21, var647)
				var647 = var656
				var646.key = buffer.tostring(var655)
			elseif var652 == 2 then
				local _ = nil
				local var657, var658 = protoModule.readBuffer(p21, var647)
				var647 = var658
				var646.value = gameSubscriptionDataModule.GameSubscriptionData.decode(var657)
			else
				local _ = nil
				local var659, var660 = protoModule.readVarInt(p21, var647)
				var647 = var660 + var659
			end
		elseif var648 == protoModule.wireTypes.i32 then
			local _ = nil
			local var661, var662 = protoModule.readFixed32(p21, var647)
			local _ = var661
			var647 = var662
		elseif var648 == protoModule.wireTypes.i64 then
			local _ = nil
			local var663, var664 = protoModule.readFixed64(p21, var647)
			local _ = var663
			var647 = var664
		else
			error("Unsupported wire type: " .. var648)
		end
	end
	return var646
end

function t_11:jsonEncode() --[[ line: 3485 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_11:jsonDecode() --[[ line: 3499 ]]
	-- upvalues: t_11 (ref), gameSubscriptionDataModule (ref)
	local var666 = t_11.new()
	
	if self.key ~= nil then
		var666.key = self.key
	end
	if self.value ~= nil then
		var666.value = gameSubscriptionDataModule.GameSubscriptionData.jsonDecode(self.value)
	end
	return var666
end

t_11.descriptor = {
	name = "HydrationContent_GameSubscriptionEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameSubscriptionEntry"
}
t.HydrationContent_GameSubscriptionEntry = t_11
typeRegistryModule.default:register(t.HydrationContent_GameSubscriptionEntry)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p22) --[[ line: 3532 ]]
	-- upvalues: t_12 (ref)
	return setmetatable({
		key = if p22 == nil or p22.key == nil then "" else p22.key,
		value = if p22 == nil or p22.value == nil then nil else p22.value
	}, t_12)
end

function t_12:encode() --[[ line: 3544 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var668 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var669, var670 = protoModule.writeTag(buff, var668, 1, protoModule.wireTypes.lengthDelimited)
		var669, var670 = protoModule.writeString(var669, var670, self.key)
		buff = var669
		var668 = var670
	end
	if self.value ~= nil then
		local var671 = self.value:encode()
		local var672, var673 = protoModule.writeTag(buff, var668, 2, protoModule.wireTypes.lengthDelimited)
		var672, var673 = protoModule.writeBuffer(var672, var673, var671, buffer.len(var671))
		buff = var672
		var668 = var673
	end
	local buff_1 = buffer.create(var668)
	buffer.copy(buff_1, 0, buff, 0, var668)
	
	return buff_1
end

function t_12.decode(p23) --[[ line: 3566 ]]
	-- upvalues: t_12 (ref), protoModule (ref), marketplaceCatalogCategoryDataModule (ref)
	local var675 = t_12.new()
	local var676 = 0
	while var676 < buffer.len(p23) do
		local _ = nil
		local var677 = nil
		local var678, var679, var680 = protoModule.readTag(p23, var676)
		local var681 = var678
		var677 = var679
		var676 = var680
		
		if var677 == protoModule.wireTypes.varint then
			local _ = nil
			local var682, var683 = protoModule.readVarInt(p23, var676)
			local _ = var682
			var676 = var683
			continue
		end
		if var677 == protoModule.wireTypes.lengthDelimited then
			if var681 == 1 then
				local _ = nil
				local var684, var685 = protoModule.readBuffer(p23, var676)
				var676 = var685
				var675.key = buffer.tostring(var684)
			elseif var681 == 2 then
				local _ = nil
				local var686, var687 = protoModule.readBuffer(p23, var676)
				var676 = var687
				var675.value = marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.decode(var686)
			else
				local _ = nil
				local var688, var689 = protoModule.readVarInt(p23, var676)
				var676 = var689 + var688
			end
		elseif var677 == protoModule.wireTypes.i32 then
			local _ = nil
			local var690, var691 = protoModule.readFixed32(p23, var676)
			local _ = var690
			var676 = var691
		elseif var677 == protoModule.wireTypes.i64 then
			local _ = nil
			local var692, var693 = protoModule.readFixed64(p23, var676)
			local _ = var692
			var676 = var693
		else
			error("Unsupported wire type: " .. var677)
		end
	end
	return var675
end

function t_12:jsonEncode() --[[ line: 3619 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_12:jsonDecode() --[[ line: 3635 ]]
	-- upvalues: t_12 (ref), marketplaceCatalogCategoryDataModule (ref)
	local var695 = t_12.new()
	
	if self.key ~= nil then
		var695.key = self.key
	end
	if self.value ~= nil then
		var695.value = marketplaceCatalogCategoryDataModule.MarketplaceCatalogCategoryData.jsonDecode(self.value)
	end
	return var695
end

t_12.descriptor = {
	name = "HydrationContent_MarketplaceCatalogCategoryEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryEntry"
}
t.HydrationContent_MarketplaceCatalogCategoryEntry = t_12
typeRegistryModule.default:register(t.HydrationContent_MarketplaceCatalogCategoryEntry)
local t_13 = {}
t_13.__index = t_13

function t_13.new(p24) --[[ line: 3669 ]]
	-- upvalues: t_13 (ref)
	return setmetatable({
		key = if p24 == nil or p24.key == nil then "" else p24.key,
		value = if p24 == nil or p24.value == nil then nil else p24.value
	}, t_13)
end

function t_13:encode() --[[ line: 3678 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var697 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var698, var699 = protoModule.writeTag(buff, var697, 1, protoModule.wireTypes.lengthDelimited)
		var698, var699 = protoModule.writeString(var698, var699, self.key)
		buff = var698
		var697 = var699
	end
	if self.value ~= nil then
		local var700 = self.value:encode()
		local var701, var702 = protoModule.writeTag(buff, var697, 2, protoModule.wireTypes.lengthDelimited)
		var701, var702 = protoModule.writeBuffer(var701, var702, var700, buffer.len(var700))
		buff = var701
		var697 = var702
	end
	local buff_1 = buffer.create(var697)
	buffer.copy(buff_1, 0, buff, 0, var697)
	
	return buff_1
end

function t_13.decode(p25) --[[ line: 3698 ]]
	-- upvalues: t_13 (ref), protoModule (ref), marketplaceAssetDataModule (ref)
	local var704 = t_13.new()
	local var705 = 0
	while var705 < buffer.len(p25) do
		local _ = nil
		local var706 = nil
		local var707, var708, var709 = protoModule.readTag(p25, var705)
		local var710 = var707
		var706 = var708
		var705 = var709
		
		if var706 == protoModule.wireTypes.varint then
			local _ = nil
			local var711, var712 = protoModule.readVarInt(p25, var705)
			local _ = var711
			var705 = var712
			continue
		end
		if var706 == protoModule.wireTypes.lengthDelimited then
			if var710 == 1 then
				local _ = nil
				local var713, var714 = protoModule.readBuffer(p25, var705)
				var705 = var714
				var704.key = buffer.tostring(var713)
			elseif var710 == 2 then
				local _ = nil
				local var715, var716 = protoModule.readBuffer(p25, var705)
				var705 = var716
				var704.value = marketplaceAssetDataModule.MarketplaceAssetData.decode(var715)
			else
				local _ = nil
				local var717, var718 = protoModule.readVarInt(p25, var705)
				var705 = var718 + var717
			end
		elseif var706 == protoModule.wireTypes.i32 then
			local _ = nil
			local var719, var720 = protoModule.readFixed32(p25, var705)
			local _ = var719
			var705 = var720
		elseif var706 == protoModule.wireTypes.i64 then
			local _ = nil
			local var721, var722 = protoModule.readFixed64(p25, var705)
			local _ = var721
			var705 = var722
		else
			error("Unsupported wire type: " .. var706)
		end
	end
	return var704
end

function t_13:jsonEncode() --[[ line: 3747 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_13:jsonDecode() --[[ line: 3761 ]]
	-- upvalues: t_13 (ref), marketplaceAssetDataModule (ref)
	local var724 = t_13.new()
	
	if self.key ~= nil then
		var724.key = self.key
	end
	if self.value ~= nil then
		var724.value = marketplaceAssetDataModule.MarketplaceAssetData.jsonDecode(self.value)
	end
	return var724
end

t_13.descriptor = {
	name = "HydrationContent_MarketplaceAssetEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceAssetEntry"
}
t.HydrationContent_MarketplaceAssetEntry = t_13
typeRegistryModule.default:register(t.HydrationContent_MarketplaceAssetEntry)
local t_14 = {}
t_14.__index = t_14

function t_14.new(p26) --[[ line: 3793 ]]
	-- upvalues: t_14 (ref)
	return setmetatable({
		key = if p26 == nil or p26.key == nil then "" else p26.key,
		value = if p26 == nil or p26.value == nil then nil else p26.value
	}, t_14)
end

function t_14:encode() --[[ line: 3802 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var726 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var727, var728 = protoModule.writeTag(buff, var726, 1, protoModule.wireTypes.lengthDelimited)
		var727, var728 = protoModule.writeString(var727, var728, self.key)
		buff = var727
		var726 = var728
	end
	if self.value ~= nil then
		local var729 = self.value:encode()
		local var730, var731 = protoModule.writeTag(buff, var726, 2, protoModule.wireTypes.lengthDelimited)
		var730, var731 = protoModule.writeBuffer(var730, var731, var729, buffer.len(var729))
		buff = var730
		var726 = var731
	end
	local buff_1 = buffer.create(var726)
	buffer.copy(buff_1, 0, buff, 0, var726)
	
	return buff_1
end

function t_14.decode(p27) --[[ line: 3822 ]]
	-- upvalues: t_14 (ref), protoModule (ref), marketplaceBundleDataModule (ref)
	local var733 = t_14.new()
	local var734 = 0
	while var734 < buffer.len(p27) do
		local _ = nil
		local var735 = nil
		local var736, var737, var738 = protoModule.readTag(p27, var734)
		local var739 = var736
		var735 = var737
		var734 = var738
		
		if var735 == protoModule.wireTypes.varint then
			local _ = nil
			local var740, var741 = protoModule.readVarInt(p27, var734)
			local _ = var740
			var734 = var741
			continue
		end
		if var735 == protoModule.wireTypes.lengthDelimited then
			if var739 == 1 then
				local _ = nil
				local var742, var743 = protoModule.readBuffer(p27, var734)
				var734 = var743
				var733.key = buffer.tostring(var742)
			elseif var739 == 2 then
				local _ = nil
				local var744, var745 = protoModule.readBuffer(p27, var734)
				var734 = var745
				var733.value = marketplaceBundleDataModule.MarketplaceBundleData.decode(var744)
			else
				local _ = nil
				local var746, var747 = protoModule.readVarInt(p27, var734)
				var734 = var747 + var746
			end
		elseif var735 == protoModule.wireTypes.i32 then
			local _ = nil
			local var748, var749 = protoModule.readFixed32(p27, var734)
			local _ = var748
			var734 = var749
		elseif var735 == protoModule.wireTypes.i64 then
			local _ = nil
			local var750, var751 = protoModule.readFixed64(p27, var734)
			local _ = var750
			var734 = var751
		else
			error("Unsupported wire type: " .. var735)
		end
	end
	return var733
end

function t_14:jsonEncode() --[[ line: 3873 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_14:jsonDecode() --[[ line: 3887 ]]
	-- upvalues: t_14 (ref), marketplaceBundleDataModule (ref)
	local var753 = t_14.new()
	
	if self.key ~= nil then
		var753.key = self.key
	end
	if self.value ~= nil then
		var753.value = marketplaceBundleDataModule.MarketplaceBundleData.jsonDecode(self.value)
	end
	return var753
end

t_14.descriptor = {
	name = "HydrationContent_MarketplaceBundleEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceBundleEntry"
}
t.HydrationContent_MarketplaceBundleEntry = t_14
typeRegistryModule.default:register(t.HydrationContent_MarketplaceBundleEntry)
local t_15 = {}
t_15.__index = t_15

function t_15.new(p28) --[[ line: 3920 ]]
	-- upvalues: t_15 (ref)
	return setmetatable({
		key = if p28 == nil or p28.key == nil then "" else p28.key,
		value = if p28 == nil or p28.value == nil then nil else p28.value
	}, t_15)
end

function t_15:encode() --[[ line: 3929 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var755 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var756, var757 = protoModule.writeTag(buff, var755, 1, protoModule.wireTypes.lengthDelimited)
		var756, var757 = protoModule.writeString(var756, var757, self.key)
		buff = var756
		var755 = var757
	end
	if self.value ~= nil then
		local var758 = self.value:encode()
		local var759, var760 = protoModule.writeTag(buff, var755, 2, protoModule.wireTypes.lengthDelimited)
		var759, var760 = protoModule.writeBuffer(var759, var760, var758, buffer.len(var758))
		buff = var759
		var755 = var760
	end
	local buff_1 = buffer.create(var755)
	buffer.copy(buff_1, 0, buff, 0, var755)
	
	return buff_1
end

function t_15.decode(p29) --[[ line: 3949 ]]
	-- upvalues: t_15 (ref), protoModule (ref), marketplaceLookDataModule (ref)
	local var762 = t_15.new()
	local var763 = 0
	while var763 < buffer.len(p29) do
		local _ = nil
		local var764 = nil
		local var765, var766, var767 = protoModule.readTag(p29, var763)
		local var768 = var765
		var764 = var766
		var763 = var767
		
		if var764 == protoModule.wireTypes.varint then
			local _ = nil
			local var769, var770 = protoModule.readVarInt(p29, var763)
			local _ = var769
			var763 = var770
			continue
		end
		if var764 == protoModule.wireTypes.lengthDelimited then
			if var768 == 1 then
				local _ = nil
				local var771, var772 = protoModule.readBuffer(p29, var763)
				var763 = var772
				var762.key = buffer.tostring(var771)
			elseif var768 == 2 then
				local _ = nil
				local var773, var774 = protoModule.readBuffer(p29, var763)
				var763 = var774
				var762.value = marketplaceLookDataModule.MarketplaceLookData.decode(var773)
			else
				local _ = nil
				local var775, var776 = protoModule.readVarInt(p29, var763)
				var763 = var776 + var775
			end
		elseif var764 == protoModule.wireTypes.i32 then
			local _ = nil
			local var777, var778 = protoModule.readFixed32(p29, var763)
			local _ = var777
			var763 = var778
		elseif var764 == protoModule.wireTypes.i64 then
			local _ = nil
			local var779, var780 = protoModule.readFixed64(p29, var763)
			local _ = var779
			var763 = var780
		else
			error("Unsupported wire type: " .. var764)
		end
	end
	return var762
end

function t_15:jsonEncode() --[[ line: 3998 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_15:jsonDecode() --[[ line: 4012 ]]
	-- upvalues: t_15 (ref), marketplaceLookDataModule (ref)
	local var782 = t_15.new()
	
	if self.key ~= nil then
		var782.key = self.key
	end
	if self.value ~= nil then
		var782.value = marketplaceLookDataModule.MarketplaceLookData.jsonDecode(self.value)
	end
	return var782
end

t_15.descriptor = {
	name = "HydrationContent_MarketplaceLookEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceLookEntry"
}
t.HydrationContent_MarketplaceLookEntry = t_15
typeRegistryModule.default:register(t.HydrationContent_MarketplaceLookEntry)
local t_16 = {}
t_16.__index = t_16

function t_16.new(p30) --[[ line: 4043 ]]
	-- upvalues: t_16 (ref)
	return setmetatable({
		key = if p30 == nil or p30.key == nil then "" else p30.key,
		value = if p30 == nil or p30.value == nil then nil else p30.value
	}, t_16)
end

function t_16:encode() --[[ line: 4052 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var784 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var785, var786 = protoModule.writeTag(buff, var784, 1, protoModule.wireTypes.lengthDelimited)
		var785, var786 = protoModule.writeString(var785, var786, self.key)
		buff = var785
		var784 = var786
	end
	if self.value ~= nil then
		local var787 = self.value:encode()
		local var788, var789 = protoModule.writeTag(buff, var784, 2, protoModule.wireTypes.lengthDelimited)
		var788, var789 = protoModule.writeBuffer(var788, var789, var787, buffer.len(var787))
		buff = var788
		var784 = var789
	end
	local buff_1 = buffer.create(var784)
	buffer.copy(buff_1, 0, buff, 0, var784)
	
	return buff_1
end

function t_16.decode(p31) --[[ line: 4072 ]]
	-- upvalues: t_16 (ref), protoModule (ref), catalogSortDataModule (ref)
	local var791 = t_16.new()
	local var792 = 0
	while var792 < buffer.len(p31) do
		local _ = nil
		local var793 = nil
		local var794, var795, var796 = protoModule.readTag(p31, var792)
		local var797 = var794
		var793 = var795
		var792 = var796
		
		if var793 == protoModule.wireTypes.varint then
			local _ = nil
			local var798, var799 = protoModule.readVarInt(p31, var792)
			local _ = var798
			var792 = var799
			continue
		end
		if var793 == protoModule.wireTypes.lengthDelimited then
			if var797 == 1 then
				local _ = nil
				local var800, var801 = protoModule.readBuffer(p31, var792)
				var792 = var801
				var791.key = buffer.tostring(var800)
			elseif var797 == 2 then
				local _ = nil
				local var802, var803 = protoModule.readBuffer(p31, var792)
				var792 = var803
				var791.value = catalogSortDataModule.CatalogSortData.decode(var802)
			else
				local _ = nil
				local var804, var805 = protoModule.readVarInt(p31, var792)
				var792 = var805 + var804
			end
		elseif var793 == protoModule.wireTypes.i32 then
			local _ = nil
			local var806, var807 = protoModule.readFixed32(p31, var792)
			local _ = var806
			var792 = var807
		elseif var793 == protoModule.wireTypes.i64 then
			local _ = nil
			local var808, var809 = protoModule.readFixed64(p31, var792)
			local _ = var808
			var792 = var809
		else
			error("Unsupported wire type: " .. var793)
		end
	end
	return var791
end

function t_16:jsonEncode() --[[ line: 4120 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_16:jsonDecode() --[[ line: 4134 ]]
	-- upvalues: t_16 (ref), catalogSortDataModule (ref)
	local var811 = t_16.new()
	
	if self.key ~= nil then
		var811.key = self.key
	end
	if self.value ~= nil then
		var811.value = catalogSortDataModule.CatalogSortData.jsonDecode(self.value)
	end
	return var811
end

t_16.descriptor = {
	name = "HydrationContent_CatalogSortEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortEntry"
}
t.HydrationContent_CatalogSortEntry = t_16
typeRegistryModule.default:register(t.HydrationContent_CatalogSortEntry)
local t_17 = {}
t_17.__index = t_17

function t_17.new(p32) --[[ line: 4165 ]]
	-- upvalues: t_17 (ref)
	return setmetatable({
		key = if p32 == nil or p32.key == nil then "" else p32.key,
		value = if p32 == nil or p32.value == nil then nil else p32.value
	}, t_17)
end

function t_17:encode() --[[ line: 4174 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var813 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var814, var815 = protoModule.writeTag(buff, var813, 1, protoModule.wireTypes.lengthDelimited)
		var814, var815 = protoModule.writeString(var814, var815, self.key)
		buff = var814
		var813 = var815
	end
	if self.value ~= nil then
		local var816 = self.value:encode()
		local var817, var818 = protoModule.writeTag(buff, var813, 2, protoModule.wireTypes.lengthDelimited)
		var817, var818 = protoModule.writeBuffer(var817, var818, var816, buffer.len(var816))
		buff = var817
		var813 = var818
	end
	local buff_1 = buffer.create(var813)
	buffer.copy(buff_1, 0, buff, 0, var813)
	
	return buff_1
end

function t_17.decode(p33) --[[ line: 4194 ]]
	-- upvalues: t_17 (ref), protoModule (ref), ageRecommendationDataModule (ref)
	local var820 = t_17.new()
	local var821 = 0
	while var821 < buffer.len(p33) do
		local _ = nil
		local var822 = nil
		local var823, var824, var825 = protoModule.readTag(p33, var821)
		local var826 = var823
		var822 = var824
		var821 = var825
		
		if var822 == protoModule.wireTypes.varint then
			local _ = nil
			local var827, var828 = protoModule.readVarInt(p33, var821)
			local _ = var827
			var821 = var828
			continue
		end
		if var822 == protoModule.wireTypes.lengthDelimited then
			if var826 == 1 then
				local _ = nil
				local var829, var830 = protoModule.readBuffer(p33, var821)
				var821 = var830
				var820.key = buffer.tostring(var829)
			elseif var826 == 2 then
				local _ = nil
				local var831, var832 = protoModule.readBuffer(p33, var821)
				var821 = var832
				var820.value = ageRecommendationDataModule.AgeRecommendationData.decode(var831)
			else
				local _ = nil
				local var833, var834 = protoModule.readVarInt(p33, var821)
				var821 = var834 + var833
			end
		elseif var822 == protoModule.wireTypes.i32 then
			local _ = nil
			local var835, var836 = protoModule.readFixed32(p33, var821)
			local _ = var835
			var821 = var836
		elseif var822 == protoModule.wireTypes.i64 then
			local _ = nil
			local var837, var838 = protoModule.readFixed64(p33, var821)
			local _ = var837
			var821 = var838
		else
			error("Unsupported wire type: " .. var822)
		end
	end
	return var820
end

function t_17:jsonEncode() --[[ line: 4245 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_17:jsonDecode() --[[ line: 4259 ]]
	-- upvalues: t_17 (ref), ageRecommendationDataModule (ref)
	local var840 = t_17.new()
	
	if self.key ~= nil then
		var840.key = self.key
	end
	if self.value ~= nil then
		var840.value = ageRecommendationDataModule.AgeRecommendationData.jsonDecode(self.value)
	end
	return var840
end

t_17.descriptor = {
	name = "HydrationContent_AgeRecommendationEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeRecommendationEntry"
}
t.HydrationContent_AgeRecommendationEntry = t_17
typeRegistryModule.default:register(t.HydrationContent_AgeRecommendationEntry)
local t_18 = {}
t_18.__index = t_18

function t_18.new(p34) --[[ line: 4292 ]]
	-- upvalues: t_18 (ref)
	return setmetatable({
		key = if p34 == nil or p34.key == nil then "" else p34.key,
		value = if p34 == nil or p34.value == nil then nil else p34.value
	}, t_18)
end

function t_18:encode() --[[ line: 4301 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var842 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var843, var844 = protoModule.writeTag(buff, var842, 1, protoModule.wireTypes.lengthDelimited)
		var843, var844 = protoModule.writeString(var843, var844, self.key)
		buff = var843
		var842 = var844
	end
	if self.value ~= nil then
		local var845 = self.value:encode()
		local var846, var847 = protoModule.writeTag(buff, var842, 2, protoModule.wireTypes.lengthDelimited)
		var846, var847 = protoModule.writeBuffer(var846, var847, var845, buffer.len(var845))
		buff = var846
		var842 = var847
	end
	local buff_1 = buffer.create(var842)
	buffer.copy(buff_1, 0, buff, 0, var842)
	
	return buff_1
end

function t_18.decode(p35) --[[ line: 4323 ]]
	-- upvalues: t_18 (ref), protoModule (ref), universeUserFollowDataModule (ref)
	local var849 = t_18.new()
	local var850 = 0
	while var850 < buffer.len(p35) do
		local _ = nil
		local var851 = nil
		local var852, var853, var854 = protoModule.readTag(p35, var850)
		local var855 = var852
		var851 = var853
		var850 = var854
		
		if var851 == protoModule.wireTypes.varint then
			local _ = nil
			local var856, var857 = protoModule.readVarInt(p35, var850)
			local _ = var856
			var850 = var857
			continue
		end
		if var851 == protoModule.wireTypes.lengthDelimited then
			if var855 == 1 then
				local _ = nil
				local var858, var859 = protoModule.readBuffer(p35, var850)
				var850 = var859
				var849.key = buffer.tostring(var858)
			elseif var855 == 2 then
				local _ = nil
				local var860, var861 = protoModule.readBuffer(p35, var850)
				var850 = var861
				var849.value = universeUserFollowDataModule.UniverseUserFollowData.decode(var860)
			else
				local _ = nil
				local var862, var863 = protoModule.readVarInt(p35, var850)
				var850 = var863 + var862
			end
		elseif var851 == protoModule.wireTypes.i32 then
			local _ = nil
			local var864, var865 = protoModule.readFixed32(p35, var850)
			local _ = var864
			var850 = var865
		elseif var851 == protoModule.wireTypes.i64 then
			local _ = nil
			local var866, var867 = protoModule.readFixed64(p35, var850)
			local _ = var866
			var850 = var867
		else
			error("Unsupported wire type: " .. var851)
		end
	end
	return var849
end

function t_18:jsonEncode() --[[ line: 4376 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_18:jsonDecode() --[[ line: 4392 ]]
	-- upvalues: t_18 (ref), universeUserFollowDataModule (ref)
	local var869 = t_18.new()
	
	if self.key ~= nil then
		var869.key = self.key
	end
	if self.value ~= nil then
		var869.value = universeUserFollowDataModule.UniverseUserFollowData.jsonDecode(self.value)
	end
	return var869
end

t_18.descriptor = {
	name = "HydrationContent_UniverseUserFollowEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserFollowEntry"
}
t.HydrationContent_UniverseUserFollowEntry = t_18
typeRegistryModule.default:register(t.HydrationContent_UniverseUserFollowEntry)
local t_19 = {}
t_19.__index = t_19

function t_19.new(p36) --[[ line: 4425 ]]
	-- upvalues: t_19 (ref)
	return setmetatable({
		key = if p36 == nil or p36.key == nil then "" else p36.key,
		value = if p36 == nil or p36.value == nil then nil else p36.value
	}, t_19)
end

function t_19:encode() --[[ line: 4434 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var871 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var872, var873 = protoModule.writeTag(buff, var871, 1, protoModule.wireTypes.lengthDelimited)
		var872, var873 = protoModule.writeString(var872, var873, self.key)
		buff = var872
		var871 = var873
	end
	if self.value ~= nil then
		local var874 = self.value:encode()
		local var875, var876 = protoModule.writeTag(buff, var871, 2, protoModule.wireTypes.lengthDelimited)
		var875, var876 = protoModule.writeBuffer(var875, var876, var874, buffer.len(var874))
		buff = var875
		var871 = var876
	end
	local buff_1 = buffer.create(var871)
	buffer.copy(buff_1, 0, buff, 0, var871)
	
	return buff_1
end

function t_19.decode(p37) --[[ line: 4454 ]]
	-- upvalues: t_19 (ref), protoModule (ref), universeUserVoteDataModule (ref)
	local var878 = t_19.new()
	local var879 = 0
	while var879 < buffer.len(p37) do
		local _ = nil
		local var880 = nil
		local var881, var882, var883 = protoModule.readTag(p37, var879)
		local var884 = var881
		var880 = var882
		var879 = var883
		
		if var880 == protoModule.wireTypes.varint then
			local _ = nil
			local var885, var886 = protoModule.readVarInt(p37, var879)
			local _ = var885
			var879 = var886
			continue
		end
		if var880 == protoModule.wireTypes.lengthDelimited then
			if var884 == 1 then
				local _ = nil
				local var887, var888 = protoModule.readBuffer(p37, var879)
				var879 = var888
				var878.key = buffer.tostring(var887)
			elseif var884 == 2 then
				local _ = nil
				local var889, var890 = protoModule.readBuffer(p37, var879)
				var879 = var890
				var878.value = universeUserVoteDataModule.UniverseUserVoteData.decode(var889)
			else
				local _ = nil
				local var891, var892 = protoModule.readVarInt(p37, var879)
				var879 = var892 + var891
			end
		elseif var880 == protoModule.wireTypes.i32 then
			local _ = nil
			local var893, var894 = protoModule.readFixed32(p37, var879)
			local _ = var893
			var879 = var894
		elseif var880 == protoModule.wireTypes.i64 then
			local _ = nil
			local var895, var896 = protoModule.readFixed64(p37, var879)
			local _ = var895
			var879 = var896
		else
			error("Unsupported wire type: " .. var880)
		end
	end
	return var878
end

function t_19:jsonEncode() --[[ line: 4505 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_19:jsonDecode() --[[ line: 4519 ]]
	-- upvalues: t_19 (ref), universeUserVoteDataModule (ref)
	local var898 = t_19.new()
	
	if self.key ~= nil then
		var898.key = self.key
	end
	if self.value ~= nil then
		var898.value = universeUserVoteDataModule.UniverseUserVoteData.jsonDecode(self.value)
	end
	return var898
end

t_19.descriptor = {
	name = "HydrationContent_UniverseUserVoteEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserVoteEntry"
}
t.HydrationContent_UniverseUserVoteEntry = t_19
typeRegistryModule.default:register(t.HydrationContent_UniverseUserVoteEntry)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p38) --[[ line: 4551 ]]
	-- upvalues: t_20 (ref)
	return setmetatable({
		key = if p38 == nil or p38.key == nil then "" else p38.key,
		value = if p38 == nil or p38.value == nil then nil else p38.value
	}, t_20)
end

function t_20:encode() --[[ line: 4560 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var900 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var901, var902 = protoModule.writeTag(buff, var900, 1, protoModule.wireTypes.lengthDelimited)
		var901, var902 = protoModule.writeString(var901, var902, self.key)
		buff = var901
		var900 = var902
	end
	if self.value ~= nil then
		local var903 = self.value:encode()
		local var904, var905 = protoModule.writeTag(buff, var900, 2, protoModule.wireTypes.lengthDelimited)
		var904, var905 = protoModule.writeBuffer(var904, var905, var903, buffer.len(var903))
		buff = var904
		var900 = var905
	end
	local buff_1 = buffer.create(var900)
	buffer.copy(buff_1, 0, buff, 0, var900)
	
	return buff_1
end

function t_20.decode(p39) --[[ line: 4580 ]]
	-- upvalues: t_20 (ref), protoModule (ref), userProfileDataModule (ref)
	local var907 = t_20.new()
	local var908 = 0
	while var908 < buffer.len(p39) do
		local _ = nil
		local var909 = nil
		local var910, var911, var912 = protoModule.readTag(p39, var908)
		local var913 = var910
		var909 = var911
		var908 = var912
		
		if var909 == protoModule.wireTypes.varint then
			local _ = nil
			local var914, var915 = protoModule.readVarInt(p39, var908)
			local _ = var914
			var908 = var915
			continue
		end
		if var909 == protoModule.wireTypes.lengthDelimited then
			if var913 == 1 then
				local _ = nil
				local var916, var917 = protoModule.readBuffer(p39, var908)
				var908 = var917
				var907.key = buffer.tostring(var916)
			elseif var913 == 2 then
				local _ = nil
				local var918, var919 = protoModule.readBuffer(p39, var908)
				var908 = var919
				var907.value = userProfileDataModule.UserProfileData.decode(var918)
			else
				local _ = nil
				local var920, var921 = protoModule.readVarInt(p39, var908)
				var908 = var921 + var920
			end
		elseif var909 == protoModule.wireTypes.i32 then
			local _ = nil
			local var922, var923 = protoModule.readFixed32(p39, var908)
			local _ = var922
			var908 = var923
		elseif var909 == protoModule.wireTypes.i64 then
			local _ = nil
			local var924, var925 = protoModule.readFixed64(p39, var908)
			local _ = var924
			var908 = var925
		else
			error("Unsupported wire type: " .. var909)
		end
	end
	return var907
end

function t_20:jsonEncode() --[[ line: 4628 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_20:jsonDecode() --[[ line: 4642 ]]
	-- upvalues: t_20 (ref), userProfileDataModule (ref)
	local var927 = t_20.new()
	
	if self.key ~= nil then
		var927.key = self.key
	end
	if self.value ~= nil then
		var927.value = userProfileDataModule.UserProfileData.jsonDecode(self.value)
	end
	return var927
end

t_20.descriptor = {
	name = "HydrationContent_UserProfileEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserProfileEntry"
}
t.HydrationContent_UserProfileEntry = t_20
typeRegistryModule.default:register(t.HydrationContent_UserProfileEntry)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p40) --[[ line: 4673 ]]
	-- upvalues: t_21 (ref)
	return setmetatable({
		key = if p40 == nil or p40.key == nil then "" else p40.key,
		value = if p40 == nil or p40.value == nil then nil else p40.value
	}, t_21)
end

function t_21:encode() --[[ line: 4682 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var929 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var930, var931 = protoModule.writeTag(buff, var929, 1, protoModule.wireTypes.lengthDelimited)
		var930, var931 = protoModule.writeString(var930, var931, self.key)
		buff = var930
		var929 = var931
	end
	if self.value ~= nil then
		local var932 = self.value:encode()
		local var933, var934 = protoModule.writeTag(buff, var929, 2, protoModule.wireTypes.lengthDelimited)
		var933, var934 = protoModule.writeBuffer(var933, var934, var932, buffer.len(var932))
		buff = var933
		var929 = var934
	end
	local buff_1 = buffer.create(var929)
	buffer.copy(buff_1, 0, buff, 0, var929)
	
	return buff_1
end

function t_21.decode(p41) --[[ line: 4704 ]]
	-- upvalues: t_21 (ref), protoModule (ref), universeUserFavoriteDataModule (ref)
	local var936 = t_21.new()
	local var937 = 0
	while var937 < buffer.len(p41) do
		local _ = nil
		local var938 = nil
		local var939, var940, var941 = protoModule.readTag(p41, var937)
		local var942 = var939
		var938 = var940
		var937 = var941
		
		if var938 == protoModule.wireTypes.varint then
			local _ = nil
			local var943, var944 = protoModule.readVarInt(p41, var937)
			local _ = var943
			var937 = var944
			continue
		end
		if var938 == protoModule.wireTypes.lengthDelimited then
			if var942 == 1 then
				local _ = nil
				local var945, var946 = protoModule.readBuffer(p41, var937)
				var937 = var946
				var936.key = buffer.tostring(var945)
			elseif var942 == 2 then
				local _ = nil
				local var947, var948 = protoModule.readBuffer(p41, var937)
				var937 = var948
				var936.value = universeUserFavoriteDataModule.UniverseUserFavoriteData.decode(var947)
			else
				local _ = nil
				local var949, var950 = protoModule.readVarInt(p41, var937)
				var937 = var950 + var949
			end
		elseif var938 == protoModule.wireTypes.i32 then
			local _ = nil
			local var951, var952 = protoModule.readFixed32(p41, var937)
			local _ = var951
			var937 = var952
		elseif var938 == protoModule.wireTypes.i64 then
			local _ = nil
			local var953, var954 = protoModule.readFixed64(p41, var937)
			local _ = var953
			var937 = var954
		else
			error("Unsupported wire type: " .. var938)
		end
	end
	return var936
end

function t_21:jsonEncode() --[[ line: 4757 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_21:jsonDecode() --[[ line: 4773 ]]
	-- upvalues: t_21 (ref), universeUserFavoriteDataModule (ref)
	local var956 = t_21.new()
	
	if self.key ~= nil then
		var956.key = self.key
	end
	if self.value ~= nil then
		var956.value = universeUserFavoriteDataModule.UniverseUserFavoriteData.jsonDecode(self.value)
	end
	return var956
end

t_21.descriptor = {
	name = "HydrationContent_UniverseUserFavoriteEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserFavoriteEntry"
}
t.HydrationContent_UniverseUserFavoriteEntry = t_21
typeRegistryModule.default:register(t.HydrationContent_UniverseUserFavoriteEntry)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p42) --[[ line: 4806 ]]
	-- upvalues: t_22 (ref)
	return setmetatable({
		key = if p42 == nil or p42.key == nil then "" else p42.key,
		value = if p42 == nil or p42.value == nil then nil else p42.value
	}, t_22)
end

function t_22:encode() --[[ line: 4815 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var958 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var959, var960 = protoModule.writeTag(buff, var958, 1, protoModule.wireTypes.lengthDelimited)
		var959, var960 = protoModule.writeString(var959, var960, self.key)
		buff = var959
		var958 = var960
	end
	if self.value ~= nil then
		local var961 = self.value:encode()
		local var962, var963 = protoModule.writeTag(buff, var958, 2, protoModule.wireTypes.lengthDelimited)
		var962, var963 = protoModule.writeBuffer(var962, var963, var961, buffer.len(var961))
		buff = var962
		var958 = var963
	end
	local buff_1 = buffer.create(var958)
	buffer.copy(buff_1, 0, buff, 0, var958)
	
	return buff_1
end

function t_22.decode(p43) --[[ line: 4835 ]]
	-- upvalues: t_22 (ref), protoModule (ref), playabilityDataModule (ref)
	local var965 = t_22.new()
	local var966 = 0
	while var966 < buffer.len(p43) do
		local _ = nil
		local var967 = nil
		local var968, var969, var970 = protoModule.readTag(p43, var966)
		local var971 = var968
		var967 = var969
		var966 = var970
		
		if var967 == protoModule.wireTypes.varint then
			local _ = nil
			local var972, var973 = protoModule.readVarInt(p43, var966)
			local _ = var972
			var966 = var973
			continue
		end
		if var967 == protoModule.wireTypes.lengthDelimited then
			if var971 == 1 then
				local _ = nil
				local var974, var975 = protoModule.readBuffer(p43, var966)
				var966 = var975
				var965.key = buffer.tostring(var974)
			elseif var971 == 2 then
				local _ = nil
				local var976, var977 = protoModule.readBuffer(p43, var966)
				var966 = var977
				var965.value = playabilityDataModule.PlayabilityData.decode(var976)
			else
				local _ = nil
				local var978, var979 = protoModule.readVarInt(p43, var966)
				var966 = var979 + var978
			end
		elseif var967 == protoModule.wireTypes.i32 then
			local _ = nil
			local var980, var981 = protoModule.readFixed32(p43, var966)
			local _ = var980
			var966 = var981
		elseif var967 == protoModule.wireTypes.i64 then
			local _ = nil
			local var982, var983 = protoModule.readFixed64(p43, var966)
			local _ = var982
			var966 = var983
		else
			error("Unsupported wire type: " .. var967)
		end
	end
	return var965
end

function t_22:jsonEncode() --[[ line: 4883 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_22:jsonDecode() --[[ line: 4897 ]]
	-- upvalues: t_22 (ref), playabilityDataModule (ref)
	local var985 = t_22.new()
	
	if self.key ~= nil then
		var985.key = self.key
	end
	if self.value ~= nil then
		var985.value = playabilityDataModule.PlayabilityData.jsonDecode(self.value)
	end
	return var985
end

t_22.descriptor = {
	name = "HydrationContent_PlayabilityEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.PlayabilityEntry"
}
t.HydrationContent_PlayabilityEntry = t_22
typeRegistryModule.default:register(t.HydrationContent_PlayabilityEntry)
local t_23 = {}
t_23.__index = t_23

function t_23.new(p44) --[[ line: 4927 ]]
	-- upvalues: t_23 (ref)
	return setmetatable({
		key = if p44 == nil or p44.key == nil then "" else p44.key,
		value = if p44 == nil or p44.value == nil then nil else p44.value
	}, t_23)
end

function t_23:encode() --[[ line: 4936 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var987 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var988, var989 = protoModule.writeTag(buff, var987, 1, protoModule.wireTypes.lengthDelimited)
		var988, var989 = protoModule.writeString(var988, var989, self.key)
		buff = var988
		var987 = var989
	end
	if self.value ~= nil then
		local var990 = self.value:encode()
		local var991, var992 = protoModule.writeTag(buff, var987, 2, protoModule.wireTypes.lengthDelimited)
		var991, var992 = protoModule.writeBuffer(var991, var992, var990, buffer.len(var990))
		buff = var991
		var987 = var992
	end
	local buff_1 = buffer.create(var987)
	buffer.copy(buff_1, 0, buff, 0, var987)
	
	return buff_1
end

function t_23.decode(p45) --[[ line: 4958 ]]
	-- upvalues: t_23 (ref), protoModule (ref), universeUserFollowLimitDataModule (ref)
	local var994 = t_23.new()
	local var995 = 0
	while var995 < buffer.len(p45) do
		local _ = nil
		local var996 = nil
		local var997, var998, var999 = protoModule.readTag(p45, var995)
		local var1000 = var997
		var996 = var998
		var995 = var999
		
		if var996 == protoModule.wireTypes.varint then
			local _ = nil
			local var1001, var1002 = protoModule.readVarInt(p45, var995)
			local _ = var1001
			var995 = var1002
			continue
		end
		if var996 == protoModule.wireTypes.lengthDelimited then
			if var1000 == 1 then
				local _ = nil
				local var1003, var1004 = protoModule.readBuffer(p45, var995)
				var995 = var1004
				var994.key = buffer.tostring(var1003)
			elseif var1000 == 2 then
				local _ = nil
				local var1005, var1006 = protoModule.readBuffer(p45, var995)
				var995 = var1006
				var994.value = universeUserFollowLimitDataModule.UniverseUserFollowLimitData.decode(var1005)
			else
				local _ = nil
				local var1007, var1008 = protoModule.readVarInt(p45, var995)
				var995 = var1008 + var1007
			end
		elseif var996 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1009, var1010 = protoModule.readFixed32(p45, var995)
			local _ = var1009
			var995 = var1010
		elseif var996 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1011, var1012 = protoModule.readFixed64(p45, var995)
			local _ = var1011
			var995 = var1012
		else
			error("Unsupported wire type: " .. var996)
		end
	end
	return var994
end

function t_23:jsonEncode() --[[ line: 5011 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_23:jsonDecode() --[[ line: 5027 ]]
	-- upvalues: t_23 (ref), universeUserFollowLimitDataModule (ref)
	local var1014 = t_23.new()
	
	if self.key ~= nil then
		var1014.key = self.key
	end
	if self.value ~= nil then
		var1014.value = universeUserFollowLimitDataModule.UniverseUserFollowLimitData.jsonDecode(self.value)
	end
	return var1014
end

t_23.descriptor = {
	name = "HydrationContent_UniverseUserFollowLimitEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserFollowLimitEntry"
}
t.HydrationContent_UniverseUserFollowLimitEntry = t_23
typeRegistryModule.default:register(t.HydrationContent_UniverseUserFollowLimitEntry)
local t_24 = {}
t_24.__index = t_24

function t_24.new(p46) --[[ line: 5061 ]]
	-- upvalues: t_24 (ref)
	return setmetatable({
		key = if p46 == nil or p46.key == nil then "" else p46.key,
		value = if p46 == nil or p46.value == nil then nil else p46.value
	}, t_24)
end

function t_24:encode() --[[ line: 5073 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1016 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1017, var1018 = protoModule.writeTag(buff, var1016, 1, protoModule.wireTypes.lengthDelimited)
		var1017, var1018 = protoModule.writeString(var1017, var1018, self.key)
		buff = var1017
		var1016 = var1018
	end
	if self.value ~= nil then
		local var1019 = self.value:encode()
		local var1020, var1021 = protoModule.writeTag(buff, var1016, 2, protoModule.wireTypes.lengthDelimited)
		var1020, var1021 = protoModule.writeBuffer(var1020, var1021, var1019, buffer.len(var1019))
		buff = var1020
		var1016 = var1021
	end
	local buff_1 = buffer.create(var1016)
	buffer.copy(buff_1, 0, buff, 0, var1016)
	
	return buff_1
end

function t_24.decode(p47) --[[ line: 5095 ]]
	-- upvalues: t_24 (ref), protoModule (ref), universeUserVoteFeedbackMetadataDataModule (ref)
	local var1023 = t_24.new()
	local var1024 = 0
	while var1024 < buffer.len(p47) do
		local _ = nil
		local var1025 = nil
		local var1026, var1027, var1028 = protoModule.readTag(p47, var1024)
		local var1029 = var1026
		var1025 = var1027
		var1024 = var1028
		
		if var1025 == protoModule.wireTypes.varint then
			local _ = nil
			local var1030, var1031 = protoModule.readVarInt(p47, var1024)
			local _ = var1030
			var1024 = var1031
			continue
		end
		if var1025 == protoModule.wireTypes.lengthDelimited then
			if var1029 == 1 then
				local _ = nil
				local var1032, var1033 = protoModule.readBuffer(p47, var1024)
				var1024 = var1033
				var1023.key = buffer.tostring(var1032)
			elseif var1029 == 2 then
				local _ = nil
				local var1034, var1035 = protoModule.readBuffer(p47, var1024)
				var1024 = var1035
				var1023.value = universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.decode(var1034)
			else
				local _ = nil
				local var1036, var1037 = protoModule.readVarInt(p47, var1024)
				var1024 = var1037 + var1036
			end
		elseif var1025 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1038, var1039 = protoModule.readFixed32(p47, var1024)
			local _ = var1038
			var1024 = var1039
		elseif var1025 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1040, var1041 = protoModule.readFixed64(p47, var1024)
			local _ = var1040
			var1024 = var1041
		else
			error("Unsupported wire type: " .. var1025)
		end
	end
	return var1023
end

function t_24:jsonEncode() --[[ line: 5148 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_24:jsonDecode() --[[ line: 5164 ]]
	-- upvalues: t_24 (ref), universeUserVoteFeedbackMetadataDataModule (ref)
	local var1043 = t_24.new()
	
	if self.key ~= nil then
		var1043.key = self.key
	end
	if self.value ~= nil then
		var1043.value = universeUserVoteFeedbackMetadataDataModule.UniverseUserVoteFeedbackMetadataData.jsonDecode(self.value)
	end
	return var1043
end

t_24.descriptor = {
	name = "HydrationContent_UniverseUserVoteFeedbackMetadataEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserVoteFeedbackMetadataEntry"
}
t.HydrationContent_UniverseUserVoteFeedbackMetadataEntry = t_24
typeRegistryModule.default:register(t.HydrationContent_UniverseUserVoteFeedbackMetadataEntry)
local t_25 = {}
t_25.__index = t_25

function t_25.new(p48) --[[ line: 5198 ]]
	-- upvalues: t_25 (ref)
	return setmetatable({
		key = if p48 == nil or p48.key == nil then "" else p48.key,
		value = if p48 == nil or p48.value == nil then nil else p48.value
	}, t_25)
end

function t_25:encode() --[[ line: 5207 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1045 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1046, var1047 = protoModule.writeTag(buff, var1045, 1, protoModule.wireTypes.lengthDelimited)
		var1046, var1047 = protoModule.writeString(var1046, var1047, self.key)
		buff = var1046
		var1045 = var1047
	end
	if self.value ~= nil then
		local var1048 = self.value:encode()
		local var1049, var1050 = protoModule.writeTag(buff, var1045, 2, protoModule.wireTypes.lengthDelimited)
		var1049, var1050 = protoModule.writeBuffer(var1049, var1050, var1048, buffer.len(var1048))
		buff = var1049
		var1045 = var1050
	end
	local buff_1 = buffer.create(var1045)
	buffer.copy(buff_1, 0, buff, 0, var1045)
	
	return buff_1
end

function t_25.decode(p49) --[[ line: 5227 ]]
	-- upvalues: t_25 (ref), protoModule (ref), momentDataModule (ref)
	local var1052 = t_25.new()
	local var1053 = 0
	while var1053 < buffer.len(p49) do
		local _ = nil
		local var1054 = nil
		local var1055, var1056, var1057 = protoModule.readTag(p49, var1053)
		local var1058 = var1055
		var1054 = var1056
		var1053 = var1057
		
		if var1054 == protoModule.wireTypes.varint then
			local _ = nil
			local var1059, var1060 = protoModule.readVarInt(p49, var1053)
			local _ = var1059
			var1053 = var1060
			continue
		end
		if var1054 == protoModule.wireTypes.lengthDelimited then
			if var1058 == 1 then
				local _ = nil
				local var1061, var1062 = protoModule.readBuffer(p49, var1053)
				var1053 = var1062
				var1052.key = buffer.tostring(var1061)
			elseif var1058 == 2 then
				local _ = nil
				local var1063, var1064 = protoModule.readBuffer(p49, var1053)
				var1053 = var1064
				var1052.value = momentDataModule.MomentData.decode(var1063)
			else
				local _ = nil
				local var1065, var1066 = protoModule.readVarInt(p49, var1053)
				var1053 = var1066 + var1065
			end
		elseif var1054 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1067, var1068 = protoModule.readFixed32(p49, var1053)
			local _ = var1067
			var1053 = var1068
		elseif var1054 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1069, var1070 = protoModule.readFixed64(p49, var1053)
			local _ = var1069
			var1053 = var1070
		else
			error("Unsupported wire type: " .. var1054)
		end
	end
	return var1052
end

function t_25:jsonEncode() --[[ line: 5275 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_25:jsonDecode() --[[ line: 5289 ]]
	-- upvalues: t_25 (ref), momentDataModule (ref)
	local var1072 = t_25.new()
	
	if self.key ~= nil then
		var1072.key = self.key
	end
	if self.value ~= nil then
		var1072.value = momentDataModule.MomentData.jsonDecode(self.value)
	end
	return var1072
end

t_25.descriptor = {
	name = "HydrationContent_MomentEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentEntry"
}
t.HydrationContent_MomentEntry = t_25
typeRegistryModule.default:register(t.HydrationContent_MomentEntry)

return { HydrationContent = t.HydrationContent }