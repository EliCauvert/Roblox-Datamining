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
local fFlagSduiFixSearchTelemetry = require(parent.SharedFlags).FFlagSduiFixSearchTelemetry
local t = {}

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
	-- upvalues: fFlagSduiFixSearchTelemetry (ref), t (ref), cryoModule (ref), sduiParsers (ref), sduiBuilder (ref), appPage (ref), findAnalyticsFieldInAncestors (ref), sendGameImpressions (ref), fFlagLuaAppAddComponentTypeToSearchImpressions (ref), fFlagSduiExperienceDetailsSupport (ref), sduiParseHelpers (ref), sduiErrors (ref)
	local t_1 = {}
	local var1 = if fFlagSduiFixSearchTelemetry then 0 else nil
	
	for i, v in p2 or t do
		local var2 = cryoModule.Dictionary.join(v, {
			isSponsored = sduiParsers.safeParseBoolean(v.adFlag or false, p7, p4),
			gameCollectionItemTypeOverride = if fFlagSduiFixSearchTelemetry then v.tileType else nil
		})
		
		if fFlagSduiFixSearchTelemetry then
			t_1[i] = var2
			var1 += 1
		else
			table.insert(t_1, var2)
		end
	end
	if (if fFlagSduiFixSearchTelemetry then var1 else #t_1) > 0 and #p1 > 0 then
		local var3 = if t_1[p1[1]] then t_1[p1[1]].itemComponentType else "unknown"
		local var4 = nil
		local var5 = p3[p1[1]]
		
		if var5 then
			local componentType = sduiBuilder.getComponentType(var5, p7)
			var4 = (if componentType ~= "Tile" then componentType == "GameTile" else true) and (var5.props and (var5.props.imageAspectRatio or 0) > 1)
		end
		if p8 then
			p8(p1, t_1, p5.itemsPerRow, p6, var4)
			
			return
		elseif p7.appPage == appPage.SearchPage then
			sendGameImpressions.sendFromSearch(p7.dependencies.eventIngest, p7.dependencies.appAnalytics, p1, t_1, p7.appPage, {
				emphasisFlag = 0,
				seeAllFlag = 0,
				searchUuid = findAnalyticsFieldInAncestors("searchUuid", p4),
				sortPos = p5.collectionPosition,
				gameSetTypeId = tostring(p5.collectionId)
			}, p9, p6, if fFlagLuaAppAddComponentTypeToSearchImpressions then var4 or false else nil, if fFlagLuaAppAddComponentTypeToSearchImpressions then var3 else nil)
			
			return
		elseif fFlagSduiExperienceDetailsSupport and (p7.appPage == appPage.ExperienceDetail or p7.appPage == appPage.GameDetail) then
			sendGameImpressions.sendFromGameDetails(p7.dependencies.eventIngest, p7.dependencies.appAnalytics, p1, t_1, tostring(p5.refId))
			
			return
		end
		sendGameImpressions.sendFromTopicContents(p7.dependencies.eventIngest, p7.dependencies.appAnalytics, p1, t_1, p7.appPage, tostring(p5.collectionId), p5.collectionPosition, p6, nil, nil, p9, var4 or false, var3, nil, nil, function(p11)
			-- upvalues: p4 (ref), sduiParseHelpers (copy), p7 (ref), sduiErrors (copy), var3 (ref), p10 (ref)
			p7.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogGameImpressions, {
				componentType = var3,
				name = p10,
				message = `Failed to log game impressions. reason: {p11}. analyticsContext: {if p4 then sduiParseHelpers.stringifyValue(p4.analyticsData) else nil}`
			}, p7.appPage)
		end, nil)
	end
end