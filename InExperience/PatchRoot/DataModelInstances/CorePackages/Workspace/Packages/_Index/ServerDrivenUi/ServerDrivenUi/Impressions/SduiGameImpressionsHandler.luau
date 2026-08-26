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

local var1 = function(p1)
	if not p1 or type(p1) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in p1 do
		if type(i) == "string" and (type(v) == "string" or type(v) == "number" or type(v) == "boolean") then
			t[i] = tostring(v)
		end
	end
	return if next(t) then t else nil
end

return function(p2, p3, p4, p5, p6)
	-- upvalues: sduiErrors (ref), t (ref), cryoModule (ref), var1 (ref), sduiParsers (ref), appPage (ref), fFlagSduiSearchResultsPageEnabled (ref), sendGameImpressions (ref), fFlagLuaAppAddComponentTypeToSearchImpressions (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiChartsSupport (ref), sduiParseHelpers (ref)
	if not p5 then
		p2.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogGameImpressions, {
			name = "SduiGameImpressionsHandler",
			message = "Missing collectionAnalyticsData"
		}, p2.appPage)
		
		return
	end
	local t_1 = {}
	
	for i, v in p4 or t do
		table.insert(t_1, cryoModule.Dictionary.join(v, {
			analyticsData = var1(v) or cryoModule.None,
			isSponsored = sduiParsers.safeParseBoolean(v.adFlag or false, p2, t)
		}))
	end
	if #p3 == 0 or #t_1 == 0 then
		p2.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogGameImpressions, {
			name = "SduiGameImpressionsHandler",
			message = `No entries to log: impressionIndexes={#p3}, gameImpressionEntries={#t_1}`
		}, p2.appPage)
		
		return
	end
	local var2 = t_1[p3[1]]
	local var3 = if var2 then var2.itemComponentType else "unknown"
	
	if p2.appPage == appPage.SearchPage then
		sendGameImpressions.sendFromSearch(p2.dependencies.eventIngest, p2.dependencies.appAnalytics, p3, t_1, p2.appPage, {
			searchUuid = p5.searchUuid,
			emphasisFlag = if fFlagSduiSearchResultsPageEnabled then if p5.hasEmphasizedTile then 1 else 0 else 0,
			seeAllFlag = if fFlagSduiSearchResultsPageEnabled then tonumber(p5.seeAllFlag) or 0 else 0,
			sortPos = p5.collectionPosition,
			gameSetTypeId = tostring(p5.collectionId)
		}, p5.itemsPerRow, p6, if fFlagLuaAppAddComponentTypeToSearchImpressions then p5.isWideTiles or false else nil, if fFlagLuaAppAddComponentTypeToSearchImpressions then var3 else nil)
		
		return
	elseif fFlagSduiExperienceDetailsSupport and (p2.appPage == appPage.ExperienceDetail or p2.appPage == appPage.GameDetail) then
		sendGameImpressions.sendFromGameDetails(p2.dependencies.eventIngest, p2.dependencies.appAnalytics, p3, t_1, tostring(p5.refId))
		
		return
	elseif fFlagSduiChartsSupport and p5.seeAllFlag then
		sendGameImpressions.sendFromSeeAll(p2.dependencies.eventIngest, p2.dependencies.appAnalytics, p3, t_1, p2.appPage, tostring(p5.collectionId), p5.gameSetTargetId, nil, p5.appliedFilters, p5.isWideTiles or false)
		
		return
	end
	sendGameImpressions.sendFromTopicContents(p2.dependencies.eventIngest, p2.dependencies.appAnalytics, p3, t_1, p2.appPage, tostring(p5.collectionId), p5.collectionPosition, p6, if fFlagSduiChartsSupport then p5.gameSetTargetId else nil, nil, p5.itemsPerRow, p5.isWideTiles or false, var3, if fFlagSduiChartsSupport then p5.appliedFilters else nil, nil, function(p7)
		-- upvalues: sduiParseHelpers (copy), p5 (ref), p2 (ref), sduiErrors (copy), var3 (ref)
		p2.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogGameImpressions, {
			name = "SduiGameImpressionsHandler",
			componentType = var3,
			message = `Failed to log game impressions. reason: {p7}. analyticsContext: {sduiParseHelpers.stringifyValue(p5)}`
		}, p2.appPage)
	end, nil, var1(p5))
end