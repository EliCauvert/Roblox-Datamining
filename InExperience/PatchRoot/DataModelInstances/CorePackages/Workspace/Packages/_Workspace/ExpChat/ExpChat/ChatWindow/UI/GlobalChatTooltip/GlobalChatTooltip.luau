local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FoundationModule = require(Parent.Foundation)
local Coachmark = FoundationModule.Coachmark
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local FFlagExpChatUseUnifiedTooltipStore = require(Parent.ExpChatShared).Flags.FFlagExpChatUseUnifiedTooltipStore
local FFlagExpChatUseChannelTabsStore = require(Parent.SharedFlags).FFlagExpChatUseChannelTabsStore
local LocalizationModule = require(ExpChat.Localization)
local ConfigModule = require(ExpChat.Config)
local IsUserChatEnabledModule = require(ExpChat.isUserChatEnabled)
local GetTransparencyStoreModule = require(ExpChat.Stores.GetTransparencyStore)
local GetGlobalChatTooltipStoreModule = require(ExpChat.Stores.GetGlobalChatTooltipStore)
local GetChatTooltipStoreModule = require(ExpChat.Stores.GetChatTooltipStore)
local GetChannelTabsStoreModule = if FFlagExpChatUseChannelTabsStore then require(ExpChat.Stores.GetChannelTabsStore) else nil
local UseChatTooltipLifecycleModule = require(script.Parent.Parent.useChatTooltipLifecycle)
local FFlagExpChatGlobalTabDefaultModule = require(ExpChat.Flags.FFlagExpChatGlobalTabDefault)
local MinTabWidth = ConfigModule.ChannelTabsSettings.MinTabWidth
local DropdownIconContainerWidth = ConfigModule.ChannelTabsSettings.DropdownIconContainerWidth

local function useGlobalTabIndex()
	-- upvalues: FFlagExpChatUseChannelTabsStore (copy), ReactModule (copy), SignalsModule (copy), GetChannelTabsStoreModule (copy), SignalsReactModule (copy), UseSelectorFunction (copy)
	return if FFlagExpChatUseChannelTabsStore then SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), GetChannelTabsStoreModule (upval)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: GetChannelTabsStoreModule (upval)
			local RBXGlobal = GetChannelTabsStoreModule(false).getChannelTabsState(p1).allChannelTabs.RBXGlobal
			
			return if RBXGlobal then RBXGlobal.tabIndex else 2
		end)
	end, {}))) else UseSelectorFunction(function(p1)
		local AllChannelTabs = p1.ChannelTabs and p1.ChannelTabs.allChannelTabs
		local RBXGlobal = AllChannelTabs and AllChannelTabs.RBXGlobal
		
		return if RBXGlobal then RBXGlobal.TabIndex else 2
	end)
end

local function useTabCount()
	-- upvalues: FFlagExpChatUseChannelTabsStore (copy), ReactModule (copy), SignalsModule (copy), GetChannelTabsStoreModule (copy), SignalsReactModule (copy), UseSelectorFunction (copy)
	return if FFlagExpChatUseChannelTabsStore then SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), GetChannelTabsStoreModule (upval)
		return SignalsModule.createComputed(function(p1): number
			-- upvalues: GetChannelTabsStoreModule (upval)
			local Count = 0
			
			for _ in GetChannelTabsStoreModule(false).getChannelTabsState(p1).allChannelTabs do
				Count += 1
			end
			return Count
		end)
	end, {}))) else UseSelectorFunction(function(p1): number
		local AllChannelTabs = p1.ChannelTabs and p1.ChannelTabs.allChannelTabs
		
		if AllChannelTabs == nil then
			return 0
		end
		local Count = 0
		
		for _ in AllChannelTabs do
			Count += 1
		end
		return Count
	end)
end

local function GlobalChatTooltipNew(p1)
	-- upvalues: GetChatTooltipStoreModule (copy), SignalsReactModule (copy), useTabCount (copy), ReactModule (copy), FFlagExpChatGlobalTabDefaultModule (copy), useGlobalTabIndex (copy), MinTabWidth (copy), DropdownIconContainerWidth (copy), UseSelectorFunction (copy), UseChatTooltipLifecycleModule (copy), LocalizationModule (copy), Coachmark (copy), PopoverSide (copy), PopoverAlign (copy), ConfigModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetChatTooltipStoreModule(false).getShouldShow("GlobalChatTooltip"))
	local UseTabCountResult = useTabCount()
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseGlobalTabIndexResult = if FFlagExpChatGlobalTabDefaultModule then useGlobalTabIndex() else 2
	local IsUseStateResultBelow: boolean = UseStateResult > 0 and UseStateResult < UseTabCountResult * MinTabWidth
	local XScale = nil
	
	if UseTabCountResult < UseGlobalTabIndexResult then
		XScale = 1
	elseif IsUseStateResultBelow then
		local UseStateResultDelta = UseStateResult - DropdownIconContainerWidth
		local Floored = math.floor(UseStateResultDelta / MinTabWidth)
		XScale = if UseGlobalTabIndexResult <= Floored then UseGlobalTabIndexResult * UseStateResultDelta / (Floored * UseStateResult) else 1
	else
		XScale = UseGlobalTabIndexResult / UseTabCountResult
	end
	local UseSelectorResult = UseSelectorFunction(function(p2): boolean
		local Alignment = p2.ChatLayout and p2.ChatLayout.Alignment
		
		return Alignment ~= nil and (Alignment.AnchorPoint.X == 0 and Alignment.AnchorPoint.Y == 0)
	end)
	local UseChatTooltipLifecycleModuleResult = UseChatTooltipLifecycleModule({
		tooltipKey = "GlobalChatTooltip",
		targetTextChannel = p1.targetTextChannel
	})
	local UseLocalizationResult = LocalizationModule.useLocalization({
		headerText = "CoreScripts.TextChat.Tooltip.Global.Header",
		bodyText = "CoreScripts.TextChat.Tooltip.Global.Body"
	})
	
	if p1.visible and UseSignalStateResult and UseSelectorResult then
		local function onAnchorChanged(p2)
			-- upvalues: UseStateResult2 (copy)
			local Parent = p2.Parent
			
			if Parent and Parent:IsA("GuiObject") then
				UseStateResult2(Parent.AbsoluteSize.X)
			end
		end
		
		return ReactModule.createElement(Coachmark, {
			title = UseLocalizationResult.headerText,
			text = UseLocalizationResult.bodyText,
			isOpen = UseChatTooltipLifecycleModuleResult.isActive,
			onClose = UseChatTooltipLifecycleModuleResult.onDismiss,
			side = PopoverSide.Right,
			align = PopoverAlign.Start,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(XScale, -13, 0, -48),
			onAbsoluteSizeChanged = onAnchorChanged,
			onAbsolutePositionChanged = onAnchorChanged
		}, {
			AnchorSizer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(0, 1, 0, ConfigModule.ChannelTabsSettings.HorizontalBarHeight)
			})
		})
	else
		return nil
	end
end

local function GlobalChatTooltipLegacy(p1)
	-- upvalues: GetGlobalChatTooltipStoreModule (copy), GetTransparencyStoreModule (copy), SignalsReactModule (copy), useTabCount (copy), ReactModule (copy), FFlagExpChatGlobalTabDefaultModule (copy), useGlobalTabIndex (copy), MinTabWidth (copy), DropdownIconContainerWidth (copy), UseSelectorFunction (copy), IsUserChatEnabledModule (copy), ConfigModule (copy), LocalizationModule (copy), Coachmark (copy), PopoverSide (copy), PopoverAlign (copy)
	local GlobalChatTooltipStoreModule = GetGlobalChatTooltipStoreModule(false)
	local TransparencyStoreModule = GetTransparencyStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GlobalChatTooltipStoreModule.getShouldShowGlobalChatTooltip)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(GlobalChatTooltipStoreModule.getIsScreenWideEnough)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(TransparencyStoreModule.getLastActivity)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(TransparencyStoreModule.getIsFocused or TransparencyStoreModule.getIsTextBoxFocused)
	local UseTabCountResult = useTabCount()
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseGlobalTabIndexResult = if FFlagExpChatGlobalTabDefaultModule then useGlobalTabIndex() else 2
	local IsUseStateResultBelow: boolean = UseStateResult > 0 and UseStateResult < UseTabCountResult * MinTabWidth
	local XScale = nil
	
	if UseTabCountResult < UseGlobalTabIndexResult then
		XScale = 1
	elseif IsUseStateResultBelow then
		local UseStateResultDelta = UseStateResult - DropdownIconContainerWidth
		local Floored = math.floor(UseStateResultDelta / MinTabWidth)
		XScale = if UseGlobalTabIndexResult <= Floored then UseGlobalTabIndexResult * UseStateResultDelta / (Floored * UseStateResult) else 1
	else
		XScale = UseGlobalTabIndexResult / UseTabCountResult
	end
	local UseSelectorResult = UseSelectorFunction(function(p2): boolean
		local Alignment = p2.ChatLayout and p2.ChatLayout.Alignment
		
		return Alignment ~= nil and (Alignment.AnchorPoint.X == 0 and Alignment.AnchorPoint.Y == 0)
	end)
	local NoChatStatus = p1.chatStatus == nil or IsUserChatEnabledModule(p1.chatStatus)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(true)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseRefResult2 = ReactModule.useRef(p1.targetTextChannel)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), GlobalChatTooltipStoreModule (copy)
		if not UseRefResult.current then
			UseRefResult.current = true
			GlobalChatTooltipStoreModule.reportImpression()
		end
		GlobalChatTooltipStoreModule.setIsGlobalChatTooltipDismissed(true)
	end, {
		GlobalChatTooltipStoreModule.setIsGlobalChatTooltipDismissed,
		GlobalChatTooltipStoreModule.reportImpression
	})
	ReactModule.useEffect(function()
		-- upvalues: GlobalChatTooltipStoreModule (copy), p1 (copy)
		GlobalChatTooltipStoreModule.setIsChatWindowOpen(p1.visible)
		
		return function()
			-- upvalues: GlobalChatTooltipStoreModule (upval)
			GlobalChatTooltipStoreModule.setIsChatWindowOpen(false)
		end
	end, { p1.visible })
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult3 (copy), UseStateResult2_1 (copy), ConfigModule (upval), UseSignalStateResult2 (copy)
		if UseSignalStateResult3 then
			UseStateResult2_1(true)
			
			return nil
		end
		local ChatWindowBackgroundFadeOutTimeDelta = ConfigModule.ChatWindowBackgroundFadeOutTime - (os.clock() - UseSignalStateResult2)
		
		if ChatWindowBackgroundFadeOutTimeDelta <= 0 then
			UseStateResult2_1(false)
			
			return nil
		else
			UseStateResult2_1(true)
			local DelayedThread = task.delay(ChatWindowBackgroundFadeOutTimeDelta, function()
				-- upvalues: UseStateResult2_1 (upval)
				UseStateResult2_1(false)
			end)
			
			return function()
				-- upvalues: DelayedThread (copy)
				task.cancel(DelayedThread)
			end
		end
	end, { UseSignalStateResult2, UseSignalStateResult3 })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult1 (copy), UseSignalStateResult1 (copy), UseStateResult3 (copy), UseSignalStateResult (copy), NoChatStatus (copy), UseRefResult1 (copy), UseStateResult2_2 (copy)
		if UseStateResult1 and UseSignalStateResult1 and not UseStateResult3 and UseSignalStateResult and NoChatStatus then
			local ClockTime = os.clock()
			local DelayedThread = task.delay(math.max(0, 10 - UseRefResult1.current), function()
				-- upvalues: UseStateResult2_2 (upval)
				UseStateResult2_2(true)
			end)
			
			return function()
				-- upvalues: UseRefResult1 (upval), ClockTime (copy), DelayedThread (copy)
				UseRefResult1.current += os.clock() - ClockTime
				task.cancel(DelayedThread)
			end
		else
			return nil
		end
	end, {
		UseStateResult1,
		UseSignalStateResult1,
		UseStateResult3,
		UseSignalStateResult,
		NoChatStatus
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult3 (copy), UseResult (copy)
		if UseStateResult3 then
			local DelayedThread = task.delay(1, function()
				-- upvalues: UseResult (upval)
				UseResult()
			end)
			
			return function()
				-- upvalues: DelayedThread (copy)
				task.cancel(DelayedThread)
			end
		else
			return nil
		end
	end, { UseStateResult3, UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), p1 (copy), UseSignalStateResult (copy), NoChatStatus (copy), UseStateResult3 (copy), UseStateResult2_2 (copy)
		local Current = UseRefResult2.current
		UseRefResult2.current = p1.targetTextChannel
		
		if Current and Current ~= p1.targetTextChannel and UseSignalStateResult and NoChatStatus and not UseStateResult3 then
			UseStateResult2_2(true)
		end
	end, {
		p1.targetTextChannel,
		UseSignalStateResult,
		NoChatStatus,
		UseStateResult3
	})
	local UseLocalizationResult = LocalizationModule.useLocalization({
		headerText = "CoreScripts.TextChat.Tooltip.Global.Header",
		bodyText = "CoreScripts.TextChat.Tooltip.Global.Body"
	})
	
	if p1.visible and UseSignalStateResult and UseSelectorResult then
		local function onAnchorChanged(p2)
			-- upvalues: UseStateResult2 (copy)
			local Parent = p2.Parent
			
			if Parent and Parent:IsA("GuiObject") then
				UseStateResult2(Parent.AbsoluteSize.X)
			end
		end
		
		return ReactModule.createElement(Coachmark, {
			title = UseLocalizationResult.headerText,
			text = UseLocalizationResult.bodyText,
			isOpen = UseStateResult1 and (UseSignalStateResult1 and not UseStateResult3),
			onClose = UseResult,
			side = PopoverSide.Right,
			align = PopoverAlign.Start,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(XScale, -13, 0, -48),
			onAbsoluteSizeChanged = onAnchorChanged,
			onAbsolutePositionChanged = onAnchorChanged
		}, {
			AnchorSizer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(0, 1, 0, ConfigModule.ChannelTabsSettings.HorizontalBarHeight)
			})
		})
	else
		return nil
	end
end

return function(p1)
	-- upvalues: FFlagExpChatUseUnifiedTooltipStore (copy), GlobalChatTooltipNew (copy), GlobalChatTooltipLegacy (copy)
	return if FFlagExpChatUseUnifiedTooltipStore then GlobalChatTooltipNew(p1) else GlobalChatTooltipLegacy(p1)
end