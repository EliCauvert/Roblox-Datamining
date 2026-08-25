local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local foundationModule = require(parent.Foundation)
local conversationTitleWithFacePileModule = require(appChat.Components.ChatConversation.ConversationTitleWithFacePile)
local useTokens = foundationModule.Hooks.useTokens
local reactModule = require(parent.React)

return function(p0)
	-- upvalues: useTokens (ref), reactModule (ref), foundationModule (ref), conversationTitleWithFacePileModule (ref)
	return reactModule.createElement(foundationModule.View, {
		Size = UDim2.new(1, 0, 1, 0),
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, useTokens().Gap.Medium),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}
	}, {
		LeftFrame = if p0.renderLeft then reactModule.createElement(foundationModule.View, {
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			ItemLineAlignment = Enum.ItemLineAlignment.Center
		}, reactModule.createElement(p0.renderLeft)) else nil,
		CenterFrame = reactModule.createElement(foundationModule.View, {
			LayoutOrder = 2,
			flexItem = { FlexMode = Enum.UIFlexMode.Fill },
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			ConversationTitle = reactModule.createElement(conversationTitleWithFacePileModule, {
				titleText = p0.titleText,
				conversationId = p0.conversationId,
				navigateToChatDetails = p0.navigateToChatDetails
			})
		}),
		RightFrame = if p0.renderRight then reactModule.createElement(foundationModule.View, {
			LayoutOrder = 3,
			tag = if p0.ignoreRightMargin then nil else "padding-right-small",
			AutomaticSize = Enum.AutomaticSize.XY,
			ItemLineAlignment = Enum.ItemLineAlignment.Center
		}, reactModule.createElement(p0.renderRight)) else nil
	})
end