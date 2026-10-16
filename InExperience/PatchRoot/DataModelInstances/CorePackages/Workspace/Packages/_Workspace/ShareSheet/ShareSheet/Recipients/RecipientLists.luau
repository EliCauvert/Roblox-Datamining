local ShareSheet = script:FindFirstAncestor("ShareSheet")
local _ = require(ShareSheet.Types)

return {
	[require(script.Parent.RecipientSource).RecipientSource.ChatInbox] = require(ShareSheet.Recipients.Sources.createChatInboxRecipientList)
}