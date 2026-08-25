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
	local var7 = useDispatch()
	local var8 = useSelector(selectPromptStateModule)
	local var9 = useLocalization({
		genericError = if fFlagAddCommerceErrorsModule then "CoreScripts.CommercePurchasePrompt.ErrorPrompt.Body.ErrorLoading" else "CoreScripts.CommercePurchasePrompt.ErrorPrompt.GenericError"
	})
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), commerceService (copy), var8 (ref), commercePurchasePromptStateEnumModule (copy), initiateCommercePurchaseFlowModule (copy), var9 (ref)
		local var10 = if var7 then commerceService.PromptCommerceProductPurchaseRequested:Connect(function(p0)
			-- upvalues: var8 (copy), commercePurchasePromptStateEnumModule (copy), var7 (copy), initiateCommercePurchaseFlowModule (copy), var9 (copy)
			if var8 == commercePurchasePromptStateEnumModule.None then
				var7(initiateCommercePurchaseFlowModule(p0, var9.genericError))
			end
		end) else nil
		
		return function()
			-- upvalues: var10 (write)
			if var10 then
				var10:Disconnect()
				var10 = nil
			end
		end
	end, { var7, var9 })
end