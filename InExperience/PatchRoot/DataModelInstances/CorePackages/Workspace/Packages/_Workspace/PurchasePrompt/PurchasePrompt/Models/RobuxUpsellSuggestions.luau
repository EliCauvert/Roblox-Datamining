local RobuxUpsellModule = require(script.Parent.Parent.Models.RobuxUpsell)
local RobuxUpsellSuggestionsModule = {
	new = function(Products) --[[ Line: 17 ]]
		return { products = Products }
	end
}

function RobuxUpsellSuggestionsModule.fromJson(p1) --[[ Line: 25 ]]
	-- upvalues: RobuxUpsellModule (copy), RobuxUpsellSuggestionsModule (copy)
	local FromJsonResults = {}
	
	for i, product in pairs(p1.products) do
		FromJsonResults[i] = RobuxUpsellModule.fromJson(product)
	end
	return RobuxUpsellSuggestionsModule.new(FromJsonResults)
end

return RobuxUpsellSuggestionsModule