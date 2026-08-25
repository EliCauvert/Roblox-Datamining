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
	[commercePurchaseFailedModule.name] = function(p0, p1)
		-- upvalues: commercePurchasePromptStateEnumModule (ref)
		local cloned = table.clone(p0)
		cloned.errorCode = p1.errorCode
		cloned.promptState = commercePurchasePromptStateEnumModule.Error
		
		return cloned
	end,
	[commercePurchaseStartedModule.name] = function(p2, p3)
		-- upvalues: commercePurchasePromptStateEnumModule (ref)
		local cloned = table.clone(p2)
		cloned.promptState = commercePurchasePromptStateEnumModule.Started
		cloned.commerceProductId = p3.commerceProductId
		
		return cloned
	end,
	[commercePurchaseCheckoutModule.name] = function(p4, p5)
		-- upvalues: commercePurchasePromptStateEnumModule (ref)
		local cloned = table.clone(p4)
		cloned.promptState = commercePurchasePromptStateEnumModule.Checkout
		cloned.checkoutSessionId = p5.checkoutSessionId
		
		return cloned
	end
})