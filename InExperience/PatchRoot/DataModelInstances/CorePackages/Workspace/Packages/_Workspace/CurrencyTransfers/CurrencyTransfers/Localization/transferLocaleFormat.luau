return {
	substituteAmount = function(p1, p2)
		local replaced, _ = string.gsub(p1, "{amount}", tostring(p2))
		
		return replaced
	end,
	substituteReceiverNotAllowed = function(p1, p2)
		local var1 = tostring(p2)
		local replaced, _ = string.gsub(p1, "{userName}", var1)
		local replaced_1, _ = string.gsub(replaced, "{username}", var1)
		
		return replaced_1
	end,
	substituteUsername = function(p1, p2)
		local replaced, _ = string.gsub(p1, "{username}", tostring(p2))
		
		return replaced
	end,
	substituteMinAmount = function(a, b)
		local replaced, _ = string.gsub(a, "{minAmount}", tostring(b))
		
		return replaced
	end,
	substituteMaxAmount = function(a, b)
		local replaced, _ = string.gsub(a, "{maxAmount}", tostring(b))
		
		return replaced
	end
}