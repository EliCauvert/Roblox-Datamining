local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FoundationModule = require(Parent.Foundation)
local ConversationTitleWithFacePileModule = require(AppChat.Components.ChatConversation.ConversationTitleWithFacePile)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ReactModule = require(Parent.React)

return function(p1) --[[ Line: 19 | Named "HeaderBarTitleLeftAligned" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy), ConversationTitleWithFacePileModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		Size = UDim2.new(1, 0, 1, 0),
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, UseTokensFunction().Gap.Medium),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}
	}, {
		LeftFrame = if p1.renderLeft then ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			ItemLineAlignment = Enum.ItemLineAlignment.Center
		}, ReactModule.createElement(p1.renderLeft)) else nil,
		CenterFrame = ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 2,
			flexItem = { FlexMode = Enum.UIFlexMode.Fill },
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			ConversationTitle = ReactModule.createElement(ConversationTitleWithFacePileModule, {
				titleText = p1.titleText,
				conversationId = p1.conversationId,
				navigateToChatDetails = p1.navigateToChatDetails
			})
		}),
		RightFrame = if p1.renderRight then ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 3,
			tag = if p1.ignoreRightMargin then nil else "padding-right-small",
			AutomaticSize = Enum.AutomaticSize.XY,
			ItemLineAlignment = Enum.ItemLineAlignment.Center
		}, ReactModule.createElement(p1.renderRight)) else nil
	})
end