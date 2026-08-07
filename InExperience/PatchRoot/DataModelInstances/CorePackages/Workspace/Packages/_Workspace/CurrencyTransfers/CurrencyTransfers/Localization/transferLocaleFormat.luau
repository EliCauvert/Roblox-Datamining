return {
	substituteAmount = function(p0, p1) --[[ line: 5 ]]
		local replaced, _ = string.gsub(p0, "{amount}", tostring(p1))
		
		return replaced
	end,
	substituteReceiverNotAllowed = function(p2, p3) --[[ line: 10 ]]
		local var1 = tostring(p3)
		local replaced, _ = string.gsub(p2, "{userName}", var1)
		local replaced_1, _ = string.gsub(replaced, "{username}", var1)
		
		return replaced_1
	end,
	substituteUsername = function(p4, p5) --[[ line: 17 ]]
		local replaced, _ = string.gsub(p4, "{username}", tostring(p5))
		
		return replaced
	end,
	substituteMinAmount = function(a, b) --[[ line: 22 ]]
		local replaced, _ = string.gsub(a, "{minAmount}", tostring(b))
		
		return replaced
	end,
	substituteMaxAmount = function(a, b) --[[ line: 27 ]]
		local replaced, _ = string.gsub(a, "{maxAmount}", tostring(b))
		
		return replaced
	end
}