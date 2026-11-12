local ExpChat = script:FindFirstAncestor("ExpChat")
local FFlagExpChatStickyTabs = require(ExpChat.Parent.SharedFlags).FFlagExpChatStickyTabs
local FFlagExpChatGlobalTabDefaultModule = require(ExpChat.Flags.FFlagExpChatGlobalTabDefault)

return function()
	-- upvalues: FFlagExpChatStickyTabs (copy), FFlagExpChatGlobalTabDefaultModule (copy)
	return FFlagExpChatStickyTabs or FFlagExpChatGlobalTabDefaultModule
end