local t = { ChatInbox = "chatInbox" }
local t_1 = {}

for i, v in t do
	t_1[v] = true
end
return {
	RecipientSource = t,
	DefaultRecipientSource = t.ChatInbox,
	isValidRecipientSource = function(p1)
		-- upvalues: t_1 (ref)
		return t_1[p1] == true
	end
}