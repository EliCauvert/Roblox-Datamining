return {
	substituteAmount = function(Text: string, p1) --[[ Line: 5 ]]
		local Replaced, _ = string.gsub(Text, "{amount}", (tostring(p1)))
		
		return Replaced
	end,
	substituteReceiverNotAllowed = function(Text: string, p1) --[[ Line: 10 ]]
		local Text1 = tostring(p1)
		local Replaced, _ = string.gsub(Text, "{userName}", Text1)
		local Replaced1, _ = string.gsub(Replaced, "{username}", Text1)
		
		return Replaced1
	end,
	substituteUsername = function(Text: string, p1) --[[ Line: 17 ]]
		local Replaced, _ = string.gsub(Text, "{username}", (tostring(p1)))
		
		return Replaced
	end,
	substituteMinAmount = function(Text: string, p1) --[[ Line: 22 ]]
		local Replaced, _ = string.gsub(Text, "{minAmount}", (tostring(p1)))
		
		return Replaced
	end,
	substituteMaxAmount = function(Text: string, p1) --[[ Line: 27 ]]
		local Replaced, _ = string.gsub(Text, "{maxAmount}", (tostring(p1)))
		
		return Replaced
	end
}