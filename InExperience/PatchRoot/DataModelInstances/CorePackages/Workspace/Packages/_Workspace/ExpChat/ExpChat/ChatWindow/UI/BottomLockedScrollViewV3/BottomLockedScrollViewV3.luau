local userInputService = game:GetService("UserInputService")
local textChatService = game:GetService("TextChatService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(parent.Signals)
local expChatSharedModule = require(parent.ExpChatShared)
local sharedFlagsModule = require(parent.SharedFlags)
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local debounceModule = require(expChat.ChatWindow.Helpers.debounce)
local useV2MessagePoolModule = require(script.Parent.useV2MessagePool)
local fFlagExpChatEnableFocusNavigationModule = require(expChat.Flags.FFlagExpChatEnableFocusNavigation)
local fFlagExpChatEnableV2ChatWindowModule = require(expChat.Flags.FFlagExpChatEnableV2ChatWindow)
local fFlagExpChatWindowMessageSourceRefactor = sharedFlagsModule.FFlagExpChatWindowMessageSourceRefactor
local fFlagExpChatChannelTabRefactor = sharedFlagsModule.FFlagExpChatChannelTabRefactor
local getFFlagExpChatSendWindowScrollEventModule = require(expChat.Flags.getFFlagExpChatSendWindowScrollEvent)
local expChatWindowScrollV3Debounce = game:DefineFastInt("ExpChatWindowScrollV3Debounce", 0)
local fFlagExpChatScrollPerfTracking = require(parent.ChatUIPrimitives).Flags.FFlagExpChatScrollPerfTracking
local fFlagExpChatLimitScrollingV2WindowModule = require(expChat.Flags.FFlagExpChatLimitScrollingV2Window)
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local expChatPerfTracker = require(parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local _ = require(parent.SocialLuaAnalytics)
local var15 = game:DefineFastInt("ExpChatScrollLockThreshold", 90) / 100

local function _(p0) --[[ line: 53 | named "isScrollbarNearBottom" ]]
	-- upvalues: var15 (ref)
	local absoluteWindowSize = p0.AbsoluteWindowSize
	local absoluteCanvasSize = p0.AbsoluteCanvasSize
	
	return absoluteCanvasSize.Y <= absoluteWindowSize.Y or var15 <= p0.CanvasPosition.Y / (absoluteCanvasSize - absoluteWindowSize).Y
end

local _ = function(p1) --[[ line: 68 | named "isMouseMovementOrTouch" ]]
	return if p1 ~= Enum.PreferredInput.KeyboardAndMouse then p1 == Enum.PreferredInput.Touch else true
end

local var16 = debounceModule(function() --[[ line: 72 ]]
	-- upvalues: textChatService (ref)
	textChatService:SendExpChatWindowScroll()
end, expChatWindowScrollV3Debounce)

return reactModule.memo(function(p2) --[[ line: 79 | named "BottomLockedScrollViewV3" ]]
	-- upvalues: useStyle (ref), reactModule (ref), fFlagExpChatWindowMessageSourceRefactor (ref), fFlagExpChatEnableV2ChatWindowModule (ref), getMessagesStoreModule (ref), useV2MessagePoolModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), signalsReactModule (ref), userInputService (ref), fFlagExpChatScrollPerfTracking (ref), expChatPerfTracker (ref), var15 (ref), getFFlagExpChatSendWindowScrollEventModule (ref), var16 (ref), fFlagExpChatChannelTabRefactor (ref), fFlagExpChatLimitScrollingV2WindowModule (ref), fFlagExpChatEnableFocusNavigationModule (ref)
	local theme = useStyle().Theme
	local var17 = reactModule.useRef(nil)
	local var18 = reactModule.useRef(true)
	local var19, var20 = reactModule.useBinding(false)
	local var21 = reactModule.useRef(false)
	local var22 = not fFlagExpChatWindowMessageSourceRefactor and (fFlagExpChatEnableV2ChatWindowModule and p2.children == nil)
	local var23 = if not fFlagExpChatWindowMessageSourceRefactor then useV2MessagePoolModule({
		enabled = var22,
		visible = p2.visible,
		messagesStore = getMessagesStoreModule(false),
		textTransparency = p2.textTransparency or reactModule.useBinding(0),
		chatWindowSettings = p2.chatWindowSettings,
		isSpatialUIEnabled = p2.isSpatialUIEnabled,
		onTextMessageLabelButtonActivated = p2.onTextMessageLabelButtonActivated,
		targetTextChannel = p2.targetTextChannel,
		isChannelBarVisible = p2.isChannelBarVisible,
		showTranslationButton = p2.showTranslationButton,
		chatWindowTransparencyBindable = p2.chatWindowTransparencyBindable,
		selectedChannelName = if getFFlagTextChatEnableUniverseChatTabs() then p2.selectedChannelName else nil
	}).children else nil
	local var24 = if fFlagExpChatWindowMessageSourceRefactor then signalsReactModule.useSignalState(p2.messageComponentsSignal) else nil
	local var25 = reactModule.useCallback(function() --[[ line: 121 ]]
		-- upvalues: userInputService (copy), var20 (ref), var21 (ref)
		local preferredInput = userInputService.PreferredInput
		
		if if preferredInput ~= Enum.PreferredInput.KeyboardAndMouse then preferredInput == Enum.PreferredInput.Touch else true then
			var20(true)
		end
		if preferredInput == Enum.PreferredInput.Touch then
			var21.current = true
		end
	end, { userInputService.PreferredInput })
	local var26 = reactModule.useCallback(function() --[[ line: 132 ]]
		-- upvalues: userInputService (copy), var20 (ref), var21 (ref)
		local preferredInput = userInputService.PreferredInput
		
		if if preferredInput ~= Enum.PreferredInput.KeyboardAndMouse then preferredInput == Enum.PreferredInput.Touch else true then
			var20(false)
		end
		if preferredInput == Enum.PreferredInput.Touch then
			var21.current = false
		end
	end, { userInputService.PreferredInput })
	local var27 = nil
	
	if fFlagExpChatScrollPerfTracking then
		var27 = reactModule.useRef(nil)
		reactModule.useEffect(function() --[[ line: 146 ]]
			-- upvalues: var27 (write)
			return function() --[[ line: 147 ]]
				-- upvalues: var27 (copy)
				if var27.current then
					var27.current.cleanup()
				end
			end
		end, {})
	end
	local var28 = reactModule.useCallback(function(p3) --[[ line: 155 ]]
		-- upvalues: fFlagExpChatScrollPerfTracking (copy), var27 (write), expChatPerfTracker (copy), var18 (ref), var15 (copy), getFFlagExpChatSendWindowScrollEventModule (copy), var16 (copy)
		if fFlagExpChatScrollPerfTracking then
			if var27.current == nil then
				var27.current = expChatPerfTracker.startChatWindowScrollInterval(expChatPerfTracker.Events.ChatWindowScrollInterval, p3, {})
			end
			if var27.current then
				var27.current.onScrollTick()
			end
		end
		local absoluteWindowSize = p3.AbsoluteWindowSize
		local absoluteCanvasSize = p3.AbsoluteCanvasSize
		var18.current = absoluteCanvasSize.Y <= absoluteWindowSize.Y or var15 <= p3.CanvasPosition.Y / (absoluteCanvasSize - absoluteWindowSize).Y
		
		if getFFlagExpChatSendWindowScrollEventModule() and not var18.current then
			var16()
		end
	end, {})
	local var29 = if fFlagExpChatChannelTabRefactor then p2.scrollResetKey else p2.targetTextChannel
	reactModule.useEffect(function() --[[ line: 183 ]]
		-- upvalues: p2 (ref), var29 (ref), var18 (ref), var21 (ref), var17 (ref)
		if p2.isChannelBarVisible and var29 then
			var18.current = true
			
			if not var21.current and var17.current then
				var17.current.CanvasPosition = Vector2.new(0, 9007199254740992)
			end
		end
	end, { var29, p2.isChannelBarVisible })
	reactModule.useEffect(function() --[[ line: 194 ]]
		-- upvalues: var17 (ref), var18 (ref), var21 (ref)
		local current = var17.current
		
		if current then
			local var30 = current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function() --[[ line: 202 ]]
				-- upvalues: var18 (copy), var21 (copy), var17 (copy)
				if var18.current and not var21.current and var17.current then
					var17.current.CanvasPosition = Vector2.new(0, 9007199254740992)
				end
			end)
			
			return function() --[[ line: 211 ]]
				-- upvalues: var30 (ref)
				var30:Disconnect()
			end
		end
	end, if fFlagExpChatEnableV2ChatWindowModule or fFlagExpChatWindowMessageSourceRefactor then { var18.current, var21.current, var17.current, var29 } else { tostring(var17), var18, var21 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p2.Size,
		[reactModule.Event.InputBegan] = var25,
		[reactModule.Event.InputEnded] = var26
	}, {
		padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 0),
			PaddingBottom = UDim.new(0, 0),
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8)
		}),
		scrollView = reactModule.createElement("ScrollingFrame", {
			ref = var17,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BorderSizePixel = 0,
			ScrollBarImageColor3 = theme.UIEmphasis.Color,
			ScrollBarImageTransparency = var19:map(function(p4) --[[ line: 248 ]]
				return if p4 then 0 else 1
			end),
			ScrollBarThickness = 8,
			ScrollingDirection = if fFlagExpChatLimitScrollingV2WindowModule then Enum.ScrollingDirection.Y else nil,
			Selectable = if fFlagExpChatEnableFocusNavigationModule then false else nil,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			CanvasSize = UDim2.new(),
			[reactModule.Change.CanvasPosition] = var28
		}, if fFlagExpChatWindowMessageSourceRefactor then var24 elseif var22 then var23 else p2.children)
	})
end)