local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local thunkModule = require(purchasePrompt.Thunk)
local dispatchPurchaseForProductPayloadModule = require(purchasePrompt.Utils.dispatchPurchaseForProductPayload)
local t = {}

return function() --[[ line: 11 | named "retryPurchaseAfterUpsell" ]]
	-- upvalues: thunkModule (ref), t (ref), dispatchPurchaseForProductPayloadModule (ref)
	return thunkModule.new(script.Name, t, function(p0, _) --[[ line: 12 ]]
		-- upvalues: dispatchPurchaseForProductPayloadModule (copy)
		dispatchPurchaseForProductPayloadModule(function(p1) --[[ line: 16 ]]
			-- upvalues: p0 (ref)
			p0:dispatch(p1)
		end, p0:getState().productPayload, nil, true)
	end)
end