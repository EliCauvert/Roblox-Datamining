local CommercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local CommercePurchasePromptStateEnumModule = require(CommercePurchaseApp.Enums.CommercePurchasePromptStateEnum)
local _ = require(CommercePurchaseApp.Store.Types)

local function _()
	-- upvalues: CommercePurchasePromptStateEnumModule (copy)
	return { promptState = CommercePurchasePromptStateEnumModule.None }
end

return (require(CommercePurchaseApp.Parent.Rodux).createReducer({ promptState = CommercePurchasePromptStateEnumModule.None }, {
	[require(CommercePurchaseApp.Store.Actions.CommercePurchaseEnded).name] = function(_, _)
		-- upvalues: CommercePurchasePromptStateEnumModule (copy)
		return { promptState = CommercePurchasePromptStateEnumModule.None }
	end,
	[require(CommercePurchaseApp.Store.Actions.CommercePurchaseFailed).name] = function(Tbl, p1)
		-- upvalues: CommercePurchasePromptStateEnumModule (copy)
		local Copy = table.clone(Tbl)
		Copy.errorCode = p1.errorCode
		Copy.promptState = CommercePurchasePromptStateEnumModule.Error
		
		return Copy
	end,
	[require(CommercePurchaseApp.Store.Actions.CommercePurchaseStarted).name] = function(Tbl, p1)
		-- upvalues: CommercePurchasePromptStateEnumModule (copy)
		local Copy = table.clone(Tbl)
		Copy.promptState = CommercePurchasePromptStateEnumModule.Started
		Copy.commerceProductId = p1.commerceProductId
		
		return Copy
	end,
	[require(CommercePurchaseApp.Store.Actions.CommercePurchaseCheckout).name] = function(Tbl, p1)
		-- upvalues: CommercePurchasePromptStateEnumModule (copy)
		local Copy = table.clone(Tbl)
		Copy.promptState = CommercePurchasePromptStateEnumModule.Checkout
		Copy.checkoutSessionId = p1.checkoutSessionId
		
		return Copy
	end
}))