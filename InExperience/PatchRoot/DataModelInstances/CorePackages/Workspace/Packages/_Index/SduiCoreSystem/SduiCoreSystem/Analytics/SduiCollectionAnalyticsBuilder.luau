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
	buildAndValidateCollectionAnalyticsData = function(p0, p1, p2, p3, p4, p5, _, p6, p7)
		-- upvalues: cryoModule (ref), t (ref), unifiedLoggingModule (ref), validateInterfaceModule (ref), sduiErrorsModule (ref), t_2 (ref)
		local var8 = cryoModule.Dictionary.join(p1 or t, p2 or t)
		var8.collectionId = tonumber(var8.collectionId) or var8.collectionId
		var8.collectionPosition = tonumber(var8.collectionPosition)
		var8.itemsPerRow = p4
		var8.startRowNumber = p7
		var8.totalNumberOfItems = p5
		var8.collectionComponentType = p3
		local var9, var10 = validateInterfaceModule(var8, unifiedLoggingModule.SduiAnalyticsTypes.CollectionAnalyticsDataInterface, true)
		
		if not var9 then
			p0.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.InvalidCollectionAnalyticsData, { componentType = p3, name = p6, message = var10 }, p0.appPage)
			var8 = cryoModule.Dictionary.join(t_2, var8)
		end
		return var8
	end,
	buildAndValidateItemAnalyticsData = function(p8, p9, p10, p11, p12, p13)
		-- upvalues: cryoModule (ref), t (ref), unifiedLoggingModule (ref), validateInterfaceModule (ref), sduiErrorsModule (ref), t_1 (ref)
		local var11 = cryoModule.Dictionary.join(p10 or t, p9 or t, p11 or t)
		local var12, var13 = validateInterfaceModule(var11, unifiedLoggingModule.SduiAnalyticsTypes.ItemAnalyticsDataInterface, true)
		
		if not var12 then
			if p13 then
				p13(var13)
			else
				p8.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.InvalidItemAnalyticsData, { name = p12, message = var13 }, p8.appPage)
			end
			var11 = cryoModule.Dictionary.join(t_1, var11)
		end
		return var11
	end,
	DUMMY_COLLECTION_DATA = t_2,
	DUMMY_ITEM_DATA = t_1
}