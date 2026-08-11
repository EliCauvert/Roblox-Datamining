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
local actionBindableEvent = expChatSharedModule.ActionBindableEvent
local var58 = getFocusNavigationStoreModule(false)
local var59 = expChatSharedModule.Flags.FIntPresetChatCooldownLuaMs / 1000

local function setTransparency(value, p0) --[[ line: 109 ]]
	return p0:map(function(p1) --[[ line: 110 ]]
		-- upvalues: value (ref)
		return value + p1 * (1 - value)
	end)
end

local var61 = nil
local var62 = nil
local var63 = nil
local var64 = nil
local var65 = nil

local function onChatInputBarFocusLost(p2, p3, p4) --[[ line: 121 ]]
	-- upvalues: userInputService (ref), guiService (ref)
	p3 = p3 or { Enum.KeyCode.ButtonB }
	local var69 = nil
	
	return userInputService.InputBegan:Connect(function(p5) --[[ line: 125 ]]
		-- upvalues: p3 (ref), guiService (copy), p4 (ref), p2 (ref), var69 (write)
		local var70 = if p5 then p5.KeyCode else nil
		
		for i, v in p3 do
			if var70 == v then
				guiService:SetMenuIsOpen(false, "ExperienceChat")
				p4()
				
				if p2 then
					p2()
				else
					guiService.SelectedCoreObject = nil
				end
				if not var69 then break end
				var69:Disconnect()
				var69 = nil
				
				return
			end
		end
	end)
end

local function useEffectChatInputBarFocus(p6, p7, p8, p9, p10) --[[ line: 149 ]]
	-- upvalues: fFlagConsoleChatUseChromeFocusUtils (ref), reactModule (ref), signalsModule (ref), var58 (ref), expChatFocusablePlaceholderText (ref), guiService (ref), userInputService (ref), focusUtils (ref), fFlagChromeChatGamepadSupportFix (ref), fFlagEnableConsoleExpControls (ref), onChatInputBarFocusLost (ref), actionBindableEvent (ref)
	if fFlagConsoleChatUseChromeFocusUtils then
		reactModule.useEffect(function() --[[ line: 151 ]]
			-- upvalues: signalsModule (copy), var58 (copy), p7 (ref), p6 (ref), expChatFocusablePlaceholderText (copy), p8 (ref), guiService (copy), p9 (ref), userInputService (copy), focusUtils (copy), p10 (ref)
			local t = {}
			local var72 = nil
			local var73 = signalsModule.createEffect(function(p11) --[[ line: 155 ]]
				-- upvalues: var58 (copy), p7 (copy), p6 (copy), expChatFocusablePlaceholderText (copy), p8 (copy), guiService (copy), p9 (copy), var72 (write), userInputService (copy), t (ref), focusUtils (copy), p10 (copy)
				local chatInputBarFocused = var58.getChatInputBarFocused(p11)
				local var75 = if p7.current then p7.current else p6.current
				
				if expChatFocusablePlaceholderText then
					var75 = var75 or p8.current
				end
				if not var75 then return end
				if chatInputBarFocused then
					guiService:SetMenuIsOpen(true, "ExperienceChat")
					p9()
					guiService.SelectedCoreObject = var75
					
					if var72 then
						return
					else
						var72 = userInputService.InputBegan:Connect(function(p12) --[[ line: 177 ]]
							-- upvalues: t (copy), focusUtils (copy), var58 (copy)
							if p12 and t[p12.KeyCode] then
								focusUtils.FocusOnChrome(function() --[[ line: 180 ]]
									-- upvalues: var58 (copy)
									var58.unfocusChatInputBar()
								end, "chat")
							end
						end)
						
						return
					end
				elseif guiService.MenuIsOpen then
					guiService:SetMenuIsOpen(false, "ExperienceChat")
					p10()
					
					if var72 then
						var72:Disconnect()
						var72 = nil
					end
				end
			end)
			
			return function() --[[ line: 196 ]]
				-- upvalues: var73 (ref), var72 (write)
				var73()
				
				if var72 then
					var72:Disconnect()
					var72 = nil
				end
			end
		end, {})
		
		return
	elseif fFlagChromeChatGamepadSupportFix then
		reactModule.useEffect(function() --[[ line: 206 ]]
			-- upvalues: p7 (ref), p6 (ref), fFlagEnableConsoleExpControls (copy), guiService (copy), p9 (ref), onChatInputBarFocusLost (copy), p10 (ref), actionBindableEvent (copy)
			local var76 = nil
			local var77 = nil
			local eventConnection = actionBindableEvent.Event:Connect(function(p13) --[[ line: 210 ]]
				-- upvalues: p7 (copy), p6 (copy), fFlagEnableConsoleExpControls (copy), guiService (copy), p9 (copy), var77 (write), var76 (write), onChatInputBarFocusLost (copy), p10 (copy)
				local var79 = if p7.current then p7.current else p6.current
				
				if fFlagEnableConsoleExpControls and p13.type == "ChatTopBarFocusSelect" and var79 then
					guiService:SetMenuIsOpen(true, "ExperienceChat")
					p9()
					guiService.SelectedCoreObject = var79
					var77 = task.delay(0, function() --[[ line: 222 ]]
						-- upvalues: var77 (copy), var76 (copy), onChatInputBarFocusLost (copy), p13 (ref), p10 (copy)
						var77 = nil
						
						if var76 then
							var76:Disconnect()
						end
						var76 = onChatInputBarFocusLost(p13.onSelectionLost, p13.keybinds, p10)
					end)
				end
			end)
			
			return function() --[[ line: 236 ]]
				-- upvalues: eventConnection (ref), var77 (write), var76 (write)
				eventConnection:disconnect()
				
				if var77 then
					task.cancel(var77)
					var77 = nil
				end
				if var76 then
					var76:Disconnect()
					var76 = nil
				end
			end
		end, { p6.current, p7.current })
	end
end

return reactModule.memo(localizationModule.connect(function(p48) --[[ line: 1727 ]]
	-- upvalues: getOtherDisplayNameInWhisperChannelModule (ref)
	local list = nil
	
	if p48.targetTextChannel then
		for i, v in pairs({
			RBXTeam = "CoreScripts.TextChat.TeamChat.PrefixText",
			RBXWhisper = "CoreScripts.TextChat.WhisperChat.PrefixText.Outgoing"
		}) do
			if string.match(p48.targetTextChannel.Name, i) then
				if i == "RBXWhisper" then
					local var219 = getOtherDisplayNameInWhisperChannelModule(p48.targetTextChannel, p48.localPlayer)
					
					if var219 then
						list = { v, { RBX_NAME = var219 } }
					end
				else
					list = v
				end
			end
		end
	end
	return { targetTextChannelDisplayName = list }
end)(function(p14) --[[ line: 252 | named "ChatInputBar" ]]
	-- upvalues: reactModule (ref), fFlagExpChatUseUnifiedTooltipStore (ref), getChatTooltipStoreModule (ref), fFlagExpChatDictation_1 (ref), useSendTelemetryModule (ref), reactFocusNavigationModule (ref), fFlagExpChatFocusViaLastModeFixModule (ref), focusNavigationUtilsModule (ref), signalsReactModule (ref), var58 (ref), fFlagExpChatUseMessagesStore (ref), getMessagesStoreModule (ref), fFlagExpChatPresetChatEnabled (ref), getPresetChatStoreModule (ref), textChatService (ref), var62 (write), autocompleteTextModule (ref), initializeCommandsModule (ref), getEnableChatInputBarConfigurationAutocompleteEnabledModule (ref), var61 (write), initializeEmojisModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), var63 (write), initializeGlobalCommandsModule (ref), initialCommandsModule (ref), var19 (ref), fFlagExpChatDictation (ref), fFlagExpChatPresetChatGamepadEnabledModule (ref), guiService (ref), presetSearchModule (ref), var59 (ref), sendPresetModule (ref), expChatSharedModule (ref), constantsModule (ref), fFlagExpChatPresetChatAutocompleteEnabledModule (ref), presetEntryTextModule (ref), expChatDoNotSetCursorPosition (ref), expChatPresetChatIXPExposure (ref), IXPServiceWrapper (ref), expChatPresetChatIXPLayerName (ref), fFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule (ref), fFlagExpChatFixBackspaceNilTargetChannel (ref), configModule (ref), playersService (ref), fFlagEnableConsoleExpControls (ref), fFlagChromeChatGamepadSupportFix (ref), onChatInputBarFocusLost (ref), actionBindableEvent (ref), useEffectChatInputBarFocus (ref), fFlagExpChatUniverseChatPresetEnabledModule (ref), sortCommandResultsCallbackModule (ref), sortEmojiResultsCallbackModule (ref), list (ref), var64 (write), RBXTeamCommand (ref), var65 (write), RBXWhisperCommand (ref), chatOptimizeCommandProcessing (ref), autoCastCommand (ref), promiseModule (ref), useCursor (ref), expChatDictationIXPExposure (ref), expChatDictationIXPLayerName (ref), expChatPresetAutocompleteIxpEnabled (ref), expChatPresetAutocompleteIxpLayer (ref), useInterpolatedClientSettingsModule (ref), fFlagExpChatNewInputBarModule (ref), autocompleteDropdownModule (ref), setTransparency (ref), fFlagExpChatNewInputBarDictationModule (ref), chatInputBarV2DictationModule (ref), chatInputBarV2Module (ref), dictationInputBarModule (ref), expChatFocusablePlaceholderText (ref), channelChipModule (ref), imageSetLabel (ref), images (ref)
	local var80 = reactModule.useRef("")
	
	if fFlagExpChatUseUnifiedTooltipStore then
		local setIsChatInputBarVisible = getChatTooltipStoreModule(false).setIsChatInputBarVisible
		reactModule.useEffect(function() --[[ line: 260 ]]
			-- upvalues: p14 (ref), setIsChatInputBarVisible (ref)
			if p14.visible == nil then
				setIsChatInputBarVisible(true)
			else
				setIsChatInputBarVisible(p14.visible)
			end
			return function() --[[ line: 269 ]]
				-- upvalues: setIsChatInputBarVisible (copy)
				setIsChatInputBarVisible(false)
			end
		end, { p14.visible, setIsChatInputBarVisible })
	end
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var81, var82 = reactModule.useState("")
	local var83, var84 = reactModule.useState(0)
	local var85 = var83
	local var86 = var84
	local var87, var88 = reactModule.useState(0)
	local var89 = var87
	local var90 = var88
	local var91, var92 = reactModule.useState(false)
	local var93, _ = reactModule.useState(true)
	local var94, var95 = reactModule.useBinding(0)
	local var96 = reactModule.useRef(false)
	local var97 = reactModule.useRef(nil)
	local var98 = reactModule.useRef(nil)
	local var99 = if fFlagExpChatDictation_1 then useSendTelemetryModule({
		enabled = fFlagExpChatDictation_1,
		textBoxRef = var97,
		customTextBoxRef = var98
	}) else nil
	local var100 = reactModule.useRef(nil)
	local var101 = reactModule.useRef(nil)
	local var102 = reactModule.useRef(nil)
	local var103 = reactModule.useRef(nil)
	local var104 = reactModule.useRef(false)
	local var105 = reactFocusNavigationModule.useFocusGuiObject()
	local var106 = if not fFlagExpChatFocusViaLastModeFixModule then focusNavigationUtilsModule.useLastInputMode() else nil
	local var107 = if fFlagExpChatFocusViaLastModeFixModule then signalsReactModule.useSignalState(var58.getChatInputBarFocused) else nil
	local var108 = nil
	local _ = nil
	
	if fFlagExpChatUseMessagesStore then
		var108 = signalsReactModule.useSignalState(getMessagesStoreModule(false).getCanLocalUserChat)
	end
	local var109 = if fFlagExpChatPresetChatEnabled then signalsReactModule.useSignalState(getPresetChatStoreModule(false).getIsTrayOpen) else nil
	local var110 = if fFlagExpChatPresetChatEnabled then signalsReactModule.useSignalState(getPresetChatStoreModule(false).getIsEnabled) else nil
	local var111 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 332 ]]
		-- upvalues: var98 (ref), p14 (ref)
		var98.current = p14.chatInputBarSettings.TextBox
	end, {
		if p14.chatInputBarSettings.TextBox ~= nil then "nil" else p14.chatInputBarSettings.TextBox
	})
	reactModule.useEffect(function() --[[ line: 337 ]]
		-- upvalues: p14 (ref), textChatService (copy), var62 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy), getEnableChatInputBarConfigurationAutocompleteEnabledModule (copy), var61 (copy), initializeEmojisModule (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var63 (copy), initializeGlobalCommandsModule (copy), initialCommandsModule (copy)
		if not p14.autocompleteEnabled then return end
		local t = {}
		local descendantAddedConnection = textChatService.DescendantAdded:Connect(function(p15) --[[ line: 342 ]]
			-- upvalues: var62 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy), t (ref)
			if p15:IsA("TextChatCommand") and string.sub(p15.PrimaryAlias, 1, 1) == "/" then
				var62 = autocompleteTextModule.new(initializeCommandsModule)
				table.insert(t, p15:GetPropertyChangedSignal("AutocompleteVisible"):Connect(function() --[[ line: 348 ]]
					-- upvalues: var62 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy)
					var62 = autocompleteTextModule.new(initializeCommandsModule)
				end))
			end
		end)
		local descendantRemovingConnection = textChatService.DescendantRemoving:Connect(function(p16) --[[ line: 355 ]]
			-- upvalues: var62 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy)
			if p16:IsA("TextChatCommand") and string.sub(p16.PrimaryAlias, 1, 1) == "/" then
				var62 = autocompleteTextModule.new(initializeCommandsModule)
			end
		end)
		
		if getEnableChatInputBarConfigurationAutocompleteEnabledModule() then
			var62 = autocompleteTextModule.new(initializeCommandsModule)
			var61 = autocompleteTextModule.new(initializeEmojisModule)
			
			if getFFlagTextChatEnableUniverseChatTabs() then
				var63 = autocompleteTextModule.new(initializeGlobalCommandsModule)
			end
			local var165 = initialCommandsModule()
			
			if var165 then
				for i, v in var165 do
					table.insert(t, v:GetPropertyChangedSignal("AutocompleteVisible"):Connect(function() --[[ line: 372 ]]
						-- upvalues: var62 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy)
						var62 = autocompleteTextModule.new(initializeCommandsModule)
					end))
				end
			end
		end
		return function() --[[ line: 380 ]]
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
	local var112 = reactModule.useCallback(function() --[[ line: 393 ]]
		-- upvalues: var19 (copy), var81 (ref), fFlagExpChatUseMessagesStore (copy), var108 (write), p14 (ref), var96 (ref), var97 (ref), var98 (ref), var99 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagExpChatDictation (copy), var82 (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy), var104 (ref)
		var19:trace("onSendActivated with input text: '{}'", var81)
		local var166 = if fFlagExpChatUseMessagesStore then var108 else p14.canLocalUserChat
		
		if not var96.current or not var166 then
			var19:debug("onSendActivated could not send message. isMounted: {} canLocalUserChat: {}", tostring(var96.current), var166)
			
			return
		elseif var97.current or var98.current then
			local var167 = if var98.current then var98.current.Text else var97.current.Text
			local var168 = if var99 then var99.consumeOnSend(var167) else nil
			local var169 = if getFFlagTextChatEnableUniverseChatTabs() and p14.isGlobalChatTabActive and p14.onSendGlobalChat then p14.onSendGlobalChat else p14.onSendChat
			
			if not var169 or string.find(var167, "%S") == nil then
				var19:debug("onSendActivated could not send message. text: '{}' canLocalUserChat: {}", var167, var166)
			elseif fFlagExpChatDictation then
				var169(var167, var168, var168 ~= nil)
			else
				var169(var167)
			end
			if var98.current then
				var98.current.Text = ""
				var98.current:ReleaseFocus()
			end
			if var97.current then
				var97.current.Text = ""
				var97.current:ReleaseFocus()
			end
			var82("")
			
			if fFlagExpChatPresetChatGamepadEnabledModule then
				local current = var98.current or var97.current
				
				if current then
					guiService.SelectedCoreObject = current
				end
			end
			if p14.targetTextChannel and p14.targetTextChannelDisplayName ~= "" then
				var104.current = true
				
				return
			end
		else
			var19:debug("onSendActivated could not send message because textBoxRef.current was nil")
		end
	end, {
		var81, var98.current, var108, p14.canLocalUserChat, p14.isGlobalChatTabActive,
		p14.onSendChat or false, p14.onSendGlobalChat or false,
		p14.targetTextChannel or false, p14.targetTextChannelDisplayName,
		if var99 then var99.consumeOnSend else false
	})
	local var113 = if fFlagExpChatDictation_1 then reactModule.useCallback(function(p17) --[[ line: 480 ]]
		-- upvalues: fFlagExpChatUseMessagesStore (copy), var108 (write), p14 (ref), var96 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var98 (ref), var97 (ref), var82 (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy), var104 (ref)
		if not var96.current or not (if fFlagExpChatUseMessagesStore then var108 else p14.canLocalUserChat) then return end
		local var171 = if p17 then p17.textSent else ""
		local var172 = if getFFlagTextChatEnableUniverseChatTabs() and p14.isGlobalChatTabActive and p14.onSendGlobalChat then p14.onSendGlobalChat else p14.onSendChat
		
		if var172 and string.find(var171, "%S") ~= nil then
			var172(var171, p17, true)
		end
		if var98.current then
			var98.current.Text = ""
			var98.current:ReleaseFocus()
		end
		if var97.current then
			var97.current.Text = ""
			var97.current:ReleaseFocus()
		end
		var82("")
		
		if fFlagExpChatPresetChatGamepadEnabledModule then
			local current = var98.current or var97.current
			
			if current then
				guiService.SelectedCoreObject = current
			end
		end
		if p14.targetTextChannel and p14.targetTextChannelDisplayName ~= "" then
			var104.current = true
		end
	end, {
		var98.current, var108, p14.canLocalUserChat, p14.isGlobalChatTabActive,
		p14.onSendChat or false, p14.onSendGlobalChat or false,
		p14.targetTextChannel or false, p14.targetTextChannelDisplayName
	}) else nil
	
	local function sendSelectedPreset(value) --[[ line: 528 ]]
		-- upvalues: getPresetChatStoreModule (copy), presetSearchModule (copy), var19 (copy), var59 (copy), sendPresetModule (copy), p14 (ref), expChatSharedModule (copy), constantsModule (copy)
		local var174 = getPresetChatStoreModule(false)
		local presetIdForValue = presetSearchModule.getPresetIdForValue(var174, value)
		
		if presetIdForValue == nil then
			var19:warning("Could not resolve a preset id for autocomplete entry '{}'; skipping send.", value)
			
			return
		end
		var174.setPresetCooldownEndsAt(os.clock() + var59)
		local var176 = sendPresetModule(presetIdForValue, p14.targetTextChannel)
		
		if var176 == "Sent" then
			expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
				event_type = constantsModule.Analytics.EventTypes.Click,
				component = constantsModule.Analytics.Components.PresetAutocomplete,
				preset_id = presetIdForValue
			}, expChatSharedModule.Analytics.DefaultStandardizedFields)
			
			return
		end
		var174.setPresetCooldownEndsAt(nil)
		var19:warning("Could not send preset {} from autocomplete: {}", presetIdForValue, var176)
	end
	
	local var115 = reactModule.useCallback(function(p18) --[[ line: 558 ]]
		-- upvalues: fFlagExpChatPresetChatAutocompleteEnabledModule (copy), p14 (ref), presetEntryTextModule (copy), var98 (ref), var97 (ref), var85 (write), var82 (ref), var96 (ref), fFlagExpChatFocusViaLastModeFixModule (copy), var107 (ref), var105 (ref), var106 (ref), expChatDoNotSetCursorPosition (copy), sendSelectedPreset (ref), var19 (copy)
		local var177 = if fFlagExpChatPresetChatAutocompleteEnabledModule and p14.autocompleteDropdownReducer.autocompleteType == "presets" then presetEntryTextModule.undecorate(p18.TextLabel.Text, p14.chatInputBarSettings.TextSize) else nil
		p14.autocompleteDropdownActivated(false)
		p14.autocompleteDropdownResultsChanged({})
		local var178 = if var98.current then var98.current else var97.current
		
		if var178 then
			local text = var178.Text
			local substring = string.sub(text, 1, var85 - 1)
			local var180 = if fFlagExpChatPresetChatAutocompleteEnabledModule and var177 ~= nil then "" else string.sub(text, var85, #text)
			local var181 = ""
			
			if p14.autocompleteDropdownReducer.autocompleteType == "emojis" then
				var181 = string.gsub(substring, ":[^:]*$", p18.EmojiLabel.Text)
			elseif p14.autocompleteDropdownReducer.autocompleteType == "commands" then
				var181 = string.gsub(substring, "(/.*)", p18.TextLabel.Text)
			end
			if var180 ~= "" then
				var181 ..= var180
			end
			var178.Text = var181
			var82(var181)
			
			if var96.current then
				var178:CaptureFocus()
				
				if fFlagExpChatFocusViaLastModeFixModule then
					if var107 then
						var105(var178)
					end
				elseif var106 == "Focus" then
					var105(var178)
				end
				if var180 ~= "" and not expChatDoNotSetCursorPosition then
					var178.CursorPosition = #var181 - #var180 + 1
				end
			end
			p14.autocompleteDropdownDeactivated()
			
			if fFlagExpChatPresetChatAutocompleteEnabledModule and var177 ~= nil then
				sendSelectedPreset(var177)
				
				return
			end
		else
			var19:error("Could not find textBox")
		end
	end, {
		if fFlagExpChatFocusViaLastModeFixModule then var107 else nil, var105, var93,
		var85, if fFlagExpChatFocusViaLastModeFixModule then nil else var106,
		p14.autocompleteDropdownActivated, p14.autocompleteDropdownDeactivated,
		p14.autocompleteDropdownReducer and p14.autocompleteDropdownReducer.autocompleteType,
		p14.autocompleteDropdownResultsChanged,
		if fFlagExpChatPresetChatAutocompleteEnabledModule then p14.targetTextChannel or false else nil,
		if fFlagExpChatPresetChatAutocompleteEnabledModule then p14.chatInputBarSettings.TextSize else nil
	})
	reactModule.useEffect(function() --[[ line: 650 ]]
		-- upvalues: var96 (ref), var98 (ref), var97 (ref), var19 (copy)
		if var96.current then
			local var182 = if var98.current then var98.current else var97.current
			
			if var182 then
				var182:CaptureFocus()
				
				return
			end
			var19:error("Could not focus chat input bar because textBox not found")
		end
	end, { p14.shouldFocusChatInputBar, var98.current })
	
	if fFlagExpChatPresetChatEnabled then
		reactModule.useEffect(function() --[[ line: 662 ]]
			-- upvalues: var109 (ref), var98 (ref), var97 (ref)
			if not var109 then return end
			local var183 = if var98.current then var98.current else var97.current
			
			if var183 and var183:IsFocused() then
				var183:ReleaseFocus()
			end
		end, { var109 })
	end
	local createElement_1
	reactModule.useEffect(function() --[[ line: 673 ]]
		-- upvalues: var19 (copy), var96 (ref), expChatPresetChatIXPExposure (copy), IXPServiceWrapper (copy), expChatPresetChatIXPLayerName (copy)
		var19:trace("Mounted")
		var96.current = true
		
		if expChatPresetChatIXPExposure then
			IXPServiceWrapper:LogUserLayerExposure(expChatPresetChatIXPLayerName)
		end
		return function() --[[ line: 681 ]]
			-- upvalues: var19 (copy), var96 (copy)
			var19:trace("Unmounting")
			var96.current = false
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 687 ]]
		-- upvalues: p14 (ref), var98 (ref), var97 (ref), var86 (write)
		local var184 = nil
		
		if p14.autocompleteEnabled then
			local var185 = if var98.current then var98.current else var97.current
			
			if var185 then
				var184 = var185:GetPropertyChangedSignal("CursorPosition"):Connect(function() --[[ line: 692 ]]
					-- upvalues: var185 (ref), var86 (copy)
					local cursorPosition = var185.CursorPosition
					
					if cursorPosition and cursorPosition ~= -1 then
						var86(cursorPosition)
					end
				end)
			end
		end
		return function() --[[ line: 701 ]]
			-- upvalues: var184 (write)
			if var184 then
				var184:Disconnect()
			end
		end
	end, { var98.current })
	reactModule.useEffect(function() --[[ line: 709 ]]
		-- upvalues: p14 (ref), var103 (ref)
		if p14.autocompleteEnabled then
			var103.current = p14.userInputService.InputBegan:connect(function(p19, _) --[[ line: 711 ]]
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
			
			return function() --[[ line: 733 ]]
				-- upvalues: var103 (copy)
				local current = var103.current
				
				if current and current.Connected then
					current:Disconnect()
				end
				var103.current = nil
			end
		end
		return function() --[[ line: 741 ]] end
	end, { p14.userInputService, p14.autocompleteDropdownReducer })
	reactModule.useEffect(function() --[[ line: 745 ]]
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), p14 (ref), fFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule (copy), var102 (ref), var98 (ref), var97 (ref), var104 (ref), fFlagExpChatFixBackspaceNilTargetChannel (copy), var19 (copy), var81 (ref)
		local var186 = if fFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule then not p14.isChannelBarVisible or getFFlagTextChatEnableUniverseChatTabs() and not p14.developerChannelTabsEnabled else not p14.isChannelBarVisible
		var102.current = p14.userInputService.InputEnded:connect(function(p20, _) --[[ line: 753 ]]
			-- upvalues: var98 (copy), var97 (copy), p14 (copy), var104 (copy), var186 (ref), fFlagExpChatFixBackspaceNilTargetChannel (copy), var19 (copy), var81 (copy)
			local current
			if var98.current then
				current = var98.current
				
				if current then
					current = var98.current:IsFocused()
					
					if current then
						current = p20
						
						if current then
							current = p20.KeyCode == Enum.KeyCode.Backspace
							current = nil
						end
					end
				end
			else
				current = var97.current and (var97.current:IsFocused() and (p20 and p20.KeyCode == Enum.KeyCode.Backspace))
			end
			if current then
				local var187 = (p14.targetTextChannelDisplayName or "") ~= ""
				
				if var104.current and var186 and (if fFlagExpChatFixBackspaceNilTargetChannel then var187 else true) then
					p14.resetTargetChannel(if fFlagExpChatFixBackspaceNilTargetChannel then p14.isGlobalChatTabActive else nil)
					var19:debug("ChatInputBar ChatInputBarResetTargetChannel()")
					var104.current = false
					
					return
				elseif var81 == "" and (if fFlagExpChatFixBackspaceNilTargetChannel then var187 else p14.targetTextChannelDisplayName ~= "") then
					var104.current = true
				end
			end
		end)
		
		return function() --[[ line: 794 ]]
			-- upvalues: var102 (copy)
			local current = var102.current
			
			if current and current.Connected then
				current:Disconnect()
			end
			var102.current = nil
		end
	end, {
		p14.userInputService, var98.current, p14.isChannelBarVisible,
		p14.targetTextChannelDisplayName, p14.resetTargetChannel,
		if fFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule then p14.developerChannelTabsEnabled else nil,
		if fFlagExpChatFixBackspaceNilTargetChannel then p14.isGlobalChatTabActive else nil
	})
	reactModule.useEffect(function() --[[ line: 812 ]]
		-- upvalues: p14 (ref), configModule (copy), var98 (ref), var97 (ref), var111 (ref)
		p14.contextActionService:BindCoreAction("FocusChat", function(_, p21, p22) --[[ line: 813 | named "handleAction" ]]
			-- upvalues: p14 (copy), configModule (copy), var98 (copy), var97 (copy), var111 (copy)
			if p14.isChatHotkeyEnabled and p22 and (p22.KeyCode == configModule.ChatInputBarDefaultFocusKeyCode or p22.KeyCode == p14.devDefinedFocusKeyCode) then
				local var188 = if var98.current then var98.current else var97.current
				
				if var188 and p21 == Enum.UserInputState.Begin and (var188 and not var188:IsFocused()) then
					task.delay(0, function() --[[ line: 835 ]]
						-- upvalues: var188 (ref)
						var188:CaptureFocus()
					end)
					p14.focusChatHotKeyActivated()
					var111.current = true
					
					return Enum.ContextActionResult.Sink
				end
			end
			return Enum.ContextActionResult.Pass
		end, false, Enum.UserInputType.Keyboard)
		
		return function() --[[ line: 859 ]]
			-- upvalues: p14 (copy)
			p14.contextActionService:UnbindCoreAction("FocusChat")
		end
	end, {
		p14.isChatHotkeyEnabled,
		p14.devDefinedFocusKeyCode,
		var111.current,
		var98.current
	})
	
	local _ = function(p23) --[[ line: 866 ]]
		-- upvalues: textChatService (copy)
		local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		
		if chatInputBarConfiguration then
			chatInputBarConfiguration.IsFocusedWrite = p23
		end
	end
	
	local var116 = reactModule.useCallback(function() --[[ line: 873 ]]
		-- upvalues: var92 (ref), p14 (ref), textChatService (copy)
		var92(true)
		p14.onFocus()
		local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		
		if chatInputBarConfiguration then
			chatInputBarConfiguration.IsFocusedWrite = true
		end
	end, { p14.onFocus })
	local var117 = reactModule.useCallback(function(_, p24, p25) --[[ line: 882 ]]
		-- upvalues: var19 (copy), var101 (ref), p14 (ref), fFlagExpChatPresetChatAutocompleteEnabledModule (copy), var115 (ref), var112 (ref), var96 (ref), var98 (ref), var97 (ref), var85 (write), expChatDoNotSetCursorPosition (copy), var92 (ref), textChatService (copy), var111 (ref), playersService (copy)
		local v
		var19:debug("Focus lost with enter: {}", tostring(p24))
		local current = var101.current
		
		if p24 or p25 and (p25.KeyCode == Enum.KeyCode.Return or p25.KeyCode == Enum.KeyCode.KeypadEnter) then
			if p14.autocompleteEnabled and current and (p14.autocompleteDropdownReducer.activated and #p14.autocompleteDropdownReducer.results > 0) and (not fFlagExpChatPresetChatAutocompleteEnabledModule or p14.autocompleteDropdownReducer.selectedIndex > 0) then
				for i, v in ipairs(current.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame:GetChildren()) do
					if v.ClassName == "Frame" and v.LayoutOrder == p14.autocompleteDropdownReducer.selectedIndex then
						var115(v.TextLabelButton)
						
						return
					end
				end
			else
				local x, y
				var112()
				
				if fFlagExpChatPresetChatAutocompleteEnabledModule and p14.autocompleteEnabled and p14.autocompleteDropdownReducer.autocompleteType == "presets" then
					p14.autocompleteDropdownDeactivated()
				end
			end
		end
		if var96.current then
			if not p14.autocompleteEnabled or not current or not p14.autocompleteDropdownReducer.activated then
				var92(false)
			elseif p25 then
				if p25.KeyCode == Enum.KeyCode.Escape then
					p14.autocompleteDropdownActivated(false)
					local var191 = if var98.current then var98.current else var97.current
					
					if var191 then
						local var192 = var85
						var191:CaptureFocus()
						
						if not expChatDoNotSetCursorPosition then
							var191.CursorPosition = var192
						end
						return
					else
						var19:error("Could not focus chat input bar because textBox not found")
					end
				else
					x = p25.Position.X
					y = p25.Position.Y
					local x_1 = current.AbsolutePosition.X
					local var193 = x_1 + current.AbsoluteSize.X
					local y_1 = current.AbsolutePosition.Y
					v = y_1 + current.AbsoluteSize.Y
					
					if x < x_1 or var193 < x or (y < y_1 or v < y) then
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
		if var111.current then
			x = playersService.LocalPlayer
			
			if x then
				y = Instance.new("TextBox")
				y.Visible = false
				y.Parent = x:FindFirstChildOfClass("PlayerGui")
				y:CaptureFocus()
				y:ReleaseFocus()
				y:Destroy()
			end
			var111.current = false
		end
	end)
	reactModule.useEffect(function() --[[ line: 1004 ]]
		-- upvalues: fFlagEnableConsoleExpControls (copy), var98 (ref), var97 (ref), fFlagChromeChatGamepadSupportFix (copy), guiService (copy), var116 (ref), onChatInputBarFocusLost (copy), var117 (ref), actionBindableEvent (copy)
		local var194 = nil
		local var195 = nil
		local eventConnection = actionBindableEvent.Event:Connect(function(p26) --[[ line: 1008 ]]
			-- upvalues: fFlagEnableConsoleExpControls (copy), var98 (copy), var97 (copy), fFlagChromeChatGamepadSupportFix (copy), guiService (copy), var116 (copy), var195 (write), var194 (write), onChatInputBarFocusLost (copy), var117 (copy)
			local var197 = if fFlagEnableConsoleExpControls then if var98.current then var98.current else var97.current else nil
			
			if p26.type == "ChatTopBarFocusActivated" then
				if not fFlagEnableConsoleExpControls then
					var197 = if var98.current then var98.current else var97.current
				end
				if var197 then
					task.delay(0, function() --[[ line: 1019 ]]
						-- upvalues: var197 (write)
						var197:CaptureFocus()
					end)
				end
			elseif not fFlagChromeChatGamepadSupportFix and fFlagEnableConsoleExpControls and (p26.type == "ChatTopBarFocusSelect" and var197) then
				guiService:SetMenuIsOpen(true, "ExperienceChat")
				var116()
				guiService.SelectedCoreObject = var197
				var195 = task.delay(0, function() --[[ line: 1034 ]]
					-- upvalues: var195 (copy), var194 (copy), onChatInputBarFocusLost (copy), p26 (ref), var117 (copy)
					var195 = nil
					
					if var194 then
						var194:Disconnect()
					end
					var194 = onChatInputBarFocusLost(p26.onSelectionLost, p26.keybinds, var117)
				end)
			end
		end)
		
		return function() --[[ line: 1048 ]]
			-- upvalues: eventConnection (ref), var195 (write), var194 (write)
			eventConnection:disconnect()
			
			if var195 then
				task.cancel(var195)
				var195 = nil
			end
			if var194 then
				var194:Disconnect()
				var194 = nil
			end
		end
	end, { var97.current, var98.current })
	useEffectChatInputBarFocus(var97, var98, var100, var116, var117)
	
	local function handlePresetAutocomplete(value, p27) --[[ line: 1069 ]]
		-- upvalues: p14 (ref), fFlagExpChatUniverseChatPresetEnabledModule (copy), presetSearchModule (copy), getPresetChatStoreModule (copy)
		if p27 < 1 then return end
		local var198 = if not (p14.targetTextChannel == nil and not fFlagExpChatUniverseChatPresetEnabledModule) then presetSearchModule.findMatchingPresets(getPresetChatStoreModule(false), string.sub(value, 1, p27 - 1)) else {}
		
		if #var198 == 0 then
			if p14.autocompleteDropdownReducer.autocompleteType == "presets" then
				p14.autocompleteDropdownDeactivated()
			end
			return
		else
			p14.autocompleteDropdownTypeChanged("presets")
			p14.autocompleteDropdownActivated(true)
			p14.autocompleteDropdownResultsChanged(var198)
			p14.autocompleteDropdownSelectionChanged(0)
		end
	end
	
	local function handleAutocomplete(p28, p29, p30) --[[ line: 1106 ]]
		-- upvalues: p14 (ref), var63 (copy), var62 (copy), sortCommandResultsCallbackModule (copy), var61 (copy), sortEmojiResultsCallbackModule (copy), var89 (write), list (copy), var82 (ref), expChatDoNotSetCursorPosition (copy), var101 (ref), var115 (ref), var90 (write), fFlagExpChatPresetChatAutocompleteEnabledModule (copy), handlePresetAutocomplete (ref)
		if p30 == "/" and p28.CursorPosition == 2 or p14.autocompleteDropdownReducer.autocompleteType == "commands" and p30 ~= ":" then
			p14.autocompleteDropdownTypeChanged("commands")
			p14.autocompleteDropdownActivated(true)
			
			if p30 == "" or p30 == " " then
				p14.autocompleteDropdownDeactivated()
			else
				local var199 = string.sub(p29, 1, p28.CursorPosition - 1):lower()
				local var200 = (if p14.isGlobalChatTabActive and var63 then var63 else var62):getResults(var199, sortCommandResultsCallbackModule)
				p14.autocompleteDropdownResultsChanged(var200)
				
				if var199 == var200[1] then
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
					if matchIndex == var89 then
						p14.autocompleteDropdownResultsChanged({})
						
						return
					end
					local var203 = string.sub(p29, var89 + 1, p28.CursorPosition - 2):lower()
					
					if list.includes(p14.autocompleteDropdownReducer.results, var203) then
						local text = string.sub(p29, 1, p28.CursorPosition - 2) .. string.sub(p29, p28.CursorPosition, #p29)
						p28.Text = text
						var82(text)
						
						if not expChatDoNotSetCursorPosition then
							p28.CursorPosition -= 1
						end
						local current = var101.current
						
						if current then
							for i, v in ipairs(current.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame:GetChildren()) do
								if v.ClassName == "Frame" then
									local textLabelButton = v:FindFirstChild("TextLabelButton")
									
									if textLabelButton then
										local textLabel = textLabelButton:FindFirstChild("TextLabel")
										
										if textLabel and textLabel.Text and textLabel.Text == var203 then
											var115(textLabelButton)
											
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
				var90(0)
				
				return
			else
				local var202 = string.sub(p29, matchIndex + 1, p28.CursorPosition - 1):lower()
				p14.autocompleteDropdownResultsChanged(if var202 and string.len(var202) > 1 then var61:getResults(var202, sortEmojiResultsCallbackModule) else {})
				
				return
			end
		else
			local matchIndex = string.find(p29, ":[^:]*$")
			
			if p30 == ":" then
				p14.autocompleteDropdownTypeChanged("emojis")
				p14.autocompleteDropdownActivated(true)
				p14.autocompleteDropdownResultsChanged({})
				var90(matchIndex)
				
				return
			elseif fFlagExpChatPresetChatAutocompleteEnabledModule then
				handlePresetAutocomplete(p29, p28.CursorPosition)
			end
		end
	end
	
	reactModule.useEffect(function() --[[ line: 1225 ]]
		-- upvalues: textChatService (copy), var64 (copy), RBXTeamCommand (copy), var65 (copy), RBXWhisperCommand (copy)
		if textChatService.CreateDefaultCommands then
			var64 = textChatService:FindFirstChild(RBXTeamCommand.name, true)
			var65 = textChatService:FindFirstChild(RBXWhisperCommand.name, true)
		end
	end, {})
	local var120 = reactModule.useCallback(function(p31) --[[ line: 1232 ]]
		-- upvalues: p14 (ref), var82 (ref), var19 (copy), var81 (ref), getEnableChatInputBarConfigurationAutocompleteEnabledModule (copy), handleAutocomplete (ref), var104 (ref), chatOptimizeCommandProcessing (copy), var80 (ref), var64 (copy), autoCastCommand (copy), RBXTeamCommand (copy), var65 (copy), RBXWhisperCommand (copy), promiseModule (copy)
		local text = p31.Text
		
		if p14.autocompleteEnabled then
			local var208 = p31.CursorPosition < #text + 1
			
			if string.find(text, "\r") then
				local replaced = string.gsub(text, "\r", "")
				p31.Text = replaced
				var82(replaced)
				
				if var208 then
					p31.CursorPosition -= 1
				end
				return
			else
				local substring = string.sub(text, p31.CursorPosition - 1, p31.CursorPosition - 1)
				var19:trace("Input: {}", text)
				local var211 = if utf8.len(text) then utf8.len(utf8.nfcnormalize(text)) else string.len(text)
				
				if var211 and p14.messageCharacterLimit < var211 then
					var19:debug("Message is over the character limit of {}", tostring(p14.messageCharacterLimit))
					p31.Text = var81
					
					return
				end
				var82(text)
				
				if getEnableChatInputBarConfigurationAutocompleteEnabledModule() and p14.autocompleteEnabled then
					handleAutocomplete(p31, text, substring)
				end
				var104.current = #text == 0 and var104.current
				
				if chatOptimizeCommandProcessing then
					if string.sub(text, 1, 1) == "/" and p14.localPlayer and text ~= var80.current then
						var80.current = text
						local userId = p14.localPlayer.UserId
						local t = {}
						
						if var64 and var64.Enabled then
							table.insert(t, autoCastCommand(RBXTeamCommand, userId, text))
						end
						if var65 and var65.Enabled then
							table.insert(t, autoCastCommand(RBXWhisperCommand, userId, text))
						end
						if #t == 0 then
							t = { promiseModule.reject() }
						end
						promiseModule.any(t):andThen(function() --[[ line: 1288 ]]
							-- upvalues: p31 (ref), var82 (copy), var104 (copy)
							p31.Text = ""
							var82("")
							var104.current = true
						end):catch(function(p32) --[[ line: 1294 ]]
							-- upvalues: var19 (copy)
							var19:trace("Could not send autoCastCommand. Error: {}", p32)
						end)
						
						return
					elseif string.sub(text, 1, 1) == "/" then
						return
					else
						var80.current = ""
						
						return
					end
				elseif p14.localPlayer then
					local userId = p14.localPlayer.UserId
					local t = {}
					
					if var64 and var64.Enabled then
						table.insert(t, autoCastCommand(RBXTeamCommand, userId, text))
					end
					if var65 and var65.Enabled then
						table.insert(t, autoCastCommand(RBXWhisperCommand, userId, text))
					end
					if #t == 0 then
						t = { promiseModule.reject() }
					end
					promiseModule.any(t):andThen(function() --[[ line: 1317 ]]
						-- upvalues: p31 (ref), var82 (copy), var104 (copy)
						p31.Text = ""
						var82("")
						var104.current = true
					end):catch(function(p33) --[[ line: 1323 ]]
						-- upvalues: var19 (copy)
						var19:trace("Could not send autoCastCommand. Error: {}", p33)
					end)
				end
			end
		end
	end)
	local var121 = reactModule.useCallback(function() --[[ line: 1330 ]]
		-- upvalues: var98 (ref), var97 (ref)
		local var214 = if var98.current then var98.current else var97.current
		
		if var214 then
			var214:ReleaseFocus(true)
		end
	end, { var97.current, var98.current })
	local var122 = reactModule.useCallback(function(p34) --[[ line: 1337 ]]
		-- upvalues: var95 (ref)
		var95(if p34.Visible then p34.AbsoluteSize.X else 0)
	end)
	local var123 = useCursor()
	local var124 = reactModule.useCallback(function(p35) --[[ line: 1343 ]]
		-- upvalues: p14 (ref)
		p14.autocompleteDropdownSelectionChanged(p35.LayoutOrder)
	end)
	local var125 = var81 == ""
	local var126 = var125 and not var91
	local chatInputBarSettings = p14.chatInputBarSettings
	local chatWindowSettings = p14.chatWindowSettings
	local var127 = if fFlagExpChatUseMessagesStore and var108 ~= nil then var108 else p14.canLocalUserChat
	reactModule.useEffect(function() --[[ line: 1358 ]]
		-- upvalues: expChatDictationIXPExposure (copy), var127 (ref), IXPServiceWrapper (copy), expChatDictationIXPLayerName (copy)
		if expChatDictationIXPExposure and var127 then
			IXPServiceWrapper:LogUserLayerExposure(expChatDictationIXPLayerName)
		end
	end, { var127 })
	reactModule.useEffect(function() --[[ line: 1364 ]]
		-- upvalues: expChatPresetAutocompleteIxpEnabled (copy), var91 (ref), getEnableChatInputBarConfigurationAutocompleteEnabledModule (copy), p14 (ref), getPresetChatStoreModule (copy), constantsModule (copy), IXPServiceWrapper (copy), expChatPresetAutocompleteIxpLayer (copy)
		if not expChatPresetAutocompleteIxpEnabled or not var91 then return end
		if not getEnableChatInputBarConfigurationAutocompleteEnabledModule() or not p14.autocompleteEnabled then return end
		local var215 = getPresetChatStoreModule(false)
		
		if var215.getIsEnabled(false) and var215.getAccessLevel(false) == constantsModule.AccessLevel.Enabled then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(expChatPresetAutocompleteIxpLayer)
			
			return
		end
	end, { var91, p14.autocompleteEnabled, var110 })
	local backgroundTransparency = useInterpolatedClientSettingsModule(chatInputBarSettings).BackgroundTransparency
	local backgroundTransparency_1 = useInterpolatedClientSettingsModule(chatWindowSettings).BackgroundTransparency
	local backgroundColor3 = useInterpolatedClientSettingsModule(chatWindowSettings).BackgroundColor3
	local isSpatialUIEnabled = p14.isSpatialUIEnabled
	local createElement = reactModule.createElement
	local var128 = "Frame"
	local t = {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = backgroundColor3,
		BackgroundTransparency = if fFlagExpChatNewInputBarModule then 1 else p14.transparencyValue:map(function(p36) --[[ line: 110 ]]
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
		[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p37) --[[ line: 1404 ]]
			-- upvalues: textChatService (copy), p14 (ref)
			local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			
			if chatInputBarConfiguration and p14.onAbsoluteSizeChanged then
				p14.onAbsoluteSizeChanged(p37, chatInputBarConfiguration)
			end
		end),
		[reactModule.Change.AbsolutePosition] = reactModule.useCallback(function(p38) --[[ line: 1410 ]]
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
			activated = p14.autocompleteDropdownReducer.activated and var91,
			results = p14.autocompleteDropdownReducer.results,
			selectedIndex = p14.autocompleteDropdownReducer.selectedIndex,
			autocompleteType = p14.autocompleteDropdownReducer.autocompleteType,
			onAutocompleteDropdownHover = var124,
			onAutocompleteSelected = var115,
			autocompleteDropdownRef = var101,
			textBoxRef = if chatInputBarSettings.TextBox then var98 else var97
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
		ChatInputBarV2 = if not fFlagExpChatNewInputBarModule then if fFlagExpChatNewInputBarDictationModule and fFlagExpChatDictation_1 and var127 then reactModule.createElement(chatInputBarV2DictationModule, {
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
			canLocalUserChatDerived = var108,
			targetChannelWidth = var94,
			showPlaceholderText = var126,
			hasEmptyInputText = var125,
			shouldTruncatePlaceholder = if fFlagExpChatPresetChatEnabled then var110 else nil,
			cursor = var123,
			placeholderRef = var100,
			textBoxRef = var97,
			customTextBoxRef = var98,
			onAbsoluteSizeChanged = var122,
			onFocused = var116,
			onFocusLost = var117,
			onTextChanged = var120,
			onReturnPressedFromOnScreenKeyboard = var121,
			onSendActivated = var112,
			onSendRecordingTap = var113,
			onTranscriptionStaged = if var99 then var99.stageTranscription else nil,
			inputText = var81,
			setInputText = var82,
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
			canLocalUserChatDerived = var108,
			targetChannelWidth = var94,
			showPlaceholderText = var126,
			hasEmptyInputText = var125,
			shouldTruncatePlaceholder = if fFlagExpChatPresetChatEnabled then var110 else nil,
			cursor = var123,
			placeholderRef = var100,
			textBoxRef = var97,
			customTextBoxRef = var98,
			onAbsoluteSizeChanged = var122,
			onFocused = var116,
			onFocusLost = var117,
			onTextChanged = var120,
			onReturnPressedFromOnScreenKeyboard = var121,
			onSendActivated = var112,
			isGlobalChatTabActive = if fFlagExpChatFixBackspaceNilTargetChannel then p14.isGlobalChatTabActive else nil
		}) else nil
	}
	
	if fFlagExpChatNewInputBarModule then
		createElement_1 = nil
	elseif fFlagExpChatDictation_1 and var127 then
		createElement_1 = reactModule.createElement(dictationInputBarModule, {
			chatInputBarSettings = chatInputBarSettings,
			transparencyValue = p14.transparencyValue,
			chatInputBarBackgroundTransparency = backgroundTransparency,
			inputText = var81,
			setInputText = var82,
			canLocalUserChat = var127,
			disabledChatPlaceholderText = p14.disabledChatPlaceholderText,
			targetChannelWidth = var94,
			showPlaceholderText = var126,
			placeholderText = p14.placeholderText,
			cursor = var123,
			placeholderRef = if expChatFocusablePlaceholderText then var100 else nil,
			textBoxRef = var97,
			customTextBoxRef = var98,
			onFocused = var116,
			onFocusLost = var117,
			onTextChanged = var120,
			onReturnPressedFromOnScreenKeyboard = var121,
			onChannelChipAbsoluteSizeChanged = var122,
			onChannelChipActivated = if fFlagExpChatFixBackspaceNilTargetChannel then function() --[[ line: 1549 ]]
				-- upvalues: p14 (ref)
				p14.resetTargetChannel(p14.isGlobalChatTabActive)
			end else p14.resetTargetChannel,
			targetTextChannel = p14.targetTextChannel,
			targetTextChannelDisplayName = p14.targetTextChannelDisplayName or "",
			isChannelBarVisible = p14.isChannelBarVisible,
			isGlobalChatTabActive = p14.isGlobalChatTabActive,
			developerChannelTabsEnabled = p14.developerChannelTabsEnabled,
			onDictationActivityChanged = p14.onDictationActivityChanged,
			onSendActivated = var112,
			onSendRecordingTap = var113,
			onTranscriptionStaged = if var99 then var99.stageTranscription else nil,
			isSpatialUIEnabled = isSpatialUIEnabled,
			isTextBoxSelectable = if fFlagEnableConsoleExpControls then true else nil,
			isPlaceholderSelectable = if expChatFocusablePlaceholderText then true else nil,
			placeholderSelectionImageObject = if expChatFocusablePlaceholderText then var123 else nil
		})
	else
		createElement_1 = reactModule.createElement
		local var131 = "Frame"
		local t_2 = {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = chatInputBarSettings.BackgroundColor3,
			BackgroundTransparency = if fFlagExpChatNewInputBarModule then 1 else p14.transparencyValue:map(function(p39) --[[ line: 110 ]]
				-- upvalues: backgroundTransparency (ref)
				return backgroundTransparency + p39 * (1 - backgroundTransparency)
			end),
			Size = UDim2.new(1, 0, 0, 0)
		}
		local t_3 = {}
		local createElement_2 = reactModule.createElement
		local var134 = "UIStroke"
		local t_4 = {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = configModule.ChatInputBarBorderColor3
		}
		local chatInputBarBorderTransparency = configModule.ChatInputBarBorderTransparency
		t_4.Transparency = p14.transparencyValue:map(function(p40) --[[ line: 110 ]]
			-- upvalues: chatInputBarBorderTransparency (ref)
			return chatInputBarBorderTransparency + p40 * (1 - chatInputBarBorderTransparency)
		end)
		t_3.Border = createElement_2(var134, t_4)
		t_3.Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 3) })
		local createElement_3 = reactModule.createElement
		local var136 = "Frame"
		local t_5 = {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}
		local t_6 = {}
		local createElement_4 = reactModule.createElement
		local var139 = "Frame"
		local t_7 = {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, -p14.sendButtonContainerWidth, 0, 0)
		}
		local t_8 = {}
		local createElement_5 = reactModule.createElement
		local t_9 = {}
		local var143 = 0
		t_9.transparency = p14.transparencyValue:map(function(p41) --[[ line: 110 ]]
			-- upvalues: var143 (ref)
			return var143 + p41 * (1 - var143)
		end)
		t_9.onAbsoluteSizeChanged = var122
		t_9.onChannelChipActivated = if fFlagExpChatFixBackspaceNilTargetChannel then function() --[[ line: 1597 ]]
			-- upvalues: p14 (ref)
			p14.resetTargetChannel(p14.isGlobalChatTabActive)
		end else p14.resetTargetChannel
		t_9.targetTextChannelDisplayName = p14.targetTextChannelDisplayName or ""
		t_9.isChannelBarVisible = p14.isChannelBarVisible
		t_9.developerChannelTabsEnabled = p14.developerChannelTabsEnabled
		t_8.TargetChannelChip = createElement_5(channelChipModule, t_9)
		local var144 = if fFlagExpChatUseMessagesStore then not var108 else not p14.canLocalUserChat
		
		if var144 then
			var144 = reactModule.createElement
			local var145 = "TextLabel"
			local t_10 = {
				BackgroundTransparency = 1,
				TextWrapped = true,
				AnchorPoint = Vector2.new(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Font = configModule.ChatInputBarFont,
				Text = p14.disabledChatPlaceholderText,
				Position = UDim2.fromScale(1, 0),
				Size = var94:map(function(p42) --[[ line: 1614 ]]
					return UDim2.new(1, -(p42 + 8), 0, 0)
				end),
				TextColor3 = if var126 then chatInputBarSettings.PlaceholderColor3 else chatInputBarSettings.TextColor3,
				TextSize = if isSpatialUIEnabled then chatInputBarSettings.SpatialPanelTextSize else chatInputBarSettings.TextSize
			}
			local var147 = if var126 then 0.5 else 0
			t_10.TextTransparency = p14.transparencyValue:map(function(p43) --[[ line: 110 ]]
				-- upvalues: var147 (ref)
				return var147 + p43 * (1 - var147)
			end)
			t_10.Selectable = if expChatFocusablePlaceholderText then true else nil
			t_10.SelectionImageObject = if expChatFocusablePlaceholderText then var123 else nil
			t_10.TextXAlignment = Enum.TextXAlignment.Left
			t_10.TextYAlignment = Enum.TextYAlignment.Top
			t_10.ref = if expChatFocusablePlaceholderText then var100 else nil
			var144 = var144(var145, t_10)
		end
		t_8.DisabledPlaceholderLabel = var144
		local var148 = if fFlagExpChatUseMessagesStore then var108 else p14.canLocalUserChat
		
		if var148 then
			var148 = reactModule.createElement
			local var149 = "Frame"
			local t_10 = {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Position = UDim2.fromScale(1, 0),
				Size = var94:map(function(p44) --[[ line: 1642 ]]
					return UDim2.new(1, -(p44 + 8), 0, 0)
				end)
			}
			local t_11 = {}
			local var152 = if fFlagExpChatUseMessagesStore then var108 else p14.canLocalUserChat
			
			if var152 then
				var152 = reactModule.createElement
				local var153 = "TextBox"
				local t_12 = {
					AnchorPoint = Vector2.new(0, 0),
					AutomaticSize = Enum.AutomaticSize.XY,
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					FontFace = chatInputBarSettings.FontFace,
					PlaceholderText = if var126 then p14.placeholderText else "",
					Selectable = if fFlagEnableConsoleExpControls then true else nil,
					SelectionImageObject = var123,
					Size = UDim2.fromScale(1, 0),
					Text = "",
					PlaceholderColor3 = chatInputBarSettings.PlaceholderColor3,
					TextColor3 = chatInputBarSettings.TextColor3,
					TextSize = if isSpatialUIEnabled then chatInputBarSettings.SpatialPanelTextSize else chatInputBarSettings.TextSize
				}
				local var155 = if var126 then 0.5 else 0
				t_12.TextTransparency = p14.transparencyValue:map(function(p45) --[[ line: 110 ]]
					-- upvalues: var155 (ref)
					return var155 + p45 * (1 - var155)
				end)
				local textStrokeTransparency = chatInputBarSettings.TextStrokeTransparency
				t_12.TextStrokeTransparency = p14.transparencyValue:map(function(p46) --[[ line: 110 ]]
					-- upvalues: textStrokeTransparency (ref)
					return textStrokeTransparency + p46 * (1 - textStrokeTransparency)
				end)
				t_12.TextStrokeColor3 = chatInputBarSettings.TextStrokeColor3
				t_12.TextWrapped = true
				t_12.TextXAlignment = Enum.TextXAlignment.Left
				t_12.TextYAlignment = Enum.TextYAlignment.Top
				t_12.ZIndex = 2
				t_12[reactModule.Event.Focused] = var116
				t_12[reactModule.Event.FocusLost] = var117
				t_12[reactModule.Change.Text] = var120
				t_12[reactModule.Event.ReturnPressedFromOnScreenKeyboard] = var121
				t_12.ref = if chatInputBarSettings.TextBox then var98 else var97
				var152 = var152(var153, t_12)
			end
			t_11.TextBox = var152
			var148 = var148(var149, t_10, t_11)
		end
		t_8.TextBoxContainer = var148
		t_8.UIPadding = reactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 10),
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10)
		})
		t_6.TextContainer = createElement_4(var139, t_7, t_8)
		local createElement_6 = reactModule.createElement
		local var156 = "TextButton"
		local t_10 = {
			AnchorPoint = Vector2.new(1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Position = UDim2.fromScale(1, 0),
			Selectable = false,
			Size = UDim2.new(0, p14.sendButtonContainerWidth, 1, 0),
			Text = "",
			[reactModule.Event.Activated] = var112
		}
		local t_11 = {
			Layout = reactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			})
		}
		local createElement_7 = reactModule.createElement
		local var159 = imageSetLabel
		local t_12 = {
			BackgroundTransparency = 1,
			ZIndex = 2,
			ImageColor3 = if var125 then chatInputBarSettings.PlaceholderColor3 else chatInputBarSettings.TextColor3
		}
		local var161 = if var125 then 0.5 else 0
		t_12.ImageTransparency = p14.transparencyValue:map(function(p47) --[[ line: 110 ]]
			-- upvalues: var161 (ref)
			return var161 + p47 * (1 - var161)
		end)
		t_12.Image = images["icons/actions/send"]
		t_12.Size = UDim2.new(0, 30, 0, 30)
		t_11.SendIcon = createElement_7(var159, t_12)
		t_6.SendButton = createElement_6(var156, t_10, t_11)
		t_3.Container = createElement_3(var136, t_5, t_6)
		createElement_1 = createElement_1(var131, t_2, t_3)
	end
	t_1.Background = createElement_1
	
	return createElement(var128, t, t_1)
end))