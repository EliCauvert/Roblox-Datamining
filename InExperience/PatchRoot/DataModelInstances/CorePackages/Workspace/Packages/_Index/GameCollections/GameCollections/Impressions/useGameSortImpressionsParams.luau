local parent = script:FindFirstAncestor("GameCollections").Parent
local reactModule = require(parent.React)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appPage = require(parent.RobloxAppEnums).AppPage
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local roactAnalytics = require(parent.RoactServiceTags).RoactAnalytics
local signal = require(parent.AppCommonLib).Signal
local discoveryTypesModule = require(parent.DiscoveryTypes)
local gameSortLoadSource = require(parent.DiscoveryAvailability).GameSortLoadSource
local reportWarning = require(parent.DiscoveryAnalytics).Points.reportWarning
local loggingProtocolModule = require(parent.LoggingProtocol)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local apportioningDiagnosticTelemetry = require(parent.DiscoveryUtils).ApportioningDiagnosticTelemetry
local gameCollectionItemTypes = discoveryTypesModule.GameCollectionItemTypes
local sendGameImpressionsModule = require(script.Parent.SendGameImpressions)
local fFlagLuaAppAddComponentTypeToSearchImpressions = require(parent.SharedFlags).FFlagLuaAppAddComponentTypeToSearchImpressions
local fFlagLuaAppFixSearchImpressions = require(parent.SharedFlags).FFlagLuaAppFixSearchImpressions
local fFlagLuaAppEnableNxMRoduxApportioning = require(parent.SharedFlags).FFlagLuaAppEnableNxMRoduxApportioning
local fFlagLuaAppEnableNxMApportioningExtraLogging = require(parent.SharedFlags).FFlagLuaAppEnableNxMApportioningExtraLogging

local function _(value, p0) --[[ line: 32 | named "getGameSetTypeId" ]]
	return if value == nil then nil elseif p0 then value.topicId else value.gameSetTypeId
end

local _ = function(value, p1) --[[ line: 44 | named "getGameSetTargetId" ]]
	return if p1 or value == nil then nil else value.gameSetTargetId
end

local _ = function(p2, p3) --[[ line: 54 | named "getAppliedFilters" ]]
	return if p3 or not p2 then nil else p2.appliedFilters
end

return function(p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16) --[[ line: 70 | named "useGameSortImpressionsParams" ]]
	-- upvalues: useRoactService (ref), appEventIngestService (ref), roactAnalytics (ref), appPage (ref), gameSortLoadSource (ref), reactModule (ref), discoveryEventErrorLogger (ref), fFlagLuaAppEnableNxMApportioningExtraLogging (ref), gameCollectionItemTypes (ref), apportioningDiagnosticTelemetry (ref), fFlagLuaAppEnableNxMRoduxApportioning (ref), reportWarning (ref), loggingProtocolModule (ref), sendGameImpressionsModule (ref), fFlagLuaAppAddComponentTypeToSearchImpressions (ref), fFlagLuaAppFixSearchImpressions (ref), signal (ref)
	local var4 = useRoactService(appEventIngestService)
	local var5 = useRoactService(roactAnalytics)
	local var6 = if p7 == appPage.Home and p4 and p4.topicId then gameSortLoadSource.getSortLoadSource(p4.topicId) else nil
	local var7 = if p4 then p4.sortSubId else nil
	local var8 = if p4 then p4.analyticsData else nil
	local var9 = reactModule.useCallback(function(p17) --[[ line: 98 ]]
		-- upvalues: p15 (ref), discoveryEventErrorLogger (copy), p7 (ref), p11 (ref), fFlagLuaAppEnableNxMApportioningExtraLogging (copy), gameCollectionItemTypes (copy), apportioningDiagnosticTelemetry (copy), p6 (ref), p4 (ref), fFlagLuaAppEnableNxMRoduxApportioning (copy), appPage (copy), p16 (ref), reportWarning (copy), loggingProtocolModule (copy), sendGameImpressionsModule (copy), var4 (ref), var5 (ref), p13 (ref), p14 (ref), p8 (ref), fFlagLuaAppAddComponentTypeToSearchImpressions (copy), p9 (ref), p5 (ref), p10 (ref), var6 (ref), var7 (ref), var8 (ref)
		if p15 == nil or #p15 == 0 then
			discoveryEventErrorLogger.reportError("useGameSortImpressionsParams_MissingEntries", "useGameSortImpressionsParams: entries is nil or empty for game sort impressions", { pageContext = p7, gameSortId = p11 })
			
			return
		elseif fFlagLuaAppEnableNxMApportioningExtraLogging then
			local var11 = 0
			local var12 = 0
			local var13 = 0
			local var14 = nil
			local var15 = nil
			
			for i, v in ipairs(p17) do
				if var14 == nil or v < var14 then
					var14 = v
				end
				if var15 == nil or var15 < v then
					var15 = v
				end
				local var16 = p15 and p15[v]
				
				if var16 == nil then
					var13 += 1
				elseif var16.gameCollectionItemTypeOverride == gameCollectionItemTypes.GameCollectionItemType.Blank then
					var11 += 1
				else
					var12 += 1
				end
			end
			apportioningDiagnosticTelemetry.log("ImpressionsBatchSent", {
				batchSize = #p17,
				realTileCount = var12,
				blankCount = var11,
				missingCount = var13,
				firstIndex = var14,
				lastIndex = var15,
				entriesCount = #p15,
				pageContext = p7,
				gameSortId = p11,
				sortIndexOnPage = p6,
				topicId = p4 and p4.topicId,
				nxmApportioningFlagValue = fFlagLuaAppEnableNxMRoduxApportioning
			})
		end
		if p7 == appPage.SearchPage then
			if not p16 then
				reportWarning(loggingProtocolModule.default, "useGameSortImpressionsParams_MissingSearchParams", "useGameSortImpressionsParams: searchParams is nil for search page game sort impressions")
			end
			sendGameImpressionsModule.sendFromSearch(var4, var5, p17, p15, p7, {
				seeAllFlag = 1,
				searchUuid = p16 and p16.searchUuid,
				emphasisFlag = if p16 and p16.hasEmphasizedTile then 1 else 0,
				sortPos = p6,
				gameSetTypeId = p4 and p4.topicId
			}, p13, p14, p8, if fFlagLuaAppAddComponentTypeToSearchImpressions then p9 else nil)
			
			return
		else
			sendGameImpressionsModule.sendFromTopicContents(var4, var5, p17, p15, p7, if p4 ~= nil then nil elseif p5 then p4.topicId else p4.gameSetTypeId, p6, p14, if p5 or p4 == nil then nil else p4.gameSetTargetId, p10, p13, p8, p9, if p5 or not p4 then nil else p4.appliedFilters, var6, nil, var7, var8)
		end
	end, {
		var4, var5, p6, p8, p9, p5, p4, p7, p13, p14, p10, p15, var6, var7, var8,
		if fFlagLuaAppFixSearchImpressions then p16 else nil,
		if fFlagLuaAppFixSearchImpressions then p11 else nil
	})
	local var10 = reactModule.useRef(nil)
	
	if var10.current == nil then
		var10.current = signal.new()
	end
	local current = var10.current
	reactModule.useEffect(function() --[[ line: 234 ]]
		-- upvalues: current (ref), p12 (ref)
		current:fire()
		local var17 = if p12 then p12:connect(function() --[[ line: 243 ]]
			-- upvalues: current (copy)
			current:fire()
		end) else nil
		
		return function() --[[ line: 248 ]]
			-- upvalues: var17 (write)
			if var17 then
				var17:disconnect()
			end
		end
	end, { p12, current })
	
	return var9, current, reactModule.useCallback(function() --[[ line: 255 ]]
		-- upvalues: current (ref)
		current:fire()
	end, { current })
end