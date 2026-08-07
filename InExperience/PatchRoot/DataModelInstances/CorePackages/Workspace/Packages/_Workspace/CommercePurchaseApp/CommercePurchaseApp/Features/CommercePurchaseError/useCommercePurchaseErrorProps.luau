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

return function() --[[ line: 15 | named "useCommercePurchaseErrorProps" ]]
	-- upvalues: useSelector (ref), selectErrorCodeModule (ref), selectCommerceProductIdModule (ref), useDispatch (ref), reactModule (ref), commerceService (ref), commercePurchaseEndedModule (ref)
	local var6 = useSelector(selectErrorCodeModule)
	local var7 = useSelector(selectCommerceProductIdModule)
	local var8 = useDispatch()
	
	return {
		onDismiss = reactModule.useCallback(function() --[[ line: 20 ]]
			-- upvalues: commerceService (copy), var7 (ref), var8 (ref), commercePurchaseEndedModule (copy)
			commerceService:SignalPromptCommerceProductPurchaseFinished(var7, false)
			var8(commercePurchaseEndedModule())
		end, { var7, var8 }),
		errorCode = var6
	}
end