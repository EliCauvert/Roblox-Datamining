local RecipientSource = { ChatInbox = "chatInbox" }
local t = {}

for _, value in RecipientSource do
	t[value] = true
end
return {
	RecipientSource = RecipientSource,
	DefaultRecipientSource = RecipientSource.ChatInbox,
	isValidRecipientSource = function(p1): boolean --[[ Line: 14 ]]
		-- upvalues: t (copy)
		return t[p1] == true
	end
}