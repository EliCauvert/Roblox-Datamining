local ReactModule = require(script:FindFirstAncestor("IAPExperience").Parent.React)
local config = {
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
	-- upvalues: ReactModule (copy), config (copy)
	return ReactModule.useMemo(function()
		-- upvalues: p1 (copy), config (upval)
		local t = {}
		
		for i, value in pairs(p1) do
			local v1 = if typeof(value) == "table" then value[1] else value
			local Entry = config[v1] or v1
			
			if typeof(value) == "table" then
				for i1, value1 in pairs(value) do
					if typeof(i1) == "string" then
						Entry = string.gsub(Entry, "{" .. i1 .. "}", function(): string
							-- upvalues: value1 (copy)
							return (tostring(value1))
						end)
					end
				end
			end
			t[i] = Entry
		end
		return t
	end, { p1 })
end