local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local refreshExpectedPriceModule = require(purchasePrompt.Actions.RefreshExpectedPrice)
local setProductPayloadModule = require(purchasePrompt.Actions.SetProductPayload)

return function(p0, p1)
	-- upvalues: refreshExpectedPriceModule (ref), setProductPayloadModule (ref)
	p0:dispatch(refreshExpectedPriceModule(p1))
	local productPayload = p0:getState().productPayload
	
	if productPayload then
		local cloned = table.clone(productPayload)
		cloned.expectedPrice = p1
		p0:dispatch(setProductPayloadModule(cloned))
	end
end