local ChatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local Parent = ChatLineReporting.Parent
local ConstantsModule = require(ChatLineReporting.Common.Constants)
local GetMessageTextModule = require(ChatLineReporting.Common.getMessageText)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text

return function(p1) --[[ Line: 36 | Named "ChatLineReportVerbatim" ]]
	-- upvalues: ReactModule (copy), GetMessageTextModule (copy), View (copy), ConstantsModule (copy), Text (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local MessageTextModule = GetMessageTextModule(p1.selectedMessage.useTranslation, p1.selectedMessage.translation, p1.selectedMessage.text)
	local PrefixText = p1.selectedMessage.prefixText or ""
	local Text1 = UseStateResult or PrefixText
	local UserId = p1.selectedMessage.userId
	
	if UserId and UserId.data then
		local Names = UserId.data.userProfiles[1].names
		UseStateResult2((string.gsub(Text1, Names.displayName, Names.combinedName)))
	end
	return ReactModule.createElement(View, {
		tag = "radius-medium padding-left-medium padding-right-medium stroke-neutral stroke-standard",
		Size = UDim2.new(1, 0, 0, ConstantsModule.SelectableChatLineHeight)
	}, {
		messageFrame = ReactModule.createElement(View, { tag = "auto-xy position-center-left anchor-center-left" }, {
			messageText = ReactModule.createElement(Text, {
				TextScaled = false,
				RichText = true,
				tag = "auto-xy content-muted",
				Text = `{Text1} {MessageTextModule}`,
				TextTruncate = Enum.TextTruncate.SplitWord,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		})
	})
end