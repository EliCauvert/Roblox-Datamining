local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
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
local TimerModule = require(ExpChat.Timer)
local SpatialUIModule = require(ExpChat.SpatialUI)
local ClientSettingsUtilityModule = require(ExpChat.ClientSettings.ClientSettingsUtility)
local IsChatRegionLockedModule = require(ExpChat.isChatRegionLocked)
local ShowChatEnabledUIModule = require(ExpChat.showChatEnabledUI)
local AppChat = Parent.AppChat
local GetConversationMessageStoreModule = require(AppChat.GetConversationMessageStore)
local GetConversationMessageListStoreModule = require(AppChat.GetConversationMessageListStore)
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local FFlagExpChatEnableFocusNavigationModule = require(ExpChat.Flags.FFlagExpChatEnableFocusNavigation)
local FFlagExpChatFocusChannelBarSupportModule = require(ExpChat.Flags.FFlagExpChatFocusChannelBarSupport)
local FFlagExpChatTransparentFocusSupportModule = require(ExpChat.Flags.FFlagExpChatTransparentFocusSupport)
local FFlagExpChatDictationFadeOverrideModule = require(ExpChat.Flags.FFlagExpChatDictationFadeOverride)
local GetFFlagExpChatEnableChannelTabsUIModule = require(ExpChat.Flags.getFFlagExpChatEnableChannelTabsUI)
local GetFFlagExpChatConditionallyMountAppLayoutModule = require(ExpChat.Flags.getFFlagExpChatConditionallyMountAppLayout)
local FFlagExpChatEnableV2ChatWindowModule = require(ExpChat.Flags.FFlagExpChatEnableV2ChatWindow)
local FFlagExpChatKeepV2PoolMountedModule = require(ExpChat.Flags.FFlagExpChatKeepV2PoolMounted)
local FFlagExpChatPresetChatEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local FFlagExpChatPresetChatSendEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatSendEnabled
local FFlagExpChatUniverseChatPresetEnabledModule = require(ExpChat.Flags.FFlagExpChatUniverseChatPresetEnabled)
local FFlagExpChatPresetChatGamepadEnabledModule = require(ExpChat.Flags.FFlagExpChatPresetChatGamepadEnabled)
local FFlagAEGIS2EnableGatesForExpChatModule = require(ExpChat.Flags.FFlagAEGIS2EnableGatesForExpChat)
local FFlagDebugForceEnableChatButtonOnModule = require(ExpChat.Flags.FFlagDebugForceEnableChatButtonOn)
local FFlagExpChatUseMessagesStore = SharedFlagsModule.FFlagExpChatUseMessagesStore
local FFlagExpChatUseChatConfigStore = SharedFlagsModule.FFlagExpChatUseChatConfigStore
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab
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
	-- upvalues: ConfigModule (copy), FoundationModule (copy), RoactModule (copy), ExpChatPresetChatFixesEnabled (copy), ConstantsModule (copy), PresetChatButtonModule (copy), PresetChatFlyOutModule (copy), EnableChatButtonModule (copy), ExpChatPresetFixChatHotkey (copy), ChatInputModule (copy)
	local ButtonWidth = if p1.showEnableChatButton then ConfigModule.PresetChat.ButtonWidth else 47
	local Small = if p1.showEnableChatButton then FoundationModule.Enums.InputSize.Small else FoundationModule.Enums.InputSize.Medium
	
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
				Position = UDim2.new(0.5, if p1.showEnableChatButton then 5 else 3, 0.5, if ExpChatPresetChatFixesEnabled then 0 else -1),
				AutomaticSize = Enum.AutomaticSize.XY,
				GroupTransparency = p1.transparencyValue
			}, {
				Content = if p1.presetLayoutMode == ConstantsModule.LayoutMode.Tray then RoactModule.createElement(PresetChatButtonModule, { isCircular = false, size = Small }) else RoactModule.createElement(PresetChatFlyOutModule, {
					buttonIsCircular = false,
					addTopPadding = p1.isChatWindowVisible,
					textChannel = p1.targetTextChannel,
					buttonSize = Small
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
	-- upvalues: FFlagDebugFriendsChatModule (copy), FFlagDebugExpChatPerfModule (copy), UserInputService (copy), RoactModule (copy), OtterModule (copy), GetTransparencyStoreModule (copy), GetFFlagExpChatTriggerWindowStatusEventModule (copy), GetChatWindowStatusStoreModule (copy), Players (copy), TextChatService (copy), FFlagExpChatUseChatConfigStore (copy), GetChatConfigurationStoreModule (copy), FFlagExpChatTransparentFocusSupportModule (copy), FFlagExpChatDictationFadeOverrideModule (copy), config (copy), CreateEffectFunction (copy), FFlagAEGIS2EnableGatesForExpChatModule (copy), GetChatStatusStoreModule (copy), FFlagExpChatPresetChatEnabled (copy), GetPresetChatStoreModule (copy), ConstantsModule (copy), FFlagExpChatPresetChatGamepadEnabledModule (copy), FFlagExpChatPresetChatSendEnabled (copy), FFlagExpChatUniverseChatPresetEnabledModule (copy), FFlagExpChatEnableFocusNavigationModule (copy), ReactFocusNavigationModule (copy), FFlagExpChatFocusChannelBarSupportModule (copy), GetFocusNavigationStoreModule (copy), FocusUtils (copy)
	p1.state = {}
	
	if FFlagDebugFriendsChatModule or FFlagDebugExpChatPerfModule then
		p1.debugInjectionThread = nil
		p1.debugKeybindConnection = UserInputService.InputBegan:Connect(function(Input, GameProcessed)
			-- upvalues: p1 (copy)
			if GameProcessed then return end
			if Input.KeyCode == Enum.KeyCode.K and Input:IsModifierKeyDown(Enum.ModifierKey.Ctrl) then
				p1:debugInjectFakeMessages()
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
	
	if GetFFlagExpChatTriggerWindowStatusEventModule() then
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
	function p1.resetBackgroundTransparency()
		-- upvalues: FFlagExpChatTransparentFocusSupportModule (upval), FFlagExpChatDictationFadeOverrideModule (upval), TransparencyStoreModule (copy), p1 (copy), OtterModule (upval), GetFFlagExpChatTriggerWindowStatusEventModule (upval), config (upval)
		local IsFocused = if FFlagExpChatTransparentFocusSupportModule or FFlagExpChatDictationFadeOverrideModule then TransparencyStoreModule.getIsFocused(false) else TransparencyStoreModule.getIsTextBoxFocused(false)
		p1.backgroundTransparencyMotor:setGoal(OtterModule.instant(0))
		p1.props.timer:stop()
		
		if IsFocused == false and p1.props.isSpatialUIEnabled == false then
			p1.props.timer:start():andThen(function()
				-- upvalues: GetFFlagExpChatTriggerWindowStatusEventModule (upval), p1 (upval), OtterModule (upval), config (upval)
				if GetFFlagExpChatTriggerWindowStatusEventModule() then
					p1.ChatWindowStatusStore.setBackgroundTimerStarted(os.clock())
				end
				p1.backgroundTransparencyMotor:setGoal(OtterModule.spring(1, config))
			end)
		end
	end
	
	function p1.resetTextTransparency()
		-- upvalues: FFlagExpChatTransparentFocusSupportModule (upval), FFlagExpChatDictationFadeOverrideModule (upval), TransparencyStoreModule (copy), p1 (copy), OtterModule (upval), GetFFlagExpChatTriggerWindowStatusEventModule (upval), config (upval)
		local IsFocused = if FFlagExpChatTransparentFocusSupportModule or FFlagExpChatDictationFadeOverrideModule then TransparencyStoreModule.getIsFocused(false) else TransparencyStoreModule.getIsTextBoxFocused(false)
		p1.textTransparencyMotor:setGoal(OtterModule.instant(0))
		p1.props.textTimer:stop()
		
		if IsFocused == false then
			p1.props.textTimer:start():andThen(function()
				-- upvalues: GetFFlagExpChatTriggerWindowStatusEventModule (upval), p1 (upval), OtterModule (upval), config (upval)
				if GetFFlagExpChatTriggerWindowStatusEventModule() then
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
	
	if FFlagAEGIS2EnableGatesForExpChatModule then
		p1.disposeChatStatusEffect = CreateEffectFunction(function(p2)
			-- upvalues: GetChatStatusStoreModule (upval), p1 (copy)
			p1:setState({
				chatStatus = GetChatStatusStoreModule(p2).getChatStatus(p2)
			})
		end)
	end
	if FFlagExpChatPresetChatEnabled then
		p1.disposePresetFlyOutAvailableEffect = CreateEffectFunction(function(p2)
			-- upvalues: GetPresetChatStoreModule (upval), ConstantsModule (upval), FFlagExpChatPresetChatGamepadEnabledModule (upval), UserInputService (upval), p1 (copy), FFlagExpChatPresetChatSendEnabled (upval), FFlagExpChatUniverseChatPresetEnabledModule (upval)
			local PresetChatStoreModule = GetPresetChatStoreModule(p2)
			local AccessLevel = PresetChatStoreModule.getAccessLevel(p2)
			local LayoutModeOverride = PresetChatStoreModule.getLayoutModeOverride(p2)
			p1:setState({
				isPresetFlyOutAvailable = PresetChatStoreModule.getIsEnabled(p2) and (FFlagExpChatPresetChatSendEnabled and (AccessLevel == ConstantsModule.AccessLevel.Enabled and (p1.props.targetTextChannel ~= nil or FFlagExpChatUniverseChatPresetEnabledModule))),
				presetLayoutMode = if LayoutModeOverride == ConstantsModule.LayoutMode.Tray or LayoutModeOverride == ConstantsModule.LayoutMode.FlyOut then LayoutModeOverride elseif FFlagExpChatPresetChatGamepadEnabledModule and UserInputService.PreferredInput == Enum.PreferredInput.Gamepad then ConstantsModule.LayoutMode.FlyOut elseif UserInputService.TouchEnabled and not UserInputService.MouseEnabled then ConstantsModule.LayoutMode.Tray else ConstantsModule.LayoutMode.FlyOut
			})
		end)
	end
	function p1.onAbsolutePositionChanged(Frame, p2)
		p2.AbsolutePositionWrite = Frame.AbsolutePosition
	end
	
	function p1.onAbsoluteSizeChanged(Frame, p2)
		p2.AbsoluteSizeWrite = Frame.AbsoluteSize
	end
	
	p1.onChatFrameLayoutChanged = if FFlagExpChatPresetChatEnabled then function(Frame: Frame)
		-- upvalues: GetPresetChatStoreModule (upval)
		GetPresetChatStoreModule(false).setChatWindowBottomY(Frame.AbsolutePosition.Y + Frame.AbsoluteSize.Y)
	end else nil
	
	if FFlagExpChatEnableFocusNavigationModule then
		p1.focusNavigationService = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
		p1.topBorderRef = if FFlagExpChatFocusChannelBarSupportModule then RoactModule.createRef() else nil
		
		function p1.onContainerSelectionChanged(Ancestor, _, _, Current)
			-- upvalues: GetFocusNavigationStoreModule (upval), FFlagExpChatTransparentFocusSupportModule (upval), TransparencyStoreModule (copy), FFlagExpChatFocusChannelBarSupportModule (upval), p1 (copy), FocusUtils (upval)
			if Current == nil or not Current:IsDescendantOf(Ancestor) then
				GetFocusNavigationStoreModule(false).unfocusChatInputBar()
				
				if FFlagExpChatTransparentFocusSupportModule then
					TransparencyStoreModule.clearWindowFocusInput()
					
					return
				end
			else
				if FFlagExpChatTransparentFocusSupportModule then
					TransparencyStoreModule.setWindowFocusInput()
				end
				if FFlagExpChatFocusChannelBarSupportModule and Current == p1.topBorderRef.current then
					FocusUtils.FocusOnChrome(function()
						-- upvalues: GetFocusNavigationStoreModule (upval)
						GetFocusNavigationStoreModule(false).unfocusChatInputBar()
					end, "chat")
				end
			end
		end
		
		if not FFlagExpChatFocusChannelBarSupportModule then
			function p1:onBorderSelectionChanged(p2, _, _)
				-- upvalues: FocusUtils (upval), GetFocusNavigationStoreModule (upval)
				if p2 then
					FocusUtils.FocusOnChrome(function()
						-- upvalues: GetFocusNavigationStoreModule (upval)
						GetFocusNavigationStoreModule(false).unfocusChatInputBar()
					end, "chat")
				end
			end
		end
	end
end

function AppLayout.didMount(p1)
	-- upvalues: GetFFlagExpChatTriggerWindowStatusEventModule (copy), OtterModule (copy), config (copy)
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

function AppLayout.render(p1)
	-- upvalues: GetFFlagExpChatTriggerWindowStatusEventModule (copy), FFlagExpChatUseChatConfigStore (copy), ClientSettingsUtilityModule (copy), FFlagExpChatEnableFriendsTab (copy), FFlagAEGIS2EnableGatesForExpChatModule (copy), ShowChatEnabledUIModule (copy), IsInExperienceUIVREnabled (copy), GetFFlagExpChatConditionallyMountAppLayoutModule (copy), GetFFlagExpChatEnableChannelTabsUIModule (copy), Config (copy), ConfigModule (copy), FFlagDebugForceEnableChatButtonOnModule (copy), IsChatRegionLockedModule (copy), ExpChatPresetButtonOldInputBarV2 (copy), FFlagExpChatPresetChatEnabled (copy), RoactModule (copy), FFlagExpChatEnableFocusNavigationModule (copy), FFlagExpChatFocusChannelBarSupportModule (copy), ExpChatFixTopPaddingColor (copy), FFlagExpChatEnableV2ChatWindowModule (copy), FFlagExpChatKeepV2PoolMountedModule (copy), ChatWindowModule (copy), FFlagExpChatUseMessagesStore (copy), FFlagExpChatPresetChatSendEnabled (copy), PresetChatGateModule (copy), ConstantsModule (copy), PresetChatTrayModule (copy), FFlagExpChatNewInputBarModule (copy), PresetChatInputRow (copy), ManuallyInvokeAmpUpsellFunction (copy), ChatInputModule (copy), FriendsChatDependencyBridgeModule (copy), FriendsChatMainModule (copy), EnableChatButtonModule (copy), ExpChatPresetChatFixesEnabled (copy), PresetChatButtonModule (copy), PresetChatFlyOutModule (copy), ExpChatPresetFixChatHotkey (copy), ChannelBarModule (copy), SpatialUIModule (copy), ChatPlatformProviderModule (copy), ReactFocusNavigationModule (copy), SelectionCursorProvider (copy), CursorProvider (copy), WithSelectionCursorProviderFunction (copy), CursorKind (copy)
	if GetFFlagExpChatTriggerWindowStatusEventModule() then
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
	local IsFriendsChat: boolean = FFlagExpChatEnableFriendsTab and p1.props.selectedTabType == "FriendsChat"
	local NoIsFriendsChat = not IsFriendsChat
	local ChatStatus = nil
	local IsChatInputBarVisible = p1.props.isChatInputBarVisible
	
	if FFlagAEGIS2EnableGatesForExpChatModule then
		ChatStatus = p1.state.chatStatus
		IsChatInputBarVisible = IsChatInputBarVisible and ShowChatEnabledUIModule(ChatStatus)
	end
	if IsInExperienceUIVREnabled then
		if p1.props.isSpatialUIEnabled then
			local IsChannelBarVisible = GetFFlagExpChatConditionallyMountAppLayoutModule() and (GetFFlagExpChatEnableChannelTabsUIModule() and p1.props.isChannelBarVisible)
			WITHCHANNELCHATINPUTBAR = if IsChannelBarVisible and IsChatInputBarVisible then Config.WITH_CHANNEL_CHATINPUT_BAR elseif IsChannelBarVisible and not IsChatInputBarVisible then Config.WITH_CHANNEL_BAR elseif IsChannelBarVisible or not IsChatInputBarVisible then Config.DEFAULT else Config.WITH_CHATINPUT_BAR
		else
			WITHCHANNELCHATINPUTBAR = UDim2.fromScale(ConfigModule.ChatWindowSize.X.Scale * ChatWindowSettings.WidthScale, ConfigModule.ChatWindowSize.Y.Scale * ChatWindowSettings.HeightScale)
		end
	end
	local FFlagDebugForceEnableChatButtonOnModule1 = FFlagDebugForceEnableChatButtonOnModule or FFlagAEGIS2EnableGatesForExpChatModule and (not IsChatRegionLockedModule() and (p1.props.canPlatformEnableChat() and ChatStatus == "AgeVerificationRequired"))
	local IsPresetFlyOutAvailable = ExpChatPresetButtonOldInputBarV2 and (FFlagExpChatPresetChatEnabled and p1.state.isPresetFlyOutAvailable)
	local NoIsChatInputBarVisible: boolean = FFlagExpChatPresetChatEnabled and (p1.state.isPresetFlyOutAvailable and (not FFlagDebugForceEnableChatButtonOnModule1 and not IsChatInputBarVisible))
	
	local function v98(SelectionImageObject)
		-- upvalues: RoactModule (upval), p1 (copy), FFlagExpChatEnableFocusNavigationModule (upval), IsInExperienceUIVREnabled (upval), WITHCHANNELCHATINPUTBAR (ref), ConfigModule (upval), ChatWindowSettings (copy), FFlagExpChatPresetChatEnabled (upval), BackgroundColor (copy), BackgroundTransparency (copy), GetFFlagExpChatEnableChannelTabsUIModule (upval), FFlagExpChatFocusChannelBarSupportModule (upval), IsFriendsChat (copy), ExpChatFixTopPaddingColor (upval), NoIsFriendsChat (copy), GetFFlagExpChatConditionallyMountAppLayoutModule (upval), FFlagExpChatEnableV2ChatWindowModule (upval), FFlagExpChatKeepV2PoolMountedModule (upval), ChatWindowModule (upval), FFlagExpChatUseMessagesStore (upval), FFlagExpChatPresetChatSendEnabled (upval), PresetChatGateModule (upval), ConstantsModule (upval), PresetChatTrayModule (upval), FFlagExpChatNewInputBarModule (upval), IsPresetFlyOutAvailable (copy), PresetChatInputRow (upval), IsChatInputBarVisible (ref), FFlagDebugForceEnableChatButtonOnModule1 (copy), ManuallyInvokeAmpUpsellFunction (upval), ChatInputModule (upval), FriendsChatDependencyBridgeModule (upval), FriendsChatMainModule (upval), EnableChatButtonModule (upval), NoIsChatInputBarVisible (copy), ExpChatPresetChatFixesEnabled (upval), PresetChatButtonModule (upval), PresetChatFlyOutModule (upval), ExpChatPresetFixChatHotkey (upval), ChannelBarModule (upval), SpatialUIModule (upval), FFlagExpChatEnableFriendsTab (upval), ChatPlatformProviderModule (upval)
		local Frame = RoactModule.createElement("Frame", {
			AnchorPoint = p1.props.chatLayoutAlignment.AnchorPoint,
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1,
			Position = p1.props.chatLayoutAlignment.Position,
			SelectionBehaviorDown = if FFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorLeft = if FFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorRight = if FFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorUp = if FFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
			SelectionGroup = if FFlagExpChatEnableFocusNavigationModule then true else nil,
			Size = if IsInExperienceUIVREnabled then WITHCHANNELCHATINPUTBAR elseif p1.props.isSpatialUIEnabled then UDim2.fromScale(0.95, 0.68) else UDim2.fromScale(ConfigModule.ChatWindowSize.X.Scale * ChatWindowSettings.WidthScale, ConfigModule.ChatWindowSize.Y.Scale * ChatWindowSettings.HeightScale),
			[RoactModule.Change.AbsoluteSize] = if FFlagExpChatPresetChatEnabled then p1.onChatFrameLayoutChanged else nil,
			[RoactModule.Change.AbsolutePosition] = if FFlagExpChatPresetChatEnabled then p1.onChatFrameLayoutChanged else nil,
			[RoactModule.Event.SelectionChanged] = p1.onContainerSelectionChanged
		}, {
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
				Selectable = if FFlagExpChatEnableFocusNavigationModule then true else nil,
				ScaleType = Enum.ScaleType.Slice,
				Size = UDim2.new(1, 0, 0, 8),
				SliceCenter = Rect.new(8, 8, 24, 32),
				Visible = if GetFFlagExpChatEnableChannelTabsUIModule() then if p1.props.isChatWindowVisible then not p1.props.isChannelBarVisible else p1.props.isChatInputBarVisible and not p1.props.isChannelBarVisible else p1.props.isChatWindowVisible or p1.props.isChatInputBarVisible,
				[RoactModule.Event.MouseEnter] = p1.props.onHovered,
				[RoactModule.Event.MouseLeave] = p1.props.onUnhovered,
				[RoactModule.Event.SelectionChanged] = if FFlagExpChatFocusChannelBarSupportModule then nil else p1.onBorderSelectionChanged,
				[RoactModule.Ref] = if FFlagExpChatFocusChannelBarSupportModule then p1.topBorderRef else nil
			}, {
				uiSizeConstraint = RoactModule.createElement("UISizeConstraint", {
					MaxSize = Vector2.new(ConfigModule.ChatWindowMaxWidth, 1e999)
				})
			}),
			topPadding = RoactModule.createElement("Frame", {
				LayoutOrder = 1,
				Size = if IsFriendsChat then UDim2.fromScale(1, 0) else UDim2.new(1, 0, 0, 8),
				Visible = if GetFFlagExpChatEnableChannelTabsUIModule() then p1.props.isChannelBarVisible else false,
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
			chatWindow = if NoIsFriendsChat then if GetFFlagExpChatConditionallyMountAppLayoutModule() and (not FFlagExpChatEnableV2ChatWindowModule or not FFlagExpChatKeepV2PoolMountedModule) then p1.props.isChatWindowVisible and RoactModule.createElement(ChatWindowModule, {
				LayoutOrder = 2,
				size = UDim2.fromScale(1, 1),
				transparencyValue = p1.transparencyValue,
				textTransparency = p1.textTransparencyValue,
				onHovered = p1.props.onHovered,
				onUnhovered = p1.props.onUnhovered,
				mutedUserIds = p1.props.mutedUserIds,
				canLocalUserChat = if FFlagExpChatUseMessagesStore then nil else p1.props.canLocalUserChat,
				activateWhisperMode = p1.props.activateWhisperMode,
				resetTargetChannel = p1.props.resetTargetChannel,
				visible = p1.props.isChatWindowVisible,
				onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
				onAbsolutePositionChanged = p1.onAbsolutePositionChanged,
				chatWindowSettings = ChatWindowSettings,
				showTranslationButton = p1.props.showTranslationButton,
				isChannelBarVisible = if GetFFlagExpChatEnableChannelTabsUIModule() then p1.props.isChannelBarVisible else false,
				isSpatialUIEnabled = p1.props.isSpatialUIEnabled
			}) else RoactModule.createElement(ChatWindowModule, {
				LayoutOrder = 2,
				size = UDim2.fromScale(1, 1),
				transparencyValue = p1.transparencyValue,
				textTransparency = p1.textTransparencyValue,
				onHovered = p1.props.onHovered,
				onUnhovered = p1.props.onUnhovered,
				mutedUserIds = p1.props.mutedUserIds,
				canLocalUserChat = if FFlagExpChatUseMessagesStore then nil else p1.props.canLocalUserChat,
				activateWhisperMode = p1.props.activateWhisperMode,
				resetTargetChannel = p1.props.resetTargetChannel,
				visible = p1.props.isChatWindowVisible,
				onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
				onAbsolutePositionChanged = p1.onAbsolutePositionChanged,
				chatWindowSettings = ChatWindowSettings,
				showTranslationButton = p1.props.showTranslationButton,
				isChannelBarVisible = if GetFFlagExpChatEnableChannelTabsUIModule() then p1.props.isChannelBarVisible else false,
				isSpatialUIEnabled = p1.props.isSpatialUIEnabled
			}) else nil,
			presetChatTray = if NoIsFriendsChat and FFlagExpChatPresetChatEnabled and FFlagExpChatPresetChatSendEnabled then RoactModule.createElement(PresetChatGateModule, {
				layoutMode = ConstantsModule.LayoutMode.Tray,
				targetTextChannel = p1.props.targetTextChannel
			}, {
				Tray = RoactModule.createElement(PresetChatTrayModule, { textChannel = p1.props.targetTextChannel })
			}) else nil,
			chatInputBar = if NoIsFriendsChat and not FFlagExpChatNewInputBarModule then if IsPresetFlyOutAvailable then RoactModule.createElement(PresetChatInputRow, {
				transparencyValue = p1.transparencyValue,
				backgroundColor3 = BackgroundColor,
				backgroundTransparency = BackgroundTransparency,
				isChatWindowVisible = p1.props.isChatWindowVisible,
				isChatInputBarVisible = IsChatInputBarVisible,
				targetTextChannel = p1.props.targetTextChannel,
				onSendChat = p1.props.onSendChat,
				onSendGlobalChat = p1.props.onSendGlobalChat,
				canLocalUserChat = if FFlagExpChatUseMessagesStore then nil else p1.props.canLocalUserChat,
				resetTargetChannel = p1.props.resetTargetChannel,
				onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
				onAbsolutePositionChanged = p1.onAbsolutePositionChanged,
				chatWindowSettings = ChatWindowSettings,
				isChannelBarVisible = if GetFFlagExpChatEnableChannelTabsUIModule() then p1.props.isChannelBarVisible else false,
				isSpatialUIEnabled = p1.props.isSpatialUIEnabled,
				showEnableChatButton = FFlagDebugForceEnableChatButtonOnModule1,
				onHovered = p1.props.onHovered,
				onUnhovered = p1.props.onUnhovered,
				onEnableChatActivated = function()
					-- upvalues: ManuallyInvokeAmpUpsellFunction (upval)
					ManuallyInvokeAmpUpsellFunction("InExperienceTextChatUpsell")
				end,
				presetLayoutMode = p1.state.presetLayoutMode
			}) else RoactModule.createElement(ChatInputModule, {
				LayoutOrder = 3,
				addTopPadding = p1.props.isChatWindowVisible,
				onSendChat = p1.props.onSendChat,
				onSendGlobalChat = p1.props.onSendGlobalChat,
				transparencyValue = p1.transparencyValue,
				canLocalUserChat = if FFlagExpChatUseMessagesStore then nil else p1.props.canLocalUserChat,
				resetTargetChannel = p1.props.resetTargetChannel,
				visible = IsChatInputBarVisible,
				onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
				onAbsolutePositionChanged = p1.onAbsolutePositionChanged,
				chatWindowSettings = ChatWindowSettings,
				isChannelBarVisible = if GetFFlagExpChatEnableChannelTabsUIModule() then p1.props.isChannelBarVisible else false,
				isSpatialUIEnabled = p1.props.isSpatialUIEnabled
			}) else nil,
			friendsChat = if IsFriendsChat and p1.props.isChatWindowVisible then RoactModule.createElement(FriendsChatDependencyBridgeModule, {}, {
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
			enableChatButton = if NoIsFriendsChat and (not FFlagExpChatNewInputBarModule and not IsPresetFlyOutAvailable and FFlagDebugForceEnableChatButtonOnModule1) then RoactModule.createElement(EnableChatButtonModule, {
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
			}) else nil,
			chatInputRow = if NoIsFriendsChat and FFlagExpChatNewInputBarModule then RoactModule.createElement("Frame", {
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
			}, {
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
				presetFlyOutWrapper = if FFlagExpChatPresetChatEnabled and p1.state.isPresetFlyOutAvailable then RoactModule.createElement("CanvasGroup", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					GroupTransparency = p1.transparencyValue,
					Size = if NoIsChatInputBarVisible then UDim2.fromScale(1, 0) else UDim2.fromOffset(ConfigModule.PresetChat.ButtonWidth, 0),
					Visible = if ExpChatPresetChatFixesEnabled then p1.props.isChatWindowVisible or p1.props.isChatInputBarVisible else nil
				}, {
					PresetEntry = if p1.state.presetLayoutMode == ConstantsModule.LayoutMode.Tray then RoactModule.createElement(PresetChatButtonModule, {
						baseTransparency = 0,
						targetTextChannel = p1.props.targetTextChannel
					}) else RoactModule.createElement(PresetChatFlyOutModule, {
						addTopPadding = p1.props.isChatWindowVisible,
						fullWidthButton = NoIsChatInputBarVisible,
						textChannel = p1.props.targetTextChannel
					})
				}) else nil,
				fillArea = if ExpChatPresetFixChatHotkey or not NoIsChatInputBarVisible then RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = if ExpChatPresetFixChatHotkey and NoIsChatInputBarVisible then Enum.AutomaticSize.None else Enum.AutomaticSize.Y,
					Size = if ExpChatPresetFixChatHotkey and NoIsChatInputBarVisible then UDim2.new(0, 0, 0, 0) else UDim2.new(1, if p1.state.isPresetFlyOutAvailable then -(ConfigModule.PresetChat.ButtonWidth + 8) else 0, 0, 0),
					Visible = if ExpChatPresetFixChatHotkey then not NoIsChatInputBarVisible else nil
				}, {
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
					chatInputBar = if ExpChatPresetFixChatHotkey or IsChatInputBarVisible then RoactModule.createElement(ChatInputModule, {
						suppressOuterBackground = true,
						addTopPadding = p1.props.isChatWindowVisible,
						onSendChat = p1.props.onSendChat,
						onSendGlobalChat = p1.props.onSendGlobalChat,
						transparencyValue = p1.transparencyValue,
						canLocalUserChat = if FFlagExpChatUseMessagesStore then nil else p1.props.canLocalUserChat,
						resetTargetChannel = p1.props.resetTargetChannel,
						visible = if ExpChatPresetFixChatHotkey then IsChatInputBarVisible else nil,
						onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
						onAbsolutePositionChanged = p1.onAbsolutePositionChanged,
						chatWindowSettings = ChatWindowSettings,
						isChannelBarVisible = if GetFFlagExpChatEnableChannelTabsUIModule() then p1.props.isChannelBarVisible else false,
						isSpatialUIEnabled = p1.props.isSpatialUIEnabled,
						onHovered = p1.props.onHovered,
						onUnhovered = p1.props.onUnhovered
					}) else nil
				}) else nil
			}) else nil,
			channelBar = (not GetFFlagExpChatConditionallyMountAppLayoutModule() or p1.props.isChannelBarVisible) and RoactModule.createElement(ChannelBarModule, {
				LayoutOrder = if IsFriendsChat then 100 else 4,
				size = UDim2.fromScale(1, 1),
				transparencyValue = p1.transparencyValue,
				onHovered = p1.props.onHovered,
				onUnhovered = p1.props.onUnhovered,
				chatWindowSettings = ChatWindowSettings,
				visible = if GetFFlagExpChatEnableChannelTabsUIModule() then p1.props.isChannelBarVisible else false,
				topBorderRef = if FFlagExpChatFocusChannelBarSupportModule then p1.topBorderRef else nil
			}),
			bottomBorder = if IsFriendsChat then nil else RoactModule.createElement("ImageLabel", {
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
		})
		
		return RoactModule.createElement(SpatialUIModule.Provider, {
			value = { isSpatialUIEnabled = p1.props.isSpatialUIEnabled }
		}, {
			appLayout = if FFlagExpChatEnableFriendsTab then RoactModule.createElement(ChatPlatformProviderModule, {}, { appLayout = Frame }) else Frame
		})
	end
	
	return if FFlagExpChatEnableFocusNavigationModule then RoactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = p1.focusNavigationService }, {
		CursorProvider = RoactModule.createElement(SelectionCursorProvider, {}, {
			NewCursorProvider = RoactModule.createElement(CursorProvider, {}, {
				WithSelectionCursorProviderFunction(function(Callback)
					-- upvalues: v98 (copy), CursorKind (upval)
					return v98(Callback(CursorKind.Invisible))
				end)
			})
		})
	}) else v98(nil)
end

function AppLayout.debugInjectFakeMessages(p1)
	-- upvalues: FFlagExpChatEnableFriendsTab (copy), GetFriendsChatRealtimeStoreModule (copy), FStringDebugFriendsChatConversationIdModule (copy), GetConversationMessageStoreModule (copy), GetConversationMessageListStoreModule (copy), FFlagExpChatUseMessagesStore (copy), GetMessagesStoreModule (copy)
	if p1.debugInjectionThread ~= nil then
		task.cancel(p1.debugInjectionThread)
		p1.debugInjectionThread = nil
	end
	local IsFriendsChat: boolean = FFlagExpChatEnableFriendsTab and p1.props.selectedTabType == "FriendsChat"
	local ActiveConversationId = GetFriendsChatRealtimeStoreModule(false).getActiveConversationId(false) or FStringDebugFriendsChatConversationIdModule
	
	if not IsFriendsChat or ActiveConversationId ~= nil and ActiveConversationId ~= "" then
		p1.debugInjectionThread = task.spawn(function()
			-- upvalues: IsFriendsChat (copy), GetConversationMessageStoreModule (upval), GetConversationMessageListStoreModule (upval), FFlagExpChatUseMessagesStore (upval), GetMessagesStoreModule (upval), ActiveConversationId (copy), p1 (copy)
			local ConversationMessageStoreModule = if IsFriendsChat then GetConversationMessageStoreModule(false) else nil
			local ConversationMessageListStoreModule = if IsFriendsChat then GetConversationMessageListStoreModule(false) else nil
			local MessagesStoreModule = if IsFriendsChat or not FFlagExpChatUseMessagesStore then nil else GetMessagesStoreModule(false)
			for i = 1, 50 do
				if IsFriendsChat then
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

function AppLayout.willUnmount(p2)
	-- upvalues: GetFFlagExpChatTriggerWindowStatusEventModule (copy), FFlagExpChatUseChatConfigStore (copy), FFlagAEGIS2EnableGatesForExpChatModule (copy), FFlagExpChatPresetChatEnabled (copy)
	if p2.debugKeybindConnection then
		p2.debugKeybindConnection:Disconnect()
		p2.debugKeybindConnection = nil
	end
	if p2.debugInjectionThread ~= nil then
		task.cancel(p2.debugInjectionThread)
		p2.debugInjectionThread = nil
	end
	p2.disposeBackgroundEffect()
	p2.disposeTextEffect()
	p2.textTransparencyMotor:destroy()
	p2.backgroundTransparencyMotor:destroy()
	
	if GetFFlagExpChatTriggerWindowStatusEventModule() and p2.localPlayerLeavingConnection then
		p2.localPlayerLeavingConnection:Disconnect()
	end
	if FFlagExpChatUseChatConfigStore and p2.disposeChatWindowSettingsEffect then
		p2.disposeChatWindowSettingsEffect()
	end
	if FFlagExpChatUseChatConfigStore and p2.disposeChatInputBarSettingsEffect then
		p2.disposeChatInputBarSettingsEffect()
	end
	if FFlagAEGIS2EnableGatesForExpChatModule and p2.disposeChatStatusEffect then
		p2.disposeChatStatusEffect()
	end
	if FFlagExpChatPresetChatEnabled and p2.disposePresetFlyOutAvailableEffect then
		p2.disposePresetFlyOutAvailableEffect()
	end
end

return AppLayout