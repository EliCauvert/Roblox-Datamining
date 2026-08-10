local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)

return {
	resolveEmoteIdForReaction = function(p0, p1) --[[ line: 22 ]]
		local replaced = string.gsub(string.lower(p1), "%-", "")
		local var1 = if replaced == "crying" then "cry" else replaced
		
		for i, v in p0 do
			if v.id ~= p1 then
				local replaced_1 = string.gsub(string.lower(v.name), "%-", "")
				
				if (if replaced_1 == "crying" then "cry" else replaced_1) == var1 then
					return v.id
				end
			end
			return v.id
		end
		return p1
	end,
	reactionTypeForEmoteId = function(p2, p3) --[[ line: 36 ]]
		for i, v in p2 do
			if v.id == p3 then
				local replaced = string.gsub(string.lower(v.name), "%-", "")
				
				return if replaced == "crying" then "cry" else replaced
			end
		end
		return p3
	end,
	normalizeName = function(p4) --[[ line: 12 ]]
		local replaced = string.gsub(string.lower(p4), "%-", "")
		
		return if replaced == "crying" then "cry" else replaced
	end
}