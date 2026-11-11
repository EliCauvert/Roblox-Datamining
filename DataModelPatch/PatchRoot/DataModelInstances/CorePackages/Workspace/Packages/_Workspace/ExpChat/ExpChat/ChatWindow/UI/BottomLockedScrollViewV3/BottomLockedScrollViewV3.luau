local UserInputService = game:GetService("UserInputService")
local TextChatService = game:GetService("TextChatService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.Signals)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local ConfigModule = require(ExpChat.Config)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local UseV2MessagePoolModule = require(script.Parent.useV2MessagePool)
local FFlagExpChatEnableFocusNavigationModule = require(ExpChat.Flags.FFlagExpChatEnableFocusNavigation)
local FFlagExpChatEnableV2ChatWindowModule = require(ExpChat.Flags.FFlagExpChatEnableV2ChatWindow)
local FFlagExpChatWindowMessageSourceRefactor = SharedFlagsModule.FFlagExpChatWindowMessageSourceRefactor
local FFlagExpChatChannelTabRefactor = SharedFlagsModule.FFlagExpChatChannelTabRefactor
local GetFFlagExpChatSendWindowScrollEventModule = require(ExpChat.Flags.getFFlagExpChatSendWindowScrollEvent)
local FFlagExpChatScrollPerfTracking = require(Parent.ChatUIPrimitives).Flags.FFlagExpChatScrollPerfTracking
local FFlagExpChatLimitScrollingV2WindowModule = require(ExpChat.Flags.FFlagExpChatLimitScrollingV2Window)
local FFlagExpChatScrollbarInsetModule = require(ExpChat.Flags.FFlagExpChatScrollbarInset)
local GetFFlagTextChatEnableUniverseChatTabsFunction = require(Parent.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs
local ExpChatPerfTracker = require(Parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
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
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), FFlagExpChatWindowMessageSourceRefactor (copy), FFlagExpChatEnableV2ChatWindowModule (copy), GetMessagesStoreModule (copy), UseV2MessagePoolModule (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), SignalsReactModule (copy), UserInputService (copy), FFlagExpChatScrollPerfTracking (copy), ExpChatPerfTracker (copy), ExpChatScrollLockThresholdRatio (copy), GetFFlagExpChatSendWindowScrollEventModule (copy), Callback (copy), FFlagExpChatChannelTabRefactor (copy), ConfigModule (copy), FFlagExpChatScrollbarInsetModule (copy), FFlagExpChatLimitScrollingV2WindowModule (copy), FFlagExpChatEnableFocusNavigationModule (copy)
	local Theme = UseStyleFunction().Theme
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(true)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	local UseRefResult2 = ReactModule.useRef(false)
	local NoChildren: boolean = not FFlagExpChatWindowMessageSourceRefactor and (FFlagExpChatEnableV2ChatWindowModule and p1.children == nil)
	local UseBindingResult1 = ReactModule.useBinding(0)
	local TextTransparency = p1.textTransparency or UseBindingResult1
	local MessagesStoreModule = GetMessagesStoreModule(false)
	local Children = if FFlagExpChatWindowMessageSourceRefactor then nil else UseV2MessagePoolModule({
		enabled = NoChildren,
		visible = p1.visible,
		messagesStore = MessagesStoreModule,
		textTransparency = TextTransparency,
		chatWindowSettings = p1.chatWindowSettings,
		isSpatialUIEnabled = p1.isSpatialUIEnabled,
		onTextMessageLabelButtonActivated = p1.onTextMessageLabelButtonActivated,
		targetTextChannel = p1.targetTextChannel,
		isChannelBarVisible = p1.isChannelBarVisible,
		showTranslationButton = p1.showTranslationButton,
		chatWindowTransparencyBindable = p1.chatWindowTransparencyBindable,
		selectedChannelName = if GetFFlagTextChatEnableUniverseChatTabsFunction() then p1.selectedChannelName else nil
	}).children
	local UseSignalStateResult = if FFlagExpChatWindowMessageSourceRefactor then SignalsReactModule.useSignalState(p1.messageComponentsSignal) else nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UserInputService (upval), UseBindingResult2 (copy), UseRefResult2 (copy)
		local PreferredInput = UserInputService.PreferredInput
		
		if PreferredInput == Enum.PreferredInput.KeyboardAndMouse or PreferredInput == Enum.PreferredInput.Touch then
			UseBindingResult2(true)
		end
		if PreferredInput == Enum.PreferredInput.Touch then
			UseRefResult2.current = true
		end
	end, { UserInputService.PreferredInput })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UserInputService (upval), UseBindingResult2 (copy), UseRefResult2 (copy)
		local PreferredInput = UserInputService.PreferredInput
		
		if PreferredInput == Enum.PreferredInput.KeyboardAndMouse or PreferredInput == Enum.PreferredInput.Touch then
			UseBindingResult2(false)
		end
		if PreferredInput == Enum.PreferredInput.Touch then
			UseRefResult2.current = false
		end
	end, { UserInputService.PreferredInput })
	local UseRefResult3 = nil
	
	if FFlagExpChatScrollPerfTracking then
		UseRefResult3 = ReactModule.useRef(nil)
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult3 (ref)
			return function()
				-- upvalues: UseRefResult3 (upval)
				if UseRefResult3.current then
					UseRefResult3.current.cleanup()
				end
			end
		end, {})
	end
	local UseResult2 = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: FFlagExpChatScrollPerfTracking (upval), UseRefResult3 (ref), ExpChatPerfTracker (upval), UseRefResult1 (copy), ExpChatScrollLockThresholdRatio (upval), GetFFlagExpChatSendWindowScrollEventModule (upval), Callback (upval)
		if FFlagExpChatScrollPerfTracking then
			if UseRefResult3.current == nil then
				UseRefResult3.current = ExpChatPerfTracker.startChatWindowScrollInterval(ExpChatPerfTracker.Events.ChatWindowScrollInterval, ScrollFrame, {})
			end
			if UseRefResult3.current then
				UseRefResult3.current.onScrollTick()
			end
		end
		local AbsoluteWindowSize = ScrollFrame.AbsoluteWindowSize
		local AbsoluteCanvasSize = ScrollFrame.AbsoluteCanvasSize
		local YRatio = ScrollFrame.CanvasPosition.Y / (AbsoluteCanvasSize - AbsoluteWindowSize).Y
		UseRefResult1.current = AbsoluteCanvasSize.Y <= AbsoluteWindowSize.Y or ExpChatScrollLockThresholdRatio <= YRatio
		
		if GetFFlagExpChatSendWindowScrollEventModule() and not UseRefResult1.current then
			Callback()
		end
	end, {})
	local ScrollResetKey = if FFlagExpChatChannelTabRefactor then p1.scrollResetKey else p1.targetTextChannel
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), ScrollResetKey (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult (copy)
		if p1.isChannelBarVisible and ScrollResetKey then
			UseRefResult1.current = true
			
			if not UseRefResult2.current and UseRefResult.current then
				UseRefResult.current.CanvasPosition = Vector2.new(0, 9007199254740992)
			end
		end
	end, { ScrollResetKey, p1.isChannelBarVisible })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy)
		local Current = UseRefResult.current
		
		if not Current then return end
		local Connection = Current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function()
			-- upvalues: UseRefResult1 (upval), UseRefResult2 (upval), UseRefResult (upval)
			if UseRefResult1.current and not UseRefResult2.current and UseRefResult.current then
				UseRefResult.current.CanvasPosition = Vector2.new(0, 9007199254740992)
			end
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, if FFlagExpChatEnableV2ChatWindowModule or FFlagExpChatWindowMessageSourceRefactor then {
		UseRefResult1.current,
		UseRefResult2.current,
		UseRefResult.current,
		ScrollResetKey
	} else { tostring(UseRefResult), UseRefResult1, UseRefResult2 })
	
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
			Selectable = not FFlagExpChatEnableFocusNavigationModule and nil,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			CanvasSize = UDim2.new(),
			[ReactModule.Change.CanvasPosition] = UseResult2
		}, if FFlagExpChatWindowMessageSourceRefactor then UseSignalStateResult elseif NoChildren then Children else p1.children)
	})
end)