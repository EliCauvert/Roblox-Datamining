local function _(p0) --[[ line: 3 | named "getSelectedRobuxPackage" ]]
	return if p0.robuxUpsellSuggestions and p0.robuxUpsellSuggestions.products and p0.robuxUpsellSuggestions.selection then p0.robuxUpsellSuggestions.products[p0.robuxUpsellSuggestions.selection] else nil
end

return {
	getRobuxProductId = function(p1) --[[ line: 14 ]]
		local var0 = if p1.robuxUpsellSuggestions and p1.robuxUpsellSuggestions.products and p1.robuxUpsellSuggestions.selection then p1.robuxUpsellSuggestions.products[p1.robuxUpsellSuggestions.selection] else nil
		
		return if var0 then var0.providerId else nil
	end,
	getProductId = function(p2) --[[ line: 23 ]]
		local var1 = if p2.robuxUpsellSuggestions and p2.robuxUpsellSuggestions.products and p2.robuxUpsellSuggestions.selection then p2.robuxUpsellSuggestions.products[p2.robuxUpsellSuggestions.selection] else nil
		
		return if var1 then var1.productId else nil
	end,
	getProductName = function(p3) --[[ line: 32 ]]
		local var2 = if p3.robuxUpsellSuggestions and p3.robuxUpsellSuggestions.products and p3.robuxUpsellSuggestions.selection then p3.robuxUpsellSuggestions.products[p3.robuxUpsellSuggestions.selection] else nil
		
		return if var2 then var2.productName else nil
	end,
	getRobuxPurchaseAmount = function(p4) --[[ line: 41 ]]
		local var3 = if p4.robuxUpsellSuggestions and p4.robuxUpsellSuggestions.products and p4.robuxUpsellSuggestions.selection then p4.robuxUpsellSuggestions.products[p4.robuxUpsellSuggestions.selection] else nil
		
		return if var3 then var3.robuxAmount else nil
	end,
	getRobuxAmountBeforeBonus = function(p5) --[[ line: 59 ]]
		local var4 = if p5.robuxUpsellSuggestions and p5.robuxUpsellSuggestions.products and p5.robuxUpsellSuggestions.selection then p5.robuxUpsellSuggestions.products[p5.robuxUpsellSuggestions.selection] else nil
		
		return if var4 then var4.robuxAmountBeforeBonus else nil
	end,
	getPrice = function(p6) --[[ line: 50 ]]
		local var5 = if p6.robuxUpsellSuggestions and p6.robuxUpsellSuggestions.products and p6.robuxUpsellSuggestions.selection then p6.robuxUpsellSuggestions.products[p6.robuxUpsellSuggestions.selection] else nil
		
		return if var5 then var5.price else nil
	end
}