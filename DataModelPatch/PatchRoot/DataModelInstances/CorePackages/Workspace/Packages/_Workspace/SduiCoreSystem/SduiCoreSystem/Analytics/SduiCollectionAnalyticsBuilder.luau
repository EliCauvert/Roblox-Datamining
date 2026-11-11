local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local CryoModule = require(Parent.Cryo)
local UnifiedLoggingModule = require(Parent.UnifiedLogging)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.SduiComponentType)
local _ = require(SduiCoreSystem.SduiConfigTypes)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local ValidateInterfaceModule = require(SduiCoreSystem.validateInterface)
local t = {}
local config = {
	index = -1,
	id = "unknown",
	itemComponentType = "unknown"
}
local config1 = {
	collectionId = -1,
	contentType = "unknown",
	itemsPerRow = -1,
	collectionPosition = -1,
	totalNumberOfItems = -1,
	startRowNumber = -1,
	collectionComponentType = "unknown",
	refId = if require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport then "unknown" else nil
}

return {
	buildAndValidateCollectionAnalyticsData = function(p1, p2, p3, CollectionComponentType, ItemsPerRow, TotalNumberOfItems, _, Name, StartRowNumber)
		-- upvalues: CryoModule (copy), t (copy), UnifiedLoggingModule (copy), ValidateInterfaceModule (copy), SduiErrorsModule (copy), config1 (copy)
		local JoinResult = CryoModule.Dictionary.join(p2 or t, p3 or t)
		JoinResult.collectionId = tonumber(JoinResult.collectionId) or JoinResult.collectionId
		JoinResult.collectionPosition = tonumber(JoinResult.collectionPosition)
		JoinResult.itemsPerRow = ItemsPerRow
		JoinResult.startRowNumber = StartRowNumber
		JoinResult.totalNumberOfItems = TotalNumberOfItems
		JoinResult.collectionComponentType = CollectionComponentType
		local ValidateInterfaceModuleResult, ValidateInterfaceModuleResult2 = ValidateInterfaceModule(JoinResult, UnifiedLoggingModule.SduiAnalyticsTypes.CollectionAnalyticsDataInterface, true)
		
		if not ValidateInterfaceModuleResult then
			p1.dependencies.logger.reportError(SduiErrorsModule.SduiErrorType.InvalidCollectionAnalyticsData, {
				componentType = CollectionComponentType,
				name = Name,
				message = ValidateInterfaceModuleResult2
			}, p1.appPage)
			JoinResult = CryoModule.Dictionary.join(config1, JoinResult)
		end
		return JoinResult
	end,
	buildAndValidateItemAnalyticsData = function(p1, p2, p3, p4, Name, Callback: (any) -> ())
		-- upvalues: CryoModule (copy), t (copy), UnifiedLoggingModule (copy), ValidateInterfaceModule (copy), SduiErrorsModule (copy), config (copy)
		local JoinResult = CryoModule.Dictionary.join(p3 or t, p2 or t, p4 or t)
		local ValidateInterfaceModuleResult, ValidateInterfaceModuleResult2 = ValidateInterfaceModule(JoinResult, UnifiedLoggingModule.SduiAnalyticsTypes.ItemAnalyticsDataInterface, true)
		
		if not ValidateInterfaceModuleResult then
			if Callback then
				Callback(ValidateInterfaceModuleResult2)
			else
				p1.dependencies.logger.reportError(SduiErrorsModule.SduiErrorType.InvalidItemAnalyticsData, { name = Name, message = ValidateInterfaceModuleResult2 }, p1.appPage)
			end
			JoinResult = CryoModule.Dictionary.join(config, JoinResult)
		end
		return JoinResult
	end,
	DUMMY_COLLECTION_DATA = config1,
	DUMMY_ITEM_DATA = config
}