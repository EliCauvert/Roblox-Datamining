local AppChat = script:FindFirstAncestor("AppChat")
local ShouldShowOSAForConversationModule = require(AppChat.Utils.shouldShowOSAForConversation)
local ShouldShowU13ChatOptInForConversationModule = require(AppChat.Utils.shouldShowU13ChatOptInForConversation)

return function(p1)
	-- upvalues: ShouldShowOSAForConversationModule (copy), ShouldShowU13ChatOptInForConversationModule (copy)
	return ShouldShowOSAForConversationModule(p1) or ShouldShowU13ChatOptInForConversationModule(p1)
end