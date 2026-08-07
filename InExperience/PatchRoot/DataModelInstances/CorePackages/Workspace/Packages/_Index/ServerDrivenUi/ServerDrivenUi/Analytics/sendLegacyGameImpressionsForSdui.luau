local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local cryoModule = require(parent.Cryo)
local sendGameImpressions = require(parent.GameCollections).SendGameImpressions
local _ = require(parent.UnifiedLogging)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiBuilder = sduiCoreSystemModule.SduiBuilder
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiParsers = sduiCoreSystemModule.SduiParsers
local sduiParseHelpers = sduiCoreSystemModule.SduiParseHelpers
local findAnalyticsFieldInAncestors = sduiCoreSystemModule.findAnalyticsFieldInAncestors
local appPage = require(parent.RobloxAppEnums).AppPage
local _ = require(parent.DiscoveryTypes)
local fFlagLuaAppAddComponentTypeToSearchImpressions = require(parent.SharedFlags).FFlagLuaAppAddComponentTypeToSearchImpressions
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local t = {}

return function(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9) --[[ line: 30 | named "sendLegacyGameImpressionsForSdui" ]]
	-- upvalues: t (ref), cryoModule (ref), sduiParsers (ref), sduiBuilder (ref), appPage (ref), findAnalyticsFieldInAncestors (ref), sendGameImpressions (ref), fFlagLuaAppAddComponentTypeToSearchImpressions (ref), fFlagSduiExperienceDetailsSupport (ref), sduiParseHelpers (ref), sduiErrors (ref)
	local t_1 = {}
	
	for i, v in p1 or t do
		table.insert(t_1, cryoModule.Dictionary.join(v, {
			isSponsored = sduiParsers.safeParseBoolean(v.adFlag or false, p6, p3)
		}))
	end
	if #t_1 > 0 and #p0 > 0 then
		local var4 = if t_1[p0[1]] then t_1[p0[1]].itemComponentType else "unknown"
		local var5 = nil
		local var6 = p2[p0[1]]
		
		if var6 then
			local componentType = sduiBuilder.getComponentType(var6, p6)
			var5 = (if componentType ~= "Tile" then componentType == "GameTile" else true) and (var6.props and (var6.props.imageAspectRatio or 0) > 1)
		end
		if p7 then
			p7(p0, t_1, p4.itemsPerRow, p5, var5)
			
			return
		elseif p6.appPage == appPage.SearchPage then
			sendGameImpressions.sendFromSearch(p6.dependencies.eventIngest, p6.dependencies.appAnalytics, p0, t_1, p6.appPage, {
				emphasisFlag = 0,
				seeAllFlag = 0,
				searchUuid = findAnalyticsFieldInAncestors("searchUuid", p3),
				sortPos = p4.collectionPosition,
				gameSetTypeId = tostring(p4.collectionId)
			}, p8, p5, if fFlagLuaAppAddComponentTypeToSearchImpressions then var5 or false else nil, if fFlagLuaAppAddComponentTypeToSearchImpressions then var4 else nil)
			
			return
		elseif fFlagSduiExperienceDetailsSupport and (p6.appPage == appPage.ExperienceDetail or p6.appPage == appPage.GameDetail) then
			sendGameImpressions.sendFromGameDetails(p6.dependencies.eventIngest, p6.dependencies.appAnalytics, p0, t_1, tostring(p4.refId))
			
			return
		end
		sendGameImpressions.sendFromTopicContents(p6.dependencies.eventIngest, p6.dependencies.appAnalytics, p0, t_1, p6.appPage, tostring(p4.collectionId), p4.collectionPosition, p5, nil, nil, p8, var5 or false, var4, nil, nil, function(p10) --[[ line: 135 ]]
			-- upvalues: p3 (ref), sduiParseHelpers (copy), p6 (ref), sduiErrors (copy), var4 (ref), p9 (ref)
			p6.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogGameImpressions, {
				componentType = var4,
				name = p9,
				message = `Failed to log game impressions. reason: {p10}. analyticsContext: {if p3 then sduiParseHelpers.stringifyValue(p3.analyticsData) else nil}`
			}, p6.appPage)
		end, nil)
	end
end