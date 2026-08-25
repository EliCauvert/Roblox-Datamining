local appChat = script:FindFirstAncestor("AppChat")
local shouldShowOSAForConversationModule = require(appChat.Utils.shouldShowOSAForConversation)
local shouldShowU13ChatOptInForConversationModule = require(appChat.Utils.shouldShowU13ChatOptInForConversation)

return function(p0)
	-- upvalues: shouldShowOSAForConversationModule (ref), shouldShowU13ChatOptInForConversationModule (ref)
	return shouldShowOSAForConversationModule(p0) or shouldShowU13ChatOptInForConversationModule(p0)
end