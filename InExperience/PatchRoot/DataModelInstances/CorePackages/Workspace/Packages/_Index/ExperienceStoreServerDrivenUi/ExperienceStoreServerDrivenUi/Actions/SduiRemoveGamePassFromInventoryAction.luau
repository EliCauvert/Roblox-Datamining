local Parent = script:FindFirstAncestor("ExperienceStoreServerDrivenUi").Parent
local CentralOverlayModule = require(Parent.CentralOverlay)
local CloseCentralOverlayFunction = CentralOverlayModule.Thunks.CloseCentralOverlay
local SetCentralOverlayFunction = CentralOverlayModule.Actions.SetCentralOverlay
local DataHydrationModule = require(Parent.DataHydration)
local FoundationModule = require(Parent.Foundation)
local LocalizeStringsFunction = require(Parent.Localization).localizeStrings
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SignalsModule = require(Parent.Signals)
local GetSduiPageEntrySnackbarStoreFunction = require(Parent.SduiSharedUtilities).getSduiPageEntrySnackbarStore
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType
local Effects = {}

local function showSnackbarIfRevokeFails(p1, p2)
	-- upvalues: DataHydrationModule (copy), Effects (copy), SignalsModule (copy), GetSduiPageEntrySnackbarStoreFunction (copy), FoundationModule (copy), SduiErrorType (copy), SduiActionType (copy)
	local RevokeOwnershipResult = DataHydrationModule.Game.getGamePassStore(false).revokeOwnership(p1)
	local t = {}
	local Flag = false
	
	local function _()
		-- upvalues: Flag (ref), Effects (upval), t (copy)
		Flag = true
		local Effect: () -> () = Effects[t]
		Effects[t] = nil
		
		if Effect then
			Effect()
		end
	end
	
	local Effect: () -> () = SignalsModule.createEffect(function(p3)
		-- upvalues: RevokeOwnershipResult (copy), Flag (ref), Effects (upval), t (copy), p2 (copy), GetSduiPageEntrySnackbarStoreFunction (upval), FoundationModule (upval), SduiErrorType (upval), SduiActionType (upval)
		local RevokeOwnershipResultResult = RevokeOwnershipResult(p3)
		
		if RevokeOwnershipResultResult == nil then return end
		Flag = true
		local Effect: () -> () = Effects[t]
		Effects[t] = nil
		
		if Effect then
			Effect()
		end
		local ConfigKey = p2.configKey
		
		if RevokeOwnershipResultResult.type == "error" and ConfigKey then
			local Success, Result = pcall(function()
				-- upvalues: GetSduiPageEntrySnackbarStoreFunction (upval), ConfigKey (copy), p2 (upval), FoundationModule (upval)
				GetSduiPageEntrySnackbarStoreFunction().show(ConfigKey, {
					title = p2.dependencies.localization:Format("Feature.Item.Message.ItemNotDeleted"),
					icon = FoundationModule.Enums.IconName.X
				})
			end)
			
			if not Success then
				p2.dependencies.logger.reportError(SduiErrorType.FailedToExecuteAction, {
					name = SduiActionType.RemoveGamePassFromInventory,
					message = tostring(Result)
				}, p2.appPage)
			end
		end
	end)
	
	if Flag then
		Effect()
	else
		Effects[t] = Effect
	end
end

return function(p1, _, p2)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), LocalizeStringsFunction (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), FoundationModule (copy), showSnackbarIfRevokeFails (copy), CloseCentralOverlayFunction (copy)
	local ActionParams = p1 and p1.actionParams
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.RemoveGamePassFromInventory
		}, p2.appPage)
		
		return
	end
	local GamePassId = ActionParams.gamePassId
	
	if GamePassId == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing gamePassId",
			name = SduiActionType.RemoveGamePassFromInventory
		}, p2.appPage)
		
		return
	else
		local LocalizeStringsResult = LocalizeStringsFunction(p2.dependencies.localization, {
			title = "Feature.Item.Label.DeleteThisItem",
			body = "Feature.Item.Label.DeleteFromInventoryPermanently",
			confirmButtonText = "Feature.Catalog.Action.Delete"
		})
		local DispatchFunction: (any) -> () = p2.dependencies.dispatch
		DispatchFunction(SetCentralOverlayFunction(CentralOverlayType.ConfirmationDialog, {
			disablePortal = false,
			showCloseButton = true,
			title = LocalizeStringsResult.title,
			body = LocalizeStringsResult.body,
			confirmButtonText = LocalizeStringsResult.confirmButtonText,
			confirmButtonVariant = FoundationModule.Enums.ButtonVariant.Alert,
			onConfirm = function()
				-- upvalues: showSnackbarIfRevokeFails (upval), GamePassId (copy), p2 (copy), DispatchFunction (copy), CloseCentralOverlayFunction (upval)
				showSnackbarIfRevokeFails(tostring(GamePassId), p2)
				DispatchFunction(CloseCentralOverlayFunction())
			end,
			onCancel = function()
				-- upvalues: DispatchFunction (copy), CloseCentralOverlayFunction (upval)
				DispatchFunction(CloseCentralOverlayFunction())
			end
		}))
	end
end