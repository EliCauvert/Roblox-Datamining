local commerceService = game:GetService("CommerceService")
local commercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local parent = commercePurchaseApp.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local commercePurchasePromptStateEnumModule = require(commercePurchaseApp.Enums.CommercePurchasePromptStateEnum)
local selectPromptStateModule = require(commercePurchaseApp.Store.Selectors.selectPromptState)
local initiateCommercePurchaseFlowModule = require(commercePurchaseApp.Store.Thunks.InitiateCommercePurchaseFlow)
local fFlagAddCommerceErrorsModule = require(commercePurchaseApp.Flags.FFlagAddCommerceErrors)

return function()
	-- upvalues: useDispatch (ref), useSelector (ref), selectPromptStateModule (ref), useLocalization (ref), fFlagAddCommerceErrorsModule (ref), reactModule (ref), commerceService (ref), commercePurchasePromptStateEnumModule (ref), initiateCommercePurchaseFlowModule (ref)
	local var1 = useDispatch()
	local var2 = useSelector(selectPromptStateModule)
	local var3 = useLocalization({
		genericError = if fFlagAddCommerceErrorsModule then "CoreScripts.CommercePurchasePrompt.ErrorPrompt.Body.ErrorLoading" else "CoreScripts.CommercePurchasePrompt.ErrorPrompt.GenericError"
	})
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), commerceService (copy), var2 (ref), commercePurchasePromptStateEnumModule (copy), initiateCommercePurchaseFlowModule (copy), var3 (ref)
		local var4 = if var1 then commerceService.PromptCommerceProductPurchaseRequested:Connect(function(p1)
			-- upvalues: var2 (copy), commercePurchasePromptStateEnumModule (copy), var1 (copy), initiateCommercePurchaseFlowModule (copy), var3 (copy)
			if var2 == commercePurchasePromptStateEnumModule.None then
				var1(initiateCommercePurchaseFlowModule(p1, var3.genericError))
			end
		end) else nil
		
		return function()
			-- upvalues: var4 (write)
			if var4 then
				var4:Disconnect()
				var4 = nil
			end
		end
	end, { var1, var3 })
end