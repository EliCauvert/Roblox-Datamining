local UserInputService = game:GetService("UserInputService")
local TextChatService = game:GetService("TextChatService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.Signals)
local SharedFlagsModule = require(Parent.SharedFlags)
local ConfigModule = require(ExpChat.Config)
local AdvanceHistoryScrollModule = require(script.Parent.advanceHistoryScroll)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab
local FFlagFriendsChatOsaSystemMessage = SharedFlagsModule.FFlagFriendsChatOsaSystemMessage
local GetFFlagExpChatSendWindowScrollEventModule = require(ExpChat.Flags.getFFlagExpChatSendWindowScrollEvent)
local FFlagExpChatLimitScrollingV2WindowModule = require(ExpChat.Flags.FFlagExpChatLimitScrollingV2Window)
local FFlagExpChatScrollbarInsetModule = require(ExpChat.Flags.FFlagExpChatScrollbarInset)
local FFlagExpChatFixWarmMountBottomLockModule = require(ExpChat.Flags.FFlagExpChatFixWarmMountBottomLock)
local FFlagExpChatRenderHistoricalMessagesModule = require(ExpChat.Flags.FFlagExpChatRenderHistoricalMessages)
local ExpChatPerfTracker = require(Parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local FFlagExpChatPerfTrackerTabName = require(Parent.ChatUIPrimitives).Flags.FFlagExpChatPerfTrackerTabName
local _ = require(Parent.SocialLuaAnalytics)
local ExpChatScrollLockThresholdRatio = game:DefineFastInt("ExpChatScrollLockThreshold", 90) / 100

local function _(ScrollFrame): boolean
	-- upvalues: ExpChatScrollLockThresholdRatio (copy)
	local AbsoluteWindowSize = ScrollFrame.AbsoluteWindowSize
	local AbsoluteCanvasSize = ScrollFrame.AbsoluteCanvasSize
	local YRatio = ScrollFrame.CanvasPosition.Y / (AbsoluteCanvasSize - AbsoluteWindowSize).Y
	
	return AbsoluteCanvasSize.Y <= AbsoluteWindowSize.Y or ExpChatScrollLockThresholdRatio <= YRatio
end

local _ = function(PreferredInput): boolean
	return PreferredInput == Enum.PreferredInput.KeyboardAndMouse or PreferredInput == Enum.PreferredInput.Touch
end

local Callback = require(ExpChat.ChatWindow.Helpers.debounce)(function()
	-- upvalues: TextChatService (copy)
	TextChatService:SendExpChatWindowScroll()
end, (game:DefineFastInt("ExpChatWindowScrollV3Debounce", 0)))

return ReactModule.memo(function(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), FFlagFriendsChatOsaSystemMessage (copy), SignalsReactModule (copy), UserInputService (copy), ExpChatPerfTracker (copy), FFlagExpChatPerfTrackerTabName (copy), ExpChatScrollLockThresholdRatio (copy), GetFFlagExpChatSendWindowScrollEventModule (copy), Callback (copy), FFlagExpChatEnableFriendsTab (copy), FFlagExpChatRenderHistoricalMessagesModule (copy), AdvanceHistoryScrollModule (copy), ConfigModule (copy), FFlagExpChatScrollbarInsetModule (copy), FFlagExpChatLimitScrollingV2WindowModule (copy), FFlagExpChatFixWarmMountBottomLockModule (copy)
	local Theme = UseStyleFunction().Theme
	local UseRefResult = ReactModule.useRef(nil)
	local IsScrollToTopOnReset: boolean = FFlagFriendsChatOsaSystemMessage and p1.scrollToTopOnReset == true
	local UseRefResult1 = ReactModule.useRef(not IsScrollToTopOnReset)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(false)
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	local UseRefResult5 = ReactModule.useRef(false)
	local UseRefResult6 = ReactModule.useRef({ canvasHeight = nil, historicalCount = 0 })
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.messageComponentsSignal)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UserInputService (upval), UseBindingResult2 (copy), UseRefResult5 (copy)
		local PreferredInput = UserInputService.PreferredInput
		
		if PreferredInput == Enum.PreferredInput.KeyboardAndMouse or PreferredInput == Enum.PreferredInput.Touch then
			UseBindingResult2(true)
		end
		if PreferredInput == Enum.PreferredInput.Touch then
			UseRefResult5.current = true
		end
	end, { UserInputService.PreferredInput })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UserInputService (upval), UseBindingResult2 (copy), UseRefResult5 (copy), UseRefResult4 (copy), UseRefResult2 (copy), UseRefResult (copy), UseRefResult3 (copy)
		local PreferredInput = UserInputService.PreferredInput
		
		if PreferredInput == Enum.PreferredInput.KeyboardAndMouse or PreferredInput == Enum.PreferredInput.Touch then
			UseBindingResult2(false)
		end
		if PreferredInput == Enum.PreferredInput.Touch then
			UseRefResult5.current = false
			
			if UseRefResult4.current ~= nil and UseRefResult4.current == UseRefResult2.current and UseRefResult.current then
				UseRefResult.current.CanvasPosition = Vector2.new(0, 0)
				UseRefResult3.current = true
				UseRefResult4.current = nil
			end
		end
	end, { UserInputService.PreferredInput })
	local UseRefResult7 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult7 (copy)
		return function()
			-- upvalues: UseRefResult7 (upval)
			if UseRefResult7.current then
				UseRefResult7.current.cleanup()
			end
		end
	end, {})
	local UseRefResult8 = ReactModule.useRef(p1.selectedChannelName)
	UseRefResult8.current = p1.selectedChannelName
	local UseResult2 = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: UseRefResult7 (copy), UseRefResult8 (copy), ExpChatPerfTracker (upval), FFlagExpChatPerfTrackerTabName (upval), UseRefResult1 (copy), ExpChatScrollLockThresholdRatio (upval), GetFFlagExpChatSendWindowScrollEventModule (upval), Callback (upval), FFlagExpChatEnableFriendsTab (upval), p1 (copy)
		if UseRefResult7.current == nil then
			local Current = UseRefResult8.current
			UseRefResult7.current = ExpChatPerfTracker.startChatWindowScrollInterval(ExpChatPerfTracker.Events.ChatWindowScrollInterval, ScrollFrame, {}, if FFlagExpChatPerfTrackerTabName and Current then { tabName = Current } else nil)
		end
		if UseRefResult7.current then
			UseRefResult7.current.onScrollTick()
		end
		local AbsoluteWindowSize = ScrollFrame.AbsoluteWindowSize
		local AbsoluteCanvasSize = ScrollFrame.AbsoluteCanvasSize
		local YRatio = ScrollFrame.CanvasPosition.Y / (AbsoluteCanvasSize - AbsoluteWindowSize).Y
		UseRefResult1.current = AbsoluteCanvasSize.Y <= AbsoluteWindowSize.Y or ExpChatScrollLockThresholdRatio <= YRatio
		
		if GetFFlagExpChatSendWindowScrollEventModule() and not UseRefResult1.current then
			Callback()
		end
		if FFlagExpChatEnableFriendsTab and p1.onCanvasPositionChanged then
			p1.onCanvasPositionChanged(ScrollFrame.CanvasPosition, (math.max(ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y, 0)))
		end
	end, {
		if FFlagExpChatEnableFriendsTab then p1.onCanvasPositionChanged else nil
	})
	local UseResult3 = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: UseRefResult1 (copy), UseRefResult5 (copy)
		if UseRefResult1.current and not UseRefResult5.current then
			ScrollFrame.CanvasPosition = Vector2.new(0, 9007199254740992)
		end
	end, {})
	local ScrollResetKey = p1.scrollResetKey
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), ScrollResetKey (copy), UseRefResult3 (copy), UseRefResult4 (copy), IsScrollToTopOnReset (copy), p1 (copy), UseRefResult1 (copy), UseRefResult5 (copy), UseRefResult (copy)
		if UseRefResult2.current ~= ScrollResetKey then
			UseRefResult2.current = ScrollResetKey
			UseRefResult3.current = false
			UseRefResult4.current = nil
		end
		local NoCurrent: boolean = ScrollResetKey and (p1.isChannelBarVisible and (not IsScrollToTopOnReset and not UseRefResult3.current))
		
		if ScrollResetKey and (IsScrollToTopOnReset and not UseRefResult3.current) then
			UseRefResult1.current = false
			
			if UseRefResult5.current or not UseRefResult.current then
				UseRefResult4.current = ScrollResetKey
				
				return
			else
				UseRefResult.current.CanvasPosition = Vector2.new(0, 0)
				UseRefResult3.current = true
				UseRefResult4.current = nil
				
				return
			end
		elseif NoCurrent then
			UseRefResult1.current = true
			
			if not UseRefResult5.current and UseRefResult.current then
				UseRefResult.current.CanvasPosition = Vector2.new(0, 9007199254740992)
			end
		end
	end, {
		ScrollResetKey,
		p1.isChannelBarVisible,
		IsScrollToTopOnReset
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), p1 (copy), FFlagExpChatRenderHistoricalMessagesModule (upval), AdvanceHistoryScrollModule (upval), UseRefResult6 (copy), UseRefResult1 (copy), UseRefResult5 (copy)
		local Current = UseRefResult.current
		
		if not Current then return end
		local HistoricalMessageCountSignalFunction = p1.historicalMessageCountSignal
		local Connection = Current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function()
			-- upvalues: FFlagExpChatRenderHistoricalMessagesModule (upval), HistoricalMessageCountSignalFunction (copy), AdvanceHistoryScrollModule (upval), UseRefResult6 (upval), Current (copy), UseRefResult1 (upval), UseRefResult5 (upval), UseRefResult (upval)
			if FFlagExpChatRenderHistoricalMessagesModule and HistoricalMessageCountSignalFunction then
				local AdvanceHistoryScrollModuleResult: number = AdvanceHistoryScrollModule(UseRefResult6.current, Current.AbsoluteCanvasSize.Y, HistoricalMessageCountSignalFunction(false))
				
				if AdvanceHistoryScrollModuleResult > 0 and not UseRefResult1.current and not UseRefResult5.current then
					Current.CanvasPosition += Vector2.new(0, AdvanceHistoryScrollModuleResult)
				end
			end
			if UseRefResult1.current and not UseRefResult5.current and UseRefResult.current then
				UseRefResult.current.CanvasPosition = Vector2.new(0, 9007199254740992)
			end
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {
		UseRefResult1.current,
		UseRefResult5.current,
		UseRefResult.current,
		ScrollResetKey,
		p1.historicalMessageCountSignal
	})
	local _UDim = if FFlagExpChatEnableFriendsTab and type(p1.contentTopPadding) == "number" then UDim.new(0, p1.contentTopPadding) elseif FFlagExpChatEnableFriendsTab and p1.contentTopPadding ~= nil then p1.contentTopPadding:map(function(Offset): UDim
		return UDim.new(0, Offset)
	end) else nil
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.Size,
		[ReactModule.Event.InputBegan] = UseResult,
		[ReactModule.Event.InputEnded] = UseResult1
	}, {
		padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 0),
			PaddingBottom = UDim.new(0, 0),
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8)
		}),
		scrollView = ReactModule.createElement("ScrollingFrame", {
			ref = UseRefResult,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BorderSizePixel = 0,
			ScrollBarImageColor3 = Theme.UIEmphasis.Color,
			ScrollBarImageTransparency = UseBindingResult:map(function(p2): number
				return if p2 then 0 else 1
			end),
			ScrollBarThickness = ConfigModule.ChatWindowScrollBarThickness,
			VerticalScrollBarInset = if FFlagExpChatScrollbarInsetModule then Enum.ScrollBarInset.Always else nil,
			ScrollingDirection = if FFlagExpChatLimitScrollingV2WindowModule then Enum.ScrollingDirection.Y else nil,
			Selectable = false,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			CanvasSize = UDim2.new(),
			[ReactModule.Change.CanvasPosition] = UseResult2,
			[ReactModule.Change.AbsoluteWindowSize] = if FFlagExpChatFixWarmMountBottomLockModule then UseResult3 else nil
		}, if FFlagExpChatEnableFriendsTab then {
			contentPadding = if _UDim == nil then nil else ReactModule.createElement("UIPadding", { PaddingTop = _UDim }),
			messages = ReactModule.createElement(ReactModule.Fragment, nil, UseSignalStateResult)
		} else UseSignalStateResult)
	})
end)