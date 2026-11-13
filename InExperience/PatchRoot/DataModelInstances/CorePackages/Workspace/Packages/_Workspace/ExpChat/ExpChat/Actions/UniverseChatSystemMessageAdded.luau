local Parent = script:FindFirstAncestor("ExpChat").Parent
local RoduxModule = require(Parent.Rodux)
local FFlagExpChatDictation = require(Parent.SharedFlags).FFlagExpChatDictation

return RoduxModule.makeActionCreator(script.Name, function(Text, ChannelNameOverride, Metadata, p1, PostProcessMessage)
	-- upvalues: FFlagExpChatDictation (copy)
	return {
		text = Text,
		channelNameOverride = ChannelNameOverride,
		metadata = Metadata,
		isError = if FFlagExpChatDictation then p1 else nil,
		postProcessMessage = PostProcessMessage
	}
end)