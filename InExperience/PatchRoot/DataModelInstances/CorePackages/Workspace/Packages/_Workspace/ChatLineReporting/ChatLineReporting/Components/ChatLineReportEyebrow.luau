local chatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local parent = chatLineReporting.Parent
local constantsModule = require(chatLineReporting.Common.Constants)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local inputLabel = foundationModule.InputLabel
local inputLabelSize = foundationModule.Enums.InputLabelSize
local fFlagEnableGlobalChatAbuseReporting = require(parent.SharedFlags).FFlagEnableGlobalChatAbuseReporting

local function _(p0, p1) --[[ line: 20 | named "getEyebrowText" ]]
	-- upvalues: constantsModule (ref)
	return if string.match(p0, constantsModule.ChannelTypes.Whisper) then p1.localizedText.ChatEyebrowSentPrivately else p1.localizedText.ChatEyebrowSentInAnotherChat
end

return function(p2) --[[ line: 28 | named "ChatLineReportEyebrow" ]]
	-- upvalues: fFlagEnableGlobalChatAbuseReporting (ref), constantsModule (ref), reactModule (ref), view (ref), inputLabel (ref), inputLabelSize (ref)
	return if fFlagEnableGlobalChatAbuseReporting and not p2.message.textChannel or p2.message.textChannel.Name == constantsModule.ChannelTypes.General then nil else reactModule.createElement(view, {
		tag = "auto-xy bg-shift-200 padding-left-xsmall padding-right-xsmall radius-small",
		LayoutOrder = 1
	}, {
		eyebrowLabel = reactModule.createElement(inputLabel, {
			RichText = true,
			Text = if string.match(p2.message.textChannel.Name, constantsModule.ChannelTypes.Whisper) then p2.localizedText.ChatEyebrowSentPrivately else p2.localizedText.ChatEyebrowSentInAnotherChat,
			size = inputLabelSize.Small
		})
	})
end