local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local ContentProvider = game:GetService("ContentProvider")
local MakeOmniRecommendationsRequestFunction = require(CorePackages.Workspace.Packages.GraphQlShared).MakeOmniRecommendationsRequest
local ReactModule = require(CorePackages.Packages.React)
local TModule = require(CorePackages.Packages.t)
local PromiseModule = require(CorePackages.Packages.Promise)
local TelemetryModule = require(script.Parent.Telemetry)
local FFlagEnableInGameExitModalNextUpUiRequestCacheModule = require(script.Parent.Flags.FFlagEnableInGameExitModalNextUpUiRequestCache)
local RequestInternalWrapperResult = require(CorePackages.Workspace.Packages.Http).NetworkLayers.requestInternalWrapper(nil)
local InGameExitModalNextUpUiSortTopicId = game:DefineFastString("InGameExitModalNextUpUiSortTopicId", "100000014")
local InGameExitModalEnableFilterForCurrentExperience = game:DefineFastFlag("InGameExitModalEnableFilterForCurrentExperience", false)

local function metadataToSortEntry(TopicId, UiIndex, p1)
	local WideImageAssetId = (((p1.layoutDataBySort or {})[TopicId] or {}).primaryMediaAsset or {}).wideImageAssetId
	
	return {
		uiIndex = UiIndex,
		universeId = tostring(p1.universeId),
		placeId = tostring(p1.rootPlaceId),
		name = p1.name,
		image = if WideImageAssetId and WideImageAssetId ~= "0" then `rbxthumb://type=Asset&id={WideImageAssetId}&w=384&h=216` else `rbxthumb://type=GameThumbnail&id={p1.rootPlaceId}&w=384&h=216`,
		upVotes = p1.totalUpVotes,
		downVotes = p1.totalDownVotes,
		layoutDataBySort = p1.layoutDataBySort or {}
	}
end

local InterfaceResult = TModule.interface({ contentType = TModule.string, contentId = TModule.number })
local InterfaceResult1 = TModule.interface({
	name = TModule.string,
	universeId = TModule.number,
	rootPlaceId = TModule.number,
	totalUpVotes = TModule.number,
	totalDownVotes = TModule.number,
	layoutDataBySort = TModule.optional(TModule.table)
})

local function parseSortEntries(p1, Game1)
	-- upvalues: InterfaceResult (copy), InterfaceResult1 (copy), metadataToSortEntry (copy), InGameExitModalEnableFilterForCurrentExperience (copy)
	local List = {}
	
	for _, value in p1.recommendationList do
		if InterfaceResult(value) and value.contentType == "Game" then
			local GameEntry = Game1[tostring(value.contentId)]
			
			if InterfaceResult1(GameEntry) then
				local MetadataToSortEntryResult = metadataToSortEntry(p1.topicId, #List + 1, GameEntry)
				
				if MetadataToSortEntryResult and (not InGameExitModalEnableFilterForCurrentExperience or MetadataToSortEntryResult.universeId ~= tostring(game.GameId)) then
					table.insert(List, MetadataToSortEntryResult)
				end
			end
		end
	end
	return List
end

local InterfaceResult2 = TModule.interface({
	responseBody = TModule.interface({
		sorts = TModule.table,
		contentMetadata = TModule.interface({ Game = TModule.table })
	}),
	responseTimeMs = TModule.number
})
local InterfaceResult3 = TModule.interface({
	topicId = TModule.number,
	recommendationList = TModule.table
})

local function parseOmniResponse(p2)
	-- upvalues: InterfaceResult2 (copy), TelemetryModule (copy), InterfaceResult3 (copy), InGameExitModalNextUpUiSortTopicId (copy), parseSortEntries (copy)
	if not InterfaceResult2(p2) then
		return nil
	end
	TelemetryModule.logRequestLatency("discovery-api/omni-recommendation", p2.responseTimeMs)
	local ResponseBody = p2.responseBody
	local Sorts = ResponseBody.sorts
	local Game1 = ResponseBody.contentMetadata and ResponseBody.contentMetadata.Game or nil
	for _, sort in Sorts do
		if InterfaceResult3(sort) and tostring(sort.topicId) == InGameExitModalNextUpUiSortTopicId then
			return {
				entries = parseSortEntries(sort, Game1),
				topicId = tostring(sort.topicId)
			}
		end
	end
	return nil
end

return function()
	-- upvalues: ReactModule (copy), PromiseModule (copy), MakeOmniRecommendationsRequestFunction (copy), RequestInternalWrapperResult (copy), HttpService (copy), InGameExitModalNextUpUiSortTopicId (copy), parseOmniResponse (copy), FFlagEnableInGameExitModalNextUpUiRequestCacheModule (copy), ContentProvider (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2 (copy), PromiseModule (upval), MakeOmniRecommendationsRequestFunction (upval), RequestInternalWrapperResult (upval), HttpService (upval), InGameExitModalNextUpUiSortTopicId (upval), parseOmniResponse (upval), FFlagEnableInGameExitModalNextUpUiRequestCacheModule (upval), ContentProvider (upval)
		UseStateResult2_1(true)
		UseStateResult2(nil)
		local NewPromise = PromiseModule.new(function(_, _, Callback: (any) -> ())
			-- upvalues: MakeOmniRecommendationsRequestFunction (upval), RequestInternalWrapperResult (upval), HttpService (upval), InGameExitModalNextUpUiSortTopicId (upval), parseOmniResponse (upval), FFlagEnableInGameExitModalNextUpUiRequestCacheModule (upval), ContentProvider (upval), UseStateResult2 (upval), UseStateResult2_1 (upval)
			local InGameExitModal = MakeOmniRecommendationsRequestFunction(RequestInternalWrapperResult, "InGameExitModal", HttpService:GenerateGUID(false):lower(), nil, { "Carousel", "SortlessGrid" }, "gameExitRecommendation", { InGameExitModalNextUpUiSortTopicId }, nil)
			Callback(function()
				-- upvalues: InGameExitModal (copy)
				InGameExitModal:cancel()
			end)
			InGameExitModal:andThen(function(Result)
				-- upvalues: parseOmniResponse (upval), FFlagEnableInGameExitModalNextUpUiRequestCacheModule (upval), ContentProvider (upval), UseStateResult2 (upval)
				local ParseOmniResponseResult = parseOmniResponse(Result)
				
				if not ParseOmniResponseResult then return end
				if #ParseOmniResponseResult.entries < 4 then return end
				if FFlagEnableInGameExitModalNextUpUiRequestCacheModule then
					local Images = {}
					table.insert(Images, ParseOmniResponseResult.entries[1].image)
					table.insert(Images, ParseOmniResponseResult.entries[2].image)
					table.insert(Images, ParseOmniResponseResult.entries[3].image)
					table.insert(Images, ParseOmniResponseResult.entries[4].image)
					ContentProvider:PreloadAsync(Images)
				end
				UseStateResult2(ParseOmniResponseResult)
			end, function(_) end):finally(function()
				-- upvalues: UseStateResult2_1 (upval)
				UseStateResult2_1(false)
			end)
		end)
		
		return function()
			-- upvalues: NewPromise (copy)
			NewPromise:cancel()
		end
	end, {})
	
	return { data = UseStateResult, loading = UseStateResult1 }
end