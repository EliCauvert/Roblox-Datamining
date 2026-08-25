local chatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local constantsModule = require(chatLineReporting.Common.Constants)
local sharedFlagsModule = require(chatLineReporting.Parent.SharedFlags)
local fFlagEnableGlobalChatAbuseReporting = sharedFlagsModule.FFlagEnableGlobalChatAbuseReporting
local fFlagAbuseReportAttributedRBXSystemMessages = sharedFlagsModule.FFlagAbuseReportAttributedRBXSystemMessages

function isSystemMessage(p0)
	-- upvalues: fFlagAbuseReportAttributedRBXSystemMessages (ref), fFlagEnableGlobalChatAbuseReporting (ref), constantsModule (ref)
	return if not (not fFlagAbuseReportAttributedRBXSystemMessages and (not fFlagEnableGlobalChatAbuseReporting or p0.textChannel) and p0.textChannel.Name == constantsModule.ChannelTypes.System) then p0.userId and p0.userId ~= "0" else true
end

return isSystemMessage