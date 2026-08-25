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
local fFlagFriendsChatOsaSystemMessage = sharedFlagsModule.FFlagFriendsChatOsaSystemMessage
local getFFlagExpChatSendWindowScrollEventModule = require(expChat.Flags.getFFlagExpChatSendWindowScrollEvent)
local expChatWindowScrollV3Debounce = game:DefineFastInt("ExpChatWindowScrollV3Debounce", 0)
local fFlagExpChatLimitScrollingV2WindowModule = require(expChat.Flags.FFlagExpChatLimitScrollingV2Window)
local fFlagExpChatScrollbarInsetModule = require(expChat.Flags.FFlagExpChatScrollbarInset)
local fFlagExpChatFixWarmMountBottomLockModule = require(expChat.Flags.FFlagExpChatFixWarmMountBottomLock)
local expChatPerfTracker = require(parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local fFlagExpChatPerfTrackerTabName = require(parent.ChatUIPrimitives).Flags.FFlagExpChatPerfTrackerTabName
local _ = require(parent.SocialLuaAnalytics)
local var13 = game:DefineFastInt("ExpChatScrollLockThreshold", 90) / 100

local function _(p0)
	-- upvalues: var13 (ref)
	local absoluteWindowSize = p0.AbsoluteWindowSize
	local absoluteCanvasSize = p0.AbsoluteCanvasSize
	
	return absoluteCanvasSize.Y <= absoluteWindowSize.Y or var13 <= p0.CanvasPosition.Y / (absoluteCanvasSize - absoluteWindowSize).Y
end

local _ = function(p1)
	return if p1 ~= Enum.PreferredInput.KeyboardAndMouse then p1 == Enum.PreferredInput.Touch else true
end

local var14 = debounceModule(function()
	-- upvalues: textChatService (ref)
	textChatService:SendExpChatWindowScroll()
end, expChatWindowScrollV3Debounce)

return reactModule.memo(function(p2)
	-- upvalues: useStyle (ref), reactModule (ref), fFlagFriendsChatOsaSystemMessage (ref), signalsReactModule (ref), userInputService (ref), expChatPerfTracker (ref), fFlagExpChatPerfTrackerTabName (ref), var13 (ref), getFFlagExpChatSendWindowScrollEventModule (ref), var14 (ref), fFlagExpChatEnableFriendsTab (ref), configModule (ref), fFlagExpChatScrollbarInsetModule (ref), fFlagExpChatLimitScrollingV2WindowModule (ref), fFlagExpChatFixWarmMountBottomLockModule (ref)
	local theme = useStyle().Theme
	local var15 = reactModule.useRef(nil)
	local var16 = fFlagFriendsChatOsaSystemMessage and p2.scrollToTopOnReset == true
	local var17 = reactModule.useRef(not var16)
	local var18 = reactModule.useRef(nil)
	local var19 = reactModule.useRef(false)
	local var20 = reactModule.useRef(nil)
	local var21, var22 = reactModule.useBinding(false)
	local var23 = reactModule.useRef(false)
	local var24 = signalsReactModule.useSignalState(p2.messageComponentsSignal)
	local var25 = reactModule.useCallback(function()
		-- upvalues: userInputService (copy), var22 (ref), var23 (ref)
		local preferredInput = userInputService.PreferredInput
		
		if if preferredInput ~= Enum.PreferredInput.KeyboardAndMouse then preferredInput == Enum.PreferredInput.Touch else true then
			var22(true)
		end
		if preferredInput == Enum.PreferredInput.Touch then
			var23.current = true
		end
	end, { userInputService.PreferredInput })
	local var26 = reactModule.useCallback(function()
		-- upvalues: userInputService (copy), var22 (ref), var23 (ref), var20 (ref), var18 (ref), var15 (ref), var19 (ref)
		local preferredInput = userInputService.PreferredInput
		
		if if preferredInput ~= Enum.PreferredInput.KeyboardAndMouse then preferredInput == Enum.PreferredInput.Touch else true then
			var22(false)
		end
		if preferredInput == Enum.PreferredInput.Touch then
			var23.current = false
			
			if var20.current ~= nil and var20.current == var18.current and var15.current then
				var15.current.CanvasPosition = Vector2.new(0, 0)
				var19.current = true
				var20.current = nil
			end
		end
	end, { userInputService.PreferredInput })
	local var27 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var27 (ref)
		return function()
			-- upvalues: var27 (copy)
			if var27.current then
				var27.current.cleanup()
			end
		end
	end, {})
	local var28 = reactModule.useRef(p2.selectedChannelName)
	var28.current = p2.selectedChannelName
	local var29 = reactModule.useCallback(function(p3)
		-- upvalues: var27 (ref), var28 (ref), expChatPerfTracker (copy), fFlagExpChatPerfTrackerTabName (copy), var17 (ref), var13 (copy), getFFlagExpChatSendWindowScrollEventModule (copy), var14 (copy), fFlagExpChatEnableFriendsTab (copy), p2 (ref)
		if var27.current == nil then
			local current = var28.current
			var27.current = expChatPerfTracker.startChatWindowScrollInterval(expChatPerfTracker.Events.ChatWindowScrollInterval, p3, {}, if fFlagExpChatPerfTrackerTabName and current then { tabName = current } else nil)
		end
		if var27.current then
			var27.current.onScrollTick()
		end
		local absoluteWindowSize = p3.AbsoluteWindowSize
		local absoluteCanvasSize = p3.AbsoluteCanvasSize
		var17.current = absoluteCanvasSize.Y <= absoluteWindowSize.Y or var13 <= p3.CanvasPosition.Y / (absoluteCanvasSize - absoluteWindowSize).Y
		
		if getFFlagExpChatSendWindowScrollEventModule() and not var17.current then
			var14()
		end
		if fFlagExpChatEnableFriendsTab and p2.onCanvasPositionChanged then
			p2.onCanvasPositionChanged(p3.CanvasPosition, math.max(p3.AbsoluteCanvasSize.Y - p3.AbsoluteWindowSize.Y, 0))
		end
	end, {
		if fFlagExpChatEnableFriendsTab then p2.onCanvasPositionChanged else nil
	})
	local var30 = reactModule.useCallback(function(p4)
		-- upvalues: var17 (ref), var23 (ref)
		if var17.current and not var23.current then
			p4.CanvasPosition = Vector2.new(0, 9007199254740992)
		end
	end, {})
	local scrollResetKey = p2.scrollResetKey
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), scrollResetKey (ref), var19 (ref), var20 (ref), var16 (ref), p2 (ref), var17 (ref), var23 (ref), var15 (ref)
		if var18.current ~= scrollResetKey then
			var18.current = scrollResetKey
			var19.current = false
			var20.current = nil
		end
		local var32 = scrollResetKey and (p2.isChannelBarVisible and (not var16 and not var19.current))
		
		if scrollResetKey and (var16 and not var19.current) then
			var17.current = false
			
			if var23.current or not var15.current then
				var20.current = scrollResetKey
				
				return
			end
			var15.current.CanvasPosition = Vector2.new(0, 0)
			var19.current = true
			var20.current = nil
			
			return
		elseif var32 then
			var17.current = true
			
			if not var23.current and var15.current then
				var15.current.CanvasPosition = Vector2.new(0, 9007199254740992)
			end
		end
	end, { scrollResetKey, p2.isChannelBarVisible, var16 })
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), var17 (ref), var23 (ref)
		local current = var15.current
		
		if current then
			local var33 = current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function()
				-- upvalues: var17 (copy), var23 (copy), var15 (copy)
				if var17.current and not var23.current and var15.current then
					var15.current.CanvasPosition = Vector2.new(0, 9007199254740992)
				end
			end)
			
			return function()
				-- upvalues: var33 (ref)
				var33:Disconnect()
			end
		end
	end, {
		var17.current,
		var23.current,
		var15.current,
		scrollResetKey
	})
	local var31 = if fFlagExpChatEnableFriendsTab and type(p2.contentTopPadding) == "number" then UDim.new(0, p2.contentTopPadding) elseif fFlagExpChatEnableFriendsTab and p2.contentTopPadding ~= nil then p2.contentTopPadding:map(function(p5)
		return UDim.new(0, p5)
	end) else nil
	
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
			ref = var15,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BorderSizePixel = 0,
			ScrollBarImageColor3 = theme.UIEmphasis.Color,
			ScrollBarImageTransparency = var21:map(function(p6)
				return if p6 then 0 else 1
			end),
			ScrollBarThickness = configModule.ChatWindowScrollBarThickness,
			VerticalScrollBarInset = if fFlagExpChatScrollbarInsetModule then Enum.ScrollBarInset.Always else nil,
			ScrollingDirection = if fFlagExpChatLimitScrollingV2WindowModule then Enum.ScrollingDirection.Y else nil,
			Selectable = false,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			CanvasSize = UDim2.new(),
			[reactModule.Change.CanvasPosition] = var29,
			[reactModule.Change.AbsoluteWindowSize] = if fFlagExpChatFixWarmMountBottomLockModule then var30 else nil
		}, if fFlagExpChatEnableFriendsTab then {
			contentPadding = if var31 ~= nil then nil else reactModule.createElement("UIPadding", { PaddingTop = var31 }),
			messages = reactModule.createElement(reactModule.Fragment, nil, var24)
		} else var24)
	})
end)