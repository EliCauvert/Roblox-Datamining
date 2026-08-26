local chatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local parent = chatLineReporting.Parent
local constantsModule = require(chatLineReporting.Common.Constants)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local inputLabel = foundationModule.InputLabel
local inputLabelSize = foundationModule.Enums.InputLabelSize
local fFlagEnableGlobalChatAbuseReporting = require(parent.SharedFlags).FFlagEnableGlobalChatAbuseReporting

local function _(p1, p2)
	-- upvalues: constantsModule (ref)
	return if string.match(p1, constantsModule.ChannelTypes.Whisper) then p2.localizedText.ChatEyebrowSentPrivately else p2.localizedText.ChatEyebrowSentInAnotherChat
end

return function(p1)
	-- upvalues: fFlagEnableGlobalChatAbuseReporting (ref), constantsModule (ref), reactModule (ref), view (ref), inputLabel (ref), inputLabelSize (ref)
	return if fFlagEnableGlobalChatAbuseReporting and not p1.message.textChannel or p1.message.textChannel.Name == constantsModule.ChannelTypes.General then nil else reactModule.createElement(view, {
		tag = "auto-xy bg-shift-200 padding-left-xsmall padding-right-xsmall radius-small",
		LayoutOrder = 1
	}, {
		eyebrowLabel = reactModule.createElement(inputLabel, {
			RichText = true,
			Text = if string.match(p1.message.textChannel.Name, constantsModule.ChannelTypes.Whisper) then p1.localizedText.ChatEyebrowSentPrivately else p1.localizedText.ChatEyebrowSentInAnotherChat,
			size = inputLabelSize.Small
		})
	})
end