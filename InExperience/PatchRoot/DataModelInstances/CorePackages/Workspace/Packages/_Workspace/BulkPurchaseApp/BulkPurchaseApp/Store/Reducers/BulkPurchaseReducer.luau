local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local BulkPurchasePromptStateEnumModule = require(BulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)
local _ = require(BulkPurchaseApp.Store.Types)
local FFlagBulkPurchaseRemoveStartedActionModule = require(BulkPurchaseApp.Flags.FFlagBulkPurchaseRemoveStartedAction)
local FFlagAXAddPlusUpsellToBulkPurchaseModule = require(BulkPurchaseApp.Flags.FFlagAXAddPlusUpsellToBulkPurchase)
local FFlagAXAddOffersToBulkPurchaseModule = require(BulkPurchaseApp.Flags.FFlagAXAddOffersToBulkPurchase)

local function _() --[[ Line: 27 | Named "createInitialState" ]]
	-- upvalues: BulkPurchasePromptStateEnumModule (copy)
	return { promptState = BulkPurchasePromptStateEnumModule.None }
end

return (require(BulkPurchaseApp.Parent.Rodux).createReducer({ promptState = BulkPurchasePromptStateEnumModule.None }, {
	[require(BulkPurchaseApp.Store.Actions.BulkPurchaseEnded).name] = function(_, _) --[[ Line: 34 ]]
		-- upvalues: BulkPurchasePromptStateEnumModule (copy)
		return { promptState = BulkPurchasePromptStateEnumModule.None }
	end,
	[require(BulkPurchaseApp.Store.Actions.BulkPurchaseSucceeded).name] = function(Tbl, p1) --[[ Line: 37 ]]
		-- upvalues: FFlagAXAddPlusUpsellToBulkPurchaseModule (copy)
		local Copy = table.clone(Tbl)
		Copy.itemStatuses = p1.itemStatuses
		Copy.promptState = p1.promptState
		
		if FFlagAXAddPlusUpsellToBulkPurchaseModule then
			Copy.disablePurchase = false
		end
		return Copy
	end,
	[require(BulkPurchaseApp.Store.Actions.BulkPurchaseFailed).name] = function(Tbl, p1) --[[ Line: 46 ]]
		-- upvalues: BulkPurchasePromptStateEnumModule (copy), FFlagAXAddPlusUpsellToBulkPurchaseModule (copy)
		local Copy = table.clone(Tbl)
		Copy.errorCode = p1.errorCode
		Copy.promptState = BulkPurchasePromptStateEnumModule.Error
		Copy.errorMetadata = p1.errorMetadata
		
		if FFlagAXAddPlusUpsellToBulkPurchaseModule then
			Copy.disablePurchase = false
		end
		return Copy
	end,
	[require(BulkPurchaseApp.Store.Actions.BulkPurchaseRequested).name] = function(Tbl, p1) --[[ Line: 56 ]]
		-- upvalues: FFlagBulkPurchaseRemoveStartedActionModule (copy), BulkPurchasePromptStateEnumModule (copy), FFlagAXAddOffersToBulkPurchaseModule (copy)
		local Copy = table.clone(Tbl)
		Copy.itemData = p1.itemData
		Copy.options = p1.options
		Copy.orderRequest = p1.orderRequest
		Copy.balance = p1.balance
		Copy.totalCost = p1.totalCost
		Copy.discountInformation = p1.discountInformation
		
		if FFlagBulkPurchaseRemoveStartedActionModule then
			Copy.promptState = BulkPurchasePromptStateEnumModule.Request
		end
		if FFlagAXAddOffersToBulkPurchaseModule then
			Copy.offerData = p1.offerData
		end
		return Copy
	end,
	[require(BulkPurchaseApp.Store.Actions.BulkPurchaseRefreshed).name] = function(Tbl, p1) --[[ Line: 72 ]]
		-- upvalues: FFlagAXAddOffersToBulkPurchaseModule (copy)
		local Copy = table.clone(Tbl)
		Copy.itemData = p1.itemData
		Copy.options = p1.options
		Copy.orderRequest = p1.orderRequest
		Copy.balance = p1.balance
		Copy.totalCost = p1.totalCost
		Copy.discountInformation = p1.discountInformation
		Copy.disablePurchase = false
		
		if FFlagAXAddOffersToBulkPurchaseModule then
			Copy.offerData = p1.offerData
		end
		return Copy
	end,
	[require(BulkPurchaseApp.Store.Actions.BulkPurchaseDisablePurchase).name] = function(Tbl, _) --[[ Line: 89 ]]
		local Copy = table.clone(Tbl)
		Copy.disablePurchase = true
		
		return Copy
	end,
	[require(BulkPurchaseApp.Store.Actions.BulkPurchaseStarted).name] = function(Tbl, p1) --[[ Line: 97 ]]
		-- upvalues: BulkPurchasePromptStateEnumModule (copy)
		local Copy = table.clone(Tbl)
		Copy.promptState = BulkPurchasePromptStateEnumModule.Request
		Copy.balance = p1.balance
		
		return Copy
	end
}))