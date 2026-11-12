local ConversationUtilsModule = require(script.Parent.ConversationUtils)
local MatchesQueryModule = require(script.Parent.matchesQuery)
local _ = require(script:FindFirstAncestor("ShareSheet").Types)

return function(List, Text: string, p1, p2)
	-- upvalues: ConversationUtilsModule (copy), MatchesQueryModule (copy)
	if Text == "" then
		return List
	end
	local Lowered = string.lower(Text)
	local List1 = {}
	
	for _, value in List do
		if MatchesQueryModule(Lowered, (if p1 then p1[value.id] else nil) or ConversationUtilsModule.getDisplayName(value) or "", p2 and p2[value.id] or "") then
			table.insert(List1, value)
		end
	end
	return List1
end