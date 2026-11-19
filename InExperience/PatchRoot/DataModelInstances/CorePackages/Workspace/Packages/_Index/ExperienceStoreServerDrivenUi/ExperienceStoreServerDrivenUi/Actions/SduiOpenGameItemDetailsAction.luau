local ExperienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")
local Parent = ExperienceStoreServerDrivenUi.Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType
local IsGameItemTypeModule = require(ExperienceStoreServerDrivenUi.Utils.isGameItemType)
local NavigateToGameItemDetailsModule = require(ExperienceStoreServerDrivenUi.Navigation.navigateToGameItemDetails)
local NavigateToLegacyGameItemPageModule = require(ExperienceStoreServerDrivenUi.Navigation.navigateToLegacyGameItemPage)
local FFlagEnableGameItemDetailsSdui = require(Parent.SharedFlags).FFlagEnableGameItemDetailsSdui
local FStringGameItemDetailsIxpLayerModule = require(ExperienceStoreServerDrivenUi.Flags.FStringGameItemDetailsIxpLayer)

local function _(p1, PropName, p2)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy)
	p1.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
		name = SduiActionType.OpenGameItemDetails,
		message = `Invalid or missing {PropName}: {tostring(p2)}`,
		propName = PropName
	}, p1.appPage)
end

return function(p1, p2, p3)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), IsGameItemTypeModule (copy), FStringGameItemDetailsIxpLayerModule (copy), Parent (copy), FFlagEnableGameItemDetailsSdui (copy), NavigateToGameItemDetailsModule (copy), NavigateToLegacyGameItemPageModule (copy)
	local ActionParams = p1 and p1.actionParams
	
	if ActionParams == nil then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenGameItemDetails
		}, p3.appPage)
		
		return
	end
	local ItemId = ActionParams.itemId
	
	if typeof(ItemId) ~= "string" or ItemId == "" then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "itemId",
			name = SduiActionType.OpenGameItemDetails,
			message = `Invalid or missing itemId: {tostring(ItemId)}`
		}, p3.appPage)
		
		return
	end
	local ItemType = ActionParams.itemType
	
	if not IsGameItemTypeModule(ItemType) then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "itemType",
			name = SduiActionType.OpenGameItemDetails,
			message = `Invalid or missing itemType: {tostring(ItemType)}`
		}, p3.appPage)
		
		return
	end
	local UniverseId = ActionParams.universeId
	
	if typeof(UniverseId) ~= "string" or UniverseId == "" then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "universeId",
			name = SduiActionType.OpenGameItemDetails,
			message = `Invalid or missing universeId: {tostring(UniverseId)}`
		}, p3.appPage)
		
		return
	end
	if FStringGameItemDetailsIxpLayerModule ~= "" then
		require(Parent.IxpServiceWrapper).IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringGameItemDetailsIxpLayerModule)
	end
	local config = {
		itemType = ItemType,
		itemId = ItemId,
		universeId = UniverseId
	}
	
	if FFlagEnableGameItemDetailsSdui then
		NavigateToGameItemDetailsModule(p3.dependencies.getNavigation(), config)
		
		return
	end
	local NavigateToLegacyGameItemPageModuleResult = NavigateToLegacyGameItemPageModule(p3, p2, config)
	
	if NavigateToLegacyGameItemPageModuleResult ~= nil then
		p3.dependencies.logger.reportError(SduiErrorType.FailedToExecuteAction, {
			name = SduiActionType.OpenGameItemDetails,
			message = `Couldn't open the legacy page for item {ItemId}: {NavigateToLegacyGameItemPageModuleResult}`
		}, p3.appPage)
	end
end