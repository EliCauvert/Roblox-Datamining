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

function t_1.new()
	-- upvalues: discoveryTypesModule (ref), t_1 (ref)
	local t = { dataSource = discoveryTypesModule.DataSourceType.Unknown }
	setmetatable(t, t_1)
	
	return t
end

function t_1.mockFromExploreJsonData(p1, p2, p3)
	-- upvalues: t_1 (ref)
	return t_1.fromExploreJsonData({
		sortDisplayName = "",
		gameSetTargetId = 0,
		sortId = p1,
		gameSetTypeId = p3 or 0,
		topicLayoutData = {},
		treatmentType = p2
	})
end

function t_1.mockFromOmniApi(p1)
	-- upvalues: t_1 (ref)
	return t_1.fromOmniApi({ topic = "", treatmentType = "", topicId = p1 })
end

function t_1:fromExploreJsonData()
	-- upvalues: t_1 (ref), discoveryTypesModule (ref), fFlagEnableTopSongsSort (ref), t (ref)
	local var1 = t_1.new()
	var1.dataSource = discoveryTypesModule.DataSourceType.ExploreApi
	var1.displayName = self.sortDisplayName
	var1.name = self.sortId
	var1.subtitle = self.subtitle
	var1.token = ""
	var1.gameSetTargetId = self.gameSetTargetId
	var1.gameSetTypeId = tostring(self.gameSetTypeId)
	var1.topicLayoutData = self.topicLayoutData
	var1.treatmentType = self.treatmentType
	var1.appliedFilters = self.appliedFilters
	var1.subtitle = self.subtitle
	
	if fFlagEnableTopSongsSort then
		var1.contentType = self.contentType
	end
	if var1.name ~= nil then
		var1.displayIcon = t[var1.name]
	end
	if var1.displayIcon == nil then
		var1.displayIcon = "LuaApp/category/filter_default"
	end
	var1.uniqueKey = var1.name
	var1.analyticsTypeId = var1.gameSetTypeId
	
	return var1
end

function t_1:fromOmniApi()
	-- upvalues: t_1 (ref), discoveryTypesModule (ref)
	local var1 = t_1.new()
	var1.dataSource = discoveryTypesModule.DataSourceType.DiscoveryApi
	var1.displayName = self.topic
	var1.topicId = tostring(self.topicId)
	var1.subtitle = self.subtitle
	var1.sortSubId = self.sortSubId
	var1.analyticsData = self.analyticsData
	var1.treatmentType = self.treatmentType
	var1.uniqueKey = var1.topicId
	var1.analyticsTypeId = var1.topicId
	
	return var1
end

if fFlagSearchOmniAutocompletePage then
	function t_1:fromOmniAutocompleteApi()
		-- upvalues: t_1 (ref), discoveryTypesModule (ref)
		local var1 = t_1.new()
		var1.dataSource = discoveryTypesModule.DataSourceType.OmniAutocompleteApi
		var1.displayName = self.sortDisplayName
		var1.name = self.sortId
		var1.topicLayoutData = self.topicLayoutData or {}
		var1.uniqueKey = var1.name
		var1.analyticsTypeId = var1.name
		var1.gameSetTypeId = var1.name
		
		return var1
	end
end
function t_1.makeTopSearchTopicKey(p1, p2)
	return `{p1}_{p2}`
end

function t_1:fromTopSearchApi(p1)
	-- upvalues: t_1 (ref), discoveryTypesModule (ref)
	local var1 = t_1.new()
	var1.dataSource = discoveryTypesModule.DataSourceType.SearchApi
	var1.topicId = tostring(self.topicId)
	var1.treatmentType = self.treatmentType
	var1.topicLayoutData = self.topicLayoutData or {}
	var1.searchUuid = p1
	var1.uniqueKey = t_1.makeTopSearchTopicKey(var1.searchUuid, var1.topicId)
	var1.analyticsTypeId = var1.uniqueKey
	
	return var1
end

function t_1.makeSearchTopicKey(p1, p2)
	-- upvalues: t_1 (ref)
	return t_1.makeTopSearchTopicKey(p1, p2)
end

function t_1.fromSearchApi(p1, p2)
	-- upvalues: t_1 (ref)
	return t_1.fromTopSearchApi(p1, p2)
end

function t_1:isOmni()
	-- upvalues: discoveryTypesModule (ref)
	return self.dataSource == discoveryTypesModule.DataSourceType.DiscoveryApi
end

function t_1:isSponsored()
	return self.topicId == "400000000" or self.gameSetTypeId == "27"
end

return t_1