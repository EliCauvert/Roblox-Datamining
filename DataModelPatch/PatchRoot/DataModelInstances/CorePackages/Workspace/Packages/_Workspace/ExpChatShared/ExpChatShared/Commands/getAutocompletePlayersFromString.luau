local Parent = script:FindFirstAncestor("ExpChatShared").Parent
local Dictionary = require(Parent.llama).Dictionary
local List = require(Parent.llama).List

return function(p1, Text: string)
	-- upvalues: Dictionary (copy), List (copy)
	local ValuesResult = {}
	local Lowered = string.lower(Text)
	
	if string.sub(Lowered, 1, 1) == "@" then
		local Segment = string.sub(Lowered, 2)
		ValuesResult = Dictionary.values(Dictionary.filter(p1.byUsername, function(_, Text: string): boolean
			-- upvalues: Segment (copy)
			return string.find(Text, "^" .. Segment) ~= nil
		end))
	else
		for _, value in pairs((Dictionary.filter(p1.byDisplayName, function(_, Text: string): boolean
			-- upvalues: Lowered (copy)
			return string.find(Text, "^" .. Lowered) ~= nil
		end))) do
			for _, value1 in ipairs(value) do
				table.insert(ValuesResult, value1)
			end
		end
	end
	return List.map(ValuesResult, function(p2)
		-- upvalues: p1 (copy)
		return p1.byUserId[tostring(p2)]
	end)
end