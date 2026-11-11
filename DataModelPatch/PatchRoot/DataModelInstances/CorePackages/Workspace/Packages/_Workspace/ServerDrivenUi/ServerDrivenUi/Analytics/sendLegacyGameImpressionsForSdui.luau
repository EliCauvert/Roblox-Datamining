local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local CryoModule = require(Parent.Cryo)
local SendGameImpressions = require(Parent.GameCollections).SendGameImpressions
local _ = require(Parent.UnifiedLogging)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiBuilder = SduiCoreSystemModule.SduiBuilder
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiParsers = SduiCoreSystemModule.SduiParsers
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers
local FindAnalyticsFieldInAncestorsFunction = SduiCoreSystemModule.findAnalyticsFieldInAncestors
local AppPage = require(Parent.RobloxAppEnums).AppPage
local _ = require(Parent.DiscoveryTypes)
local FFlagLuaAppAddComponentTypeToSearchImpressions = require(Parent.SharedFlags).FFlagLuaAppAddComponentTypeToSearchImpressions
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local t = {}

return function(Entry, p1, p2, p3, p4, p5, p6, Callback: (any, any, any, any, any) -> (), p7, Name)
	-- upvalues: t (copy), CryoModule (copy), SduiParsers (copy), SduiBuilder (copy), AppPage (copy), FindAnalyticsFieldInAncestorsFunction (copy), SendGameImpressions (copy), FFlagLuaAppAddComponentTypeToSearchImpressions (copy), FFlagSduiExperienceDetailsSupport (copy), SduiParseHelpers (copy), SduiErrors (copy)
	local JoinResults = {}
	local P0 = p1 or t
	for _, value in P0 do
		table.insert(JoinResults, (CryoModule.Dictionary.join(value, {
			isSponsored = SduiParsers.safeParseBoolean(value.adFlag or false, p6, p3)
		})))
	end
	if #JoinResults > 0 and #Entry > 0 then
		local ItemComponentType = JoinResults[Entry[1]] and JoinResults[Entry[1]].itemComponentType or "unknown"
		local v1: boolean? = nil
		local v2 = p2[Entry[1]]
		
		if v2 then
			local ComponentType = SduiBuilder.getComponentType(v2, p6)
			local v3: boolean = v2.props and (v2.props.imageAspectRatio or 0) > 1
			v1 = (ComponentType == "Tile" or ComponentType == "GameTile") and v3
		end
		if Callback then
			Callback(Entry, JoinResults, p4.itemsPerRow, p5, v1)
			
			return
		end
		if p6.appPage == AppPage.SearchPage then
			SendGameImpressions.sendFromSearch(p6.dependencies.eventIngest, p6.dependencies.appAnalytics, Entry, JoinResults, p6.appPage, {
				emphasisFlag = 0,
				seeAllFlag = 0,
				searchUuid = FindAnalyticsFieldInAncestorsFunction("searchUuid", p3),
				sortPos = p4.collectionPosition,
				gameSetTypeId = tostring(p4.collectionId)
			}, p7, p5, if FFlagLuaAppAddComponentTypeToSearchImpressions then v1 or false else nil, if FFlagLuaAppAddComponentTypeToSearchImpressions then ItemComponentType else nil)
			
			return
		end
		if FFlagSduiExperienceDetailsSupport and (p6.appPage == AppPage.ExperienceDetail or p6.appPage == AppPage.GameDetail) then
			SendGameImpressions.sendFromGameDetails(p6.dependencies.eventIngest, p6.dependencies.appAnalytics, Entry, JoinResults, (tostring(p4.refId)))
			
			return
		end
		SendGameImpressions.sendFromTopicContents(p6.dependencies.eventIngest, p6.dependencies.appAnalytics, Entry, JoinResults, p6.appPage, tostring(p4.collectionId), p4.collectionPosition, p5, nil, nil, p7, v1 or false, ItemComponentType, nil, nil, function(p8)
			-- upvalues: p3 (copy), SduiParseHelpers (upval), p6 (copy), SduiErrors (upval), ItemComponentType (copy), Name (copy)
			p6.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToLogGameImpressions, {
				componentType = ItemComponentType,
				name = Name,
				message = `Failed to log game impressions. reason: {p8}. analyticsContext: {if p3 then SduiParseHelpers.stringifyValue(p3.analyticsData) else nil}`
			}, p6.appPage)
		end, nil)
	end
end