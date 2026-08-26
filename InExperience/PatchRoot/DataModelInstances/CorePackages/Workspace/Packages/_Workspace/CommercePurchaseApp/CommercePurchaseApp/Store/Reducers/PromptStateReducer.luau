local commercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local roduxModule = require(commercePurchaseApp.Parent.Rodux)
local commercePurchasePromptStateEnumModule = require(commercePurchaseApp.Enums.CommercePurchasePromptStateEnum)
local commercePurchaseEndedModule = require(commercePurchaseApp.Store.Actions.CommercePurchaseEnded)
local commercePurchaseFailedModule = require(commercePurchaseApp.Store.Actions.CommercePurchaseFailed)
local commercePurchaseStartedModule = require(commercePurchaseApp.Store.Actions.CommercePurchaseStarted)
local commercePurchaseCheckoutModule = require(commercePurchaseApp.Store.Actions.CommercePurchaseCheckout)
local _ = require(commercePurchaseApp.Store.Types)

local function _()
	-- upvalues: commercePurchasePromptStateEnumModule (ref)
	return { promptState = commercePurchasePromptStateEnumModule.None }
end

return roduxModule.createReducer({ promptState = commercePurchasePromptStateEnumModule.None }, {
	[commercePurchaseEndedModule.name] = function(_, _)
		-- upvalues: commercePurchasePromptStateEnumModule (ref)
		return { promptState = commercePurchasePromptStateEnumModule.None }
	end,
	[commercePurchaseFailedModule.name] = function(p1, p2)
		-- upvalues: commercePurchasePromptStateEnumModule (ref)
		local cloned = table.clone(p1)
		cloned.errorCode = p2.errorCode
		cloned.promptState = commercePurchasePromptStateEnumModule.Error
		
		return cloned
	end,
	[commercePurchaseStartedModule.name] = function(p1, p2)
		-- upvalues: commercePurchasePromptStateEnumModule (ref)
		local cloned = table.clone(p1)
		cloned.promptState = commercePurchasePromptStateEnumModule.Started
		cloned.commerceProductId = p2.commerceProductId
		
		return cloned
	end,
	[commercePurchaseCheckoutModule.name] = function(p1, p2)
		-- upvalues: commercePurchasePromptStateEnumModule (ref)
		local cloned = table.clone(p1)
		cloned.promptState = commercePurchasePromptStateEnumModule.Checkout
		cloned.checkoutSessionId = p2.checkoutSessionId
		
		return cloned
	end
})