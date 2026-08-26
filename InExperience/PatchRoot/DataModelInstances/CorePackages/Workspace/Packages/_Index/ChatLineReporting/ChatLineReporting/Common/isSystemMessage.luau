local chatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local constantsModule = require(chatLineReporting.Common.Constants)
local sharedFlagsModule = require(chatLineReporting.Parent.SharedFlags)
local fFlagEnableGlobalChatAbuseReporting = sharedFlagsModule.FFlagEnableGlobalChatAbuseReporting
local fFlagAbuseReportAttributedRBXSystemMessages = sharedFlagsModule.FFlagAbuseReportAttributedRBXSystemMessages

function isSystemMessage(p1)
	-- upvalues: fFlagAbuseReportAttributedRBXSystemMessages (ref), fFlagEnableGlobalChatAbuseReporting (ref), constantsModule (ref)
	return if not (not fFlagAbuseReportAttributedRBXSystemMessages and (not fFlagEnableGlobalChatAbuseReporting or p1.textChannel) and p1.textChannel.Name == constantsModule.ChannelTypes.System) then p1.userId and p1.userId ~= "0" else true
end

return isSystemMessage