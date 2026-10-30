local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local MessageListModule = require(Parent.ChatUIPrimitives.MessageList)

return function(p1)
	-- upvalues: ReactModule (copy), MessageListModule (copy)
	local Element = ReactModule.createElement(MessageListModule, p1.messageListProps)
	
	return ReactModule.createElement("Frame", {
		Name = "FriendsChatWindowSlot",
		LayoutOrder = p1.layoutOrder,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 0),
		ZIndex = 1,
		[ReactModule.Change.AbsoluteSize] = p1.onSlotAbsoluteSizeChanged,
		[ReactModule.Change.AbsolutePosition] = p1.onSlotAbsolutePositionChanged,
		[ReactModule.Event.MouseEnter] = p1.onHovered,
		[ReactModule.Event.MouseLeave] = p1.onUnhovered
	}, {
		flex = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
		padding = ReactModule.createElement("UIPadding", {
			PaddingTop = p1.topInset:map(function(Offset): UDim
				return UDim.new(0, Offset)
			end)
		}),
		messageMask = ReactModule.createElement("CanvasGroup", {
			Name = "FriendsChatMessageMask",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			GroupTransparency = p1.textTransparency,
			Visible = p1.messagesVisible,
			Size = UDim2.fromScale(1, 1),
			[ReactModule.Change.AbsoluteSize] = p1.onMaskAbsoluteSizeChanged,
			ref = p1.maskRef
		}, {
			fade = ReactModule.createElement("UIGradient", { Rotation = 90, Transparency = p1.topFade }),
			messageList = if p1.isReady then ReactModule.createElement(ReactModule.Fragment, nil, { [p1.conversationId] = Element }) else nil
		})
	})
end