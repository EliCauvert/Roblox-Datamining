local ChatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local Parent = ChatLineReporting.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local FFlagExpChatPresetChatEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local GetPresetIconRichTextFunction = ExpChatSharedModule.getPresetIconRichText
local IsPresetMessageFunction = ExpChatSharedModule.isPresetMessage
local GetMessageTextModule = require(ChatLineReporting.Common.getMessageText)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local ConstantsModule = require(ChatLineReporting.Common.Constants)
local ChatLineReportEyebrowModule = require(ChatLineReporting.Components.ChatLineReportEyebrow)

return function(p1)
	-- upvalues: ReactModule (copy), GetMessageTextModule (copy), View (copy), ConstantsModule (copy), ChatLineReportEyebrowModule (copy), Text (copy), FFlagExpChatPresetChatEnabled (copy), IsPresetMessageFunction (copy), GetPresetIconRichTextFunction (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local MessageTextModule = GetMessageTextModule(p1.message.useTranslation, p1.message.translation, p1.message.text)
	local PrefixText = p1.message.prefixText or ""
	local Text1 = UseStateResult or PrefixText
	local UserId = p1.message.userId
	
	if UserId and UserId.data then
		local Names = UserId.data.userProfiles[1].names
		UseStateResult2((string.gsub(Text1, Names.displayName, Names.combinedName)))
	end
	return ReactModule.createElement(View, {
		LayoutOrder = 2,
		Size = if p1.chatLineReportingReworkEnabled then nil else UDim2.new(0, p1.scrollViewSizeX - ConstantsModule.SelectableLineScrollbarOffset, 1, 0),
		tag = if p1.chatLineReportingReworkEnabled then `col auto-xy {p1.tag}` else "col"
	}, {
		eyebrow = ReactModule.createElement(ChatLineReportEyebrowModule, { message = p1.message, localizedText = p1.localizedText }),
		chatText = ReactModule.createElement(Text, {
			RichText = true,
			tag = "auto-xy text-wrap text-align-x-left",
			LayoutOrder = 2,
			Text = if FFlagExpChatPresetChatEnabled and IsPresetMessageFunction(p1.message) then `{Text1} {MessageTextModule} {GetPresetIconRichTextFunction(18)}` else `{Text1} {MessageTextModule}`
		})
	})
end