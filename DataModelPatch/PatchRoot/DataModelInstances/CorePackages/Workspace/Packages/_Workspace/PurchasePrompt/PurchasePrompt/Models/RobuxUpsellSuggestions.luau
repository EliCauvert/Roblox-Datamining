local RobuxUpsellModule = require(script.Parent.Parent.Models.RobuxUpsell)
local RobuxUpsellSuggestionsModule = {
	new = function(Products)
		return { products = Products }
	end
}

function RobuxUpsellSuggestionsModule.fromJson(p1)
	-- upvalues: RobuxUpsellModule (copy), RobuxUpsellSuggestionsModule (copy)
	local FromJsonResults = {}
	
	for i, product in pairs(p1.products) do
		FromJsonResults[i] = RobuxUpsellModule.fromJson(product)
	end
	return RobuxUpsellSuggestionsModule.new(FromJsonResults)
end

return RobuxUpsellSuggestionsModule