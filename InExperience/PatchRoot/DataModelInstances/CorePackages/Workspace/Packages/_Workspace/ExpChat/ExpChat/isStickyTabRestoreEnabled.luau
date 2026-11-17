local ExpChat = script:FindFirstAncestor("ExpChat")
local FFlagExpChatStickyTabs = require(ExpChat.Parent.SharedFlags).FFlagExpChatStickyTabs
local FFlagExpChatStickyTabsIxpEnabledModule = require(ExpChat.Flags.FFlagExpChatStickyTabsIxpEnabled)

return function()
	-- upvalues: FFlagExpChatStickyTabs (copy), FFlagExpChatStickyTabsIxpEnabledModule (copy)
	return FFlagExpChatStickyTabs and FFlagExpChatStickyTabsIxpEnabledModule
end