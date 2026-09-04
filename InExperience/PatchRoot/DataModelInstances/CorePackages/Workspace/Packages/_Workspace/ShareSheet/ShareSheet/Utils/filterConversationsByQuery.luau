local _ = require(script:FindFirstAncestor("ShareSheet").Parent.AppChat.GetConversationListStore)
local conversationUtilsModule = require(script.Parent.ConversationUtils)

return function(p1, p2, p3, p4)
	-- upvalues: conversationUtilsModule (ref)
	if p2 == "" then
		return p1
	end
	local lowerText = string.lower(p2)
	local t = {}
	
	for i, v in p1 do
		if string.find(string.lower((if p3 then p3[v.id] else nil) or conversationUtilsModule.getDisplayName(v) or ""), lowerText, 1, true) ~= nil or string.find(string.lower(if p4 then p4[v.id] or "" else ""), lowerText, 1, true) ~= nil then
			table.insert(t, v)
		end
	end
	return t
end