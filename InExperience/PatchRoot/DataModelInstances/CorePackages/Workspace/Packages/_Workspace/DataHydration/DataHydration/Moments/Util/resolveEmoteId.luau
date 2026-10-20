local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)
local IsCanonicalNonzeroUuidModule = require(script.Parent.isCanonicalNonzeroUuid)

return {
	resolveEmoteIdForReaction = function(List, Text: string)
		local Replaced = string.gsub(string.lower(Text), "%-", "")
		local Cry: string = if Replaced == "crying" then "cry" else Replaced
		for _, value in List do
			if value.id == Text then
				return value.id
			end
			local Replaced1 = string.gsub(string.lower(value.name), "%-", "")
			
			if (if Replaced1 == "crying" then "cry" else Replaced1) == Cry then
				return value.id
			end
		end
		return Text
	end,
	resolveOptionalEmoteIdForReaction = function(List, Text: string)
		-- upvalues: IsCanonicalNonzeroUuidModule (copy)
		local Replaced = string.gsub(string.lower(Text), "%-", "")
		local Cry: string = if Replaced == "crying" then "cry" else Replaced
		for _, value in List do
			local Replaced1 = string.gsub(string.lower(value.name), "%-", "")
			
			if (if Replaced1 == "crying" then "cry" else Replaced1) == Cry and IsCanonicalNonzeroUuidModule(value.id) then
				return value.id
			end
		end
		return nil
	end,
	reactionTypeForEmoteId = function(List, Id)
		for _, value in List do
			if value.id == Id then
				local Replaced = string.gsub(string.lower(value.name), "%-", "")
				
				return if Replaced == "crying" then "cry" else Replaced
			end
		end
		return Id
	end,
	normalizeName = function(Text: string): string
		local Replaced = string.gsub(string.lower(Text), "%-", "")
		
		return if Replaced == "crying" then "cry" else Replaced
	end
}