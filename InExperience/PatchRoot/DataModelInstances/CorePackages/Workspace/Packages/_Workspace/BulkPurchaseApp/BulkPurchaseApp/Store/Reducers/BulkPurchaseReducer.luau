local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local roduxModule = require(bulkPurchaseApp.Parent.Rodux)
local bulkPurchasePromptStateEnumModule = require(bulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)
local bulkPurchaseEndedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseEnded)
local bulkPurchaseSucceededModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseSucceeded)
local bulkPurchaseFailedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseFailed)
local bulkPurchaseStartedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseStarted)
local bulkPurchaseRequestedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseRequested)
local bulkPurchaseRefreshedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseRefreshed)
local bulkPurchaseDisablePurchaseModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseDisablePurchase)
local _ = require(bulkPurchaseApp.Store.Types)
local fFlagBulkPurchaseRemoveStartedActionModule = require(bulkPurchaseApp.Flags.FFlagBulkPurchaseRemoveStartedAction)
local fFlagAXAddPlusUpsellToBulkPurchaseModule = require(bulkPurchaseApp.Flags.FFlagAXAddPlusUpsellToBulkPurchase)

local function _()
	-- upvalues: bulkPurchasePromptStateEnumModule (ref)
	return { promptState = bulkPurchasePromptStateEnumModule.None }
end

return roduxModule.createReducer({ promptState = bulkPurchasePromptStateEnumModule.None }, {
	[bulkPurchaseEndedModule.name] = function(_, _)
		-- upvalues: bulkPurchasePromptStateEnumModule (ref)
		return { promptState = bulkPurchasePromptStateEnumModule.None }
	end,
	[bulkPurchaseSucceededModule.name] = function(p1, p2)
		-- upvalues: fFlagAXAddPlusUpsellToBulkPurchaseModule (ref)
		local cloned = table.clone(p1)
		cloned.itemStatuses = p2.itemStatuses
		cloned.promptState = p2.promptState
		
		if fFlagAXAddPlusUpsellToBulkPurchaseModule then
			cloned.disablePurchase = false
		end
		return cloned
	end,
	[bulkPurchaseFailedModule.name] = function(p1, p2)
		-- upvalues: bulkPurchasePromptStateEnumModule (ref), fFlagAXAddPlusUpsellToBulkPurchaseModule (ref)
		local cloned = table.clone(p1)
		cloned.errorCode = p2.errorCode
		cloned.promptState = bulkPurchasePromptStateEnumModule.Error
		cloned.errorMetadata = p2.errorMetadata
		
		if fFlagAXAddPlusUpsellToBulkPurchaseModule then
			cloned.disablePurchase = false
		end
		return cloned
	end,
	[bulkPurchaseRequestedModule.name] = function(p1, p2)
		-- upvalues: fFlagBulkPurchaseRemoveStartedActionModule (ref), bulkPurchasePromptStateEnumModule (ref)
		local cloned = table.clone(p1)
		cloned.itemData = p2.itemData
		cloned.options = p2.options
		cloned.orderRequest = p2.orderRequest
		cloned.balance = p2.balance
		cloned.totalCost = p2.totalCost
		cloned.discountInformation = p2.discountInformation
		
		if fFlagBulkPurchaseRemoveStartedActionModule then
			cloned.promptState = bulkPurchasePromptStateEnumModule.Request
		end
		return cloned
	end,
	[bulkPurchaseRefreshedModule.name] = function(p1, p2)
		local cloned = table.clone(p1)
		cloned.itemData = p2.itemData
		cloned.options = p2.options
		cloned.orderRequest = p2.orderRequest
		cloned.balance = p2.balance
		cloned.totalCost = p2.totalCost
		cloned.discountInformation = p2.discountInformation
		cloned.disablePurchase = false
		
		return cloned
	end,
	[bulkPurchaseDisablePurchaseModule.name] = function(p1, _)
		local cloned = table.clone(p1)
		cloned.disablePurchase = true
		
		return cloned
	end,
	[bulkPurchaseStartedModule.name] = function(p1, p2)
		-- upvalues: bulkPurchasePromptStateEnumModule (ref)
		local cloned = table.clone(p1)
		cloned.promptState = bulkPurchasePromptStateEnumModule.Request
		cloned.balance = p2.balance
		
		return cloned
	end
})