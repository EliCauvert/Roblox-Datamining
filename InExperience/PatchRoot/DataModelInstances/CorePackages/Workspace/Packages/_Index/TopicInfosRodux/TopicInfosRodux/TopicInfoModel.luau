local Parent = script:FindFirstAncestor("TopicInfosRodux").Parent
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local FFlagEnableTopSongsSort = require(Parent.SharedFlags).FFlagEnableTopSongsSort
local config = {
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
local TopicInfoModelModule = {}
TopicInfoModelModule.__index = TopicInfoModelModule

function TopicInfoModelModule.new()
	-- upvalues: DiscoveryTypesModule (copy), TopicInfoModelModule (copy)
	local config = { dataSource = DiscoveryTypesModule.DataSourceType.Unknown }
	setmetatable(config, TopicInfoModelModule)
	
	return config
end

function TopicInfoModelModule.mockFromExploreJsonData(SortId, TreatmentType, p1)
	-- upvalues: TopicInfoModelModule (copy)
	return (TopicInfoModelModule.fromExploreJsonData({
		sortDisplayName = "",
		gameSetTargetId = 0,
		sortId = SortId,
		gameSetTypeId = p1 or 0,
		topicLayoutData = {},
		treatmentType = TreatmentType
	}))
end

function TopicInfoModelModule.mockFromOmniApi(TopicId)
	-- upvalues: TopicInfoModelModule (copy)
	return (TopicInfoModelModule.fromOmniApi({ topic = "", treatmentType = "", topicId = TopicId }))
end

function TopicInfoModelModule:fromExploreJsonData()
	-- upvalues: TopicInfoModelModule (copy), DiscoveryTypesModule (copy), FFlagEnableTopSongsSort (copy), config (copy)
	local NewTopicInfoModel = TopicInfoModelModule.new()
	NewTopicInfoModel.dataSource = DiscoveryTypesModule.DataSourceType.ExploreApi
	NewTopicInfoModel.displayName = self.sortDisplayName
	NewTopicInfoModel.name = self.sortId
	NewTopicInfoModel.subtitle = self.subtitle
	NewTopicInfoModel.token = ""
	NewTopicInfoModel.gameSetTargetId = self.gameSetTargetId
	NewTopicInfoModel.gameSetTypeId = tostring(self.gameSetTypeId)
	NewTopicInfoModel.topicLayoutData = self.topicLayoutData
	NewTopicInfoModel.treatmentType = self.treatmentType
	NewTopicInfoModel.appliedFilters = self.appliedFilters
	NewTopicInfoModel.subtitle = self.subtitle
	
	if FFlagEnableTopSongsSort then
		NewTopicInfoModel.contentType = self.contentType
	end
	if NewTopicInfoModel.name ~= nil then
		NewTopicInfoModel.displayIcon = config[NewTopicInfoModel.name]
	end
	if NewTopicInfoModel.displayIcon == nil then
		NewTopicInfoModel.displayIcon = "LuaApp/category/filter_default"
	end
	NewTopicInfoModel.uniqueKey = NewTopicInfoModel.name
	NewTopicInfoModel.analyticsTypeId = NewTopicInfoModel.gameSetTypeId
	
	return NewTopicInfoModel
end

function TopicInfoModelModule:fromOmniApi()
	-- upvalues: TopicInfoModelModule (copy), DiscoveryTypesModule (copy)
	local NewTopicInfoModel = TopicInfoModelModule.new()
	NewTopicInfoModel.dataSource = DiscoveryTypesModule.DataSourceType.DiscoveryApi
	NewTopicInfoModel.displayName = self.topic
	NewTopicInfoModel.topicId = tostring(self.topicId)
	NewTopicInfoModel.subtitle = self.subtitle
	NewTopicInfoModel.sortSubId = self.sortSubId
	NewTopicInfoModel.analyticsData = self.analyticsData
	NewTopicInfoModel.treatmentType = self.treatmentType
	NewTopicInfoModel.uniqueKey = NewTopicInfoModel.topicId
	NewTopicInfoModel.analyticsTypeId = NewTopicInfoModel.topicId
	
	return NewTopicInfoModel
end

function TopicInfoModelModule:fromOmniAutocompleteApi()
	-- upvalues: TopicInfoModelModule (copy), DiscoveryTypesModule (copy)
	local NewTopicInfoModel = TopicInfoModelModule.new()
	NewTopicInfoModel.dataSource = DiscoveryTypesModule.DataSourceType.OmniAutocompleteApi
	NewTopicInfoModel.displayName = self.sortDisplayName
	NewTopicInfoModel.name = self.sortId
	NewTopicInfoModel.topicLayoutData = self.topicLayoutData or {}
	NewTopicInfoModel.uniqueKey = NewTopicInfoModel.name
	NewTopicInfoModel.analyticsTypeId = NewTopicInfoModel.name
	NewTopicInfoModel.gameSetTypeId = NewTopicInfoModel.name
	
	return NewTopicInfoModel
end

function TopicInfoModelModule.makeTopSearchTopicKey(SearchUuid, TopicId): string
	return `{SearchUuid}_{TopicId}`
end

function TopicInfoModelModule:fromTopSearchApi(SearchUuid)
	-- upvalues: TopicInfoModelModule (copy), DiscoveryTypesModule (copy)
	local NewTopicInfoModel = TopicInfoModelModule.new()
	NewTopicInfoModel.dataSource = DiscoveryTypesModule.DataSourceType.SearchApi
	NewTopicInfoModel.topicId = tostring(self.topicId)
	NewTopicInfoModel.treatmentType = self.treatmentType
	NewTopicInfoModel.topicLayoutData = self.topicLayoutData or {}
	NewTopicInfoModel.searchUuid = SearchUuid
	NewTopicInfoModel.uniqueKey = TopicInfoModelModule.makeTopSearchTopicKey(NewTopicInfoModel.searchUuid, NewTopicInfoModel.topicId)
	NewTopicInfoModel.analyticsTypeId = NewTopicInfoModel.uniqueKey
	
	return NewTopicInfoModel
end

function TopicInfoModelModule.makeSearchTopicKey(p1, p2)
	-- upvalues: TopicInfoModelModule (copy)
	return TopicInfoModelModule.makeTopSearchTopicKey(p1, p2)
end

function TopicInfoModelModule.fromSearchApi(p1, SearchUuid)
	-- upvalues: TopicInfoModelModule (copy)
	return TopicInfoModelModule.fromTopSearchApi(p1, SearchUuid)
end

function TopicInfoModelModule:isOmni(): boolean
	-- upvalues: DiscoveryTypesModule (copy)
	return self.dataSource == DiscoveryTypesModule.DataSourceType.DiscoveryApi
end

function TopicInfoModelModule:isSponsored(): boolean
	return self.topicId == "400000000" or self.gameSetTypeId == "27"
end

return TopicInfoModelModule