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
local friendsChatModule = require(expChat.FriendsChat)
local getFriendsChatRealtimeStoreModule = require(expChat.FriendsChat.Stores.GetFriendsChatRealtimeStore)
local presetChatTrayModule = require(expChat.PresetChat.PresetChatTray)
local presetChatButtonModule = require(expChat.PresetChat.PresetChatButton)
local presetChatFlyOutModule = require(expChat.PresetChat.PresetChatFlyOut)
local presetChatGateModule = require(expChat.PresetChat.PresetChatGate)
local constantsModule = require(expChat.PresetChat.Constants)
local getChatConfigurationStoreModule = require(expChat.Stores.GetChatConfigurationStore)
local getChatStatusStoreModule = require(expChat.Stores.GetChatStatusStore)
local getPresetChatStoreModule = require(expChat.Stores.GetPresetChatStore)
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
local fFlagExpChatEnableFocusNavigationModule = require(expChat.Flags.FFlagExpChatEnableFocusNavigation)
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
local fFlagDebugFriendsChatModule = require(expChat.FriendsChat.Flags.FFlagDebugFriendsChat)
local fFlagDebugExpChatPerfModule = require(expChat.Flags.FFlagDebugExpChatPerf)
local fStringDebugFriendsChatConversationIdModule = require(expChat.FriendsChat.Flags.FStringDebugFriendsChatConversationId)
local manuallyInvokeAmpUpsell = socialUpsellModule.Utils.manuallyInvokeAmpUpsell
local isInExperienceUIVREnabled = require(parent.SharedExperimentDefinition).isInExperienceUIVREnabled
local getFFlagExpChatTriggerWindowStatusEventModule = require(expChat.Flags.getFFlagExpChatTriggerWindowStatusEvent)
local var57 = if isInExperienceUIVREnabled then {
	DEFAULT = UDim2.fromScale(0.95, 0.94),
	WITH_CHANNEL_BAR = UDim2.fromScale(0.95, 0.78),
	WITH_CHATINPUT_BAR = UDim2.fromScale(0.95, 0.76),
	WITH_CHANNEL_CHATINPUT_BAR = UDim2.fromScale(0.95, 0.6098)
} else nil
local getFocusNavigationStoreModule = require(expChat.Stores.GetFocusNavigationStore)
local getTransparencyStoreModule = require(expChat.Stores.GetTransparencyStore)
local getChatWindowStatusStoreModule = require(expChat.Stores.GetChatWindowStatusStore)

local function PresetChatInputRow(value) --[[ line: 105 ]]
	-- upvalues: configModule (ref), foundationModule (ref), roactModule (ref), expChatPresetChatFixesEnabled (ref), constantsModule (ref), presetChatButtonModule (ref), presetChatFlyOutModule (ref), enableChatButtonModule (ref), expChatPresetFixChatHotkey (ref), chatInputModule (ref)
	local var64 = if value.showEnableChatButton then configModule.PresetChat.ButtonWidth else 47
	local var65 = if value.showEnableChatButton then foundationModule.Enums.InputSize.Small else foundationModule.Enums.InputSize.Medium
	
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
			BackgroundTransparency = value.transparencyValue:map(function(p0) --[[ line: 129 ]]
				-- upvalues: value (ref)
				return value.backgroundTransparency + p0 * (1 - value.backgroundTransparency)
			end),
			Size = UDim2.new(0, var64, 1, 0),
			Visible = if expChatPresetChatFixesEnabled then value.isChatWindowVisible or value.isChatInputBarVisible else nil
		}, {
			ButtonOrFlyOut = roactModule.createElement("CanvasGroup", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, if value.showEnableChatButton then 5 else 3, 0.5, if expChatPresetChatFixesEnabled then 0 else -1),
				AutomaticSize = Enum.AutomaticSize.XY,
				GroupTransparency = value.transparencyValue
			}, {
				Content = if value.presetLayoutMode == constantsModule.LayoutMode.Tray then roactModule.createElement(presetChatButtonModule, { isCircular = false, size = var65 }) else roactModule.createElement(presetChatFlyOutModule, {
					buttonIsCircular = false,
					addTopPadding = value.isChatWindowVisible,
					textChannel = value.targetTextChannel,
					buttonSize = var65
				})
			})
		}),
		FillArea = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, -var64, 0, 0)
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

function appLayout.init(p1) --[[ line: 226 ]]
	-- upvalues: fFlagDebugFriendsChatModule (ref), fFlagDebugExpChatPerfModule (ref), userInputService (ref), roactModule (ref), otterModule (ref), getTransparencyStoreModule (ref), getFFlagExpChatTriggerWindowStatusEventModule (ref), getChatWindowStatusStoreModule (ref), playersService (ref), textChatService (ref), fFlagExpChatUseChatConfigStore (ref), getChatConfigurationStoreModule (ref), fFlagExpChatTransparentFocusSupportModule (ref), fFlagExpChatDictationFadeOverrideModule (ref), t (ref), createEffect (ref), fFlagAEGIS2EnableGatesForExpChatModule (ref), getChatStatusStoreModule (ref), fFlagExpChatPresetChatEnabled (ref), getPresetChatStoreModule (ref), constantsModule (ref), fFlagExpChatPresetChatGamepadEnabledModule (ref), fFlagExpChatPresetChatSendEnabled (ref), fFlagExpChatUniverseChatPresetEnabledModule (ref), fFlagExpChatEnableFocusNavigationModule (ref), reactFocusNavigationModule (ref), fFlagExpChatFocusChannelBarSupportModule (ref), getFocusNavigationStoreModule (ref), focusUtils (ref)
	p1.state = {}
	
	if fFlagDebugFriendsChatModule or fFlagDebugExpChatPerfModule then
		p1.debugInjectionThread = nil
		p1.debugKeybindConnection = userInputService.InputBegan:Connect(function(p2, p3) --[[ line: 234 ]]
			-- upvalues: p1 (ref)
			if p3 then return end
			if p2.KeyCode == Enum.KeyCode.K and p2:IsModifierKeyDown(Enum.ModifierKey.Ctrl) then
				p1:debugInjectFakeMessages()
			end
		end)
	end
	local var66, var67 = roactModule.createBinding(0)
	p1.transparencyValue = var66
	p1.updateBackgroundTransparency = var67
	p1.backgroundTransparencyMotor = otterModule.createSingleMotor(0)
	p1.backgroundTransparencyMotor:onStep(p1.updateBackgroundTransparency)
	local var68, var69 = roactModule.createBinding(0)
	p1.textTransparencyValue = var68
	p1.updateTextTransparencyValue = var69
	p1.textTransparencyMotor = otterModule.createSingleMotor(0)
	p1.textTransparencyMotor:onStep(p1.updateTextTransparencyValue)
	local var70 = getTransparencyStoreModule(false)
	p1.ChatWindowStatusStore = if getFFlagExpChatTriggerWindowStatusEventModule() then getChatWindowStatusStoreModule(false) else nil
	
	if getFFlagExpChatTriggerWindowStatusEventModule() then
		p1.localPlayerLeavingConnection = playersService.PlayerRemoving:Connect(function(p4) --[[ line: 258 ]]
			-- upvalues: playersService (copy), p1 (ref), textChatService (copy)
			if p4 == playersService.LocalPlayer then
				p1.ChatWindowStatusStore.setPreviousChatWindowState(p1.ChatWindowStatusStore.getCurrentChatWindowState(false))
				local durationUpdates = p1.ChatWindowStatusStore.getDurationUpdates(false)
				textChatService:SendExpChatWindowStatusChange(durationUpdates.closedDuration, durationUpdates.openDuration, durationUpdates.backgroundIdleDuration, durationUpdates.textIdleDuration)
			end
		end)
	end
	if fFlagExpChatUseChatConfigStore then
		p1.ChatConfigurationStore = getChatConfigurationStoreModule(false)
	end
	function p1.resetBackgroundTransparency() --[[ line: 281 ]]
		-- upvalues: fFlagExpChatTransparentFocusSupportModule (copy), fFlagExpChatDictationFadeOverrideModule (copy), var70 (ref), p1 (ref), otterModule (copy), getFFlagExpChatTriggerWindowStatusEventModule (copy), t (copy)
		local var72 = if fFlagExpChatTransparentFocusSupportModule or fFlagExpChatDictationFadeOverrideModule then var70.getIsFocused(false) else var70.getIsTextBoxFocused(false)
		p1.backgroundTransparencyMotor:setGoal(otterModule.instant(0))
		p1.props.timer:stop()
		
		if var72 == false and p1.props.isSpatialUIEnabled == false then
			p1.props.timer:start():andThen(function() --[[ line: 290 ]]
				-- upvalues: getFFlagExpChatTriggerWindowStatusEventModule (copy), p1 (copy), otterModule (copy), t (copy)
				if getFFlagExpChatTriggerWindowStatusEventModule() then
					p1.ChatWindowStatusStore.setBackgroundTimerStarted(os.clock())
				end
				p1.backgroundTransparencyMotor:setGoal(otterModule.spring(1, t))
			end)
		end
	end
	
	function p1.resetTextTransparency() --[[ line: 299 ]]
		-- upvalues: fFlagExpChatTransparentFocusSupportModule (copy), fFlagExpChatDictationFadeOverrideModule (copy), var70 (ref), p1 (ref), otterModule (copy), getFFlagExpChatTriggerWindowStatusEventModule (copy), t (copy)
		local var73 = if fFlagExpChatTransparentFocusSupportModule or fFlagExpChatDictationFadeOverrideModule then var70.getIsFocused(false) else var70.getIsTextBoxFocused(false)
		p1.textTransparencyMotor:setGoal(otterModule.instant(0))
		p1.props.textTimer:stop()
		
		if var73 == false then
			p1.props.textTimer:start():andThen(function() --[[ line: 308 ]]
				-- upvalues: getFFlagExpChatTriggerWindowStatusEventModule (copy), p1 (copy), otterModule (copy), t (copy)
				if getFFlagExpChatTriggerWindowStatusEventModule() then
					p1.ChatWindowStatusStore.setTextTimerStarted(os.clock())
				end
				p1.textTransparencyMotor:setGoal(otterModule.spring(1, t))
			end)
		end
	end
	
	p1.disposeBackgroundEffect = createEffect(function(p5) --[[ line: 316 ]]
		-- upvalues: var70 (ref), p1 (ref)
		local _ = var70.getLastActivity(p5)
		p1.resetBackgroundTransparency()
		p1.resetTextTransparency()
	end)
	p1.disposeTextEffect = createEffect(function(p6) --[[ line: 322 ]]
		-- upvalues: var70 (ref), p1 (ref)
		local _ = var70.getLastMessageActivity(p6)
		p1.resetTextTransparency()
	end)
	
	if fFlagAEGIS2EnableGatesForExpChatModule then
		p1.disposeChatStatusEffect = createEffect(function(p7) --[[ line: 328 ]]
			-- upvalues: getChatStatusStoreModule (copy), p1 (ref)
			p1:setState({
				chatStatus = getChatStatusStoreModule(p7).getChatStatus(p7)
			})
		end)
	end
	if fFlagExpChatPresetChatEnabled then
		p1.disposePresetFlyOutAvailableEffect = createEffect(function(p8) --[[ line: 339 ]]
			-- upvalues: getPresetChatStoreModule (copy), constantsModule (copy), fFlagExpChatPresetChatGamepadEnabledModule (copy), userInputService (copy), p1 (ref), fFlagExpChatPresetChatSendEnabled (copy), fFlagExpChatUniverseChatPresetEnabledModule (copy)
			local var74 = getPresetChatStoreModule(p8)
			local isEnabled = var74.getIsEnabled(p8)
			local accessLevel = var74.getAccessLevel(p8)
			local layoutModeOverride = var74.getLayoutModeOverride(p8)
			local _ = nil
			p1:setState({
				isPresetFlyOutAvailable = isEnabled and (fFlagExpChatPresetChatSendEnabled and (accessLevel == constantsModule.AccessLevel.Enabled and (if p1.props.targetTextChannel == nil then fFlagExpChatUniverseChatPresetEnabledModule else true))),
				presetLayoutMode = if layoutModeOverride == constantsModule.LayoutMode.Tray or layoutModeOverride == constantsModule.LayoutMode.FlyOut then layoutModeOverride elseif fFlagExpChatPresetChatGamepadEnabledModule and userInputService.PreferredInput == Enum.PreferredInput.Gamepad then constantsModule.LayoutMode.FlyOut elseif userInputService.TouchEnabled and not userInputService.MouseEnabled then constantsModule.LayoutMode.Tray else constantsModule.LayoutMode.FlyOut
			})
		end)
	end
	function p1.onAbsolutePositionChanged(p9, p10) --[[ line: 372 ]]
		p10.AbsolutePositionWrite = p9.AbsolutePosition
	end
	
	function p1.onAbsoluteSizeChanged(p11, p12) --[[ line: 376 ]]
		p12.AbsoluteSizeWrite = p11.AbsoluteSize
	end
	
	p1.onChatFrameLayoutChanged = if fFlagExpChatPresetChatEnabled then function(p13) --[[ line: 381 ]]
		-- upvalues: getPresetChatStoreModule (copy)
		getPresetChatStoreModule(false).setChatWindowBottomY(p13.AbsolutePosition.Y + p13.AbsoluteSize.Y)
	end else nil
	
	if fFlagExpChatEnableFocusNavigationModule then
		p1.focusNavigationService = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
		p1.topBorderRef = if fFlagExpChatFocusChannelBarSupportModule then roactModule.createRef() else nil
		
		function p1.onContainerSelectionChanged(p14, _, _, p15) --[[ line: 393 ]]
			-- upvalues: getFocusNavigationStoreModule (copy), fFlagExpChatTransparentFocusSupportModule (copy), var70 (ref), fFlagExpChatFocusChannelBarSupportModule (copy), p1 (ref), focusUtils (copy)
			if p15 == nil or not p15:IsDescendantOf(p14) then
				getFocusNavigationStoreModule(false).unfocusChatInputBar()
				
				if fFlagExpChatTransparentFocusSupportModule then
					var70.clearWindowFocusInput()
					
					return
				end
			elseif fFlagExpChatTransparentFocusSupportModule then
				var70.setWindowFocusInput()
			end
			if fFlagExpChatFocusChannelBarSupportModule and p15 == p1.topBorderRef.current then
				focusUtils.FocusOnChrome(function() --[[ line: 407 ]]
					-- upvalues: getFocusNavigationStoreModule (copy)
					getFocusNavigationStoreModule(false).unfocusChatInputBar()
				end, "chat")
			end
		end
		
		if not fFlagExpChatFocusChannelBarSupportModule then
			function p1.onBorderSelectionChanged(_, p16, _, _) --[[ line: 416 ]]
				-- upvalues: focusUtils (copy), getFocusNavigationStoreModule (copy)
				if p16 then
					focusUtils.FocusOnChrome(function() --[[ line: 418 ]]
						-- upvalues: getFocusNavigationStoreModule (copy)
						getFocusNavigationStoreModule(false).unfocusChatInputBar()
					end, "chat")
				end
			end
		end
	end
end

function appLayout.didMount(p17) --[[ line: 427 ]]
	-- upvalues: getFFlagExpChatTriggerWindowStatusEventModule (ref), otterModule (ref), t (ref)
	p17.props.timer:start():andThen(function() --[[ line: 428 ]]
		-- upvalues: getFFlagExpChatTriggerWindowStatusEventModule (copy), p17 (ref), otterModule (copy), t (copy)
		if getFFlagExpChatTriggerWindowStatusEventModule() then
			p17.ChatWindowStatusStore.setBackgroundTimerStarted(os.clock())
		end
		p17.backgroundTransparencyMotor:setGoal(otterModule.spring(1, t))
	end)
	p17.props.textTimer:start():andThen(function() --[[ line: 435 ]]
		-- upvalues: getFFlagExpChatTriggerWindowStatusEventModule (copy), p17 (ref), otterModule (copy), t (copy)
		if getFFlagExpChatTriggerWindowStatusEventModule() then
			p17.ChatWindowStatusStore.setTextTimerStarted(os.clock())
		end
		p17.textTransparencyMotor:setGoal(otterModule.spring(1, t))
	end)
end

function appLayout.render(p18) --[[ line: 443 ]]
	-- upvalues: getFFlagExpChatTriggerWindowStatusEventModule (ref), fFlagExpChatUseChatConfigStore (ref), clientSettingsUtilityModule (ref), fFlagExpChatEnableFriendsTab (ref), fFlagAEGIS2EnableGatesForExpChatModule (ref), showChatEnabledUIModule (ref), isInExperienceUIVREnabled (ref), getFFlagExpChatConditionallyMountAppLayoutModule (ref), getFFlagExpChatEnableChannelTabsUIModule (ref), var57 (ref), configModule (ref), fFlagDebugForceEnableChatButtonOnModule (ref), isChatRegionLockedModule (ref), expChatPresetButtonOldInputBarV2 (ref), fFlagExpChatPresetChatEnabled (ref), roactModule (ref), spatialUIModule (ref), fFlagExpChatEnableFocusNavigationModule (ref), fFlagExpChatFocusChannelBarSupportModule (ref), expChatFixTopPaddingColor (ref), fFlagExpChatEnableV2ChatWindowModule (ref), fFlagExpChatKeepV2PoolMountedModule (ref), chatWindowModule (ref), fFlagExpChatUseMessagesStore (ref), fFlagExpChatPresetChatSendEnabled (ref), presetChatGateModule (ref), constantsModule (ref), presetChatTrayModule (ref), fFlagExpChatNewInputBarModule (ref), PresetChatInputRow (ref), manuallyInvokeAmpUpsell (ref), chatInputModule (ref), friendsChatModule (ref), enableChatButtonModule (ref), expChatPresetChatFixesEnabled (ref), presetChatButtonModule (ref), presetChatFlyOutModule (ref), expChatPresetFixChatHotkey (ref), channelBarModule (ref), reactFocusNavigationModule (ref), selectionCursorProvider (ref), cursorProvider (ref), withSelectionCursorProvider (ref), cursorKind (ref)
	if getFFlagExpChatTriggerWindowStatusEventModule() then
		if p18.props.isChatWindowVisible or p18.props.isChatInputBarVisible then
			p18.ChatWindowStatusStore.setOpenTimerStarted(os.clock())
		else
			p18.ChatWindowStatusStore.setClosedTimerStarted(os.clock())
		end
	end
	local isChannelBarVisible
	local var78 = if fFlagExpChatUseChatConfigStore and p18.ChatConfigurationStore then p18.ChatConfigurationStore.getChatWindowSettings(false) else p18.props.chatWindowSettings
	local backgroundTransparency = clientSettingsUtilityModule.getBackgroundTransparency(var78, p18.props.clientSettings)
	local backgroundColor = clientSettingsUtilityModule.getBackgroundColor(var78, p18.props.clientSettings)
	local uDim2 = nil
	local var82 = fFlagExpChatEnableFriendsTab and p18.props.selectedTabType == "FriendsChat"
	local var83 = not var82
	local chatStatus = nil
	local isChatInputBarVisible = p18.props.isChatInputBarVisible
	
	if fFlagAEGIS2EnableGatesForExpChatModule then
		chatStatus = p18.state.chatStatus
		isChatInputBarVisible = isChatInputBarVisible and showChatEnabledUIModule(chatStatus)
	end
	if isInExperienceUIVREnabled then
		if p18.props.isSpatialUIEnabled then
			isChannelBarVisible = getFFlagExpChatConditionallyMountAppLayoutModule() and (getFFlagExpChatEnableChannelTabsUIModule() and p18.props.isChannelBarVisible)
			uDim2 = if isChannelBarVisible and isChatInputBarVisible then var57.WITH_CHANNEL_CHATINPUT_BAR elseif isChannelBarVisible and not isChatInputBarVisible then var57.WITH_CHANNEL_BAR elseif isChannelBarVisible or not isChatInputBarVisible then var57.DEFAULT else var57.WITH_CHATINPUT_BAR
		else
			uDim2 = UDim2.fromScale(configModule.ChatWindowSize.X.Scale * var78.WidthScale, configModule.ChatWindowSize.Y.Scale * var78.HeightScale)
		end
	end
	isChannelBarVisible = fFlagDebugForceEnableChatButtonOnModule or fFlagAEGIS2EnableGatesForExpChatModule and (not isChatRegionLockedModule() and (p18.props.canPlatformEnableChat() and chatStatus == "AgeVerificationRequired"))
	local isPresetFlyOutAvailable = expChatPresetButtonOldInputBarV2 and (fFlagExpChatPresetChatEnabled and p18.state.isPresetFlyOutAvailable)
	local var86 = fFlagExpChatPresetChatEnabled and (p18.state.isPresetFlyOutAvailable and (not isChannelBarVisible and not isChatInputBarVisible))
	
	local var87 = function(p19) --[[ line: 516 ]]
		-- upvalues: roactModule (copy), spatialUIModule (copy), p18 (ref), fFlagExpChatEnableFocusNavigationModule (copy), isInExperienceUIVREnabled (copy), uDim2 (write), configModule (copy), var78 (ref), fFlagExpChatPresetChatEnabled (copy), backgroundColor (ref), backgroundTransparency (ref), getFFlagExpChatEnableChannelTabsUIModule (copy), fFlagExpChatFocusChannelBarSupportModule (copy), var82 (ref), expChatFixTopPaddingColor (copy), var83 (ref), getFFlagExpChatConditionallyMountAppLayoutModule (copy), fFlagExpChatEnableV2ChatWindowModule (copy), fFlagExpChatKeepV2PoolMountedModule (copy), chatWindowModule (copy), fFlagExpChatUseMessagesStore (copy), fFlagExpChatPresetChatSendEnabled (copy), presetChatGateModule (copy), constantsModule (copy), presetChatTrayModule (copy), fFlagExpChatNewInputBarModule (copy), isPresetFlyOutAvailable (ref), PresetChatInputRow (copy), isChatInputBarVisible (write), isChannelBarVisible (ref), manuallyInvokeAmpUpsell (copy), chatInputModule (copy), friendsChatModule (copy), enableChatButtonModule (copy), var86 (ref), expChatPresetChatFixesEnabled (copy), presetChatButtonModule (copy), presetChatFlyOutModule (copy), expChatPresetFixChatHotkey (copy), channelBarModule (copy)
		local isChatWindowVisible
		local createElement = roactModule.createElement
		local provider = spatialUIModule.Provider
		local t = {
			value = { isSpatialUIEnabled = p18.props.isSpatialUIEnabled }
		}
		local t_1 = {}
		local createElement_1 = roactModule.createElement
		local var90 = "Frame"
		local t_2 = {
			AnchorPoint = p18.props.chatLayoutAlignment.AnchorPoint,
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1,
			Position = p18.props.chatLayoutAlignment.Position,
			SelectionBehaviorDown = if fFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorLeft = if fFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorRight = if fFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorUp = if fFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
			SelectionGroup = if fFlagExpChatEnableFocusNavigationModule then true else nil,
			Size = if isInExperienceUIVREnabled then uDim2 elseif p18.props.isSpatialUIEnabled then UDim2.fromScale(0.95, 0.68) else UDim2.fromScale(configModule.ChatWindowSize.X.Scale * var78.WidthScale, configModule.ChatWindowSize.Y.Scale * var78.HeightScale),
			[roactModule.Change.AbsoluteSize] = if fFlagExpChatPresetChatEnabled then p18.onChatFrameLayoutChanged else nil,
			[roactModule.Change.AbsolutePosition] = if fFlagExpChatPresetChatEnabled then p18.onChatFrameLayoutChanged else nil,
			[roactModule.Event.SelectionChanged] = p18.onContainerSelectionChanged
		}
		local t_3 = {
			uiSizeConstraint = roactModule.createElement("UISizeConstraint", {
				MaxSize = if p18.props.isSpatialUIEnabled then Vector2.new(1e999, 1e999) else Vector2.new(configModule.ChatWindowMaxWidth, 1e999)
			}),
			layout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = p18.props.chatLayoutAlignment.UIListLayoutVerticalAlignment
			})
		}
		local createElement_2 = roactModule.createElement
		local var93 = "ImageLabel"
		local t_4 = {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/TopRoundedRect8px.png",
			ImageColor3 = backgroundColor,
			ImageTransparency = p18.transparencyValue:map(function(p20) --[[ line: 565 ]]
				-- upvalues: backgroundTransparency (copy)
				return backgroundTransparency + p20 * (1 - backgroundTransparency)
			end),
			LayoutOrder = 1,
			SelectionImageObject = p19,
			Selectable = if fFlagExpChatEnableFocusNavigationModule then true else nil,
			ScaleType = Enum.ScaleType.Slice,
			Size = UDim2.new(1, 0, 0, 8),
			SliceCenter = Rect.new(8, 8, 24, 32)
		}
		
		if not getFFlagExpChatEnableChannelTabsUIModule() then
			isChatWindowVisible = p18.props.isChatWindowVisible or p18.props.isChatInputBarVisible
		elseif not p18.props.isChatWindowVisible then
			isChatWindowVisible = p18.props.isChatInputBarVisible and not p18.props.isChannelBarVisible
		end
		local var96
		t_4.Visible = isChatWindowVisible
		t_4[roactModule.Event.MouseEnter] = p18.props.onHovered
		t_4[roactModule.Event.MouseLeave] = p18.props.onUnhovered
		t_4[roactModule.Event.SelectionChanged] = if fFlagExpChatFocusChannelBarSupportModule then nil else p18.onBorderSelectionChanged
		t_4[roactModule.Ref] = if fFlagExpChatFocusChannelBarSupportModule then p18.topBorderRef else nil
		t_3.topBorder = createElement_2(var93, t_4, {
			uiSizeConstraint = roactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(configModule.ChatWindowMaxWidth, 1e999)
			})
		})
		t_3.topPadding = roactModule.createElement("Frame", {
			LayoutOrder = 1,
			Size = if var82 then UDim2.fromScale(1, 0) else UDim2.new(1, 0, 0, 8),
			Visible = if getFFlagExpChatEnableChannelTabsUIModule() then p18.props.isChannelBarVisible else false,
			BackgroundTransparency = p18.transparencyValue:map(function(p21) --[[ line: 598 ]]
				-- upvalues: backgroundTransparency (copy)
				return backgroundTransparency + p21 * (1 - backgroundTransparency)
			end),
			BackgroundColor3 = if expChatFixTopPaddingColor then backgroundColor else var78.BackgroundColor3,
			BorderSizePixel = 0,
			[roactModule.Event.MouseEnter] = p18.props.onHovered,
			[roactModule.Event.MouseLeave] = p18.props.onUnhovered,
			ZIndex = 0
		})
		
		if var83 then
			var96 = if getFFlagExpChatConditionallyMountAppLayoutModule() and (not fFlagExpChatEnableV2ChatWindowModule or not fFlagExpChatKeepV2PoolMountedModule) then p18.props.isChatWindowVisible else true
			var96 = var96 and roactModule.createElement(chatWindowModule, {
				LayoutOrder = 2,
				size = UDim2.fromScale(1, 1),
				transparencyValue = p18.transparencyValue,
				textTransparency = p18.textTransparencyValue,
				onHovered = p18.props.onHovered,
				onUnhovered = p18.props.onUnhovered,
				mutedUserIds = p18.props.mutedUserIds,
				canLocalUserChat = if fFlagExpChatUseMessagesStore then nil else p18.props.canLocalUserChat,
				activateWhisperMode = p18.props.activateWhisperMode,
				resetTargetChannel = p18.props.resetTargetChannel,
				visible = p18.props.isChatWindowVisible,
				onAbsoluteSizeChanged = p18.onAbsoluteSizeChanged,
				onAbsolutePositionChanged = p18.onAbsolutePositionChanged,
				chatWindowSettings = var78,
				showTranslationButton = p18.props.showTranslationButton,
				isChannelBarVisible = if getFFlagExpChatEnableChannelTabsUIModule() then p18.props.isChannelBarVisible else false,
				isSpatialUIEnabled = p18.props.isSpatialUIEnabled
			})
		else
			var96 = nil
		end
		local var97
		t_3.chatWindow = var96
		t_3.presetChatTray = if var83 and fFlagExpChatPresetChatEnabled and fFlagExpChatPresetChatSendEnabled then roactModule.createElement(presetChatGateModule, {
			layoutMode = constantsModule.LayoutMode.Tray,
			targetTextChannel = p18.props.targetTextChannel
		}, {
			Tray = roactModule.createElement(presetChatTrayModule, { textChannel = p18.props.targetTextChannel })
		}) else nil
		t_3.chatInputBar = if var83 and not fFlagExpChatNewInputBarModule then if isPresetFlyOutAvailable then roactModule.createElement(PresetChatInputRow, {
			transparencyValue = p18.transparencyValue,
			backgroundColor3 = backgroundColor,
			backgroundTransparency = backgroundTransparency,
			isChatWindowVisible = p18.props.isChatWindowVisible,
			isChatInputBarVisible = isChatInputBarVisible,
			targetTextChannel = p18.props.targetTextChannel,
			onSendChat = p18.props.onSendChat,
			onSendGlobalChat = p18.props.onSendGlobalChat,
			canLocalUserChat = if fFlagExpChatUseMessagesStore then nil else p18.props.canLocalUserChat,
			resetTargetChannel = p18.props.resetTargetChannel,
			onAbsoluteSizeChanged = p18.onAbsoluteSizeChanged,
			onAbsolutePositionChanged = p18.onAbsolutePositionChanged,
			chatWindowSettings = var78,
			isChannelBarVisible = if getFFlagExpChatEnableChannelTabsUIModule() then p18.props.isChannelBarVisible else false,
			isSpatialUIEnabled = p18.props.isSpatialUIEnabled,
			showEnableChatButton = isChannelBarVisible,
			onHovered = p18.props.onHovered,
			onUnhovered = p18.props.onUnhovered,
			onEnableChatActivated = function() --[[ line: 676 ]]
				-- upvalues: manuallyInvokeAmpUpsell (copy)
				manuallyInvokeAmpUpsell("InExperienceTextChatUpsell")
			end,
			presetLayoutMode = p18.state.presetLayoutMode
		}) else roactModule.createElement(chatInputModule, {
			LayoutOrder = 3,
			addTopPadding = p18.props.isChatWindowVisible,
			onSendChat = p18.props.onSendChat,
			onSendGlobalChat = p18.props.onSendGlobalChat,
			transparencyValue = p18.transparencyValue,
			canLocalUserChat = if fFlagExpChatUseMessagesStore then nil else p18.props.canLocalUserChat,
			resetTargetChannel = p18.props.resetTargetChannel,
			visible = isChatInputBarVisible,
			onAbsoluteSizeChanged = p18.onAbsoluteSizeChanged,
			onAbsolutePositionChanged = p18.onAbsolutePositionChanged,
			chatWindowSettings = var78,
			isChannelBarVisible = if getFFlagExpChatEnableChannelTabsUIModule() then p18.props.isChannelBarVisible else false,
			isSpatialUIEnabled = p18.props.isSpatialUIEnabled
		}) else nil
		t_3.friendsChat = if var82 and p18.props.isChatWindowVisible then roactModule.createElement(friendsChatModule.FriendsChatMain, {
			parentLayoutOrder = 2,
			chatWindowSettings = var78,
			transparencyValue = p18.transparencyValue,
			textTransparency = p18.textTransparencyValue,
			mutedUserIds = p18.props.mutedUserIds,
			verifiedUserIds = p18.props.verifiedUserIds,
			showTranslationButton = p18.props.showTranslationButton,
			isSpatialUIEnabled = p18.props.isSpatialUIEnabled,
			isChannelBarVisible = p18.props.isChannelBarVisible,
			onHovered = p18.props.onHovered,
			onUnhovered = p18.props.onUnhovered,
			onAbsoluteSizeChanged = p18.onAbsoluteSizeChanged,
			onAbsolutePositionChanged = p18.onAbsolutePositionChanged
		}) else nil
		t_3.enableChatButton = if var83 and not fFlagExpChatNewInputBarModule and (not isPresetFlyOutAvailable and isChannelBarVisible) then roactModule.createElement(enableChatButtonModule, {
			LayoutOrder = 3,
			chatWindowSettings = var78,
			transparencyValue = p18.transparencyValue,
			addTopPadding = p18.props.isChatWindowVisible,
			onHovered = p18.props.onHovered,
			onUnhovered = p18.props.onUnhovered,
			isSpatialUIEnabled = p18.props.isSpatialUIEnabled,
			visible = p18.props.isChatWindowVisible or p18.props.isChatInputBarVisible,
			onActivated = function() --[[ line: 739 ]]
				-- upvalues: manuallyInvokeAmpUpsell (copy)
				manuallyInvokeAmpUpsell("InExperienceTextChatUpsell")
			end
		}) else nil
		
		if var83 and fFlagExpChatNewInputBarModule then
			local var101
			var97 = roactModule.createElement
			local var98 = "Frame"
			local t_5 = {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = backgroundColor,
				BackgroundTransparency = p18.transparencyValue:map(function(p22) --[[ line: 748 ]]
					-- upvalues: backgroundTransparency (copy)
					return backgroundTransparency + p22 * (1 - backgroundTransparency)
				end),
				BorderSizePixel = 0,
				LayoutOrder = 3,
				Size = UDim2.fromScale(1, 0),
				Visible = if fFlagExpChatPresetChatEnabled then p18.props.isChatWindowVisible or p18.props.isChatInputBarVisible else true,
				ZIndex = 2,
				[roactModule.Event.MouseEnter] = p18.props.onHovered,
				[roactModule.Event.MouseLeave] = p18.props.onUnhovered
			}
			local t_6 = {
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
				presetFlyOutWrapper = if fFlagExpChatPresetChatEnabled and p18.state.isPresetFlyOutAvailable then roactModule.createElement("CanvasGroup", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					GroupTransparency = p18.transparencyValue,
					Size = if var86 then UDim2.fromScale(1, 0) else UDim2.fromOffset(configModule.PresetChat.ButtonWidth, 0),
					Visible = if expChatPresetChatFixesEnabled then p18.props.isChatWindowVisible or p18.props.isChatInputBarVisible else nil
				}, {
					PresetEntry = if p18.state.presetLayoutMode == constantsModule.LayoutMode.Tray then roactModule.createElement(presetChatButtonModule, {
						baseTransparency = 0,
						targetTextChannel = p18.props.targetTextChannel
					}) else roactModule.createElement(presetChatFlyOutModule, {
						addTopPadding = p18.props.isChatWindowVisible,
						fullWidthButton = var86,
						textChannel = p18.props.targetTextChannel
					})
				}) else nil
			}
			
			if expChatPresetFixChatHotkey or not var86 then
				var101 = roactModule.createElement
				var101 = var101("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = if expChatPresetFixChatHotkey and var86 then Enum.AutomaticSize.None else Enum.AutomaticSize.Y,
					Size = if expChatPresetFixChatHotkey and var86 then UDim2.new(0, 0, 0, 0) else UDim2.new(1, if p18.state.isPresetFlyOutAvailable then -(configModule.PresetChat.ButtonWidth + 8) else 0, 0, 0),
					Visible = if expChatPresetFixChatHotkey then not var86 else nil
				}, {
					enableChatButton = if isChannelBarVisible then roactModule.createElement(enableChatButtonModule, {
						chatWindowSettings = var78,
						transparencyValue = p18.transparencyValue,
						addTopPadding = p18.props.isChatWindowVisible,
						onHovered = p18.props.onHovered,
						onUnhovered = p18.props.onUnhovered,
						isSpatialUIEnabled = p18.props.isSpatialUIEnabled,
						visible = p18.props.isChatWindowVisible or p18.props.isChatInputBarVisible,
						onActivated = function() --[[ line: 829 ]]
							-- upvalues: manuallyInvokeAmpUpsell (copy)
							manuallyInvokeAmpUpsell("InExperienceTextChatUpsell")
						end
					}) else nil,
					chatInputBar = if expChatPresetFixChatHotkey or isChatInputBarVisible then roactModule.createElement(chatInputModule, {
						suppressOuterBackground = true,
						addTopPadding = p18.props.isChatWindowVisible,
						onSendChat = p18.props.onSendChat,
						onSendGlobalChat = p18.props.onSendGlobalChat,
						transparencyValue = p18.transparencyValue,
						canLocalUserChat = if fFlagExpChatUseMessagesStore then nil else p18.props.canLocalUserChat,
						resetTargetChannel = p18.props.resetTargetChannel,
						visible = if expChatPresetFixChatHotkey then isChatInputBarVisible else nil,
						onAbsoluteSizeChanged = p18.onAbsoluteSizeChanged,
						onAbsolutePositionChanged = p18.onAbsolutePositionChanged,
						chatWindowSettings = var78,
						isChannelBarVisible = if getFFlagExpChatEnableChannelTabsUIModule() then p18.props.isChannelBarVisible else false,
						isSpatialUIEnabled = p18.props.isSpatialUIEnabled,
						onHovered = p18.props.onHovered,
						onUnhovered = p18.props.onUnhovered
					}) else nil
				})
			else
				var101 = nil
			end
			t_6.fillArea = var101
			var97 = var97(var98, t_5, t_6)
		else
			var97 = nil
		end
		t_3.chatInputRow = var97
		t_3.channelBar = (if getFFlagExpChatConditionallyMountAppLayoutModule() then p18.props.isChannelBarVisible else true) and roactModule.createElement(channelBarModule, {
			LayoutOrder = if var82 then 100 else 4,
			size = UDim2.fromScale(1, 1),
			transparencyValue = p18.transparencyValue,
			onHovered = p18.props.onHovered,
			onUnhovered = p18.props.onUnhovered,
			chatWindowSettings = var78,
			visible = if getFFlagExpChatEnableChannelTabsUIModule() then p18.props.isChannelBarVisible else false,
			topBorderRef = if fFlagExpChatFocusChannelBarSupportModule then p18.topBorderRef else nil
		})
		t_3.bottomBorder = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/BottomRoundedRect8px.png",
			ImageColor3 = backgroundColor,
			ImageTransparency = p18.transparencyValue:map(function(p23) --[[ line: 880 ]]
				-- upvalues: backgroundTransparency (copy)
				return backgroundTransparency + p23 * (1 - backgroundTransparency)
			end),
			LayoutOrder = if var82 then 101 else 5,
			ScaleType = Enum.ScaleType.Slice,
			Size = UDim2.new(1, 0, 0, 8),
			SliceCenter = Rect.new(8, 0, 24, 16),
			Visible = p18.props.isChatWindowVisible or p18.props.isChatInputBarVisible,
			[roactModule.Event.MouseEnter] = p18.props.onHovered,
			[roactModule.Event.MouseLeave] = p18.props.onUnhovered
		}, {
			uiSizeConstraint = roactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(configModule.ChatWindowMaxWidth, 1e999)
			})
		})
		t_1.appLayout = createElement_1(var90, t_2, t_3)
		
		return createElement(provider, t, t_1)
	end
	
	return if fFlagExpChatEnableFocusNavigationModule then roactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = p18.focusNavigationService }, {
		CursorProvider = roactModule.createElement(selectionCursorProvider, {}, {
			NewCursorProvider = roactModule.createElement(cursorProvider, {}, {
				withSelectionCursorProvider(function(p24) --[[ line: 908 ]]
					-- upvalues: var87 (ref), cursorKind (copy)
					return var87(p24(cursorKind.Invisible))
				end)
			})
		})
	}) else var87(nil)
end

function appLayout.debugInjectFakeMessages(p25) --[[ line: 926 ]]
	-- upvalues: fFlagExpChatEnableFriendsTab (ref), getFriendsChatRealtimeStoreModule (ref), fStringDebugFriendsChatConversationIdModule (ref), getConversationMessageStoreModule (ref), getConversationMessageListStoreModule (ref), fFlagExpChatUseMessagesStore (ref), getMessagesStoreModule (ref)
	if p25.debugInjectionThread ~= nil then
		task.cancel(p25.debugInjectionThread)
		p25.debugInjectionThread = nil
	end
	local var102 = fFlagExpChatEnableFriendsTab and p25.props.selectedTabType == "FriendsChat"
	local var103 = getFriendsChatRealtimeStoreModule(false).getActiveConversationId(false) or fStringDebugFriendsChatConversationIdModule
	
	if var102 and (var103 == nil or var103 == "") then
		return
	end
	p25.debugInjectionThread = task.spawn(function() --[[ line: 939 ]]
		-- upvalues: var102 (ref), getConversationMessageStoreModule (copy), getConversationMessageListStoreModule (copy), fFlagExpChatUseMessagesStore (copy), getMessagesStoreModule (copy), var103 (ref), p25 (ref)
		local var104 = if var102 then getConversationMessageStoreModule(false) else nil
		local var105 = if var102 then getConversationMessageListStoreModule(false) else nil
		local var106 = if var102 or not fFlagExpChatUseMessagesStore then nil else getMessagesStoreModule(false)
		
		for i = 1, 50 do
			if var102 then
				local var107 = `debug-fake-{tostring(os.clock())}-{i}`
				var104.upsertMessages({
					[var107] = {
						type = "user",
						id = var107,
						content = `Fake friends-chat debug message #{i}`,
						created_at = DateTime.now():ToIsoDate(),
						sender_user_id = (i - 1) % 5 + 1
					}
				})
				var105.prependMessages(var103, { var107 })
			elseif var106 ~= nil then
				var106.addSystemMessage(`Fake exp-chat debug message #{i}`, "RBXGeneral", nil, nil, false)
			end
			if i < 50 then
				task.wait(0.1)
			end
		end
		p25.debugInjectionThread = nil
	end)
end

function appLayout.willUnmount(p26) --[[ line: 973 ]]
	-- upvalues: getFFlagExpChatTriggerWindowStatusEventModule (ref), fFlagExpChatUseChatConfigStore (ref), fFlagAEGIS2EnableGatesForExpChatModule (ref), fFlagExpChatPresetChatEnabled (ref)
	if p26.debugKeybindConnection then
		p26.debugKeybindConnection:Disconnect()
		p26.debugKeybindConnection = nil
	end
	if p26.debugInjectionThread ~= nil then
		task.cancel(p26.debugInjectionThread)
		p26.debugInjectionThread = nil
	end
	p26.disposeBackgroundEffect()
	p26.disposeTextEffect()
	p26.textTransparencyMotor:destroy()
	p26.backgroundTransparencyMotor:destroy()
	
	if getFFlagExpChatTriggerWindowStatusEventModule() and p26.localPlayerLeavingConnection then
		p26.localPlayerLeavingConnection:Disconnect()
	end
	if fFlagExpChatUseChatConfigStore and p26.disposeChatWindowSettingsEffect then
		p26.disposeChatWindowSettingsEffect()
	end
	if fFlagExpChatUseChatConfigStore and p26.disposeChatInputBarSettingsEffect then
		p26.disposeChatInputBarSettingsEffect()
	end
	if fFlagAEGIS2EnableGatesForExpChatModule and p26.disposeChatStatusEffect then
		p26.disposeChatStatusEffect()
	end
	if fFlagExpChatPresetChatEnabled and p26.disposePresetFlyOutAvailableEffect then
		p26.disposePresetFlyOutAvailableEffect()
	end
end

return appLayout