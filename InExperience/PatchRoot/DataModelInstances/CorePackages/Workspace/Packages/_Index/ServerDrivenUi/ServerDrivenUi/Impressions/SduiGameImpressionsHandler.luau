local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local cryoModule = require(parent.Cryo)
local sendGameImpressions = require(parent.GameCollections).SendGameImpressions
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiParseHelpers = sduiCoreSystemModule.SduiParseHelpers
local sduiParsers = sduiCoreSystemModule.SduiParsers
local fFlagLuaAppAddComponentTypeToSearchImpressions = require(parent.SharedFlags).FFlagLuaAppAddComponentTypeToSearchImpressions
local fFlagSduiChartsSupport = require(parent.SharedFlags).FFlagSduiChartsSupport
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagSduiSearchResultsPageEnabled = require(parent.SharedFlags).FFlagSduiSearchResultsPageEnabled
local t = {}

local var3 = function(p0) --[[ line: 25 ]]
	if not p0 or type(p0) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in p0 do
		if type(i) == "string" and (type(v) == "string" or type(v) == "number" or type(v) == "boolean") then
			t[i] = tostring(v)
		end
	end
	return if next(t) then t else nil
end

return function(p1, p2, p3, p4, p5) --[[ line: 48 | named "SduiGameImpressionsHandler" ]]
	-- upvalues: sduiErrors (ref), t (ref), cryoModule (ref), var3 (ref), sduiParsers (ref), appPage (ref), fFlagSduiSearchResultsPageEnabled (ref), sendGameImpressions (ref), fFlagLuaAppAddComponentTypeToSearchImpressions (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiChartsSupport (ref), sduiParseHelpers (ref)
	if not p4 then
		p1.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogGameImpressions, {
			name = "SduiGameImpressionsHandler",
			message = "Missing collectionAnalyticsData"
		}, p1.appPage)
		
		return
	end
	local t_1 = {}
	
	for i, v in p3 or t do
		table.insert(t_1, cryoModule.Dictionary.join(v, {
			analyticsData = var3(v) or cryoModule.None,
			isSponsored = sduiParsers.safeParseBoolean(v.adFlag or false, p1, t)
		}))
	end
	if #p2 == 0 or #t_1 == 0 then
		p1.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogGameImpressions, {
			name = "SduiGameImpressionsHandler",
			message = `No entries to log: impressionIndexes={#p2}, gameImpressionEntries={#t_1}`
		}, p1.appPage)
		
		return
	end
	local var6 = t_1[p2[1]]
	local var7 = if var6 then var6.itemComponentType else "unknown"
	
	if p1.appPage == appPage.SearchPage then
		sendGameImpressions.sendFromSearch(p1.dependencies.eventIngest, p1.dependencies.appAnalytics, p2, t_1, p1.appPage, {
			searchUuid = p4.searchUuid,
			emphasisFlag = if fFlagSduiSearchResultsPageEnabled then if p4.hasEmphasizedTile then 1 else 0 else 0,
			seeAllFlag = if fFlagSduiSearchResultsPageEnabled then tonumber(p4.seeAllFlag) or 0 else 0,
			sortPos = p4.collectionPosition,
			gameSetTypeId = tostring(p4.collectionId)
		}, p4.itemsPerRow, p5, if fFlagLuaAppAddComponentTypeToSearchImpressions then p4.isWideTiles or false else nil, if fFlagLuaAppAddComponentTypeToSearchImpressions then var7 else nil)
		
		return
	elseif fFlagSduiExperienceDetailsSupport and (p1.appPage == appPage.ExperienceDetail or p1.appPage == appPage.GameDetail) then
		sendGameImpressions.sendFromGameDetails(p1.dependencies.eventIngest, p1.dependencies.appAnalytics, p2, t_1, tostring(p4.refId))
		
		return
	elseif fFlagSduiChartsSupport and p4.seeAllFlag then
		sendGameImpressions.sendFromSeeAll(p1.dependencies.eventIngest, p1.dependencies.appAnalytics, p2, t_1, p1.appPage, tostring(p4.collectionId), p4.gameSetTargetId, nil, p4.appliedFilters, p4.isWideTiles or false)
		
		return
	end
	sendGameImpressions.sendFromTopicContents(p1.dependencies.eventIngest, p1.dependencies.appAnalytics, p2, t_1, p1.appPage, tostring(p4.collectionId), p4.collectionPosition, p5, if fFlagSduiChartsSupport then p4.gameSetTargetId else nil, nil, p4.itemsPerRow, p4.isWideTiles or false, var7, if fFlagSduiChartsSupport then p4.appliedFilters else nil, nil, function(p6) --[[ line: 150 ]]
		-- upvalues: sduiParseHelpers (copy), p4 (ref), p1 (ref), sduiErrors (copy), var7 (ref)
		p1.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogGameImpressions, {
			name = "SduiGameImpressionsHandler",
			componentType = var7,
			message = `Failed to log game impressions. reason: {p6}. analyticsContext: {sduiParseHelpers.stringifyValue(p4)}`
		}, p1.appPage)
	end, nil, var3(p4))
end