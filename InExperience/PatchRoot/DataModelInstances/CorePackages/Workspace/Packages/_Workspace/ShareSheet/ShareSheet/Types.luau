local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local _ = require(Parent.AppChat.GetConversationListStore)
local _ = require(ShareSheet.Recipients.ListRecipientsStatus)
local _ = require(Parent.Signals)

return {}