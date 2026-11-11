local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local _ = require(Parent.DiscoveryTypes)
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local PromiseModule = require(Parent.Promise)
local DiscoveryUtilsModule = require(Parent.DiscoveryUtils)
local TopicContentsReducer = require(Parent.TopicContentsRodux).TopicContentsReducer
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local Modules = DiscoveryMonolith.Modules
local OmniGetRecommendationsMetadataModule = require(Modules.LuaApp.Http.Requests.DiscoveryApi.OmniGetRecommendationsMetadata)
local SetOmniRecommendationsMetadataRequestStatusModule = require(Modules.LuaApp.Actions.Games.SetOmniRecommendationsMetadataRequestStatus)
local OmniUtilsModule = require(Modules.LuaApp.Util.Omni.OmniUtils)
local GenerateTopicContentsModule = require(Modules.Personalization.Games.DataStore.GenerateTopicContents)
local ParseAndAddContentMetadataModule = require(Modules.LuaApp.Thunks.Omni.parseAndAddContentMetadata)
local FFlagLuaAppLogOmniRecommendationsMetadata = require(Parent.SharedFlags).FFlagLuaAppLogOmniRecommendationsMetadata
local OmniRecommendationsMetadataEventThrottlingHundredthsPercent = game:DefineFastInt("OmniRecommendationsMetadataEventThrottlingHundredthsPercent", 0)

local function _(p1, p2, p3)
	-- upvalues: OmniUtilsModule (copy)
	local StoreForContentTypeResult = OmniUtilsModule.storeForContentType(p1, p2)
	
	if StoreForContentTypeResult == nil then
		return nil
	else
		assert(StoreForContentTypeResult, "store should always exist after this point")
		
		return StoreForContentTypeResult[tostring(p3)]
	end
end

local _ = function(p1, p2, p3)
	if p1.RequestsStatus.OmniRecommendationsMetadataRetrievalStatus == nil then
		return nil
	else
		local OmniRecommendationsMetadataRetrievalStatusEntry = p1.RequestsStatus.OmniRecommendationsMetadataRetrievalStatus[p2]
		
		return if OmniRecommendationsMetadataRetrievalStatusEntry == nil then nil else OmniRecommendationsMetadataRetrievalStatusEntry[tostring(p3)]
	end
end

local function fetchOmniMetadata(p1, p2, PageType, SortIndex, CountToFetch: number, p3, Callsite)
	-- upvalues: PromiseModule (copy), TopicContentsReducer (copy), RetrievalStatus (copy), OmniUtilsModule (copy), SetOmniRecommendationsMetadataRequestStatusModule (copy), FFlagLuaAppLogOmniRecommendationsMetadata (copy), OmniRecommendationsMetadataEventThrottlingHundredthsPercent (copy), LoggingProtocolModule (copy), OmniGetRecommendationsMetadataModule (copy), DiscoveryUtilsModule (copy), ParseAndAddContentMetadataModule (copy), GenerateTopicContentsModule (copy)
	local State = p1:getState()
	local Sort = State.OmniRecommendations and State.OmniRecommendations[PageType] and State.OmniRecommendations[PageType].sorts[SortIndex] or nil
	
	if not Sort then
		return PromiseModule.reject("pageType, sortIndex combo doesn't exist")
	end
	assert(Sort, "OmniRecommendations sort should always exist")
	local TopicId = Sort.topicId
	
	if TopicId == nil then
		return PromiseModule.reject("TopicId for sortIndex " .. tostring(SortIndex) .. " doesn't exist")
	end
	local Text = tostring(TopicId)
	local PersonalizationEntry = State.Personalization[TopicContentsReducer.key][Text]
	
	if not PersonalizationEntry then
		return PromiseModule.reject("TopicContents for id: " .. Text .. " doesn't exist")
	end
	assert(PersonalizationEntry, "sortIndexContents always exists after this point")
	
	if not PersonalizationEntry.hasMoreRows then
		return PromiseModule.resolve("no more rows to fetch")
	end
	if not Sort.recommendations then
		return PromiseModule.reject(`No recommendations for sort index {SortIndex}`)
	end
	local List = {}
	local v1 = #PersonalizationEntry.entries + 1
	
	for i = v1, math.min(v1 + CountToFetch, #Sort.recommendations) do
		local Recommendation = Sort.recommendations[i]
		local ContentType = Recommendation.contentType
		local ContentId = Recommendation.contentId
		local Fetching = nil
		
		if State.RequestsStatus.OmniRecommendationsMetadataRetrievalStatus == nil then
			Fetching = nil
		else
			local OmniRecommendationsMetadataRetrievalStatusEntry = State.RequestsStatus.OmniRecommendationsMetadataRetrievalStatus[ContentType]
			Fetching = if OmniRecommendationsMetadataRetrievalStatusEntry == nil then nil else OmniRecommendationsMetadataRetrievalStatusEntry[tostring(ContentId)]
		end
		local IsFetchingMatch: boolean = Fetching ~= nil and Fetching == RetrievalStatus.Fetching
		local ContentId1 = Recommendation.contentId
		local StoreForContentTypeResult = OmniUtilsModule.storeForContentType(State, Recommendation.contentType)
		local v2 = nil
		
		if StoreForContentTypeResult == nil then
			v2 = nil
		else
			assert(StoreForContentTypeResult, "store should always exist after this point")
			v2 = StoreForContentTypeResult[tostring(ContentId1)]
		end
		if v2 == nil and not IsFetchingMatch then
			table.insert(List, Recommendation)
		end
	end
	if #List == 0 then
		return PromiseModule.resolve("nothing new to fetch")
	end
	local t = {}
	
	for _, value in ipairs(List) do
		if t[value.contentType] == nil then
			t[value.contentType] = {}
		end
		t[value.contentType][tostring(value.contentId)] = RetrievalStatus.Fetching
	end
	p1:dispatch(SetOmniRecommendationsMetadataRequestStatusModule(t))
	
	if FFlagLuaAppLogOmniRecommendationsMetadata then
		p3:logRobloxTelemetryEvent({
			eventName = "OmniRecommendationsMetadataRequestEvent",
			backends = { "Points", "EventIngest" },
			throttlingPercentage = OmniRecommendationsMetadataEventThrottlingHundredthsPercent
		}, {
			LoggingProtocolModule.StandardizedFields.addOsInfo,
			LoggingProtocolModule.StandardizedFields.addSessionId,
			"addSessionInfo"
		}, {
			pageType = PageType,
			sortIndex = SortIndex,
			countToFetch = CountToFetch,
			numberOfIdsToRequest = #List,
			sortHasMoreRows = PersonalizationEntry.hasMoreRows,
			sortNextPageToken = PersonalizationEntry.nextPageToken or "none",
			callsite = Callsite
		})
	end
	return OmniGetRecommendationsMetadataModule(p2, List):andThen(function(Result)
		-- upvalues: DiscoveryUtilsModule (upval), p3 (copy), ParseAndAddContentMetadataModule (upval), p2 (copy), p1 (copy), GenerateTopicContentsModule (upval), PageType (copy), Text (ref), FFlagLuaAppLogOmniRecommendationsMetadata (upval), OmniRecommendationsMetadataEventThrottlingHundredthsPercent (upval), LoggingProtocolModule (upval), t (copy), RetrievalStatus (upval), SetOmniRecommendationsMetadataRequestStatusModule (upval), PromiseModule (upval)
		DiscoveryUtilsModule.logResponseTelemetry("discovery-api/omni-recommendation-metadata", Result, p3)
		local ParseAndAddContentMetadataModuleResult = ParseAndAddContentMetadataModule(p2, p1, Result.responseBody)
		p1:dispatch(GenerateTopicContentsModule(PageType, Text))
		
		if FFlagLuaAppLogOmniRecommendationsMetadata then
			p3:logRobloxTelemetryEvent({
				eventName = "OmniRecommendationsMetadataResponseEvent",
				backends = { "Points", "EventIngest" },
				throttlingPercentage = OmniRecommendationsMetadataEventThrottlingHundredthsPercent
			}, {
				LoggingProtocolModule.StandardizedFields.addOsInfo,
				LoggingProtocolModule.StandardizedFields.addSessionId,
				"addSessionInfo"
			}, {
				numberOfContent = ParseAndAddContentMetadataModuleResult and tostring(#ParseAndAddContentMetadataModuleResult) or "no content"
			})
		end
		local t1 = {}
		
		for i, value in pairs(t) do
			t1[i] = {}
			
			for i1, _ in pairs(value) do
				t1[i][tostring(i1)] = RetrievalStatus.Failed
			end
		end
		for i2, value1 in pairs(ParseAndAddContentMetadataModuleResult) do
			if not t1[i2] then
				t1[i2] = {}
			end
			for i3, _ in pairs(value1) do
				t1[i2][tostring(i3)] = RetrievalStatus.Done
			end
		end
		p1:dispatch(SetOmniRecommendationsMetadataRequestStatusModule(t1))
		
		return PromiseModule.resolve()
	end, function(p4)
		-- upvalues: p1 (copy), SetOmniRecommendationsMetadataRequestStatusModule (upval), List (copy), RetrievalStatus (upval), PromiseModule (upval)
		p1:dispatch(SetOmniRecommendationsMetadataRequestStatusModule(List, RetrievalStatus.Failed))
		warn(p4)
		
		return PromiseModule.reject(p4)
	end)
end

return function(p4, PageType, SortIndex, CountToFetch, p5, p6)
	-- upvalues: fetchOmniMetadata (copy), FFlagLuaAppLogOmniRecommendationsMetadata (copy)
	return function(p7)
		-- upvalues: fetchOmniMetadata (upval), p4 (copy), PageType (copy), SortIndex (copy), CountToFetch (copy), p5 (copy), FFlagLuaAppLogOmniRecommendationsMetadata (upval), p6 (copy)
		return fetchOmniMetadata(p7, p4, PageType, SortIndex, CountToFetch, p5, if FFlagLuaAppLogOmniRecommendationsMetadata then p6 else nil)
	end
end