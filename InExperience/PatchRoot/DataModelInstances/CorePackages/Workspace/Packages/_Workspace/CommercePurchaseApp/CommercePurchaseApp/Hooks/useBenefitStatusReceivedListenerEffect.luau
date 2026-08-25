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
	local var3 = useDispatch()
	local var4 = useLocalization({
		granted = "CoreScripts.CommercePurchasePrompt.SuccessToast.Granted",
		pending = "CoreScripts.CommercePurchasePrompt.SuccessToast.GrantPending"
	})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), commerceService (copy), toastType (copy), var4 (ref), setCurrentToastMessage (copy)
		local var5 = if var3 then commerceService.BenefitStatusReceived:Connect(function(p0)
			-- upvalues: toastType (copy), var4 (copy), var3 (copy), setCurrentToastMessage (copy)
			var3(setCurrentToastMessage(if p0 then {
				toastType = toastType.SuccessConfirmation,
				toastTitle = var4.granted
			} else {
				toastType = toastType.NetworkingError,
				toastTitle = var4.pending
			}))
		end) else nil
		
		return function()
			-- upvalues: var5 (write)
			if var5 then
				var5:Disconnect()
				var5 = nil
			end
		end
	end, { var3, var4 })
end