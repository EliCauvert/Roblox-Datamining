local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local DataHydrationModule = require(Parent.DataHydration)
local LocalizeStringsFunction = require(Parent.Localization).localizeStrings

return function(p1, _, p2, _)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), LocalizeStringsFunction (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), DataHydrationModule (copy), CloseCentralOverlayFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = SduiActionType.RemoveBadgeFromInventory
		}, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	
	if ActionParams.assetId == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: assetId",
			name = SduiActionType.RemoveBadgeFromInventory
		}, p2.appPage)
		
		return
	else
		local AssetId = ActionParams.assetId
		local LocalizeStringsResult = LocalizeStringsFunction(p2.dependencies.localization, {
			RemoveBadgeTitle = "Feature.Item.Label.DeleteItemUndercase",
			RemoveBadgeBody = "Feature.Item.Label.DeleteFromInventoryConfirmUndercaseDelete"
		})
		local DispatchFunction: (any) -> () = p2.dependencies.dispatch
		DispatchFunction(SetCentralOverlayFunction(CentralOverlayType.ConfirmationDialog, {
			disablePortal = false,
			title = LocalizeStringsResult.RemoveBadgeTitle,
			body = LocalizeStringsResult.RemoveBadgeBody,
			onConfirm = function()
				-- upvalues: DataHydrationModule (upval), AssetId (copy), DispatchFunction (copy), CloseCentralOverlayFunction (upval)
				DataHydrationModule.Badges.getBadgeInfoStore(false).removeBadge((tostring(AssetId)))
				DispatchFunction(CloseCentralOverlayFunction())
			end,
			onCancel = function()
				-- upvalues: DispatchFunction (copy), CloseCentralOverlayFunction (upval)
				DispatchFunction(CloseCentralOverlayFunction())
			end
		}))
	end
end