local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local _ = require(parent.AppChat.GetConversationListStore)
local _ = require(shareSheet.Recipients.ListRecipientsStatus)
local _ = require(parent.Signals)

return {}