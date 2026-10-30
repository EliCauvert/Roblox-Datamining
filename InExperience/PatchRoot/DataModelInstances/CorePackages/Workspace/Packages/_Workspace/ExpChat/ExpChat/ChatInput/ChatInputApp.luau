local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local GetTransparencyStoreModule = require(ExpChat.Stores.GetTransparencyStore)
local LocalizationModule = require(ExpChat.Localization)
local LocalizationService = game:GetService("LocalizationService")
local Parent = ExpChat.Parent
local RoactModule = require(Parent.Roact)
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local TutilsModule = require(Parent.tutils)
local ConfigModule = require(ExpChat.Config)
local InputTypeModule = require(Parent.InputType)
local GetInputGroupFunction = require(Parent.InputType).getInputGroup
local SharedFlagsModule = require(Parent.SharedFlags)
local FocusChatHotKeyActivatedModule = require(ExpChat.Actions.FocusChatHotKeyActivated)
local AutocompleteDropdownActivatedModule = require(ExpChat.Actions.AutocompleteDropdownActivated)
local AutocompleteDropdownResultsChangedModule = require(ExpChat.Actions.AutocompleteDropdownResultsChanged)
local AutocompleteDropdownSelectionChangedModule = require(ExpChat.Actions.AutocompleteDropdownSelectionChanged)
local AutocompleteDropdownTypeChangedModule = require(ExpChat.Actions.AutocompleteDropdownTypeChanged)
local AutocompleteDropdownDeactivatedModule = require(ExpChat.Actions.AutocompleteDropdownDeactivated)
local MemoizeChatInputApp = game:DefineFastFlag("MemoizeChatInputApp", false)
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagLuaSupportMicroGamepadPreferredInput = SharedFlagsModule.FFlagLuaSupportMicroGamepadPreferredInput
local FFlagExpChatUseChannelTabsStore = SharedFlagsModule.FFlagExpChatUseChannelTabsStore
local GetFFlagTextChatEnableUniverseChatTabsFunction = require(Parent.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs
local GetChannelTabsStoreModule = if FFlagExpChatUseChannelTabsStore then require(ExpChat.Stores.GetChannelTabsStore) else nil
local Flags = ExpChat.Flags
local GetFFlagUnreduxLastInputTypeChangedModule = require(Flags.getFFlagUnreduxLastInputTypeChanged)
local FFlagExpChatDictationFadeOverrideModule = require(Flags.FFlagExpChatDictationFadeOverride)
local FFlagExpChatContinuousDictationIdleFadeModule = require(Flags.FFlagExpChatContinuousDictationIdleFade)
local SelectSelectedTabNameModule = require(ExpChat.selectSelectedTabName)
local UI = script.Parent.UI
local ChatInputBarModule = require(UI.ChatInputBar)
local DictationStateModule = require(UI.ChatInputBar.Dictation.DictationState)
local Localization = require(Parent.InExperienceLocales).Localization
local CryoModule = require(Parent.Cryo)
local ChatInputBarApp = (if GetFFlagUnreduxLastInputTypeChangedModule() then RoactModule.PureComponent else RoactModule.Component):extend("ChatInputBarApp")
ChatInputBarApp.defaultProps = {
	addTopPadding = true,
	LayoutOrder = 1,
	onSendChat = nil,
	transparencyValue = RoactModule.createBinding(0.3)
}

if GetFFlagUnreduxLastInputTypeChangedModule() then
	function ChatInputBarApp.init(p1)
		-- upvalues: UserInputService (copy), FFlagLuaSupportMicroGamepadPreferredInput (copy), GetInputGroupFunction (copy), InputTypeModule (copy)
		p1:setState({
			isUsingTouch = UserInputService.TouchEnabled,
			isUsingGamepad = UserInputService.PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and UserInputService.PreferredInput == Enum.PreferredInput.MicroGamepad
		})
		p1.connection = UserInputService.LastInputTypeChanged:Connect(function(LastInputType)
			-- upvalues: GetInputGroupFunction (upval), p1 (copy), InputTypeModule (upval)
			local InputGroup = GetInputGroupFunction(LastInputType)
			p1:setState({
				isUsingTouch = InputGroup == InputTypeModule.InputTypeConstants.Touch,
				isUsingGamepad = InputGroup == InputTypeModule.InputTypeConstants.Gamepad
			})
		end)
	end
	
	function ChatInputBarApp.getPlaceholderText(p1)
		return if p1.state.isUsingGamepad then p1.props.placeholderGamepadText elseif p1.state.isUsingTouch then p1.props.placeholderTouchText else p1.props.placeholderKeyboardText
	end
	
	function ChatInputBarApp.willUnmount(p1)
		if p1.connection then
			p1.connection:Disconnect()
		end
	end
else
	function ChatInputBarApp.getPlaceholderText(p1)
		return if p1.props.isUsingGamepad then p1.props.placeholderGamepadText elseif p1.props.isUsingTouch then p1.props.placeholderTouchText else p1.props.placeholderKeyboardText
	end
end
function ChatInputBarApp.render(p1)
	-- upvalues: ReactModule (copy), ChatInputBarModule (copy), UserInputService (copy), ConfigModule (copy)
	return ReactModule.createElement(ChatInputBarModule, {
		userInputService = UserInputService,
		contextActionService = game:GetService("ContextActionService"),
		messageCharacterLimit = ConfigModule.MessageCharacterLimit,
		sendButtonContainerWidth = 30,
		addTopPadding = p1.props.addTopPadding,
		LayoutOrder = p1.props.LayoutOrder,
		placeholderText = p1:getPlaceholderText(),
		disabledChatPlaceholderText = p1.props.disabledChatPlaceholderText,
		size = UDim2.fromScale(1, 0),
		chatIntervention = p1.props.chatIntervention,
		onSendChat = p1.props.onSendChat,
		onSendGlobalChat = p1.props.onSendGlobalChat,
		transparencyValue = p1.props.transparencyValue,
		canLocalUserChat = p1.props.canLocalUserChat,
		targetTextChannel = p1.props.targetTextChannel,
		localTeam = p1.props.localTeam,
		localPlayer = p1.props.localPlayer,
		defaultSystemTextChannel = p1.props.defaultSystemTextChannel,
		shouldFocusChatInputBar = p1.props.shouldFocusChatInputBar,
		resetTargetChannel = p1.props.resetTargetChannel,
		focusChatHotKeyActivated = p1.props.focusChatHotKeyActivated,
		devDefinedFocusKeyCode = p1.props.devDefinedFocusKeyCode,
		visible = p1.props.visible,
		onFocus = p1.props.onFocus,
		onUnfocus = p1.props.onUnfocus,
		onHovered = p1.props.onHovered,
		onUnhovered = p1.props.onUnhovered,
		onAbsoluteSizeChanged = p1.props.onAbsoluteSizeChanged,
		onAbsolutePositionChanged = p1.props.onAbsolutePositionChanged,
		chatWindowSettings = p1.props.chatWindowSettings,
		chatInputBarSettings = p1.props.chatInputBarSettings,
		isChatHotkeyEnabled = p1.props.isChatHotkeyEnabled,
		autocompleteDropdownReducer = p1.props.autocompleteDropdownReducer,
		autocompleteDropdownActivated = p1.props.autocompleteDropdownActivated,
		autocompleteDropdownResultsChanged = p1.props.autocompleteDropdownResultsChanged,
		autocompleteDropdownSelectionChanged = p1.props.autocompleteDropdownSelectionChanged,
		autocompleteDropdownTypeChanged = p1.props.autocompleteDropdownTypeChanged,
		autocompleteDropdownDeactivated = p1.props.autocompleteDropdownDeactivated,
		autocompleteEnabled = p1.props.autocompleteEnabled,
		isChannelBarVisible = p1.props.isChannelBarVisible,
		isGlobalChatTabActive = p1.props.isGlobalChatTabActive,
		developerChannelTabsEnabled = p1.props.developerChannelTabsEnabled,
		onDictationActivityChanged = p1.props.onDictationActivityChanged,
		onDictationStateChanged = p1.props.onDictationStateChanged
	})
end

local v1 = RoactRoduxModule.connect(function(p1)
	-- upvalues: FFlagExpChatUseChannelTabsStore (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), SelectSelectedTabNameModule (copy), Players (copy), GetFFlagUnreduxLastInputTypeChangedModule (copy)
	local IsRBXGlobal: boolean? = nil
	local ChannelTabsConfigurationEnabled = nil
	
	if not FFlagExpChatUseChannelTabsStore then
		local ChannelTabs = p1.ChannelTabs
		IsRBXGlobal = GetFFlagTextChatEnableUniverseChatTabsFunction() and SelectSelectedTabNameModule(p1) == "RBXGlobal"
		ChannelTabsConfigurationEnabled = if GetFFlagTextChatEnableUniverseChatTabsFunction() and ChannelTabs then ChannelTabs.channelTabsConfigurationEnabled else false
	end
	return {
		targetTextChannel = p1.TextChannels.targetTextChannel,
		localPlayer = Players.LocalPlayer,
		localTeam = p1.LocalTeam,
		isUsingTouch = if GetFFlagUnreduxLastInputTypeChangedModule() then nil else p1.isUsingTouch,
		isUsingGamepad = if GetFFlagUnreduxLastInputTypeChangedModule() then nil else p1.isUsingGamepad,
		devDefinedFocusKeyCode = p1.ChatLayout.ChatInputBarSettings.KeyboardKeyCode,
		defaultSystemTextChannel = p1.TextChannels.allTextChannels.RBXSystem,
		shouldFocusChatInputBar = p1.shouldFocusChatInputBar,
		chatInputBarSettings = p1.ChatLayout.ChatInputBarSettings,
		chatIntervention = p1.ChatIntervention,
		isChatHotkeyEnabled = p1.ChatVisibility.isChatHotkeyEnabled.value,
		autocompleteDropdownReducer = p1.AutocompleteDropdown,
		autocompleteEnabled = p1.ChatLayout.ChatInputBarSettings.AutocompleteEnabled,
		isGlobalChatTabActive = IsRBXGlobal,
		developerChannelTabsEnabled = ChannelTabsConfigurationEnabled
	}
end, function(Callback)
	-- upvalues: GetTransparencyStoreModule (copy), FFlagExpChatDictationFadeOverrideModule (copy), FFlagExpChatContinuousDictationIdleFadeModule (copy), FocusChatHotKeyActivatedModule (copy), DictationStateModule (copy), AutocompleteDropdownActivatedModule (copy), AutocompleteDropdownResultsChangedModule (copy), AutocompleteDropdownSelectionChangedModule (copy), AutocompleteDropdownTypeChangedModule (copy), AutocompleteDropdownDeactivatedModule (copy)
	local TransparencyStoreModule = GetTransparencyStoreModule(false)
	local FFlagExpChatContinuousDictationIdleFadeModule1 = FFlagExpChatDictationFadeOverrideModule and FFlagExpChatContinuousDictationIdleFadeModule
	
	local function setDictationHold(p1)
		-- upvalues: TransparencyStoreModule (copy)
		if p1 then
			TransparencyStoreModule.setDictationActive()
			
			return
		else
			TransparencyStoreModule.clearDictationActive()
		end
	end
	
	return {
		focusChatHotKeyActivated = function()
			-- upvalues: Callback (copy), FocusChatHotKeyActivatedModule (upval)
			return Callback(FocusChatHotKeyActivatedModule())
		end,
		onFocus = function()
			-- upvalues: TransparencyStoreModule (copy)
			return TransparencyStoreModule.setTextboxFocus()
		end,
		onUnfocus = function()
			-- upvalues: TransparencyStoreModule (copy)
			return TransparencyStoreModule.clearTextboxFocus()
		end,
		onHovered = function()
			-- upvalues: TransparencyStoreModule (copy)
			return TransparencyStoreModule.resetAllTransparency()
		end,
		onUnhovered = function()
			-- upvalues: TransparencyStoreModule (copy)
			return TransparencyStoreModule.resetAllTransparency()
		end,
		onDictationActivityChanged = if FFlagExpChatDictationFadeOverrideModule and not FFlagExpChatContinuousDictationIdleFadeModule1 then setDictationHold else nil,
		onDictationStateChanged = if FFlagExpChatContinuousDictationIdleFadeModule1 then function(Recording)
			-- upvalues: DictationStateModule (upval), TransparencyStoreModule (copy)
			if Recording == DictationStateModule.Recording or Recording == DictationStateModule.Transcribing then
				TransparencyStoreModule.setDictationActive()
				
				return
			else
				TransparencyStoreModule.clearDictationActive()
			end
		end else nil,
		autocompleteDropdownActivated = function(p1)
			-- upvalues: Callback (copy), AutocompleteDropdownActivatedModule (upval)
			return Callback(AutocompleteDropdownActivatedModule(p1))
		end,
		autocompleteDropdownResultsChanged = function(p1, p2)
			-- upvalues: Callback (copy), AutocompleteDropdownResultsChangedModule (upval)
			return Callback(AutocompleteDropdownResultsChangedModule(p1, p2))
		end,
		autocompleteDropdownSelectionChanged = function(p1)
			-- upvalues: Callback (copy), AutocompleteDropdownSelectionChangedModule (upval)
			return Callback(AutocompleteDropdownSelectionChangedModule(p1))
		end,
		autocompleteDropdownTypeChanged = function(p1)
			-- upvalues: Callback (copy), AutocompleteDropdownTypeChangedModule (upval)
			return Callback(AutocompleteDropdownTypeChangedModule(p1))
		end,
		autocompleteDropdownDeactivated = function()
			-- upvalues: Callback (copy), AutocompleteDropdownDeactivatedModule (upval)
			return Callback(AutocompleteDropdownDeactivatedModule())
		end
	}
end)(LocalizationModule.connect(function(p1)
	-- upvalues: UserInputService (copy)
	return {
		placeholderTouchText = "CoreScripts.TextChat.InputBar.Hint.Touch",
		disabledChatPlaceholderText = "CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled",
		placeholderKeyboardText = {
			"CoreScripts.TextChat.InputBar.Hint.MouseKeyboard",
			{
				KEY = UserInputService:GetStringForKeyCode(p1.devDefinedFocusKeyCode)
			}
		}
	}
end)(ChatInputBarApp))

local function ResultComponentWithSignals(p1)
	-- upvalues: ReactModule (copy), SignalsModule (copy), GetChannelTabsStoreModule (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), TutilsModule (copy), SignalsReactModule (copy), v1 (copy), CryoModule (copy)
	return ReactModule.createElement(v1, CryoModule.Dictionary.union(p1, (SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), GetChannelTabsStoreModule (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), TutilsModule (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: GetChannelTabsStoreModule (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval)
			local ChannelTabsState = GetChannelTabsStoreModule(false).getChannelTabsState(p2)
			
			return {
				developerChannelTabsEnabled = if GetFFlagTextChatEnableUniverseChatTabsFunction() then ChannelTabsState.channelTabsConfigurationEnabled else false,
				isGlobalChatTabActive = GetFFlagTextChatEnableUniverseChatTabsFunction() and ChannelTabsState.selectedTabName == "RBXGlobal"
			}
		end, TutilsModule.deepEqual)
	end, {}))))))
end

local ResultComponentWithSignals1 = if FFlagExpChatUseChannelTabsStore then ResultComponentWithSignals else v1

local function v41(p1)
	-- upvalues: Localization (copy), LocalizationService (copy), FFlagEnableConsoleExpControls (copy), CryoModule (copy), ReactModule (copy), ResultComponentWithSignals1 (copy)
	local NewResult = Localization.new(LocalizationService.RobloxLocaleId)
	
	return ReactModule.createElement(ResultComponentWithSignals1, (CryoModule.Dictionary.join(p1, {
		placeholderGamepadText = if FFlagEnableConsoleExpControls then NewResult:Format("CoreScripts.TextChat.InputBar.Hint.GamepadConnected", {
			CONFIRM_KEY = NewResult:Format("CoreScripts.TextChat.InputBar.Hint.GamepadConnectedConfirm")
		}) else NewResult:Format("CoreScripts.TextChat.InputBar.Hint.Gamepad", {
			CHAT_BUTTON = NewResult:Format("CoreScripts.TopBar.Chat")
		})
	})))
end

return if MemoizeChatInputApp then ReactModule.memo(v41) else v41