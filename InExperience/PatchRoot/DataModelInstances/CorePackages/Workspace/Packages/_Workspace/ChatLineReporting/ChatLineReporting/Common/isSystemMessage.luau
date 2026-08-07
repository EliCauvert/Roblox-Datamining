local chatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local constantsModule = require(chatLineReporting.Common.Constants)
local fFlagEnableGlobalChatAbuseReporting = require(chatLineReporting.Parent.SharedFlags).FFlagEnableGlobalChatAbuseReporting

function isSystemMessage(p0) --[[ line: 11 ]]
	-- upvalues: fFlagEnableGlobalChatAbuseReporting (ref), constantsModule (ref)
	return if not ((not fFlagEnableGlobalChatAbuseReporting or p0.textChannel) and p0.textChannel.Name == constantsModule.ChannelTypes.System) then p0.userId and p0.userId ~= "0" else true
end

return isSystemMessage