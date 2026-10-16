local CommerceService = game:GetService("CommerceService")
local CommercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local Parent = CommercePurchaseApp.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local CommercePurchasePromptStateEnumModule = require(CommercePurchaseApp.Enums.CommercePurchasePromptStateEnum)
local SelectPromptStateModule = require(CommercePurchaseApp.Store.Selectors.selectPromptState)
local InitiateCommercePurchaseFlowModule = require(CommercePurchaseApp.Store.Thunks.InitiateCommercePurchaseFlow)
local FFlagAddCommerceErrorsModule = require(CommercePurchaseApp.Flags.FFlagAddCommerceErrors)

return function() --[[ Line: 15 | Named "useCommercePurchaseRequestListenerEffect" ]]
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), SelectPromptStateModule (copy), UseLocalizationFunction (copy), FFlagAddCommerceErrorsModule (copy), ReactModule (copy), CommerceService (copy), CommercePurchasePromptStateEnumModule (copy), InitiateCommercePurchaseFlowModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(SelectPromptStateModule)
	local UseLocalizationResult = UseLocalizationFunction({
		genericError = if FFlagAddCommerceErrorsModule then "CoreScripts.CommercePurchasePrompt.ErrorPrompt.Body.ErrorLoading" else "CoreScripts.CommercePurchasePrompt.ErrorPrompt.GenericError"
	})
	ReactModule.useEffect(function() --[[ Line: 24 ]]
		-- upvalues: UseDispatchResult (copy), CommerceService (upval), UseSelectorResult (copy), CommercePurchasePromptStateEnumModule (upval), InitiateCommercePurchaseFlowModule (upval), UseLocalizationResult (copy)
		local PromptCommerceProductPurchaseRequestedConnection = if UseDispatchResult then CommerceService.PromptCommerceProductPurchaseRequested:Connect(function(CommerceProductId) --[[ Line: 28 ]]
			-- upvalues: UseSelectorResult (upval), CommercePurchasePromptStateEnumModule (upval), UseDispatchResult (upval), InitiateCommercePurchaseFlowModule (upval), UseLocalizationResult (upval)
			if UseSelectorResult == CommercePurchasePromptStateEnumModule.None then
				UseDispatchResult(InitiateCommercePurchaseFlowModule(CommerceProductId, UseLocalizationResult.genericError))
			end
		end) else nil
		
		return function() --[[ Line: 35 ]]
			-- upvalues: PromptCommerceProductPurchaseRequestedConnection (ref)
			if PromptCommerceProductPurchaseRequestedConnection then
				PromptCommerceProductPurchaseRequestedConnection:Disconnect()
				PromptCommerceProductPurchaseRequestedConnection = nil
			end
		end
	end, { UseDispatchResult, UseLocalizationResult })
end