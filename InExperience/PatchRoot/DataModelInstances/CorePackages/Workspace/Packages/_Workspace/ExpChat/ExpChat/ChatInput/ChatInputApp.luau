local playersService = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local expChat = script:FindFirstAncestor("ExpChat")
local getTransparencyStoreModule = require(expChat.Stores.GetTransparencyStore)
local localizationModule = require(expChat.Localization)
local localizationService = game:GetService("LocalizationService")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local roactModule = require(parent.Roact)
local reactModule = require(parent.React)
local roactRoduxModule = require(parent.RoactRodux)
local configModule = require(expChat.Config)
local inputTypeModule = require(parent.InputType)
local getInputGroup = require(parent.InputType).getInputGroup
local sharedFlagsModule = require(parent.SharedFlags)
local focusChatHotKeyActivatedModule = require(expChat.Actions.FocusChatHotKeyActivated)
local autocompleteDropdownActivatedModule = require(expChat.Actions.AutocompleteDropdownActivated)
local autocompleteDropdownResultsChangedModule = require(expChat.Actions.AutocompleteDropdownResultsChanged)
local autocompleteDropdownSelectionChangedModule = require(expChat.Actions.AutocompleteDropdownSelectionChanged)
local autocompleteDropdownTypeChangedModule = require(expChat.Actions.AutocompleteDropdownTypeChanged)
local autocompleteDropdownDeactivatedModule = require(expChat.Actions.AutocompleteDropdownDeactivated)
local memoizeChatInputApp = game:DefineFastFlag("MemoizeChatInputApp", false)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local flags = expChat.Flags
local getFFlagUnreduxLastInputTypeChangedModule = require(flags.getFFlagUnreduxLastInputTypeChanged)
local fFlagExpChatDictationFadeOverrideModule = require(flags.FFlagExpChatDictationFadeOverride)
local selectSelectedTabNameModule = require(expChat.selectSelectedTabName)
local chatInputBarModule = require(script.Parent.UI.ChatInputBar)
local localization = require(parent.InExperienceLocales).Localization
local cryoModule = require(parent.Cryo)
local chatInputBarApp = (if getFFlagUnreduxLastInputTypeChangedModule() then roactModule.PureComponent else roactModule.Component):extend("ChatInputBarApp")
chatInputBarApp.defaultProps = {
	addTopPadding = true,
	LayoutOrder = 1,
	onSendChat = nil,
	transparencyValue = roactModule.createBinding(0.3)
}

if getFFlagUnreduxLastInputTypeChangedModule() then
	function chatInputBarApp.init(p1)
		-- upvalues: userInputService (ref), getInputGroup (ref), inputTypeModule (ref)
		p1:setState({
			isUsingTouch = userInputService.TouchEnabled,
			isUsingGamepad = userInputService.PreferredInput == Enum.PreferredInput.Gamepad
		})
		p1.connection = userInputService.LastInputTypeChanged:Connect(function(p2)
			-- upvalues: getInputGroup (copy), p1 (ref), inputTypeModule (copy)
			local var1 = getInputGroup(p2)
			p1:setState({
				isUsingTouch = var1 == inputTypeModule.InputTypeConstants.Touch,
				isUsingGamepad = var1 == inputTypeModule.InputTypeConstants.Gamepad
			})
		end)
	end
	
	function chatInputBarApp.getPlaceholderText(p1)
		return if p1.state.isUsingGamepad then p1.props.placeholderGamepadText elseif p1.state.isUsingTouch then p1.props.placeholderTouchText else p1.props.placeholderKeyboardText
	end
	
	function chatInputBarApp.willUnmount(p1)
		if p1.connection then
			p1.connection:Disconnect()
		end
	end
else
	function chatInputBarApp.getPlaceholderText(p1)
		return if p1.props.isUsingGamepad then p1.props.placeholderGamepadText elseif p1.props.isUsingTouch then p1.props.placeholderTouchText else p1.props.placeholderKeyboardText
	end
end
function chatInputBarApp.render(p1)
	-- upvalues: reactModule (ref), chatInputBarModule (ref), userInputService (ref), configModule (ref)
	return reactModule.createElement(chatInputBarModule, {
		userInputService = userInputService,
		contextActionService = game:GetService("ContextActionService"),
		messageCharacterLimit = configModule.MessageCharacterLimit,
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
		onDictationActivityChanged = p1.props.onDictationActivityChanged
	})
end

local var1 = roactRoduxModule.connect(function(p1)
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), playersService (ref), getFFlagUnreduxLastInputTypeChangedModule (ref), selectSelectedTabNameModule (ref)
	local channelTabs = p1.ChannelTabs
	
	return {
		targetTextChannel = p1.TextChannels.targetTextChannel,
		localPlayer = playersService.LocalPlayer,
		localTeam = p1.LocalTeam,
		isUsingTouch = if not getFFlagUnreduxLastInputTypeChangedModule() then p1.isUsingTouch else nil,
		isUsingGamepad = if not getFFlagUnreduxLastInputTypeChangedModule() then p1.isUsingGamepad else nil,
		devDefinedFocusKeyCode = p1.ChatLayout.ChatInputBarSettings.KeyboardKeyCode,
		defaultSystemTextChannel = p1.TextChannels.allTextChannels.RBXSystem,
		shouldFocusChatInputBar = p1.shouldFocusChatInputBar,
		chatInputBarSettings = p1.ChatLayout.ChatInputBarSettings,
		chatIntervention = p1.ChatIntervention,
		isChatHotkeyEnabled = p1.ChatVisibility.isChatHotkeyEnabled.value,
		autocompleteDropdownReducer = p1.AutocompleteDropdown,
		autocompleteEnabled = p1.ChatLayout.ChatInputBarSettings.AutocompleteEnabled,
		isGlobalChatTabActive = getFFlagTextChatEnableUniverseChatTabs() and selectSelectedTabNameModule(p1) == "RBXGlobal",
		developerChannelTabsEnabled = if getFFlagTextChatEnableUniverseChatTabs() and channelTabs then channelTabs.channelTabsConfigurationEnabled else false
	}
end, function(p1)
	-- upvalues: getTransparencyStoreModule (ref), focusChatHotKeyActivatedModule (ref), fFlagExpChatDictationFadeOverrideModule (ref), autocompleteDropdownActivatedModule (ref), autocompleteDropdownResultsChangedModule (ref), autocompleteDropdownSelectionChangedModule (ref), autocompleteDropdownTypeChangedModule (ref), autocompleteDropdownDeactivatedModule (ref)
	local var2 = getTransparencyStoreModule(false)
	
	return {
		focusChatHotKeyActivated = function()
			-- upvalues: p1 (ref), focusChatHotKeyActivatedModule (copy)
			return p1(focusChatHotKeyActivatedModule())
		end,
		onFocus = function()
			-- upvalues: var2 (ref)
			return var2.setTextboxFocus()
		end,
		onUnfocus = function()
			-- upvalues: var2 (ref)
			return var2.clearTextboxFocus()
		end,
		onHovered = function()
			-- upvalues: var2 (ref)
			return var2.resetAllTransparency()
		end,
		onUnhovered = function()
			-- upvalues: var2 (ref)
			return var2.resetAllTransparency()
		end,
		onDictationActivityChanged = if fFlagExpChatDictationFadeOverrideModule then function(p2)
			-- upvalues: var2 (ref)
			if p2 then
				var2.setDictationActive()
				
				return
			end
			var2.clearDictationActive()
		end else nil,
		autocompleteDropdownActivated = function(p2)
			-- upvalues: p1 (ref), autocompleteDropdownActivatedModule (copy)
			return p1(autocompleteDropdownActivatedModule(p2))
		end,
		autocompleteDropdownResultsChanged = function(p2)
			-- upvalues: p1 (ref), autocompleteDropdownResultsChangedModule (copy)
			return p1(autocompleteDropdownResultsChangedModule(p2))
		end,
		autocompleteDropdownSelectionChanged = function(p2)
			-- upvalues: p1 (ref), autocompleteDropdownSelectionChangedModule (copy)
			return p1(autocompleteDropdownSelectionChangedModule(p2))
		end,
		autocompleteDropdownTypeChanged = function(p2)
			-- upvalues: p1 (ref), autocompleteDropdownTypeChangedModule (copy)
			return p1(autocompleteDropdownTypeChangedModule(p2))
		end,
		autocompleteDropdownDeactivated = function()
			-- upvalues: p1 (ref), autocompleteDropdownDeactivatedModule (copy)
			return p1(autocompleteDropdownDeactivatedModule())
		end
	}
end)(localizationModule.connect(function(p1)
	-- upvalues: userInputService (ref)
	return {
		placeholderTouchText = "CoreScripts.TextChat.InputBar.Hint.Touch",
		disabledChatPlaceholderText = "CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled",
		placeholderKeyboardText = {
			"CoreScripts.TextChat.InputBar.Hint.MouseKeyboard",
			{
				KEY = userInputService:GetStringForKeyCode(p1.devDefinedFocusKeyCode)
			}
		}
	}
end)(chatInputBarApp))

local var2 = function(p1)
	-- upvalues: localization (ref), localizationService (ref), fFlagEnableConsoleExpControls (ref), cryoModule (ref), reactModule (ref), var1 (ref)
	local var3 = localization.new(localizationService.RobloxLocaleId)
	local _ = nil
	
	return reactModule.createElement(var1, cryoModule.Dictionary.join(p1, {
		placeholderGamepadText = if fFlagEnableConsoleExpControls then var3:Format("CoreScripts.TextChat.InputBar.Hint.GamepadConnected", {
			CONFIRM_KEY = var3:Format("CoreScripts.TextChat.InputBar.Hint.GamepadConnectedConfirm")
		}) else var3:Format("CoreScripts.TextChat.InputBar.Hint.Gamepad", { CHAT_BUTTON = var3:Format("CoreScripts.TopBar.Chat") })
	}))
end

return if memoizeChatInputApp then reactModule.memo(var2) else var2