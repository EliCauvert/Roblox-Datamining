local chatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local parent = chatLineReporting.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local getPresetIconRichText = expChatSharedModule.getPresetIconRichText
local isPresetMessage = expChatSharedModule.isPresetMessage
local getMessageTextModule = require(chatLineReporting.Common.getMessageText)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local view = foundationModule.View
local constantsModule = require(chatLineReporting.Common.Constants)
local chatLineReportEyebrowModule = require(chatLineReporting.Components.ChatLineReportEyebrow)

return function(p0) --[[ line: 33 | named "ChatLineReportSelectableLine" ]]
	-- upvalues: reactModule (ref), getMessageTextModule (ref), view (ref), constantsModule (ref), chatLineReportEyebrowModule (ref), text (ref), fFlagExpChatPresetChatEnabled (ref), isPresetMessage (ref), getPresetIconRichText (ref)
	local var7, var8 = reactModule.useState(nil)
	local var9 = getMessageTextModule(p0.message.useTranslation, p0.message.translation, p0.message.text)
	local var7_1 = var7 or (p0.message.prefixText or "")
	local userId = p0.message.userId
	
	if userId and userId.data then
		local names = userId.data.userProfiles[1].names
		var8(string.gsub(var7_1, names.displayName, names.combinedName))
	end
	return reactModule.createElement(view, {
		LayoutOrder = 2,
		tag = "col",
		Size = UDim2.new(0, p0.scrollViewSizeX - constantsModule.SelectableLineScrollbarOffset, 1, 0)
	}, {
		eyebrow = reactModule.createElement(chatLineReportEyebrowModule, { message = p0.message, localizedText = p0.localizedText }),
		chatText = reactModule.createElement(text, {
			RichText = true,
			tag = "auto-xy text-wrap text-align-x-left",
			LayoutOrder = 2,
			Text = if fFlagExpChatPresetChatEnabled and isPresetMessage(p0.message) then `{var7_1} {var9} {getPresetIconRichText(18)}` else `{var7_1} {var9}`
		})
	})
end