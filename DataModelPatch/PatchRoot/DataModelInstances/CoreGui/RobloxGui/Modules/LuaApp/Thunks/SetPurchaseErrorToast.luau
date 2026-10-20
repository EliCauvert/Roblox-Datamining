local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local GetPurchaseErrorTypeFromErrorResponseModule = require(Modules.LuaApp.getPurchaseErrorTypeFromErrorResponse)
local PurchaseErrorLocalizationKeysModule = require(Modules.LuaApp.PurchaseErrorLocalizationKeys)

return function(p1)
	-- upvalues: GetPurchaseErrorTypeFromErrorResponseModule (copy), PurchaseErrorLocalizationKeysModule (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy)
	return function(p2)
		-- upvalues: GetPurchaseErrorTypeFromErrorResponseModule (upval), p1 (copy), PurchaseErrorLocalizationKeysModule (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval)
		p2:dispatch(SetCurrentToastMessageModule({
			toastType = ToastTypeModule.PurchaseMessage,
			toastMessage = PurchaseErrorLocalizationKeysModule[GetPurchaseErrorTypeFromErrorResponseModule(p1)]
		}))
	end
end