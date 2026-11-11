local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local ThunkModule = require(PurchasePrompt.Thunk)
local DispatchPurchaseForProductPayloadModule = require(PurchasePrompt.Utils.dispatchPurchaseForProductPayload)
local t = {}

return function()
	-- upvalues: ThunkModule (copy), t (copy), DispatchPurchaseForProductPayloadModule (copy)
	return ThunkModule.new(script.Name, t, function(p1, _)
		-- upvalues: DispatchPurchaseForProductPayloadModule (upval)
		DispatchPurchaseForProductPayloadModule(function(p2)
			-- upvalues: p1 (copy)
			p1:dispatch(p2)
		end, p1:getState().productPayload, nil, true)
	end)
end