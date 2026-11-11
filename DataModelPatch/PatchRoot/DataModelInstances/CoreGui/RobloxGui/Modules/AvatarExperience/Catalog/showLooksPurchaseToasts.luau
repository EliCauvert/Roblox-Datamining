local LocalizationService = game:GetService("LocalizationService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Localization = require(game:GetService("CorePackages").Workspace.Packages.RobloxAppLocales).Localization
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)

return function(p1, Callback: (any) -> ())
	-- upvalues: Localization (copy), LocalizationService (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy)
	local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
	local SuccessCount: number = p1.successCount
	local FailureCount: number = p1.failureCount
	
	if SuccessCount > 0 and FailureCount <= 0 then
		Callback(SetCurrentToastMessageModule({
			isLocalized = true,
			toastMessage = if SuccessCount == 1 then NewLocalization:Format("Feature.Avatar.Message.LooksPurchaseSuccessSingular", { numItems = SuccessCount }) else NewLocalization:Format("Feature.Avatar.Message.LooksPurchaseSuccessPlural", { numItems = SuccessCount }),
			toastType = ToastTypeModule.PurchaseMessage
		}))
		
		return
	end
	if SuccessCount > 0 and FailureCount > 0 then
		Callback(SetCurrentToastMessageModule({
			isLocalized = true,
			toastMessage = NewLocalization:Format("Feature.Avatar.Heading.LooksPurchasePartialSuccess"),
			toastSubMessage = NewLocalization:Format(if SuccessCount == 1 and FailureCount == 1 then "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericSS" elseif SuccessCount == 1 and FailureCount > 1 then "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericSP" elseif SuccessCount > 1 and FailureCount == 1 then "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericPS" else "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericPP", {
				numSuccessItems = SuccessCount,
				numFailureItems = FailureCount
			}),
			toastType = ToastTypeModule.NetworkingError
		}))
		
		return
	end
	if SuccessCount <= 0 and FailureCount > 0 then
		Callback(SetCurrentToastMessageModule({
			isLocalized = true,
			toastMessage = NewLocalization:Format("Feature.Avatar.Heading.LooksPurchaseFailed"),
			toastSubMessage = NewLocalization:Format("Feature.Avatar.Message.LooksPurchaseFailedNetworkError"),
			toastType = ToastTypeModule.NetworkingError
		}))
	end
end