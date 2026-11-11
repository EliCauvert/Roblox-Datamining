local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local CryoModule = require(Parent.Cryo)
local SendGameImpressions = require(Parent.GameCollections).SendGameImpressions
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers
local SduiParsers = SduiCoreSystemModule.SduiParsers
local FFlagLuaAppAddComponentTypeToSearchImpressions = require(Parent.SharedFlags).FFlagLuaAppAddComponentTypeToSearchImpressions
local FFlagSduiChartsSupport = require(Parent.SharedFlags).FFlagSduiChartsSupport
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local FFlagSduiGameImpressionsDynamicFields = require(Parent.SharedFlags).FFlagSduiGameImpressionsDynamicFields
local t = {}
local Callback = if FFlagSduiGameImpressionsDynamicFields then function(List)
	if not List or type(List) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, value in List do
		if type(i) == "string" and (type(value) == "string" or type(value) == "number" or type(value) == "boolean") then
			t[i] = tostring(value)
		end
	end
	return if next(t) then t else nil
end else nil

return function(p1, Entry, p2, p3, p4)
	-- upvalues: SduiErrors (copy), t (copy), CryoModule (copy), FFlagSduiGameImpressionsDynamicFields (copy), Callback (ref), SduiParsers (copy), AppPage (copy), SendGameImpressions (copy), FFlagLuaAppAddComponentTypeToSearchImpressions (copy), FFlagSduiExperienceDetailsSupport (copy), FFlagSduiChartsSupport (copy), SduiParseHelpers (copy)
	if not p3 then
		p1.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToLogGameImpressions, {
			name = "SduiGameImpressionsHandler",
			message = "Missing collectionAnalyticsData"
		}, p1.appPage)
		
		return
	end
	local JoinResults = {}
	local P2 = p2 or t
	for _, value in P2 do
		table.insert(JoinResults, (CryoModule.Dictionary.join(value, {
			analyticsData = if FFlagSduiGameImpressionsDynamicFields then Callback(value) or CryoModule.None else nil,
			isSponsored = SduiParsers.safeParseBoolean(value.adFlag or false, p1, t)
		})))
	end
	if #Entry == 0 or #JoinResults == 0 then
		p1.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToLogGameImpressions, {
			name = "SduiGameImpressionsHandler",
			message = `No entries to log: impressionIndexes={#Entry}, gameImpressionEntries={#JoinResults}`
		}, p1.appPage)
		
		return
	end
	local JoinResult = JoinResults[Entry[1]]
	local ItemComponentType = if JoinResult then JoinResult.itemComponentType else "unknown"
	
	if p1.appPage == AppPage.SearchPage then
		SendGameImpressions.sendFromSearch(p1.dependencies.eventIngest, p1.dependencies.appAnalytics, Entry, JoinResults, p1.appPage, {
			emphasisFlag = 0,
			seeAllFlag = 0,
			searchUuid = p3.searchUuid,
			sortPos = p3.collectionPosition,
			gameSetTypeId = tostring(p3.collectionId)
		}, p3.itemsPerRow, p4, if FFlagLuaAppAddComponentTypeToSearchImpressions then p3.isWideTiles or false else nil, if FFlagLuaAppAddComponentTypeToSearchImpressions then ItemComponentType else nil)
		
		return
	end
	if FFlagSduiExperienceDetailsSupport and (p1.appPage == AppPage.ExperienceDetail or p1.appPage == AppPage.GameDetail) then
		SendGameImpressions.sendFromGameDetails(p1.dependencies.eventIngest, p1.dependencies.appAnalytics, Entry, JoinResults, (tostring(p3.refId)))
		
		return
	end
	if FFlagSduiChartsSupport and p3.seeAllFlag then
		SendGameImpressions.sendFromSeeAll(p1.dependencies.eventIngest, p1.dependencies.appAnalytics, Entry, JoinResults, p1.appPage, tostring(p3.collectionId), p3.gameSetTargetId, nil, p3.appliedFilters, p3.isWideTiles or false)
		
		return
	else
		SendGameImpressions.sendFromTopicContents(p1.dependencies.eventIngest, p1.dependencies.appAnalytics, Entry, JoinResults, p1.appPage, tostring(p3.collectionId), p3.collectionPosition, p4, if FFlagSduiChartsSupport then p3.gameSetTargetId else nil, nil, p3.itemsPerRow, p3.isWideTiles or false, ItemComponentType, if FFlagSduiChartsSupport then p3.appliedFilters else nil, nil, function(p5)
			-- upvalues: SduiParseHelpers (upval), p3 (copy), p1 (copy), SduiErrors (upval), ItemComponentType (copy)
			p1.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToLogGameImpressions, {
				name = "SduiGameImpressionsHandler",
				componentType = ItemComponentType,
				message = `Failed to log game impressions. reason: {p5}. analyticsContext: {SduiParseHelpers.stringifyValue(p3)}`
			}, p1.appPage)
		end, nil, if FFlagSduiGameImpressionsDynamicFields then Callback(p3) else nil)
	end
end