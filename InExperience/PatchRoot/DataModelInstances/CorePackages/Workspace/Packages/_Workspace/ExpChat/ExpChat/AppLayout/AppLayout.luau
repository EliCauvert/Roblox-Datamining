local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local FocusUtils = require(Parent.Chrome).FocusUtils
local OtterModule = require(Parent.Otter)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local RoactModule = require(Parent.Roact)
local CreateEffectFunction = require(Parent.Signals).createEffect
local SharedFlagsModule = require(Parent.SharedFlags)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local UIBloxModule = require(Parent.UIBlox)
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local SelectionCursorProvider = UIBloxModule.App.SelectionImage.SelectionCursorProvider
local CursorProvider = UIBloxModule.App.SelectionCursor.CursorProvider
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local FoundationModule = require(Parent.Foundation)
local ChatInputModule = require(ExpChat.ChatInput)
local ChatWindowModule = require(ExpChat.ChatWindow)
local ChannelBarModule = require(ExpChat.ChannelBar)
local ConfigModule = require(ExpChat.Config)
local EnableChatButtonModule = require(ExpChat.EnableChatButton)
local FriendsChatMainModule = require(Parent.FriendsChat.FriendsChatMain)
local ChatPlatformProviderModule = require(ExpChat.ChatPlatform.ChatPlatformProvider)
local FriendsChatDependencyBridgeModule = require(ExpChat.FriendsChatDependencyBridge)
local GetFriendsChatRealtimeStoreModule = require(Parent.FriendsChat.GetFriendsChatRealtimeStore)
local PresetChatTrayModule = require(ExpChat.PresetChat.PresetChatTray)
local PresetChatButtonModule = require(ExpChat.PresetChat.PresetChatButton)
local PresetChatFlyOutModule = require(ExpChat.PresetChat.PresetChatFlyOut)
local PresetChatGateModule = require(ExpChat.PresetChat.PresetChatGate)
local ConstantsModule = require(ExpChat.PresetChat.Constants)
local GetChatConfigurationStoreModule = require(ExpChat.Stores.GetChatConfigurationStore)
local GetChatStatusStoreModule = require(ExpChat.Stores.GetChatStatusStore)
local GetPresetChatStoreModule = require(ExpChat.Stores.GetPresetChatStore)
local GetChatLayoutStoreModule = require(ExpChat.Stores.GetChatLayoutStore)
local TimerModule = require(ExpChat.Timer)
local SpatialUIModule = require(ExpChat.SpatialUI)
local ClientSettingsUtilityModule = require(ExpChat.ClientSettings.ClientSettingsUtility)
local IsChatRegionLockedModule = require(ExpChat.isChatRegionLocked)
local ShowChatEnabledUIModule = require(ExpChat.showChatEnabledUI)
local AppChat = Parent.AppChat
local GetConversationMessageStoreModule = require(AppChat.GetConversationMessageStore)
local GetConversationMessageListStoreModule = require(AppChat.GetConversationMessageListStore)
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local GetFFlagExpChatConditionallyMountAppLayoutModule = require(ExpChat.Flags.getFFlagExpChatConditionallyMountAppLayout)
local FFlagExpChatEnableV2ChatWindowModule = require(ExpChat.Flags.FFlagExpChatEnableV2ChatWindow)
local FFlagExpChatKeepV2PoolMountedModule = require(ExpChat.Flags.FFlagExpChatKeepV2PoolMounted)
local FFlagExpChatPresetChatEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local FFlagExpChatCenterMobilePresetButtonModule = require(ExpChat.Flags.FFlagExpChatCenterMobilePresetButton)
local FFlagExpChatPresetFullWidthButtonFixesModule = require(ExpChat.Flags.FFlagExpChatPresetFullWidthButtonFixes)
local FFlagExpChatPresetChatSendEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatSendEnabled
local FFlagExpChatUniverseChatPresetEnabledModule = require(ExpChat.Flags.FFlagExpChatUniverseChatPresetEnabled)
local FFlagExpChatPresetButtonGlobalTabFixModule = require(ExpChat.Flags.FFlagExpChatPresetButtonGlobalTabFix)
local FFlagExpChatPresetChatGamepadEnabledModule = require(ExpChat.Flags.FFlagExpChatPresetChatGamepadEnabled)
local FFlagLuaSupportMicroGamepadPreferredInput = SharedFlagsModule.FFlagLuaSupportMicroGamepadPreferredInput
local FFlagDebugForceEnableChatButtonOnModule = require(ExpChat.Flags.FFlagDebugForceEnableChatButtonOn)
local FFlagExpChatUseChatConfigStore = SharedFlagsModule.FFlagExpChatUseChatConfigStore
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab
local FFlagExpChatTabShortcutNav = SharedFlagsModule.FFlagExpChatTabShortcutNav
local FFlagExpChatGenericChatFocusModule = require(ExpChat.Flags.FFlagExpChatGenericChatFocus)
local FocusNavigationExperimentModule = require(ExpChat.ShortcutNav.FocusNavigationExperiment)
local InputTypeModule = require(Parent.InputType)
local FFlagExpChatNewInputBarModule = require(ExpChat.Flags.FFlagExpChatNewInputBar)
local ExpChatPresetButtonOldInputBarV2 = game:DefineFastFlag("ExpChatPresetButtonOldInputBarV2", false)
local ExpChatPresetFixChatHotkey = game:DefineFastFlag("ExpChatPresetFixChatHotkey", false)
local ExpChatFixTopPaddingColor = game:DefineFastFlag("ExpChatFixTopPaddingColor", false)
local ExpChatPresetChatFixesEnabled = game:DefineFastFlag("ExpChatPresetChatFixesEnabled", false)
local FFlagDebugFriendsChatModule = require(Parent.FriendsChat.FFlagDebugFriendsChat)
local FFlagDebugExpChatPerfModule = require(ExpChat.Flags.FFlagDebugExpChatPerf)
local FStringDebugFriendsChatConversationIdModule = require(Parent.FriendsChat.FStringDebugFriendsChatConversationId)
local ManuallyInvokeAmpUpsellFunction = require(Parent.SocialUpsell).Utils.manuallyInvokeAmpUpsell
local IsInExperienceUIVREnabled = require(Parent.SharedExperimentDefinition).isInExperienceUIVREnabled
local GetFFlagExpChatTriggerWindowStatusEventModule = require(ExpChat.Flags.getFFlagExpChatTriggerWindowStatusEvent)
local FFlagExpChatWindowStatusEventFixesModule = require(ExpChat.Flags.FFlagExpChatWindowStatusEventFixes)
local Config = if IsInExperienceUIVREnabled then {
	DEFAULT = UDim2.fromScale(0.95, 0.94),
	WITH_CHANNEL_BAR = UDim2.fromScale(0.95, 0.78),
	WITH_CHATINPUT_BAR = UDim2.fromScale(0.95, 0.76),
	WITH_CHANNEL_CHATINPUT_BAR = UDim2.fromScale(0.95, 0.6098)
} else nil
local GetFocusNavigationStoreModule = require(ExpChat.Stores.GetFocusNavigationStore)
local GetTransparencyStoreModule = require(ExpChat.Stores.GetTransparencyStore)
local GetChatWindowStatusStoreModule = require(ExpChat.Stores.GetChatWindowStatusStore)

local function PresetChatInputRow(p1)
	-- upvalues: ConfigModule (copy), FoundationModule (copy), FFlagExpChatPresetButtonGlobalTabFixModule (copy), RoactModule (copy), ExpChatPresetChatFixesEnabled (copy), ConstantsModule (copy), PresetChatButtonModule (copy), FFlagExpChatCenterMobilePresetButtonModule (copy), PresetChatFlyOutModule (copy), EnableChatButtonModule (copy), ExpChatPresetFixChatHotkey (copy), ChatInputModule (copy)
	local ButtonWidth = if p1.showEnableChatButton then ConfigModule.PresetChat.ButtonWidth else 47
	local Small = if p1.showEnableChatButton then FoundationModule.Enums.InputSize.Small else FoundationModule.Enums.InputSize.Medium
	local XOffset: number = if p1.showEnableChatButton then 5 else 3
	
	if FFlagExpChatPresetButtonGlobalTabFixModule and p1.isPresetButtonHidden then
		ButtonWidth = 0
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = 3,
		ZIndex = 2,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		Visible = p1.isChatInputBarVisible or p1.showEnableChatButton
	}, {
		Layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 0)
		}),
		PresetButton = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ClipsDescendants = false,
			LayoutOrder = 1,
			BackgroundColor3 = p1.backgroundColor3,
			BackgroundTransparency = p1.transparencyValue:map(function(p2)
				-- upvalues: p1 (copy)
				return p1.backgroundTransparency + p2 * (1 - p1.backgroundTransparency)
			end),
			Size = UDim2.new(0, ButtonWidth, 1, 0),
			Visible = if ExpChatPresetChatFixesEnabled then p1.isChatWindowVisible or p1.isChatInputBarVisible else nil
		}, {
			ButtonOrFlyOut = RoactModule.createElement("CanvasGroup", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, XOffset, 0.5, if ExpChatPresetChatFixesEnabled then 0 else -1),
				AutomaticSize = Enum.AutomaticSize.XY,
				GroupTransparency = p1.transparencyValue
			}, {
				Content = if FFlagExpChatPresetButtonGlobalTabFixModule and p1.isPresetButtonHidden then nil elseif p1.presetLayoutMode == ConstantsModule.LayoutMode.Tray then RoactModule.createElement(PresetChatButtonModule, {
					isCircular = false,
					size = Small,
					addTopPadding = if FFlagExpChatCenterMobilePresetButtonModule then p1.isChatWindowVisible else nil
				}) else RoactModule.createElement(PresetChatFlyOutModule, {
					buttonIsCircular = false,
					addTopPadding = p1.isChatWindowVisible,
					textChannel = p1.targetTextChannel,
					buttonSize = Small,
					onSendChat = p1.onSendChat,
					onSendGlobalChat = p1.onSendGlobalChat
				})
			})
		}),
		FillArea = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, -ButtonWidth, 0, 0)
		}, {
			EnableChatButton = if p1.showEnableChatButton then RoactModule.createElement(EnableChatButtonModule, {
				chatWindowSettings = p1.chatWindowSettings,
				transparencyValue = p1.transparencyValue,
				addTopPadding = p1.isChatWindowVisible,
				onHovered = p1.onHovered,
				onUnhovered = p1.onUnhovered,
				isSpatialUIEnabled = p1.isSpatialUIEnabled,
				visible = p1.isChatWindowVisible or p1.isChatInputBarVisible,
				onActivated = p1.onEnableChatActivated
			}) else nil,
			InputBar = if ExpChatPresetFixChatHotkey or p1.isChatInputBarVisible then RoactModule.createElement(ChatInputModule, {
				addTopPadding = p1.isChatWindowVisible,
				onSendChat = p1.onSendChat,
				onSendGlobalChat = p1.onSendGlobalChat,
				transparencyValue = p1.transparencyValue,
				canLocalUserChat = p1.canLocalUserChat,
				resetTargetChannel = p1.resetTargetChannel,
				visible = p1.isChatInputBarVisible,
				onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
				onAbsolutePositionChanged = p1.onAbsolutePositionChanged,
				chatWindowSettings = p1.chatWindowSettings,
				isChannelBarVisible = p1.isChannelBarVisible,
				isSpatialUIEnabled = p1.isSpatialUIEnabled
			}) else nil
		})
	})
end

local AppLayout = RoactModule.PureComponent:extend("AppLayout")
AppLayout.defaultProps = {
	addTopPadding = true,
	canLocalUserChat = false,
	isChatInputBarVisible = true,
	isChatWindowVisible = true,
	isChannelBarVisible = false,
	renderingFriends = false,
	isExperienceChatRendered = true,
	LayoutOrder = 1,
	mutedUserIds = nil,
	onSendChat = nil,
	onSendGlobalChat = nil,
	isSpatialUIEnabled = false,
	textTimer = TimerModule.new(ConfigModule.ChatWindowTextFadeOutTime),
	timer = TimerModule.new(ConfigModule.ChatWindowBackgroundFadeOutTime),
	canPlatformEnableChat = require(ExpChat.canPlatformEnableChat)
}
local config = { frequency = 1.25, dampingRatio = 1 }

function AppLayout.init(p1)
	-- upvalues: FFlagDebugFriendsChatModule (copy), RoactModule (copy), FFlagExpChatTabShortcutNav (copy), FFlagExpChatGenericChatFocusModule (copy), GetFocusNavigationStoreModule (copy), FFlagDebugExpChatPerfModule (copy), UserInputService (copy), OtterModule (copy), GetTransparencyStoreModule (copy), GetFFlagExpChatTriggerWindowStatusEventModule (copy), GetChatWindowStatusStoreModule (copy), FFlagExpChatWindowStatusEventFixesModule (copy), Players (copy), TextChatService (copy), FFlagExpChatUseChatConfigStore (copy), GetChatConfigurationStoreModule (copy), config (copy), CreateEffectFunction (copy), GetChatStatusStoreModule (copy), FFlagExpChatPresetChatEnabled (copy), GetPresetChatStoreModule (copy), ConstantsModule (copy), FFlagExpChatPresetChatGamepadEnabledModule (copy), FFlagLuaSupportMicroGamepadPreferredInput (copy), FFlagExpChatPresetChatSendEnabled (copy), FFlagExpChatUniverseChatPresetEnabledModule (copy), FFlagExpChatPresetButtonGlobalTabFixModule (copy), GetChatLayoutStoreModule (copy), ReactFocusNavigationModule (copy), InputTypeModule (copy), GuiService (copy), FocusUtils (copy)
	p1.state = {}
	p1.debugContainerRef = if FFlagDebugFriendsChatModule then RoactModule.createRef() else nil
	
	function p1.setChatContainerRef(Current)
		-- upvalues: FFlagDebugFriendsChatModule (upval), p1 (copy), FFlagExpChatTabShortcutNav (upval), FFlagExpChatGenericChatFocusModule (upval), GetFocusNavigationStoreModule (upval)
		if FFlagDebugFriendsChatModule and p1.debugContainerRef then
			p1.debugContainerRef.current = Current
		end
		if FFlagExpChatTabShortcutNav or FFlagExpChatGenericChatFocusModule then
			GetFocusNavigationStoreModule(false).setChatRoot(Current)
		end
	end
	
	if FFlagDebugFriendsChatModule or FFlagDebugExpChatPerfModule then
		p1.debugInjectionThread = nil
		p1.debugKeybindConnection = UserInputService.InputBegan:Connect(function(Input, GameProcessed)
			-- upvalues: p1 (copy), FFlagDebugFriendsChatModule (upval)
			if GameProcessed then return end
			if Input.KeyCode == Enum.KeyCode.K and Input:IsModifierKeyDown(Enum.ModifierKey.Ctrl) then
				p1:debugInjectFakeMessages()
				
				return
			end
			if FFlagDebugFriendsChatModule and Input.KeyCode == Enum.KeyCode.BackSlash then
				p1:debugSeedFocusNavigation()
			end
		end)
	end
	p1.transparencyValue, p1.updateBackgroundTransparency = RoactModule.createBinding(0)
	p1.backgroundTransparencyMotor = OtterModule.createSingleMotor(0)
	p1.backgroundTransparencyMotor:onStep(p1.updateBackgroundTransparency)
	p1.textTransparencyValue, p1.updateTextTransparencyValue = RoactModule.createBinding(0)
	p1.textTransparencyMotor = OtterModule.createSingleMotor(0)
	p1.textTransparencyMotor:onStep(p1.updateTextTransparencyValue)
	local TransparencyStoreModule = GetTransparencyStoreModule(false)
	p1.ChatWindowStatusStore = if GetFFlagExpChatTriggerWindowStatusEventModule() then GetChatWindowStatusStoreModule(false) else nil
	
	if FFlagExpChatWindowStatusEventFixesModule then
		local CurrentChatWindowState = p1.ChatWindowStatusStore.getCurrentChatWindowState(false)
		p1.lastTrackedChatVisible = if CurrentChatWindowState == "unknown" then nil else CurrentChatWindowState ~= "closed"
	elseif GetFFlagExpChatTriggerWindowStatusEventModule() then
		p1.localPlayerLeavingConnection = Players.PlayerRemoving:Connect(function(Player)
			-- upvalues: Players (upval), p1 (copy), TextChatService (upval)
			if Player == Players.LocalPlayer then
				p1.ChatWindowStatusStore.setPreviousChatWindowState(p1.ChatWindowStatusStore.getCurrentChatWindowState(false))
				local DurationUpdates = p1.ChatWindowStatusStore.getDurationUpdates(false)
				TextChatService:SendExpChatWindowStatusChange(DurationUpdates.closedDuration, DurationUpdates.openDuration, DurationUpdates.backgroundIdleDuration, DurationUpdates.textIdleDuration)
			end
		end)
	end
	if FFlagExpChatUseChatConfigStore then
		p1.ChatConfigurationStore = GetChatConfigurationStoreModule(false)
	end
	function p1.isChatSurfaceVisibleForStatusTracking()
		-- upvalues: p1 (copy)
		return p1.props.isChatWindowVisible or p1.props.isChatInputBarVisible
	end
	
	function p1.stampOpenForStatusTrackingIfNeeded()
		-- upvalues: FFlagExpChatWindowStatusEventFixesModule (upval), p1 (copy)
		if FFlagExpChatWindowStatusEventFixesModule and p1:isChatSurfaceVisibleForStatusTracking() and p1.ChatWindowStatusStore.getCurrentChatWindowState(false) ~= "open" then
			p1.ChatWindowStatusStore.setOpenTimerStarted(os.clock())
		end
	end
	
	function p1.stampBackgroundIdleForStatusTrackingIfNeeded()
		-- upvalues: FFlagExpChatWindowStatusEventFixesModule (upval), p1 (copy)
		if FFlagExpChatWindowStatusEventFixesModule and p1:isChatSurfaceVisibleForStatusTracking() and p1.ChatWindowStatusStore.getCurrentChatWindowState(false) == "textIdle" then
			p1.ChatWindowStatusStore.setBackgroundTimerStarted(os.clock())
		end
	end
	
	function p1.resetBackgroundTransparency()
		-- upvalues: TransparencyStoreModule (copy), p1 (copy), OtterModule (upval), FFlagExpChatWindowStatusEventFixesModule (upval), GetFFlagExpChatTriggerWindowStatusEventModule (upval), config (upval)
		local IsFocused = TransparencyStoreModule.getIsFocused(false)
		p1.backgroundTransparencyMotor:setGoal(OtterModule.instant(0))
		p1.props.timer:stop()
		p1:stampOpenForStatusTrackingIfNeeded()
		
		if IsFocused == false and p1.props.isSpatialUIEnabled == false then
			if FFlagExpChatWindowStatusEventFixesModule and not p1:isChatSurfaceVisibleForStatusTracking() then return end
			p1.props.timer:start():andThen(function()
				-- upvalues: FFlagExpChatWindowStatusEventFixesModule (upval), p1 (upval), GetFFlagExpChatTriggerWindowStatusEventModule (upval), OtterModule (upval), config (upval)
				if FFlagExpChatWindowStatusEventFixesModule then
					if p1:isChatSurfaceVisibleForStatusTracking() then
						p1.ChatWindowStatusStore.setBackgroundTimerStarted(os.clock())
					end
				elseif GetFFlagExpChatTriggerWindowStatusEventModule() then
					p1.ChatWindowStatusStore.setBackgroundTimerStarted(os.clock())
				end
				p1.backgroundTransparencyMotor:setGoal(OtterModule.spring(1, config))
			end)
		end
	end
	
	function p1.resetTextTransparency()
		-- upvalues: TransparencyStoreModule (copy), p1 (copy), OtterModule (upval), FFlagExpChatWindowStatusEventFixesModule (upval), GetFFlagExpChatTriggerWindowStatusEventModule (upval), config (upval)
		local IsFocused = TransparencyStoreModule.getIsFocused(false)
		p1.textTransparencyMotor:setGoal(OtterModule.instant(0))
		p1.props.textTimer:stop()
		p1:stampBackgroundIdleForStatusTrackingIfNeeded()
		
		if IsFocused == false then
			if FFlagExpChatWindowStatusEventFixesModule and not p1:isChatSurfaceVisibleForStatusTracking() then return end
			p1.props.textTimer:start():andThen(function()
				-- upvalues: FFlagExpChatWindowStatusEventFixesModule (upval), p1 (upval), GetFFlagExpChatTriggerWindowStatusEventModule (upval), OtterModule (upval), config (upval)
				if FFlagExpChatWindowStatusEventFixesModule then
					if p1:isChatSurfaceVisibleForStatusTracking() then
						p1.ChatWindowStatusStore.setTextTimerStarted(os.clock())
					end
				elseif GetFFlagExpChatTriggerWindowStatusEventModule() then
					p1.ChatWindowStatusStore.setTextTimerStarted(os.clock())
				end
				p1.textTransparencyMotor:setGoal(OtterModule.spring(1, config))
			end)
		end
	end
	
	p1.disposeBackgroundEffect = CreateEffectFunction(function(p2)
		-- upvalues: TransparencyStoreModule (copy), p1 (copy)
		local _ = TransparencyStoreModule.getLastActivity(p2)
		p1.resetBackgroundTransparency()
		p1.resetTextTransparency()
	end)
	p1.disposeTextEffect = CreateEffectFunction(function(p2)
		-- upvalues: TransparencyStoreModule (copy), p1 (copy)
		local _ = TransparencyStoreModule.getLastMessageActivity(p2)
		p1.resetTextTransparency()
	end)
	p1.disposeChatStatusEffect = CreateEffectFunction(function(p2)
		-- upvalues: GetChatStatusStoreModule (upval), p1 (copy)
		p1:setState({
			chatStatus = GetChatStatusStoreModule(p2).getChatStatus(p2)
		})
	end)
	
	if FFlagExpChatPresetChatEnabled then
		p1.disposePresetFlyOutAvailableEffect = CreateEffectFunction(function(p2)
			-- upvalues: GetPresetChatStoreModule (upval), ConstantsModule (upval), FFlagExpChatPresetChatGamepadEnabledModule (upval), UserInputService (upval), FFlagLuaSupportMicroGamepadPreferredInput (upval), p1 (copy), FFlagExpChatPresetChatSendEnabled (upval), FFlagExpChatUniverseChatPresetEnabledModule (upval), FFlagExpChatPresetButtonGlobalTabFixModule (upval)
			local PresetChatStoreModule = GetPresetChatStoreModule(p2)
			local IsEnabled = PresetChatStoreModule.getIsEnabled(p2)
			local AccessLevel = PresetChatStoreModule.getAccessLevel(p2)
			local LayoutModeOverride = PresetChatStoreModule.getLayoutModeOverride(p2)
			p1:setState({
				isPresetFlyOutAvailable = IsEnabled and (FFlagExpChatPresetChatSendEnabled and (AccessLevel == ConstantsModule.AccessLevel.Enabled and (p1.props.targetTextChannel ~= nil or FFlagExpChatUniverseChatPresetEnabledModule))),
				isPresetChatAvailable = if FFlagExpChatPresetButtonGlobalTabFixModule then IsEnabled and (FFlagExpChatPresetChatSendEnabled and AccessLevel == ConstantsModule.AccessLevel.Enabled) else nil,
				presetLayoutMode = if LayoutModeOverride == ConstantsModule.LayoutMode.Tray or LayoutModeOverride == ConstantsModule.LayoutMode.FlyOut then LayoutModeOverride elseif FFlagExpChatPresetChatGamepadEnabledModule and (UserInputService.PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and UserInputService.PreferredInput == Enum.PreferredInput.MicroGamepad) then ConstantsModule.LayoutMode.FlyOut elseif UserInputService.TouchEnabled and not UserInputService.MouseEnabled then ConstantsModule.LayoutMode.Tray else ConstantsModule.LayoutMode.FlyOut
			})
		end)
	end
	function p1.onAbsolutePositionChanged(Frame, p2)
		p2.AbsolutePositionWrite = Frame.AbsolutePosition
	end
	
	function p1.onAbsoluteSizeChanged(Frame, p2)
		p2.AbsoluteSizeWrite = Frame.AbsoluteSize
	end
	
	function p1.onChatFrameLayoutChanged(Frame: Frame)
		-- upvalues: FFlagExpChatPresetChatEnabled (upval), GetPresetChatStoreModule (upval), GetChatLayoutStoreModule (upval)
		if FFlagExpChatPresetChatEnabled then
			GetPresetChatStoreModule(false).setChatWindowBottomY(Frame.AbsolutePosition.Y + Frame.AbsoluteSize.Y)
		end
		GetChatLayoutStoreModule(false).setChatWindowWidth(Frame.AbsoluteSize.X)
	end
	
	p1.focusNavigationService = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
	p1.topBorderRef = RoactModule.createRef()
	
	function p1.onContainerSelectionChanged(Ancestor, _, Object, Current)
		-- upvalues: GetFocusNavigationStoreModule (upval), TransparencyStoreModule (copy), p1 (copy), FFlagExpChatGenericChatFocusModule (upval), InputTypeModule (upval), UserInputService (upval), GuiService (upval), FocusUtils (upval)
		if Current == nil or not Current:IsDescendantOf(Ancestor) then
			GetFocusNavigationStoreModule(false).unfocusChatInputBar()
			TransparencyStoreModule.clearWindowFocusInput()
			
			return
		end
		TransparencyStoreModule.setWindowFocusInput()
		
		if Current == p1.topBorderRef.current then
			if FFlagExpChatGenericChatFocusModule and InputTypeModule.getInputGroup(UserInputService:GetLastInputType()) ~= InputTypeModule.InputTypeConstants.Gamepad then
				GuiService.SelectedCoreObject = if Object == nil or not Object:IsDescendantOf(Ancestor) then nil else Object
				
				return
			end
			FocusUtils.FocusOnChrome(function()
				-- upvalues: GetFocusNavigationStoreModule (upval)
				GetFocusNavigationStoreModule(false).unfocusChatInputBar()
			end, "chat")
		end
	end
end

function AppLayout.syncChatWindowVisibilityForStatusTracking(p1)
	-- upvalues: FFlagExpChatWindowStatusEventFixesModule (copy)
	if not FFlagExpChatWindowStatusEventFixesModule then return end
	local IsChatSurfaceVisibleForStatusTracking = p1:isChatSurfaceVisibleForStatusTracking()
	
	if p1.lastTrackedChatVisible == IsChatSurfaceVisibleForStatusTracking then return end
	p1.lastTrackedChatVisible = IsChatSurfaceVisibleForStatusTracking
	
	if IsChatSurfaceVisibleForStatusTracking then
		p1.ChatWindowStatusStore.setOpenTimerStarted(os.clock())
		
		return
	else
		p1.ChatWindowStatusStore.setClosedTimerStarted(os.clock())
		p1.props.timer:stop()
		p1.props.textTimer:stop()
	end
end

function AppLayout.didMount(p1)
	-- upvalues: FFlagExpChatWindowStatusEventFixesModule (copy), OtterModule (copy), config (copy), GetFFlagExpChatTriggerWindowStatusEventModule (copy)
	if FFlagExpChatWindowStatusEventFixesModule then
		p1:syncChatWindowVisibilityForStatusTracking()
		
		if p1:isChatSurfaceVisibleForStatusTracking() then
			p1.props.timer:start():andThen(function()
				-- upvalues: p1 (copy), OtterModule (upval), config (upval)
				if p1:isChatSurfaceVisibleForStatusTracking() then
					p1.ChatWindowStatusStore.setBackgroundTimerStarted(os.clock())
				end
				p1.backgroundTransparencyMotor:setGoal(OtterModule.spring(1, config))
			end)
			p1.props.textTimer:start():andThen(function()
				-- upvalues: p1 (copy), OtterModule (upval), config (upval)
				if p1:isChatSurfaceVisibleForStatusTracking() then
					p1.ChatWindowStatusStore.setTextTimerStarted(os.clock())
				end
				p1.textTransparencyMotor:setGoal(OtterModule.spring(1, config))
			end)
			
			return
		end
	else
		p1.props.timer:start():andThen(function()
			-- upvalues: GetFFlagExpChatTriggerWindowStatusEventModule (upval), p1 (copy), OtterModule (upval), config (upval)
			if GetFFlagExpChatTriggerWindowStatusEventModule() then
				p1.ChatWindowStatusStore.setBackgroundTimerStarted(os.clock())
			end
			p1.backgroundTransparencyMotor:setGoal(OtterModule.spring(1, config))
		end)
		p1.props.textTimer:start():andThen(function()
			-- upvalues: GetFFlagExpChatTriggerWindowStatusEventModule (upval), p1 (copy), OtterModule (upval), config (upval)
			if GetFFlagExpChatTriggerWindowStatusEventModule() then
				p1.ChatWindowStatusStore.setTextTimerStarted(os.clock())
			end
			p1.textTransparencyMotor:setGoal(OtterModule.spring(1, config))
		end)
	end
end

function AppLayout.didUpdate(p1, DefaultProps)
	-- upvalues: FFlagExpChatWindowStatusEventFixesModule (copy)
	if not FFlagExpChatWindowStatusEventFixesModule then return end
	local IsChatSurfaceVisibleForStatusTracking = p1:isChatSurfaceVisibleForStatusTracking()
	
	if (DefaultProps.isChatWindowVisible or DefaultProps.isChatInputBarVisible) == IsChatSurfaceVisibleForStatusTracking then return end
	p1:syncChatWindowVisibilityForStatusTracking()
	
	if IsChatSurfaceVisibleForStatusTracking then
		p1.resetBackgroundTransparency()
		p1.resetTextTransparency()
	end
end

function AppLayout.render(p1)
	-- upvalues: FocusNavigationExperimentModule (copy), GetFFlagExpChatTriggerWindowStatusEventModule (copy), FFlagExpChatWindowStatusEventFixesModule (copy), FFlagExpChatUseChatConfigStore (copy), ClientSettingsUtilityModule (copy), ShowChatEnabledUIModule (copy), IsInExperienceUIVREnabled (copy), GetFFlagExpChatConditionallyMountAppLayoutModule (copy), Config (copy), ConfigModule (copy), FFlagDebugForceEnableChatButtonOnModule (copy), IsChatRegionLockedModule (copy), ExpChatPresetButtonOldInputBarV2 (copy), FFlagExpChatPresetChatEnabled (copy), FFlagExpChatPresetButtonGlobalTabFixModule (copy), FFlagExpChatUniverseChatPresetEnabledModule (copy), RoactModule (copy), FFlagDebugFriendsChatModule (copy), FFlagExpChatTabShortcutNav (copy), FFlagExpChatGenericChatFocusModule (copy), ExpChatFixTopPaddingColor (copy), FFlagExpChatEnableV2ChatWindowModule (copy), FFlagExpChatKeepV2PoolMountedModule (copy), ChatWindowModule (copy), FFlagExpChatPresetChatSendEnabled (copy), PresetChatGateModule (copy), ConstantsModule (copy), PresetChatTrayModule (copy), FFlagExpChatNewInputBarModule (copy), PresetChatInputRow (copy), ManuallyInvokeAmpUpsellFunction (copy), ChatInputModule (copy), FriendsChatDependencyBridgeModule (copy), FriendsChatMainModule (copy), EnableChatButtonModule (copy), ExpChatPresetChatFixesEnabled (copy), PresetChatButtonModule (copy), FFlagExpChatCenterMobilePresetButtonModule (copy), FFlagExpChatPresetFullWidthButtonFixesModule (copy), PresetChatFlyOutModule (copy), ExpChatPresetFixChatHotkey (copy), ChannelBarModule (copy), SpatialUIModule (copy), FFlagExpChatEnableFriendsTab (copy), ChatPlatformProviderModule (copy), ReactFocusNavigationModule (copy), SelectionCursorProvider (copy), CursorProvider (copy), WithSelectionCursorProviderFunction (copy), CursorKind (copy)
	if FocusNavigationExperimentModule.isBackupExposureLoggingEnabled and p1.isChatSurfaceVisibleForStatusTracking() then
		FocusNavigationExperimentModule.logExposure()
	end
	if GetFFlagExpChatTriggerWindowStatusEventModule() and not FFlagExpChatWindowStatusEventFixesModule then
		if p1.props.isChatWindowVisible or p1.props.isChatInputBarVisible then
			p1.ChatWindowStatusStore.setOpenTimerStarted(os.clock())
		else
			p1.ChatWindowStatusStore.setClosedTimerStarted(os.clock())
		end
	end
	local ChatWindowSettings = if FFlagExpChatUseChatConfigStore and p1.ChatConfigurationStore then p1.ChatConfigurationStore.getChatWindowSettings(false) else p1.props.chatWindowSettings
	local BackgroundTransparency = ClientSettingsUtilityModule.getBackgroundTransparency(ChatWindowSettings, p1.props.clientSettings)
	local BackgroundColor = ClientSettingsUtilityModule.getBackgroundColor(ChatWindowSettings, p1.props.clientSettings)
	local WITHCHANNELCHATINPUTBAR = nil
	local RenderingFriends = p1.props.renderingFriends
	local IsExperienceChatRendered = p1.props.isExperienceChatRendered
	local ChatStatus = p1.state.chatStatus
	local ShowChatEnabledUIModuleResult = p1.props.isChatInputBarVisible and ShowChatEnabledUIModule(ChatStatus)
	
	if IsInExperienceUIVREnabled then
		if p1.props.isSpatialUIEnabled then
			local IsChannelBarVisible = GetFFlagExpChatConditionallyMountAppLayoutModule() and p1.props.isChannelBarVisible
			WITHCHANNELCHATINPUTBAR = if IsChannelBarVisible and ShowChatEnabledUIModuleResult then Config.WITH_CHANNEL_CHATINPUT_BAR elseif IsChannelBarVisible and not ShowChatEnabledUIModuleResult then Config.WITH_CHANNEL_BAR elseif IsChannelBarVisible or not ShowChatEnabledUIModuleResult then Config.DEFAULT else Config.WITH_CHATINPUT_BAR
		else
			WITHCHANNELCHATINPUTBAR = UDim2.fromScale(ConfigModule.ChatWindowSize.X.Scale * ChatWindowSettings.WidthScale, ConfigModule.ChatWindowSize.Y.Scale * ChatWindowSettings.HeightScale)
		end
	end
	local FFlagDebugForceEnableChatButtonOnModule1 = FFlagDebugForceEnableChatButtonOnModule or not IsChatRegionLockedModule() and (p1.props.canPlatformEnableChat() and ChatStatus == "AgeVerificationRequired")
	local IsPresetFlyOutAvailable = ExpChatPresetButtonOldInputBarV2 and (FFlagExpChatPresetChatEnabled and p1.state.isPresetFlyOutAvailable)
	local NoShowChatEnabledUIModuleResult: boolean = FFlagExpChatPresetChatEnabled and (p1.state.isPresetFlyOutAvailable and (not FFlagDebugForceEnableChatButtonOnModule1 and not ShowChatEnabledUIModuleResult))
	local HasTargetTextChannel = if FFlagExpChatPresetButtonGlobalTabFixModule then p1.state.isPresetChatAvailable == true and (p1.props.targetTextChannel ~= nil or FFlagExpChatUniverseChatPresetEnabledModule) else nil
	
	if FFlagExpChatPresetButtonGlobalTabFixModule then
		IsPresetFlyOutAvailable = ExpChatPresetButtonOldInputBarV2 and (FFlagExpChatPresetChatEnabled and p1.state.isPresetChatAvailable == true)
		NoShowChatEnabledUIModuleResult = FFlagExpChatPresetChatEnabled and (HasTargetTextChannel and (not FFlagDebugForceEnableChatButtonOnModule1 and not ShowChatEnabledUIModuleResult))
	end
	local function v109(SelectionImageObject)
		-- upvalues: RoactModule (upval), p1 (copy), IsInExperienceUIVREnabled (upval), WITHCHANNELCHATINPUTBAR (ref), ConfigModule (upval), ChatWindowSettings (copy), FFlagExpChatPresetChatEnabled (upval), FFlagDebugFriendsChatModule (upval), FFlagExpChatTabShortcutNav (upval), FFlagExpChatGenericChatFocusModule (upval), BackgroundColor (copy), BackgroundTransparency (copy), RenderingFriends (copy), ExpChatFixTopPaddingColor (upval), IsExperienceChatRendered (copy), GetFFlagExpChatConditionallyMountAppLayoutModule (upval), FFlagExpChatEnableV2ChatWindowModule (upval), FFlagExpChatKeepV2PoolMountedModule (upval), ChatWindowModule (upval), FFlagExpChatPresetChatSendEnabled (upval), PresetChatGateModule (upval), ConstantsModule (upval), PresetChatTrayModule (upval), FFlagExpChatNewInputBarModule (upval), IsPresetFlyOutAvailable (ref), PresetChatInputRow (upval), ShowChatEnabledUIModuleResult (ref), FFlagDebugForceEnableChatButtonOnModule1 (copy), ManuallyInvokeAmpUpsellFunction (upval), FFlagExpChatPresetButtonGlobalTabFixModule (upval), HasTargetTextChannel (copy), ChatInputModule (upval), FriendsChatDependencyBridgeModule (upval), FriendsChatMainModule (upval), EnableChatButtonModule (upval), NoShowChatEnabledUIModuleResult (ref), ExpChatPresetChatFixesEnabled (upval), PresetChatButtonModule (upval), FFlagExpChatCenterMobilePresetButtonModule (upval), FFlagExpChatPresetFullWidthButtonFixesModule (upval), PresetChatFlyOutModule (upval), ExpChatPresetFixChatHotkey (upval), ChannelBarModule (upval), SpatialUIModule (upval), FFlagExpChatEnableFriendsTab (upval), ChatPlatformProviderModule (upval)
		local CreateElementFunction = RoactModule.createElement
		local v1 = "Frame"
		local config = {
			AnchorPoint = p1.props.chatLayoutAlignment.AnchorPoint,
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1,
			Position = p1.props.chatLayoutAlignment.Position,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionGroup = true,
			Size = if IsInExperienceUIVREnabled then WITHCHANNELCHATINPUTBAR elseif p1.props.isSpatialUIEnabled then UDim2.fromScale(0.95, 0.68) else UDim2.fromScale(ConfigModule.ChatWindowSize.X.Scale * ChatWindowSettings.WidthScale, ConfigModule.ChatWindowSize.Y.Scale * ChatWindowSettings.HeightScale),
			[RoactModule.Change.AbsoluteSize] = p1.onChatFrameLayoutChanged,
			[RoactModule.Change.AbsolutePosition] = if FFlagExpChatPresetChatEnabled then p1.onChatFrameLayoutChanged else nil,
			[RoactModule.Event.SelectionChanged] = p1.onContainerSelectionChanged,
			[RoactModule.Ref] = if FFlagDebugFriendsChatModule or FFlagExpChatTabShortcutNav or FFlagExpChatGenericChatFocusModule then p1.setChatContainerRef else nil
		}
		local config1 = {
			uiSizeConstraint = RoactModule.createElement("UISizeConstraint", {
				MaxSize = if p1.props.isSpatialUIEnabled then Vector2.new(1e999, 1e999) else Vector2.new(ConfigModule.ChatWindowMaxWidth, 1e999)
			}),
			layout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = p1.props.chatLayoutAlignment.UIListLayoutVerticalAlignment
			}),
			topBorder = RoactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/TopRoundedRect8px.png",
				ImageColor3 = BackgroundColor,
				ImageTransparency = p1.transparencyValue:map(function(p2): number
					-- upvalues: BackgroundTransparency (upval)
					return BackgroundTransparency + p2 * (1 - BackgroundTransparency)
				end),
				LayoutOrder = 1,
				SelectionImageObject = SelectionImageObject,
				Selectable = true,
				ScaleType = Enum.ScaleType.Slice,
				Size = UDim2.new(1, 0, 0, 8),
				SliceCenter = Rect.new(8, 8, 24, 32),
				Visible = if p1.props.isChatWindowVisible then not p1.props.isChannelBarVisible else p1.props.isChatInputBarVisible and not p1.props.isChannelBarVisible,
				[RoactModule.Event.MouseEnter] = p1.props.onHovered,
				[RoactModule.Event.MouseLeave] = p1.props.onUnhovered,
				[RoactModule.Ref] = p1.topBorderRef
			}, {
				uiSizeConstraint = RoactModule.createElement("UISizeConstraint", {
					MaxSize = Vector2.new(ConfigModule.ChatWindowMaxWidth, 1e999)
				})
			}),
			topPadding = RoactModule.createElement("Frame", {
				LayoutOrder = 1,
				Size = if RenderingFriends then UDim2.fromScale(1, 0) else UDim2.new(1, 0, 0, 8),
				Visible = p1.props.isChannelBarVisible,
				BackgroundTransparency = p1.transparencyValue:map(function(p2): number
					-- upvalues: BackgroundTransparency (upval)
					return BackgroundTransparency + p2 * (1 - BackgroundTransparency)
				end),
				BackgroundColor3 = if ExpChatFixTopPaddingColor then BackgroundColor else ChatWindowSettings.BackgroundColor3,
				BorderSizePixel = 0,
				[RoactModule.Event.MouseEnter] = p1.props.onHovered,
				[RoactModule.Event.MouseLeave] = p1.props.onUnhovered,
				ZIndex = 0
			}),
			chatWindow = if IsExperienceChatRendered then if GetFFlagExpChatConditionallyMountAppLayoutModule() and (not FFlagExpChatEnableV2ChatWindowModule or not FFlagExpChatKeepV2PoolMountedModule) then p1.props.isChatWindowVisible and RoactModule.createElement(ChatWindowModule, {
				LayoutOrder = 2,
				size = UDim2.fromScale(1, 1),
				transparencyValue = p1.transparencyValue,
				textTransparency = p1.textTransparencyValue,
				onHovered = p1.props.onHovered,
				onUnhovered = p1.props.onUnhovered,
				mutedUserIds = p1.props.mutedUserIds,
				activateWhisperMode = p1.props.activateWhisperMode,
				resetTargetChannel = p1.props.resetTargetChannel,
				visible = p1.props.isChatWindowVisible,
				onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
				onAbsolutePositionChanged = p1.onAbsolutePositionChanged,
				chatWindowSettings = ChatWindowSettings,
				showTranslationButton = p1.props.showTranslationButton,
				isChannelBarVisible = p1.props.isChannelBarVisible,
				isSpatialUIEnabled = p1.props.isSpatialUIEnabled
			}) else RoactModule.createElement(ChatWindowModule, {
				LayoutOrder = 2,
				size = UDim2.fromScale(1, 1),
				transparencyValue = p1.transparencyValue,
				textTransparency = p1.textTransparencyValue,
				onHovered = p1.props.onHovered,
				onUnhovered = p1.props.onUnhovered,
				mutedUserIds = p1.props.mutedUserIds,
				activateWhisperMode = p1.props.activateWhisperMode,
				resetTargetChannel = p1.props.resetTargetChannel,
				visible = p1.props.isChatWindowVisible,
				onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
				onAbsolutePositionChanged = p1.onAbsolutePositionChanged,
				chatWindowSettings = ChatWindowSettings,
				showTranslationButton = p1.props.showTranslationButton,
				isChannelBarVisible = p1.props.isChannelBarVisible,
				isSpatialUIEnabled = p1.props.isSpatialUIEnabled
			}) else nil,
			presetChatTray = if IsExperienceChatRendered and FFlagExpChatPresetChatEnabled and FFlagExpChatPresetChatSendEnabled then RoactModule.createElement(PresetChatGateModule, {
				layoutMode = ConstantsModule.LayoutMode.Tray,
				targetTextChannel = p1.props.targetTextChannel
			}, {
				Tray = RoactModule.createElement(PresetChatTrayModule, {
					textChannel = p1.props.targetTextChannel,
					onSendChat = p1.props.onSendChat,
					onSendGlobalChat = p1.props.onSendGlobalChat
				})
			}) else nil,
			chatInputBar = if IsExperienceChatRendered and not FFlagExpChatNewInputBarModule then if IsPresetFlyOutAvailable then RoactModule.createElement(PresetChatInputRow, {
				transparencyValue = p1.transparencyValue,
				backgroundColor3 = BackgroundColor,
				backgroundTransparency = BackgroundTransparency,
				isChatWindowVisible = p1.props.isChatWindowVisible,
				isChatInputBarVisible = ShowChatEnabledUIModuleResult,
				targetTextChannel = p1.props.targetTextChannel,
				onSendChat = p1.props.onSendChat,
				onSendGlobalChat = p1.props.onSendGlobalChat,
				resetTargetChannel = p1.props.resetTargetChannel,
				onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
				onAbsolutePositionChanged = p1.onAbsolutePositionChanged,
				chatWindowSettings = ChatWindowSettings,
				isChannelBarVisible = p1.props.isChannelBarVisible,
				isSpatialUIEnabled = p1.props.isSpatialUIEnabled,
				showEnableChatButton = FFlagDebugForceEnableChatButtonOnModule1,
				onHovered = p1.props.onHovered,
				onUnhovered = p1.props.onUnhovered,
				onEnableChatActivated = function()
					-- upvalues: ManuallyInvokeAmpUpsellFunction (upval)
					ManuallyInvokeAmpUpsellFunction("InExperienceTextChatUpsell")
				end,
				presetLayoutMode = p1.state.presetLayoutMode,
				isPresetButtonHidden = if FFlagExpChatPresetButtonGlobalTabFixModule then not HasTargetTextChannel else nil
			}) else RoactModule.createElement(ChatInputModule, {
				LayoutOrder = 3,
				addTopPadding = p1.props.isChatWindowVisible,
				onSendChat = p1.props.onSendChat,
				onSendGlobalChat = p1.props.onSendGlobalChat,
				transparencyValue = p1.transparencyValue,
				resetTargetChannel = p1.props.resetTargetChannel,
				visible = ShowChatEnabledUIModuleResult,
				onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
				onAbsolutePositionChanged = p1.onAbsolutePositionChanged,
				chatWindowSettings = ChatWindowSettings,
				isChannelBarVisible = p1.props.isChannelBarVisible,
				isSpatialUIEnabled = p1.props.isSpatialUIEnabled
			}) else nil,
			friendsChat = if RenderingFriends and p1.props.isChatWindowVisible then RoactModule.createElement(FriendsChatDependencyBridgeModule, {}, {
				friendsChatMain = RoactModule.createElement(FriendsChatMainModule, {
					parentLayoutOrder = 2,
					chatWindowSettings = ChatWindowSettings,
					transparencyValue = p1.transparencyValue,
					textTransparency = p1.textTransparencyValue,
					isSpatialUIEnabled = p1.props.isSpatialUIEnabled,
					isChannelBarVisible = p1.props.isChannelBarVisible,
					onHovered = p1.props.onHovered,
					onUnhovered = p1.props.onUnhovered,
					onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
					onAbsolutePositionChanged = p1.onAbsolutePositionChanged
				})
			}) else nil,
			enableChatButton = if IsExperienceChatRendered and (not FFlagExpChatNewInputBarModule and not IsPresetFlyOutAvailable and FFlagDebugForceEnableChatButtonOnModule1) then RoactModule.createElement(EnableChatButtonModule, {
				LayoutOrder = 3,
				chatWindowSettings = ChatWindowSettings,
				transparencyValue = p1.transparencyValue,
				addTopPadding = p1.props.isChatWindowVisible,
				onHovered = p1.props.onHovered,
				onUnhovered = p1.props.onUnhovered,
				isSpatialUIEnabled = p1.props.isSpatialUIEnabled,
				visible = p1.props.isChatWindowVisible or p1.props.isChatInputBarVisible,
				onActivated = function()
					-- upvalues: ManuallyInvokeAmpUpsellFunction (upval)
					ManuallyInvokeAmpUpsellFunction("InExperienceTextChatUpsell")
				end
			}) else nil
		}
		local ChatInputRow = nil
		
		if IsExperienceChatRendered and FFlagExpChatNewInputBarModule then
			local CreateElementFunction1 = RoactModule.createElement
			local v2 = "Frame"
			local config2 = {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = BackgroundColor,
				BackgroundTransparency = p1.transparencyValue:map(function(p2): number
					-- upvalues: BackgroundTransparency (upval)
					return BackgroundTransparency + p2 * (1 - BackgroundTransparency)
				end),
				BorderSizePixel = 0,
				LayoutOrder = 3,
				Size = UDim2.fromScale(1, 0),
				Visible = not FFlagExpChatPresetChatEnabled or (p1.props.isChatWindowVisible or p1.props.isChatInputBarVisible),
				ZIndex = 2,
				[RoactModule.Event.MouseEnter] = p1.props.onHovered,
				[RoactModule.Event.MouseLeave] = p1.props.onUnhovered
			}
			local config3 = {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, 8),
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				UIPadding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 8),
					PaddingRight = UDim.new(0, 8)
				}),
				presetFlyOutWrapper = if FFlagExpChatPresetChatEnabled and (if FFlagExpChatPresetButtonGlobalTabFixModule then HasTargetTextChannel else p1.state.isPresetFlyOutAvailable) then RoactModule.createElement("CanvasGroup", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					GroupTransparency = p1.transparencyValue,
					Size = if NoShowChatEnabledUIModuleResult then UDim2.fromScale(1, 0) else UDim2.fromOffset(ConfigModule.PresetChat.ButtonWidth, 0),
					Visible = if ExpChatPresetChatFixesEnabled then p1.props.isChatWindowVisible or p1.props.isChatInputBarVisible else nil
				}, {
					PresetEntry = if p1.state.presetLayoutMode == ConstantsModule.LayoutMode.Tray then RoactModule.createElement(PresetChatButtonModule, {
						baseTransparency = 0,
						targetTextChannel = p1.props.targetTextChannel,
						addTopPadding = if FFlagExpChatCenterMobilePresetButtonModule then p1.props.isChatWindowVisible else nil,
						fullWidth = if FFlagExpChatPresetFullWidthButtonFixesModule then NoShowChatEnabledUIModuleResult else nil
					}) else RoactModule.createElement(PresetChatFlyOutModule, {
						addTopPadding = p1.props.isChatWindowVisible,
						fullWidthButton = NoShowChatEnabledUIModuleResult,
						textChannel = p1.props.targetTextChannel,
						onSendChat = p1.props.onSendChat,
						onSendGlobalChat = p1.props.onSendGlobalChat
					})
				}) else nil
			}
			local FillArea = nil
			
			if ExpChatPresetFixChatHotkey or not NoShowChatEnabledUIModuleResult then
				local CreateElementFunction2 = RoactModule.createElement
				local v3 = "Frame"
				local config4 = {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = if ExpChatPresetFixChatHotkey and NoShowChatEnabledUIModuleResult then Enum.AutomaticSize.None else Enum.AutomaticSize.Y
				}
				local _UDim2 = nil
				
				if ExpChatPresetFixChatHotkey and NoShowChatEnabledUIModuleResult then
					_UDim2 = UDim2.new(0, 0, 0, 0)
				else
					local HasTargetTextChannel1 = if FFlagExpChatPresetButtonGlobalTabFixModule then HasTargetTextChannel else p1.state.isPresetFlyOutAvailable
					_UDim2 = UDim2.new(1, if HasTargetTextChannel1 then -(ConfigModule.PresetChat.ButtonWidth + 8) else 0, 0, 0)
				end
				config4.Size = _UDim2
				config4.Visible = if ExpChatPresetFixChatHotkey then not NoShowChatEnabledUIModuleResult else nil
				FillArea = CreateElementFunction2(v3, config4, {
					enableChatButton = if FFlagDebugForceEnableChatButtonOnModule1 then RoactModule.createElement(EnableChatButtonModule, {
						chatWindowSettings = ChatWindowSettings,
						transparencyValue = p1.transparencyValue,
						addTopPadding = p1.props.isChatWindowVisible,
						onHovered = p1.props.onHovered,
						onUnhovered = p1.props.onUnhovered,
						isSpatialUIEnabled = p1.props.isSpatialUIEnabled,
						visible = p1.props.isChatWindowVisible or p1.props.isChatInputBarVisible,
						onActivated = function()
							-- upvalues: ManuallyInvokeAmpUpsellFunction (upval)
							ManuallyInvokeAmpUpsellFunction("InExperienceTextChatUpsell")
						end
					}) else nil,
					chatInputBar = if ExpChatPresetFixChatHotkey or ShowChatEnabledUIModuleResult then RoactModule.createElement(ChatInputModule, {
						suppressOuterBackground = true,
						addTopPadding = p1.props.isChatWindowVisible,
						onSendChat = p1.props.onSendChat,
						onSendGlobalChat = p1.props.onSendGlobalChat,
						transparencyValue = p1.transparencyValue,
						resetTargetChannel = p1.props.resetTargetChannel,
						visible = if ExpChatPresetFixChatHotkey then ShowChatEnabledUIModuleResult else nil,
						onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
						onAbsolutePositionChanged = p1.onAbsolutePositionChanged,
						chatWindowSettings = ChatWindowSettings,
						isChannelBarVisible = p1.props.isChannelBarVisible,
						isSpatialUIEnabled = p1.props.isSpatialUIEnabled,
						onHovered = p1.props.onHovered,
						onUnhovered = p1.props.onUnhovered
					}) else nil
				})
			else
				FillArea = nil
			end
			config3.fillArea = FillArea
			ChatInputRow = CreateElementFunction1(v2, config2, config3)
		else
			ChatInputRow = nil
		end
		config1.chatInputRow = ChatInputRow
		config1.channelBar = (not GetFFlagExpChatConditionallyMountAppLayoutModule() or p1.props.isChannelBarVisible) and RoactModule.createElement(ChannelBarModule, {
			LayoutOrder = if RenderingFriends then 100 else 4,
			size = UDim2.fromScale(1, 1),
			transparencyValue = p1.transparencyValue,
			onHovered = p1.props.onHovered,
			onUnhovered = p1.props.onUnhovered,
			chatWindowSettings = ChatWindowSettings,
			visible = p1.props.isChannelBarVisible,
			topBorderRef = p1.topBorderRef
		})
		config1.bottomBorder = if RenderingFriends then nil else RoactModule.createElement("ImageLabel", {
			Name = "bottomBorder",
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/BottomRoundedRect8px.png",
			ImageColor3 = BackgroundColor,
			ImageTransparency = p1.transparencyValue:map(function(p2): number
				-- upvalues: BackgroundTransparency (upval)
				return BackgroundTransparency + p2 * (1 - BackgroundTransparency)
			end),
			LayoutOrder = 5,
			ScaleType = Enum.ScaleType.Slice,
			Size = UDim2.new(1, 0, 0, 8),
			SliceCenter = Rect.new(8, 0, 24, 16),
			Visible = p1.props.isChatWindowVisible or p1.props.isChatInputBarVisible,
			[RoactModule.Event.MouseEnter] = p1.props.onHovered,
			[RoactModule.Event.MouseLeave] = p1.props.onUnhovered
		}, {
			uiSizeConstraint = RoactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(ConfigModule.ChatWindowMaxWidth, 1e999)
			})
		})
		local Element = CreateElementFunction(v1, config, config1)
		
		return RoactModule.createElement(SpatialUIModule.Provider, {
			value = { isSpatialUIEnabled = p1.props.isSpatialUIEnabled }
		}, {
			appLayout = if FFlagExpChatEnableFriendsTab then RoactModule.createElement(ChatPlatformProviderModule, {}, { appLayout = Element }) else Element
		})
	end
	
	return RoactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = p1.focusNavigationService }, {
		CursorProvider = RoactModule.createElement(SelectionCursorProvider, {}, {
			NewCursorProvider = RoactModule.createElement(CursorProvider, {}, {
				WithSelectionCursorProviderFunction(function(Callback)
					-- upvalues: v109 (copy), CursorKind (upval)
					return v109(Callback(CursorKind.Invisible))
				end)
			})
		})
	})
end

function AppLayout.debugInjectFakeMessages(p1)
	-- upvalues: GetFriendsChatRealtimeStoreModule (copy), FStringDebugFriendsChatConversationIdModule (copy), GetConversationMessageStoreModule (copy), GetConversationMessageListStoreModule (copy), GetMessagesStoreModule (copy)
	if p1.debugInjectionThread ~= nil then
		task.cancel(p1.debugInjectionThread)
		p1.debugInjectionThread = nil
	end
	local RenderingFriends = p1.props.renderingFriends
	local ActiveConversationId = GetFriendsChatRealtimeStoreModule(false).getActiveConversationId(false) or FStringDebugFriendsChatConversationIdModule
	
	if not RenderingFriends or ActiveConversationId ~= nil and ActiveConversationId ~= "" then
		p1.debugInjectionThread = task.spawn(function()
			-- upvalues: RenderingFriends (copy), GetConversationMessageStoreModule (upval), GetConversationMessageListStoreModule (upval), GetMessagesStoreModule (upval), ActiveConversationId (copy), p1 (copy)
			local ConversationMessageStoreModule = if RenderingFriends then GetConversationMessageStoreModule(false) else nil
			local ConversationMessageListStoreModule = if RenderingFriends then GetConversationMessageListStoreModule(false) else nil
			local MessagesStoreModule = if RenderingFriends then nil else GetMessagesStoreModule(false)
			for i = 1, 50 do
				if RenderingFriends then
					local Text: string = `debug-fake-{tostring(os.clock())}-{i}`
					ConversationMessageStoreModule.upsertMessages({
						[Text] = {
							type = "user",
							id = Text,
							content = `Fake friends-chat debug message #{i}`,
							created_at = DateTime.now():ToIsoDate(),
							sender_user_id = (i - 1) % 5 + 1
						}
					})
					ConversationMessageListStoreModule.prependMessages(ActiveConversationId, { Text })
				elseif MessagesStoreModule ~= nil then
					MessagesStoreModule.addSystemMessage(`Fake exp-chat debug message #{i}`, "RBXGeneral", nil, nil, false)
				end
				if i < 50 then
					task.wait(0.1)
				end
			end
			p1.debugInjectionThread = nil
		end)
		
		return
	end
end

local function isVisibleWithin(Gui, Current): boolean
	local Gui1 = Gui
	while Gui1 ~= nil do
		if Gui1:IsA("GuiObject") and not Gui1.Visible then
			return false
		end
		if Gui1 == Current then break end
		Gui1 = Gui1.Parent
	end
	return true
end

function AppLayout.debugSeedFocusNavigation(p2)
	-- upvalues: isVisibleWithin (copy), GuiService (copy)
	local Current = if p2.debugContainerRef then p2.debugContainerRef.current else nil
	
	if Current == nil then return end
	local Current1 = if p2.topBorderRef then p2.topBorderRef.current else nil
	for _, Gui in Current:GetDescendants() do
		if Gui:IsA("GuiObject") and Gui.Selectable and Gui ~= Current1 and isVisibleWithin(Gui, Current) then
			GuiService.SelectedCoreObject = Gui
			break
		end
	end
end

function AppLayout.willUnmount(p3)
	-- upvalues: FFlagExpChatWindowStatusEventFixesModule (copy), GetFFlagExpChatTriggerWindowStatusEventModule (copy), FFlagExpChatUseChatConfigStore (copy), FFlagExpChatPresetChatEnabled (copy)
	if FFlagExpChatWindowStatusEventFixesModule then
		p3.props.timer:stop()
		p3.props.textTimer:stop()
		
		if p3.ChatWindowStatusStore.getCurrentChatWindowState(false) ~= "closed" then
			p3.ChatWindowStatusStore.setClosedTimerStarted(os.clock())
		end
	end
	if p3.debugKeybindConnection then
		p3.debugKeybindConnection:Disconnect()
		p3.debugKeybindConnection = nil
	end
	if p3.debugInjectionThread ~= nil then
		task.cancel(p3.debugInjectionThread)
		p3.debugInjectionThread = nil
	end
	p3.disposeBackgroundEffect()
	p3.disposeTextEffect()
	p3.textTransparencyMotor:destroy()
	p3.backgroundTransparencyMotor:destroy()
	
	if GetFFlagExpChatTriggerWindowStatusEventModule() and p3.localPlayerLeavingConnection then
		p3.localPlayerLeavingConnection:Disconnect()
	end
	if FFlagExpChatUseChatConfigStore and p3.disposeChatWindowSettingsEffect then
		p3.disposeChatWindowSettingsEffect()
	end
	if FFlagExpChatUseChatConfigStore and p3.disposeChatInputBarSettingsEffect then
		p3.disposeChatInputBarSettingsEffect()
	end
	if p3.disposeChatStatusEffect then
		p3.disposeChatStatusEffect()
	end
	if FFlagExpChatPresetChatEnabled and p3.disposePresetFlyOutAvailableEffect then
		p3.disposePresetFlyOutAvailableEffect()
	end
end

return AppLayout