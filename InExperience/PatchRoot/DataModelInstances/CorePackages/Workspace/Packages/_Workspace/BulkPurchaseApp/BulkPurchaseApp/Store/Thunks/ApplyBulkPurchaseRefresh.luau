local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local bulkPurchaseRefreshedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseRefreshed)
local bulkPurchaseFailedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseFailed)
local errorCodeEnumModule = require(bulkPurchaseApp.Enums.ErrorCodeEnum)
local bulkPurchasePromptStateEnumModule = require(bulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)
local _ = require(bulkPurchaseApp.Store.Types)

local function _(p1)
	-- upvalues: bulkPurchasePromptStateEnumModule (ref)
	if p1.promptState ~= bulkPurchasePromptStateEnumModule.Request then
		return false
	elseif p1.isRefreshing ~= true then
		return false
	end
	local var1 = if p1.orderRequest then p1.orderRequest.batchPurchaseAuthToken else nil
	
	return var1 ~= nil and var1 == p1.refreshingAuthToken
end

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: bulkPurchasePromptStateEnumModule (ref), bulkPurchaseFailedModule (ref), errorCodeEnumModule (ref), bulkPurchaseRefreshedModule (ref)
	return function(p8)
		-- upvalues: bulkPurchasePromptStateEnumModule (copy), p1 (ref), bulkPurchaseFailedModule (copy), errorCodeEnumModule (copy), bulkPurchaseRefreshedModule (copy), p2 (ref), p3 (ref), p4 (ref), p5 (ref), p6 (ref), p7 (ref)
		local var1
		local state = p8:getState()
		
		if state.promptState ~= bulkPurchasePromptStateEnumModule.Request then
			var1 = false
		elseif state.isRefreshing == true then
			local var2 = if state.orderRequest then state.orderRequest.batchPurchaseAuthToken else nil
			var1 = var2 ~= nil and var2 == state.refreshingAuthToken
		else
			var1 = false
		end
		if not var1 then return end
		if p1 then
			p8:dispatch(bulkPurchaseRefreshedModule(p2, p3, p4, p5, p6, p7))
			
			return
		end
		p8:dispatch(bulkPurchaseFailedModule(errorCodeEnumModule.Generic))
	end
end