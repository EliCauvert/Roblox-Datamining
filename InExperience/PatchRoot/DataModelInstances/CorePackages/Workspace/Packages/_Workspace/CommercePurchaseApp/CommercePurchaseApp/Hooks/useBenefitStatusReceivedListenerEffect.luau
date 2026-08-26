local commerceService = game:GetService("CommerceService")
local parent = script:FindFirstAncestor("CommercePurchaseApp").Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalization = require(parent.Localization).Hooks.useLocalization
local toastRoduxModule = require(parent.ToastRodux)
local toastType = toastRoduxModule.Enums.ToastType
local setCurrentToastMessage = toastRoduxModule.Actions.SetCurrentToastMessage

return function()
	-- upvalues: useDispatch (ref), useLocalization (ref), reactModule (ref), commerceService (ref), toastType (ref), setCurrentToastMessage (ref)
	local var1 = useDispatch()
	local var2 = useLocalization({
		granted = "CoreScripts.CommercePurchasePrompt.SuccessToast.Granted",
		pending = "CoreScripts.CommercePurchasePrompt.SuccessToast.GrantPending"
	})
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), commerceService (copy), toastType (copy), var2 (ref), setCurrentToastMessage (copy)
		local var3 = if var1 then commerceService.BenefitStatusReceived:Connect(function(p1)
			-- upvalues: toastType (copy), var2 (copy), var1 (copy), setCurrentToastMessage (copy)
			var1(setCurrentToastMessage(if p1 then {
				toastType = toastType.SuccessConfirmation,
				toastTitle = var2.granted
			} else {
				toastType = toastType.NetworkingError,
				toastTitle = var2.pending
			}))
		end) else nil
		
		return function()
			-- upvalues: var3 (write)
			if var3 then
				var3:Disconnect()
				var3 = nil
			end
		end
	end, { var1, var2 })
end