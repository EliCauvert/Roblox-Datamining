local playersService = game:GetService("Players")
local textChatService = game:GetService("TextChatService")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local expChatSharedModule = require(parent.ExpChatShared)
local focusUtils = require(parent.Chrome).FocusUtils
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local IXPServiceWrapper = require(parent.IxpServiceWrapper).IXPServiceWrapper
local getChatTooltipStoreModule = require(expChat.Stores.GetChatTooltipStore)
local UIBloxModule = require(parent.UIBlox)
local promiseModule = require(parent.Promise)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local list = require(parent.llama).List
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useCursor = UIBloxModule.App.SelectionCursor.useCursor
local useInterpolatedClientSettingsModule = require(expChat.ClientSettings.useInterpolatedClientSettings)
local configModule = require(expChat.Config)
local getFocusNavigationStoreModule = require(expChat.Stores.GetFocusNavigationStore)
local getPresetChatStoreModule = require(expChat.Stores.GetPresetChatStore)
local var19 = expChatSharedModule.Logger:new("ExpChat/" .. script.Name)
local autoCastCommand = expChatSharedModule.Commands.autoCastCommand
local RBXWhisperCommand = expChatSharedModule.Commands.Whisper.RBXWhisperCommand
local RBXTeamCommand = expChatSharedModule.Commands.RBXTeamCommand
local localizationModule = require(expChat.Localization)
local getOtherDisplayNameInWhisperChannelModule = require(expChat.getOtherDisplayNameInWhisperChannel)
local channelChipModule = require(script.Parent.ChannelChip)
local autocompleteTextModule = require(expChat.Autocomplete.AutocompleteText)
local presetEntryTextModule = require(expChat.Autocomplete.PresetEntryText)
local presetSearchModule = require(expChat.Autocomplete.PresetSearch)
local constantsModule = require(expChat.PresetChat.Constants)
local sendPresetModule = require(expChat.PresetChat.sendPreset)
local initializeEmojisModule = require(expChat.Autocomplete.Initializations.initializeEmojis)
local initializeCommandsModule = require(expChat.Autocomplete.Initializations.initializeCommands)
local initializeGlobalCommandsModule = require(expChat.Autocomplete.Initializations.initializeGlobalCommands)
local initialCommandsModule = require(expChat.Autocomplete.Initializations.initialCommands)
local sortEmojiResultsCallbackModule = require(expChat.Autocomplete.SortingCallbacks.sortEmojiResultsCallback)
local sortCommandResultsCallbackModule = require(expChat.Autocomplete.SortingCallbacks.sortCommandResultsCallback)
local autocompleteDropdownModule = require(script:FindFirstAncestor("ChatInput").UI.AutocompleteDropdown)
local chatInputBarV2Module = require(script.Parent.ChatInputBarV2)
local chatInputBarV2DictationModule = require(script.Parent.ChatInputBarV2Dictation)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local fFlagExpChatPresetChatAutocompleteEnabledModule = require(expChat.Flags.FFlagExpChatPresetChatAutocompleteEnabled)
local fFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule = require(expChat.Flags.FFlagExpChatPresetChatAutocompleteAnalyticsEnabled)
local fFlagExpChatUniverseChatPresetEnabledModule = require(expChat.Flags.FFlagExpChatUniverseChatPresetEnabled)
local fFlagExpChatUseUnifiedTooltipStore = expChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore
local fFlagExpChatNewInputBarModule = require(expChat.Flags.FFlagExpChatNewInputBar)
local fFlagExpChatNewInputBarDictationModule = require(expChat.Flags.FFlagExpChatNewInputBarDictation)
local fFlagExpChatPresetChatGamepadEnabledModule = require(expChat.Flags.FFlagExpChatPresetChatGamepadEnabled)
local expChatPresetChatIXPExposure = game:DefineFastFlag("ExpChatPresetChatIXPExposure", false)
local expChatPresetChatIXPLayerName = game:DefineFastString("ExpChatPresetChatIXPLayerName", "UniverseChat.PresetChat")
local expChatDictationIXPExposure = game:DefineFastFlag("ExpChatDictationIXPExposure", false)
local expChatDictationIXPLayerName = game:DefineFastString("ExpChatDictationIXPLayerName", "UniverseChat.Dictation")
local expChatPresetAutocompleteIxpEnabled = game:DefineFastFlag("ExpChatPresetAutocompleteIxpEnabled", false)
local expChatPresetAutocompleteIxpLayer = game:DefineFastString("ExpChatPresetAutocompleteIxpLayer", "")
local expChatMainInputBarClickAnalytics = game:DefineFastFlag("ExpChatMainInputBarClickAnalytics", false)
local getEnableChatInputBarConfigurationAutocompleteEnabledModule = require(expChat.Flags.getEnableChatInputBarConfigurationAutocompleteEnabled)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagChromeChatGamepadSupportFix = sharedFlagsModule.FFlagChromeChatGamepadSupportFix
local fFlagConsoleChatUseChromeFocusUtils = sharedFlagsModule.FFlagConsoleChatUseChromeFocusUtils
local fFlagExpChatFocusViaLastModeFixModule = require(expChat.Flags.FFlagExpChatFocusViaLastModeFix)
local chatOptimizeCommandProcessing = game:DefineFastFlag("ChatOptimizeCommandProcessing", false)
local expChatFocusablePlaceholderText = game:DefineFastFlag("ExpChatFocusablePlaceholderText", false)
local expChatDoNotSetCursorPosition = game:DefineFastFlag("ExpChatDoNotSetCursorPosition", false)
local fFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule = require(expChat.Flags.FFlagExpChatBackspaceExitsTargetChannelInGlobalTabs)
local fFlagExpChatFixBackspaceNilTargetChannel = expChatSharedModule.Flags.FFlagExpChatFixBackspaceNilTargetChannel
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local fFlagExpChatDictation = sharedFlagsModule.FFlagExpChatDictation
local fFlagExpChatDictation_1 = fFlagExpChatDictation or sharedFlagsModule.FFlagExpChatContinuousDictation
local dictationInputBarModule = require(script.Parent.Dictation.DictationInputBar)
local useSendTelemetryModule = require(script.Parent.Dictation.useSendTelemetry)
local usePresetAutocompleteAnalyticsModule = require(script.Parent.usePresetAutocompleteAnalytics)
local actionBindableEvent = expChatSharedModule.ActionBindableEvent
local var61 = getFocusNavigationStoreModule(false)
local var62 = expChatSharedModule.Flags.FIntPresetChatCooldownLuaMs / 1000

local function setTransparency(value, p0) --[[ line: 114 ]]
	return p0:map(function(p1) --[[ line: 115 ]]
		-- upvalues: value (ref)
		return value + p1 * (1 - value)
	end)
end

local var64 = nil
local var65 = nil
local var66 = nil
local var67 = nil
local var68 = nil

local function onChatInputBarFocusLost(p2, p3, p4) --[[ line: 126 ]]
	-- upvalues: userInputService (ref), guiService (ref)
	p3 = p3 or { Enum.KeyCode.ButtonB }
	local var72 = nil
	
	return userInputService.InputBegan:Connect(function(p5) --[[ line: 130 ]]
		-- upvalues: p3 (ref), guiService (copy), p4 (ref), p2 (ref), var72 (write)
		local var73 = if p5 then p5.KeyCode else nil
		
		for i, v in p3 do
			if var73 == v then
				guiService:SetMenuIsOpen(false, "ExperienceChat")
				p4()
				
				if p2 then
					p2()
				else
					guiService.SelectedCoreObject = nil
				end
				if not var72 then break end
				var72:Disconnect()
				var72 = nil
				
				return
			end
		end
	end)
end

local function useEffectChatInputBarFocus(p6, p7, p8, p9, p10) --[[ line: 154 ]]
	-- upvalues: fFlagConsoleChatUseChromeFocusUtils (ref), reactModule (ref), signalsModule (ref), var61 (ref), expChatFocusablePlaceholderText (ref), guiService (ref), userInputService (ref), focusUtils (ref), fFlagChromeChatGamepadSupportFix (ref), fFlagEnableConsoleExpControls (ref), onChatInputBarFocusLost (ref), actionBindableEvent (ref)
	if fFlagConsoleChatUseChromeFocusUtils then
		reactModule.useEffect(function() --[[ line: 156 ]]
			-- upvalues: signalsModule (copy), var61 (copy), p7 (ref), p6 (ref), expChatFocusablePlaceholderText (copy), p8 (ref), guiService (copy), p9 (ref), userInputService (copy), focusUtils (copy), p10 (ref)
			local t = {}
			local var75 = nil
			local var76 = signalsModule.createEffect(function(p11) --[[ line: 160 ]]
				-- upvalues: var61 (copy), p7 (copy), p6 (copy), expChatFocusablePlaceholderText (copy), p8 (copy), guiService (copy), p9 (copy), var75 (write), userInputService (copy), t (ref), focusUtils (copy), p10 (copy)
				local chatInputBarFocused = var61.getChatInputBarFocused(p11)
				local var78 = if p7.current then p7.current else p6.current
				
				if expChatFocusablePlaceholderText then
					var78 = var78 or p8.current
				end
				if not var78 then return end
				if chatInputBarFocused then
					guiService:SetMenuIsOpen(true, "ExperienceChat")
					p9()
					guiService.SelectedCoreObject = var78
					
					if var75 then
						return
					else
						var75 = userInputService.InputBegan:Connect(function(p12) --[[ line: 182 ]]
							-- upvalues: t (copy), focusUtils (copy), var61 (copy)
							if p12 and t[p12.KeyCode] then
								focusUtils.FocusOnChrome(function() --[[ line: 185 ]]
									-- upvalues: var61 (copy)
									var61.unfocusChatInputBar()
								end, "chat")
							end
						end)
						
						return
					end
				elseif guiService.MenuIsOpen then
					guiService:SetMenuIsOpen(false, "ExperienceChat")
					p10()
					
					if var75 then
						var75:Disconnect()
						var75 = nil
					end
				end
			end)
			
			return function() --[[ line: 201 ]]
				-- upvalues: var76 (ref), var75 (write)
				var76()
				
				if var75 then
					var75:Disconnect()
					var75 = nil
				end
			end
		end, {})
		
		return
	elseif fFlagChromeChatGamepadSupportFix then
		reactModule.useEffect(function() --[[ line: 211 ]]
			-- upvalues: p7 (ref), p6 (ref), fFlagEnableConsoleExpControls (copy), guiService (copy), p9 (ref), onChatInputBarFocusLost (copy), p10 (ref), actionBindableEvent (copy)
			local var79 = nil
			local var80 = nil
			local eventConnection = actionBindableEvent.Event:Connect(function(p13) --[[ line: 215 ]]
				-- upvalues: p7 (copy), p6 (copy), fFlagEnableConsoleExpControls (copy), guiService (copy), p9 (copy), var80 (write), var79 (write), onChatInputBarFocusLost (copy), p10 (copy)
				local var82 = if p7.current then p7.current else p6.current
				
				if fFlagEnableConsoleExpControls and p13.type == "ChatTopBarFocusSelect" and var82 then
					guiService:SetMenuIsOpen(true, "ExperienceChat")
					p9()
					guiService.SelectedCoreObject = var82
					var80 = task.delay(0, function() --[[ line: 227 ]]
						-- upvalues: var80 (copy), var79 (copy), onChatInputBarFocusLost (copy), p13 (ref), p10 (copy)
						var80 = nil
						
						if var79 then
							var79:Disconnect()
						end
						var79 = onChatInputBarFocusLost(p13.onSelectionLost, p13.keybinds, p10)
					end)
				end
			end)
			
			return function() --[[ line: 241 ]]
				-- upvalues: eventConnection (ref), var80 (write), var79 (write)
				eventConnection:disconnect()
				
				if var80 then
					task.cancel(var80)
					var80 = nil
				end
				if var79 then
					var79:Disconnect()
					var79 = nil
				end
			end
		end, { p6.current, p7.current })
	end
end

return reactModule.memo(localizationModule.connect(function(p48) --[[ line: 1795 ]]
	-- upvalues: getOtherDisplayNameInWhisperChannelModule (ref)
	local list = nil
	
	if p48.targetTextChannel then
		for i, v in pairs({
			RBXTeam = "CoreScripts.TextChat.TeamChat.PrefixText",
			RBXWhisper = "CoreScripts.TextChat.WhisperChat.PrefixText.Outgoing"
		}) do
			if string.match(p48.targetTextChannel.Name, i) then
				if i == "RBXWhisper" then
					local var224 = getOtherDisplayNameInWhisperChannelModule(p48.targetTextChannel, p48.localPlayer)
					
					if var224 then
						list = { v, { RBX_NAME = var224 } }
					end
				else
					list = v
				end
			end
		end
	end
	return { targetTextChannelDisplayName = list }
end)(function(p14) --[[ line: 257 | named "ChatInputBar" ]]
	-- upvalues: reactModule (ref), fFlagExpChatUseUnifiedTooltipStore (ref), getChatTooltipStoreModule (ref), expChatMainInputBarClickAnalytics (ref), fFlagExpChatDictation_1 (ref), useSendTelemetryModule (ref), reactFocusNavigationModule (ref), fFlagExpChatFocusViaLastModeFixModule (ref), focusNavigationUtilsModule (ref), signalsReactModule (ref), var61 (ref), fFlagExpChatUseMessagesStore (ref), getMessagesStoreModule (ref), fFlagExpChatPresetChatEnabled (ref), getPresetChatStoreModule (ref), textChatService (ref), var65 (write), autocompleteTextModule (ref), initializeCommandsModule (ref), getEnableChatInputBarConfigurationAutocompleteEnabledModule (ref), var64 (write), initializeEmojisModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), var66 (write), initializeGlobalCommandsModule (ref), initialCommandsModule (ref), var19 (ref), fFlagExpChatDictation (ref), fFlagExpChatPresetChatGamepadEnabledModule (ref), guiService (ref), fFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule (ref), usePresetAutocompleteAnalyticsModule (ref), presetSearchModule (ref), var62 (ref), sendPresetModule (ref), expChatSharedModule (ref), constantsModule (ref), fFlagExpChatPresetChatAutocompleteEnabledModule (ref), presetEntryTextModule (ref), expChatDoNotSetCursorPosition (ref), expChatPresetChatIXPExposure (ref), IXPServiceWrapper (ref), expChatPresetChatIXPLayerName (ref), fFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule (ref), fFlagExpChatFixBackspaceNilTargetChannel (ref), configModule (ref), playersService (ref), fFlagEnableConsoleExpControls (ref), fFlagChromeChatGamepadSupportFix (ref), onChatInputBarFocusLost (ref), actionBindableEvent (ref), useEffectChatInputBarFocus (ref), fFlagExpChatUniverseChatPresetEnabledModule (ref), sortCommandResultsCallbackModule (ref), sortEmojiResultsCallbackModule (ref), list (ref), var67 (write), RBXTeamCommand (ref), var68 (write), RBXWhisperCommand (ref), chatOptimizeCommandProcessing (ref), autoCastCommand (ref), promiseModule (ref), useCursor (ref), expChatDictationIXPExposure (ref), expChatDictationIXPLayerName (ref), expChatPresetAutocompleteIxpEnabled (ref), expChatPresetAutocompleteIxpLayer (ref), useInterpolatedClientSettingsModule (ref), fFlagExpChatNewInputBarModule (ref), autocompleteDropdownModule (ref), setTransparency (ref), fFlagExpChatNewInputBarDictationModule (ref), chatInputBarV2DictationModule (ref), chatInputBarV2Module (ref), dictationInputBarModule (ref), expChatFocusablePlaceholderText (ref), channelChipModule (ref), imageSetLabel (ref), images (ref)
	local var83 = reactModule.useRef("")
	
	if fFlagExpChatUseUnifiedTooltipStore then
		local setIsChatInputBarVisible = getChatTooltipStoreModule(false).setIsChatInputBarVisible
		reactModule.useEffect(function() --[[ line: 265 ]]
			-- upvalues: p14 (ref), setIsChatInputBarVisible (ref)
			if p14.visible == nil then
				setIsChatInputBarVisible(true)
			else
				setIsChatInputBarVisible(p14.visible)
			end
			return function() --[[ line: 274 ]]
				-- upvalues: setIsChatInputBarVisible (copy)
				setIsChatInputBarVisible(false)
			end
		end, { p14.visible, setIsChatInputBarVisible })
	end
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var84, var85 = reactModule.useState("")
	local var86, var87 = reactModule.useState(0)
	local var88 = var86
	local var89 = var87
	local var90, var91 = reactModule.useState(0)
	local var92 = var90
	local var93 = var91
	local var94 = if expChatMainInputBarClickAnalytics then reactModule.useRef(false) else nil
	local var95, var96 = reactModule.useState(false)
	local var97, _ = reactModule.useState(true)
	local var98, var99 = reactModule.useBinding(0)
	local var100 = reactModule.useRef(false)
	local var101 = reactModule.useRef(nil)
	local var102 = reactModule.useRef(nil)
	local var103 = if fFlagExpChatDictation_1 then useSendTelemetryModule({
		enabled = fFlagExpChatDictation_1,
		textBoxRef = var101,
		customTextBoxRef = var102
	}) else nil
	local var104 = reactModule.useRef(nil)
	local var105 = reactModule.useRef(nil)
	local var106 = reactModule.useRef(nil)
	local var107 = reactModule.useRef(nil)
	local var108 = reactModule.useRef(false)
	local var109 = reactFocusNavigationModule.useFocusGuiObject()
	local var110 = if not fFlagExpChatFocusViaLastModeFixModule then focusNavigationUtilsModule.useLastInputMode() else nil
	local var111 = if fFlagExpChatFocusViaLastModeFixModule then signalsReactModule.useSignalState(var61.getChatInputBarFocused) else nil
	local var112 = nil
	local _ = nil
	
	if fFlagExpChatUseMessagesStore then
		var112 = signalsReactModule.useSignalState(getMessagesStoreModule(false).getCanLocalUserChat)
	end
	local var113 = if fFlagExpChatPresetChatEnabled then signalsReactModule.useSignalState(getPresetChatStoreModule(false).getIsTrayOpen) else nil
	local var114 = if fFlagExpChatPresetChatEnabled then signalsReactModule.useSignalState(getPresetChatStoreModule(false).getIsEnabled) else nil
	local var115 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 343 ]]
		-- upvalues: var102 (ref), p14 (ref)
		var102.current = p14.chatInputBarSettings.TextBox
	end, {
		if p14.chatInputBarSettings.TextBox ~= nil then "nil" else p14.chatInputBarSettings.TextBox
	})
	reactModule.useEffect(function() --[[ line: 348 ]]
		-- upvalues: p14 (ref), textChatService (copy), var65 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy), getEnableChatInputBarConfigurationAutocompleteEnabledModule (copy), var64 (copy), initializeEmojisModule (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var66 (copy), initializeGlobalCommandsModule (copy), initialCommandsModule (copy)
		if not p14.autocompleteEnabled then return end
		local t = {}
		local descendantAddedConnection = textChatService.DescendantAdded:Connect(function(p15) --[[ line: 353 ]]
			-- upvalues: var65 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy), t (ref)
			if p15:IsA("TextChatCommand") and string.sub(p15.PrimaryAlias, 1, 1) == "/" then
				var65 = autocompleteTextModule.new(initializeCommandsModule)
				table.insert(t, p15:GetPropertyChangedSignal("AutocompleteVisible"):Connect(function() --[[ line: 359 ]]
					-- upvalues: var65 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy)
					var65 = autocompleteTextModule.new(initializeCommandsModule)
				end))
			end
		end)
		local descendantRemovingConnection = textChatService.DescendantRemoving:Connect(function(p16) --[[ line: 366 ]]
			-- upvalues: var65 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy)
			if p16:IsA("TextChatCommand") and string.sub(p16.PrimaryAlias, 1, 1) == "/" then
				var65 = autocompleteTextModule.new(initializeCommandsModule)
			end
		end)
		
		if getEnableChatInputBarConfigurationAutocompleteEnabledModule() then
			var65 = autocompleteTextModule.new(initializeCommandsModule)
			var64 = autocompleteTextModule.new(initializeEmojisModule)
			
			if getFFlagTextChatEnableUniverseChatTabs() then
				var66 = autocompleteTextModule.new(initializeGlobalCommandsModule)
			end
			local var170 = initialCommandsModule()
			
			if var170 then
				for i, v in var170 do
					table.insert(t, v:GetPropertyChangedSignal("AutocompleteVisible"):Connect(function() --[[ line: 383 ]]
						-- upvalues: var65 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy)
						var65 = autocompleteTextModule.new(initializeCommandsModule)
					end))
				end
			end
		end
		return function() --[[ line: 391 ]]
			-- upvalues: descendantRemovingConnection (ref), descendantAddedConnection (ref), t (ref)
			if descendantRemovingConnection then
				descendantRemovingConnection:Disconnect()
			end
			descendantAddedConnection:Disconnect()
			
			for i, v in ipairs(t) do
				v:Disconnect()
			end
			table.clear(t)
		end
	end, {})
	local var116 = reactModule.useCallback(function() --[[ line: 404 ]]
		-- upvalues: var19 (copy), var84 (ref), fFlagExpChatUseMessagesStore (copy), var112 (write), p14 (ref), var100 (ref), var101 (ref), var102 (ref), var103 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagExpChatDictation (copy), var85 (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy), var108 (ref)
		var19:trace("onSendActivated with input text: '{}'", var84)
		local var171 = if fFlagExpChatUseMessagesStore then var112 else p14.canLocalUserChat
		
		if not var100.current or not var171 then
			var19:debug("onSendActivated could not send message. isMounted: {} canLocalUserChat: {}", tostring(var100.current), var171)
			
			return
		elseif var101.current or var102.current then
			local var172 = if var102.current then var102.current.Text else var101.current.Text
			local var173 = if var103 then var103.consumeOnSend(var172) else nil
			local var174 = if getFFlagTextChatEnableUniverseChatTabs() and p14.isGlobalChatTabActive and p14.onSendGlobalChat then p14.onSendGlobalChat else p14.onSendChat
			
			if not var174 or string.find(var172, "%S") == nil then
				var19:debug("onSendActivated could not send message. text: '{}' canLocalUserChat: {}", var172, var171)
			elseif fFlagExpChatDictation then
				var174(var172, var173, var173 ~= nil)
			else
				var174(var172)
			end
			if var102.current then
				var102.current.Text = ""
				var102.current:ReleaseFocus()
			end
			if var101.current then
				var101.current.Text = ""
				var101.current:ReleaseFocus()
			end
			var85("")
			
			if fFlagExpChatPresetChatGamepadEnabledModule then
				local current = var102.current or var101.current
				
				if current then
					guiService.SelectedCoreObject = current
				end
			end
			if p14.targetTextChannel and p14.targetTextChannelDisplayName ~= "" then
				var108.current = true
				
				return
			end
		else
			var19:debug("onSendActivated could not send message because textBoxRef.current was nil")
		end
	end, {
		var84, var102.current, var112, p14.canLocalUserChat, p14.isGlobalChatTabActive,
		p14.onSendChat or false, p14.onSendGlobalChat or false,
		p14.targetTextChannel or false, p14.targetTextChannelDisplayName,
		if var103 then var103.consumeOnSend else false
	})
	local var117 = if fFlagExpChatDictation_1 then reactModule.useCallback(function(p17) --[[ line: 491 ]]
		-- upvalues: fFlagExpChatUseMessagesStore (copy), var112 (write), p14 (ref), var100 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var102 (ref), var101 (ref), var85 (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy), var108 (ref)
		if not var100.current or not (if fFlagExpChatUseMessagesStore then var112 else p14.canLocalUserChat) then return end
		local var176 = if p17 then p17.textSent else ""
		local var177 = if getFFlagTextChatEnableUniverseChatTabs() and p14.isGlobalChatTabActive and p14.onSendGlobalChat then p14.onSendGlobalChat else p14.onSendChat
		
		if var177 and string.find(var176, "%S") ~= nil then
			var177(var176, p17, true)
		end
		if var102.current then
			var102.current.Text = ""
			var102.current:ReleaseFocus()
		end
		if var101.current then
			var101.current.Text = ""
			var101.current:ReleaseFocus()
		end
		var85("")
		
		if fFlagExpChatPresetChatGamepadEnabledModule then
			local current = var102.current or var101.current
			
			if current then
				guiService.SelectedCoreObject = current
			end
		end
		if p14.targetTextChannel and p14.targetTextChannelDisplayName ~= "" then
			var108.current = true
		end
	end, {
		var102.current, var112, p14.canLocalUserChat, p14.isGlobalChatTabActive,
		p14.onSendChat or false, p14.onSendGlobalChat or false,
		p14.targetTextChannel or false, p14.targetTextChannelDisplayName
	}) else nil
	local var118 = if fFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule then usePresetAutocompleteAnalyticsModule({
		isFocused = var95,
		autocompleteEnabled = p14.autocompleteEnabled,
		autocompleteDropdownReducer = p14.autocompleteDropdownReducer
	}).recordPresetChosen else nil
	
	local function sendSelectedPreset(value) --[[ line: 548 ]]
		-- upvalues: getPresetChatStoreModule (copy), presetSearchModule (copy), var19 (copy), var62 (copy), sendPresetModule (copy), p14 (ref), expChatSharedModule (copy), constantsModule (copy), fFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule (copy)
		local var179 = getPresetChatStoreModule(false)
		local presetIdForValue = presetSearchModule.getPresetIdForValue(var179, value)
		
		if presetIdForValue == nil then
			var19:warning("Could not resolve a preset id for autocomplete entry '{}'; skipping send.", value)
			
			return
		end
		var179.setPresetCooldownEndsAt(os.clock() + var62)
		local var181 = sendPresetModule(presetIdForValue, p14.targetTextChannel)
		
		if var181 == "Sent" then
			expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
				event_type = constantsModule.Analytics.EventTypes.Click,
				component = if fFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule then constantsModule.Analytics.Components.AutocompleteDropdown else constantsModule.Analytics.Components.PresetAutocomplete,
				preset_id = presetIdForValue
			}, if fFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule then constantsModule.Analytics.ExtendedStandardizedFields else expChatSharedModule.Analytics.DefaultStandardizedFields)
			
			return
		end
		var179.setPresetCooldownEndsAt(nil)
		var19:warning("Could not send preset {} from autocomplete: {}", presetIdForValue, var181)
	end
	
	local var120 = reactModule.useCallback(function(p18) --[[ line: 586 ]]
		-- upvalues: fFlagExpChatPresetChatAutocompleteEnabledModule (copy), p14 (ref), presetEntryTextModule (copy), fFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule (copy), var118 (write), var102 (ref), var101 (ref), var88 (write), var85 (ref), var100 (ref), expChatMainInputBarClickAnalytics (copy), var94 (ref), fFlagExpChatFocusViaLastModeFixModule (copy), var111 (ref), var109 (ref), var110 (ref), expChatDoNotSetCursorPosition (copy), sendSelectedPreset (ref), var19 (copy)
		local var182 = if fFlagExpChatPresetChatAutocompleteEnabledModule and p14.autocompleteDropdownReducer.autocompleteType == "presets" then presetEntryTextModule.undecorate(p18.TextLabel.Text, p14.chatInputBarSettings.TextSize) else nil
		
		if fFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule and var118 ~= nil and var182 ~= nil then
			var118(var182)
		end
		p14.autocompleteDropdownActivated(false)
		p14.autocompleteDropdownResultsChanged({})
		local var183 = if var102.current then var102.current else var101.current
		
		if var183 then
			local text = var183.Text
			local substring = string.sub(text, 1, var88 - 1)
			local var185 = if fFlagExpChatPresetChatAutocompleteEnabledModule and var182 ~= nil then "" else string.sub(text, var88, #text)
			local var186 = ""
			
			if p14.autocompleteDropdownReducer.autocompleteType == "emojis" then
				var186 = string.gsub(substring, ":[^:]*$", p18.EmojiLabel.Text)
			elseif p14.autocompleteDropdownReducer.autocompleteType == "commands" then
				var186 = string.gsub(substring, "(/.*)", p18.TextLabel.Text)
			end
			if var185 ~= "" then
				var186 ..= var185
			end
			var183.Text = var186
			var85(var186)
			
			if var100.current then
				if expChatMainInputBarClickAnalytics and var94 and not var183:IsFocused() then
					var94.current = true
				end
				var183:CaptureFocus()
				
				if fFlagExpChatFocusViaLastModeFixModule then
					if var111 then
						var109(var183)
					end
				elseif var110 == "Focus" then
					var109(var183)
				end
				if var185 ~= "" and not expChatDoNotSetCursorPosition then
					var183.CursorPosition = #var186 - #var185 + 1
				end
			end
			p14.autocompleteDropdownDeactivated()
			
			if fFlagExpChatPresetChatAutocompleteEnabledModule and var182 ~= nil then
				sendSelectedPreset(var182)
				
				return
			end
		else
			var19:error("Could not find textBox")
		end
	end, {
		if fFlagExpChatFocusViaLastModeFixModule then var111 else nil, var109, var97,
		var88, if fFlagExpChatFocusViaLastModeFixModule then nil else var110,
		p14.autocompleteDropdownActivated, p14.autocompleteDropdownDeactivated,
		p14.autocompleteDropdownReducer and p14.autocompleteDropdownReducer.autocompleteType,
		p14.autocompleteDropdownResultsChanged,
		if fFlagExpChatPresetChatAutocompleteEnabledModule then p14.targetTextChannel or false else nil,
		if fFlagExpChatPresetChatAutocompleteEnabledModule then p14.chatInputBarSettings.TextSize else nil,
		if fFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule then var118 else nil
	})
	reactModule.useEffect(function() --[[ line: 696 ]]
		-- upvalues: var100 (ref), var102 (ref), var101 (ref), var19 (copy)
		if var100.current then
			local var187 = if var102.current then var102.current else var101.current
			
			if var187 then
				var187:CaptureFocus()
				
				return
			end
			var19:error("Could not focus chat input bar because textBox not found")
		end
	end, { p14.shouldFocusChatInputBar, var102.current })
	
	if fFlagExpChatPresetChatEnabled then
		reactModule.useEffect(function() --[[ line: 708 ]]
			-- upvalues: var113 (ref), var102 (ref), var101 (ref)
			if not var113 then return end
			local var188 = if var102.current then var102.current else var101.current
			
			if var188 and var188:IsFocused() then
				var188:ReleaseFocus()
			end
		end, { var113 })
	end
	local createElement_1
	reactModule.useEffect(function() --[[ line: 719 ]]
		-- upvalues: var19 (copy), var100 (ref), expChatPresetChatIXPExposure (copy), IXPServiceWrapper (copy), expChatPresetChatIXPLayerName (copy)
		var19:trace("Mounted")
		var100.current = true
		
		if expChatPresetChatIXPExposure then
			IXPServiceWrapper:LogUserLayerExposure(expChatPresetChatIXPLayerName)
		end
		return function() --[[ line: 727 ]]
			-- upvalues: var19 (copy), var100 (copy)
			var19:trace("Unmounting")
			var100.current = false
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 733 ]]
		-- upvalues: p14 (ref), var102 (ref), var101 (ref), var89 (write)
		local var189 = nil
		
		if p14.autocompleteEnabled then
			local var190 = if var102.current then var102.current else var101.current
			
			if var190 then
				var189 = var190:GetPropertyChangedSignal("CursorPosition"):Connect(function() --[[ line: 738 ]]
					-- upvalues: var190 (ref), var89 (copy)
					local cursorPosition = var190.CursorPosition
					
					if cursorPosition and cursorPosition ~= -1 then
						var89(cursorPosition)
					end
				end)
			end
		end
		return function() --[[ line: 747 ]]
			-- upvalues: var189 (write)
			if var189 then
				var189:Disconnect()
			end
		end
	end, { var102.current })
	reactModule.useEffect(function() --[[ line: 755 ]]
		-- upvalues: p14 (ref), var107 (ref)
		if p14.autocompleteEnabled then
			var107.current = p14.userInputService.InputBegan:connect(function(p19, _) --[[ line: 757 ]]
				-- upvalues: p14 (copy)
				if p14.autocompleteDropdownReducer.activated and (Enum.KeyCode.Up or Enum.KeyCode.Down) then
					if p19 and p19.KeyCode == Enum.KeyCode.Up and p14.autocompleteDropdownReducer.selectedIndex > 1 then
						p14.autocompleteDropdownSelectionChanged(p14.autocompleteDropdownReducer.selectedIndex - 1)
					end
					if p19 and p19.KeyCode == Enum.KeyCode.Down and p14.autocompleteDropdownReducer.selectedIndex < #p14.autocompleteDropdownReducer.results then
						p14.autocompleteDropdownSelectionChanged(p14.autocompleteDropdownReducer.selectedIndex + 1)
					end
				end
			end)
			
			return function() --[[ line: 779 ]]
				-- upvalues: var107 (copy)
				local current = var107.current
				
				if current and current.Connected then
					current:Disconnect()
				end
				var107.current = nil
			end
		end
		return function() --[[ line: 787 ]] end
	end, { p14.userInputService, p14.autocompleteDropdownReducer })
	reactModule.useEffect(function() --[[ line: 791 ]]
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), p14 (ref), fFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule (copy), var106 (ref), var102 (ref), var101 (ref), var108 (ref), fFlagExpChatFixBackspaceNilTargetChannel (copy), var19 (copy), var84 (ref)
		local var191 = if fFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule then not p14.isChannelBarVisible or getFFlagTextChatEnableUniverseChatTabs() and not p14.developerChannelTabsEnabled else not p14.isChannelBarVisible
		var106.current = p14.userInputService.InputEnded:connect(function(p20, _) --[[ line: 799 ]]
			-- upvalues: var102 (copy), var101 (copy), p14 (copy), var108 (copy), var191 (ref), fFlagExpChatFixBackspaceNilTargetChannel (copy), var19 (copy), var84 (copy)
			local current
			if var102.current then
				current = var102.current
				
				if current then
					current = var102.current:IsFocused()
					
					if current then
						current = p20
						
						if current then
							current = p20.KeyCode == Enum.KeyCode.Backspace
							current = nil
						end
					end
				end
			else
				current = var101.current and (var101.current:IsFocused() and (p20 and p20.KeyCode == Enum.KeyCode.Backspace))
			end
			if current then
				local var192 = (p14.targetTextChannelDisplayName or "") ~= ""
				
				if var108.current and var191 and (if fFlagExpChatFixBackspaceNilTargetChannel then var192 else true) then
					p14.resetTargetChannel(if fFlagExpChatFixBackspaceNilTargetChannel then p14.isGlobalChatTabActive else nil)
					var19:debug("ChatInputBar ChatInputBarResetTargetChannel()")
					var108.current = false
					
					return
				elseif var84 == "" and (if fFlagExpChatFixBackspaceNilTargetChannel then var192 else p14.targetTextChannelDisplayName ~= "") then
					var108.current = true
				end
			end
		end)
		
		return function() --[[ line: 840 ]]
			-- upvalues: var106 (copy)
			local current = var106.current
			
			if current and current.Connected then
				current:Disconnect()
			end
			var106.current = nil
		end
	end, {
		p14.userInputService, var102.current, p14.isChannelBarVisible,
		p14.targetTextChannelDisplayName, p14.resetTargetChannel,
		if fFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule then p14.developerChannelTabsEnabled else nil,
		if fFlagExpChatFixBackspaceNilTargetChannel then p14.isGlobalChatTabActive else nil
	})
	reactModule.useEffect(function() --[[ line: 858 ]]
		-- upvalues: p14 (ref), configModule (copy), var102 (ref), var101 (ref), var115 (ref)
		p14.contextActionService:BindCoreAction("FocusChat", function(_, p21, p22) --[[ line: 859 | named "handleAction" ]]
			-- upvalues: p14 (copy), configModule (copy), var102 (copy), var101 (copy), var115 (copy)
			if p14.isChatHotkeyEnabled and p22 and (p22.KeyCode == configModule.ChatInputBarDefaultFocusKeyCode or p22.KeyCode == p14.devDefinedFocusKeyCode) then
				local var193 = if var102.current then var102.current else var101.current
				
				if var193 and p21 == Enum.UserInputState.Begin and (var193 and not var193:IsFocused()) then
					task.delay(0, function() --[[ line: 881 ]]
						-- upvalues: var193 (ref)
						var193:CaptureFocus()
					end)
					p14.focusChatHotKeyActivated()
					var115.current = true
					
					return Enum.ContextActionResult.Sink
				end
			end
			return Enum.ContextActionResult.Pass
		end, false, Enum.UserInputType.Keyboard)
		
		return function() --[[ line: 905 ]]
			-- upvalues: p14 (copy)
			p14.contextActionService:UnbindCoreAction("FocusChat")
		end
	end, {
		p14.isChatHotkeyEnabled,
		p14.devDefinedFocusKeyCode,
		var115.current,
		var102.current
	})
	
	local _ = function(p23) --[[ line: 912 ]]
		-- upvalues: textChatService (copy)
		local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		
		if chatInputBarConfiguration then
			chatInputBarConfiguration.IsFocusedWrite = p23
		end
	end
	
	local var121 = reactModule.useCallback(function() --[[ line: 919 ]]
		-- upvalues: var96 (ref), p14 (ref), textChatService (copy), expChatMainInputBarClickAnalytics (copy), var94 (ref), expChatSharedModule (copy), constantsModule (copy)
		var96(true)
		p14.onFocus()
		local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		
		if chatInputBarConfiguration then
			chatInputBarConfiguration.IsFocusedWrite = true
		end
		if expChatMainInputBarClickAnalytics and var94 then
			if var94.current then
				var94.current = false
				
				return
			end
			expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
				event_type = constantsModule.Analytics.EventTypes.Click,
				component = constantsModule.Analytics.Components.MainInputBar
			}, constantsModule.Analytics.ExtendedStandardizedFields)
		end
	end, { p14.onFocus })
	local var122 = reactModule.useCallback(function(_, p24, p25) --[[ line: 943 ]]
		-- upvalues: var19 (copy), var105 (ref), p14 (ref), fFlagExpChatPresetChatAutocompleteEnabledModule (copy), var120 (ref), var116 (ref), var100 (ref), var102 (ref), var101 (ref), var88 (write), expChatMainInputBarClickAnalytics (copy), var94 (ref), expChatDoNotSetCursorPosition (copy), var96 (ref), textChatService (copy), var115 (ref), playersService (copy)
		local v
		var19:debug("Focus lost with enter: {}", tostring(p24))
		local current = var105.current
		
		if p24 or p25 and (p25.KeyCode == Enum.KeyCode.Return or p25.KeyCode == Enum.KeyCode.KeypadEnter) then
			if p14.autocompleteEnabled and current and (p14.autocompleteDropdownReducer.activated and #p14.autocompleteDropdownReducer.results > 0) and (not fFlagExpChatPresetChatAutocompleteEnabledModule or p14.autocompleteDropdownReducer.selectedIndex > 0) then
				for i, v in ipairs(current.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame:GetChildren()) do
					if v.ClassName == "Frame" and v.LayoutOrder == p14.autocompleteDropdownReducer.selectedIndex then
						var120(v.TextLabelButton)
						
						return
					end
				end
			else
				local x, y
				var116()
				
				if fFlagExpChatPresetChatAutocompleteEnabledModule and p14.autocompleteEnabled and p14.autocompleteDropdownReducer.autocompleteType == "presets" then
					p14.autocompleteDropdownDeactivated()
				end
			end
		end
		if var100.current then
			if not p14.autocompleteEnabled or not current or not p14.autocompleteDropdownReducer.activated then
				var96(false)
			elseif p25 then
				if p25.KeyCode == Enum.KeyCode.Escape then
					p14.autocompleteDropdownActivated(false)
					local var196 = if var102.current then var102.current else var101.current
					
					if var196 then
						local var197 = var88
						
						if expChatMainInputBarClickAnalytics and var94 and not var196:IsFocused() then
							var94.current = true
						end
						var196:CaptureFocus()
						
						if not expChatDoNotSetCursorPosition then
							var196.CursorPosition = var197
						end
						return
					else
						var19:error("Could not focus chat input bar because textBox not found")
					end
				else
					x = p25.Position.X
					y = p25.Position.Y
					local x_1 = current.AbsolutePosition.X
					local var198 = x_1 + current.AbsoluteSize.X
					local y_1 = current.AbsolutePosition.Y
					v = y_1 + current.AbsoluteSize.Y
					
					if x < x_1 or var198 < x or (y < y_1 or v < y) then
						p14.autocompleteDropdownActivated(false)
					end
				end
			end
		end
		p14.onUnfocus()
		x = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		
		if x then
			x.IsFocusedWrite = false
		end
		if var115.current then
			x = playersService.LocalPlayer
			
			if x then
				y = Instance.new("TextBox")
				y.Visible = false
				y.Parent = x:FindFirstChildOfClass("PlayerGui")
				y:CaptureFocus()
				y:ReleaseFocus()
				y:Destroy()
			end
			var115.current = false
		end
	end)
	reactModule.useEffect(function() --[[ line: 1072 ]]
		-- upvalues: fFlagEnableConsoleExpControls (copy), var102 (ref), var101 (ref), fFlagChromeChatGamepadSupportFix (copy), guiService (copy), var121 (ref), onChatInputBarFocusLost (copy), var122 (ref), actionBindableEvent (copy)
		local var199 = nil
		local var200 = nil
		local eventConnection = actionBindableEvent.Event:Connect(function(p26) --[[ line: 1076 ]]
			-- upvalues: fFlagEnableConsoleExpControls (copy), var102 (copy), var101 (copy), fFlagChromeChatGamepadSupportFix (copy), guiService (copy), var121 (copy), var200 (write), var199 (write), onChatInputBarFocusLost (copy), var122 (copy)
			local var202 = if fFlagEnableConsoleExpControls then if var102.current then var102.current else var101.current else nil
			
			if p26.type == "ChatTopBarFocusActivated" then
				if not fFlagEnableConsoleExpControls then
					var202 = if var102.current then var102.current else var101.current
				end
				if var202 then
					task.delay(0, function() --[[ line: 1087 ]]
						-- upvalues: var202 (write)
						var202:CaptureFocus()
					end)
				end
			elseif not fFlagChromeChatGamepadSupportFix and fFlagEnableConsoleExpControls and (p26.type == "ChatTopBarFocusSelect" and var202) then
				guiService:SetMenuIsOpen(true, "ExperienceChat")
				var121()
				guiService.SelectedCoreObject = var202
				var200 = task.delay(0, function() --[[ line: 1102 ]]
					-- upvalues: var200 (copy), var199 (copy), onChatInputBarFocusLost (copy), p26 (ref), var122 (copy)
					var200 = nil
					
					if var199 then
						var199:Disconnect()
					end
					var199 = onChatInputBarFocusLost(p26.onSelectionLost, p26.keybinds, var122)
				end)
			end
		end)
		
		return function() --[[ line: 1116 ]]
			-- upvalues: eventConnection (ref), var200 (write), var199 (write)
			eventConnection:disconnect()
			
			if var200 then
				task.cancel(var200)
				var200 = nil
			end
			if var199 then
				var199:Disconnect()
				var199 = nil
			end
		end
	end, { var101.current, var102.current })
	useEffectChatInputBarFocus(var101, var102, var104, var121, var122)
	
	local function handlePresetAutocomplete(value, p27) --[[ line: 1137 ]]
		-- upvalues: p14 (ref), fFlagExpChatUniverseChatPresetEnabledModule (copy), presetSearchModule (copy), getPresetChatStoreModule (copy)
		if p27 < 1 then return end
		local var203 = if not (p14.targetTextChannel == nil and not fFlagExpChatUniverseChatPresetEnabledModule) then presetSearchModule.findMatchingPresets(getPresetChatStoreModule(false), string.sub(value, 1, p27 - 1)) else {}
		
		if #var203 == 0 then
			if p14.autocompleteDropdownReducer.autocompleteType == "presets" then
				p14.autocompleteDropdownDeactivated()
			end
			return
		else
			p14.autocompleteDropdownTypeChanged("presets")
			p14.autocompleteDropdownActivated(true)
			p14.autocompleteDropdownResultsChanged(var203)
			p14.autocompleteDropdownSelectionChanged(0)
		end
	end
	
	local function handleAutocomplete(p28, p29, p30) --[[ line: 1174 ]]
		-- upvalues: p14 (ref), var66 (copy), var65 (copy), sortCommandResultsCallbackModule (copy), var64 (copy), sortEmojiResultsCallbackModule (copy), var92 (write), list (copy), var85 (ref), expChatDoNotSetCursorPosition (copy), var105 (ref), var120 (ref), var93 (write), fFlagExpChatPresetChatAutocompleteEnabledModule (copy), handlePresetAutocomplete (ref)
		if p30 == "/" and p28.CursorPosition == 2 or p14.autocompleteDropdownReducer.autocompleteType == "commands" and p30 ~= ":" then
			p14.autocompleteDropdownTypeChanged("commands")
			p14.autocompleteDropdownActivated(true)
			
			if p30 == "" or p30 == " " then
				p14.autocompleteDropdownDeactivated()
			else
				local var204 = string.sub(p29, 1, p28.CursorPosition - 1):lower()
				local var205 = (if p14.isGlobalChatTabActive and var66 then var66 else var65):getResults(var204, sortCommandResultsCallbackModule)
				p14.autocompleteDropdownResultsChanged(var205)
				
				if var204 == var205[1] then
					p14.autocompleteDropdownActivated(false)
					p14.autocompleteDropdownResultsChanged({})
					
					return
				end
			end
			return
		elseif (p14.autocompleteDropdownReducer.activated or #p14.autocompleteDropdownReducer.results > 0) and p14.autocompleteDropdownReducer.autocompleteType == "emojis" then
			p14.autocompleteDropdownActivated(true)
			local matchIndex = string.find(string.sub(p29, 1, p28.CursorPosition - 1), ":[^:]*$")
			
			if p30 == "" or p30 == ":" or (p30 == " " or not matchIndex) then
				if p30 == ":" then
					if matchIndex == var92 then
						p14.autocompleteDropdownResultsChanged({})
						
						return
					end
					local var208 = string.sub(p29, var92 + 1, p28.CursorPosition - 2):lower()
					
					if list.includes(p14.autocompleteDropdownReducer.results, var208) then
						local text = string.sub(p29, 1, p28.CursorPosition - 2) .. string.sub(p29, p28.CursorPosition, #p29)
						p28.Text = text
						var85(text)
						
						if not expChatDoNotSetCursorPosition then
							p28.CursorPosition -= 1
						end
						local current = var105.current
						
						if current then
							for i, v in ipairs(current.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame:GetChildren()) do
								if v.ClassName == "Frame" then
									local textLabelButton = v:FindFirstChild("TextLabelButton")
									
									if textLabelButton then
										local textLabel = textLabelButton:FindFirstChild("TextLabel")
										
										if textLabel and textLabel.Text and textLabel.Text == var208 then
											var120(textLabelButton)
											
											return
										end
									end
								end
							end
							return
						else
							return
						end
					else
						p14.autocompleteDropdownActivated(false)
						p14.autocompleteDropdownResultsChanged({})
					end
				elseif p30 == " " then
					p14.autocompleteDropdownActivated(false)
					p14.autocompleteDropdownResultsChanged({})
					
					return
				end
				p14.autocompleteDropdownDeactivated()
				var93(0)
				
				return
			else
				local var207 = string.sub(p29, matchIndex + 1, p28.CursorPosition - 1):lower()
				p14.autocompleteDropdownResultsChanged(if var207 and string.len(var207) > 1 then var64:getResults(var207, sortEmojiResultsCallbackModule) else {})
				
				return
			end
		else
			local matchIndex = string.find(p29, ":[^:]*$")
			
			if p30 == ":" then
				p14.autocompleteDropdownTypeChanged("emojis")
				p14.autocompleteDropdownActivated(true)
				p14.autocompleteDropdownResultsChanged({})
				var93(matchIndex)
				
				return
			elseif fFlagExpChatPresetChatAutocompleteEnabledModule then
				handlePresetAutocomplete(p29, p28.CursorPosition)
			end
		end
	end
	
	reactModule.useEffect(function() --[[ line: 1293 ]]
		-- upvalues: textChatService (copy), var67 (copy), RBXTeamCommand (copy), var68 (copy), RBXWhisperCommand (copy)
		if textChatService.CreateDefaultCommands then
			var67 = textChatService:FindFirstChild(RBXTeamCommand.name, true)
			var68 = textChatService:FindFirstChild(RBXWhisperCommand.name, true)
		end
	end, {})
	local var125 = reactModule.useCallback(function(p31) --[[ line: 1300 ]]
		-- upvalues: p14 (ref), var85 (ref), var19 (copy), var84 (ref), getEnableChatInputBarConfigurationAutocompleteEnabledModule (copy), handleAutocomplete (ref), var108 (ref), chatOptimizeCommandProcessing (copy), var83 (ref), var67 (copy), autoCastCommand (copy), RBXTeamCommand (copy), var68 (copy), RBXWhisperCommand (copy), promiseModule (copy)
		local text = p31.Text
		
		if p14.autocompleteEnabled then
			local var213 = p31.CursorPosition < #text + 1
			
			if string.find(text, "\r") then
				local replaced = string.gsub(text, "\r", "")
				p31.Text = replaced
				var85(replaced)
				
				if var213 then
					p31.CursorPosition -= 1
				end
				return
			else
				local substring = string.sub(text, p31.CursorPosition - 1, p31.CursorPosition - 1)
				var19:trace("Input: {}", text)
				local var216 = if utf8.len(text) then utf8.len(utf8.nfcnormalize(text)) else string.len(text)
				
				if var216 and p14.messageCharacterLimit < var216 then
					var19:debug("Message is over the character limit of {}", tostring(p14.messageCharacterLimit))
					p31.Text = var84
					
					return
				end
				var85(text)
				
				if getEnableChatInputBarConfigurationAutocompleteEnabledModule() and p14.autocompleteEnabled then
					handleAutocomplete(p31, text, substring)
				end
				var108.current = #text == 0 and var108.current
				
				if chatOptimizeCommandProcessing then
					if string.sub(text, 1, 1) == "/" and p14.localPlayer and text ~= var83.current then
						var83.current = text
						local userId = p14.localPlayer.UserId
						local t = {}
						
						if var67 and var67.Enabled then
							table.insert(t, autoCastCommand(RBXTeamCommand, userId, text))
						end
						if var68 and var68.Enabled then
							table.insert(t, autoCastCommand(RBXWhisperCommand, userId, text))
						end
						if #t == 0 then
							t = { promiseModule.reject() }
						end
						promiseModule.any(t):andThen(function() --[[ line: 1356 ]]
							-- upvalues: p31 (ref), var85 (copy), var108 (copy)
							p31.Text = ""
							var85("")
							var108.current = true
						end):catch(function(p32) --[[ line: 1362 ]]
							-- upvalues: var19 (copy)
							var19:trace("Could not send autoCastCommand. Error: {}", p32)
						end)
						
						return
					elseif string.sub(text, 1, 1) == "/" then
						return
					else
						var83.current = ""
						
						return
					end
				elseif p14.localPlayer then
					local userId = p14.localPlayer.UserId
					local t = {}
					
					if var67 and var67.Enabled then
						table.insert(t, autoCastCommand(RBXTeamCommand, userId, text))
					end
					if var68 and var68.Enabled then
						table.insert(t, autoCastCommand(RBXWhisperCommand, userId, text))
					end
					if #t == 0 then
						t = { promiseModule.reject() }
					end
					promiseModule.any(t):andThen(function() --[[ line: 1385 ]]
						-- upvalues: p31 (ref), var85 (copy), var108 (copy)
						p31.Text = ""
						var85("")
						var108.current = true
					end):catch(function(p33) --[[ line: 1391 ]]
						-- upvalues: var19 (copy)
						var19:trace("Could not send autoCastCommand. Error: {}", p33)
					end)
				end
			end
		end
	end)
	local var126 = reactModule.useCallback(function() --[[ line: 1398 ]]
		-- upvalues: var102 (ref), var101 (ref)
		local var219 = if var102.current then var102.current else var101.current
		
		if var219 then
			var219:ReleaseFocus(true)
		end
	end, { var101.current, var102.current })
	local var127 = reactModule.useCallback(function(p34) --[[ line: 1405 ]]
		-- upvalues: var99 (ref)
		var99(if p34.Visible then p34.AbsoluteSize.X else 0)
	end)
	local var128 = useCursor()
	local var129 = reactModule.useCallback(function(p35) --[[ line: 1411 ]]
		-- upvalues: p14 (ref)
		p14.autocompleteDropdownSelectionChanged(p35.LayoutOrder)
	end)
	local var130 = var84 == ""
	local var131 = var130 and not var95
	local chatInputBarSettings = p14.chatInputBarSettings
	local chatWindowSettings = p14.chatWindowSettings
	local var132 = if fFlagExpChatUseMessagesStore and var112 ~= nil then var112 else p14.canLocalUserChat
	reactModule.useEffect(function() --[[ line: 1426 ]]
		-- upvalues: expChatDictationIXPExposure (copy), var132 (ref), IXPServiceWrapper (copy), expChatDictationIXPLayerName (copy)
		if expChatDictationIXPExposure and var132 then
			IXPServiceWrapper:LogUserLayerExposure(expChatDictationIXPLayerName)
		end
	end, { var132 })
	reactModule.useEffect(function() --[[ line: 1432 ]]
		-- upvalues: expChatPresetAutocompleteIxpEnabled (copy), var95 (ref), getEnableChatInputBarConfigurationAutocompleteEnabledModule (copy), p14 (ref), getPresetChatStoreModule (copy), constantsModule (copy), IXPServiceWrapper (copy), expChatPresetAutocompleteIxpLayer (copy)
		if not expChatPresetAutocompleteIxpEnabled or not var95 then return end
		if not getEnableChatInputBarConfigurationAutocompleteEnabledModule() or not p14.autocompleteEnabled then return end
		local var220 = getPresetChatStoreModule(false)
		
		if var220.getIsEnabled(false) and var220.getAccessLevel(false) == constantsModule.AccessLevel.Enabled then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(expChatPresetAutocompleteIxpLayer)
			
			return
		end
	end, { var95, p14.autocompleteEnabled, var114 })
	local backgroundTransparency = useInterpolatedClientSettingsModule(chatInputBarSettings).BackgroundTransparency
	local backgroundTransparency_1 = useInterpolatedClientSettingsModule(chatWindowSettings).BackgroundTransparency
	local backgroundColor3 = useInterpolatedClientSettingsModule(chatWindowSettings).BackgroundColor3
	local isSpatialUIEnabled = p14.isSpatialUIEnabled
	local createElement = reactModule.createElement
	local var133 = "Frame"
	local t = {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = backgroundColor3,
		BackgroundTransparency = if fFlagExpChatNewInputBarModule then 1 else p14.transparencyValue:map(function(p36) --[[ line: 115 ]]
			-- upvalues: backgroundTransparency_1 (ref)
			return backgroundTransparency_1 + p36 * (1 - backgroundTransparency_1)
		end),
		BorderSizePixel = 0,
		LayoutOrder = p14.LayoutOrder,
		Size = p14.size,
		Visible = p14.visible,
		ZIndex = 2,
		[reactModule.Event.MouseEnter] = p14.onHovered,
		[reactModule.Event.MouseLeave] = p14.onUnhovered,
		[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p37) --[[ line: 1472 ]]
			-- upvalues: textChatService (copy), p14 (ref)
			local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			
			if chatInputBarConfiguration and p14.onAbsoluteSizeChanged then
				p14.onAbsoluteSizeChanged(p37, chatInputBarConfiguration)
			end
		end),
		[reactModule.Change.AbsolutePosition] = reactModule.useCallback(function(p38) --[[ line: 1478 ]]
			-- upvalues: textChatService (copy), p14 (ref)
			local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			
			if chatInputBarConfiguration and p14.onAbsolutePositionChanged then
				p14.onAbsolutePositionChanged(p38, chatInputBarConfiguration)
			end
		end)
	}
	local t_1 = {
		AutocompleteDropdown = getEnableChatInputBarConfigurationAutocompleteEnabledModule() and (p14.autocompleteEnabled and (reactModule.createElement(autocompleteDropdownModule, {
			chatInputBarSettings = chatInputBarSettings,
			chatWindowSettings = chatWindowSettings,
			setTransparency = setTransparency,
			transparencyValue = p14.transparencyValue,
			activated = p14.autocompleteDropdownReducer.activated and var95,
			results = p14.autocompleteDropdownReducer.results,
			selectedIndex = p14.autocompleteDropdownReducer.selectedIndex,
			autocompleteType = p14.autocompleteDropdownReducer.autocompleteType,
			onAutocompleteDropdownHover = var129,
			onAutocompleteSelected = var120,
			autocompleteDropdownRef = var105,
			textBoxRef = if chatInputBarSettings.TextBox then var102 else var101
		}) or nil)),
		UISizeConstraint = reactModule.createElement("UISizeConstraint", {
			MaxSize = Vector2.new(configModule.ChatWindowMaxWidth, 1e999)
		}),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = if fFlagExpChatNewInputBarModule then nil else UDim.new(0, 8),
			PaddingRight = if fFlagExpChatNewInputBarModule then nil else UDim.new(0, 8),
			PaddingTop = p14.addTopPadding and UDim.new(0, 8) or UDim.new(0, 0),
			PaddingBottom = UDim.new(0, 1)
		}),
		ChatInputBarV2 = if not fFlagExpChatNewInputBarModule then if fFlagExpChatNewInputBarDictationModule and fFlagExpChatDictation_1 and var132 then reactModule.createElement(chatInputBarV2DictationModule, {
			transparencyValue = p14.transparencyValue,
			sendButtonContainerWidth = p14.sendButtonContainerWidth,
			resetTargetChannel = p14.resetTargetChannel,
			targetTextChannel = p14.targetTextChannel,
			targetTextChannelDisplayName = p14.targetTextChannelDisplayName,
			isChannelBarVisible = p14.isChannelBarVisible,
			developerChannelTabsEnabled = p14.developerChannelTabsEnabled,
			canLocalUserChat = p14.canLocalUserChat,
			disabledChatPlaceholderText = p14.disabledChatPlaceholderText,
			placeholderText = p14.placeholderText,
			setTransparency = setTransparency,
			chatInputBarSettings = chatInputBarSettings,
			chatInputBarBackgroundTransparency = backgroundTransparency,
			isSpatialUIEnabled = isSpatialUIEnabled,
			canLocalUserChatDerived = var112,
			targetChannelWidth = var98,
			showPlaceholderText = var131,
			hasEmptyInputText = var130,
			shouldTruncatePlaceholder = if fFlagExpChatPresetChatEnabled then var114 else nil,
			cursor = var128,
			placeholderRef = var104,
			textBoxRef = var101,
			customTextBoxRef = var102,
			onAbsoluteSizeChanged = var127,
			onFocused = var121,
			onFocusLost = var122,
			onTextChanged = var125,
			onReturnPressedFromOnScreenKeyboard = var126,
			onSendActivated = var116,
			onSendRecordingTap = var117,
			onTranscriptionStaged = if var103 then var103.stageTranscription else nil,
			inputText = var84,
			setInputText = var85,
			isGlobalChatTabActive = p14.isGlobalChatTabActive,
			onDictationActivityChanged = p14.onDictationActivityChanged
		}) else reactModule.createElement(chatInputBarV2Module, {
			transparencyValue = p14.transparencyValue,
			sendButtonContainerWidth = p14.sendButtonContainerWidth,
			resetTargetChannel = p14.resetTargetChannel,
			targetTextChannel = p14.targetTextChannel,
			targetTextChannelDisplayName = p14.targetTextChannelDisplayName,
			isChannelBarVisible = p14.isChannelBarVisible,
			developerChannelTabsEnabled = p14.developerChannelTabsEnabled,
			canLocalUserChat = p14.canLocalUserChat,
			disabledChatPlaceholderText = p14.disabledChatPlaceholderText,
			placeholderText = p14.placeholderText,
			setTransparency = setTransparency,
			chatInputBarSettings = chatInputBarSettings,
			chatInputBarBackgroundTransparency = backgroundTransparency,
			isSpatialUIEnabled = isSpatialUIEnabled,
			canLocalUserChatDerived = var112,
			targetChannelWidth = var98,
			showPlaceholderText = var131,
			hasEmptyInputText = var130,
			shouldTruncatePlaceholder = if fFlagExpChatPresetChatEnabled then var114 else nil,
			cursor = var128,
			placeholderRef = var104,
			textBoxRef = var101,
			customTextBoxRef = var102,
			onAbsoluteSizeChanged = var127,
			onFocused = var121,
			onFocusLost = var122,
			onTextChanged = var125,
			onReturnPressedFromOnScreenKeyboard = var126,
			onSendActivated = var116,
			isGlobalChatTabActive = if fFlagExpChatFixBackspaceNilTargetChannel then p14.isGlobalChatTabActive else nil
		}) else nil
	}
	
	if fFlagExpChatNewInputBarModule then
		createElement_1 = nil
	elseif fFlagExpChatDictation_1 and var132 then
		createElement_1 = reactModule.createElement(dictationInputBarModule, {
			chatInputBarSettings = chatInputBarSettings,
			transparencyValue = p14.transparencyValue,
			chatInputBarBackgroundTransparency = backgroundTransparency,
			inputText = var84,
			setInputText = var85,
			canLocalUserChat = var132,
			disabledChatPlaceholderText = p14.disabledChatPlaceholderText,
			targetChannelWidth = var98,
			showPlaceholderText = var131,
			placeholderText = p14.placeholderText,
			cursor = var128,
			placeholderRef = if expChatFocusablePlaceholderText then var104 else nil,
			textBoxRef = var101,
			customTextBoxRef = var102,
			onFocused = var121,
			onFocusLost = var122,
			onTextChanged = var125,
			onReturnPressedFromOnScreenKeyboard = var126,
			onChannelChipAbsoluteSizeChanged = var127,
			onChannelChipActivated = if fFlagExpChatFixBackspaceNilTargetChannel then function() --[[ line: 1617 ]]
				-- upvalues: p14 (ref)
				p14.resetTargetChannel(p14.isGlobalChatTabActive)
			end else p14.resetTargetChannel,
			targetTextChannel = p14.targetTextChannel,
			targetTextChannelDisplayName = p14.targetTextChannelDisplayName or "",
			isChannelBarVisible = p14.isChannelBarVisible,
			isGlobalChatTabActive = p14.isGlobalChatTabActive,
			developerChannelTabsEnabled = p14.developerChannelTabsEnabled,
			onDictationActivityChanged = p14.onDictationActivityChanged,
			onSendActivated = var116,
			onSendRecordingTap = var117,
			onTranscriptionStaged = if var103 then var103.stageTranscription else nil,
			isSpatialUIEnabled = isSpatialUIEnabled,
			isTextBoxSelectable = if fFlagEnableConsoleExpControls then true else nil,
			isPlaceholderSelectable = if expChatFocusablePlaceholderText then true else nil,
			placeholderSelectionImageObject = if expChatFocusablePlaceholderText then var128 else nil
		})
	else
		createElement_1 = reactModule.createElement
		local var136 = "Frame"
		local t_2 = {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = chatInputBarSettings.BackgroundColor3,
			BackgroundTransparency = if fFlagExpChatNewInputBarModule then 1 else p14.transparencyValue:map(function(p39) --[[ line: 115 ]]
				-- upvalues: backgroundTransparency (ref)
				return backgroundTransparency + p39 * (1 - backgroundTransparency)
			end),
			Size = UDim2.new(1, 0, 0, 0)
		}
		local t_3 = {}
		local createElement_2 = reactModule.createElement
		local var139 = "UIStroke"
		local t_4 = {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = configModule.ChatInputBarBorderColor3
		}
		local chatInputBarBorderTransparency = configModule.ChatInputBarBorderTransparency
		t_4.Transparency = p14.transparencyValue:map(function(p40) --[[ line: 115 ]]
			-- upvalues: chatInputBarBorderTransparency (ref)
			return chatInputBarBorderTransparency + p40 * (1 - chatInputBarBorderTransparency)
		end)
		t_3.Border = createElement_2(var139, t_4)
		t_3.Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 3) })
		local createElement_3 = reactModule.createElement
		local var141 = "Frame"
		local t_5 = {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}
		local t_6 = {}
		local createElement_4 = reactModule.createElement
		local var144 = "Frame"
		local t_7 = {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, -p14.sendButtonContainerWidth, 0, 0)
		}
		local t_8 = {}
		local createElement_5 = reactModule.createElement
		local t_9 = {}
		local var148 = 0
		t_9.transparency = p14.transparencyValue:map(function(p41) --[[ line: 115 ]]
			-- upvalues: var148 (ref)
			return var148 + p41 * (1 - var148)
		end)
		t_9.onAbsoluteSizeChanged = var127
		t_9.onChannelChipActivated = if fFlagExpChatFixBackspaceNilTargetChannel then function() --[[ line: 1665 ]]
			-- upvalues: p14 (ref)
			p14.resetTargetChannel(p14.isGlobalChatTabActive)
		end else p14.resetTargetChannel
		t_9.targetTextChannelDisplayName = p14.targetTextChannelDisplayName or ""
		t_9.isChannelBarVisible = p14.isChannelBarVisible
		t_9.developerChannelTabsEnabled = p14.developerChannelTabsEnabled
		t_8.TargetChannelChip = createElement_5(channelChipModule, t_9)
		local var149 = if fFlagExpChatUseMessagesStore then not var112 else not p14.canLocalUserChat
		
		if var149 then
			var149 = reactModule.createElement
			local var150 = "TextLabel"
			local t_10 = {
				BackgroundTransparency = 1,
				TextWrapped = true,
				AnchorPoint = Vector2.new(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Font = configModule.ChatInputBarFont,
				Text = p14.disabledChatPlaceholderText,
				Position = UDim2.fromScale(1, 0),
				Size = var98:map(function(p42) --[[ line: 1682 ]]
					return UDim2.new(1, -(p42 + 8), 0, 0)
				end),
				TextColor3 = if var131 then chatInputBarSettings.PlaceholderColor3 else chatInputBarSettings.TextColor3,
				TextSize = if isSpatialUIEnabled then chatInputBarSettings.SpatialPanelTextSize else chatInputBarSettings.TextSize
			}
			local var152 = if var131 then 0.5 else 0
			t_10.TextTransparency = p14.transparencyValue:map(function(p43) --[[ line: 115 ]]
				-- upvalues: var152 (ref)
				return var152 + p43 * (1 - var152)
			end)
			t_10.Selectable = if expChatFocusablePlaceholderText then true else nil
			t_10.SelectionImageObject = if expChatFocusablePlaceholderText then var128 else nil
			t_10.TextXAlignment = Enum.TextXAlignment.Left
			t_10.TextYAlignment = Enum.TextYAlignment.Top
			t_10.ref = if expChatFocusablePlaceholderText then var104 else nil
			var149 = var149(var150, t_10)
		end
		t_8.DisabledPlaceholderLabel = var149
		local var153 = if fFlagExpChatUseMessagesStore then var112 else p14.canLocalUserChat
		
		if var153 then
			var153 = reactModule.createElement
			local var154 = "Frame"
			local t_10 = {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Position = UDim2.fromScale(1, 0),
				Size = var98:map(function(p44) --[[ line: 1710 ]]
					return UDim2.new(1, -(p44 + 8), 0, 0)
				end)
			}
			local t_11 = {}
			local var157 = if fFlagExpChatUseMessagesStore then var112 else p14.canLocalUserChat
			
			if var157 then
				var157 = reactModule.createElement
				local var158 = "TextBox"
				local t_12 = {
					AnchorPoint = Vector2.new(0, 0),
					AutomaticSize = Enum.AutomaticSize.XY,
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					FontFace = chatInputBarSettings.FontFace,
					PlaceholderText = if var131 then p14.placeholderText else "",
					Selectable = if fFlagEnableConsoleExpControls then true else nil,
					SelectionImageObject = var128,
					Size = UDim2.fromScale(1, 0),
					Text = "",
					PlaceholderColor3 = chatInputBarSettings.PlaceholderColor3,
					TextColor3 = chatInputBarSettings.TextColor3,
					TextSize = if isSpatialUIEnabled then chatInputBarSettings.SpatialPanelTextSize else chatInputBarSettings.TextSize
				}
				local var160 = if var131 then 0.5 else 0
				t_12.TextTransparency = p14.transparencyValue:map(function(p45) --[[ line: 115 ]]
					-- upvalues: var160 (ref)
					return var160 + p45 * (1 - var160)
				end)
				local textStrokeTransparency = chatInputBarSettings.TextStrokeTransparency
				t_12.TextStrokeTransparency = p14.transparencyValue:map(function(p46) --[[ line: 115 ]]
					-- upvalues: textStrokeTransparency (ref)
					return textStrokeTransparency + p46 * (1 - textStrokeTransparency)
				end)
				t_12.TextStrokeColor3 = chatInputBarSettings.TextStrokeColor3
				t_12.TextWrapped = true
				t_12.TextXAlignment = Enum.TextXAlignment.Left
				t_12.TextYAlignment = Enum.TextYAlignment.Top
				t_12.ZIndex = 2
				t_12[reactModule.Event.Focused] = var121
				t_12[reactModule.Event.FocusLost] = var122
				t_12[reactModule.Change.Text] = var125
				t_12[reactModule.Event.ReturnPressedFromOnScreenKeyboard] = var126
				t_12.ref = if chatInputBarSettings.TextBox then var102 else var101
				var157 = var157(var158, t_12)
			end
			t_11.TextBox = var157
			var153 = var153(var154, t_10, t_11)
		end
		t_8.TextBoxContainer = var153
		t_8.UIPadding = reactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 10),
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10)
		})
		t_6.TextContainer = createElement_4(var144, t_7, t_8)
		local createElement_6 = reactModule.createElement
		local var161 = "TextButton"
		local t_10 = {
			AnchorPoint = Vector2.new(1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Position = UDim2.fromScale(1, 0),
			Selectable = false,
			Size = UDim2.new(0, p14.sendButtonContainerWidth, 1, 0),
			Text = "",
			[reactModule.Event.Activated] = var116
		}
		local t_11 = {
			Layout = reactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			})
		}
		local createElement_7 = reactModule.createElement
		local var164 = imageSetLabel
		local t_12 = {
			BackgroundTransparency = 1,
			ZIndex = 2,
			ImageColor3 = if var130 then chatInputBarSettings.PlaceholderColor3 else chatInputBarSettings.TextColor3
		}
		local var166 = if var130 then 0.5 else 0
		t_12.ImageTransparency = p14.transparencyValue:map(function(p47) --[[ line: 115 ]]
			-- upvalues: var166 (ref)
			return var166 + p47 * (1 - var166)
		end)
		t_12.Image = images["icons/actions/send"]
		t_12.Size = UDim2.new(0, 30, 0, 30)
		t_11.SendIcon = createElement_7(var164, t_12)
		t_6.SendButton = createElement_6(var161, t_10, t_11)
		t_3.Container = createElement_3(var141, t_5, t_6)
		createElement_1 = createElement_1(var136, t_2, t_3)
	end
	t_1.Background = createElement_1
	
	return createElement(var133, t, t_1)
end))