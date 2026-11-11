local Parent = script:FindFirstAncestor("ExpChat").Parent
local FFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule = require(script:FindFirstAncestor("ExpChat").Flags.FFlagExpChatEnablePostProcessRichSystemMessageTextFormat)
local FFlagExpChatDictation = require(Parent.SharedFlags).FFlagExpChatDictation

return require(Parent.Rodux).makeActionCreator(script.Name, function(Text, ChannelNameOverride, Metadata, p1, p2)
	-- upvalues: FFlagExpChatDictation (copy), FFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule (copy)
	return {
		text = Text,
		channelNameOverride = ChannelNameOverride,
		metadata = Metadata,
		isError = if FFlagExpChatDictation then p1 else nil,
		postProcessMessage = if FFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule then p2 else nil
	}
end)