local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local roduxModule = require(bulkPurchaseApp.Parent.Rodux)
local bulkPurchasePromptStateEnumModule = require(bulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)
local bulkPurchaseEndedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseEnded)
local bulkPurchaseSucceededModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseSucceeded)
local bulkPurchaseFailedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseFailed)
local bulkPurchaseStartedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseStarted)
local bulkPurchaseRequestedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseRequested)
local _ = require(bulkPurchaseApp.Store.Types)

local function _() --[[ line: 21 | named "createInitialState" ]]
	-- upvalues: bulkPurchasePromptStateEnumModule (ref)
	return { promptState = bulkPurchasePromptStateEnumModule.None }
end

return roduxModule.createReducer({ promptState = bulkPurchasePromptStateEnumModule.None }, {
	[bulkPurchaseEndedModule.name] = function(_, _) --[[ line: 28 ]]
		-- upvalues: bulkPurchasePromptStateEnumModule (ref)
		return { promptState = bulkPurchasePromptStateEnumModule.None }
	end,
	[bulkPurchaseSucceededModule.name] = function(p0, p1) --[[ line: 31 ]]
		local cloned = table.clone(p0)
		cloned.itemStatuses = p1.itemStatuses
		cloned.promptState = p1.promptState
		
		return cloned
	end,
	[bulkPurchaseFailedModule.name] = function(p2, p3) --[[ line: 37 ]]
		-- upvalues: bulkPurchasePromptStateEnumModule (ref)
		local cloned = table.clone(p2)
		cloned.errorCode = p3.errorCode
		cloned.promptState = bulkPurchasePromptStateEnumModule.Error
		cloned.errorMetadata = p3.errorMetadata
		
		return cloned
	end,
	[bulkPurchaseRequestedModule.name] = function(p4, p5) --[[ line: 44 ]]
		local cloned = table.clone(p4)
		cloned.itemData = p5.itemData
		cloned.options = p5.options
		cloned.orderRequest = p5.orderRequest
		cloned.balance = p5.balance
		cloned.totalCost = p5.totalCost
		cloned.discountInformation = p5.discountInformation
		
		return cloned
	end,
	[bulkPurchaseStartedModule.name] = function(p6, p7) --[[ line: 54 ]]
		-- upvalues: bulkPurchasePromptStateEnumModule (ref)
		local cloned = table.clone(p6)
		cloned.promptState = bulkPurchasePromptStateEnumModule.Request
		cloned.balance = p7.balance
		
		return cloned
	end
})