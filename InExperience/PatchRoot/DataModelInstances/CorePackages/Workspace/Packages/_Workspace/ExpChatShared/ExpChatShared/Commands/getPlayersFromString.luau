local dictionary = require(script:FindFirstAncestor("ExpChatShared").Parent.llama).Dictionary

return function(p0, p1) --[[ line: 12 | named "getPlayersFromCommand" ]]
	-- upvalues: dictionary (ref)
	if not p1 then
		return {}
	end
	assert(p1, "will exist")
	local lowerText = string.lower(p1)
	
	if lowerText and string.sub(lowerText, 1, 1) == "@" then
		local var1 = p0.byUsername[string.sub(lowerText, 2)]
		
		return if var1 then {
			dictionary.join(p0.byUserId[var1], { nameToDisplay = "@" .. p0.byUserId[var1].username })
		} else dictionary.map(p0.byDisplayName[lowerText] or {}, function(p2) --[[ line: 28 ]]
			-- upvalues: dictionary (copy), p0 (ref)
			return dictionary.join(p0.byUserId[p2], { nameToDisplay = p0.byUserId[p2].displayName })
		end)
	end
end