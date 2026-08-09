local corePackagesService = game:GetService("CorePackages")
local httpService = game:GetService("HttpService")
local contentProviderService = game:GetService("ContentProvider")
local requestInternalWrapper = require(corePackagesService.Workspace.Packages.Http).NetworkLayers.requestInternalWrapper
local makeOmniRecommendationsRequest = require(corePackagesService.Workspace.Packages.GraphQlShared).MakeOmniRecommendationsRequest
local reactModule = require(corePackagesService.Packages.React)
local tModule = require(corePackagesService.Packages.t)
local promiseModule = require(corePackagesService.Packages.Promise)
local telemetryModule = require(script.Parent.Telemetry)
local fFlagEnableInGameExitModalNextUpUiRequestCacheModule = require(script.Parent.Flags.FFlagEnableInGameExitModalNextUpUiRequestCache)
local var8 = requestInternalWrapper(nil)
local inGameExitModalNextUpUiSortTopicId = game:DefineFastString("InGameExitModalNextUpUiSortTopicId", "100000014")
local inGameExitModalEnableFilterForCurrentExperience = game:DefineFastFlag("InGameExitModalEnableFilterForCurrentExperience", false)

local function metadataToSortEntry(p0, p1, p2) --[[ line: 46 ]]
	local wideImageAssetId = (((p2.layoutDataBySort or {})[p0] or {}).primaryMediaAsset or {}).wideImageAssetId
	
	return {
		uiIndex = p1,
		universeId = tostring(p2.universeId),
		placeId = tostring(p2.rootPlaceId),
		name = p2.name,
		image = if wideImageAssetId and wideImageAssetId ~= "0" then `rbxthumb://type=Asset&id={wideImageAssetId}&w=384&h=216` else `rbxthumb://type=GameThumbnail&id={p2.rootPlaceId}&w=384&h=216`,
		upVotes = p2.totalUpVotes,
		downVotes = p2.totalDownVotes,
		layoutDataBySort = p2.layoutDataBySort or {}
	}
end

local var12 = tModule.interface({ contentType = tModule.string, contentId = tModule.number })
local var13 = tModule.interface({
	name = tModule.string,
	universeId = tModule.number,
	rootPlaceId = tModule.number,
	totalUpVotes = tModule.number,
	totalDownVotes = tModule.number,
	layoutDataBySort = tModule.optional(tModule.table)
})

local function parseSortEntries(p3, p4) --[[ line: 88 ]]
	-- upvalues: var12 (ref), var13 (ref), metadataToSortEntry (ref), inGameExitModalEnableFilterForCurrentExperience (ref)
	local t = {}
	
	for i, v in p3.recommendationList do
		if var12(v) and v.contentType == "Game" then
			local contentId = p4[tostring(v.contentId)]
			
			if var13(contentId) then
				local var19 = metadataToSortEntry(p3.topicId, #t + 1, contentId)
				
				if var19 and (not inGameExitModalEnableFilterForCurrentExperience or var19.universeId ~= tostring(game.GameId)) then
					table.insert(t, var19)
				end
			end
		end
	end
	return t
end

local var15 = tModule.interface({
	responseBody = tModule.interface({
		sorts = tModule.table,
		contentMetadata = tModule.interface({ Game = tModule.table })
	}),
	responseTimeMs = tModule.number
})
local var16 = tModule.interface({
	topicId = tModule.number,
	recommendationList = tModule.table
})

local function parseOmniResponse(p5) --[[ line: 135 ]]
	-- upvalues: var15 (ref), telemetryModule (ref), var16 (ref), inGameExitModalNextUpUiSortTopicId (ref), parseSortEntries (ref)
	if not var15(p5) then
		return nil
	end
	telemetryModule.logRequestLatency("discovery-api/omni-recommendation", p5.responseTimeMs)
	local responseBody = p5.responseBody
	local var20 = if responseBody.contentMetadata then responseBody.contentMetadata.Game else nil
	
	for i, v in responseBody.sorts do
		if var16(v) and tostring(v.topicId) == inGameExitModalNextUpUiSortTopicId then
			return {
				entries = parseSortEntries(v, var20),
				topicId = tostring(v.topicId)
			}
		end
	end
	return nil
end

return function() --[[ line: 168 ]]
	-- upvalues: reactModule (ref), promiseModule (ref), makeOmniRecommendationsRequest (ref), var8 (ref), httpService (ref), inGameExitModalNextUpUiSortTopicId (ref), parseOmniResponse (ref), fFlagEnableInGameExitModalNextUpUiRequestCacheModule (ref), contentProviderService (ref)
	local var21, var22 = reactModule.useState(nil)
	local var23, var24 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 173 ]]
		-- upvalues: var24 (ref), var22 (ref), promiseModule (copy), makeOmniRecommendationsRequest (copy), var8 (copy), httpService (copy), inGameExitModalNextUpUiSortTopicId (copy), parseOmniResponse (copy), fFlagEnableInGameExitModalNextUpUiRequestCacheModule (copy), contentProviderService (copy)
		var24(true)
		var22(nil)
		local var25 = promiseModule.new(function(_, _, p6) --[[ line: 177 ]]
			-- upvalues: makeOmniRecommendationsRequest (copy), var8 (copy), httpService (copy), inGameExitModalNextUpUiSortTopicId (copy), parseOmniResponse (copy), fFlagEnableInGameExitModalNextUpUiRequestCacheModule (copy), contentProviderService (copy), var22 (copy), var24 (copy)
			local var26 = makeOmniRecommendationsRequest(var8, "InGameExitModal", httpService:GenerateGUID(false):lower(), nil, { "Carousel", "SortlessGrid" }, "gameExitRecommendation", { inGameExitModalNextUpUiSortTopicId }, nil)
			p6(function() --[[ line: 189 ]]
				-- upvalues: var26 (ref)
				var26:cancel()
			end)
			var26:andThen(function(p7) --[[ line: 194 ]]
				-- upvalues: parseOmniResponse (copy), fFlagEnableInGameExitModalNextUpUiRequestCacheModule (copy), contentProviderService (copy), var22 (copy)
				local var27 = parseOmniResponse(p7)
				
				if not var27 then return end
				if #var27.entries < 4 then return end
				if fFlagEnableInGameExitModalNextUpUiRequestCacheModule then
					local t = {}
					table.insert(t, var27.entries[1].image)
					table.insert(t, var27.entries[2].image)
					table.insert(t, var27.entries[3].image)
					table.insert(t, var27.entries[4].image)
					contentProviderService:PreloadAsync(t)
				end
				var22(var27)
			end, function(_) --[[ line: 213 ]] end):finally(function() --[[ line: 216 ]]
				-- upvalues: var24 (copy)
				var24(false)
			end)
		end)
		
		return function() --[[ line: 221 ]]
			-- upvalues: var25 (ref)
			var25:cancel()
		end
	end, {})
	
	return { data = var21, loading = var23 }
end