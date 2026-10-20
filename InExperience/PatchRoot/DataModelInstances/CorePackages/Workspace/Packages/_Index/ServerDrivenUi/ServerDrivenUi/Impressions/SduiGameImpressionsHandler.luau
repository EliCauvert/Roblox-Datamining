local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local CryoModule = require(Parent.Cryo)
local SendGameImpressions = require(Parent.GameCollections).SendGameImpressions
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers
local SduiParsers = SduiCoreSystemModule.SduiParsers
local FFlagSduiSearchResultsPageEnabled = require(Parent.SharedFlags).FFlagSduiSearchResultsPageEnabled
local FFlagSduiFixSearchTelemetry = require(Parent.SharedFlags).FFlagSduiFixSearchTelemetry
local FFlagLuaAppSponsoredGamePreviewVideo = require(Parent.SharedFlags).FFlagLuaAppSponsoredGamePreviewVideo
local FFlagLuaAppSduiPassSortSubId = require(Parent.SharedFlags).FFlagLuaAppSduiPassSortSubId
local t = {}
local FilterAndStringifyAnalyticsDataModule = nil
FilterAndStringifyAnalyticsDataModule = if require(Parent.SharedFlags).FFlagSduiForwardAnalyticsDataToGameClick then require(ServerDrivenUi.Analytics.filterAndStringifyAnalyticsData) else function(List)
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
end

return function(p1, Entry, p2, p3, p4)
	-- upvalues: SduiErrors (copy), FFlagSduiFixSearchTelemetry (copy), t (copy), CryoModule (copy), FilterAndStringifyAnalyticsDataModule (ref), SduiParsers (copy), FFlagLuaAppSponsoredGamePreviewVideo (copy), AppPage (copy), FFlagSduiSearchResultsPageEnabled (copy), SendGameImpressions (copy), SduiParseHelpers (copy), FFlagLuaAppSduiPassSortSubId (copy)
	if not p3 then
		p1.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToLogGameImpressions, {
			name = "SduiGameImpressionsHandler",
			message = "Missing collectionAnalyticsData"
		}, p1.appPage)
		
		return
	end
	local JoinResults = {}
	local Count = if FFlagSduiFixSearchTelemetry then 0 else nil
	local P2 = p2 or t
	for i, value in P2 do
		local JoinResult = CryoModule.Dictionary.join(value, {
			analyticsData = FilterAndStringifyAnalyticsDataModule(value) or CryoModule.None,
			isSponsored = SduiParsers.safeParseBoolean(value.adFlag or false, p1, t),
			gameCollectionItemTypeOverride = if FFlagSduiFixSearchTelemetry then value.tileType else nil,
			sponsoredGamePreviewVideoEligible = if FFlagLuaAppSponsoredGamePreviewVideo then SduiParsers.safeParseBoolean(value.sponsoredGamePreviewVideoEligible or false, p1, t) else nil
		})
		
		if FFlagSduiFixSearchTelemetry then
			JoinResults[i] = JoinResult
			Count += 1
		else
			table.insert(JoinResults, JoinResult)
		end
	end
	if #Entry == 0 or (if FFlagSduiFixSearchTelemetry then Count == 0 else #JoinResults == 0) then
		p1.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToLogGameImpressions, {
			name = "SduiGameImpressionsHandler",
			message = `No entries to log: impressionIndexes={#Entry}, gameImpressionEntries={if FFlagSduiFixSearchTelemetry then Count else #JoinResults}`
		}, p1.appPage)
		
		return
	end
	local JoinResult = JoinResults[Entry[1]]
	local ItemComponentType = if JoinResult then JoinResult.itemComponentType else "unknown"
	
	if p1.appPage == AppPage.SearchPage then
		SendGameImpressions.sendFromSearch(p1.dependencies.eventIngest, p1.dependencies.appAnalytics, Entry, JoinResults, p1.appPage, {
			searchUuid = p3.searchUuid,
			emphasisFlag = if FFlagSduiSearchResultsPageEnabled and p3.hasEmphasizedTile then 1 else 0,
			seeAllFlag = FFlagSduiSearchResultsPageEnabled and tonumber(p3.seeAllFlag) or 0,
			sortPos = p3.collectionPosition,
			gameSetTypeId = tostring(p3.collectionId)
		}, p3.itemsPerRow, p4, p3.isWideTiles or false, ItemComponentType)
		
		return
	end
	if p1.appPage == AppPage.ExperienceDetail or p1.appPage == AppPage.GameDetail then
		SendGameImpressions.sendFromGameDetails(p1.dependencies.eventIngest, p1.dependencies.appAnalytics, Entry, JoinResults, (tostring(p3.refId)))
		
		return
	end
	if p3.seeAllFlag then
		SendGameImpressions.sendFromSeeAll(p1.dependencies.eventIngest, p1.dependencies.appAnalytics, Entry, JoinResults, p1.appPage, tostring(p3.collectionId), p3.gameSetTargetId, nil, p3.appliedFilters, p3.isWideTiles or false)
		
		return
	else
		SendGameImpressions.sendFromTopicContents(p1.dependencies.eventIngest, p1.dependencies.appAnalytics, Entry, JoinResults, p1.appPage, tostring(p3.collectionId), p3.collectionPosition, p4, p3.gameSetTargetId, nil, p3.itemsPerRow, p3.isWideTiles or false, ItemComponentType, p3.appliedFilters, nil, function(p5)
			-- upvalues: SduiParseHelpers (upval), p3 (copy), p1 (copy), SduiErrors (upval), ItemComponentType (copy)
			p1.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToLogGameImpressions, {
				name = "SduiGameImpressionsHandler",
				componentType = ItemComponentType,
				message = `Failed to log game impressions. reason: {p5}. analyticsContext: {SduiParseHelpers.stringifyValue(p3)}`
			}, p1.appPage)
		end, if FFlagLuaAppSduiPassSortSubId and p3.sortSubId then tostring(p3.sortSubId) else nil, FilterAndStringifyAnalyticsDataModule(p3))
	end
end