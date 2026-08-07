local realtimeDeliveryModule = require(script:FindFirstAncestor("AppChat").Parent.RealtimeDelivery)
local constantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.PlatformChatConversationTypes)

return function(p0, p1) --[[ line: 10 | named "useRealtimePlatformChatConversation" ]]
	-- upvalues: realtimeDeliveryModule (ref), constantsModule (ref)
	realtimeDeliveryModule.useRealtimeNamespace(constantsModule.PlatformChatConversation.Namespace, p0, p1)
end