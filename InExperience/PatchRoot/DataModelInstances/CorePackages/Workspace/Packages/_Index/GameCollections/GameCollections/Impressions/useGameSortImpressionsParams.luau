local Parent = script:FindFirstAncestor("GameCollections").Parent
local ReactModule = require(Parent.React)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppPage = require(Parent.RobloxAppEnums).AppPage
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local RoactAnalytics = require(Parent.RoactServiceTags).RoactAnalytics
local Signal = require(Parent.AppCommonLib).Signal
local GameSortLoadSource = require(Parent.DiscoveryAvailability).GameSortLoadSource
local ReportWarningFunction = require(Parent.DiscoveryAnalytics).Points.reportWarning
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local ApportioningDiagnosticTelemetry = require(Parent.DiscoveryUtils).ApportioningDiagnosticTelemetry
local GameCollectionItemTypes = require(Parent.DiscoveryTypes).GameCollectionItemTypes
local SendGameImpressionsModule = require(script.Parent.SendGameImpressions)
local FFlagLuaAppEnableNxMRoduxApportioning = require(Parent.SharedFlags).FFlagLuaAppEnableNxMRoduxApportioning
local FFlagLuaAppEnableNxMApportioningExtraLogging = require(Parent.SharedFlags).FFlagLuaAppEnableNxMApportioningExtraLogging

local function _(p1, p2)
	return if p1 == nil then nil elseif p2 then p1.topicId else p1.gameSetTypeId
end

local _ = function(p1, p2)
	return if p2 or p1 == nil then nil else p1.gameSetTargetId
end

local _ = function(p1, p2)
	return if p2 or not p1 then nil else p1.appliedFilters
end

return function(p1, p2, SortIndexOnPage, PageContext, p3, p4, p5, GameSortId, p6, p7, p8, p9, p10)
	-- upvalues: UseRoactServiceFunction (copy), AppEventIngestService (copy), RoactAnalytics (copy), AppPage (copy), GameSortLoadSource (copy), ReactModule (copy), DiscoveryEventErrorLogger (copy), FFlagLuaAppEnableNxMApportioningExtraLogging (copy), GameCollectionItemTypes (copy), ApportioningDiagnosticTelemetry (copy), FFlagLuaAppEnableNxMRoduxApportioning (copy), ReportWarningFunction (copy), LoggingProtocolModule (copy), SendGameImpressionsModule (copy), Signal (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactAnalytics)
	local SortLoadSource = if PageContext == AppPage.Home and p1 and p1.topicId then GameSortLoadSource.getSortLoadSource(p1.topicId) else nil
	local SortSubId = if p1 then p1.sortSubId else nil
	local AnalyticsData = if p1 then p1.analyticsData else nil
	local UseResult = ReactModule.useCallback(function(List)
		-- upvalues: p9 (copy), DiscoveryEventErrorLogger (upval), PageContext (copy), GameSortId (copy), FFlagLuaAppEnableNxMApportioningExtraLogging (upval), GameCollectionItemTypes (upval), ApportioningDiagnosticTelemetry (upval), SortIndexOnPage (copy), p1 (copy), FFlagLuaAppEnableNxMRoduxApportioning (upval), AppPage (upval), p10 (copy), ReportWarningFunction (upval), LoggingProtocolModule (upval), SendGameImpressionsModule (upval), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), p7 (copy), p8 (copy), p3 (copy), p4 (copy), p2 (copy), p5 (copy), SortLoadSource (copy), SortSubId (copy), AnalyticsData (copy)
		if p9 == nil or #p9 == 0 then
			DiscoveryEventErrorLogger.reportError("useGameSortImpressionsParams_MissingEntries", "useGameSortImpressionsParams: entries is nil or empty for game sort impressions", { pageContext = PageContext, gameSortId = GameSortId })
			
			return
		end
		if FFlagLuaAppEnableNxMApportioningExtraLogging then
			local BlankCount = 0
			local RealTileCount = 0
			local MissingCount = 0
			local FirstIndex = nil
			local LastIndex = nil
			
			for _, value in ipairs(List) do
				if FirstIndex == nil or value < FirstIndex then
					FirstIndex = value
				end
				if LastIndex == nil or LastIndex < value then
					LastIndex = value
				end
				local v1 = p9 and p9[value]
				
				if v1 == nil then
					MissingCount += 1
				elseif v1.gameCollectionItemTypeOverride == GameCollectionItemTypes.GameCollectionItemType.Blank then
					BlankCount += 1
				else
					RealTileCount += 1
				end
			end
			ApportioningDiagnosticTelemetry.log("ImpressionsBatchSent", {
				batchSize = #List,
				realTileCount = RealTileCount,
				blankCount = BlankCount,
				missingCount = MissingCount,
				firstIndex = FirstIndex,
				lastIndex = LastIndex,
				entriesCount = #p9,
				pageContext = PageContext,
				gameSortId = GameSortId,
				sortIndexOnPage = SortIndexOnPage,
				topicId = p1 and p1.topicId,
				nxmApportioningFlagValue = FFlagLuaAppEnableNxMRoduxApportioning
			})
		end
		if PageContext ~= AppPage.SearchPage then
			SendGameImpressionsModule.sendFromTopicContents(UseRoactServiceResult, UseRoactServiceResult1, List, p9, PageContext, if p1 == nil then nil elseif p2 then p1.topicId else p1.gameSetTypeId, SortIndexOnPage, p8, if p2 or p1 == nil then nil else p1.gameSetTargetId, p5, p7, p3, p4, if p2 or not p1 then nil else p1.appliedFilters, SortLoadSource, nil, SortSubId, AnalyticsData)
			
			return
		end
		if not p10 then
			ReportWarningFunction(LoggingProtocolModule.default, "useGameSortImpressionsParams_MissingSearchParams", "useGameSortImpressionsParams: searchParams is nil for search page game sort impressions")
		end
		SendGameImpressionsModule.sendFromSearch(UseRoactServiceResult, UseRoactServiceResult1, List, p9, PageContext, {
			seeAllFlag = 1,
			searchUuid = p10 and p10.searchUuid,
			emphasisFlag = if p10 and p10.hasEmphasizedTile then 1 else 0,
			sortPos = SortIndexOnPage,
			gameSetTypeId = p1 and p1.topicId
		}, p7, p8, p3, p4)
	end, {
		UseRoactServiceResult, UseRoactServiceResult1, SortIndexOnPage, p3, p4, p2,
		p1, PageContext, p7, p8, p5, p9, SortLoadSource, SortSubId, AnalyticsData,
		p10, GameSortId
	})
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		UseRefResult.current = Signal.new()
	end
	local Current = UseRefResult.current
	ReactModule.useEffect(function()
		-- upvalues: Current (copy), p6 (copy)
		Current:fire()
		local Connection = if p6 then p6:connect(function()
			-- upvalues: Current (upval)
			Current:fire()
		end) else nil
		
		return function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:disconnect()
			end
		end
	end, { p6, Current })
	
	return UseResult, Current, (ReactModule.useCallback(function()
		-- upvalues: Current (copy)
		Current:fire()
	end, { Current }))
end