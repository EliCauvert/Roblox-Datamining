local CommerceService = game:GetService("CommerceService")
local Parent = script:FindFirstAncestor("CommercePurchaseApp").Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ToastRoduxModule = require(Parent.ToastRodux)
local ToastType = ToastRoduxModule.Enums.ToastType
local SetCurrentToastMessageFunction = ToastRoduxModule.Actions.SetCurrentToastMessage

return function() --[[ Line: 13 | Named "useBenefitStatusReceivedListenerEffect" ]]
	-- upvalues: UseDispatchFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), CommerceService (copy), ToastType (copy), SetCurrentToastMessageFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		granted = "CoreScripts.CommercePurchasePrompt.SuccessToast.Granted",
		pending = "CoreScripts.CommercePurchasePrompt.SuccessToast.GrantPending"
	})
	ReactModule.useEffect(function() --[[ Line: 19 ]]
		-- upvalues: UseDispatchResult (copy), CommerceService (upval), ToastType (upval), UseLocalizationResult (copy), SetCurrentToastMessageFunction (upval)
		local BenefitStatusReceivedConnection = if UseDispatchResult then CommerceService.BenefitStatusReceived:Connect(function(IsGranted) --[[ Line: 22 ]]
			-- upvalues: ToastType (upval), UseLocalizationResult (upval), UseDispatchResult (upval), SetCurrentToastMessageFunction (upval)
			UseDispatchResult(SetCurrentToastMessageFunction(if IsGranted then {
				toastType = ToastType.SuccessConfirmation,
				toastTitle = UseLocalizationResult.granted
			} else {
				toastType = ToastType.NetworkingError,
				toastTitle = UseLocalizationResult.pending
			}))
		end) else nil
		
		return function() --[[ Line: 29 ]]
			-- upvalues: BenefitStatusReceivedConnection (ref)
			if BenefitStatusReceivedConnection then
				BenefitStatusReceivedConnection:Disconnect()
				BenefitStatusReceivedConnection = nil
			end
		end
	end, { UseDispatchResult, UseLocalizationResult })
end