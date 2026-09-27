local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)
local isCanonicalNonzeroUuidModule = require(script.Parent.isCanonicalNonzeroUuid)

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
	resolveOptionalEmoteIdForReaction = function(p3, p4)
		-- upvalues: isCanonicalNonzeroUuidModule (ref)
		local replaced = string.gsub(string.lower(p4), "%-", "")
		local var2 = if replaced == "crying" then "cry" else replaced
		
		for i, v in p3 do
			local replaced_1 = string.gsub(string.lower(v.name), "%-", "")
			
			if (if replaced_1 == "crying" then "cry" else replaced_1) == var2 and isCanonicalNonzeroUuidModule(v.id) then
				return v.id
			end
		end
		return nil
	end,
	reactionTypeForEmoteId = function(p5, p6)
		for i, v in p5 do
			if v.id == p6 then
				local replaced = string.gsub(string.lower(v.name), "%-", "")
				
				return if replaced == "crying" then "cry" else replaced
			end
		end
		return p6
	end,
	normalizeName = function(p7)
		local replaced = string.gsub(string.lower(p7), "%-", "")
		
		return if replaced == "crying" then "cry" else replaced
	end
}