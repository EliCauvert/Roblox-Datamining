local realtimeDeliveryModule = require(script:FindFirstAncestor("AppChat").Parent.RealtimeDelivery)
local constantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.PlatformChatConversationTypes)

return function(p1, p2)
	-- upvalues: realtimeDeliveryModule (ref), constantsModule (ref)
	realtimeDeliveryModule.useRealtimeNamespace(constantsModule.PlatformChatConversation.Namespace, p1, p2)
end