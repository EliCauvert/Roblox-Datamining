local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local RoduxModule = require(BulkPurchaseApp.Parent.Rodux)
local BulkPurchasePromptStateEnumModule = require(BulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)
local BulkPurchaseEndedModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseEnded)
local BulkPurchaseSucceededModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseSucceeded)
local BulkPurchaseFailedModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseFailed)
local BulkPurchaseStartedModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseStarted)
local BulkPurchaseRequestedModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseRequested)
local BulkPurchaseRefreshedModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseRefreshed)
local BulkPurchaseDisablePurchaseModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseDisablePurchase)
local _ = require(BulkPurchaseApp.Store.Types)
local FFlagBulkPurchaseRemoveStartedActionModule = require(BulkPurchaseApp.Flags.FFlagBulkPurchaseRemoveStartedAction)
local FFlagAXAddPlusUpsellToBulkPurchaseModule = require(BulkPurchaseApp.Flags.FFlagAXAddPlusUpsellToBulkPurchase)
local FFlagAXAddOffersToBulkPurchaseModule = require(BulkPurchaseApp.Flags.FFlagAXAddOffersToBulkPurchase)

local function _()
	-- upvalues: BulkPurchasePromptStateEnumModule (copy)
	return { promptState = BulkPurchasePromptStateEnumModule.None }
end

return (RoduxModule.createReducer({ promptState = BulkPurchasePromptStateEnumModule.None }, {
	[BulkPurchaseEndedModule.name] = function(_, _)
		-- upvalues: BulkPurchasePromptStateEnumModule (copy)
		return { promptState = BulkPurchasePromptStateEnumModule.None }
	end,
	[BulkPurchaseSucceededModule.name] = function(Tbl, p1)
		-- upvalues: FFlagAXAddPlusUpsellToBulkPurchaseModule (copy)
		local Copy = table.clone(Tbl)
		Copy.itemStatuses = p1.itemStatuses
		Copy.promptState = p1.promptState
		
		if FFlagAXAddPlusUpsellToBulkPurchaseModule then
			Copy.disablePurchase = false
		end
		return Copy
	end,
	[BulkPurchaseFailedModule.name] = function(Tbl, p1)
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
	[BulkPurchaseRequestedModule.name] = function(Tbl, p1)
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
	[BulkPurchaseRefreshedModule.name] = function(Tbl, p1)
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
	[BulkPurchaseDisablePurchaseModule.name] = function(Tbl, _)
		local Copy = table.clone(Tbl)
		Copy.disablePurchase = true
		
		return Copy
	end,
	[BulkPurchaseStartedModule.name] = function(Tbl, p1)
		-- upvalues: BulkPurchasePromptStateEnumModule (copy)
		local Copy = table.clone(Tbl)
		Copy.promptState = BulkPurchasePromptStateEnumModule.Request
		Copy.balance = p1.balance
		
		return Copy
	end
}))