local ShareSheet = script:FindFirstAncestor("ShareSheet")
local _ = require(ShareSheet.Types)
local RecipientSourceModule = require(script.Parent.RecipientSource)

return {
	[RecipientSourceModule.RecipientSource.ChatInbox] = require(ShareSheet.Recipients.Sources.createChatInboxRecipientList),
	[RecipientSourceModule.RecipientSource.OneToOneFriends] = require(ShareSheet.Recipients.Sources.createOneToOneFriendsRecipientList)
}