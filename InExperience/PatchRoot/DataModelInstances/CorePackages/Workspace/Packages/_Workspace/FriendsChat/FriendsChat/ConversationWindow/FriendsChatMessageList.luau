local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local useChatWindowModule = require(script.Parent.Parent.Bridge.useChatWindow)
local name = require(parent.ExpChatShared).Logger:new(script.Name)

return function(p0)
	-- upvalues: useChatWindowModule (ref), reactModule (ref), name (ref)
	local var3 = useChatWindowModule()
	local var4 = reactModule.useCallback(function()
		-- upvalues: name (copy)
		name:warning("resetTargetChannel called on FriendsChatMessageList; not supported")
	end, {})
	local var5 = reactModule.useCallback(function()
		-- upvalues: name (copy)
		name:warning("activateWhisperMode called on FriendsChatMessageList; not supported")
	end, {})
	local var6 = reactModule.useRef(nil)
	local onViewportAbsoluteSizeChanged = p0.onViewportAbsoluteSizeChanged
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), onViewportAbsoluteSizeChanged (ref)
		local current = var6.current
		
		if current and onViewportAbsoluteSizeChanged then
			onViewportAbsoluteSizeChanged(current)
		end
	end, { onViewportAbsoluteSizeChanged })
	
	return reactModule.createElement("Frame", {
		Name = "FriendsChatWindowSlot",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 1,
		LayoutOrder = p0.layoutOrder,
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
			[reactModule.Change.AbsoluteSize] = p0.onViewportAbsoluteSizeChanged,
			ref = var6
		}, {
			fade = reactModule.createElement("UIGradient", { Rotation = 90, Transparency = p0.messageFadeSequence }),
			window = reactModule.createElement(var3, {
				suppressBackground = true,
				disableLineReporting = true,
				size = UDim2.fromScale(1, 1),
				isChannelBarVisible = p0.isChannelBarVisible,
				scrollResetKey = "FriendsChat:" .. p0.conversationId,
				scrollToTopOnReset = p0.scrollToTopOnReset,
				onCanvasPositionChanged = p0.onCanvasPositionChanged,
				contentTopPadding = p0.contentTopPadding,
				messageComponentsSignal = p0.scrollViewChildrenSignal,
				chatWindowSettings = p0.chatWindowSettings,
				transparencyValue = p0.transparencyValue,
				textTransparency = p0.textTransparency,
				isSpatialUIEnabled = p0.isSpatialUIEnabled,
				onHovered = p0.onHovered,
				onUnhovered = p0.onUnhovered,
				onAbsoluteSizeChanged = p0.onAbsoluteSizeChanged,
				onAbsolutePositionChanged = p0.onAbsolutePositionChanged,
				resetTargetChannel = var4,
				activateWhisperMode = var5
			})
		})
	})
end