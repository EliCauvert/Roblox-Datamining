local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local Signals = require(Parent.DiscoveryAvailability).Signals
local GameSortLoadSource = require(Parent.DiscoveryAvailability).GameSortLoadSource
local TopicInfosRoduxModule = require(Parent.TopicInfosRodux)
local TopicInfoModel = TopicInfosRoduxModule.TopicInfoModel
local AddTopicInfosFunction = TopicInfosRoduxModule.AddTopicInfos
local AppPage = require(Parent.RobloxAppEnums).AppPage
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local MakeOmniRecommendationsRequestFunction = require(Parent.GraphQlShared).MakeOmniRecommendationsRequest
local PromiseModule = require(Parent.Promise)
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local OmniFeedTypes = DiscoveryTypesModule.OmniFeedTypes
local _ = DiscoveryTypesModule.OmniFeedConstants
local DiscoveryUtilsModule = require(Parent.DiscoveryUtils)
local OmniRecommendationsPageType = DiscoveryUtilsModule.OmniRecommendationsPageType
local DiscoveryClientAppStorage = DiscoveryUtilsModule.DiscoveryClientAppStorage
local HomeOmniFeedCache = DiscoveryUtilsModule.HomeOmniFeedCache
local MakeDiscoveryNetworkCallWithCacheFallbackFunction = DiscoveryUtilsModule.makeDiscoveryNetworkCallWithCacheFallback
local FetchStatusRoduxModule = require(Parent.FetchStatusRodux)
local FetchStatusReducer = FetchStatusRoduxModule.FetchStatusReducer
local FetchStatusNamespace = FetchStatusRoduxModule.FetchStatusNamespace
local SetFetchStatusFunction = FetchStatusRoduxModule.SetFetchStatus
local ServerDrivenUiModule = require(Parent.ServerDrivenUi)
local AddSduiRootConfigFunction = ServerDrivenUiModule.AddSduiRootConfig
local SduiErrors = ServerDrivenUiModule.SduiErrors
local SduiLogger = ServerDrivenUiModule.SduiLogger
local SeedHomeOmniSduiV2Payload = ServerDrivenUiModule.seedHomeOmniSduiV2Payload
local MutedErrorFunction = require(Parent.Loggers).mutedError
local Modules = DiscoveryMonolith.Modules
local GenerateTopicContentsModule = require(Modules.Personalization.Games.DataStore.GenerateTopicContents)
local AddOmniRecommendationsModule = require(Modules.LuaApp.Actions.Games.AddOmniRecommendations)
local ParseAndAddContentMetadataModule = require(Modules.LuaApp.Thunks.Omni.parseAndAddContentMetadata)
local ProcessOmniSduiV2ResponseModule = require(Modules.LuaApp.Thunks.Omni.processOmniSduiV2Response)
local OmniRecommendationsModule = require(Modules.LuaApp.Models.DiscoveryApi.OmniRecommendations)
local SetOmniRecommendationsRefreshTimeModule = require(Modules.LuaApp.Actions.Games.SetOmniRecommendationsRefreshTime)
local SetPageSessionTimestampModule = require(Modules.Personalization.Sessions.DataStore.SetPageSessionTimestamp)
local GetFFlagFixFetchNextOmniWithoutPageTokenModule = require(Modules.LuaApp.Flags.GetFFlagFixFetchNextOmniWithoutPageToken)
local FFlagEnableContextFeaturesForOmniRecommendations = require(Parent.SharedFlags).FFlagEnableContextFeaturesForOmniRecommendations
local FFlagEnableSduiV2HomeInterleave = require(Parent.SharedFlags).FFlagEnableSduiV2HomeInterleave
local FStringLuaEnabledSduiTreatmentTypes = require(Parent.SharedFlags).FStringLuaEnabledSduiTreatmentTypes
local HomePageDataSourceType = Signals.HomePageDataSourceType
local GameSortLoadSourceType = GameSortLoadSource.GameSortLoadSourceType

local function v39(AppPage, Failed)
	-- upvalues: SetFetchStatusFunction (copy), FetchStatusNamespace (copy)
	return SetFetchStatusFunction(FetchStatusNamespace.OmniRecommendations, AppPage, Failed)
end

local function getSupportedSduiTreatmentTypes()
	-- upvalues: RunService (copy), FStringLuaEnabledSduiTreatmentTypes (copy)
	local Number: number? = tonumber(string.match(RunService:GetRobloxVersion(), ".(%d+)."))
	local List = {}
	
	for _, value in ipairs((string.split(FStringLuaEnabledSduiTreatmentTypes, ","))) do
		if value ~= "" then
			local Match, Match2 = string.match(value, "(.*):(.*)")
			local Number1: number? = tonumber(Match2)
			
			if Match and Number1 and Number1 <= Number then
				table.insert(List, Match)
			end
		end
	end
	return List
end

local function v41(p1)
	local State = p1:getState()
	local CurrentSquad = State.Squad and (State.Squad.Squad and State.Squad.Squad.currentSquad)
	
	return if CurrentSquad and CurrentSquad.members then { party_size = #CurrentSquad.members } else nil
end

local function fetchOmni(p1, p2, _, AppPage1, p3, p4, p5, p6, p7, p8)
	-- upvalues: FetchStatusReducer (copy), FetchStatusNamespace (copy), RetrievalStatus (copy), PromiseModule (copy), v39 (copy), HttpService (copy), GetFFlagFixFetchNextOmniWithoutPageTokenModule (copy), OmniFeedTypes (copy), getSupportedSduiTreatmentTypes (copy), MutedErrorFunction (copy), FFlagEnableContextFeaturesForOmniRecommendations (copy), v41 (copy), MakeOmniRecommendationsRequestFunction (copy), MakeDiscoveryNetworkCallWithCacheFallbackFunction (copy), DiscoveryUtilsModule (copy), DiscoveryClientAppStorage (copy), HomeOmniFeedCache (copy), OmniRecommendationsPageType (copy), SduiLogger (copy), Signals (copy), HomePageDataSourceType (copy), ParseAndAddContentMetadataModule (copy), DiscoveryTypesModule (copy), OmniRecommendationsModule (copy), FFlagEnableSduiV2HomeInterleave (copy), ProcessOmniSduiV2ResponseModule (copy), SeedHomeOmniSduiV2Payload (copy), AddOmniRecommendationsModule (copy), SduiErrors (copy), TopicInfoModel (copy), GameSortLoadSource (copy), GameSortLoadSourceType (copy), AddTopicInfosFunction (copy), GenerateTopicContentsModule (copy), SetOmniRecommendationsRefreshTimeModule (copy), AppPage (copy), SetPageSessionTimestampModule (copy), AddSduiRootConfigFunction (copy)
	if p1:getState().Personalization[FetchStatusReducer.key][FetchStatusNamespace.OmniRecommendations][AppPage1] == RetrievalStatus.Fetching then
		return PromiseModule.resolve("Data is fetching")
	end
	p1:dispatch(v39(AppPage1, RetrievalStatus.Fetching))
	local Lowered = nil
	Lowered = if p4 then p4 else HttpService:GenerateGUID(false):lower()
	local NextPageToken = nil
	
	if p3 then
		local OmniRecommendation = p1:getState().OmniRecommendations[AppPage1]
		
		if OmniRecommendation then
			NextPageToken = OmniRecommendation.nextPageToken
			Lowered = OmniRecommendation.omniSessionId
		end
		if GetFFlagFixFetchNextOmniWithoutPageTokenModule() and (NextPageToken == nil or NextPageToken == "") then
			p1:dispatch(v39(AppPage1, RetrievalStatus.Done))
			
			return PromiseModule.resolve("nextPageToken is empty")
		end
	end
	local List = {}
	
	for _, omniFeedType in pairs(OmniFeedTypes) do
		table.insert(List, omniFeedType)
	end
	if p8 == nil then
		local Success, Result = pcall(getSupportedSduiTreatmentTypes)
		
		if Success then
			p8 = Result
		else
			MutedErrorFunction("Failed to get supported SDUI treatment types: ")
		end
	end
	local OmniRecommendationsRequest = MakeOmniRecommendationsRequestFunction(p2, AppPage1, Lowered, NextPageToken, List, p5, nil, p8, if FFlagEnableContextFeaturesForOmniRecommendations then v41(p1) else nil)
	
	return (if p7 then MakeDiscoveryNetworkCallWithCacheFallbackFunction(OmniRecommendationsRequest:catch(function(Err)
		-- upvalues: DiscoveryUtilsModule (upval), p6 (copy), PromiseModule (upval)
		DiscoveryUtilsModule.logResponseError("discovery-api/omni-recommendation", Err, p6)
		
		return PromiseModule.reject(Err)
	end), DiscoveryClientAppStorage.CacheKey.HomeOmniFeedCache, HomeOmniFeedCache.HOME_OMNI_FEED_CACHE_VERSION) else OmniRecommendationsRequest):andThen(function(Result)
		-- upvalues: DiscoveryUtilsModule (upval), p6 (copy), p1 (copy), v39 (upval), AppPage1 (copy), RetrievalStatus (upval), PromiseModule (upval), OmniRecommendationsPageType (upval), SduiLogger (upval), HomeOmniFeedCache (upval), Signals (upval), HomePageDataSourceType (upval), Lowered (ref), HttpService (upval), ParseAndAddContentMetadataModule (upval), p2 (copy), DiscoveryTypesModule (upval), OmniRecommendationsModule (upval), p3 (copy), FFlagEnableSduiV2HomeInterleave (upval), ProcessOmniSduiV2ResponseModule (upval), SeedHomeOmniSduiV2Payload (upval), AddOmniRecommendationsModule (upval), OmniFeedTypes (upval), SduiErrors (upval), TopicInfoModel (upval), GameSortLoadSource (upval), GameSortLoadSourceType (upval), AddTopicInfosFunction (upval), GenerateTopicContentsModule (upval), SetOmniRecommendationsRefreshTimeModule (upval), AppPage (upval), SetPageSessionTimestampModule (upval), AddSduiRootConfigFunction (upval)
		if not Result.isFromCache then
			DiscoveryUtilsModule.logResponseTelemetry("discovery-api/omni-recommendation", Result, p6)
		end
		local ResponseBody = Result.responseBody
		
		if ResponseBody == nil or ResponseBody.sorts == nil or #ResponseBody.sorts == 0 then
			p1:dispatch(v39(AppPage1, RetrievalStatus.Failed))
			
			return PromiseModule.reject("No sort data found in response.")
		end
		if AppPage1 ~= OmniRecommendationsPageType.toAppPage(ResponseBody.pageType) then
			p1:dispatch(v39(AppPage1, RetrievalStatus.Failed))
			
			return PromiseModule.reject("Wrong sort data found in response.")
		end
		SduiLogger.reportOmniFeedStats(ResponseBody.sorts, ResponseBody.sdui, AppPage1)
		
		if not Result.isFromCache then
			HomeOmniFeedCache.cacheOmniRecommendationsData(ResponseBody)
		end
		Signals.getCacheStore().setHomePageDataSource(if Result.isFromCache then HomePageDataSourceType.Cache else HomePageDataSourceType.API)
		
		if Result.isFromCache then
			Lowered = HttpService:GenerateGUID(false):lower()
		end
		local ParseAndAddContentMetadataModuleResult = ParseAndAddContentMetadataModule(p2, p1, ResponseBody)
		ParseAndAddContentMetadataModuleResult[DiscoveryTypesModule.OmniRecommendationsContentType.Game] = nil
		OmniRecommendationsModule.fromJsonData(ResponseBody, Lowered):match(function(p9)
			-- upvalues: p3 (upval), ParseAndAddContentMetadataModuleResult (copy), FFlagEnableSduiV2HomeInterleave (upval), ProcessOmniSduiV2ResponseModule (upval), AppPage1 (upval), SeedHomeOmniSduiV2Payload (upval), p1 (upval), AddOmniRecommendationsModule (upval), OmniFeedTypes (upval), SduiLogger (upval), SduiErrors (upval), TopicInfoModel (upval), GameSortLoadSource (upval), Result (copy), GameSortLoadSourceType (upval), AddTopicInfosFunction (upval), GenerateTopicContentsModule (upval), SetOmniRecommendationsRefreshTimeModule (upval), v39 (upval), RetrievalStatus (upval), AppPage (upval), SetPageSessionTimestampModule (upval), AddSduiRootConfigFunction (upval)
			local CurrentTime = if p3 then nil else tick()
			p9.metadata = ParseAndAddContentMetadataModuleResult
			
			if FFlagEnableSduiV2HomeInterleave then
				ProcessOmniSduiV2ResponseModule(p9, AppPage1, { seedSduiV2Payload = SeedHomeOmniSduiV2Payload })
			end
			p1:dispatch(AddOmniRecommendationsModule(p9, p3))
			local List = {}
			local FromOmniApiResults = {}
			
			if p9.sorts then
				for SortIndex, sort in p9.sorts do
					local IsTreatmentTypeMatch = sort.treatmentType == OmniFeedTypes.ServerDrivenUi
					local IsTreatmentTypeMatch1: boolean = FFlagEnableSduiV2HomeInterleave and sort.treatmentType == OmniFeedTypes.ServerDrivenUiV2
					local IsNotFeedItemKeyMatch: boolean = sort.feedItemKey ~= nil and sort.feedItemKey ~= ""
					
					if IsTreatmentTypeMatch and IsNotFeedItemKeyMatch then
						table.insert(List, {
							feedItemKey = sort.feedItemKey,
							topicId = sort.topicId,
							sortIndex = SortIndex
						})
					elseif not FFlagEnableSduiV2HomeInterleave or not IsTreatmentTypeMatch1 or not IsNotFeedItemKeyMatch then
						if IsTreatmentTypeMatch or FFlagEnableSduiV2HomeInterleave and IsTreatmentTypeMatch1 then
							SduiLogger.reportError(SduiErrors.SduiErrorType.NilFeedItemKeyForSduiSort, {
								name = `{sort.topicId}`,
								message = if FFlagEnableSduiV2HomeInterleave then `SDUI v{if IsTreatmentTypeMatch1 then 2 else 1} treatmentType {sort.treatmentType} but no feedItemKey for topicId {sort.topicId} at index {SortIndex}` else `Sdui treatmentType but no feedItemKey for topicId {sort.topicId} at index {SortIndex}`
							}, AppPage1)
						elseif IsNotFeedItemKeyMatch then
							SduiLogger.reportError(SduiErrors.SduiErrorType.InvalidTreatmentTypeWithFeedItemKey, {
								name = `{sort.topicId}`,
								message = `Has sdui feedItemKey {sort.feedItemKey} but treatmentType {sort.treatmentType} for topicId {sort.topicId} at index {SortIndex}`
							}, AppPage1)
						end
					end
					FromOmniApiResults[#FromOmniApiResults + 1] = TopicInfoModel.fromOmniApi(sort)
					GameSortLoadSource.setSortLoadSource(sort.topicId, if Result.isFromCache then GameSortLoadSourceType.ClientFallbackCache else GameSortLoadSourceType.API)
				end
			end
			p1:dispatch(AddTopicInfosFunction(FromOmniApiResults))
			p1:dispatch(GenerateTopicContentsModule(AppPage1, nil, CurrentTime))
			p1:dispatch(SetOmniRecommendationsRefreshTimeModule(AppPage1, p9.sortsExpirationTime))
			p1:dispatch(v39(AppPage1, RetrievalStatus.Done))
			
			if AppPage1 == AppPage.Home and not p3 then
				p1:dispatch(SetPageSessionTimestampModule(AppPage.Home))
			end
			if p9.sdui then
				local Success, Result1 = pcall(function()
					-- upvalues: p1 (upval), AddSduiRootConfigFunction (upval), AppPage1 (upval), p9 (copy), List (copy)
					p1:dispatch(AddSduiRootConfigFunction(AppPage1, p9.sdui, tick(), List))
				end)
				
				if not Success then
					local v1 = ""
					
					if #List > 0 then
						for _, value in List do
							v1 = `{v1} {value.topicId}`
						end
					end
					SduiLogger.reportError(SduiErrors.SduiErrorType.ErrorStoringOmniData, {
						name = "discovery-api/omni-recommendation",
						message = `Error storing omni response: {Result1} topicIds: {v1}`
					}, AppPage1)
					
					return
				end
			elseif #List > 0 then
				local Text = ""
				
				for _, value1 in List do
					Text = `{Text} {value1.topicId}`
				end
				SduiLogger.reportError(SduiErrors.SduiErrorType.NilSduiTreeInResponse, {
					name = "discovery-api/omni-recommendation",
					message = `Has sdui sorts, but no sdui tree in response. topicIds: {Text}`
				}, AppPage1)
			end
		end):matchError(function(p10)
			-- upvalues: p1 (upval), v39 (upval), AppPage1 (upval), RetrievalStatus (upval)
			p1:dispatch(v39(AppPage1, RetrievalStatus.Failed))
			warn(p10)
		end)
		
		return PromiseModule.resolve()
	end, function(p10)
		-- upvalues: p7 (copy), DiscoveryUtilsModule (upval), p6 (copy), p1 (copy), v39 (upval), AppPage1 (copy), RetrievalStatus (upval), PromiseModule (upval)
		if not p7 then
			DiscoveryUtilsModule.logResponseError("discovery-api/omni-recommendation", p10, p6)
		end
		p1:dispatch(v39(AppPage1, RetrievalStatus.Failed))
		
		return PromiseModule.reject(p10)
	end)
end

return function(p10, p11, p12, p13, p14, p15, p16, p17)
	-- upvalues: fetchOmni (copy)
	return function(p18)
		-- upvalues: fetchOmni (upval), p10 (copy), p11 (copy), p12 (copy), p13 (copy), p14 (copy), p15 (copy), p16 (copy), p17 (copy)
		return fetchOmni(p18, p10, p11, p12, p13, p14, p15, p16, p17)
	end
end