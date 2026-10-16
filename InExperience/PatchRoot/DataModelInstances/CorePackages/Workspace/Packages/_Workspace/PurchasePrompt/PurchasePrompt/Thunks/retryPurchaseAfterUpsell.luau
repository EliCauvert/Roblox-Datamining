local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local ThunkModule = require(PurchasePrompt.Thunk)
local DispatchPurchaseForProductPayloadModule = require(PurchasePrompt.Utils.dispatchPurchaseForProductPayload)
local t = {}

return function() --[[ Line: 11 | Named "retryPurchaseAfterUpsell" ]]
	-- upvalues: ThunkModule (copy), t (copy), DispatchPurchaseForProductPayloadModule (copy)
	return ThunkModule.new(script.Name, t, function(p1, _) --[[ Line: 12 ]]
		-- upvalues: DispatchPurchaseForProductPayloadModule (upval)
		DispatchPurchaseForProductPayloadModule(function(p2) --[[ Line: 16 ]]
			-- upvalues: p1 (copy)
			p1:dispatch(p2)
		end, p1:getState().productPayload, nil, true)
	end)
end