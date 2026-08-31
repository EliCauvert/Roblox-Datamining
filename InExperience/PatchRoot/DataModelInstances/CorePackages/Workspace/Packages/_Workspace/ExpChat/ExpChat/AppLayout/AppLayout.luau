local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local textChatService = game:GetService("TextChatService")
local playersService = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local focusUtils = require(parent.Chrome).FocusUtils
local otterModule = require(parent.Otter)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local roactModule = require(parent.Roact)
local socialUpsellModule = require(parent.SocialUpsell)
local createEffect = require(parent.Signals).createEffect
local sharedFlagsModule = require(parent.SharedFlags)
local expChatSharedModule = require(parent.ExpChatShared)
local UIBloxModule = require(parent.UIBlox)
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local selectionCursorProvider = UIBloxModule.App.SelectionImage.SelectionCursorProvider
local cursorProvider = UIBloxModule.App.SelectionCursor.CursorProvider
local withSelectionCursorProvider = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local foundationModule = require(parent.Foundation)
local chatInputModule = require(expChat.ChatInput)
local chatWindowModule = require(expChat.ChatWindow)
local channelBarModule = require(expChat.ChannelBar)
local configModule = require(expChat.Config)
local enableChatButtonModule = require(expChat.EnableChatButton)
local friendsChatMainModule = require(parent.FriendsChat.FriendsChatMain)
local chatPlatformProviderModule = require(expChat.ChatPlatform.ChatPlatformProvider)
local friendsChatDependencyBridgeModule = require(expChat.FriendsChatDependencyBridge)
local getFriendsChatRealtimeStoreModule = require(parent.FriendsChat.GetFriendsChatRealtimeStore)
local presetChatTrayModule = require(expChat.PresetChat.PresetChatTray)
local presetChatButtonModule = require(expChat.PresetChat.PresetChatButton)
local presetChatFlyOutModule = require(expChat.PresetChat.PresetChatFlyOut)
local presetChatGateModule = require(expChat.PresetChat.PresetChatGate)
local constantsModule = require(expChat.PresetChat.Constants)
local getChatConfigurationStoreModule = require(expChat.Stores.GetChatConfigurationStore)
local getChatStatusStoreModule = require(expChat.Stores.GetChatStatusStore)
local getPresetChatStoreModule = require(expChat.Stores.GetPresetChatStore)
local getChatLayoutStoreModule = require(expChat.Stores.GetChatLayoutStore)
local timerModule = require(expChat.Timer)
local spatialUIModule = require(expChat.SpatialUI)
local clientSettingsUtilityModule = require(expChat.ClientSettings.ClientSettingsUtility)
local canPlatformEnableChatModule = require(expChat.canPlatformEnableChat)
local isChatRegionLockedModule = require(expChat.isChatRegionLocked)
local showChatEnabledUIModule = require(expChat.showChatEnabledUI)
local appChat = parent.AppChat
local getConversationMessageStoreModule = require(appChat.GetConversationMessageStore)
local getConversationMessageListStoreModule = require(appChat.GetConversationMessageListStore)
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local fFlagExpChatFixChannelBarInitialWidthModule = require(expChat.Flags.FFlagExpChatFixChannelBarInitialWidth)
local fFlagExpChatFocusChannelBarSupportModule = require(expChat.Flags.FFlagExpChatFocusChannelBarSupport)
local fFlagExpChatTransparentFocusSupportModule = require(expChat.Flags.FFlagExpChatTransparentFocusSupport)
local fFlagExpChatDictationFadeOverrideModule = require(expChat.Flags.FFlagExpChatDictationFadeOverride)
local getFFlagExpChatEnableChannelTabsUIModule = require(expChat.Flags.getFFlagExpChatEnableChannelTabsUI)
local getFFlagExpChatConditionallyMountAppLayoutModule = require(expChat.Flags.getFFlagExpChatConditionallyMountAppLayout)
local fFlagExpChatEnableV2ChatWindowModule = require(expChat.Flags.FFlagExpChatEnableV2ChatWindow)
local fFlagExpChatKeepV2PoolMountedModule = require(expChat.Flags.FFlagExpChatKeepV2PoolMounted)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local fFlagExpChatPresetChatSendEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatSendEnabled
local fFlagExpChatUniverseChatPresetEnabledModule = require(expChat.Flags.FFlagExpChatUniverseChatPresetEnabled)
local fFlagExpChatPresetChatGamepadEnabledModule = require(expChat.Flags.FFlagExpChatPresetChatGamepadEnabled)
local fFlagAEGIS2EnableGatesForExpChatModule = require(expChat.Flags.FFlagAEGIS2EnableGatesForExpChat)
local fFlagDebugForceEnableChatButtonOnModule = require(expChat.Flags.FFlagDebugForceEnableChatButtonOn)
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagExpChatUseChatConfigStore = sharedFlagsModule.FFlagExpChatUseChatConfigStore
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local fFlagExpChatNewInputBarModule = require(expChat.Flags.FFlagExpChatNewInputBar)
local expChatPresetButtonOldInputBarV2 = game:DefineFastFlag("ExpChatPresetButtonOldInputBarV2", false)
local expChatPresetFixChatHotkey = game:DefineFastFlag("ExpChatPresetFixChatHotkey", false)
local expChatFixTopPaddingColor = game:DefineFastFlag("ExpChatFixTopPaddingColor", false)
local expChatPresetChatFixesEnabled = game:DefineFastFlag("ExpChatPresetChatFixesEnabled", false)
local fFlagDebugFriendsChatModule = require(parent.FriendsChat.FFlagDebugFriendsChat)
local fFlagDebugExpChatPerfModule = require(expChat.Flags.FFlagDebugExpChatPerf)
local fStringDebugFriendsChatConversationIdModule = require(parent.FriendsChat.FStringDebugFriendsChatConversationId)
local manuallyInvokeAmpUpsell = socialUpsellModule.Utils.manuallyInvokeAmpUpsell
local isInExperienceUIVREnabled = require(parent.SharedExperimentDefinition).isInExperienceUIVREnabled
local getFFlagExpChatTriggerWindowStatusEventModule = require(expChat.Flags.getFFlagExpChatTriggerWindowStatusEvent)
local fFlagExpChatWindowStatusEventFixesModule = require(expChat.Flags.FFlagExpChatWindowStatusEventFixes)
local var1 = if isInExperienceUIVREnabled then {
	DEFAULT = UDim2.fromScale(0.95, 0.94),
	WITH_CHANNEL_BAR = UDim2.fromScale(0.95, 0.78),
	WITH_CHATINPUT_BAR = UDim2.fromScale(0.95, 0.76),
	WITH_CHANNEL_CHATINPUT_BAR = UDim2.fromScale(0.95, 0.6098)
} else nil
local getFocusNavigationStoreModule = require(expChat.Stores.GetFocusNavigationStore)
local getTransparencyStoreModule = require(expChat.Stores.GetTransparencyStore)
local getChatWindowStatusStoreModule = require(expChat.Stores.GetChatWindowStatusStore)

local function PresetChatInputRow(value)
	-- upvalues: configModule (ref), foundationModule (ref), roactModule (ref), expChatPresetChatFixesEnabled (ref), constantsModule (ref), presetChatButtonModule (ref), presetChatFlyOutModule (ref), enableChatButtonModule (ref), expChatPresetFixChatHotkey (ref), chatInputModule (ref)
	local var2 = if value.showEnableChatButton then configModule.PresetChat.ButtonWidth else 47
	local var3 = if value.showEnableChatButton then foundationModule.Enums.InputSize.Small else foundationModule.Enums.InputSize.Medium
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = 3,
		ZIndex = 2,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		Visible = value.isChatInputBarVisible or value.showEnableChatButton
	}, {
		Layout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 0)
		}),
		PresetButton = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ClipsDescendants = false,
			LayoutOrder = 1,
			BackgroundColor3 = value.backgroundColor3,
			BackgroundTransparency = value.transparencyValue:map(function(p1)
				-- upvalues: value (ref)
				return value.backgroundTransparency + p1 * (1 - value.backgroundTransparency)
			end),
			Size = UDim2.new(0, var2, 1, 0),
			Visible = if expChatPresetChatFixesEnabled then value.isChatWindowVisible or value.isChatInputBarVisible else nil
		}, {
			ButtonOrFlyOut = roactModule.createElement("CanvasGroup", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, if value.showEnableChatButton then 5 else 3, 0.5, if expChatPresetChatFixesEnabled then 0 else -1),
				AutomaticSize = Enum.AutomaticSize.XY,
				GroupTransparency = value.transparencyValue
			}, {
				Content = if value.presetLayoutMode == constantsModule.LayoutMode.Tray then roactModule.createElement(presetChatButtonModule, { isCircular = false, size = var3 }) else roactModule.createElement(presetChatFlyOutModule, {
					buttonIsCircular = false,
					addTopPadding = value.isChatWindowVisible,
					textChannel = value.targetTextChannel,
					buttonSize = var3
				})
			})
		}),
		FillArea = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, -var2, 0, 0)
		}, {
			EnableChatButton = if value.showEnableChatButton then roactModule.createElement(enableChatButtonModule, {
				chatWindowSettings = value.chatWindowSettings,
				transparencyValue = value.transparencyValue,
				addTopPadding = value.isChatWindowVisible,
				onHovered = value.onHovered,
				onUnhovered = value.onUnhovered,
				isSpatialUIEnabled = value.isSpatialUIEnabled,
				visible = value.isChatWindowVisible or value.isChatInputBarVisible,
				onActivated = value.onEnableChatActivated
			}) else nil,
			InputBar = if expChatPresetFixChatHotkey or value.isChatInputBarVisible then roactModule.createElement(chatInputModule, {
				addTopPadding = value.isChatWindowVisible,
				onSendChat = value.onSendChat,
				onSendGlobalChat = value.onSendGlobalChat,
				transparencyValue = value.transparencyValue,
				canLocalUserChat = value.canLocalUserChat,
				resetTargetChannel = value.resetTargetChannel,
				visible = value.isChatInputBarVisible,
				onAbsoluteSizeChanged = value.onAbsoluteSizeChanged,
				onAbsolutePositionChanged = value.onAbsolutePositionChanged,
				chatWindowSettings = value.chatWindowSettings,
				isChannelBarVisible = value.isChannelBarVisible,
				isSpatialUIEnabled = value.isSpatialUIEnabled
			}) else nil
		})
	})
end

local appLayout = roactModule.PureComponent:extend("AppLayout")
appLayout.defaultProps = {
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
	textTimer = timerModule.new(configModule.ChatWindowTextFadeOutTime),
	timer = timerModule.new(configModule.ChatWindowBackgroundFadeOutTime),
	canPlatformEnableChat = canPlatformEnableChatModule
}
local t = { frequency = 1.25, dampingRatio = 1 }

function appLayout.init(p1)
	-- upvalues: fFlagDebugFriendsChatModule (ref), fFlagDebugExpChatPerfModule (ref), userInputService (ref), roactModule (ref), otterModule (ref), getTransparencyStoreModule (ref), getFFlagExpChatTriggerWindowStatusEventModule (ref), getChatWindowStatusStoreModule (ref), fFlagExpChatWindowStatusEventFixesModule (ref), playersService (ref), textChatService (ref), fFlagExpChatUseChatConfigStore (ref), getChatConfigurationStoreModule (ref), fFlagExpChatTransparentFocusSupportModule (ref), fFlagExpChatDictationFadeOverrideModule (ref), t (ref), createEffect (ref), fFlagAEGIS2EnableGatesForExpChatModule (ref), getChatStatusStoreModule (ref), fFlagExpChatPresetChatEnabled (ref), getPresetChatStoreModule (ref), constantsModule (ref), fFlagExpChatPresetChatGamepadEnabledModule (ref), fFlagExpChatPresetChatSendEnabled (ref), fFlagExpChatUniverseChatPresetEnabledModule (ref), fFlagExpChatFixChannelBarInitialWidthModule (ref), getChatLayoutStoreModule (ref), reactFocusNavigationModule (ref), fFlagExpChatFocusChannelBarSupportModule (ref), getFocusNavigationStoreModule (ref), focusUtils (ref)
	p1.state = {}
	
	if fFlagDebugFriendsChatModule or fFlagDebugExpChatPerfModule then
		p1.debugInjectionThread = nil
		p1.debugKeybindConnection = userInputService.InputBegan:Connect(function(p2, p3)
			-- upvalues: p1 (ref)
			if p3 then return end
			if p2.KeyCode == Enum.KeyCode.K and p2:IsModifierKeyDown(Enum.ModifierKey.Ctrl) then
				p1:debugInjectFakeMessages()
			end
		end)
	end
	local var2, var3 = roactModule.createBinding(0)
	p1.transparencyValue = var2
	p1.updateBackgroundTransparency = var3
	p1.backgroundTransparencyMotor = otterModule.createSingleMotor(0)
	p1.backgroundTransparencyMotor:onStep(p1.updateBackgroundTransparency)
	local var4, var5 = roactModule.createBinding(0)
	p1.textTransparencyValue = var4
	p1.updateTextTransparencyValue = var5
	p1.textTransparencyMotor = otterModule.createSingleMotor(0)
	p1.textTransparencyMotor:onStep(p1.updateTextTransparencyValue)
	local var6 = getTransparencyStoreModule(false)
	p1.ChatWindowStatusStore = if getFFlagExpChatTriggerWindowStatusEventModule() then getChatWindowStatusStoreModule(false) else nil
	
	if fFlagExpChatWindowStatusEventFixesModule then
		local currentChatWindowState = p1.ChatWindowStatusStore.getCurrentChatWindowState(false)
		p1.lastTrackedChatVisible = if currentChatWindowState == "unknown" then nil else currentChatWindowState ~= "closed"
	elseif getFFlagExpChatTriggerWindowStatusEventModule() then
		p1.localPlayerLeavingConnection = playersService.PlayerRemoving:Connect(function(p2)
			-- upvalues: playersService (copy), p1 (ref), textChatService (copy)
			if p2 == playersService.LocalPlayer then
				p1.ChatWindowStatusStore.setPreviousChatWindowState(p1.ChatWindowStatusStore.getCurrentChatWindowState(false))
				local durationUpdates = p1.ChatWindowStatusStore.getDurationUpdates(false)
				textChatService:SendExpChatWindowStatusChange(durationUpdates.closedDuration, durationUpdates.openDuration, durationUpdates.backgroundIdleDuration, durationUpdates.textIdleDuration)
			end
		end)
	end
	if fFlagExpChatUseChatConfigStore then
		p1.ChatConfigurationStore = getChatConfigurationStoreModule(false)
	end
	function p1.isChatSurfaceVisibleForStatusTracking()
		-- upvalues: p1 (ref)
		return p1.props.isChatWindowVisible or p1.props.isChatInputBarVisible
	end
	
	function p1.stampOpenForStatusTrackingIfNeeded()
		-- upvalues: fFlagExpChatWindowStatusEventFixesModule (copy), p1 (ref)
		if fFlagExpChatWindowStatusEventFixesModule and p1:isChatSurfaceVisibleForStatusTracking() and p1.ChatWindowStatusStore.getCurrentChatWindowState(false) ~= "open" then
			p1.ChatWindowStatusStore.setOpenTimerStarted(os.clock())
		end
	end
	
	function p1.stampBackgroundIdleForStatusTrackingIfNeeded()
		-- upvalues: fFlagExpChatWindowStatusEventFixesModule (copy), p1 (ref)
		if fFlagExpChatWindowStatusEventFixesModule and p1:isChatSurfaceVisibleForStatusTracking() and p1.ChatWindowStatusStore.getCurrentChatWindowState(false) == "textIdle" then
			p1.ChatWindowStatusStore.setBackgroundTimerStarted(os.clock())
		end
	end
	
	function p1.resetBackgroundTransparency()
		-- upvalues: fFlagExpChatTransparentFocusSupportModule (copy), fFlagExpChatDictationFadeOverrideModule (copy), var6 (ref), p1 (ref), otterModule (copy), fFlagExpChatWindowStatusEventFixesModule (copy), getFFlagExpChatTriggerWindowStatusEventModule (copy), t (copy)
		local var7 = if fFlagExpChatTransparentFocusSupportModule or fFlagExpChatDictationFadeOverrideModule then var6.getIsFocused(false) else var6.getIsTextBoxFocused(false)
		p1.backgroundTransparencyMotor:setGoal(otterModule.instant(0))
		p1.props.timer:stop()
		p1:stampOpenForStatusTrackingIfNeeded()
		
		if var7 == false and p1.props.isSpatialUIEnabled == false then
			if fFlagExpChatWindowStatusEventFixesModule and not p1:isChatSurfaceVisibleForStatusTracking() then return end
			p1.props.timer:start():andThen(function()
				-- upvalues: fFlagExpChatWindowStatusEventFixesModule (copy), p1 (copy), getFFlagExpChatTriggerWindowStatusEventModule (copy), otterModule (copy), t (copy)
				if fFlagExpChatWindowStatusEventFixesModule then
					if p1:isChatSurfaceVisibleForStatusTracking() then
						p1.ChatWindowStatusStore.setBackgroundTimerStarted(os.clock())
					end
				elseif getFFlagExpChatTriggerWindowStatusEventModule() then
					p1.ChatWindowStatusStore.setBackgroundTimerStarted(os.clock())
				end
				p1.backgroundTransparencyMotor:setGoal(otterModule.spring(1, t))
			end)
		end
	end
	
	function p1.resetTextTransparency()
		-- upvalues: fFlagExpChatTransparentFocusSupportModule (copy), fFlagExpChatDictationFadeOverrideModule (copy), var6 (ref), p1 (ref), otterModule (copy), fFlagExpChatWindowStatusEventFixesModule (copy), getFFlagExpChatTriggerWindowStatusEventModule (copy), t (copy)
		local var7 = if fFlagExpChatTransparentFocusSupportModule or fFlagExpChatDictationFadeOverrideModule then var6.getIsFocused(false) else var6.getIsTextBoxFocused(false)
		p1.textTransparencyMotor:setGoal(otterModule.instant(0))
		p1.props.textTimer:stop()
		p1:stampBackgroundIdleForStatusTrackingIfNeeded()
		
		if var7 == false then
			if fFlagExpChatWindowStatusEventFixesModule and not p1:isChatSurfaceVisibleForStatusTracking() then return end
			p1.props.textTimer:start():andThen(function()
				-- upvalues: fFlagExpChatWindowStatusEventFixesModule (copy), p1 (copy), getFFlagExpChatTriggerWindowStatusEventModule (copy), otterModule (copy), t (copy)
				if fFlagExpChatWindowStatusEventFixesModule then
					if p1:isChatSurfaceVisibleForStatusTracking() then
						p1.ChatWindowStatusStore.setTextTimerStarted(os.clock())
					end
				elseif getFFlagExpChatTriggerWindowStatusEventModule() then
					p1.ChatWindowStatusStore.setTextTimerStarted(os.clock())
				end
				p1.textTransparencyMotor:setGoal(otterModule.spring(1, t))
			end)
		end
	end
	
	p1.disposeBackgroundEffect = createEffect(function(p2)
		-- upvalues: var6 (ref), p1 (ref)
		local _ = var6.getLastActivity(p2)
		p1.resetBackgroundTransparency()
		p1.resetTextTransparency()
	end)
	p1.disposeTextEffect = createEffect(function(p2)
		-- upvalues: var6 (ref), p1 (ref)
		local _ = var6.getLastMessageActivity(p2)
		p1.resetTextTransparency()
	end)
	
	if fFlagAEGIS2EnableGatesForExpChatModule then
		p1.disposeChatStatusEffect = createEffect(function(p2)
			-- upvalues: getChatStatusStoreModule (copy), p1 (ref)
			p1:setState({
				chatStatus = getChatStatusStoreModule(p2).getChatStatus(p2)
			})
		end)
	end
	if fFlagExpChatPresetChatEnabled then
		p1.disposePresetFlyOutAvailableEffect = createEffect(function(p2)
			-- upvalues: getPresetChatStoreModule (copy), constantsModule (copy), fFlagExpChatPresetChatGamepadEnabledModule (copy), userInputService (copy), p1 (ref), fFlagExpChatPresetChatSendEnabled (copy), fFlagExpChatUniverseChatPresetEnabledModule (copy)
			local var7 = getPresetChatStoreModule(p2)
			local isEnabled = var7.getIsEnabled(p2)
			local accessLevel = var7.getAccessLevel(p2)
			local layoutModeOverride = var7.getLayoutModeOverride(p2)
			local _ = nil
			p1:setState({
				isPresetFlyOutAvailable = isEnabled and (fFlagExpChatPresetChatSendEnabled and (accessLevel == constantsModule.AccessLevel.Enabled and (if p1.props.targetTextChannel == nil then fFlagExpChatUniverseChatPresetEnabledModule else true))),
				presetLayoutMode = if layoutModeOverride == constantsModule.LayoutMode.Tray or layoutModeOverride == constantsModule.LayoutMode.FlyOut then layoutModeOverride elseif fFlagExpChatPresetChatGamepadEnabledModule and userInputService.PreferredInput == Enum.PreferredInput.Gamepad then constantsModule.LayoutMode.FlyOut elseif userInputService.TouchEnabled and not userInputService.MouseEnabled then constantsModule.LayoutMode.Tray else constantsModule.LayoutMode.FlyOut
			})
		end)
	end
	function p1.onAbsolutePositionChanged(p2, p3)
		p3.AbsolutePositionWrite = p2.AbsolutePosition
	end
	
	function p1.onAbsoluteSizeChanged(p2, p3)
		p3.AbsoluteSizeWrite = p2.AbsoluteSize
	end
	
	p1.onChatFrameLayoutChanged = if fFlagExpChatPresetChatEnabled or fFlagExpChatFixChannelBarInitialWidthModule then function(p2)
		-- upvalues: fFlagExpChatPresetChatEnabled (copy), getPresetChatStoreModule (copy), fFlagExpChatFixChannelBarInitialWidthModule (copy), getChatLayoutStoreModule (copy)
		if fFlagExpChatPresetChatEnabled then
			getPresetChatStoreModule(false).setChatWindowBottomY(p2.AbsolutePosition.Y + p2.AbsoluteSize.Y)
		end
		if fFlagExpChatFixChannelBarInitialWidthModule then
			getChatLayoutStoreModule(false).setChatWindowWidth(p2.AbsoluteSize.X)
		end
	end else nil
	p1.focusNavigationService = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
	p1.topBorderRef = if fFlagExpChatFocusChannelBarSupportModule then roactModule.createRef() else nil
	
	function p1.onContainerSelectionChanged(p2, _, _, p3)
		-- upvalues: getFocusNavigationStoreModule (copy), fFlagExpChatTransparentFocusSupportModule (copy), var6 (ref), fFlagExpChatFocusChannelBarSupportModule (copy), p1 (ref), focusUtils (copy)
		if p3 == nil or not p3:IsDescendantOf(p2) then
			getFocusNavigationStoreModule(false).unfocusChatInputBar()
			
			if fFlagExpChatTransparentFocusSupportModule then
				var6.clearWindowFocusInput()
				
				return
			end
		elseif fFlagExpChatTransparentFocusSupportModule then
			var6.setWindowFocusInput()
		end
		if fFlagExpChatFocusChannelBarSupportModule and p3 == p1.topBorderRef.current then
			focusUtils.FocusOnChrome(function()
				-- upvalues: getFocusNavigationStoreModule (copy)
				getFocusNavigationStoreModule(false).unfocusChatInputBar()
			end, "chat")
		end
	end
	
	if not fFlagExpChatFocusChannelBarSupportModule then
		function p1.onBorderSelectionChanged(_, p2, _, _)
			-- upvalues: focusUtils (copy), getFocusNavigationStoreModule (copy)
			if p2 then
				focusUtils.FocusOnChrome(function()
					-- upvalues: getFocusNavigationStoreModule (copy)
					getFocusNavigationStoreModule(false).unfocusChatInputBar()
				end, "chat")
			end
		end
	end
end

function appLayout.syncChatWindowVisibilityForStatusTracking(p1)
	-- upvalues: fFlagExpChatWindowStatusEventFixesModule (ref)
	if not fFlagExpChatWindowStatusEventFixesModule then return end
	local var2 = p1:isChatSurfaceVisibleForStatusTracking()
	
	if p1.lastTrackedChatVisible == var2 then return end
	p1.lastTrackedChatVisible = var2
	
	if var2 then
		p1.ChatWindowStatusStore.setOpenTimerStarted(os.clock())
		
		return
	end
	p1.ChatWindowStatusStore.setClosedTimerStarted(os.clock())
	p1.props.timer:stop()
	p1.props.textTimer:stop()
end

function appLayout.didMount(p1)
	-- upvalues: fFlagExpChatWindowStatusEventFixesModule (ref), otterModule (ref), t (ref), getFFlagExpChatTriggerWindowStatusEventModule (ref)
	if fFlagExpChatWindowStatusEventFixesModule then
		p1:syncChatWindowVisibilityForStatusTracking()
		
		if p1:isChatSurfaceVisibleForStatusTracking() then
			p1.props.timer:start():andThen(function()
				-- upvalues: p1 (ref), otterModule (copy), t (copy)
				if p1:isChatSurfaceVisibleForStatusTracking() then
					p1.ChatWindowStatusStore.setBackgroundTimerStarted(os.clock())
				end
				p1.backgroundTransparencyMotor:setGoal(otterModule.spring(1, t))
			end)
			p1.props.textTimer:start():andThen(function()
				-- upvalues: p1 (ref), otterModule (copy), t (copy)
				if p1:isChatSurfaceVisibleForStatusTracking() then
					p1.ChatWindowStatusStore.setTextTimerStarted(os.clock())
				end
				p1.textTransparencyMotor:setGoal(otterModule.spring(1, t))
			end)
			
			return
		end
	else
		p1.props.timer:start():andThen(function()
			-- upvalues: getFFlagExpChatTriggerWindowStatusEventModule (copy), p1 (ref), otterModule (copy), t (copy)
			if getFFlagExpChatTriggerWindowStatusEventModule() then
				p1.ChatWindowStatusStore.setBackgroundTimerStarted(os.clock())
			end
			p1.backgroundTransparencyMotor:setGoal(otterModule.spring(1, t))
		end)
		p1.props.textTimer:start():andThen(function()
			-- upvalues: getFFlagExpChatTriggerWindowStatusEventModule (copy), p1 (ref), otterModule (copy), t (copy)
			if getFFlagExpChatTriggerWindowStatusEventModule() then
				p1.ChatWindowStatusStore.setTextTimerStarted(os.clock())
			end
			p1.textTransparencyMotor:setGoal(otterModule.spring(1, t))
		end)
	end
end

function appLayout.didUpdate(p1, p2)
	-- upvalues: fFlagExpChatWindowStatusEventFixesModule (ref)
	if not fFlagExpChatWindowStatusEventFixesModule then return end
	local var2 = p1:isChatSurfaceVisibleForStatusTracking()
	
	if (p2.isChatWindowVisible or p2.isChatInputBarVisible) == var2 then return end
	p1:syncChatWindowVisibilityForStatusTracking()
	
	if var2 then
		p1.resetBackgroundTransparency()
		p1.resetTextTransparency()
	end
end

function appLayout.render(p1)
	-- upvalues: getFFlagExpChatTriggerWindowStatusEventModule (ref), fFlagExpChatWindowStatusEventFixesModule (ref), fFlagExpChatUseChatConfigStore (ref), clientSettingsUtilityModule (ref), fFlagAEGIS2EnableGatesForExpChatModule (ref), showChatEnabledUIModule (ref), isInExperienceUIVREnabled (ref), getFFlagExpChatConditionallyMountAppLayoutModule (ref), getFFlagExpChatEnableChannelTabsUIModule (ref), var1 (ref), configModule (ref), fFlagDebugForceEnableChatButtonOnModule (ref), isChatRegionLockedModule (ref), expChatPresetButtonOldInputBarV2 (ref), fFlagExpChatPresetChatEnabled (ref), roactModule (ref), fFlagExpChatFixChannelBarInitialWidthModule (ref), fFlagExpChatFocusChannelBarSupportModule (ref), expChatFixTopPaddingColor (ref), fFlagExpChatEnableV2ChatWindowModule (ref), fFlagExpChatKeepV2PoolMountedModule (ref), chatWindowModule (ref), fFlagExpChatUseMessagesStore (ref), fFlagExpChatPresetChatSendEnabled (ref), presetChatGateModule (ref), constantsModule (ref), presetChatTrayModule (ref), fFlagExpChatNewInputBarModule (ref), PresetChatInputRow (ref), manuallyInvokeAmpUpsell (ref), chatInputModule (ref), friendsChatDependencyBridgeModule (ref), friendsChatMainModule (ref), enableChatButtonModule (ref), expChatPresetChatFixesEnabled (ref), presetChatButtonModule (ref), presetChatFlyOutModule (ref), expChatPresetFixChatHotkey (ref), channelBarModule (ref), spatialUIModule (ref), fFlagExpChatEnableFriendsTab (ref), chatPlatformProviderModule (ref), reactFocusNavigationModule (ref), selectionCursorProvider (ref), cursorProvider (ref), withSelectionCursorProvider (ref), cursorKind (ref)
	if getFFlagExpChatTriggerWindowStatusEventModule() and not fFlagExpChatWindowStatusEventFixesModule then
		if p1.props.isChatWindowVisible or p1.props.isChatInputBarVisible then
			p1.ChatWindowStatusStore.setOpenTimerStarted(os.clock())
		else
			p1.ChatWindowStatusStore.setClosedTimerStarted(os.clock())
		end
	end
	local isChannelBarVisible
	local var2 = if fFlagExpChatUseChatConfigStore and p1.ChatConfigurationStore then p1.ChatConfigurationStore.getChatWindowSettings(false) else p1.props.chatWindowSettings
	local backgroundTransparency = clientSettingsUtilityModule.getBackgroundTransparency(var2, p1.props.clientSettings)
	local backgroundColor = clientSettingsUtilityModule.getBackgroundColor(var2, p1.props.clientSettings)
	local uDim2 = nil
	local renderingFriends = p1.props.renderingFriends
	local isExperienceChatRendered = p1.props.isExperienceChatRendered
	local chatStatus = nil
	local isChatInputBarVisible = p1.props.isChatInputBarVisible
	
	if fFlagAEGIS2EnableGatesForExpChatModule then
		chatStatus = p1.state.chatStatus
		isChatInputBarVisible = isChatInputBarVisible and showChatEnabledUIModule(chatStatus)
	end
	if isInExperienceUIVREnabled then
		if p1.props.isSpatialUIEnabled then
			isChannelBarVisible = getFFlagExpChatConditionallyMountAppLayoutModule() and (getFFlagExpChatEnableChannelTabsUIModule() and p1.props.isChannelBarVisible)
			uDim2 = if isChannelBarVisible and isChatInputBarVisible then var1.WITH_CHANNEL_CHATINPUT_BAR elseif isChannelBarVisible and not isChatInputBarVisible then var1.WITH_CHANNEL_BAR elseif isChannelBarVisible or not isChatInputBarVisible then var1.DEFAULT else var1.WITH_CHATINPUT_BAR
		else
			uDim2 = UDim2.fromScale(configModule.ChatWindowSize.X.Scale * var2.WidthScale, configModule.ChatWindowSize.Y.Scale * var2.HeightScale)
		end
	end
	isChannelBarVisible = fFlagDebugForceEnableChatButtonOnModule or fFlagAEGIS2EnableGatesForExpChatModule and (not isChatRegionLockedModule() and (p1.props.canPlatformEnableChat() and chatStatus == "AgeVerificationRequired"))
	local isPresetFlyOutAvailable = expChatPresetButtonOldInputBarV2 and (fFlagExpChatPresetChatEnabled and p1.state.isPresetFlyOutAvailable)
	local var3 = fFlagExpChatPresetChatEnabled and (p1.state.isPresetFlyOutAvailable and (not isChannelBarVisible and not isChatInputBarVisible))
	
	local var4 = function(p2)
		-- upvalues: roactModule (copy), p1 (ref), isInExperienceUIVREnabled (copy), uDim2 (write), configModule (copy), var2 (ref), fFlagExpChatPresetChatEnabled (copy), fFlagExpChatFixChannelBarInitialWidthModule (copy), backgroundColor (ref), backgroundTransparency (ref), getFFlagExpChatEnableChannelTabsUIModule (copy), fFlagExpChatFocusChannelBarSupportModule (copy), renderingFriends (ref), expChatFixTopPaddingColor (copy), isExperienceChatRendered (ref), getFFlagExpChatConditionallyMountAppLayoutModule (copy), fFlagExpChatEnableV2ChatWindowModule (copy), fFlagExpChatKeepV2PoolMountedModule (copy), chatWindowModule (copy), fFlagExpChatUseMessagesStore (copy), fFlagExpChatPresetChatSendEnabled (copy), presetChatGateModule (copy), constantsModule (copy), presetChatTrayModule (copy), fFlagExpChatNewInputBarModule (copy), isPresetFlyOutAvailable (ref), PresetChatInputRow (copy), isChatInputBarVisible (write), isChannelBarVisible (ref), manuallyInvokeAmpUpsell (copy), chatInputModule (copy), friendsChatDependencyBridgeModule (copy), friendsChatMainModule (copy), enableChatButtonModule (copy), var3 (ref), expChatPresetChatFixesEnabled (copy), presetChatButtonModule (copy), presetChatFlyOutModule (copy), expChatPresetFixChatHotkey (copy), channelBarModule (copy), spatialUIModule (copy), fFlagExpChatEnableFriendsTab (copy), chatPlatformProviderModule (copy)
		local isChatWindowVisible
		local createElement = roactModule.createElement
		local var5 = "Frame"
		local t = {
			AnchorPoint = p1.props.chatLayoutAlignment.AnchorPoint,
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1,
			Position = p1.props.chatLayoutAlignment.Position,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionGroup = true,
			Size = if isInExperienceUIVREnabled then uDim2 elseif p1.props.isSpatialUIEnabled then UDim2.fromScale(0.95, 0.68) else UDim2.fromScale(configModule.ChatWindowSize.X.Scale * var2.WidthScale, configModule.ChatWindowSize.Y.Scale * var2.HeightScale),
			[roactModule.Change.AbsoluteSize] = if fFlagExpChatPresetChatEnabled or fFlagExpChatFixChannelBarInitialWidthModule then p1.onChatFrameLayoutChanged else nil,
			[roactModule.Change.AbsolutePosition] = if fFlagExpChatPresetChatEnabled then p1.onChatFrameLayoutChanged else nil,
			[roactModule.Event.SelectionChanged] = p1.onContainerSelectionChanged
		}
		local t_1 = {
			uiSizeConstraint = roactModule.createElement("UISizeConstraint", {
				MaxSize = if p1.props.isSpatialUIEnabled then Vector2.new(1e999, 1e999) else Vector2.new(configModule.ChatWindowMaxWidth, 1e999)
			}),
			layout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = p1.props.chatLayoutAlignment.UIListLayoutVerticalAlignment
			})
		}
		local createElement_1 = roactModule.createElement
		local var6 = "ImageLabel"
		local t_2 = {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/TopRoundedRect8px.png",
			ImageColor3 = backgroundColor,
			ImageTransparency = p1.transparencyValue:map(function(p3)
				-- upvalues: backgroundTransparency (copy)
				return backgroundTransparency + p3 * (1 - backgroundTransparency)
			end),
			LayoutOrder = 1,
			SelectionImageObject = p2,
			Selectable = true,
			ScaleType = Enum.ScaleType.Slice,
			Size = UDim2.new(1, 0, 0, 8),
			SliceCenter = Rect.new(8, 8, 24, 32)
		}
		
		if not getFFlagExpChatEnableChannelTabsUIModule() then
			isChatWindowVisible = p1.props.isChatWindowVisible or p1.props.isChatInputBarVisible
		elseif not p1.props.isChatWindowVisible then
			isChatWindowVisible = p1.props.isChatInputBarVisible and not p1.props.isChannelBarVisible
		end
		local var7
		t_2.Visible = isChatWindowVisible
		t_2[roactModule.Event.MouseEnter] = p1.props.onHovered
		t_2[roactModule.Event.MouseLeave] = p1.props.onUnhovered
		t_2[roactModule.Event.SelectionChanged] = if fFlagExpChatFocusChannelBarSupportModule then nil else p1.onBorderSelectionChanged
		t_2[roactModule.Ref] = if fFlagExpChatFocusChannelBarSupportModule then p1.topBorderRef else nil
		t_1.topBorder = createElement_1(var6, t_2, {
			uiSizeConstraint = roactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(configModule.ChatWindowMaxWidth, 1e999)
			})
		})
		t_1.topPadding = roactModule.createElement("Frame", {
			LayoutOrder = 1,
			Size = if renderingFriends then UDim2.fromScale(1, 0) else UDim2.new(1, 0, 0, 8),
			Visible = if getFFlagExpChatEnableChannelTabsUIModule() then p1.props.isChannelBarVisible else false,
			BackgroundTransparency = p1.transparencyValue:map(function(p3)
				-- upvalues: backgroundTransparency (copy)
				return backgroundTransparency + p3 * (1 - backgroundTransparency)
			end),
			BackgroundColor3 = if expChatFixTopPaddingColor then backgroundColor else var2.BackgroundColor3,
			BorderSizePixel = 0,
			[roactModule.Event.MouseEnter] = p1.props.onHovered,
			[roactModule.Event.MouseLeave] = p1.props.onUnhovered,
			ZIndex = 0
		})
		
		if isExperienceChatRendered then
			var7 = if getFFlagExpChatConditionallyMountAppLayoutModule() and (not fFlagExpChatEnableV2ChatWindowModule or not fFlagExpChatKeepV2PoolMountedModule) then p1.props.isChatWindowVisible else true
			var7 = var7 and roactModule.createElement(chatWindowModule, {
				LayoutOrder = 2,
				size = UDim2.fromScale(1, 1),
				transparencyValue = p1.transparencyValue,
				textTransparency = p1.textTransparencyValue,
				onHovered = p1.props.onHovered,
				onUnhovered = p1.props.onUnhovered,
				mutedUserIds = p1.props.mutedUserIds,
				canLocalUserChat = if fFlagExpChatUseMessagesStore then nil else p1.props.canLocalUserChat,
				activateWhisperMode = p1.props.activateWhisperMode,
				resetTargetChannel = p1.props.resetTargetChannel,
				visible = p1.props.isChatWindowVisible,
				onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
				onAbsolutePositionChanged = p1.onAbsolutePositionChanged,
				chatWindowSettings = var2,
				showTranslationButton = p1.props.showTranslationButton,
				isChannelBarVisible = if getFFlagExpChatEnableChannelTabsUIModule() then p1.props.isChannelBarVisible else false,
				isSpatialUIEnabled = p1.props.isSpatialUIEnabled
			})
		else
			var7 = nil
		end
		local var8
		t_1.chatWindow = var7
		t_1.presetChatTray = if isExperienceChatRendered and fFlagExpChatPresetChatEnabled and fFlagExpChatPresetChatSendEnabled then roactModule.createElement(presetChatGateModule, {
			layoutMode = constantsModule.LayoutMode.Tray,
			targetTextChannel = p1.props.targetTextChannel
		}, {
			Tray = roactModule.createElement(presetChatTrayModule, { textChannel = p1.props.targetTextChannel })
		}) else nil
		t_1.chatInputBar = if isExperienceChatRendered and not fFlagExpChatNewInputBarModule then if isPresetFlyOutAvailable then roactModule.createElement(PresetChatInputRow, {
			transparencyValue = p1.transparencyValue,
			backgroundColor3 = backgroundColor,
			backgroundTransparency = backgroundTransparency,
			isChatWindowVisible = p1.props.isChatWindowVisible,
			isChatInputBarVisible = isChatInputBarVisible,
			targetTextChannel = p1.props.targetTextChannel,
			onSendChat = p1.props.onSendChat,
			onSendGlobalChat = p1.props.onSendGlobalChat,
			canLocalUserChat = if fFlagExpChatUseMessagesStore then nil else p1.props.canLocalUserChat,
			resetTargetChannel = p1.props.resetTargetChannel,
			onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
			onAbsolutePositionChanged = p1.onAbsolutePositionChanged,
			chatWindowSettings = var2,
			isChannelBarVisible = if getFFlagExpChatEnableChannelTabsUIModule() then p1.props.isChannelBarVisible else false,
			isSpatialUIEnabled = p1.props.isSpatialUIEnabled,
			showEnableChatButton = isChannelBarVisible,
			onHovered = p1.props.onHovered,
			onUnhovered = p1.props.onUnhovered,
			onEnableChatActivated = function()
				-- upvalues: manuallyInvokeAmpUpsell (copy)
				manuallyInvokeAmpUpsell("InExperienceTextChatUpsell")
			end,
			presetLayoutMode = p1.state.presetLayoutMode
		}) else roactModule.createElement(chatInputModule, {
			LayoutOrder = 3,
			addTopPadding = p1.props.isChatWindowVisible,
			onSendChat = p1.props.onSendChat,
			onSendGlobalChat = p1.props.onSendGlobalChat,
			transparencyValue = p1.transparencyValue,
			canLocalUserChat = if fFlagExpChatUseMessagesStore then nil else p1.props.canLocalUserChat,
			resetTargetChannel = p1.props.resetTargetChannel,
			visible = isChatInputBarVisible,
			onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
			onAbsolutePositionChanged = p1.onAbsolutePositionChanged,
			chatWindowSettings = var2,
			isChannelBarVisible = if getFFlagExpChatEnableChannelTabsUIModule() then p1.props.isChannelBarVisible else false,
			isSpatialUIEnabled = p1.props.isSpatialUIEnabled
		}) else nil
		t_1.friendsChat = if renderingFriends and p1.props.isChatWindowVisible then roactModule.createElement(friendsChatDependencyBridgeModule, {}, {
			friendsChatMain = roactModule.createElement(friendsChatMainModule, {
				parentLayoutOrder = 2,
				chatWindowSettings = var2,
				transparencyValue = p1.transparencyValue,
				textTransparency = p1.textTransparencyValue,
				isSpatialUIEnabled = p1.props.isSpatialUIEnabled,
				isChannelBarVisible = p1.props.isChannelBarVisible,
				onHovered = p1.props.onHovered,
				onUnhovered = p1.props.onUnhovered,
				onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
				onAbsolutePositionChanged = p1.onAbsolutePositionChanged
			})
		}) else nil
		t_1.enableChatButton = if isExperienceChatRendered and not fFlagExpChatNewInputBarModule and (not isPresetFlyOutAvailable and isChannelBarVisible) then roactModule.createElement(enableChatButtonModule, {
			LayoutOrder = 3,
			chatWindowSettings = var2,
			transparencyValue = p1.transparencyValue,
			addTopPadding = p1.props.isChatWindowVisible,
			onHovered = p1.props.onHovered,
			onUnhovered = p1.props.onUnhovered,
			isSpatialUIEnabled = p1.props.isSpatialUIEnabled,
			visible = p1.props.isChatWindowVisible or p1.props.isChatInputBarVisible,
			onActivated = function()
				-- upvalues: manuallyInvokeAmpUpsell (copy)
				manuallyInvokeAmpUpsell("InExperienceTextChatUpsell")
			end
		}) else nil
		
		if isExperienceChatRendered and fFlagExpChatNewInputBarModule then
			local var9
			var8 = roactModule.createElement
			local var10 = "Frame"
			local t_3 = {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = backgroundColor,
				BackgroundTransparency = p1.transparencyValue:map(function(p3)
					-- upvalues: backgroundTransparency (copy)
					return backgroundTransparency + p3 * (1 - backgroundTransparency)
				end),
				BorderSizePixel = 0,
				LayoutOrder = 3,
				Size = UDim2.fromScale(1, 0),
				Visible = if fFlagExpChatPresetChatEnabled then p1.props.isChatWindowVisible or p1.props.isChatInputBarVisible else true,
				ZIndex = 2,
				[roactModule.Event.MouseEnter] = p1.props.onHovered,
				[roactModule.Event.MouseLeave] = p1.props.onUnhovered
			}
			local t_4 = {
				UIListLayout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, 8),
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				UIPadding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 8),
					PaddingRight = UDim.new(0, 8)
				}),
				presetFlyOutWrapper = if fFlagExpChatPresetChatEnabled and p1.state.isPresetFlyOutAvailable then roactModule.createElement("CanvasGroup", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					GroupTransparency = p1.transparencyValue,
					Size = if var3 then UDim2.fromScale(1, 0) else UDim2.fromOffset(configModule.PresetChat.ButtonWidth, 0),
					Visible = if expChatPresetChatFixesEnabled then p1.props.isChatWindowVisible or p1.props.isChatInputBarVisible else nil
				}, {
					PresetEntry = if p1.state.presetLayoutMode == constantsModule.LayoutMode.Tray then roactModule.createElement(presetChatButtonModule, {
						baseTransparency = 0,
						targetTextChannel = p1.props.targetTextChannel
					}) else roactModule.createElement(presetChatFlyOutModule, {
						addTopPadding = p1.props.isChatWindowVisible,
						fullWidthButton = var3,
						textChannel = p1.props.targetTextChannel
					})
				}) else nil
			}
			
			if expChatPresetFixChatHotkey or not var3 then
				var9 = roactModule.createElement
				var9 = var9("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = if expChatPresetFixChatHotkey and var3 then Enum.AutomaticSize.None else Enum.AutomaticSize.Y,
					Size = if expChatPresetFixChatHotkey and var3 then UDim2.new(0, 0, 0, 0) else UDim2.new(1, if p1.state.isPresetFlyOutAvailable then -(configModule.PresetChat.ButtonWidth + 8) else 0, 0, 0),
					Visible = if expChatPresetFixChatHotkey then not var3 else nil
				}, {
					enableChatButton = if isChannelBarVisible then roactModule.createElement(enableChatButtonModule, {
						chatWindowSettings = var2,
						transparencyValue = p1.transparencyValue,
						addTopPadding = p1.props.isChatWindowVisible,
						onHovered = p1.props.onHovered,
						onUnhovered = p1.props.onUnhovered,
						isSpatialUIEnabled = p1.props.isSpatialUIEnabled,
						visible = p1.props.isChatWindowVisible or p1.props.isChatInputBarVisible,
						onActivated = function()
							-- upvalues: manuallyInvokeAmpUpsell (copy)
							manuallyInvokeAmpUpsell("InExperienceTextChatUpsell")
						end
					}) else nil,
					chatInputBar = if expChatPresetFixChatHotkey or isChatInputBarVisible then roactModule.createElement(chatInputModule, {
						suppressOuterBackground = true,
						addTopPadding = p1.props.isChatWindowVisible,
						onSendChat = p1.props.onSendChat,
						onSendGlobalChat = p1.props.onSendGlobalChat,
						transparencyValue = p1.transparencyValue,
						canLocalUserChat = if fFlagExpChatUseMessagesStore then nil else p1.props.canLocalUserChat,
						resetTargetChannel = p1.props.resetTargetChannel,
						visible = if expChatPresetFixChatHotkey then isChatInputBarVisible else nil,
						onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
						onAbsolutePositionChanged = p1.onAbsolutePositionChanged,
						chatWindowSettings = var2,
						isChannelBarVisible = if getFFlagExpChatEnableChannelTabsUIModule() then p1.props.isChannelBarVisible else false,
						isSpatialUIEnabled = p1.props.isSpatialUIEnabled,
						onHovered = p1.props.onHovered,
						onUnhovered = p1.props.onUnhovered
					}) else nil
				})
			else
				var9 = nil
			end
			t_4.fillArea = var9
			var8 = var8(var10, t_3, t_4)
		else
			var8 = nil
		end
		t_1.chatInputRow = var8
		t_1.channelBar = (if getFFlagExpChatConditionallyMountAppLayoutModule() then p1.props.isChannelBarVisible else true) and roactModule.createElement(channelBarModule, {
			LayoutOrder = if renderingFriends then 100 else 4,
			size = UDim2.fromScale(1, 1),
			transparencyValue = p1.transparencyValue,
			onHovered = p1.props.onHovered,
			onUnhovered = p1.props.onUnhovered,
			chatWindowSettings = var2,
			visible = if getFFlagExpChatEnableChannelTabsUIModule() then p1.props.isChannelBarVisible else false,
			topBorderRef = if fFlagExpChatFocusChannelBarSupportModule then p1.topBorderRef else nil
		})
		t_1.bottomBorder = if renderingFriends then nil else roactModule.createElement("ImageLabel", {
			Name = "bottomBorder",
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/BottomRoundedRect8px.png",
			ImageColor3 = backgroundColor,
			ImageTransparency = p1.transparencyValue:map(function(p3)
				-- upvalues: backgroundTransparency (copy)
				return backgroundTransparency + p3 * (1 - backgroundTransparency)
			end),
			LayoutOrder = 5,
			ScaleType = Enum.ScaleType.Slice,
			Size = UDim2.new(1, 0, 0, 8),
			SliceCenter = Rect.new(8, 0, 24, 16),
			Visible = p1.props.isChatWindowVisible or p1.props.isChatInputBarVisible,
			[roactModule.Event.MouseEnter] = p1.props.onHovered,
			[roactModule.Event.MouseLeave] = p1.props.onUnhovered
		}, {
			uiSizeConstraint = roactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(configModule.ChatWindowMaxWidth, 1e999)
			})
		})
		createElement = createElement(var5, t, t_1)
		
		return roactModule.createElement(spatialUIModule.Provider, {
			value = { isSpatialUIEnabled = p1.props.isSpatialUIEnabled }
		}, {
			appLayout = if fFlagExpChatEnableFriendsTab then roactModule.createElement(chatPlatformProviderModule, {}, { appLayout = createElement }) else createElement
		})
	end
	
	return roactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = p1.focusNavigationService }, {
		CursorProvider = roactModule.createElement(selectionCursorProvider, {}, {
			NewCursorProvider = roactModule.createElement(cursorProvider, {}, {
				withSelectionCursorProvider(function(p2)
					-- upvalues: var4 (ref), cursorKind (copy)
					return var4(p2(cursorKind.Invisible))
				end)
			})
		})
	})
end

function appLayout.debugInjectFakeMessages(p1)
	-- upvalues: getFriendsChatRealtimeStoreModule (ref), fStringDebugFriendsChatConversationIdModule (ref), getConversationMessageStoreModule (ref), getConversationMessageListStoreModule (ref), fFlagExpChatUseMessagesStore (ref), getMessagesStoreModule (ref)
	if p1.debugInjectionThread ~= nil then
		task.cancel(p1.debugInjectionThread)
		p1.debugInjectionThread = nil
	end
	local renderingFriends = p1.props.renderingFriends
	local var2 = getFriendsChatRealtimeStoreModule(false).getActiveConversationId(false) or fStringDebugFriendsChatConversationIdModule
	
	if renderingFriends and (var2 == nil or var2 == "") then
		return
	end
	p1.debugInjectionThread = task.spawn(function()
		-- upvalues: renderingFriends (ref), getConversationMessageStoreModule (copy), getConversationMessageListStoreModule (copy), fFlagExpChatUseMessagesStore (copy), getMessagesStoreModule (copy), var2 (ref), p1 (ref)
		local var3 = if renderingFriends then getConversationMessageStoreModule(false) else nil
		local var4 = if renderingFriends then getConversationMessageListStoreModule(false) else nil
		local var5 = if renderingFriends or not fFlagExpChatUseMessagesStore then nil else getMessagesStoreModule(false)
		
		for i = 1, 50 do
			if renderingFriends then
				local var6 = `debug-fake-{tostring(os.clock())}-{i}`
				var3.upsertMessages({
					[var6] = {
						type = "user",
						id = var6,
						content = `Fake friends-chat debug message #{i}`,
						created_at = DateTime.now():ToIsoDate(),
						sender_user_id = (i - 1) % 5 + 1
					}
				})
				var4.prependMessages(var2, { var6 })
			elseif var5 ~= nil then
				var5.addSystemMessage(`Fake exp-chat debug message #{i}`, "RBXGeneral", nil, nil, false)
			end
			if i < 50 then
				task.wait(0.1)
			end
		end
		p1.debugInjectionThread = nil
	end)
end

function appLayout.willUnmount(p2)
	-- upvalues: fFlagExpChatWindowStatusEventFixesModule (ref), getFFlagExpChatTriggerWindowStatusEventModule (ref), fFlagExpChatUseChatConfigStore (ref), fFlagAEGIS2EnableGatesForExpChatModule (ref), fFlagExpChatPresetChatEnabled (ref)
	if fFlagExpChatWindowStatusEventFixesModule then
		p2.props.timer:stop()
		p2.props.textTimer:stop()
		
		if p2.ChatWindowStatusStore.getCurrentChatWindowState(false) ~= "closed" then
			p2.ChatWindowStatusStore.setClosedTimerStarted(os.clock())
		end
	end
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
	
	if getFFlagExpChatTriggerWindowStatusEventModule() and p2.localPlayerLeavingConnection then
		p2.localPlayerLeavingConnection:Disconnect()
	end
	if fFlagExpChatUseChatConfigStore and p2.disposeChatWindowSettingsEffect then
		p2.disposeChatWindowSettingsEffect()
	end
	if fFlagExpChatUseChatConfigStore and p2.disposeChatInputBarSettingsEffect then
		p2.disposeChatInputBarSettingsEffect()
	end
	if fFlagAEGIS2EnableGatesForExpChatModule and p2.disposeChatStatusEffect then
		p2.disposeChatStatusEffect()
	end
	if fFlagExpChatPresetChatEnabled and p2.disposePresetFlyOutAvailableEffect then
		p2.disposePresetFlyOutAvailableEffect()
	end
end

return appLayout