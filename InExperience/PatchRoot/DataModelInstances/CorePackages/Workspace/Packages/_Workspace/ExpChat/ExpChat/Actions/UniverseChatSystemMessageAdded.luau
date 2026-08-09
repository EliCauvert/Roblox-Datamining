local parent = script:FindFirstAncestor("ExpChat").Parent
local roduxModule = require(parent.Rodux)
local fFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule = require(script:FindFirstAncestor("ExpChat").Flags.FFlagExpChatEnablePostProcessRichSystemMessageTextFormat)
local fFlagExpChatDictation = require(parent.SharedFlags).FFlagExpChatDictation

return roduxModule.makeActionCreator(script.Name, function(p0, p1, p2, p3, p4) --[[ line: 22 ]]
	-- upvalues: fFlagExpChatDictation (ref), fFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule (ref)
	return {
		text = p0,
		channelNameOverride = p1,
		metadata = p2,
		isError = if fFlagExpChatDictation then p3 else nil,
		postProcessMessage = if fFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule then p4 else nil
	}
end)