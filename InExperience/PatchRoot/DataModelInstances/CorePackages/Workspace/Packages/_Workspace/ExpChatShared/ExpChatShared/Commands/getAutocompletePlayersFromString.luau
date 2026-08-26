local parent = script:FindFirstAncestor("ExpChatShared").Parent
local dictionary = require(parent.llama).Dictionary
local list = require(parent.llama).List

return function(p1, p2)
	-- upvalues: dictionary (ref), list (ref)
	local t = {}
	local lowerText = string.lower(p2)
	
	if string.sub(lowerText, 1, 1) == "@" then
		lowerText = string.sub(lowerText, 2)
		t = dictionary.values(dictionary.filter(p1.byUsername, function(_, p3)
			-- upvalues: lowerText (ref)
			return string.find(p3, "^" .. lowerText) ~= nil
		end))
	else
		lowerText = lowerText
		
		for i, v in pairs(dictionary.filter(p1.byDisplayName, function(_, p3)
			-- upvalues: lowerText (ref)
			return string.find(p3, "^" .. lowerText) ~= nil
		end)) do
			for i_1, v_1 in ipairs(v) do
				table.insert(t, v_1)
			end
		end
	end
	return list.map(t, function(p3)
		-- upvalues: p1 (ref)
		return p1.byUserId[tostring(p3)]
	end)
end