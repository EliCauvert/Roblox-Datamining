local parent = script:FindFirstAncestor("ExpChatShared").Parent
local dictionary = require(parent.llama).Dictionary
local list = require(parent.llama).List

return function(p0, p1) --[[ line: 12 | named "getAutocompletePlayersFromString" ]]
	-- upvalues: dictionary (ref), list (ref)
	local t = {}
	local lowerText = string.lower(p1)
	
	if string.sub(lowerText, 1, 1) == "@" then
		lowerText = string.sub(lowerText, 2)
		t = dictionary.values(dictionary.filter(p0.byUsername, function(_, p2) --[[ line: 17 ]]
			-- upvalues: lowerText (ref)
			return string.find(p2, "^" .. lowerText) ~= nil
		end))
	else
		lowerText = lowerText
		
		for i, v in pairs(dictionary.filter(p0.byDisplayName, function(_, p3) --[[ line: 22 ]]
			-- upvalues: lowerText (ref)
			return string.find(p3, "^" .. lowerText) ~= nil
		end)) do
			for i_1, v_1 in ipairs(v) do
				table.insert(t, v_1)
			end
		end
	end
	return list.map(t, function(p4) --[[ line: 33 ]]
		-- upvalues: p0 (ref)
		return p0.byUserId[tostring(p4)]
	end)
end