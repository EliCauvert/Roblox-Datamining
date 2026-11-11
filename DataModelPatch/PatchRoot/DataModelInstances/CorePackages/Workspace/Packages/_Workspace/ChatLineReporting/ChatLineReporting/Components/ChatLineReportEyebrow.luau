local ChatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local Parent = ChatLineReporting.Parent
local ConstantsModule = require(ChatLineReporting.Common.Constants)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local InputLabel = FoundationModule.InputLabel
local InputLabelSize = FoundationModule.Enums.InputLabelSize
local FFlagEnableGlobalChatAbuseReporting = require(Parent.SharedFlags).FFlagEnableGlobalChatAbuseReporting

local function _(Text: string, p1)
	-- upvalues: ConstantsModule (copy)
	return if string.match(Text, ConstantsModule.ChannelTypes.Whisper) then p1.localizedText.ChatEyebrowSentPrivately else p1.localizedText.ChatEyebrowSentInAnotherChat
end

return function(p1)
	-- upvalues: FFlagEnableGlobalChatAbuseReporting (copy), ConstantsModule (copy), ReactModule (copy), View (copy), InputLabel (copy), InputLabelSize (copy)
	if FFlagEnableGlobalChatAbuseReporting and not p1.message.textChannel or p1.message.textChannel.Name == ConstantsModule.ChannelTypes.General then
		return nil
	else
		return (ReactModule.createElement(View, {
			tag = "auto-xy bg-shift-200 padding-left-xsmall padding-right-xsmall radius-small",
			LayoutOrder = 1
		}, {
			eyebrowLabel = ReactModule.createElement(InputLabel, {
				RichText = true,
				Text = if string.match(p1.message.textChannel.Name, ConstantsModule.ChannelTypes.Whisper) then p1.localizedText.ChatEyebrowSentPrivately else p1.localizedText.ChatEyebrowSentInAnotherChat,
				size = InputLabelSize.Small
			})
		}))
	end
end