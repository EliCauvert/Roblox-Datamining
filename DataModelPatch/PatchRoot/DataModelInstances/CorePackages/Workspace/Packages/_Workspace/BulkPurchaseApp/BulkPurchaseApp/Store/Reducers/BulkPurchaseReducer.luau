local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local BulkPurchasePromptStateEnumModule = require(BulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)
local _ = require(BulkPurchaseApp.Store.Types)

local function _()
	-- upvalues: BulkPurchasePromptStateEnumModule (copy)
	return { promptState = BulkPurchasePromptStateEnumModule.None }
end

return (require(BulkPurchaseApp.Parent.Rodux).createReducer({ promptState = BulkPurchasePromptStateEnumModule.None }, {
	[require(BulkPurchaseApp.Store.Actions.BulkPurchaseEnded).name] = function(_, _)
		-- upvalues: BulkPurchasePromptStateEnumModule (copy)
		return { promptState = BulkPurchasePromptStateEnumModule.None }
	end,
	[require(BulkPurchaseApp.Store.Actions.BulkPurchaseSucceeded).name] = function(Tbl, p1)
		local Copy = table.clone(Tbl)
		Copy.itemStatuses = p1.itemStatuses
		Copy.promptState = p1.promptState
		
		return Copy
	end,
	[require(BulkPurchaseApp.Store.Actions.BulkPurchaseFailed).name] = function(Tbl, p1)
		-- upvalues: BulkPurchasePromptStateEnumModule (copy)
		local Copy = table.clone(Tbl)
		Copy.errorCode = p1.errorCode
		Copy.promptState = BulkPurchasePromptStateEnumModule.Error
		Copy.errorMetadata = p1.errorMetadata
		
		return Copy
	end,
	[require(BulkPurchaseApp.Store.Actions.BulkPurchaseRequested).name] = function(Tbl, p1)
		local Copy = table.clone(Tbl)
		Copy.itemData = p1.itemData
		Copy.options = p1.options
		Copy.orderRequest = p1.orderRequest
		Copy.balance = p1.balance
		Copy.totalCost = p1.totalCost
		Copy.discountInformation = p1.discountInformation
		
		return Copy
	end,
	[require(BulkPurchaseApp.Store.Actions.BulkPurchaseStarted).name] = function(Tbl, p1)
		-- upvalues: BulkPurchasePromptStateEnumModule (copy)
		local Copy = table.clone(Tbl)
		Copy.promptState = BulkPurchasePromptStateEnumModule.Request
		Copy.balance = p1.balance
		
		return Copy
	end
}))