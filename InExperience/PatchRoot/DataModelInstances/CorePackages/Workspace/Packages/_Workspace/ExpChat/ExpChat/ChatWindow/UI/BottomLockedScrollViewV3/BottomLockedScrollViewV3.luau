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
local var1 = game:DefineFastInt("ExpChatScrollLockThreshold", 90) / 100

local function _(p1)
	-- upvalues: var1 (ref)
	local absoluteWindowSize = p1.AbsoluteWindowSize
	local absoluteCanvasSize = p1.AbsoluteCanvasSize
	
	return absoluteCanvasSize.Y <= absoluteWindowSize.Y or var1 <= p1.CanvasPosition.Y / (absoluteCanvasSize - absoluteWindowSize).Y
end

local _ = function(p1)
	return if p1 ~= Enum.PreferredInput.KeyboardAndMouse then p1 == Enum.PreferredInput.Touch else true
end

local var2 = debounceModule(function()
	-- upvalues: textChatService (ref)
	textChatService:SendExpChatWindowScroll()
end, expChatWindowScrollV3Debounce)

return reactModule.memo(function(p1)
	-- upvalues: useStyle (ref), reactModule (ref), fFlagFriendsChatOsaSystemMessage (ref), signalsReactModule (ref), userInputService (ref), expChatPerfTracker (ref), fFlagExpChatPerfTrackerTabName (ref), var1 (ref), getFFlagExpChatSendWindowScrollEventModule (ref), var2 (ref), fFlagExpChatEnableFriendsTab (ref), configModule (ref), fFlagExpChatScrollbarInsetModule (ref), fFlagExpChatLimitScrollingV2WindowModule (ref), fFlagExpChatFixWarmMountBottomLockModule (ref)
	local theme = useStyle().Theme
	local var3 = reactModule.useRef(nil)
	local var4 = fFlagFriendsChatOsaSystemMessage and p1.scrollToTopOnReset == true
	local var5 = reactModule.useRef(not var4)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef(false)
	local var8 = reactModule.useRef(nil)
	local var9, var10 = reactModule.useBinding(false)
	local var11 = reactModule.useRef(false)
	local var12 = signalsReactModule.useSignalState(p1.messageComponentsSignal)
	local var13 = reactModule.useCallback(function()
		-- upvalues: userInputService (copy), var10 (ref), var11 (ref)
		local preferredInput = userInputService.PreferredInput
		
		if if preferredInput ~= Enum.PreferredInput.KeyboardAndMouse then preferredInput == Enum.PreferredInput.Touch else true then
			var10(true)
		end
		if preferredInput == Enum.PreferredInput.Touch then
			var11.current = true
		end
	end, { userInputService.PreferredInput })
	local var14 = reactModule.useCallback(function()
		-- upvalues: userInputService (copy), var10 (ref), var11 (ref), var8 (ref), var6 (ref), var3 (ref), var7 (ref)
		local preferredInput = userInputService.PreferredInput
		
		if if preferredInput ~= Enum.PreferredInput.KeyboardAndMouse then preferredInput == Enum.PreferredInput.Touch else true then
			var10(false)
		end
		if preferredInput == Enum.PreferredInput.Touch then
			var11.current = false
			
			if var8.current ~= nil and var8.current == var6.current and var3.current then
				var3.current.CanvasPosition = Vector2.new(0, 0)
				var7.current = true
				var8.current = nil
			end
		end
	end, { userInputService.PreferredInput })
	local var15 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var15 (ref)
		return function()
			-- upvalues: var15 (copy)
			if var15.current then
				var15.current.cleanup()
			end
		end
	end, {})
	local var16 = reactModule.useRef(p1.selectedChannelName)
	var16.current = p1.selectedChannelName
	local var17 = reactModule.useCallback(function(p2)
		-- upvalues: var15 (ref), var16 (ref), expChatPerfTracker (copy), fFlagExpChatPerfTrackerTabName (copy), var5 (ref), var1 (copy), getFFlagExpChatSendWindowScrollEventModule (copy), var2 (copy), fFlagExpChatEnableFriendsTab (copy), p1 (ref)
		if var15.current == nil then
			local current = var16.current
			var15.current = expChatPerfTracker.startChatWindowScrollInterval(expChatPerfTracker.Events.ChatWindowScrollInterval, p2, {}, if fFlagExpChatPerfTrackerTabName and current then { tabName = current } else nil)
		end
		if var15.current then
			var15.current.onScrollTick()
		end
		local absoluteWindowSize = p2.AbsoluteWindowSize
		local absoluteCanvasSize = p2.AbsoluteCanvasSize
		var5.current = absoluteCanvasSize.Y <= absoluteWindowSize.Y or var1 <= p2.CanvasPosition.Y / (absoluteCanvasSize - absoluteWindowSize).Y
		
		if getFFlagExpChatSendWindowScrollEventModule() and not var5.current then
			var2()
		end
		if fFlagExpChatEnableFriendsTab and p1.onCanvasPositionChanged then
			p1.onCanvasPositionChanged(p2.CanvasPosition, math.max(p2.AbsoluteCanvasSize.Y - p2.AbsoluteWindowSize.Y, 0))
		end
	end, {
		if fFlagExpChatEnableFriendsTab then p1.onCanvasPositionChanged else nil
	})
	local var18 = reactModule.useCallback(function(p2)
		-- upvalues: var5 (ref), var11 (ref)
		if var5.current and not var11.current then
			p2.CanvasPosition = Vector2.new(0, 9007199254740992)
		end
	end, {})
	local scrollResetKey = p1.scrollResetKey
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), scrollResetKey (ref), var7 (ref), var8 (ref), var4 (ref), p1 (ref), var5 (ref), var11 (ref), var3 (ref)
		if var6.current ~= scrollResetKey then
			var6.current = scrollResetKey
			var7.current = false
			var8.current = nil
		end
		local var19 = scrollResetKey and (p1.isChannelBarVisible and (not var4 and not var7.current))
		
		if scrollResetKey and (var4 and not var7.current) then
			var5.current = false
			
			if var11.current or not var3.current then
				var8.current = scrollResetKey
				
				return
			end
			var3.current.CanvasPosition = Vector2.new(0, 0)
			var7.current = true
			var8.current = nil
			
			return
		elseif var19 then
			var5.current = true
			
			if not var11.current and var3.current then
				var3.current.CanvasPosition = Vector2.new(0, 9007199254740992)
			end
		end
	end, { scrollResetKey, p1.isChannelBarVisible, var4 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var5 (ref), var11 (ref)
		local current = var3.current
		
		if current then
			local var19 = current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function()
				-- upvalues: var5 (copy), var11 (copy), var3 (copy)
				if var5.current and not var11.current and var3.current then
					var3.current.CanvasPosition = Vector2.new(0, 9007199254740992)
				end
			end)
			
			return function()
				-- upvalues: var19 (ref)
				var19:Disconnect()
			end
		end
	end, {
		var5.current,
		var11.current,
		var3.current,
		scrollResetKey
	})
	local var19 = if fFlagExpChatEnableFriendsTab and type(p1.contentTopPadding) == "number" then UDim.new(0, p1.contentTopPadding) elseif fFlagExpChatEnableFriendsTab and p1.contentTopPadding ~= nil then p1.contentTopPadding:map(function(p2)
		return UDim.new(0, p2)
	end) else nil
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.Size,
		[reactModule.Event.InputBegan] = var13,
		[reactModule.Event.InputEnded] = var14
	}, {
		padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 0),
			PaddingBottom = UDim.new(0, 0),
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8)
		}),
		scrollView = reactModule.createElement("ScrollingFrame", {
			ref = var3,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BorderSizePixel = 0,
			ScrollBarImageColor3 = theme.UIEmphasis.Color,
			ScrollBarImageTransparency = var9:map(function(p2)
				return if p2 then 0 else 1
			end),
			ScrollBarThickness = configModule.ChatWindowScrollBarThickness,
			VerticalScrollBarInset = if fFlagExpChatScrollbarInsetModule then Enum.ScrollBarInset.Always else nil,
			ScrollingDirection = if fFlagExpChatLimitScrollingV2WindowModule then Enum.ScrollingDirection.Y else nil,
			Selectable = false,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			CanvasSize = UDim2.new(),
			[reactModule.Change.CanvasPosition] = var17,
			[reactModule.Change.AbsoluteWindowSize] = if fFlagExpChatFixWarmMountBottomLockModule then var18 else nil
		}, if fFlagExpChatEnableFriendsTab then {
			contentPadding = if var19 ~= nil then nil else reactModule.createElement("UIPadding", { PaddingTop = var19 }),
			messages = reactModule.createElement(reactModule.Fragment, nil, var12)
		} else var12)
	})
end)