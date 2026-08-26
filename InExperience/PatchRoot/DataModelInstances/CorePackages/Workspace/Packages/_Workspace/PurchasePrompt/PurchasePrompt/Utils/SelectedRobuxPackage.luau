local function _(p1)
	return if p1.robuxUpsellSuggestions and p1.robuxUpsellSuggestions.products and p1.robuxUpsellSuggestions.selection then p1.robuxUpsellSuggestions.products[p1.robuxUpsellSuggestions.selection] else nil
end

return {
	getRobuxProductId = function(p1)
		local var1 = if p1.robuxUpsellSuggestions and p1.robuxUpsellSuggestions.products and p1.robuxUpsellSuggestions.selection then p1.robuxUpsellSuggestions.products[p1.robuxUpsellSuggestions.selection] else nil
		
		return if var1 then var1.providerId else nil
	end,
	getProductId = function(p1)
		local var1 = if p1.robuxUpsellSuggestions and p1.robuxUpsellSuggestions.products and p1.robuxUpsellSuggestions.selection then p1.robuxUpsellSuggestions.products[p1.robuxUpsellSuggestions.selection] else nil
		
		return if var1 then var1.productId else nil
	end,
	getProductName = function(p1)
		local var1 = if p1.robuxUpsellSuggestions and p1.robuxUpsellSuggestions.products and p1.robuxUpsellSuggestions.selection then p1.robuxUpsellSuggestions.products[p1.robuxUpsellSuggestions.selection] else nil
		
		return if var1 then var1.productName else nil
	end,
	getRobuxPurchaseAmount = function(p1)
		local var1 = if p1.robuxUpsellSuggestions and p1.robuxUpsellSuggestions.products and p1.robuxUpsellSuggestions.selection then p1.robuxUpsellSuggestions.products[p1.robuxUpsellSuggestions.selection] else nil
		
		return if var1 then var1.robuxAmount else nil
	end,
	getRobuxAmountBeforeBonus = function(p1)
		local var1 = if p1.robuxUpsellSuggestions and p1.robuxUpsellSuggestions.products and p1.robuxUpsellSuggestions.selection then p1.robuxUpsellSuggestions.products[p1.robuxUpsellSuggestions.selection] else nil
		
		return if var1 then var1.robuxAmountBeforeBonus else nil
	end,
	getPrice = function(p1)
		local var1 = if p1.robuxUpsellSuggestions and p1.robuxUpsellSuggestions.products and p1.robuxUpsellSuggestions.selection then p1.robuxUpsellSuggestions.products[p1.robuxUpsellSuggestions.selection] else nil
		
		return if var1 then var1.price else nil
	end
}