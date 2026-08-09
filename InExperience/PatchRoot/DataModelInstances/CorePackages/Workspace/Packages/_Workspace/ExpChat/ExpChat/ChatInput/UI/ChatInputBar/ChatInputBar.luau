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
local IXPServiceWrapperModule = require(expChat.IXPServiceWrapper)
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
local var20 = expChatSharedModule.Logger:new("ExpChat/" .. script.Name)
local autoCastCommand = expChatSharedModule.Commands.autoCastCommand
local RBXWhisperCommand = expChatSharedModule.Commands.Whisper.RBXWhisperCommand
local RBXTeamCommand = expChatSharedModule.Commands.RBXTeamCommand
local localizationModule = require(expChat.Localization)
local getOtherDisplayNameInWhisperChannelModule = require(expChat.getOtherDisplayNameInWhisperChannel)
local channelChipModule = require(script.Parent.ChannelChip)
local autocompleteTextModule = require(expChat.Autocomplete.AutocompleteText)
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
local fFlagExpChatUseUnifiedTooltipStore = expChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore
local fFlagExpChatNewInputBarModule = require(expChat.Flags.FFlagExpChatNewInputBar)
local fFlagExpChatNewInputBarDictationModule = require(expChat.Flags.FFlagExpChatNewInputBarDictation)
local fFlagExpChatPresetChatGamepadEnabledModule = require(expChat.Flags.FFlagExpChatPresetChatGamepadEnabled)
local expChatPresetChatIXPExposure = game:DefineFastFlag("ExpChatPresetChatIXPExposure", false)
local expChatPresetChatIXPLayerName = game:DefineFastString("ExpChatPresetChatIXPLayerName", "UniverseChat.PresetChat")
local expChatDictationIXPExposure = game:DefineFastFlag("ExpChatDictationIXPExposure", false)
local expChatDictationIXPLayerName = game:DefineFastString("ExpChatDictationIXPLayerName", "UniverseChat.Dictation")
local getEnableChatInputBarConfigurationAutocompleteEnabledModule = require(expChat.Flags.getEnableChatInputBarConfigurationAutocompleteEnabled)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagChromeChatGamepadSupportFix = sharedFlagsModule.FFlagChromeChatGamepadSupportFix
local fFlagConsoleChatUseChromeFocusUtils = sharedFlagsModule.FFlagConsoleChatUseChromeFocusUtils
local fFlagExpChatEnableFocusNavigationModule = require(expChat.Flags.FFlagExpChatEnableFocusNavigation)
local fFlagExpChatFocusViaLastModeFixModule = require(expChat.Flags.FFlagExpChatFocusViaLastModeFix)
local chatOptimizeCommandProcessing = game:DefineFastFlag("ChatOptimizeCommandProcessing", false)
local expChatFocusablePlaceholderText = game:DefineFastFlag("ExpChatFocusablePlaceholderText", false)
local expChatDoNotSetCursorPosition = game:DefineFastFlag("ExpChatDoNotSetCursorPosition", false)
local fFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule = require(expChat.Flags.FFlagExpChatBackspaceExitsTargetChannelInGlobalTabs)
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local fFlagExpChatDictation = sharedFlagsModule.FFlagExpChatDictation
local fFlagExpChatDictation_1 = fFlagExpChatDictation or sharedFlagsModule.FFlagExpChatContinuousDictation
local dictationInputBarModule = require(script.Parent.Dictation.DictationInputBar)
local useSendTelemetryModule = require(script.Parent.Dictation.useSendTelemetry)
local actionBindableEvent = expChatSharedModule.ActionBindableEvent
local var52 = getFocusNavigationStoreModule(false)

local function setTransparency(value, p0) --[[ line: 98 ]]
	return p0:map(function(p1) --[[ line: 99 ]]
		-- upvalues: value (ref)
		return value + p1 * (1 - value)
	end)
end

local var54 = nil
local var55 = nil
local var56 = nil
local var57 = nil
local var58 = nil

local function onChatInputBarFocusLost(p2, p3, p4) --[[ line: 110 ]]
	-- upvalues: userInputService (ref), guiService (ref)
	p3 = p3 or { Enum.KeyCode.ButtonB }
	local var62 = nil
	
	return userInputService.InputBegan:Connect(function(p5) --[[ line: 114 ]]
		-- upvalues: p3 (ref), guiService (copy), p4 (ref), p2 (ref), var62 (write)
		local var63 = if p5 then p5.KeyCode else nil
		
		for i, v in p3 do
			if var63 == v then
				guiService:SetMenuIsOpen(false, "ExperienceChat")
				p4()
				
				if p2 then
					p2()
				else
					guiService.SelectedCoreObject = nil
				end
				if not var62 then break end
				var62:Disconnect()
				var62 = nil
				
				return
			end
		end
	end)
end

local function useEffectChatInputBarFocus(p6, p7, p8, p9, p10) --[[ line: 138 ]]
	-- upvalues: fFlagConsoleChatUseChromeFocusUtils (ref), reactModule (ref), fFlagExpChatEnableFocusNavigationModule (ref), signalsModule (ref), var52 (ref), expChatFocusablePlaceholderText (ref), guiService (ref), userInputService (ref), focusUtils (ref), fFlagChromeChatGamepadSupportFix (ref), fFlagEnableConsoleExpControls (ref), onChatInputBarFocusLost (ref), actionBindableEvent (ref)
	if fFlagConsoleChatUseChromeFocusUtils then
		reactModule.useEffect(function() --[[ line: 140 ]]
			-- upvalues: fFlagExpChatEnableFocusNavigationModule (copy), signalsModule (copy), var52 (copy), p7 (ref), p6 (ref), expChatFocusablePlaceholderText (copy), p8 (ref), guiService (copy), p9 (ref), userInputService (copy), focusUtils (copy), p10 (ref)
			local t = {
				[Enum.KeyCode.DPadUp] = if fFlagExpChatEnableFocusNavigationModule then nil else true
			}
			local var65 = nil
			local var66 = signalsModule.createEffect(function(p11) --[[ line: 146 ]]
				-- upvalues: var52 (copy), p7 (copy), p6 (copy), expChatFocusablePlaceholderText (copy), p8 (copy), guiService (copy), p9 (copy), var65 (write), userInputService (copy), t (ref), focusUtils (copy), p10 (copy)
				local chatInputBarFocused = var52.getChatInputBarFocused(p11)
				local var68 = if p7.current then p7.current else p6.current
				
				if expChatFocusablePlaceholderText then
					var68 = var68 or p8.current
				end
				if not var68 then return end
				if chatInputBarFocused then
					guiService:SetMenuIsOpen(true, "ExperienceChat")
					p9()
					guiService.SelectedCoreObject = var68
					
					if var65 then
						return
					else
						var65 = userInputService.InputBegan:Connect(function(p12) --[[ line: 168 ]]
							-- upvalues: t (copy), focusUtils (copy), var52 (copy)
							if p12 and t[p12.KeyCode] then
								focusUtils.FocusOnChrome(function() --[[ line: 171 ]]
									-- upvalues: var52 (copy)
									var52.unfocusChatInputBar()
								end, "chat")
							end
						end)
						
						return
					end
				elseif guiService.MenuIsOpen then
					guiService:SetMenuIsOpen(false, "ExperienceChat")
					p10()
					
					if var65 then
						var65:Disconnect()
						var65 = nil
					end
				end
			end)
			
			return function() --[[ line: 187 ]]
				-- upvalues: var66 (ref), var65 (write)
				var66()
				
				if var65 then
					var65:Disconnect()
					var65 = nil
				end
			end
		end, {})
		
		return
	elseif fFlagChromeChatGamepadSupportFix then
		reactModule.useEffect(function() --[[ line: 197 ]]
			-- upvalues: p7 (ref), p6 (ref), fFlagEnableConsoleExpControls (copy), guiService (copy), p9 (ref), onChatInputBarFocusLost (copy), p10 (ref), actionBindableEvent (copy)
			local var69 = nil
			local var70 = nil
			local eventConnection = actionBindableEvent.Event:Connect(function(p13) --[[ line: 201 ]]
				-- upvalues: p7 (copy), p6 (copy), fFlagEnableConsoleExpControls (copy), guiService (copy), p9 (copy), var70 (write), var69 (write), onChatInputBarFocusLost (copy), p10 (copy)
				local var72 = if p7.current then p7.current else p6.current
				
				if fFlagEnableConsoleExpControls and p13.type == "ChatTopBarFocusSelect" and var72 then
					guiService:SetMenuIsOpen(true, "ExperienceChat")
					p9()
					guiService.SelectedCoreObject = var72
					var70 = task.delay(0, function() --[[ line: 213 ]]
						-- upvalues: var70 (copy), var69 (copy), onChatInputBarFocusLost (copy), p13 (ref), p10 (copy)
						var70 = nil
						
						if var69 then
							var69:Disconnect()
						end
						var69 = onChatInputBarFocusLost(p13.onSelectionLost, p13.keybinds, p10)
					end)
				end
			end)
			
			return function() --[[ line: 227 ]]
				-- upvalues: eventConnection (ref), var70 (write), var69 (write)
				eventConnection:disconnect()
				
				if var70 then
					task.cancel(var70)
					var70 = nil
				end
				if var69 then
					var69:Disconnect()
					var69 = nil
				end
			end
		end, { p6.current, p7.current })
	end
end

return reactModule.memo(localizationModule.connect(function(p47) --[[ line: 1588 ]]
	-- upvalues: getOtherDisplayNameInWhisperChannelModule (ref)
	local list = nil
	
	if p47.targetTextChannel then
		for i, v in pairs({
			RBXTeam = "CoreScripts.TextChat.TeamChat.PrefixText",
			RBXWhisper = "CoreScripts.TextChat.WhisperChat.PrefixText.Outgoing"
		}) do
			if string.match(p47.targetTextChannel.Name, i) then
				if i == "RBXWhisper" then
					local var203 = getOtherDisplayNameInWhisperChannelModule(p47.targetTextChannel, p47.localPlayer)
					
					if var203 then
						list = { v, { RBX_NAME = var203 } }
					end
				else
					list = v
				end
			end
		end
	end
	return { targetTextChannelDisplayName = list }
end)(function(p14) --[[ line: 243 | named "ChatInputBar" ]]
	-- upvalues: reactModule (ref), fFlagExpChatUseUnifiedTooltipStore (ref), getChatTooltipStoreModule (ref), fFlagExpChatDictation_1 (ref), useSendTelemetryModule (ref), fFlagExpChatEnableFocusNavigationModule (ref), reactFocusNavigationModule (ref), fFlagExpChatFocusViaLastModeFixModule (ref), focusNavigationUtilsModule (ref), signalsReactModule (ref), var52 (ref), fFlagExpChatUseMessagesStore (ref), getMessagesStoreModule (ref), fFlagExpChatPresetChatEnabled (ref), getPresetChatStoreModule (ref), textChatService (ref), var55 (write), autocompleteTextModule (ref), initializeCommandsModule (ref), getEnableChatInputBarConfigurationAutocompleteEnabledModule (ref), var54 (write), initializeEmojisModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), var56 (write), initializeGlobalCommandsModule (ref), initialCommandsModule (ref), var20 (ref), fFlagExpChatDictation (ref), fFlagExpChatPresetChatGamepadEnabledModule (ref), guiService (ref), expChatDoNotSetCursorPosition (ref), expChatPresetChatIXPExposure (ref), IXPServiceWrapperModule (ref), expChatPresetChatIXPLayerName (ref), fFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule (ref), configModule (ref), playersService (ref), fFlagEnableConsoleExpControls (ref), fFlagChromeChatGamepadSupportFix (ref), onChatInputBarFocusLost (ref), actionBindableEvent (ref), useEffectChatInputBarFocus (ref), sortCommandResultsCallbackModule (ref), sortEmojiResultsCallbackModule (ref), list (ref), var57 (write), RBXTeamCommand (ref), var58 (write), RBXWhisperCommand (ref), chatOptimizeCommandProcessing (ref), autoCastCommand (ref), promiseModule (ref), useCursor (ref), expChatDictationIXPExposure (ref), expChatDictationIXPLayerName (ref), useInterpolatedClientSettingsModule (ref), fFlagExpChatNewInputBarModule (ref), autocompleteDropdownModule (ref), setTransparency (ref), fFlagExpChatNewInputBarDictationModule (ref), chatInputBarV2DictationModule (ref), chatInputBarV2Module (ref), dictationInputBarModule (ref), expChatFocusablePlaceholderText (ref), channelChipModule (ref), imageSetLabel (ref), images (ref)
	local var73 = reactModule.useRef("")
	
	if fFlagExpChatUseUnifiedTooltipStore then
		local setIsChatInputBarVisible = getChatTooltipStoreModule(false).setIsChatInputBarVisible
		reactModule.useEffect(function() --[[ line: 251 ]]
			-- upvalues: p14 (ref), setIsChatInputBarVisible (ref)
			if p14.visible == nil then
				setIsChatInputBarVisible(true)
			else
				setIsChatInputBarVisible(p14.visible)
			end
			return function() --[[ line: 260 ]]
				-- upvalues: setIsChatInputBarVisible (copy)
				setIsChatInputBarVisible(false)
			end
		end, { p14.visible, setIsChatInputBarVisible })
	end
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var74, var75 = reactModule.useState("")
	local var76, var77 = reactModule.useState(0)
	local var78 = var76
	local var79 = var77
	local var80, var81 = reactModule.useState(0)
	local var82 = var80
	local var83 = var81
	local var84, var85 = reactModule.useState(false)
	local var86, _ = reactModule.useState(true)
	local var87, var88 = reactModule.useBinding(0)
	local var89 = reactModule.useRef(false)
	local var90 = reactModule.useRef(nil)
	local var91 = reactModule.useRef(nil)
	local var92 = if fFlagExpChatDictation_1 then useSendTelemetryModule({
		enabled = fFlagExpChatDictation_1,
		textBoxRef = var90,
		customTextBoxRef = var91
	}) else nil
	local var93 = reactModule.useRef(nil)
	local var94 = reactModule.useRef(nil)
	local var95 = reactModule.useRef(nil)
	local var96 = reactModule.useRef(nil)
	local var97 = reactModule.useRef(false)
	local var98 = if fFlagExpChatEnableFocusNavigationModule then reactFocusNavigationModule.useFocusGuiObject() else nil
	local var99 = if fFlagExpChatEnableFocusNavigationModule and not fFlagExpChatFocusViaLastModeFixModule then focusNavigationUtilsModule.useLastInputMode() else nil
	local var100 = if fFlagExpChatFocusViaLastModeFixModule then signalsReactModule.useSignalState(var52.getChatInputBarFocused) else nil
	local var101 = nil
	local _ = nil
	
	if fFlagExpChatUseMessagesStore then
		var101 = signalsReactModule.useSignalState(getMessagesStoreModule(false).getCanLocalUserChat)
	end
	local var102 = if fFlagExpChatPresetChatEnabled then signalsReactModule.useSignalState(getPresetChatStoreModule(false).getIsTrayOpen) else nil
	local var103 = if fFlagExpChatPresetChatEnabled then signalsReactModule.useSignalState(getPresetChatStoreModule(false).getIsEnabled) else nil
	local var104 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 325 ]]
		-- upvalues: var91 (ref), p14 (ref)
		var91.current = p14.chatInputBarSettings.TextBox
	end, {
		if p14.chatInputBarSettings.TextBox ~= nil then "nil" else p14.chatInputBarSettings.TextBox
	})
	reactModule.useEffect(function() --[[ line: 330 ]]
		-- upvalues: p14 (ref), textChatService (copy), var55 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy), getEnableChatInputBarConfigurationAutocompleteEnabledModule (copy), var54 (copy), initializeEmojisModule (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var56 (copy), initializeGlobalCommandsModule (copy), initialCommandsModule (copy)
		if not p14.autocompleteEnabled then return end
		local t = {}
		local descendantAddedConnection = textChatService.DescendantAdded:Connect(function(p15) --[[ line: 335 ]]
			-- upvalues: var55 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy), t (ref)
			if p15:IsA("TextChatCommand") and string.sub(p15.PrimaryAlias, 1, 1) == "/" then
				var55 = autocompleteTextModule.new(initializeCommandsModule)
				table.insert(t, p15:GetPropertyChangedSignal("AutocompleteVisible"):Connect(function() --[[ line: 341 ]]
					-- upvalues: var55 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy)
					var55 = autocompleteTextModule.new(initializeCommandsModule)
				end))
			end
		end)
		local descendantRemovingConnection = textChatService.DescendantRemoving:Connect(function(p16) --[[ line: 348 ]]
			-- upvalues: var55 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy)
			if p16:IsA("TextChatCommand") and string.sub(p16.PrimaryAlias, 1, 1) == "/" then
				var55 = autocompleteTextModule.new(initializeCommandsModule)
			end
		end)
		
		if getEnableChatInputBarConfigurationAutocompleteEnabledModule() then
			var55 = autocompleteTextModule.new(initializeCommandsModule)
			var54 = autocompleteTextModule.new(initializeEmojisModule)
			
			if getFFlagTextChatEnableUniverseChatTabs() then
				var56 = autocompleteTextModule.new(initializeGlobalCommandsModule)
			end
			local var156 = initialCommandsModule()
			
			if var156 then
				for i, v in var156 do
					table.insert(t, v:GetPropertyChangedSignal("AutocompleteVisible"):Connect(function() --[[ line: 365 ]]
						-- upvalues: var55 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy)
						var55 = autocompleteTextModule.new(initializeCommandsModule)
					end))
				end
			end
		end
		return function() --[[ line: 373 ]]
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
	local var105 = reactModule.useCallback(function() --[[ line: 386 ]]
		-- upvalues: var20 (copy), var74 (ref), fFlagExpChatUseMessagesStore (copy), var101 (write), p14 (ref), var89 (ref), var90 (ref), var91 (ref), var92 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagExpChatDictation (copy), var75 (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy), var97 (ref)
		var20:trace("onSendActivated with input text: '{}'", var74)
		local var157 = if fFlagExpChatUseMessagesStore then var101 else p14.canLocalUserChat
		
		if not var89.current or not var157 then
			var20:debug("onSendActivated could not send message. isMounted: {} canLocalUserChat: {}", tostring(var89.current), var157)
			
			return
		elseif var90.current or var91.current then
			local var158 = if var91.current then var91.current.Text else var90.current.Text
			local var159 = if var92 then var92.consumeOnSend(var158) else nil
			local var160 = if getFFlagTextChatEnableUniverseChatTabs() and p14.isGlobalChatTabActive and p14.onSendGlobalChat then p14.onSendGlobalChat else p14.onSendChat
			
			if not var160 or string.find(var158, "%S") == nil then
				var20:debug("onSendActivated could not send message. text: '{}' canLocalUserChat: {}", var158, var157)
			elseif fFlagExpChatDictation then
				var160(var158, var159, var159 ~= nil)
			else
				var160(var158)
			end
			if var91.current then
				var91.current.Text = ""
				var91.current:ReleaseFocus()
			end
			if var90.current then
				var90.current.Text = ""
				var90.current:ReleaseFocus()
			end
			var75("")
			
			if fFlagExpChatPresetChatGamepadEnabledModule then
				local current = var91.current or var90.current
				
				if current then
					guiService.SelectedCoreObject = current
				end
			end
			if p14.targetTextChannel and p14.targetTextChannelDisplayName ~= "" then
				var97.current = true
				
				return
			end
		else
			var20:debug("onSendActivated could not send message because textBoxRef.current was nil")
		end
	end, {
		var74, var91.current, var101, p14.canLocalUserChat, p14.isGlobalChatTabActive,
		p14.onSendChat or false, p14.onSendGlobalChat or false,
		p14.targetTextChannel or false, p14.targetTextChannelDisplayName,
		if var92 then var92.consumeOnSend else false
	})
	local var106 = if fFlagExpChatDictation_1 then reactModule.useCallback(function(p17) --[[ line: 473 ]]
		-- upvalues: fFlagExpChatUseMessagesStore (copy), var101 (write), p14 (ref), var89 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var91 (ref), var90 (ref), var75 (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy), var97 (ref)
		if not var89.current or not (if fFlagExpChatUseMessagesStore then var101 else p14.canLocalUserChat) then return end
		local var162 = if p17 then p17.textSent else ""
		local var163 = if getFFlagTextChatEnableUniverseChatTabs() and p14.isGlobalChatTabActive and p14.onSendGlobalChat then p14.onSendGlobalChat else p14.onSendChat
		
		if var163 and string.find(var162, "%S") ~= nil then
			var163(var162, p17, true)
		end
		if var91.current then
			var91.current.Text = ""
			var91.current:ReleaseFocus()
		end
		if var90.current then
			var90.current.Text = ""
			var90.current:ReleaseFocus()
		end
		var75("")
		
		if fFlagExpChatPresetChatGamepadEnabledModule then
			local current = var91.current or var90.current
			
			if current then
				guiService.SelectedCoreObject = current
			end
		end
		if p14.targetTextChannel and p14.targetTextChannelDisplayName ~= "" then
			var97.current = true
		end
	end, {
		var91.current, var101, p14.canLocalUserChat, p14.isGlobalChatTabActive,
		p14.onSendChat or false, p14.onSendGlobalChat or false,
		p14.targetTextChannel or false, p14.targetTextChannelDisplayName
	}) else nil
	local var107 = reactModule.useCallback(function(p18) --[[ line: 521 ]]
		-- upvalues: p14 (ref), var91 (ref), var90 (ref), var78 (write), var75 (ref), var89 (ref), fFlagExpChatFocusViaLastModeFixModule (copy), var100 (ref), var98 (ref), var99 (ref), expChatDoNotSetCursorPosition (copy), var20 (copy)
		p14.autocompleteDropdownActivated(false)
		p14.autocompleteDropdownResultsChanged({})
		local var165 = if var91.current then var91.current else var90.current
		
		if not var165 then
			var20:error("Could not find textBox")
			
			return
		end
		local text = var165.Text
		local substring = string.sub(text, 1, var78 - 1)
		local substring_1 = string.sub(text, var78, #text)
		local var168 = ""
		
		if p14.autocompleteDropdownReducer.autocompleteType == "emojis" then
			var168 = string.gsub(substring, ":[^:]*$", p18.EmojiLabel.Text)
		elseif p14.autocompleteDropdownReducer.autocompleteType == "commands" then
			var168 = string.gsub(substring, "(/.*)", p18.TextLabel.Text)
		end
		if substring_1 ~= "" then
			var168 ..= substring_1
		end
		var165.Text = var168
		var75(var168)
		
		if var89.current then
			var165:CaptureFocus()
			
			if fFlagExpChatFocusViaLastModeFixModule then
				if var100 then
					var98(var165)
				end
			elseif var99 == "Focus" then
				var98(var165)
			end
			if substring_1 ~= "" and not expChatDoNotSetCursorPosition then
				var165.CursorPosition = #var168 - #substring_1 + 1
			end
		end
		p14.autocompleteDropdownDeactivated()
	end, if fFlagExpChatEnableFocusNavigationModule then {
		if fFlagExpChatFocusViaLastModeFixModule then var100 else nil, var98, var86,
		var78, if fFlagExpChatFocusViaLastModeFixModule then nil else var99,
		p14.autocompleteDropdownActivated, p14.autocompleteDropdownDeactivated,
		p14.autocompleteDropdownReducer and p14.autocompleteDropdownReducer.autocompleteType,
		p14.autocompleteDropdownResultsChanged
	} else nil)
	reactModule.useEffect(function() --[[ line: 592 ]]
		-- upvalues: var89 (ref), var91 (ref), var90 (ref), var20 (copy)
		if var89.current then
			local var169 = if var91.current then var91.current else var90.current
			
			if var169 then
				var169:CaptureFocus()
				
				return
			end
			var20:error("Could not focus chat input bar because textBox not found")
		end
	end, { p14.shouldFocusChatInputBar, var91.current })
	
	if fFlagExpChatPresetChatEnabled then
		reactModule.useEffect(function() --[[ line: 604 ]]
			-- upvalues: var102 (ref), var91 (ref), var90 (ref)
			if not var102 then return end
			local var170 = if var91.current then var91.current else var90.current
			
			if var170 and var170:IsFocused() then
				var170:ReleaseFocus()
			end
		end, { var102 })
	end
	local createElement_1
	reactModule.useEffect(function() --[[ line: 615 ]]
		-- upvalues: var20 (copy), var89 (ref), expChatPresetChatIXPExposure (copy), IXPServiceWrapperModule (copy), expChatPresetChatIXPLayerName (copy)
		var20:trace("Mounted")
		var89.current = true
		
		if expChatPresetChatIXPExposure then
			IXPServiceWrapperModule:LogUserLayerExposure(expChatPresetChatIXPLayerName)
		end
		return function() --[[ line: 623 ]]
			-- upvalues: var20 (copy), var89 (copy)
			var20:trace("Unmounting")
			var89.current = false
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 629 ]]
		-- upvalues: p14 (ref), var91 (ref), var90 (ref), var79 (write)
		local var171 = nil
		
		if p14.autocompleteEnabled then
			local var172 = if var91.current then var91.current else var90.current
			
			if var172 then
				var171 = var172:GetPropertyChangedSignal("CursorPosition"):Connect(function() --[[ line: 634 ]]
					-- upvalues: var172 (ref), var79 (copy)
					local cursorPosition = var172.CursorPosition
					
					if cursorPosition and cursorPosition ~= -1 then
						var79(cursorPosition)
					end
				end)
			end
		end
		return function() --[[ line: 643 ]]
			-- upvalues: var171 (write)
			if var171 then
				var171:Disconnect()
			end
		end
	end, { var91.current })
	reactModule.useEffect(function() --[[ line: 651 ]]
		-- upvalues: p14 (ref), var96 (ref)
		if p14.autocompleteEnabled then
			var96.current = p14.userInputService.InputBegan:connect(function(p19, _) --[[ line: 653 ]]
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
			
			return function() --[[ line: 675 ]]
				-- upvalues: var96 (copy)
				local current = var96.current
				
				if current and current.Connected then
					current:Disconnect()
				end
				var96.current = nil
			end
		end
		return function() --[[ line: 683 ]] end
	end, { p14.userInputService, p14.autocompleteDropdownReducer })
	reactModule.useEffect(function() --[[ line: 687 ]]
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), p14 (ref), fFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule (copy), var95 (ref), var91 (ref), var90 (ref), var97 (ref), var20 (copy), var74 (ref)
		local var173 = if fFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule then not p14.isChannelBarVisible or getFFlagTextChatEnableUniverseChatTabs() and not p14.developerChannelTabsEnabled else not p14.isChannelBarVisible
		var95.current = p14.userInputService.InputEnded:connect(function(p20, _) --[[ line: 695 ]]
			-- upvalues: var91 (copy), var90 (copy), var97 (copy), var173 (ref), p14 (copy), var20 (copy), var74 (copy)
			local current
			if var91.current then
				current = var91.current
				
				if current then
					current = var91.current:IsFocused()
					
					if current then
						current = p20
						
						if current then
							current = p20.KeyCode == Enum.KeyCode.Backspace
							current = nil
						end
					end
				end
			else
				current = var90.current and (var90.current:IsFocused() and (p20 and p20.KeyCode == Enum.KeyCode.Backspace))
			end
			if current then
				if var97.current and var173 then
					p14.resetTargetChannel()
					var20:debug("ChatInputBar ChatInputBarResetTargetChannel()")
					var97.current = false
					
					return
				elseif var74 == "" and p14.targetTextChannelDisplayName ~= "" then
					var97.current = true
				end
			end
		end)
		
		return function() --[[ line: 722 ]]
			-- upvalues: var95 (copy)
			local current = var95.current
			
			if current and current.Connected then
				current:Disconnect()
			end
			var95.current = nil
		end
	end, {
		p14.userInputService, var91.current, p14.isChannelBarVisible,
		p14.targetTextChannelDisplayName, p14.resetTargetChannel,
		if fFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule then p14.developerChannelTabsEnabled else nil
	})
	reactModule.useEffect(function() --[[ line: 739 ]]
		-- upvalues: p14 (ref), configModule (copy), var91 (ref), var90 (ref), var104 (ref)
		p14.contextActionService:BindCoreAction("FocusChat", function(_, p21, p22) --[[ line: 740 | named "handleAction" ]]
			-- upvalues: p14 (copy), configModule (copy), var91 (copy), var90 (copy), var104 (copy)
			if p14.isChatHotkeyEnabled and p22 and (p22.KeyCode == configModule.ChatInputBarDefaultFocusKeyCode or p22.KeyCode == p14.devDefinedFocusKeyCode) then
				local var174 = if var91.current then var91.current else var90.current
				
				if var174 and p21 == Enum.UserInputState.Begin and (var174 and not var174:IsFocused()) then
					task.delay(0, function() --[[ line: 762 ]]
						-- upvalues: var174 (ref)
						var174:CaptureFocus()
					end)
					p14.focusChatHotKeyActivated()
					var104.current = true
					
					return Enum.ContextActionResult.Sink
				end
			end
			return Enum.ContextActionResult.Pass
		end, false, Enum.UserInputType.Keyboard)
		
		return function() --[[ line: 786 ]]
			-- upvalues: p14 (copy)
			p14.contextActionService:UnbindCoreAction("FocusChat")
		end
	end, {
		p14.isChatHotkeyEnabled,
		p14.devDefinedFocusKeyCode,
		var104.current,
		var91.current
	})
	
	local _ = function(p23) --[[ line: 793 ]]
		-- upvalues: textChatService (copy)
		local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		
		if chatInputBarConfiguration then
			chatInputBarConfiguration.IsFocusedWrite = p23
		end
	end
	
	local var108 = reactModule.useCallback(function() --[[ line: 800 ]]
		-- upvalues: var85 (ref), p14 (ref), textChatService (copy)
		var85(true)
		p14.onFocus()
		local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		
		if chatInputBarConfiguration then
			chatInputBarConfiguration.IsFocusedWrite = true
		end
	end, { p14.onFocus })
	local var109 = reactModule.useCallback(function(_, p24, p25) --[[ line: 806 ]]
		-- upvalues: var20 (copy), var94 (ref), fFlagExpChatEnableFocusNavigationModule (copy), p14 (ref), var107 (ref), var105 (ref), var89 (ref), var91 (ref), var90 (ref), var78 (write), expChatDoNotSetCursorPosition (copy), var85 (ref), textChatService (copy), var104 (ref), playersService (copy)
		local x, y, v
		var20:debug("Focus lost with enter: {}", tostring(p24))
		local current = var94.current
		
		if p24 or fFlagExpChatEnableFocusNavigationModule and p25 and (p25.KeyCode == Enum.KeyCode.Return or p25.KeyCode == Enum.KeyCode.KeypadEnter) then
			if p14.autocompleteEnabled and current and (p14.autocompleteDropdownReducer.activated and #p14.autocompleteDropdownReducer.results > 0) then
				for i, v in ipairs(current.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame:GetChildren()) do
					if v.ClassName == "Frame" and v.LayoutOrder == p14.autocompleteDropdownReducer.selectedIndex then
						var107(v.TextLabelButton)
						
						return
					end
				end
			else
				var105()
			end
		end
		if var89.current then
			if not p14.autocompleteEnabled or not current or not p14.autocompleteDropdownReducer.activated then
				var85(false)
			elseif p25 then
				if p25.KeyCode == Enum.KeyCode.Escape then
					p14.autocompleteDropdownActivated(false)
					local var177 = if var91.current then var91.current else var90.current
					
					if var177 then
						local var178 = var78
						var177:CaptureFocus()
						
						if not expChatDoNotSetCursorPosition then
							var177.CursorPosition = var178
						end
						return
					else
						var20:error("Could not focus chat input bar because textBox not found")
					end
				else
					x = p25.Position.X
					y = p25.Position.Y
					local x_1 = current.AbsolutePosition.X
					local var179 = x_1 + current.AbsoluteSize.X
					local y_1 = current.AbsolutePosition.Y
					v = y_1 + current.AbsoluteSize.Y
					
					if x < x_1 or var179 < x or (y < y_1 or v < y) then
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
		if var104.current then
			x = playersService.LocalPlayer
			
			if x then
				y = Instance.new("TextBox")
				y.Visible = false
				y.Parent = x:FindFirstChildOfClass("PlayerGui")
				y:CaptureFocus()
				y:ReleaseFocus()
				y:Destroy()
			end
			var104.current = false
		end
	end)
	reactModule.useEffect(function() --[[ line: 911 ]]
		-- upvalues: fFlagEnableConsoleExpControls (copy), var91 (ref), var90 (ref), fFlagChromeChatGamepadSupportFix (copy), guiService (copy), var108 (ref), onChatInputBarFocusLost (copy), var109 (ref), actionBindableEvent (copy)
		local var180 = nil
		local var181 = nil
		local eventConnection = actionBindableEvent.Event:Connect(function(p26) --[[ line: 915 ]]
			-- upvalues: fFlagEnableConsoleExpControls (copy), var91 (copy), var90 (copy), fFlagChromeChatGamepadSupportFix (copy), guiService (copy), var108 (copy), var181 (write), var180 (write), onChatInputBarFocusLost (copy), var109 (copy)
			local var183 = if fFlagEnableConsoleExpControls then if var91.current then var91.current else var90.current else nil
			
			if p26.type == "ChatTopBarFocusActivated" then
				if not fFlagEnableConsoleExpControls then
					var183 = if var91.current then var91.current else var90.current
				end
				if var183 then
					task.delay(0, function() --[[ line: 926 ]]
						-- upvalues: var183 (write)
						var183:CaptureFocus()
					end)
				end
			elseif not fFlagChromeChatGamepadSupportFix and fFlagEnableConsoleExpControls and (p26.type == "ChatTopBarFocusSelect" and var183) then
				guiService:SetMenuIsOpen(true, "ExperienceChat")
				var108()
				guiService.SelectedCoreObject = var183
				var181 = task.delay(0, function() --[[ line: 941 ]]
					-- upvalues: var181 (copy), var180 (copy), onChatInputBarFocusLost (copy), p26 (ref), var109 (copy)
					var181 = nil
					
					if var180 then
						var180:Disconnect()
					end
					var180 = onChatInputBarFocusLost(p26.onSelectionLost, p26.keybinds, var109)
				end)
			end
		end)
		
		return function() --[[ line: 955 ]]
			-- upvalues: eventConnection (ref), var181 (write), var180 (write)
			eventConnection:disconnect()
			
			if var181 then
				task.cancel(var181)
				var181 = nil
			end
			if var180 then
				var180:Disconnect()
				var180 = nil
			end
		end
	end, { var90.current, var91.current })
	useEffectChatInputBarFocus(var90, var91, var93, var108, var109)
	
	local function handleAutocomplete(p27, p28, p29) --[[ line: 973 ]]
		-- upvalues: p14 (ref), var56 (copy), var55 (copy), sortCommandResultsCallbackModule (copy), var54 (copy), sortEmojiResultsCallbackModule (copy), var82 (write), list (copy), var75 (ref), expChatDoNotSetCursorPosition (copy), var94 (ref), var107 (ref), var83 (write)
		if p29 == "/" and p27.CursorPosition == 2 or p14.autocompleteDropdownReducer.autocompleteType == "commands" and p29 ~= ":" then
			p14.autocompleteDropdownTypeChanged("commands")
			p14.autocompleteDropdownActivated(true)
			
			if p29 == "" or p29 == " " then
				p14.autocompleteDropdownDeactivated()
			else
				local var184 = string.sub(p28, 1, p27.CursorPosition - 1):lower()
				local var185 = (if p14.isGlobalChatTabActive and var56 then var56 else var55):getResults(var184, sortCommandResultsCallbackModule)
				p14.autocompleteDropdownResultsChanged(var185)
				
				if var184 == var185[1] then
					p14.autocompleteDropdownActivated(false)
					p14.autocompleteDropdownResultsChanged({})
					
					return
				end
			end
			return
		elseif (p14.autocompleteDropdownReducer.activated or #p14.autocompleteDropdownReducer.results > 0) and p14.autocompleteDropdownReducer.autocompleteType == "emojis" then
			p14.autocompleteDropdownActivated(true)
			local matchIndex = string.find(string.sub(p28, 1, p27.CursorPosition - 1), ":[^:]*$")
			
			if p29 == "" or p29 == ":" or (p29 == " " or not matchIndex) then
				if p29 == ":" then
					if matchIndex == var82 then
						p14.autocompleteDropdownResultsChanged({})
						
						return
					end
					local var188 = string.sub(p28, var82 + 1, p27.CursorPosition - 2):lower()
					
					if list.includes(p14.autocompleteDropdownReducer.results, var188) then
						local text = string.sub(p28, 1, p27.CursorPosition - 2) .. string.sub(p28, p27.CursorPosition, #p28)
						p27.Text = text
						var75(text)
						
						if not expChatDoNotSetCursorPosition then
							p27.CursorPosition -= 1
						end
						local current = var94.current
						
						if current then
							for i, v in ipairs(current.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame:GetChildren()) do
								if v.ClassName == "Frame" then
									local textLabelButton = v:FindFirstChild("TextLabelButton")
									
									if textLabelButton then
										local textLabel = textLabelButton:FindFirstChild("TextLabel")
										
										if textLabel and textLabel.Text and textLabel.Text == var188 then
											var107(textLabelButton)
											
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
				elseif p29 == " " then
					p14.autocompleteDropdownActivated(false)
					p14.autocompleteDropdownResultsChanged({})
					
					return
				end
				p14.autocompleteDropdownDeactivated()
				var83(0)
				
				return
			else
				local var187 = string.sub(p28, matchIndex + 1, p27.CursorPosition - 1):lower()
				p14.autocompleteDropdownResultsChanged(if var187 and string.len(var187) > 1 then var54:getResults(var187, sortEmojiResultsCallbackModule) else {})
				
				return
			end
		else
			local matchIndex = string.find(p28, ":[^:]*$")
			
			if p29 == ":" then
				p14.autocompleteDropdownTypeChanged("emojis")
				p14.autocompleteDropdownActivated(true)
				p14.autocompleteDropdownResultsChanged({})
				var83(matchIndex)
			end
		end
	end
	
	reactModule.useEffect(function() --[[ line: 1090 ]]
		-- upvalues: textChatService (copy), var57 (copy), RBXTeamCommand (copy), var58 (copy), RBXWhisperCommand (copy)
		if textChatService.CreateDefaultCommands then
			var57 = textChatService:FindFirstChild(RBXTeamCommand.name, true)
			var58 = textChatService:FindFirstChild(RBXWhisperCommand.name, true)
		end
	end, {})
	local var111 = reactModule.useCallback(function(p30) --[[ line: 1097 ]]
		-- upvalues: p14 (ref), var75 (ref), var20 (copy), var74 (ref), getEnableChatInputBarConfigurationAutocompleteEnabledModule (copy), handleAutocomplete (ref), var97 (ref), chatOptimizeCommandProcessing (copy), var73 (ref), var57 (copy), autoCastCommand (copy), RBXTeamCommand (copy), var58 (copy), RBXWhisperCommand (copy), promiseModule (copy)
		local text = p30.Text
		
		if p14.autocompleteEnabled then
			local var193 = p30.CursorPosition < #text + 1
			
			if string.find(text, "\r") then
				local replaced = string.gsub(text, "\r", "")
				p30.Text = replaced
				var75(replaced)
				
				if var193 then
					p30.CursorPosition -= 1
				end
				return
			else
				local substring = string.sub(text, p30.CursorPosition - 1, p30.CursorPosition - 1)
				var20:trace("Input: {}", text)
				local var196 = if utf8.len(text) then utf8.len(utf8.nfcnormalize(text)) else string.len(text)
				
				if var196 and p14.messageCharacterLimit < var196 then
					var20:debug("Message is over the character limit of {}", tostring(p14.messageCharacterLimit))
					p30.Text = var74
					
					return
				end
				var75(text)
				
				if getEnableChatInputBarConfigurationAutocompleteEnabledModule() and p14.autocompleteEnabled then
					handleAutocomplete(p30, text, substring)
				end
				var97.current = #text == 0 and var97.current
				
				if chatOptimizeCommandProcessing then
					if string.sub(text, 1, 1) == "/" and p14.localPlayer and text ~= var73.current then
						var73.current = text
						local userId = p14.localPlayer.UserId
						local t = {}
						
						if var57 and var57.Enabled then
							table.insert(t, autoCastCommand(RBXTeamCommand, userId, text))
						end
						if var58 and var58.Enabled then
							table.insert(t, autoCastCommand(RBXWhisperCommand, userId, text))
						end
						if #t == 0 then
							t = { promiseModule.reject() }
						end
						promiseModule.any(t):andThen(function() --[[ line: 1153 ]]
							-- upvalues: p30 (ref), var75 (copy), var97 (copy)
							p30.Text = ""
							var75("")
							var97.current = true
						end):catch(function(p31) --[[ line: 1159 ]]
							-- upvalues: var20 (copy)
							var20:trace("Could not send autoCastCommand. Error: {}", p31)
						end)
						
						return
					elseif string.sub(text, 1, 1) == "/" then
						return
					else
						var73.current = ""
						
						return
					end
				elseif p14.localPlayer then
					local userId = p14.localPlayer.UserId
					local t = {}
					
					if var57 and var57.Enabled then
						table.insert(t, autoCastCommand(RBXTeamCommand, userId, text))
					end
					if var58 and var58.Enabled then
						table.insert(t, autoCastCommand(RBXWhisperCommand, userId, text))
					end
					if #t == 0 then
						t = { promiseModule.reject() }
					end
					promiseModule.any(t):andThen(function() --[[ line: 1182 ]]
						-- upvalues: p30 (ref), var75 (copy), var97 (copy)
						p30.Text = ""
						var75("")
						var97.current = true
					end):catch(function(p32) --[[ line: 1188 ]]
						-- upvalues: var20 (copy)
						var20:trace("Could not send autoCastCommand. Error: {}", p32)
					end)
				end
			end
		end
	end)
	local var112 = reactModule.useCallback(function() --[[ line: 1195 ]]
		-- upvalues: var91 (ref), var90 (ref)
		local var199 = if var91.current then var91.current else var90.current
		
		if var199 then
			var199:ReleaseFocus(true)
		end
	end, { var90.current, var91.current })
	local var113 = reactModule.useCallback(function(p33) --[[ line: 1202 ]]
		-- upvalues: var88 (ref)
		var88(if p33.Visible then p33.AbsoluteSize.X else 0)
	end)
	local var114 = if fFlagExpChatEnableFocusNavigationModule then useCursor() else nil
	local var115 = reactModule.useCallback(function(p34) --[[ line: 1209 ]]
		-- upvalues: p14 (ref)
		p14.autocompleteDropdownSelectionChanged(p34.LayoutOrder)
	end)
	local var116 = var74 == ""
	local var117 = var116 and not var84
	local chatInputBarSettings = p14.chatInputBarSettings
	local chatWindowSettings = p14.chatWindowSettings
	local var118 = if fFlagExpChatUseMessagesStore and var101 ~= nil then var101 else p14.canLocalUserChat
	reactModule.useEffect(function() --[[ line: 1224 ]]
		-- upvalues: expChatDictationIXPExposure (copy), var118 (ref), IXPServiceWrapperModule (copy), expChatDictationIXPLayerName (copy)
		if expChatDictationIXPExposure and var118 then
			IXPServiceWrapperModule:LogUserLayerExposure(expChatDictationIXPLayerName)
		end
	end, { var118 })
	local backgroundTransparency = useInterpolatedClientSettingsModule(chatInputBarSettings).BackgroundTransparency
	local backgroundTransparency_1 = useInterpolatedClientSettingsModule(chatWindowSettings).BackgroundTransparency
	local backgroundColor3 = useInterpolatedClientSettingsModule(chatWindowSettings).BackgroundColor3
	local isSpatialUIEnabled = p14.isSpatialUIEnabled
	local createElement = reactModule.createElement
	local var119 = "Frame"
	local t = {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = backgroundColor3,
		BackgroundTransparency = if fFlagExpChatNewInputBarModule then 1 else p14.transparencyValue:map(function(p35) --[[ line: 99 ]]
			-- upvalues: backgroundTransparency_1 (ref)
			return backgroundTransparency_1 + p35 * (1 - backgroundTransparency_1)
		end),
		BorderSizePixel = 0,
		LayoutOrder = p14.LayoutOrder,
		Size = p14.size,
		Visible = p14.visible,
		ZIndex = 2,
		[reactModule.Event.MouseEnter] = p14.onHovered,
		[reactModule.Event.MouseLeave] = p14.onUnhovered,
		[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p36) --[[ line: 1250 ]]
			-- upvalues: textChatService (copy), p14 (ref)
			local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			
			if chatInputBarConfiguration and p14.onAbsoluteSizeChanged then
				p14.onAbsoluteSizeChanged(p36, chatInputBarConfiguration)
			end
		end),
		[reactModule.Change.AbsolutePosition] = reactModule.useCallback(function(p37) --[[ line: 1256 ]]
			-- upvalues: textChatService (copy), p14 (ref)
			local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			
			if chatInputBarConfiguration and p14.onAbsolutePositionChanged then
				p14.onAbsolutePositionChanged(p37, chatInputBarConfiguration)
			end
		end)
	}
	local t_1 = {
		AutocompleteDropdown = getEnableChatInputBarConfigurationAutocompleteEnabledModule() and (p14.autocompleteEnabled and (reactModule.createElement(autocompleteDropdownModule, {
			chatInputBarSettings = chatInputBarSettings,
			chatWindowSettings = chatWindowSettings,
			setTransparency = setTransparency,
			transparencyValue = p14.transparencyValue,
			activated = p14.autocompleteDropdownReducer.activated and var84,
			results = p14.autocompleteDropdownReducer.results,
			selectedIndex = p14.autocompleteDropdownReducer.selectedIndex,
			autocompleteType = p14.autocompleteDropdownReducer.autocompleteType,
			onAutocompleteDropdownHover = var115,
			onAutocompleteSelected = var107,
			autocompleteDropdownRef = var94,
			textBoxRef = if chatInputBarSettings.TextBox then var91 else var90
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
		ChatInputBarV2 = if not fFlagExpChatNewInputBarModule then if fFlagExpChatNewInputBarDictationModule and fFlagExpChatDictation_1 and var118 then reactModule.createElement(chatInputBarV2DictationModule, {
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
			canLocalUserChatDerived = var101,
			targetChannelWidth = var87,
			showPlaceholderText = var117,
			hasEmptyInputText = var116,
			shouldTruncatePlaceholder = if fFlagExpChatPresetChatEnabled then var103 else nil,
			cursor = var114,
			placeholderRef = var93,
			textBoxRef = var90,
			customTextBoxRef = var91,
			onAbsoluteSizeChanged = var113,
			onFocused = var108,
			onFocusLost = var109,
			onTextChanged = var111,
			onReturnPressedFromOnScreenKeyboard = var112,
			onSendActivated = var105,
			onSendRecordingTap = var106,
			onTranscriptionStaged = if var92 then var92.stageTranscription else nil,
			inputText = var74,
			setInputText = var75,
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
			canLocalUserChatDerived = var101,
			targetChannelWidth = var87,
			showPlaceholderText = var117,
			hasEmptyInputText = var116,
			shouldTruncatePlaceholder = if fFlagExpChatPresetChatEnabled then var103 else nil,
			cursor = var114,
			placeholderRef = var93,
			textBoxRef = var90,
			customTextBoxRef = var91,
			onAbsoluteSizeChanged = var113,
			onFocused = var108,
			onFocusLost = var109,
			onTextChanged = var111,
			onReturnPressedFromOnScreenKeyboard = var112,
			onSendActivated = var105
		}) else nil
	}
	
	if fFlagExpChatNewInputBarModule then
		createElement_1 = nil
	elseif fFlagExpChatDictation_1 and var118 then
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1(dictationInputBarModule, {
			chatInputBarSettings = chatInputBarSettings,
			transparencyValue = p14.transparencyValue,
			chatInputBarBackgroundTransparency = backgroundTransparency,
			inputText = var74,
			setInputText = var75,
			canLocalUserChat = var118,
			disabledChatPlaceholderText = p14.disabledChatPlaceholderText,
			targetChannelWidth = var87,
			showPlaceholderText = var117,
			placeholderText = p14.placeholderText,
			cursor = var114,
			placeholderRef = if expChatFocusablePlaceholderText then var93 else nil,
			textBoxRef = var90,
			customTextBoxRef = var91,
			onFocused = var108,
			onFocusLost = var109,
			onTextChanged = var111,
			onReturnPressedFromOnScreenKeyboard = var112,
			onChannelChipAbsoluteSizeChanged = var113,
			onChannelChipActivated = p14.resetTargetChannel,
			targetTextChannel = p14.targetTextChannel,
			targetTextChannelDisplayName = p14.targetTextChannelDisplayName or "",
			isChannelBarVisible = p14.isChannelBarVisible,
			isGlobalChatTabActive = p14.isGlobalChatTabActive,
			developerChannelTabsEnabled = p14.developerChannelTabsEnabled,
			onDictationActivityChanged = p14.onDictationActivityChanged,
			onSendActivated = var105,
			onSendRecordingTap = var106,
			onTranscriptionStaged = if var92 then var92.stageTranscription else nil,
			isSpatialUIEnabled = isSpatialUIEnabled,
			isTextBoxSelectable = if fFlagEnableConsoleExpControls then true else nil,
			isPlaceholderSelectable = if expChatFocusablePlaceholderText then true else nil,
			placeholderSelectionImageObject = if expChatFocusablePlaceholderText then var114 else nil,
			selectionBehavior = if fFlagEnableConsoleExpControls and not fFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
			selectionGroup = if fFlagEnableConsoleExpControls and not fFlagExpChatEnableFocusNavigationModule then true else nil
		})
	else
		createElement_1 = reactModule.createElement
		local var122 = "Frame"
		local t_2 = {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = chatInputBarSettings.BackgroundColor3,
			BackgroundTransparency = if fFlagExpChatNewInputBarModule then 1 else p14.transparencyValue:map(function(p38) --[[ line: 99 ]]
				-- upvalues: backgroundTransparency (ref)
				return backgroundTransparency + p38 * (1 - backgroundTransparency)
			end),
			Size = UDim2.new(1, 0, 0, 0)
		}
		local t_3 = {}
		local createElement_2 = reactModule.createElement
		local var125 = "UIStroke"
		local t_4 = {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = configModule.ChatInputBarBorderColor3
		}
		local chatInputBarBorderTransparency = configModule.ChatInputBarBorderTransparency
		t_4.Transparency = p14.transparencyValue:map(function(p39) --[[ line: 99 ]]
			-- upvalues: chatInputBarBorderTransparency (ref)
			return chatInputBarBorderTransparency + p39 * (1 - chatInputBarBorderTransparency)
		end)
		t_3.Border = createElement_2(var125, t_4)
		t_3.Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 3) })
		local createElement_3 = reactModule.createElement
		local var127 = "Frame"
		local t_5 = {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}
		local t_6 = {}
		local createElement_4 = reactModule.createElement
		local var130 = "Frame"
		local t_7 = {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			SelectionBehaviorDown = if fFlagEnableConsoleExpControls and not fFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorLeft = if fFlagEnableConsoleExpControls and not fFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorRight = if fFlagEnableConsoleExpControls and not fFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorUp = if fFlagEnableConsoleExpControls and not fFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
			SelectionGroup = if fFlagEnableConsoleExpControls and not fFlagExpChatEnableFocusNavigationModule then true else nil,
			Size = UDim2.new(1, -p14.sendButtonContainerWidth, 0, 0)
		}
		local t_8 = {}
		local createElement_5 = reactModule.createElement
		local t_9 = {}
		local var134 = 0
		t_9.transparency = p14.transparencyValue:map(function(p40) --[[ line: 99 ]]
			-- upvalues: var134 (ref)
			return var134 + p40 * (1 - var134)
		end)
		t_9.onAbsoluteSizeChanged = var113
		t_9.onChannelChipActivated = p14.resetTargetChannel
		t_9.targetTextChannelDisplayName = p14.targetTextChannelDisplayName or ""
		t_9.isChannelBarVisible = p14.isChannelBarVisible
		t_9.developerChannelTabsEnabled = p14.developerChannelTabsEnabled
		t_8.TargetChannelChip = createElement_5(channelChipModule, t_9)
		local var135 = if fFlagExpChatUseMessagesStore then not var101 else not p14.canLocalUserChat
		
		if var135 then
			var135 = reactModule.createElement
			local var136 = "TextLabel"
			local t_10 = {
				BackgroundTransparency = 1,
				TextWrapped = true,
				AnchorPoint = Vector2.new(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Font = configModule.ChatInputBarFont,
				Text = p14.disabledChatPlaceholderText,
				Position = UDim2.fromScale(1, 0),
				Size = var87:map(function(p41) --[[ line: 1475 ]]
					return UDim2.new(1, -(p41 + 8), 0, 0)
				end),
				TextColor3 = if var117 then chatInputBarSettings.PlaceholderColor3 else chatInputBarSettings.TextColor3,
				TextSize = if isSpatialUIEnabled then chatInputBarSettings.SpatialPanelTextSize else chatInputBarSettings.TextSize
			}
			local var138 = if var117 then 0.5 else 0
			t_10.TextTransparency = p14.transparencyValue:map(function(p42) --[[ line: 99 ]]
				-- upvalues: var138 (ref)
				return var138 + p42 * (1 - var138)
			end)
			t_10.Selectable = if expChatFocusablePlaceholderText then true else nil
			t_10.SelectionImageObject = if expChatFocusablePlaceholderText then var114 else nil
			t_10.TextXAlignment = Enum.TextXAlignment.Left
			t_10.TextYAlignment = Enum.TextYAlignment.Top
			t_10.ref = if expChatFocusablePlaceholderText then var93 else nil
			var135 = var135(var136, t_10)
		end
		t_8.DisabledPlaceholderLabel = var135
		local var139 = if fFlagExpChatUseMessagesStore then var101 else p14.canLocalUserChat
		
		if var139 then
			var139 = reactModule.createElement
			local var140 = "Frame"
			local t_10 = {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Position = UDim2.fromScale(1, 0),
				Size = var87:map(function(p43) --[[ line: 1503 ]]
					return UDim2.new(1, -(p43 + 8), 0, 0)
				end)
			}
			local t_11 = {}
			local var143 = if fFlagExpChatUseMessagesStore then var101 else p14.canLocalUserChat
			
			if var143 then
				var143 = reactModule.createElement
				local var144 = "TextBox"
				local t_12 = {
					AnchorPoint = Vector2.new(0, 0),
					AutomaticSize = Enum.AutomaticSize.XY,
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					FontFace = chatInputBarSettings.FontFace,
					PlaceholderText = if var117 then p14.placeholderText else "",
					Selectable = if fFlagEnableConsoleExpControls then true else nil,
					SelectionImageObject = var114,
					Size = UDim2.fromScale(1, 0),
					Text = "",
					PlaceholderColor3 = chatInputBarSettings.PlaceholderColor3,
					TextColor3 = chatInputBarSettings.TextColor3,
					TextSize = if isSpatialUIEnabled then chatInputBarSettings.SpatialPanelTextSize else chatInputBarSettings.TextSize
				}
				local var146 = if var117 then 0.5 else 0
				t_12.TextTransparency = p14.transparencyValue:map(function(p44) --[[ line: 99 ]]
					-- upvalues: var146 (ref)
					return var146 + p44 * (1 - var146)
				end)
				local textStrokeTransparency = chatInputBarSettings.TextStrokeTransparency
				t_12.TextStrokeTransparency = p14.transparencyValue:map(function(p45) --[[ line: 99 ]]
					-- upvalues: textStrokeTransparency (ref)
					return textStrokeTransparency + p45 * (1 - textStrokeTransparency)
				end)
				t_12.TextStrokeColor3 = chatInputBarSettings.TextStrokeColor3
				t_12.TextWrapped = true
				t_12.TextXAlignment = Enum.TextXAlignment.Left
				t_12.TextYAlignment = Enum.TextYAlignment.Top
				t_12.ZIndex = 2
				t_12[reactModule.Event.Focused] = var108
				t_12[reactModule.Event.FocusLost] = var109
				t_12[reactModule.Change.Text] = var111
				t_12[reactModule.Event.ReturnPressedFromOnScreenKeyboard] = var112
				t_12.ref = if chatInputBarSettings.TextBox then var91 else var90
				var143 = var143(var144, t_12)
			end
			t_11.TextBox = var143
			var139 = var139(var140, t_10, t_11)
		end
		t_8.TextBoxContainer = var139
		t_8.UIPadding = reactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 10),
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10)
		})
		t_6.TextContainer = createElement_4(var130, t_7, t_8)
		local createElement_6 = reactModule.createElement
		local var147 = "TextButton"
		local t_10 = {
			AnchorPoint = Vector2.new(1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Position = UDim2.fromScale(1, 0),
			Selectable = if fFlagExpChatEnableFocusNavigationModule then false else nil,
			Size = UDim2.new(0, p14.sendButtonContainerWidth, 1, 0),
			Text = "",
			[reactModule.Event.Activated] = var105
		}
		local t_11 = {
			Layout = reactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			})
		}
		local createElement_7 = reactModule.createElement
		local var150 = imageSetLabel
		local t_12 = {
			BackgroundTransparency = 1,
			ZIndex = 2,
			ImageColor3 = if var116 then chatInputBarSettings.PlaceholderColor3 else chatInputBarSettings.TextColor3
		}
		local var152 = if var116 then 0.5 else 0
		t_12.ImageTransparency = p14.transparencyValue:map(function(p46) --[[ line: 99 ]]
			-- upvalues: var152 (ref)
			return var152 + p46 * (1 - var152)
		end)
		t_12.Image = images["icons/actions/send"]
		t_12.Size = UDim2.new(0, 30, 0, 30)
		t_11.SendIcon = createElement_7(var150, t_12)
		t_6.SendButton = createElement_6(var147, t_10, t_11)
		t_3.Container = createElement_3(var127, t_5, t_6)
		createElement_1 = createElement_1(var122, t_2, t_3)
	end
	t_1.Background = createElement_1
	
	return createElement(var119, t, t_1)
end))