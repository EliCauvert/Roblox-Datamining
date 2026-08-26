local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local dataHydrationModule = require(parent.DataHydration)
local localizeStrings = require(parent.Localization).localizeStrings

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), localizeStrings (ref), setCentralOverlay (ref), centralOverlayType (ref), dataHydrationModule (ref), closeCentralOverlay (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = sduiActionType.RemoveBadgeFromInventory
		}, p2.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	
	if var1.assetId == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: assetId",
			name = sduiActionType.RemoveBadgeFromInventory
		}, p2.appPage)
		
		return
	end
	local assetId = var1.assetId
	local var2 = localizeStrings(p2.dependencies.localization, {
		RemoveBadgeTitle = "Feature.Item.Label.DeleteItemUndercase",
		RemoveBadgeBody = "Feature.Item.Label.DeleteFromInventoryConfirmUndercaseDelete"
	})
	local dispatch = p2.dependencies.dispatch
	dispatch(setCentralOverlay(centralOverlayType.ConfirmationDialog, {
		disablePortal = false,
		title = var2.RemoveBadgeTitle,
		body = var2.RemoveBadgeBody,
		onConfirm = function()
			-- upvalues: dataHydrationModule (copy), assetId (ref), dispatch (ref), closeCentralOverlay (copy)
			dataHydrationModule.Badges.getBadgeInfoStore(false).removeBadge(tostring(assetId))
			dispatch(closeCentralOverlay())
		end,
		onCancel = function()
			-- upvalues: dispatch (ref), closeCentralOverlay (copy)
			dispatch(closeCentralOverlay())
		end
	}))
end