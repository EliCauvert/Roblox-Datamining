local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local cryoModule = require(parent.Cryo)
local unifiedLoggingModule = require(parent.UnifiedLogging)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiComponentType)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local validateInterfaceModule = require(sduiCoreSystem.validateInterface)
local analyticsConstantsModule = require(sduiCoreSystem.Analytics.analyticsConstants)
local fFlagSduiSkipFeedAnalyticsPosition = require(parent.SharedFlags).FFlagSduiSkipFeedAnalyticsPosition
local t = {}
local var1 = if fFlagSduiSkipFeedAnalyticsPosition then function(p1)
	-- upvalues: analyticsConstantsModule (ref)
	p1[analyticsConstantsModule.DoesNotAdvanceStartRow] = nil
end else nil
local t_1 = {
	index = -1,
	id = "unknown",
	itemComponentType = "unknown"
}
local t_2 = {
	collectionId = -1,
	contentType = "unknown",
	itemsPerRow = -1,
	collectionPosition = -1,
	totalNumberOfItems = -1,
	startRowNumber = -1,
	collectionComponentType = "unknown",
	refId = "unknown"
}

return {
	buildAndValidateCollectionAnalyticsData = function(p1, p2, p3, p4, p5, p6, _, p7, p8)
		-- upvalues: cryoModule (ref), t (ref), fFlagSduiSkipFeedAnalyticsPosition (ref), var1 (ref), unifiedLoggingModule (ref), validateInterfaceModule (ref), sduiErrorsModule (ref), t_2 (ref)
		local var2 = cryoModule.Dictionary.join(p2 or t, p3 or t)
		
		if fFlagSduiSkipFeedAnalyticsPosition then
			var1(var2)
		end
		var2.collectionId = tonumber(var2.collectionId) or var2.collectionId
		var2.collectionPosition = tonumber(var2.collectionPosition)
		var2.itemsPerRow = p5
		var2.startRowNumber = p8
		var2.totalNumberOfItems = p6
		var2.collectionComponentType = p4
		local var3, var4 = validateInterfaceModule(var2, unifiedLoggingModule.SduiAnalyticsTypes.CollectionAnalyticsDataInterface, true)
		
		if not var3 then
			p1.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.InvalidCollectionAnalyticsData, { componentType = p4, name = p7, message = var4 }, p1.appPage)
			var2 = cryoModule.Dictionary.join(t_2, var2)
		end
		return var2
	end,
	buildAndValidateItemAnalyticsData = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: cryoModule (ref), t (ref), fFlagSduiSkipFeedAnalyticsPosition (ref), var1 (ref), unifiedLoggingModule (ref), validateInterfaceModule (ref), sduiErrorsModule (ref), t_1 (ref)
		local var2 = cryoModule.Dictionary.join(p3 or t, p2 or t, p4 or t)
		
		if fFlagSduiSkipFeedAnalyticsPosition then
			var1(var2)
		end
		local var3, var4 = validateInterfaceModule(var2, unifiedLoggingModule.SduiAnalyticsTypes.ItemAnalyticsDataInterface, true)
		
		if not var3 then
			if p6 then
				p6(var4)
			else
				p1.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.InvalidItemAnalyticsData, { name = p5, message = var4 }, p1.appPage)
			end
			var2 = cryoModule.Dictionary.join(t_1, var2)
		end
		return var2
	end,
	DUMMY_COLLECTION_DATA = t_2,
	DUMMY_ITEM_DATA = t_1
}