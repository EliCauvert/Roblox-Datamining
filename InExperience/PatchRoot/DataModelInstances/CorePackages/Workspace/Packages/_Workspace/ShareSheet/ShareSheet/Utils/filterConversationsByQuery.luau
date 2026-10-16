local ConversationUtilsModule = require(script.Parent.ConversationUtils)
local _ = require(script:FindFirstAncestor("ShareSheet").Types)

return function(List, Text: string, p1, p2) --[[ Line: 10 | Named "filterConversationsByQuery" ]]
	-- upvalues: ConversationUtilsModule (copy)
	if Text == "" then
		return List
	end
	local Lowered = string.lower(Text)
	local List1 = {}
	
	for _, value in List do
		local Lowered1 = string.lower(p2 and p2[value.id] or "")
		
		if string.find(string.lower((if p1 then p1[value.id] else nil) or ConversationUtilsModule.getDisplayName(value) or ""), Lowered, 1, true) ~= nil or string.find(Lowered1, Lowered, 1, true) ~= nil then
			table.insert(List1, value)
		end
	end
	return List1
end