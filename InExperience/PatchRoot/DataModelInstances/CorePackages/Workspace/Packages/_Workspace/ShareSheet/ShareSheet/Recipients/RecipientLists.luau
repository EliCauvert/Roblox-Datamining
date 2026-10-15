local shareSheet = script:FindFirstAncestor("ShareSheet")
local _ = require(shareSheet.Types)

return {
	[require(script.Parent.RecipientSource).RecipientSource.ChatInbox] = require(shareSheet.Recipients.Sources.createChatInboxRecipientList)
}