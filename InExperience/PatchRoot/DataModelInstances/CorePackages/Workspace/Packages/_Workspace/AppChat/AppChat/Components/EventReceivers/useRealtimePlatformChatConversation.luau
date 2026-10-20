local RealtimeDeliveryModule = require(script:FindFirstAncestor("AppChat").Parent.RealtimeDelivery)
local ConstantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.PlatformChatConversationTypes)

return function(p1, p2)
	-- upvalues: RealtimeDeliveryModule (copy), ConstantsModule (copy)
	RealtimeDeliveryModule.useRealtimeNamespace(ConstantsModule.PlatformChatConversation.Namespace, p1, p2)
end