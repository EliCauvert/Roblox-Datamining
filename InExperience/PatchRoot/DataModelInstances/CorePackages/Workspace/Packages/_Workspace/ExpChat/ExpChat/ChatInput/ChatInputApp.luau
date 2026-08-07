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
	function chatInputBarApp.init(p0) --[[ line: 53 ]]
		-- upvalues: userInputService (ref), getInputGroup (ref), inputTypeModule (ref)
		p0:setState({
			isUsingTouch = userInputService.TouchEnabled,
			isUsingGamepad = userInputService.PreferredInput == Enum.PreferredInput.Gamepad
		})
		p0.connection = userInputService.LastInputTypeChanged:Connect(function(p1) --[[ line: 58 ]]
			-- upvalues: getInputGroup (copy), p0 (ref), inputTypeModule (copy)
			local var28 = getInputGroup(p1)
			p0:setState({
				isUsingTouch = var28 == inputTypeModule.InputTypeConstants.Touch,
				isUsingGamepad = var28 == inputTypeModule.InputTypeConstants.Gamepad
			})
		end)
	end
	
	function chatInputBarApp.getPlaceholderText(p2) --[[ line: 68 ]]
		return if p2.state.isUsingGamepad then p2.props.placeholderGamepadText elseif p2.state.isUsingTouch then p2.props.placeholderTouchText else p2.props.placeholderKeyboardText
	end
	
	function chatInputBarApp.willUnmount(p3) --[[ line: 78 ]]
		if p3.connection then
			p3.connection:Disconnect()
		end
	end
else
	function chatInputBarApp.getPlaceholderText(p4) --[[ line: 84 ]]
		return if p4.props.isUsingGamepad then p4.props.placeholderGamepadText elseif p4.props.isUsingTouch then p4.props.placeholderTouchText else p4.props.placeholderKeyboardText
	end
end
function chatInputBarApp.render(p5) --[[ line: 95 ]]
	-- upvalues: reactModule (ref), chatInputBarModule (ref), userInputService (ref), configModule (ref)
	return reactModule.createElement(chatInputBarModule, {
		userInputService = userInputService,
		contextActionService = game:GetService("ContextActionService"),
		messageCharacterLimit = configModule.MessageCharacterLimit,
		sendButtonContainerWidth = 30,
		addTopPadding = p5.props.addTopPadding,
		LayoutOrder = p5.props.LayoutOrder,
		placeholderText = p5:getPlaceholderText(),
		disabledChatPlaceholderText = p5.props.disabledChatPlaceholderText,
		size = UDim2.fromScale(1, 0),
		chatIntervention = p5.props.chatIntervention,
		onSendChat = p5.props.onSendChat,
		onSendGlobalChat = p5.props.onSendGlobalChat,
		transparencyValue = p5.props.transparencyValue,
		canLocalUserChat = p5.props.canLocalUserChat,
		targetTextChannel = p5.props.targetTextChannel,
		localTeam = p5.props.localTeam,
		localPlayer = p5.props.localPlayer,
		defaultSystemTextChannel = p5.props.defaultSystemTextChannel,
		shouldFocusChatInputBar = p5.props.shouldFocusChatInputBar,
		resetTargetChannel = p5.props.resetTargetChannel,
		focusChatHotKeyActivated = p5.props.focusChatHotKeyActivated,
		devDefinedFocusKeyCode = p5.props.devDefinedFocusKeyCode,
		visible = p5.props.visible,
		onFocus = p5.props.onFocus,
		onUnfocus = p5.props.onUnfocus,
		onHovered = p5.props.onHovered,
		onUnhovered = p5.props.onUnhovered,
		onAbsoluteSizeChanged = p5.props.onAbsoluteSizeChanged,
		onAbsolutePositionChanged = p5.props.onAbsolutePositionChanged,
		chatWindowSettings = p5.props.chatWindowSettings,
		chatInputBarSettings = p5.props.chatInputBarSettings,
		isChatHotkeyEnabled = p5.props.isChatHotkeyEnabled,
		autocompleteDropdownReducer = p5.props.autocompleteDropdownReducer,
		autocompleteDropdownActivated = p5.props.autocompleteDropdownActivated,
		autocompleteDropdownResultsChanged = p5.props.autocompleteDropdownResultsChanged,
		autocompleteDropdownSelectionChanged = p5.props.autocompleteDropdownSelectionChanged,
		autocompleteDropdownTypeChanged = p5.props.autocompleteDropdownTypeChanged,
		autocompleteDropdownDeactivated = p5.props.autocompleteDropdownDeactivated,
		autocompleteEnabled = p5.props.autocompleteEnabled,
		isChannelBarVisible = p5.props.isChannelBarVisible,
		isGlobalChatTabActive = p5.props.isGlobalChatTabActive,
		developerChannelTabsEnabled = p5.props.developerChannelTabsEnabled,
		onDictationActivityChanged = p5.props.onDictationActivityChanged
	})
end

local var26 = roactRoduxModule.connect(function(p7) --[[ line: 143 ]]
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), playersService (ref), getFFlagUnreduxLastInputTypeChangedModule (ref), selectSelectedTabNameModule (ref)
	local channelTabs = p7.ChannelTabs
	
	return {
		targetTextChannel = p7.TextChannels.targetTextChannel,
		localPlayer = playersService.LocalPlayer,
		localTeam = p7.LocalTeam,
		isUsingTouch = if not getFFlagUnreduxLastInputTypeChangedModule() then p7.isUsingTouch else nil,
		isUsingGamepad = if not getFFlagUnreduxLastInputTypeChangedModule() then p7.isUsingGamepad else nil,
		devDefinedFocusKeyCode = p7.ChatLayout.ChatInputBarSettings.KeyboardKeyCode,
		defaultSystemTextChannel = p7.TextChannels.allTextChannels.RBXSystem,
		shouldFocusChatInputBar = p7.shouldFocusChatInputBar,
		chatInputBarSettings = p7.ChatLayout.ChatInputBarSettings,
		chatIntervention = p7.ChatIntervention,
		isChatHotkeyEnabled = p7.ChatVisibility.isChatHotkeyEnabled.value,
		autocompleteDropdownReducer = p7.AutocompleteDropdown,
		autocompleteEnabled = p7.ChatLayout.ChatInputBarSettings.AutocompleteEnabled,
		isGlobalChatTabActive = getFFlagTextChatEnableUniverseChatTabs() and selectSelectedTabNameModule(p7) == "RBXGlobal",
		developerChannelTabsEnabled = if getFFlagTextChatEnableUniverseChatTabs() and channelTabs then channelTabs.channelTabsConfigurationEnabled else false
	}
end, function(p8) --[[ line: 167 ]]
	-- upvalues: getTransparencyStoreModule (ref), focusChatHotKeyActivatedModule (ref), fFlagExpChatDictationFadeOverrideModule (ref), autocompleteDropdownActivatedModule (ref), autocompleteDropdownResultsChangedModule (ref), autocompleteDropdownSelectionChangedModule (ref), autocompleteDropdownTypeChangedModule (ref), autocompleteDropdownDeactivatedModule (ref)
	local var29 = getTransparencyStoreModule(false)
	
	return {
		focusChatHotKeyActivated = function() --[[ line: 170 ]]
			-- upvalues: p8 (ref), focusChatHotKeyActivatedModule (copy)
			return p8(focusChatHotKeyActivatedModule())
		end,
		onFocus = function() --[[ line: 174 ]]
			-- upvalues: var29 (ref)
			return var29.setTextboxFocus()
		end,
		onUnfocus = function() --[[ line: 178 ]]
			-- upvalues: var29 (ref)
			return var29.clearTextboxFocus()
		end,
		onHovered = function() --[[ line: 182 ]]
			-- upvalues: var29 (ref)
			return var29.resetAllTransparency()
		end,
		onUnhovered = function() --[[ line: 186 ]]
			-- upvalues: var29 (ref)
			return var29.resetAllTransparency()
		end,
		onDictationActivityChanged = if fFlagExpChatDictationFadeOverrideModule then function(p9) --[[ line: 192 ]]
			-- upvalues: var29 (ref)
			if p9 then
				var29.setDictationActive()
				
				return
			end
			var29.clearDictationActive()
		end else nil,
		autocompleteDropdownActivated = function(p10) --[[ line: 201 ]]
			-- upvalues: p8 (ref), autocompleteDropdownActivatedModule (copy)
			return p8(autocompleteDropdownActivatedModule(p10))
		end,
		autocompleteDropdownResultsChanged = function(p11) --[[ line: 205 ]]
			-- upvalues: p8 (ref), autocompleteDropdownResultsChangedModule (copy)
			return p8(autocompleteDropdownResultsChangedModule(p11))
		end,
		autocompleteDropdownSelectionChanged = function(p12) --[[ line: 209 ]]
			-- upvalues: p8 (ref), autocompleteDropdownSelectionChangedModule (copy)
			return p8(autocompleteDropdownSelectionChangedModule(p12))
		end,
		autocompleteDropdownTypeChanged = function(p13) --[[ line: 213 ]]
			-- upvalues: p8 (ref), autocompleteDropdownTypeChangedModule (copy)
			return p8(autocompleteDropdownTypeChangedModule(p13))
		end,
		autocompleteDropdownDeactivated = function() --[[ line: 217 ]]
			-- upvalues: p8 (ref), autocompleteDropdownDeactivatedModule (copy)
			return p8(autocompleteDropdownDeactivatedModule())
		end
	}
end)(localizationModule.connect(function(p6) --[[ line: 221 ]]
	-- upvalues: userInputService (ref)
	return {
		placeholderTouchText = "CoreScripts.TextChat.InputBar.Hint.Touch",
		disabledChatPlaceholderText = "CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled",
		placeholderKeyboardText = {
			"CoreScripts.TextChat.InputBar.Hint.MouseKeyboard",
			{
				KEY = userInputService:GetStringForKeyCode(p6.devDefinedFocusKeyCode)
			}
		}
	}
end)(chatInputBarApp))

local var27 = function(p14) --[[ line: 233 ]]
	-- upvalues: localization (ref), localizationService (ref), fFlagEnableConsoleExpControls (ref), cryoModule (ref), reactModule (ref), var26 (ref)
	local var30 = localization.new(localizationService.RobloxLocaleId)
	local _ = nil
	
	return reactModule.createElement(var26, cryoModule.Dictionary.join(p14, {
		placeholderGamepadText = if fFlagEnableConsoleExpControls then var30:Format("CoreScripts.TextChat.InputBar.Hint.GamepadConnected", {
			CONFIRM_KEY = var30:Format("CoreScripts.TextChat.InputBar.Hint.GamepadConnectedConfirm")
		}) else var30:Format("CoreScripts.TextChat.InputBar.Hint.Gamepad", { CHAT_BUTTON = var30:Format("CoreScripts.TopBar.Chat") })
	}))
end

return if memoizeChatInputApp then reactModule.memo(var27) else var27