local function _(p1) --[[ Line: 3 | Named "getSelectedRobuxPackage" ]]
	return if p1.robuxUpsellSuggestions and p1.robuxUpsellSuggestions.products and p1.robuxUpsellSuggestions.selection then p1.robuxUpsellSuggestions.products[p1.robuxUpsellSuggestions.selection] else nil
end

return {
	getRobuxProductId = function(p1) --[[ Line: 14 ]]
		local Product = if p1.robuxUpsellSuggestions and p1.robuxUpsellSuggestions.products and p1.robuxUpsellSuggestions.selection then p1.robuxUpsellSuggestions.products[p1.robuxUpsellSuggestions.selection] else nil
		
		return if Product then Product.providerId else nil
	end,
	getProductId = function(p1) --[[ Line: 23 ]]
		local Product = if p1.robuxUpsellSuggestions and p1.robuxUpsellSuggestions.products and p1.robuxUpsellSuggestions.selection then p1.robuxUpsellSuggestions.products[p1.robuxUpsellSuggestions.selection] else nil
		
		return if Product then Product.productId else nil
	end,
	getProductName = function(p1) --[[ Line: 32 ]]
		local Product = if p1.robuxUpsellSuggestions and p1.robuxUpsellSuggestions.products and p1.robuxUpsellSuggestions.selection then p1.robuxUpsellSuggestions.products[p1.robuxUpsellSuggestions.selection] else nil
		
		return if Product then Product.productName else nil
	end,
	getRobuxPurchaseAmount = function(p1) --[[ Line: 41 ]]
		local Product = if p1.robuxUpsellSuggestions and p1.robuxUpsellSuggestions.products and p1.robuxUpsellSuggestions.selection then p1.robuxUpsellSuggestions.products[p1.robuxUpsellSuggestions.selection] else nil
		
		return if Product then Product.robuxAmount else nil
	end,
	getRobuxAmountBeforeBonus = function(p1) --[[ Line: 59 ]]
		local Product = if p1.robuxUpsellSuggestions and p1.robuxUpsellSuggestions.products and p1.robuxUpsellSuggestions.selection then p1.robuxUpsellSuggestions.products[p1.robuxUpsellSuggestions.selection] else nil
		
		return if Product then Product.robuxAmountBeforeBonus else nil
	end,
	getPrice = function(p1) --[[ Line: 50 ]]
		local Product = if p1.robuxUpsellSuggestions and p1.robuxUpsellSuggestions.products and p1.robuxUpsellSuggestions.selection then p1.robuxUpsellSuggestions.products[p1.robuxUpsellSuggestions.selection] else nil
		
		return if Product then Product.price else nil
	end
}