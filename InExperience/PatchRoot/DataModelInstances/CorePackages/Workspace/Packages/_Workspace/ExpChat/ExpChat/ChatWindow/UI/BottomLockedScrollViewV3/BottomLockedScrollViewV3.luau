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
local configModule = require(expChat.Config)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local debounceModule = require(expChat.ChatWindow.Helpers.debounce)
local useV2MessagePoolModule = require(script.Parent.useV2MessagePool)
local fFlagExpChatEnableFocusNavigationModule = require(expChat.Flags.FFlagExpChatEnableFocusNavigation)
local fFlagExpChatEnableV2ChatWindowModule = require(expChat.Flags.FFlagExpChatEnableV2ChatWindow)
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local fFlagExpChatWindowMessageSourceRefactor = sharedFlagsModule.FFlagExpChatWindowMessageSourceRefactor
local fFlagExpChatChannelTabRefactor = sharedFlagsModule.FFlagExpChatChannelTabRefactor
local getFFlagExpChatSendWindowScrollEventModule = require(expChat.Flags.getFFlagExpChatSendWindowScrollEvent)
local expChatWindowScrollV3Debounce = game:DefineFastInt("ExpChatWindowScrollV3Debounce", 0)
local fFlagExpChatScrollPerfTracking = require(parent.ChatUIPrimitives).Flags.FFlagExpChatScrollPerfTracking
local fFlagExpChatLimitScrollingV2WindowModule = require(expChat.Flags.FFlagExpChatLimitScrollingV2Window)
local fFlagExpChatScrollbarInsetModule = require(expChat.Flags.FFlagExpChatScrollbarInset)
local fFlagExpChatFixWarmMountBottomLockModule = require(expChat.Flags.FFlagExpChatFixWarmMountBottomLock)
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local expChatPerfTracker = require(parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local fFlagExpChatPerfTrackerTabName = require(parent.ChatUIPrimitives).Flags.FFlagExpChatPerfTrackerTabName
local _ = require(parent.SocialLuaAnalytics)
local var18 = game:DefineFastInt("ExpChatScrollLockThreshold", 90) / 100

local function _(p0) --[[ line: 61 | named "isScrollbarNearBottom" ]]
	-- upvalues: var18 (ref)
	local absoluteWindowSize = p0.AbsoluteWindowSize
	local absoluteCanvasSize = p0.AbsoluteCanvasSize
	
	return absoluteCanvasSize.Y <= absoluteWindowSize.Y or var18 <= p0.CanvasPosition.Y / (absoluteCanvasSize - absoluteWindowSize).Y
end

local _ = function(p1) --[[ line: 76 | named "isMouseMovementOrTouch" ]]
	return if p1 ~= Enum.PreferredInput.KeyboardAndMouse then p1 == Enum.PreferredInput.Touch else true
end

local var19 = debounceModule(function() --[[ line: 80 ]]
	-- upvalues: textChatService (ref)
	textChatService:SendExpChatWindowScroll()
end, expChatWindowScrollV3Debounce)

return reactModule.memo(function(p2) --[[ line: 87 | named "BottomLockedScrollViewV3" ]]
	-- upvalues: useStyle (ref), reactModule (ref), fFlagExpChatWindowMessageSourceRefactor (ref), fFlagExpChatEnableV2ChatWindowModule (ref), getMessagesStoreModule (ref), useV2MessagePoolModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), signalsReactModule (ref), userInputService (ref), fFlagExpChatScrollPerfTracking (ref), expChatPerfTracker (ref), fFlagExpChatPerfTrackerTabName (ref), var18 (ref), getFFlagExpChatSendWindowScrollEventModule (ref), var19 (ref), fFlagExpChatEnableFriendsTab (ref), fFlagExpChatChannelTabRefactor (ref), configModule (ref), fFlagExpChatScrollbarInsetModule (ref), fFlagExpChatLimitScrollingV2WindowModule (ref), fFlagExpChatEnableFocusNavigationModule (ref), fFlagExpChatFixWarmMountBottomLockModule (ref)
	local theme = useStyle().Theme
	local var20 = reactModule.useRef(nil)
	local var21 = reactModule.useRef(true)
	local var22, var23 = reactModule.useBinding(false)
	local var24 = reactModule.useRef(false)
	local var25 = not fFlagExpChatWindowMessageSourceRefactor and (fFlagExpChatEnableV2ChatWindowModule and p2.children == nil)
	local var26 = if not fFlagExpChatWindowMessageSourceRefactor then useV2MessagePoolModule({
		enabled = var25,
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
	local var27 = if fFlagExpChatWindowMessageSourceRefactor then signalsReactModule.useSignalState(p2.messageComponentsSignal) else nil
	local var28 = reactModule.useCallback(function() --[[ line: 129 ]]
		-- upvalues: userInputService (copy), var23 (ref), var24 (ref)
		local preferredInput = userInputService.PreferredInput
		
		if if preferredInput ~= Enum.PreferredInput.KeyboardAndMouse then preferredInput == Enum.PreferredInput.Touch else true then
			var23(true)
		end
		if preferredInput == Enum.PreferredInput.Touch then
			var24.current = true
		end
	end, { userInputService.PreferredInput })
	local var29 = reactModule.useCallback(function() --[[ line: 140 ]]
		-- upvalues: userInputService (copy), var23 (ref), var24 (ref)
		local preferredInput = userInputService.PreferredInput
		
		if if preferredInput ~= Enum.PreferredInput.KeyboardAndMouse then preferredInput == Enum.PreferredInput.Touch else true then
			var23(false)
		end
		if preferredInput == Enum.PreferredInput.Touch then
			var24.current = false
		end
	end, { userInputService.PreferredInput })
	local var30 = nil
	
	if fFlagExpChatScrollPerfTracking then
		var30 = reactModule.useRef(nil)
		reactModule.useEffect(function() --[[ line: 154 ]]
			-- upvalues: var30 (write)
			return function() --[[ line: 155 ]]
				-- upvalues: var30 (copy)
				if var30.current then
					var30.current.cleanup()
				end
			end
		end, {})
	end
	local var31 = reactModule.useRef(p2.selectedChannelName)
	var31.current = p2.selectedChannelName
	local var32 = reactModule.useCallback(function(p3) --[[ line: 166 ]]
		-- upvalues: fFlagExpChatScrollPerfTracking (copy), var30 (write), var31 (ref), expChatPerfTracker (copy), fFlagExpChatPerfTrackerTabName (copy), var21 (ref), var18 (copy), getFFlagExpChatSendWindowScrollEventModule (copy), var19 (copy), fFlagExpChatEnableFriendsTab (copy), p2 (ref)
		if fFlagExpChatScrollPerfTracking then
			if var30.current == nil then
				local current = var31.current
				var30.current = expChatPerfTracker.startChatWindowScrollInterval(expChatPerfTracker.Events.ChatWindowScrollInterval, p3, {}, if fFlagExpChatPerfTrackerTabName and current then { tabName = current } else nil)
			end
			if var30.current then
				var30.current.onScrollTick()
			end
		end
		local absoluteWindowSize = p3.AbsoluteWindowSize
		local absoluteCanvasSize = p3.AbsoluteCanvasSize
		var21.current = absoluteCanvasSize.Y <= absoluteWindowSize.Y or var18 <= p3.CanvasPosition.Y / (absoluteCanvasSize - absoluteWindowSize).Y
		
		if getFFlagExpChatSendWindowScrollEventModule() and not var21.current then
			var19()
		end
		if fFlagExpChatEnableFriendsTab and p2.onCanvasPositionChanged then
			p2.onCanvasPositionChanged(p3.CanvasPosition, math.max(p3.AbsoluteCanvasSize.Y - p3.AbsoluteWindowSize.Y, 0))
		end
	end, {
		if fFlagExpChatEnableFriendsTab then p2.onCanvasPositionChanged else nil
	})
	local var33 = reactModule.useCallback(function(p4) --[[ line: 191 ]]
		-- upvalues: var21 (ref), var24 (ref)
		if var21.current and not var24.current then
			p4.CanvasPosition = Vector2.new(0, 9007199254740992)
		end
	end, {})
	local var34 = if fFlagExpChatChannelTabRefactor then p2.scrollResetKey else p2.targetTextChannel
	reactModule.useEffect(function() --[[ line: 206 ]]
		-- upvalues: p2 (ref), var34 (ref), var21 (ref), var24 (ref), var20 (ref)
		if p2.isChannelBarVisible and var34 then
			var21.current = true
			
			if not var24.current and var20.current then
				var20.current.CanvasPosition = Vector2.new(0, 9007199254740992)
			end
		end
	end, { var34, p2.isChannelBarVisible })
	reactModule.useEffect(function() --[[ line: 217 ]]
		-- upvalues: var20 (ref), var21 (ref), var24 (ref)
		local current = var20.current
		
		if current then
			local var37 = current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function() --[[ line: 225 ]]
				-- upvalues: var21 (copy), var24 (copy), var20 (copy)
				if var21.current and not var24.current and var20.current then
					var20.current.CanvasPosition = Vector2.new(0, 9007199254740992)
				end
			end)
			
			return function() --[[ line: 234 ]]
				-- upvalues: var37 (ref)
				var37:Disconnect()
			end
		end
	end, if fFlagExpChatEnableV2ChatWindowModule or fFlagExpChatWindowMessageSourceRefactor then { var21.current, var24.current, var20.current, var34 } else { tostring(var20), var21, var24 })
	local var35 = if fFlagExpChatEnableFriendsTab and type(p2.contentTopPadding) == "number" then UDim.new(0, p2.contentTopPadding) elseif fFlagExpChatEnableFriendsTab and p2.contentTopPadding ~= nil then p2.contentTopPadding:map(function(p5) --[[ line: 256 ]]
		return UDim.new(0, p5)
	end) else nil
	local var36 = if fFlagExpChatWindowMessageSourceRefactor then var27 elseif var25 then var26 else p2.children
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p2.Size,
		[reactModule.Event.InputBegan] = var28,
		[reactModule.Event.InputEnded] = var29
	}, {
		padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 0),
			PaddingBottom = UDim.new(0, 0),
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8)
		}),
		scrollView = reactModule.createElement("ScrollingFrame", {
			ref = var20,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BorderSizePixel = 0,
			ScrollBarImageColor3 = theme.UIEmphasis.Color,
			ScrollBarImageTransparency = var22:map(function(p6) --[[ line: 284 ]]
				return if p6 then 0 else 1
			end),
			ScrollBarThickness = configModule.ChatWindowScrollBarThickness,
			VerticalScrollBarInset = if fFlagExpChatScrollbarInsetModule then Enum.ScrollBarInset.Always else nil,
			ScrollingDirection = if fFlagExpChatLimitScrollingV2WindowModule then Enum.ScrollingDirection.Y else nil,
			Selectable = if fFlagExpChatEnableFocusNavigationModule then false else nil,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			CanvasSize = UDim2.new(),
			[reactModule.Change.CanvasPosition] = var32,
			[reactModule.Change.AbsoluteWindowSize] = if fFlagExpChatFixWarmMountBottomLockModule then var33 else nil
		}, if fFlagExpChatEnableFriendsTab then {
			contentPadding = if var35 ~= nil then nil else reactModule.createElement("UIPadding", { PaddingTop = var35 }),
			messages = reactModule.createElement(reactModule.Fragment, nil, var36)
		} else var36)
	})
end)