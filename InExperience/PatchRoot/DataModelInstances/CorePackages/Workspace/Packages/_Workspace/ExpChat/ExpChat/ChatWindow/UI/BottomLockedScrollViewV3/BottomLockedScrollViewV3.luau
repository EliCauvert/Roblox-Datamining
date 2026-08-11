local userInputService = game:GetService("UserInputService")
local textChatService = game:GetService("TextChatService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local configModule = require(expChat.Config)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local debounceModule = require(expChat.ChatWindow.Helpers.debounce)
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local getFFlagExpChatSendWindowScrollEventModule = require(expChat.Flags.getFFlagExpChatSendWindowScrollEvent)
local expChatWindowScrollV3Debounce = game:DefineFastInt("ExpChatWindowScrollV3Debounce", 0)
local fFlagExpChatLimitScrollingV2WindowModule = require(expChat.Flags.FFlagExpChatLimitScrollingV2Window)
local fFlagExpChatScrollbarInsetModule = require(expChat.Flags.FFlagExpChatScrollbarInset)
local fFlagExpChatFixWarmMountBottomLockModule = require(expChat.Flags.FFlagExpChatFixWarmMountBottomLock)
local expChatPerfTracker = require(parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local fFlagExpChatPerfTrackerTabName = require(parent.ChatUIPrimitives).Flags.FFlagExpChatPerfTrackerTabName
local _ = require(parent.SocialLuaAnalytics)
local var13 = game:DefineFastInt("ExpChatScrollLockThreshold", 90) / 100

local function _(p0) --[[ line: 48 | named "isScrollbarNearBottom" ]]
	-- upvalues: var13 (ref)
	local absoluteWindowSize = p0.AbsoluteWindowSize
	local absoluteCanvasSize = p0.AbsoluteCanvasSize
	
	return absoluteCanvasSize.Y <= absoluteWindowSize.Y or var13 <= p0.CanvasPosition.Y / (absoluteCanvasSize - absoluteWindowSize).Y
end

local _ = function(p1) --[[ line: 63 | named "isMouseMovementOrTouch" ]]
	return if p1 ~= Enum.PreferredInput.KeyboardAndMouse then p1 == Enum.PreferredInput.Touch else true
end

local var14 = debounceModule(function() --[[ line: 67 ]]
	-- upvalues: textChatService (ref)
	textChatService:SendExpChatWindowScroll()
end, expChatWindowScrollV3Debounce)

return reactModule.memo(function(p2) --[[ line: 74 | named "BottomLockedScrollViewV3" ]]
	-- upvalues: useStyle (ref), reactModule (ref), signalsReactModule (ref), userInputService (ref), expChatPerfTracker (ref), fFlagExpChatPerfTrackerTabName (ref), var13 (ref), getFFlagExpChatSendWindowScrollEventModule (ref), var14 (ref), fFlagExpChatEnableFriendsTab (ref), configModule (ref), fFlagExpChatScrollbarInsetModule (ref), fFlagExpChatLimitScrollingV2WindowModule (ref), fFlagExpChatFixWarmMountBottomLockModule (ref)
	local theme = useStyle().Theme
	local var15 = reactModule.useRef(nil)
	local var16 = reactModule.useRef(true)
	local var17, var18 = reactModule.useBinding(false)
	local var19 = reactModule.useRef(false)
	local var20 = signalsReactModule.useSignalState(p2.messageComponentsSignal)
	local var21 = reactModule.useCallback(function() --[[ line: 85 ]]
		-- upvalues: userInputService (copy), var18 (ref), var19 (ref)
		local preferredInput = userInputService.PreferredInput
		
		if if preferredInput ~= Enum.PreferredInput.KeyboardAndMouse then preferredInput == Enum.PreferredInput.Touch else true then
			var18(true)
		end
		if preferredInput == Enum.PreferredInput.Touch then
			var19.current = true
		end
	end, { userInputService.PreferredInput })
	local var22 = reactModule.useCallback(function() --[[ line: 96 ]]
		-- upvalues: userInputService (copy), var18 (ref), var19 (ref)
		local preferredInput = userInputService.PreferredInput
		
		if if preferredInput ~= Enum.PreferredInput.KeyboardAndMouse then preferredInput == Enum.PreferredInput.Touch else true then
			var18(false)
		end
		if preferredInput == Enum.PreferredInput.Touch then
			var19.current = false
		end
	end, { userInputService.PreferredInput })
	local var23 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 108 ]]
		-- upvalues: var23 (ref)
		return function() --[[ line: 109 ]]
			-- upvalues: var23 (copy)
			if var23.current then
				var23.current.cleanup()
			end
		end
	end, {})
	local var24 = reactModule.useRef(p2.selectedChannelName)
	var24.current = p2.selectedChannelName
	local var25 = reactModule.useCallback(function(p3) --[[ line: 119 ]]
		-- upvalues: var23 (ref), var24 (ref), expChatPerfTracker (copy), fFlagExpChatPerfTrackerTabName (copy), var16 (ref), var13 (copy), getFFlagExpChatSendWindowScrollEventModule (copy), var14 (copy), fFlagExpChatEnableFriendsTab (copy), p2 (ref)
		if var23.current == nil then
			local current = var24.current
			var23.current = expChatPerfTracker.startChatWindowScrollInterval(expChatPerfTracker.Events.ChatWindowScrollInterval, p3, {}, if fFlagExpChatPerfTrackerTabName and current then { tabName = current } else nil)
		end
		if var23.current then
			var23.current.onScrollTick()
		end
		local absoluteWindowSize = p3.AbsoluteWindowSize
		local absoluteCanvasSize = p3.AbsoluteCanvasSize
		var16.current = absoluteCanvasSize.Y <= absoluteWindowSize.Y or var13 <= p3.CanvasPosition.Y / (absoluteCanvasSize - absoluteWindowSize).Y
		
		if getFFlagExpChatSendWindowScrollEventModule() and not var16.current then
			var14()
		end
		if fFlagExpChatEnableFriendsTab and p2.onCanvasPositionChanged then
			p2.onCanvasPositionChanged(p3.CanvasPosition, math.max(p3.AbsoluteCanvasSize.Y - p3.AbsoluteWindowSize.Y, 0))
		end
	end, {
		if fFlagExpChatEnableFriendsTab then p2.onCanvasPositionChanged else nil
	})
	local var26 = reactModule.useCallback(function(p4) --[[ line: 142 ]]
		-- upvalues: var16 (ref), var19 (ref)
		if var16.current and not var19.current then
			p4.CanvasPosition = Vector2.new(0, 9007199254740992)
		end
	end, {})
	local scrollResetKey = p2.scrollResetKey
	reactModule.useEffect(function() --[[ line: 152 ]]
		-- upvalues: p2 (ref), scrollResetKey (ref), var16 (ref), var19 (ref), var15 (ref)
		if p2.isChannelBarVisible and scrollResetKey then
			var16.current = true
			
			if not var19.current and var15.current then
				var15.current.CanvasPosition = Vector2.new(0, 9007199254740992)
			end
		end
	end, { scrollResetKey, p2.isChannelBarVisible })
	reactModule.useEffect(function() --[[ line: 162 ]]
		-- upvalues: var15 (ref), var16 (ref), var19 (ref)
		local current = var15.current
		
		if current then
			local var28 = current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function() --[[ line: 170 ]]
				-- upvalues: var16 (copy), var19 (copy), var15 (copy)
				if var16.current and not var19.current and var15.current then
					var15.current.CanvasPosition = Vector2.new(0, 9007199254740992)
				end
			end)
			
			return function() --[[ line: 179 ]]
				-- upvalues: var28 (ref)
				var28:Disconnect()
			end
		end
	end, {
		var16.current,
		var19.current,
		var15.current,
		scrollResetKey
	})
	local var27 = if fFlagExpChatEnableFriendsTab and type(p2.contentTopPadding) == "number" then UDim.new(0, p2.contentTopPadding) elseif fFlagExpChatEnableFriendsTab and p2.contentTopPadding ~= nil then p2.contentTopPadding:map(function(p5) --[[ line: 193 ]]
		return UDim.new(0, p5)
	end) else nil
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p2.Size,
		[reactModule.Event.InputBegan] = var21,
		[reactModule.Event.InputEnded] = var22
	}, {
		padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 0),
			PaddingBottom = UDim.new(0, 0),
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8)
		}),
		scrollView = reactModule.createElement("ScrollingFrame", {
			ref = var15,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BorderSizePixel = 0,
			ScrollBarImageColor3 = theme.UIEmphasis.Color,
			ScrollBarImageTransparency = var17:map(function(p6) --[[ line: 218 ]]
				return if p6 then 0 else 1
			end),
			ScrollBarThickness = configModule.ChatWindowScrollBarThickness,
			VerticalScrollBarInset = if fFlagExpChatScrollbarInsetModule then Enum.ScrollBarInset.Always else nil,
			ScrollingDirection = if fFlagExpChatLimitScrollingV2WindowModule then Enum.ScrollingDirection.Y else nil,
			Selectable = false,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			CanvasSize = UDim2.new(),
			[reactModule.Change.CanvasPosition] = var25,
			[reactModule.Change.AbsoluteWindowSize] = if fFlagExpChatFixWarmMountBottomLockModule then var26 else nil
		}, if fFlagExpChatEnableFriendsTab then {
			contentPadding = if var27 ~= nil then nil else reactModule.createElement("UIPadding", { PaddingTop = var27 }),
			messages = reactModule.createElement(reactModule.Fragment, nil, var20)
		} else var20)
	})
end)