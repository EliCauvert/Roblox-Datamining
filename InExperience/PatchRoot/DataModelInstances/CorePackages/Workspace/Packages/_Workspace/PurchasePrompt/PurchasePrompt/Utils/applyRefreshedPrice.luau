local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local refreshExpectedPriceModule = require(purchasePrompt.Actions.RefreshExpectedPrice)
local setProductPayloadModule = require(purchasePrompt.Actions.SetProductPayload)

return function(p1, p2)
	-- upvalues: refreshExpectedPriceModule (ref), setProductPayloadModule (ref)
	p1:dispatch(refreshExpectedPriceModule(p2))
	local productPayload = p1:getState().productPayload
	
	if productPayload then
		local cloned = table.clone(productPayload)
		cloned.expectedPrice = p2
		p1:dispatch(setProductPayloadModule(cloned))
	end
end