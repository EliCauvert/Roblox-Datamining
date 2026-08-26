local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local useChatWindowModule = require(script.Parent.Parent.Bridge.useChatWindow)
local name = require(parent.ExpChatShared).Logger:new(script.Name)

return function(p1)
	-- upvalues: useChatWindowModule (ref), reactModule (ref), name (ref)
	local var1 = useChatWindowModule()
	local var2 = reactModule.useCallback(function()
		-- upvalues: name (copy)
		name:warning("resetTargetChannel called on FriendsChatMessageList; not supported")
	end, {})
	local var3 = reactModule.useCallback(function()
		-- upvalues: name (copy)
		name:warning("activateWhisperMode called on FriendsChatMessageList; not supported")
	end, {})
	local var4 = reactModule.useRef(nil)
	local onViewportAbsoluteSizeChanged = p1.onViewportAbsoluteSizeChanged
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), onViewportAbsoluteSizeChanged (ref)
		local current = var4.current
		
		if current and onViewportAbsoluteSizeChanged then
			onViewportAbsoluteSizeChanged(current)
		end
	end, { onViewportAbsoluteSizeChanged })
	
	return reactModule.createElement("Frame", {
		Name = "FriendsChatWindowSlot",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.fromScale(1, 0)
	}, {
		flex = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
		messageMask = reactModule.createElement("CanvasGroup", {
			Name = "FriendsChatMessageMask",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			GroupTransparency = 0,
			Size = UDim2.fromScale(1, 1),
			[reactModule.Change.AbsoluteSize] = p1.onViewportAbsoluteSizeChanged,
			ref = var4
		}, {
			fade = reactModule.createElement("UIGradient", { Rotation = 90, Transparency = p1.messageFadeSequence }),
			window = reactModule.createElement(var1, {
				suppressBackground = true,
				disableLineReporting = true,
				size = UDim2.fromScale(1, 1),
				isChannelBarVisible = p1.isChannelBarVisible,
				scrollResetKey = "FriendsChat:" .. p0.conversationId,
				scrollToTopOnReset = p1.scrollToTopOnReset,
				onCanvasPositionChanged = p1.onCanvasPositionChanged,
				contentTopPadding = p1.contentTopPadding,
				messageComponentsSignal = p1.scrollViewChildrenSignal,
				chatWindowSettings = p1.chatWindowSettings,
				transparencyValue = p1.transparencyValue,
				textTransparency = p1.textTransparency,
				isSpatialUIEnabled = p1.isSpatialUIEnabled,
				onHovered = p1.onHovered,
				onUnhovered = p1.onUnhovered,
				onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
				onAbsolutePositionChanged = p1.onAbsolutePositionChanged,
				resetTargetChannel = var2,
				activateWhisperMode = var3
			})
		})
	})
end