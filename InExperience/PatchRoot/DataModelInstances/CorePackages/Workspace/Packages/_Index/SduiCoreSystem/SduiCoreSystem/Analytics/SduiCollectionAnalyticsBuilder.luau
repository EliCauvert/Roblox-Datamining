local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local cryoModule = require(parent.Cryo)
local unifiedLoggingModule = require(parent.UnifiedLogging)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiComponentType)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local validateInterfaceModule = require(sduiCoreSystem.validateInterface)
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local t = {}
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
	refId = if fFlagSduiExperienceDetailsSupport then "unknown" else nil
}

return {
	buildAndValidateCollectionAnalyticsData = function(p1, p2, p3, p4, p5, p6, _, p7, p8)
		-- upvalues: cryoModule (ref), t (ref), unifiedLoggingModule (ref), validateInterfaceModule (ref), sduiErrorsModule (ref), t_2 (ref)
		local var1 = cryoModule.Dictionary.join(p2 or t, p3 or t)
		var1.collectionId = tonumber(var1.collectionId) or var1.collectionId
		var1.collectionPosition = tonumber(var1.collectionPosition)
		var1.itemsPerRow = p5
		var1.startRowNumber = p8
		var1.totalNumberOfItems = p6
		var1.collectionComponentType = p4
		local var2, var3 = validateInterfaceModule(var1, unifiedLoggingModule.SduiAnalyticsTypes.CollectionAnalyticsDataInterface, true)
		
		if not var2 then
			p1.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.InvalidCollectionAnalyticsData, { componentType = p4, name = p7, message = var3 }, p1.appPage)
			var1 = cryoModule.Dictionary.join(t_2, var1)
		end
		return var1
	end,
	buildAndValidateItemAnalyticsData = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: cryoModule (ref), t (ref), unifiedLoggingModule (ref), validateInterfaceModule (ref), sduiErrorsModule (ref), t_1 (ref)
		local var1 = cryoModule.Dictionary.join(p3 or t, p2 or t, p4 or t)
		local var2, var3 = validateInterfaceModule(var1, unifiedLoggingModule.SduiAnalyticsTypes.ItemAnalyticsDataInterface, true)
		
		if not var2 then
			if p6 then
				p6(var3)
			else
				p1.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.InvalidItemAnalyticsData, { name = p5, message = var3 }, p1.appPage)
			end
			var1 = cryoModule.Dictionary.join(t_1, var1)
		end
		return var1
	end,
	DUMMY_COLLECTION_DATA = t_2,
	DUMMY_ITEM_DATA = t_1
}