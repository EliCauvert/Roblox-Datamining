local reactModule = require(script:FindFirstAncestor("IAPExperience").Parent.React)
local t = {
	["IAPExperience.PurchasePrompt.Label.BlackbirdDiscount"] = "Sit amet ({discountPercentage}% elit)",
	["IAPExperience.PurchasePrompt.Label.BlackbirdDiscountNoPercent"] = "Sit amet",
	["IAPExperience.PurchasePrompt.Label.GenericDiscount"] = "... ({discountPercentage}% elit)",
	["IAPExperience.PurchasePrompt.Label.GenericDiscountNoPercent"] = "...",
	["IAPExperience.PurchasePrompt.Label.BlackbirdSummary"] = "Lorem {robuxIcon} {savingsAmount} ipsum dolor",
	["IAPExperience.PurchasePrompt.Label.Subtotal"] = "Subtotal",
	["IAPExperience.PurchasePrompt.Label.SubtotalWithItemCount"] = "Subtotal ({itemCount} items)",
	["IAPExperience.PurchasePrompt.Label.Total"] = "Total"
}

return function(p1)
	-- upvalues: reactModule (ref), t (ref)
	return reactModule.useMemo(function()
		-- upvalues: p1 (ref), t (copy)
		local t_1 = {}
		
		for i, v in pairs(p1) do
			local var1 = if typeof(v) == "table" then v[1] else v
			local var2 = t[var1] or var1
			
			if typeof(v) == "table" then
				for i_1, v_1 in pairs(v) do
					if typeof(i_1) == "string" then
						var2 = string.gsub(var2, "{" .. i_1 .. "}", function()
							-- upvalues: v_1 (ref)
							return tostring(v_1)
						end)
					end
				end
			end
			t_1[i] = var2
		end
		return t_1
	end, { p1 })
end