local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local RefreshExpectedPriceModule = require(PurchasePrompt.Actions.RefreshExpectedPrice)
local SetProductPayloadModule = require(PurchasePrompt.Actions.SetProductPayload)

return function(p1, ExpectedPrice)
	-- upvalues: RefreshExpectedPriceModule (copy), SetProductPayloadModule (copy)
	p1:dispatch(RefreshExpectedPriceModule(ExpectedPrice))
	local ProductPayload = p1:getState().productPayload
	
	if ProductPayload then
		local Copy = table.clone(ProductPayload)
		Copy.expectedPrice = ExpectedPrice
		p1:dispatch(SetProductPayloadModule(Copy))
	end
end