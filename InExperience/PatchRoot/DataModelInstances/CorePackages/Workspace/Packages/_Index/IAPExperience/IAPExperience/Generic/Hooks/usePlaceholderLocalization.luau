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

return function(p0) --[[ line: 24 | named "usePlaceholderLocalization" ]]
	-- upvalues: reactModule (ref), t (ref)
	return reactModule.useMemo(function() --[[ line: 25 ]]
		-- upvalues: p0 (ref), t (copy)
		local t_1 = {}
		
		for i, v in pairs(p0) do
			local var3 = if typeof(v) == "table" then v[1] else v
			local var4 = t[var3] or var3
			
			if typeof(v) == "table" then
				for i_1, v_1 in pairs(v) do
					if typeof(i_1) == "string" then
						var4 = string.gsub(var4, "{" .. i_1 .. "}", function() --[[ line: 33 ]]
							-- upvalues: v_1 (ref)
							return tostring(v_1)
						end)
					end
				end
			end
			t_1[i] = var4
		end
		return t_1
	end, { p0 })
end