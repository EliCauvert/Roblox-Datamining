local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local dataHydrationModule = require(parent.DataHydration)
local localizeStrings = require(parent.Localization).localizeStrings

return function(p0, _, p1, _) --[[ line: 16 ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), localizeStrings (ref), setCentralOverlay (ref), centralOverlayType (ref), dataHydrationModule (ref), closeCentralOverlay (ref)
	local var2 = if p0 then p0.actionParams else nil
	
	if var2 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = sduiActionType.RemoveBadgeFromInventory
		}, p1.appPage)
		
		return
	end
	assert(var2, "actionParams must exist")
	
	if var2.assetId == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: assetId",
			name = sduiActionType.RemoveBadgeFromInventory
		}, p1.appPage)
		
		return
	end
	local assetId = var2.assetId
	local var3 = localizeStrings(p1.dependencies.localization, {
		RemoveBadgeTitle = "Feature.Item.Label.DeleteItemUndercase",
		RemoveBadgeBody = "Feature.Item.Label.DeleteFromInventoryConfirmUndercaseDelete"
	})
	local dispatch = p1.dependencies.dispatch
	dispatch(setCentralOverlay(centralOverlayType.ConfirmationDialog, {
		disablePortal = false,
		title = var3.RemoveBadgeTitle,
		body = var3.RemoveBadgeBody,
		onConfirm = function() --[[ line: 53 ]]
			-- upvalues: dataHydrationModule (copy), assetId (ref), dispatch (ref), closeCentralOverlay (copy)
			dataHydrationModule.Badges.getBadgeInfoStore(false).removeBadge(tostring(assetId))
			dispatch(closeCentralOverlay())
		end,
		onCancel = function() --[[ line: 58 ]]
			-- upvalues: dispatch (ref), closeCentralOverlay (copy)
			dispatch(closeCentralOverlay())
		end
	}))
end