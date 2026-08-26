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

return function(p1)
	-- upvalues: reactModule (ref), getMessageTextModule (ref), view (ref), constantsModule (ref), chatLineReportEyebrowModule (ref), text (ref), fFlagExpChatPresetChatEnabled (ref), isPresetMessage (ref), getPresetIconRichText (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = getMessageTextModule(p1.message.useTranslation, p1.message.translation, p1.message.text)
	local var4 = var1 or (p1.message.prefixText or "")
	local userId = p1.message.userId
	
	if userId and userId.data then
		local names = userId.data.userProfiles[1].names
		var2(string.gsub(var4, names.displayName, names.combinedName))
	end
	return reactModule.createElement(view, {
		LayoutOrder = 2,
		tag = "col",
		Size = UDim2.new(0, p1.scrollViewSizeX - constantsModule.SelectableLineScrollbarOffset, 1, 0)
	}, {
		eyebrow = reactModule.createElement(chatLineReportEyebrowModule, { message = p1.message, localizedText = p1.localizedText }),
		chatText = reactModule.createElement(text, {
			RichText = true,
			tag = "auto-xy text-wrap text-align-x-left",
			LayoutOrder = 2,
			Text = if fFlagExpChatPresetChatEnabled and isPresetMessage(p1.message) then `{var4} {var3} {getPresetIconRichText(18)}` else `{var4} {var3}`
		})
	})
end