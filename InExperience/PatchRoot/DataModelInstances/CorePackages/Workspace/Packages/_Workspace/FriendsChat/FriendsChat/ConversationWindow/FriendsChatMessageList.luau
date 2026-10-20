local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local UseChatWindowModule = require(script.Parent.Parent.Bridge.useChatWindow)
local NewResult = require(Parent.ExpChatShared).Logger:new(script.Name)

return function(p1)
	-- upvalues: UseChatWindowModule (copy), ReactModule (copy), NewResult (copy)
	local UseChatWindowModuleResult = UseChatWindowModule()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: NewResult (upval)
		NewResult:warning("resetTargetChannel called on FriendsChatMessageList; not supported")
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: NewResult (upval)
		NewResult:warning("activateWhisperMode called on FriendsChatMessageList; not supported")
	end, {})
	local UseRefResult = ReactModule.useRef(nil)
	local OnViewportAbsoluteSizeChangedFunction = p1.onViewportAbsoluteSizeChanged
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), OnViewportAbsoluteSizeChangedFunction (copy)
		local Current = UseRefResult.current
		
		if Current and OnViewportAbsoluteSizeChangedFunction then
			OnViewportAbsoluteSizeChangedFunction(Current)
		end
	end, { OnViewportAbsoluteSizeChangedFunction })
	
	return ReactModule.createElement("Frame", {
		Name = "FriendsChatWindowSlot",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.fromScale(1, 0)
	}, {
		flex = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
		messageMask = ReactModule.createElement("CanvasGroup", {
			Name = "FriendsChatMessageMask",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			GroupTransparency = 0,
			Size = UDim2.fromScale(1, 1),
			[ReactModule.Change.AbsoluteSize] = p1.onViewportAbsoluteSizeChanged,
			ref = UseRefResult
		}, {
			fade = ReactModule.createElement("UIGradient", { Rotation = 90, Transparency = p1.messageFadeSequence }),
			window = ReactModule.createElement(UseChatWindowModuleResult, {
				suppressBackground = true,
				disableLineReporting = true,
				size = UDim2.fromScale(1, 1),
				isChannelBarVisible = p1.isChannelBarVisible,
				scrollResetKey = "FriendsChat:" .. p1.conversationId,
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
				resetTargetChannel = UseResult,
				activateWhisperMode = UseResult1
			})
		})
	})
end