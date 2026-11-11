local ChatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local ConstantsModule = require(ChatLineReporting.Common.Constants)
local FFlagEnableGlobalChatAbuseReporting = require(ChatLineReporting.Parent.SharedFlags).FFlagEnableGlobalChatAbuseReporting

function isSystemMessage(p1): boolean
	-- upvalues: FFlagEnableGlobalChatAbuseReporting (copy), ConstantsModule (copy)
	return (not FFlagEnableGlobalChatAbuseReporting or p1.textChannel) and p1.textChannel.Name == ConstantsModule.ChannelTypes.System or (not p1.userId or p1.userId == "0")
end

return isSystemMessage