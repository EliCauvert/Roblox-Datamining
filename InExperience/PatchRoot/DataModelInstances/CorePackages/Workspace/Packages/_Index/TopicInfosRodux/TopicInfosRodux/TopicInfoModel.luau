local parent = script:FindFirstAncestor("TopicInfosRodux").Parent
local discoveryTypesModule = require(parent.DiscoveryTypes)
local fFlagSearchOmniAutocompletePage = require(parent.SharedFlags).FFlagSearchOmniAutocompletePage
local fFlagEnableTopSongsSort = require(parent.SharedFlags).FFlagEnableTopSongsSort
local t = {
	default = "LuaApp/category/filter_default",
	Featured = "LuaApp/category/filter_featured",
	FriendActivity = "LuaApp/category/filter_friendsplaying",
	MyFavorite = "LuaApp/category/filter_myfavorites",
	MyRecent = "LuaApp/category/filter_continueplaying",
	Popular = "LuaApp/category/filter_popular",
	PopularInCountry = "LuaApp/category/filter_popularnearyou",
	TopGrossing = "LuaApp/category/filter_topearning",
	TopRated = "LuaApp/category/filter_toprated",
	TopRetaining = "LuaApp/category/filter_recommended"
}
local t_1 = {}
t_1.__index = t_1

function t_1.new() --[[ line: 37 ]]
	-- upvalues: discoveryTypesModule (ref), t_1 (ref)
	local t = { dataSource = discoveryTypesModule.DataSourceType.Unknown }
	setmetatable(t, t_1)
	
	return t
end

function t_1.mockFromExploreJsonData(p0, p1, p2) --[[ line: 47 ]]
	-- upvalues: t_1 (ref)
	return t_1.fromExploreJsonData({
		sortDisplayName = "",
		gameSetTargetId = 0,
		sortId = p0,
		gameSetTypeId = p2 or 0,
		topicLayoutData = {},
		treatmentType = p1
	})
end

function t_1.mockFromOmniApi(p3) --[[ line: 60 ]]
	-- upvalues: t_1 (ref)
	return t_1.fromOmniApi({ topic = "", treatmentType = "", topicId = p3 })
end

function t_1:fromExploreJsonData() --[[ line: 69 ]]
	-- upvalues: t_1 (ref), discoveryTypesModule (ref), fFlagEnableTopSongsSort (ref), t (ref)
	local var4 = t_1.new()
	var4.dataSource = discoveryTypesModule.DataSourceType.ExploreApi
	var4.displayName = self.sortDisplayName
	var4.name = self.sortId
	var4.subtitle = self.subtitle
	var4.token = ""
	var4.gameSetTargetId = self.gameSetTargetId
	var4.gameSetTypeId = tostring(self.gameSetTypeId)
	var4.topicLayoutData = self.topicLayoutData
	var4.treatmentType = self.treatmentType
	var4.appliedFilters = self.appliedFilters
	var4.subtitle = self.subtitle
	
	if fFlagEnableTopSongsSort then
		var4.contentType = self.contentType
	end
	if var4.name ~= nil then
		var4.displayIcon = t[var4.name]
	end
	if var4.displayIcon == nil then
		var4.displayIcon = "LuaApp/category/filter_default"
	end
	var4.uniqueKey = var4.name
	var4.analyticsTypeId = var4.gameSetTypeId
	
	return var4
end

function t_1:fromOmniApi() --[[ line: 101 ]]
	-- upvalues: t_1 (ref), discoveryTypesModule (ref)
	local var5 = t_1.new()
	var5.dataSource = discoveryTypesModule.DataSourceType.DiscoveryApi
	var5.displayName = self.topic
	var5.topicId = tostring(self.topicId)
	var5.subtitle = self.subtitle
	var5.sortSubId = self.sortSubId
	var5.analyticsData = self.analyticsData
	var5.treatmentType = self.treatmentType
	var5.uniqueKey = var5.topicId
	var5.analyticsTypeId = var5.topicId
	
	return var5
end

if fFlagSearchOmniAutocompletePage then
	function t_1:fromOmniAutocompleteApi() --[[ line: 118 ]]
		-- upvalues: t_1 (ref), discoveryTypesModule (ref)
		local var6 = t_1.new()
		var6.dataSource = discoveryTypesModule.DataSourceType.OmniAutocompleteApi
		var6.displayName = self.sortDisplayName
		var6.name = self.sortId
		var6.topicLayoutData = self.topicLayoutData or {}
		var6.uniqueKey = var6.name
		var6.analyticsTypeId = var6.name
		var6.gameSetTypeId = var6.name
		
		return var6
	end
end
function t_1.makeTopSearchTopicKey(p4, p5) --[[ line: 133 ]]
	return `{p4}_{p5}`
end

function t_1:fromTopSearchApi(p6) --[[ line: 137 ]]
	-- upvalues: t_1 (ref), discoveryTypesModule (ref)
	local var7 = t_1.new()
	var7.dataSource = discoveryTypesModule.DataSourceType.SearchApi
	var7.topicId = tostring(self.topicId)
	var7.treatmentType = self.treatmentType
	var7.topicLayoutData = self.topicLayoutData or {}
	var7.searchUuid = p6
	var7.uniqueKey = t_1.makeTopSearchTopicKey(var7.searchUuid, var7.topicId)
	var7.analyticsTypeId = var7.uniqueKey
	
	return var7
end

function t_1.makeSearchTopicKey(p7, p8) --[[ line: 151 ]]
	-- upvalues: t_1 (ref)
	return t_1.makeTopSearchTopicKey(p7, p8)
end

function t_1.fromSearchApi(p9, p10) --[[ line: 155 ]]
	-- upvalues: t_1 (ref)
	return t_1.fromTopSearchApi(p9, p10)
end

function t_1:isOmni() --[[ line: 159 ]]
	-- upvalues: discoveryTypesModule (ref)
	return self.dataSource == discoveryTypesModule.DataSourceType.DiscoveryApi
end

function t_1:isSponsored() --[[ line: 167 ]]
	return self.topicId == "400000000" or self.gameSetTypeId == "27"
end

return t_1