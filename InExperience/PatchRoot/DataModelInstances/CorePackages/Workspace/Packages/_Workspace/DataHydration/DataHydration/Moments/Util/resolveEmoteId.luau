local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)

return {
	resolveEmoteIdForReaction = function(p1, p2)
		local replaced = string.gsub(string.lower(p2), "%-", "")
		local var1 = if replaced == "crying" then "cry" else replaced
		
		for i, v in p1 do
			if v.id ~= p2 then
				local replaced_1 = string.gsub(string.lower(v.name), "%-", "")
				
				if (if replaced_1 == "crying" then "cry" else replaced_1) == var1 then
					return v.id
				end
			end
			return v.id
		end
		return p2
	end,
	reactionTypeForEmoteId = function(p3, p4)
		for i, v in p3 do
			if v.id == p4 then
				local replaced = string.gsub(string.lower(v.name), "%-", "")
				
				return if replaced == "crying" then "cry" else replaced
			end
		end
		return p4
	end,
	normalizeName = function(p5)
		local replaced = string.gsub(string.lower(p5), "%-", "")
		
		return if replaced == "crying" then "cry" else replaced
	end
}