local dictionary = require(script:FindFirstAncestor("ExpChatShared").Parent.llama).Dictionary

return function(p1, p2)
	-- upvalues: dictionary (ref)
	if not p2 then
		return {}
	end
	assert(p2, "will exist")
	local lowerText = string.lower(p2)
	
	if lowerText and string.sub(lowerText, 1, 1) == "@" then
		local var1 = p1.byUsername[string.sub(lowerText, 2)]
		
		return if var1 then {
			dictionary.join(p1.byUserId[var1], { nameToDisplay = "@" .. p0.byUserId[var1].username })
		} else dictionary.map(p1.byDisplayName[lowerText] or {}, function(p3)
			-- upvalues: dictionary (copy), p1 (ref)
			return dictionary.join(p1.byUserId[p3], { nameToDisplay = p1.byUserId[p3].displayName })
		end)
	end
end