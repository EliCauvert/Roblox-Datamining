local parent = script:FindFirstAncestor("GameCollections").Parent
local reactModule = require(parent.React)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appPage = require(parent.RobloxAppEnums).AppPage
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local roactAnalytics = require(parent.RoactServiceTags).RoactAnalytics
local signal = require(parent.AppCommonLib).Signal
local _ = require(parent.DiscoveryTypes)
local gameSortLoadSource = require(parent.DiscoveryAvailability).GameSortLoadSource
local reportWarning = require(parent.DiscoveryAnalytics).Points.reportWarning
local loggingProtocolModule = require(parent.LoggingProtocol)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local sendGameImpressionsModule = require(script.Parent.SendGameImpressions)
local fFlagLuaAppAddComponentTypeToSearchImpressions = require(parent.SharedFlags).FFlagLuaAppAddComponentTypeToSearchImpressions
local fFlagLuaAppAddSubIdToHomeEvents = require(parent.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents
local fFlagLuaAppFixSearchImpressions = require(parent.SharedFlags).FFlagLuaAppFixSearchImpressions

local function _(value, p0) --[[ line: 28 | named "getGameSetTypeId" ]]
	return if value == nil then nil elseif p0 then value.topicId else value.gameSetTypeId
end

local _ = function(value, p1) --[[ line: 40 | named "getGameSetTargetId" ]]
	return if p1 or value == nil then nil else value.gameSetTargetId
end

local _ = function(p2, p3) --[[ line: 50 | named "getAppliedFilters" ]]
	return if p3 or not p2 then nil else p2.appliedFilters
end

return function(p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16) --[[ line: 66 | named "useGameSortImpressionsParams" ]]
	-- upvalues: useRoactService (ref), appEventIngestService (ref), roactAnalytics (ref), appPage (ref), gameSortLoadSource (ref), fFlagLuaAppAddSubIdToHomeEvents (ref), reactModule (ref), discoveryEventErrorLogger (ref), reportWarning (ref), loggingProtocolModule (ref), sendGameImpressionsModule (ref), fFlagLuaAppAddComponentTypeToSearchImpressions (ref), fFlagLuaAppFixSearchImpressions (ref), signal (ref)
	local var3 = useRoactService(appEventIngestService)
	local var4 = useRoactService(roactAnalytics)
	local var5 = if p7 == appPage.Home and p4 and p4.topicId then gameSortLoadSource.getSortLoadSource(p4.topicId) else nil
	local var6 = if fFlagLuaAppAddSubIdToHomeEvents and p4 then p4.sortSubId else nil
	local var7 = if p4 then p4.analyticsData else nil
	local var8 = reactModule.useCallback(function(p17) --[[ line: 94 ]]
		-- upvalues: p15 (ref), discoveryEventErrorLogger (copy), p7 (ref), p11 (ref), appPage (copy), p16 (ref), reportWarning (copy), loggingProtocolModule (copy), p6 (ref), p4 (ref), sendGameImpressionsModule (copy), var3 (ref), var4 (ref), p13 (ref), p14 (ref), p8 (ref), fFlagLuaAppAddComponentTypeToSearchImpressions (copy), p9 (ref), p5 (ref), p10 (ref), var5 (ref), fFlagLuaAppAddSubIdToHomeEvents (copy), var6 (ref), var7 (ref)
		if p15 == nil or #p15 == 0 then
			discoveryEventErrorLogger.reportError("useGameSortImpressionsParams_MissingEntries", "useGameSortImpressionsParams: entries is nil or empty for game sort impressions", { pageContext = p7, gameSortId = p11 })
			
			return
		elseif p7 == appPage.SearchPage then
			if not p16 then
				reportWarning(loggingProtocolModule.default, "useGameSortImpressionsParams_MissingSearchParams", "useGameSortImpressionsParams: searchParams is nil for search page game sort impressions")
			end
			sendGameImpressionsModule.sendFromSearch(var3, var4, p17, p15, p7, {
				seeAllFlag = 1,
				searchUuid = p16 and p16.searchUuid,
				emphasisFlag = if p16 and p16.hasEmphasizedTile then 1 else 0,
				sortPos = p6,
				gameSetTypeId = p4 and p4.topicId
			}, p13, p14, p8, if fFlagLuaAppAddComponentTypeToSearchImpressions then p9 else nil)
			
			return
		else
			sendGameImpressionsModule.sendFromTopicContents(var3, var4, p17, p15, p7, if p4 ~= nil then nil elseif p5 then p4.topicId else p4.gameSetTypeId, p6, p14, if p5 or p4 == nil then nil else p4.gameSetTargetId, p10, p13, p8, p9, if p5 or not p4 then nil else p4.appliedFilters, var5, nil, if fFlagLuaAppAddSubIdToHomeEvents then var6 else nil, var7)
		end
	end, {
		var3, var4, p6, p8, p9, p5, p4, p7, p13, p14, p10, p15, var5,
		if fFlagLuaAppAddSubIdToHomeEvents then var6 else nil, var7,
		if fFlagLuaAppFixSearchImpressions then p16 else nil,
		if fFlagLuaAppFixSearchImpressions then p11 else nil
	})
	local var9 = reactModule.useRef(nil)
	
	if var9.current == nil then
		var9.current = signal.new()
	end
	local current = var9.current
	reactModule.useEffect(function() --[[ line: 190 ]]
		-- upvalues: current (ref), p12 (ref)
		current:fire()
		local var10 = if p12 then p12:connect(function() --[[ line: 199 ]]
			-- upvalues: current (copy)
			current:fire()
		end) else nil
		
		return function() --[[ line: 204 ]]
			-- upvalues: var10 (write)
			if var10 then
				var10:disconnect()
			end
		end
	end, { p12, current })
	
	return var8, current, reactModule.useCallback(function() --[[ line: 211 ]]
		-- upvalues: current (ref)
		current:fire()
	end, { current })
end