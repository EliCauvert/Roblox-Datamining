local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local thunkModule = require(purchasePrompt.Thunk)
local dispatchPurchaseForProductPayloadModule = require(purchasePrompt.Utils.dispatchPurchaseForProductPayload)
local t = {}

return function()
	-- upvalues: thunkModule (ref), t (ref), dispatchPurchaseForProductPayloadModule (ref)
	return thunkModule.new(script.Name, t, function(p1, _)
		-- upvalues: dispatchPurchaseForProductPayloadModule (copy)
		dispatchPurchaseForProductPayloadModule(function(p2)
			-- upvalues: p1 (ref)
			p1:dispatch(p2)
		end, p1:getState().productPayload, nil, true)
	end)
end