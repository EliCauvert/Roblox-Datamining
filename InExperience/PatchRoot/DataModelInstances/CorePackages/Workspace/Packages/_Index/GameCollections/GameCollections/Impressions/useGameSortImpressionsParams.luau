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

local function _(value, p1)
	return if value == nil then nil elseif p1 then value.topicId else value.gameSetTypeId
end

local _ = function(value, p1)
	return if p1 or value == nil then nil else value.gameSetTargetId
end

local _ = function(p1, p2)
	return if p2 or not p1 then nil else p1.appliedFilters
end

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13)
	-- upvalues: useRoactService (ref), appEventIngestService (ref), roactAnalytics (ref), appPage (ref), gameSortLoadSource (ref), reactModule (ref), discoveryEventErrorLogger (ref), fFlagLuaAppEnableNxMApportioningExtraLogging (ref), gameCollectionItemTypes (ref), apportioningDiagnosticTelemetry (ref), fFlagLuaAppEnableNxMRoduxApportioning (ref), reportWarning (ref), loggingProtocolModule (ref), sendGameImpressionsModule (ref), fFlagLuaAppAddComponentTypeToSearchImpressions (ref), fFlagLuaAppFixSearchImpressions (ref), signal (ref)
	local var1 = useRoactService(appEventIngestService)
	local var2 = useRoactService(roactAnalytics)
	local var3 = if p4 == appPage.Home and p1 and p1.topicId then gameSortLoadSource.getSortLoadSource(p1.topicId) else nil
	local var4 = if p1 then p1.sortSubId else nil
	local var5 = if p1 then p1.analyticsData else nil
	local var6 = reactModule.useCallback(function(p14)
		-- upvalues: p12 (ref), discoveryEventErrorLogger (copy), p4 (ref), p8 (ref), fFlagLuaAppEnableNxMApportioningExtraLogging (copy), gameCollectionItemTypes (copy), apportioningDiagnosticTelemetry (copy), p3 (ref), p1 (ref), fFlagLuaAppEnableNxMRoduxApportioning (copy), appPage (copy), p13 (ref), reportWarning (copy), loggingProtocolModule (copy), sendGameImpressionsModule (copy), var1 (ref), var2 (ref), p10 (ref), p11 (ref), p5 (ref), fFlagLuaAppAddComponentTypeToSearchImpressions (copy), p6 (ref), p2 (ref), p7 (ref), var3 (ref), var4 (ref), var5 (ref)
		if p12 == nil or #p12 == 0 then
			discoveryEventErrorLogger.reportError("useGameSortImpressionsParams_MissingEntries", "useGameSortImpressionsParams: entries is nil or empty for game sort impressions", { pageContext = p4, gameSortId = p8 })
			
			return
		elseif fFlagLuaAppEnableNxMApportioningExtraLogging then
			local var7 = 0
			local var8 = 0
			local var9 = 0
			local var10 = nil
			local var11 = nil
			
			for i, v in ipairs(p14) do
				if var10 == nil or v < var10 then
					var10 = v
				end
				if var11 == nil or var11 < v then
					var11 = v
				end
				local var12 = p12 and p12[v]
				
				if var12 == nil then
					var9 += 1
				elseif var12.gameCollectionItemTypeOverride == gameCollectionItemTypes.GameCollectionItemType.Blank then
					var7 += 1
				else
					var8 += 1
				end
			end
			apportioningDiagnosticTelemetry.log("ImpressionsBatchSent", {
				batchSize = #p14,
				realTileCount = var8,
				blankCount = var7,
				missingCount = var9,
				firstIndex = var10,
				lastIndex = var11,
				entriesCount = #p12,
				pageContext = p4,
				gameSortId = p8,
				sortIndexOnPage = p3,
				topicId = p1 and p1.topicId,
				nxmApportioningFlagValue = fFlagLuaAppEnableNxMRoduxApportioning
			})
		end
		if p4 == appPage.SearchPage then
			if not p13 then
				reportWarning(loggingProtocolModule.default, "useGameSortImpressionsParams_MissingSearchParams", "useGameSortImpressionsParams: searchParams is nil for search page game sort impressions")
			end
			sendGameImpressionsModule.sendFromSearch(var1, var2, p14, p12, p4, {
				seeAllFlag = 1,
				searchUuid = p13 and p13.searchUuid,
				emphasisFlag = if p13 and p13.hasEmphasizedTile then 1 else 0,
				sortPos = p3,
				gameSetTypeId = p1 and p1.topicId
			}, p10, p11, p5, if fFlagLuaAppAddComponentTypeToSearchImpressions then p6 else nil)
			
			return
		else
			sendGameImpressionsModule.sendFromTopicContents(var1, var2, p14, p12, p4, if p1 ~= nil then nil elseif p2 then p1.topicId else p1.gameSetTypeId, p3, p11, if p2 or p1 == nil then nil else p1.gameSetTargetId, p7, p10, p5, p6, if p2 or not p1 then nil else p1.appliedFilters, var3, nil, var4, var5)
		end
	end, {
		var1, var2, p3, p5, p6, p2, p1, p4, p10, p11, p7, p12, var3, var4, var5,
		if fFlagLuaAppFixSearchImpressions then p13 else nil,
		if fFlagLuaAppFixSearchImpressions then p8 else nil
	})
	local var13 = reactModule.useRef(nil)
	
	if var13.current == nil then
		var13.current = signal.new()
	end
	local current = var13.current
	reactModule.useEffect(function()
		-- upvalues: current (ref), p9 (ref)
		current:fire()
		local var14 = if p9 then p9:connect(function()
			-- upvalues: current (copy)
			current:fire()
		end) else nil
		
		return function()
			-- upvalues: var14 (write)
			if var14 then
				var14:disconnect()
			end
		end
	end, { p9, current })
	
	return var6, current, reactModule.useCallback(function()
		-- upvalues: current (ref)
		current:fire()
	end, { current })
end