local ChatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local ConstantsModule = require(ChatLineReporting.Common.Constants)
local SharedFlagsModule = require(ChatLineReporting.Parent.SharedFlags)
local FFlagEnableGlobalChatAbuseReporting = SharedFlagsModule.FFlagEnableGlobalChatAbuseReporting
local FFlagAbuseReportAttributedRBXSystemMessages = SharedFlagsModule.FFlagAbuseReportAttributedRBXSystemMessages

function isSystemMessage(p1): boolean --[[ Line: 15 ]]
	-- upvalues: FFlagAbuseReportAttributedRBXSystemMessages (copy), FFlagEnableGlobalChatAbuseReporting (copy), ConstantsModule (copy)
	return not FFlagAbuseReportAttributedRBXSystemMessages and (not FFlagEnableGlobalChatAbuseReporting or p1.textChannel) and p1.textChannel.Name == ConstantsModule.ChannelTypes.System or (not p1.userId or p1.userId == "0")
end

return isSystemMessage