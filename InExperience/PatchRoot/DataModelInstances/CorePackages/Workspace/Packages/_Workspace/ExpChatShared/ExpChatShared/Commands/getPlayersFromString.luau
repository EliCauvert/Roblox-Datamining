local Dictionary = require(script:FindFirstAncestor("ExpChatShared").Parent.llama).Dictionary

return function(p1, Text: string) --[[ Line: 12 | Named "getPlayersFromCommand" ]]
	-- upvalues: Dictionary (copy)
	if not Text then
		return {}
	end
	assert(Text, "will exist")
	local Lowered = string.lower(Text)
	
	if Lowered and string.sub(Lowered, 1, 1) == "@" then
		local ByUsernameEntry = p1.byUsername[string.sub(Lowered, 2)]
		
		if ByUsernameEntry then
			return {
				Dictionary.join(p1.byUserId[ByUsernameEntry], {
					nameToDisplay = "@" .. p1.byUserId[ByUsernameEntry].username
				})
			}
		end
	end
	return Dictionary.map(p1.byDisplayName[Lowered] or {}, function(p2) --[[ Line: 28 ]]
		-- upvalues: Dictionary (upval), p1 (copy)
		return Dictionary.join(p1.byUserId[p2], { nameToDisplay = p1.byUserId[p2].displayName })
	end)
end