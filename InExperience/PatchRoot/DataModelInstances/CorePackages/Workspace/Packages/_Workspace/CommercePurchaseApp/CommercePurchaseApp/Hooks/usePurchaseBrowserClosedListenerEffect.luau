local CommerceService = game:GetService("CommerceService")
local CommercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local Parent = CommercePurchaseApp.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local CommercePurchasePromptStateEnumModule = require(CommercePurchaseApp.Enums.CommercePurchasePromptStateEnum)
local SelectPromptStateModule = require(CommercePurchaseApp.Store.Selectors.selectPromptState)
local SelectCommerceProductIdModule = require(CommercePurchaseApp.Store.Selectors.selectCommerceProductId)
local SelectCheckoutSessionIdModule = require(CommercePurchaseApp.Store.Selectors.selectCheckoutSessionId)
local CommercePurchaseEndedModule = require(CommercePurchaseApp.Store.Actions.CommercePurchaseEnded)

return function()
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), SelectPromptStateModule (copy), SelectCommerceProductIdModule (copy), SelectCheckoutSessionIdModule (copy), ReactModule (copy), CommerceService (copy), CommercePurchasePromptStateEnumModule (copy), CommercePurchaseEndedModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(SelectPromptStateModule)
	local UseSelectorResult1 = UseSelectorFunction(SelectCommerceProductIdModule)
	local UseSelectorResult2 = UseSelectorFunction(SelectCheckoutSessionIdModule)
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), CommerceService (upval), UseSelectorResult (copy), CommercePurchasePromptStateEnumModule (upval), UseSelectorResult1 (copy), UseSelectorResult2 (copy), CommercePurchaseEndedModule (upval)
		local PurchaseBrowserClosedConnection = if UseDispatchResult then CommerceService.PurchaseBrowserClosed:Connect(function()
			-- upvalues: UseSelectorResult (upval), CommercePurchasePromptStateEnumModule (upval), CommerceService (upval), UseSelectorResult1 (upval), UseSelectorResult2 (upval), UseDispatchResult (upval), CommercePurchaseEndedModule (upval)
			if UseSelectorResult == CommercePurchasePromptStateEnumModule.Checkout then
				CommerceService:SignalPromptCommerceProductPurchaseFinished(UseSelectorResult1, true, UseSelectorResult2)
				UseDispatchResult(CommercePurchaseEndedModule())
			end
		end) else nil
		
		return function()
			-- upvalues: PurchaseBrowserClosedConnection (ref)
			if PurchaseBrowserClosedConnection then
				PurchaseBrowserClosedConnection:Disconnect()
				PurchaseBrowserClosedConnection = nil
			end
		end
	end, {
		UseDispatchResult,
		UseSelectorResult,
		UseSelectorResult1,
		UseSelectorResult2
	})
end