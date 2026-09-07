local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local bulkPurchaseRefreshRequestedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseRefreshRequested)
local bulkPurchaseFailedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseFailed)
local errorCodeEnumModule = require(bulkPurchaseApp.Enums.ErrorCodeEnum)
local bulkPurchasePromptStateEnumModule = require(bulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)
local _ = require(bulkPurchaseApp.MarketplaceServiceTypes)

return function(p1, p2)
	-- upvalues: bulkPurchasePromptStateEnumModule (ref), bulkPurchaseRefreshRequestedModule (ref), bulkPurchaseFailedModule (ref), errorCodeEnumModule (ref)
	return function(p3)
		-- upvalues: bulkPurchasePromptStateEnumModule (copy), p2 (ref), bulkPurchaseRefreshRequestedModule (copy), p1 (ref), bulkPurchaseFailedModule (copy), errorCodeEnumModule (copy)
		local state = p3:getState()
		
		if state.isRefreshing then return end
		if state.promptState ~= bulkPurchasePromptStateEnumModule.Request then return end
		local var1 = if state.orderRequest then state.orderRequest.batchPurchaseAuthToken else nil
		
		if var1 == nil or var1 ~= p2 then return end
		p3:dispatch(bulkPurchaseRefreshRequestedModule(p2))
		
		if not pcall(function()
			-- upvalues: p1 (copy), p2 (copy)
			p1:RefreshBulkPurchase(p2)
		end) then
			p3:dispatch(bulkPurchaseFailedModule(errorCodeEnumModule.Generic))
		end
	end
end