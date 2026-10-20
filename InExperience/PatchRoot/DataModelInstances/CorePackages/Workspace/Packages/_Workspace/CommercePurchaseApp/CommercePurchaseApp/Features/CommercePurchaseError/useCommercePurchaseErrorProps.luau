local CommerceService = game:GetService("CommerceService")
local CommercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local Parent = CommercePurchaseApp.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local CommercePurchaseEndedModule = require(CommercePurchaseApp.Store.Actions.CommercePurchaseEnded)
local SelectErrorCodeModule = require(CommercePurchaseApp.Store.Selectors.selectErrorCode)
local SelectCommerceProductIdModule = require(CommercePurchaseApp.Store.Selectors.selectCommerceProductId)
local _ = require(CommercePurchaseApp.Enums.ErrorCodeEnum)
local _ = require(script.Parent.CommercePurchaseError)

return function()
	-- upvalues: UseSelectorFunction (copy), SelectErrorCodeModule (copy), SelectCommerceProductIdModule (copy), UseDispatchFunction (copy), ReactModule (copy), CommerceService (copy), CommercePurchaseEndedModule (copy)
	local UseSelectorResult = UseSelectorFunction(SelectErrorCodeModule)
	local UseSelectorResult1 = UseSelectorFunction(SelectCommerceProductIdModule)
	local UseDispatchResult = UseDispatchFunction()
	
	return {
		onDismiss = ReactModule.useCallback(function()
			-- upvalues: CommerceService (upval), UseSelectorResult1 (copy), UseDispatchResult (copy), CommercePurchaseEndedModule (upval)
			CommerceService:SignalPromptCommerceProductPurchaseFinished(UseSelectorResult1, false)
			UseDispatchResult(CommercePurchaseEndedModule())
		end, { UseSelectorResult1, UseDispatchResult }),
		errorCode = UseSelectorResult
	}
end