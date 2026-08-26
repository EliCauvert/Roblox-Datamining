local commerceService = game:GetService("CommerceService")
local commercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local parent = commercePurchaseApp.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local commercePurchaseEndedModule = require(commercePurchaseApp.Store.Actions.CommercePurchaseEnded)
local selectErrorCodeModule = require(commercePurchaseApp.Store.Selectors.selectErrorCode)
local selectCommerceProductIdModule = require(commercePurchaseApp.Store.Selectors.selectCommerceProductId)
local _ = require(commercePurchaseApp.Enums.ErrorCodeEnum)
local _ = require(script.Parent.CommercePurchaseError)

return function()
	-- upvalues: useSelector (ref), selectErrorCodeModule (ref), selectCommerceProductIdModule (ref), useDispatch (ref), reactModule (ref), commerceService (ref), commercePurchaseEndedModule (ref)
	local var1 = useSelector(selectErrorCodeModule)
	local var2 = useSelector(selectCommerceProductIdModule)
	local var3 = useDispatch()
	
	return {
		onDismiss = reactModule.useCallback(function()
			-- upvalues: commerceService (copy), var2 (ref), var3 (ref), commercePurchaseEndedModule (copy)
			commerceService:SignalPromptCommerceProductPurchaseFinished(var2, false)
			var3(commercePurchaseEndedModule())
		end, { var2, var3 }),
		errorCode = var1
	}
end