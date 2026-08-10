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
local var57 = getFocusNavigationStoreModule(false)
local var58 = expChatSharedModule.Flags.FIntPresetChatCooldownLuaMs / 1000

local function setTransparency(value, p0) --[[ line: 106 ]]
	return p0:map(function(p1) --[[ line: 107 ]]
		-- upvalues: value (ref)
		return value + p1 * (1 - value)
	end)
end

local var60 = nil
local var61 = nil
local var62 = nil
local var63 = nil
local var64 = nil

local function onChatInputBarFocusLost(p2, p3, p4) --[[ line: 118 ]]
	-- upvalues: userInputService (ref), guiService (ref)
	p3 = p3 or { Enum.KeyCode.ButtonB }
	local var68 = nil
	
	return userInputService.InputBegan:Connect(function(p5) --[[ line: 122 ]]
		-- upvalues: p3 (ref), guiService (copy), p4 (ref), p2 (ref), var68 (write)
		local var69 = if p5 then p5.KeyCode else nil
		
		for i, v in p3 do
			if var69 == v then
				guiService:SetMenuIsOpen(false, "ExperienceChat")
				p4()
				
				if p2 then
					p2()
				else
					guiService.SelectedCoreObject = nil
				end
				if not var68 then break end
				var68:Disconnect()
				var68 = nil
				
				return
			end
		end
	end)
end

local function useEffectChatInputBarFocus(p6, p7, p8, p9, p10) --[[ line: 146 ]]
	-- upvalues: fFlagConsoleChatUseChromeFocusUtils (ref), reactModule (ref), signalsModule (ref), var57 (ref), expChatFocusablePlaceholderText (ref), guiService (ref), userInputService (ref), focusUtils (ref), fFlagChromeChatGamepadSupportFix (ref), fFlagEnableConsoleExpControls (ref), onChatInputBarFocusLost (ref), actionBindableEvent (ref)
	if fFlagConsoleChatUseChromeFocusUtils then
		reactModule.useEffect(function() --[[ line: 148 ]]
			-- upvalues: signalsModule (copy), var57 (copy), p7 (ref), p6 (ref), expChatFocusablePlaceholderText (copy), p8 (ref), guiService (copy), p9 (ref), userInputService (copy), focusUtils (copy), p10 (ref)
			local t = {}
			local var71 = nil
			local var72 = signalsModule.createEffect(function(p11) --[[ line: 152 ]]
				-- upvalues: var57 (copy), p7 (copy), p6 (copy), expChatFocusablePlaceholderText (copy), p8 (copy), guiService (copy), p9 (copy), var71 (write), userInputService (copy), t (ref), focusUtils (copy), p10 (copy)
				local chatInputBarFocused = var57.getChatInputBarFocused(p11)
				local var74 = if p7.current then p7.current else p6.current
				
				if expChatFocusablePlaceholderText then
					var74 = var74 or p8.current
				end
				if not var74 then return end
				if chatInputBarFocused then
					guiService:SetMenuIsOpen(true, "ExperienceChat")
					p9()
					guiService.SelectedCoreObject = var74
					
					if var71 then
						return
					else
						var71 = userInputService.InputBegan:Connect(function(p12) --[[ line: 174 ]]
							-- upvalues: t (copy), focusUtils (copy), var57 (copy)
							if p12 and t[p12.KeyCode] then
								focusUtils.FocusOnChrome(function() --[[ line: 177 ]]
									-- upvalues: var57 (copy)
									var57.unfocusChatInputBar()
								end, "chat")
							end
						end)
						
						return
					end
				elseif guiService.MenuIsOpen then
					guiService:SetMenuIsOpen(false, "ExperienceChat")
					p10()
					
					if var71 then
						var71:Disconnect()
						var71 = nil
					end
				end
			end)
			
			return function() --[[ line: 193 ]]
				-- upvalues: var72 (ref), var71 (write)
				var72()
				
				if var71 then
					var71:Disconnect()
					var71 = nil
				end
			end
		end, {})
		
		return
	elseif fFlagChromeChatGamepadSupportFix then
		reactModule.useEffect(function() --[[ line: 203 ]]
			-- upvalues: p7 (ref), p6 (ref), fFlagEnableConsoleExpControls (copy), guiService (copy), p9 (ref), onChatInputBarFocusLost (copy), p10 (ref), actionBindableEvent (copy)
			local var75 = nil
			local var76 = nil
			local eventConnection = actionBindableEvent.Event:Connect(function(p13) --[[ line: 207 ]]
				-- upvalues: p7 (copy), p6 (copy), fFlagEnableConsoleExpControls (copy), guiService (copy), p9 (copy), var76 (write), var75 (write), onChatInputBarFocusLost (copy), p10 (copy)
				local var78 = if p7.current then p7.current else p6.current
				
				if fFlagEnableConsoleExpControls and p13.type == "ChatTopBarFocusSelect" and var78 then
					guiService:SetMenuIsOpen(true, "ExperienceChat")
					p9()
					guiService.SelectedCoreObject = var78
					var76 = task.delay(0, function() --[[ line: 219 ]]
						-- upvalues: var76 (copy), var75 (copy), onChatInputBarFocusLost (copy), p13 (ref), p10 (copy)
						var76 = nil
						
						if var75 then
							var75:Disconnect()
						end
						var75 = onChatInputBarFocusLost(p13.onSelectionLost, p13.keybinds, p10)
					end)
				end
			end)
			
			return function() --[[ line: 233 ]]
				-- upvalues: eventConnection (ref), var76 (write), var75 (write)
				eventConnection:disconnect()
				
				if var76 then
					task.cancel(var76)
					var76 = nil
				end
				if var75 then
					var75:Disconnect()
					var75 = nil
				end
			end
		end, { p6.current, p7.current })
	end
end

return reactModule.memo(localizationModule.connect(function(p48) --[[ line: 1704 ]]
	-- upvalues: getOtherDisplayNameInWhisperChannelModule (ref)
	local list = nil
	
	if p48.targetTextChannel then
		for i, v in pairs({
			RBXTeam = "CoreScripts.TextChat.TeamChat.PrefixText",
			RBXWhisper = "CoreScripts.TextChat.WhisperChat.PrefixText.Outgoing"
		}) do
			if string.match(p48.targetTextChannel.Name, i) then
				if i == "RBXWhisper" then
					local var217 = getOtherDisplayNameInWhisperChannelModule(p48.targetTextChannel, p48.localPlayer)
					
					if var217 then
						list = { v, { RBX_NAME = var217 } }
					end
				else
					list = v
				end
			end
		end
	end
	return { targetTextChannelDisplayName = list }
end)(function(p14) --[[ line: 249 | named "ChatInputBar" ]]
	-- upvalues: reactModule (ref), fFlagExpChatUseUnifiedTooltipStore (ref), getChatTooltipStoreModule (ref), fFlagExpChatDictation_1 (ref), useSendTelemetryModule (ref), reactFocusNavigationModule (ref), fFlagExpChatFocusViaLastModeFixModule (ref), focusNavigationUtilsModule (ref), signalsReactModule (ref), var57 (ref), fFlagExpChatUseMessagesStore (ref), getMessagesStoreModule (ref), fFlagExpChatPresetChatEnabled (ref), getPresetChatStoreModule (ref), textChatService (ref), var61 (write), autocompleteTextModule (ref), initializeCommandsModule (ref), getEnableChatInputBarConfigurationAutocompleteEnabledModule (ref), var60 (write), initializeEmojisModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), var62 (write), initializeGlobalCommandsModule (ref), initialCommandsModule (ref), var20 (ref), fFlagExpChatDictation (ref), fFlagExpChatPresetChatGamepadEnabledModule (ref), guiService (ref), presetSearchModule (ref), var58 (ref), sendPresetModule (ref), expChatSharedModule (ref), constantsModule (ref), fFlagExpChatPresetChatAutocompleteEnabledModule (ref), presetEntryTextModule (ref), expChatDoNotSetCursorPosition (ref), expChatPresetChatIXPExposure (ref), IXPServiceWrapperModule (ref), expChatPresetChatIXPLayerName (ref), fFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule (ref), fFlagExpChatFixBackspaceNilTargetChannel (ref), configModule (ref), playersService (ref), fFlagEnableConsoleExpControls (ref), fFlagChromeChatGamepadSupportFix (ref), onChatInputBarFocusLost (ref), actionBindableEvent (ref), useEffectChatInputBarFocus (ref), fFlagExpChatUniverseChatPresetEnabledModule (ref), sortCommandResultsCallbackModule (ref), sortEmojiResultsCallbackModule (ref), list (ref), var63 (write), RBXTeamCommand (ref), var64 (write), RBXWhisperCommand (ref), chatOptimizeCommandProcessing (ref), autoCastCommand (ref), promiseModule (ref), useCursor (ref), expChatDictationIXPExposure (ref), expChatDictationIXPLayerName (ref), useInterpolatedClientSettingsModule (ref), fFlagExpChatNewInputBarModule (ref), autocompleteDropdownModule (ref), setTransparency (ref), fFlagExpChatNewInputBarDictationModule (ref), chatInputBarV2DictationModule (ref), chatInputBarV2Module (ref), dictationInputBarModule (ref), expChatFocusablePlaceholderText (ref), channelChipModule (ref), imageSetLabel (ref), images (ref)
	local var79 = reactModule.useRef("")
	
	if fFlagExpChatUseUnifiedTooltipStore then
		local setIsChatInputBarVisible = getChatTooltipStoreModule(false).setIsChatInputBarVisible
		reactModule.useEffect(function() --[[ line: 257 ]]
			-- upvalues: p14 (ref), setIsChatInputBarVisible (ref)
			if p14.visible == nil then
				setIsChatInputBarVisible(true)
			else
				setIsChatInputBarVisible(p14.visible)
			end
			return function() --[[ line: 266 ]]
				-- upvalues: setIsChatInputBarVisible (copy)
				setIsChatInputBarVisible(false)
			end
		end, { p14.visible, setIsChatInputBarVisible })
	end
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var80, var81 = reactModule.useState("")
	local var82, var83 = reactModule.useState(0)
	local var84 = var82
	local var85 = var83
	local var86, var87 = reactModule.useState(0)
	local var88 = var86
	local var89 = var87
	local var90, var91 = reactModule.useState(false)
	local var92, _ = reactModule.useState(true)
	local var93, var94 = reactModule.useBinding(0)
	local var95 = reactModule.useRef(false)
	local var96 = reactModule.useRef(nil)
	local var97 = reactModule.useRef(nil)
	local var98 = if fFlagExpChatDictation_1 then useSendTelemetryModule({
		enabled = fFlagExpChatDictation_1,
		textBoxRef = var96,
		customTextBoxRef = var97
	}) else nil
	local var99 = reactModule.useRef(nil)
	local var100 = reactModule.useRef(nil)
	local var101 = reactModule.useRef(nil)
	local var102 = reactModule.useRef(nil)
	local var103 = reactModule.useRef(false)
	local var104 = reactFocusNavigationModule.useFocusGuiObject()
	local var105 = if not fFlagExpChatFocusViaLastModeFixModule then focusNavigationUtilsModule.useLastInputMode() else nil
	local var106 = if fFlagExpChatFocusViaLastModeFixModule then signalsReactModule.useSignalState(var57.getChatInputBarFocused) else nil
	local var107 = nil
	local _ = nil
	
	if fFlagExpChatUseMessagesStore then
		var107 = signalsReactModule.useSignalState(getMessagesStoreModule(false).getCanLocalUserChat)
	end
	local var108 = if fFlagExpChatPresetChatEnabled then signalsReactModule.useSignalState(getPresetChatStoreModule(false).getIsTrayOpen) else nil
	local var109 = if fFlagExpChatPresetChatEnabled then signalsReactModule.useSignalState(getPresetChatStoreModule(false).getIsEnabled) else nil
	local var110 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 329 ]]
		-- upvalues: var97 (ref), p14 (ref)
		var97.current = p14.chatInputBarSettings.TextBox
	end, {
		if p14.chatInputBarSettings.TextBox ~= nil then "nil" else p14.chatInputBarSettings.TextBox
	})
	reactModule.useEffect(function() --[[ line: 334 ]]
		-- upvalues: p14 (ref), textChatService (copy), var61 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy), getEnableChatInputBarConfigurationAutocompleteEnabledModule (copy), var60 (copy), initializeEmojisModule (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var62 (copy), initializeGlobalCommandsModule (copy), initialCommandsModule (copy)
		if not p14.autocompleteEnabled then return end
		local t = {}
		local descendantAddedConnection = textChatService.DescendantAdded:Connect(function(p15) --[[ line: 339 ]]
			-- upvalues: var61 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy), t (ref)
			if p15:IsA("TextChatCommand") and string.sub(p15.PrimaryAlias, 1, 1) == "/" then
				var61 = autocompleteTextModule.new(initializeCommandsModule)
				table.insert(t, p15:GetPropertyChangedSignal("AutocompleteVisible"):Connect(function() --[[ line: 345 ]]
					-- upvalues: var61 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy)
					var61 = autocompleteTextModule.new(initializeCommandsModule)
				end))
			end
		end)
		local descendantRemovingConnection = textChatService.DescendantRemoving:Connect(function(p16) --[[ line: 352 ]]
			-- upvalues: var61 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy)
			if p16:IsA("TextChatCommand") and string.sub(p16.PrimaryAlias, 1, 1) == "/" then
				var61 = autocompleteTextModule.new(initializeCommandsModule)
			end
		end)
		
		if getEnableChatInputBarConfigurationAutocompleteEnabledModule() then
			var61 = autocompleteTextModule.new(initializeCommandsModule)
			var60 = autocompleteTextModule.new(initializeEmojisModule)
			
			if getFFlagTextChatEnableUniverseChatTabs() then
				var62 = autocompleteTextModule.new(initializeGlobalCommandsModule)
			end
			local var164 = initialCommandsModule()
			
			if var164 then
				for i, v in var164 do
					table.insert(t, v:GetPropertyChangedSignal("AutocompleteVisible"):Connect(function() --[[ line: 369 ]]
						-- upvalues: var61 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy)
						var61 = autocompleteTextModule.new(initializeCommandsModule)
					end))
				end
			end
		end
		return function() --[[ line: 377 ]]
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
	local var111 = reactModule.useCallback(function() --[[ line: 390 ]]
		-- upvalues: var20 (copy), var80 (ref), fFlagExpChatUseMessagesStore (copy), var107 (write), p14 (ref), var95 (ref), var96 (ref), var97 (ref), var98 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagExpChatDictation (copy), var81 (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy), var103 (ref)
		var20:trace("onSendActivated with input text: '{}'", var80)
		local var165 = if fFlagExpChatUseMessagesStore then var107 else p14.canLocalUserChat
		
		if not var95.current or not var165 then
			var20:debug("onSendActivated could not send message. isMounted: {} canLocalUserChat: {}", tostring(var95.current), var165)
			
			return
		elseif var96.current or var97.current then
			local var166 = if var97.current then var97.current.Text else var96.current.Text
			local var167 = if var98 then var98.consumeOnSend(var166) else nil
			local var168 = if getFFlagTextChatEnableUniverseChatTabs() and p14.isGlobalChatTabActive and p14.onSendGlobalChat then p14.onSendGlobalChat else p14.onSendChat
			
			if not var168 or string.find(var166, "%S") == nil then
				var20:debug("onSendActivated could not send message. text: '{}' canLocalUserChat: {}", var166, var165)
			elseif fFlagExpChatDictation then
				var168(var166, var167, var167 ~= nil)
			else
				var168(var166)
			end
			if var97.current then
				var97.current.Text = ""
				var97.current:ReleaseFocus()
			end
			if var96.current then
				var96.current.Text = ""
				var96.current:ReleaseFocus()
			end
			var81("")
			
			if fFlagExpChatPresetChatGamepadEnabledModule then
				local current = var97.current or var96.current
				
				if current then
					guiService.SelectedCoreObject = current
				end
			end
			if p14.targetTextChannel and p14.targetTextChannelDisplayName ~= "" then
				var103.current = true
				
				return
			end
		else
			var20:debug("onSendActivated could not send message because textBoxRef.current was nil")
		end
	end, {
		var80, var97.current, var107, p14.canLocalUserChat, p14.isGlobalChatTabActive,
		p14.onSendChat or false, p14.onSendGlobalChat or false,
		p14.targetTextChannel or false, p14.targetTextChannelDisplayName,
		if var98 then var98.consumeOnSend else false
	})
	local var112 = if fFlagExpChatDictation_1 then reactModule.useCallback(function(p17) --[[ line: 477 ]]
		-- upvalues: fFlagExpChatUseMessagesStore (copy), var107 (write), p14 (ref), var95 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var97 (ref), var96 (ref), var81 (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy), var103 (ref)
		if not var95.current or not (if fFlagExpChatUseMessagesStore then var107 else p14.canLocalUserChat) then return end
		local var170 = if p17 then p17.textSent else ""
		local var171 = if getFFlagTextChatEnableUniverseChatTabs() and p14.isGlobalChatTabActive and p14.onSendGlobalChat then p14.onSendGlobalChat else p14.onSendChat
		
		if var171 and string.find(var170, "%S") ~= nil then
			var171(var170, p17, true)
		end
		if var97.current then
			var97.current.Text = ""
			var97.current:ReleaseFocus()
		end
		if var96.current then
			var96.current.Text = ""
			var96.current:ReleaseFocus()
		end
		var81("")
		
		if fFlagExpChatPresetChatGamepadEnabledModule then
			local current = var97.current or var96.current
			
			if current then
				guiService.SelectedCoreObject = current
			end
		end
		if p14.targetTextChannel and p14.targetTextChannelDisplayName ~= "" then
			var103.current = true
		end
	end, {
		var97.current, var107, p14.canLocalUserChat, p14.isGlobalChatTabActive,
		p14.onSendChat or false, p14.onSendGlobalChat or false,
		p14.targetTextChannel or false, p14.targetTextChannelDisplayName
	}) else nil
	
	local function sendSelectedPreset(value) --[[ line: 525 ]]
		-- upvalues: getPresetChatStoreModule (copy), presetSearchModule (copy), var20 (copy), var58 (copy), sendPresetModule (copy), p14 (ref), expChatSharedModule (copy), constantsModule (copy)
		local var173 = getPresetChatStoreModule(false)
		local presetIdForValue = presetSearchModule.getPresetIdForValue(var173, value)
		
		if presetIdForValue == nil then
			var20:warning("Could not resolve a preset id for autocomplete entry '{}'; skipping send.", value)
			
			return
		end
		var173.setPresetCooldownEndsAt(os.clock() + var58)
		local var175 = sendPresetModule(presetIdForValue, p14.targetTextChannel)
		
		if var175 == "Sent" then
			expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
				event_type = constantsModule.Analytics.EventTypes.Click,
				component = constantsModule.Analytics.Components.PresetAutocomplete,
				preset_id = presetIdForValue
			}, expChatSharedModule.Analytics.DefaultStandardizedFields)
			
			return
		end
		var173.setPresetCooldownEndsAt(nil)
		var20:warning("Could not send preset {} from autocomplete: {}", presetIdForValue, var175)
	end
	
	local var114 = reactModule.useCallback(function(p18) --[[ line: 555 ]]
		-- upvalues: fFlagExpChatPresetChatAutocompleteEnabledModule (copy), p14 (ref), presetEntryTextModule (copy), var97 (ref), var96 (ref), var84 (write), var81 (ref), var95 (ref), fFlagExpChatFocusViaLastModeFixModule (copy), var106 (ref), var104 (ref), var105 (ref), expChatDoNotSetCursorPosition (copy), sendSelectedPreset (ref), var20 (copy)
		local var176 = if fFlagExpChatPresetChatAutocompleteEnabledModule and p14.autocompleteDropdownReducer.autocompleteType == "presets" then presetEntryTextModule.undecorate(p18.TextLabel.Text, p14.chatInputBarSettings.TextSize) else nil
		p14.autocompleteDropdownActivated(false)
		p14.autocompleteDropdownResultsChanged({})
		local var177 = if var97.current then var97.current else var96.current
		
		if var177 then
			local text = var177.Text
			local substring = string.sub(text, 1, var84 - 1)
			local var179 = if fFlagExpChatPresetChatAutocompleteEnabledModule and var176 ~= nil then "" else string.sub(text, var84, #text)
			local var180 = ""
			
			if p14.autocompleteDropdownReducer.autocompleteType == "emojis" then
				var180 = string.gsub(substring, ":[^:]*$", p18.EmojiLabel.Text)
			elseif p14.autocompleteDropdownReducer.autocompleteType == "commands" then
				var180 = string.gsub(substring, "(/.*)", p18.TextLabel.Text)
			end
			if var179 ~= "" then
				var180 ..= var179
			end
			var177.Text = var180
			var81(var180)
			
			if var95.current then
				var177:CaptureFocus()
				
				if fFlagExpChatFocusViaLastModeFixModule then
					if var106 then
						var104(var177)
					end
				elseif var105 == "Focus" then
					var104(var177)
				end
				if var179 ~= "" and not expChatDoNotSetCursorPosition then
					var177.CursorPosition = #var180 - #var179 + 1
				end
			end
			p14.autocompleteDropdownDeactivated()
			
			if fFlagExpChatPresetChatAutocompleteEnabledModule and var176 ~= nil then
				sendSelectedPreset(var176)
				
				return
			end
		else
			var20:error("Could not find textBox")
		end
	end, {
		if fFlagExpChatFocusViaLastModeFixModule then var106 else nil, var104, var92,
		var84, if fFlagExpChatFocusViaLastModeFixModule then nil else var105,
		p14.autocompleteDropdownActivated, p14.autocompleteDropdownDeactivated,
		p14.autocompleteDropdownReducer and p14.autocompleteDropdownReducer.autocompleteType,
		p14.autocompleteDropdownResultsChanged,
		if fFlagExpChatPresetChatAutocompleteEnabledModule then p14.targetTextChannel or false else nil,
		if fFlagExpChatPresetChatAutocompleteEnabledModule then p14.chatInputBarSettings.TextSize else nil
	})
	reactModule.useEffect(function() --[[ line: 647 ]]
		-- upvalues: var95 (ref), var97 (ref), var96 (ref), var20 (copy)
		if var95.current then
			local var181 = if var97.current then var97.current else var96.current
			
			if var181 then
				var181:CaptureFocus()
				
				return
			end
			var20:error("Could not focus chat input bar because textBox not found")
		end
	end, { p14.shouldFocusChatInputBar, var97.current })
	
	if fFlagExpChatPresetChatEnabled then
		reactModule.useEffect(function() --[[ line: 659 ]]
			-- upvalues: var108 (ref), var97 (ref), var96 (ref)
			if not var108 then return end
			local var182 = if var97.current then var97.current else var96.current
			
			if var182 and var182:IsFocused() then
				var182:ReleaseFocus()
			end
		end, { var108 })
	end
	local createElement_1
	reactModule.useEffect(function() --[[ line: 670 ]]
		-- upvalues: var20 (copy), var95 (ref), expChatPresetChatIXPExposure (copy), IXPServiceWrapperModule (copy), expChatPresetChatIXPLayerName (copy)
		var20:trace("Mounted")
		var95.current = true
		
		if expChatPresetChatIXPExposure then
			IXPServiceWrapperModule:LogUserLayerExposure(expChatPresetChatIXPLayerName)
		end
		return function() --[[ line: 678 ]]
			-- upvalues: var20 (copy), var95 (copy)
			var20:trace("Unmounting")
			var95.current = false
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 684 ]]
		-- upvalues: p14 (ref), var97 (ref), var96 (ref), var85 (write)
		local var183 = nil
		
		if p14.autocompleteEnabled then
			local var184 = if var97.current then var97.current else var96.current
			
			if var184 then
				var183 = var184:GetPropertyChangedSignal("CursorPosition"):Connect(function() --[[ line: 689 ]]
					-- upvalues: var184 (ref), var85 (copy)
					local cursorPosition = var184.CursorPosition
					
					if cursorPosition and cursorPosition ~= -1 then
						var85(cursorPosition)
					end
				end)
			end
		end
		return function() --[[ line: 698 ]]
			-- upvalues: var183 (write)
			if var183 then
				var183:Disconnect()
			end
		end
	end, { var97.current })
	reactModule.useEffect(function() --[[ line: 706 ]]
		-- upvalues: p14 (ref), var102 (ref)
		if p14.autocompleteEnabled then
			var102.current = p14.userInputService.InputBegan:connect(function(p19, _) --[[ line: 708 ]]
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
			
			return function() --[[ line: 730 ]]
				-- upvalues: var102 (copy)
				local current = var102.current
				
				if current and current.Connected then
					current:Disconnect()
				end
				var102.current = nil
			end
		end
		return function() --[[ line: 738 ]] end
	end, { p14.userInputService, p14.autocompleteDropdownReducer })
	reactModule.useEffect(function() --[[ line: 742 ]]
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), p14 (ref), fFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule (copy), var101 (ref), var97 (ref), var96 (ref), var103 (ref), fFlagExpChatFixBackspaceNilTargetChannel (copy), var20 (copy), var80 (ref)
		local var185 = if fFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule then not p14.isChannelBarVisible or getFFlagTextChatEnableUniverseChatTabs() and not p14.developerChannelTabsEnabled else not p14.isChannelBarVisible
		var101.current = p14.userInputService.InputEnded:connect(function(p20, _) --[[ line: 750 ]]
			-- upvalues: var97 (copy), var96 (copy), p14 (copy), var103 (copy), var185 (ref), fFlagExpChatFixBackspaceNilTargetChannel (copy), var20 (copy), var80 (copy)
			local current
			if var97.current then
				current = var97.current
				
				if current then
					current = var97.current:IsFocused()
					
					if current then
						current = p20
						
						if current then
							current = p20.KeyCode == Enum.KeyCode.Backspace
							current = nil
						end
					end
				end
			else
				current = var96.current and (var96.current:IsFocused() and (p20 and p20.KeyCode == Enum.KeyCode.Backspace))
			end
			if current then
				local var186 = (p14.targetTextChannelDisplayName or "") ~= ""
				
				if var103.current and var185 and (if fFlagExpChatFixBackspaceNilTargetChannel then var186 else true) then
					p14.resetTargetChannel(if fFlagExpChatFixBackspaceNilTargetChannel then p14.isGlobalChatTabActive else nil)
					var20:debug("ChatInputBar ChatInputBarResetTargetChannel()")
					var103.current = false
					
					return
				elseif var80 == "" and (if fFlagExpChatFixBackspaceNilTargetChannel then var186 else p14.targetTextChannelDisplayName ~= "") then
					var103.current = true
				end
			end
		end)
		
		return function() --[[ line: 791 ]]
			-- upvalues: var101 (copy)
			local current = var101.current
			
			if current and current.Connected then
				current:Disconnect()
			end
			var101.current = nil
		end
	end, {
		p14.userInputService, var97.current, p14.isChannelBarVisible,
		p14.targetTextChannelDisplayName, p14.resetTargetChannel,
		if fFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule then p14.developerChannelTabsEnabled else nil,
		if fFlagExpChatFixBackspaceNilTargetChannel then p14.isGlobalChatTabActive else nil
	})
	reactModule.useEffect(function() --[[ line: 809 ]]
		-- upvalues: p14 (ref), configModule (copy), var97 (ref), var96 (ref), var110 (ref)
		p14.contextActionService:BindCoreAction("FocusChat", function(_, p21, p22) --[[ line: 810 | named "handleAction" ]]
			-- upvalues: p14 (copy), configModule (copy), var97 (copy), var96 (copy), var110 (copy)
			if p14.isChatHotkeyEnabled and p22 and (p22.KeyCode == configModule.ChatInputBarDefaultFocusKeyCode or p22.KeyCode == p14.devDefinedFocusKeyCode) then
				local var187 = if var97.current then var97.current else var96.current
				
				if var187 and p21 == Enum.UserInputState.Begin and (var187 and not var187:IsFocused()) then
					task.delay(0, function() --[[ line: 832 ]]
						-- upvalues: var187 (ref)
						var187:CaptureFocus()
					end)
					p14.focusChatHotKeyActivated()
					var110.current = true
					
					return Enum.ContextActionResult.Sink
				end
			end
			return Enum.ContextActionResult.Pass
		end, false, Enum.UserInputType.Keyboard)
		
		return function() --[[ line: 856 ]]
			-- upvalues: p14 (copy)
			p14.contextActionService:UnbindCoreAction("FocusChat")
		end
	end, {
		p14.isChatHotkeyEnabled,
		p14.devDefinedFocusKeyCode,
		var110.current,
		var97.current
	})
	
	local _ = function(p23) --[[ line: 863 ]]
		-- upvalues: textChatService (copy)
		local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		
		if chatInputBarConfiguration then
			chatInputBarConfiguration.IsFocusedWrite = p23
		end
	end
	
	local var115 = reactModule.useCallback(function() --[[ line: 870 ]]
		-- upvalues: var91 (ref), p14 (ref), textChatService (copy)
		var91(true)
		p14.onFocus()
		local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		
		if chatInputBarConfiguration then
			chatInputBarConfiguration.IsFocusedWrite = true
		end
	end, { p14.onFocus })
	local var116 = reactModule.useCallback(function(_, p24, p25) --[[ line: 879 ]]
		-- upvalues: var20 (copy), var100 (ref), p14 (ref), fFlagExpChatPresetChatAutocompleteEnabledModule (copy), var114 (ref), var111 (ref), var95 (ref), var97 (ref), var96 (ref), var84 (write), expChatDoNotSetCursorPosition (copy), var91 (ref), textChatService (copy), var110 (ref), playersService (copy)
		local v
		var20:debug("Focus lost with enter: {}", tostring(p24))
		local current = var100.current
		
		if p24 or p25 and (p25.KeyCode == Enum.KeyCode.Return or p25.KeyCode == Enum.KeyCode.KeypadEnter) then
			if p14.autocompleteEnabled and current and (p14.autocompleteDropdownReducer.activated and #p14.autocompleteDropdownReducer.results > 0) and (not fFlagExpChatPresetChatAutocompleteEnabledModule or p14.autocompleteDropdownReducer.selectedIndex > 0) then
				for i, v in ipairs(current.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame:GetChildren()) do
					if v.ClassName == "Frame" and v.LayoutOrder == p14.autocompleteDropdownReducer.selectedIndex then
						var114(v.TextLabelButton)
						
						return
					end
				end
			else
				local x, y
				var111()
				
				if fFlagExpChatPresetChatAutocompleteEnabledModule and p14.autocompleteEnabled and p14.autocompleteDropdownReducer.autocompleteType == "presets" then
					p14.autocompleteDropdownDeactivated()
				end
			end
		end
		if var95.current then
			if not p14.autocompleteEnabled or not current or not p14.autocompleteDropdownReducer.activated then
				var91(false)
			elseif p25 then
				if p25.KeyCode == Enum.KeyCode.Escape then
					p14.autocompleteDropdownActivated(false)
					local var190 = if var97.current then var97.current else var96.current
					
					if var190 then
						local var191 = var84
						var190:CaptureFocus()
						
						if not expChatDoNotSetCursorPosition then
							var190.CursorPosition = var191
						end
						return
					else
						var20:error("Could not focus chat input bar because textBox not found")
					end
				else
					x = p25.Position.X
					y = p25.Position.Y
					local x_1 = current.AbsolutePosition.X
					local var192 = x_1 + current.AbsoluteSize.X
					local y_1 = current.AbsolutePosition.Y
					v = y_1 + current.AbsoluteSize.Y
					
					if x < x_1 or var192 < x or (y < y_1 or v < y) then
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
		if var110.current then
			x = playersService.LocalPlayer
			
			if x then
				y = Instance.new("TextBox")
				y.Visible = false
				y.Parent = x:FindFirstChildOfClass("PlayerGui")
				y:CaptureFocus()
				y:ReleaseFocus()
				y:Destroy()
			end
			var110.current = false
		end
	end)
	reactModule.useEffect(function() --[[ line: 1001 ]]
		-- upvalues: fFlagEnableConsoleExpControls (copy), var97 (ref), var96 (ref), fFlagChromeChatGamepadSupportFix (copy), guiService (copy), var115 (ref), onChatInputBarFocusLost (copy), var116 (ref), actionBindableEvent (copy)
		local var193 = nil
		local var194 = nil
		local eventConnection = actionBindableEvent.Event:Connect(function(p26) --[[ line: 1005 ]]
			-- upvalues: fFlagEnableConsoleExpControls (copy), var97 (copy), var96 (copy), fFlagChromeChatGamepadSupportFix (copy), guiService (copy), var115 (copy), var194 (write), var193 (write), onChatInputBarFocusLost (copy), var116 (copy)
			local var196 = if fFlagEnableConsoleExpControls then if var97.current then var97.current else var96.current else nil
			
			if p26.type == "ChatTopBarFocusActivated" then
				if not fFlagEnableConsoleExpControls then
					var196 = if var97.current then var97.current else var96.current
				end
				if var196 then
					task.delay(0, function() --[[ line: 1016 ]]
						-- upvalues: var196 (write)
						var196:CaptureFocus()
					end)
				end
			elseif not fFlagChromeChatGamepadSupportFix and fFlagEnableConsoleExpControls and (p26.type == "ChatTopBarFocusSelect" and var196) then
				guiService:SetMenuIsOpen(true, "ExperienceChat")
				var115()
				guiService.SelectedCoreObject = var196
				var194 = task.delay(0, function() --[[ line: 1031 ]]
					-- upvalues: var194 (copy), var193 (copy), onChatInputBarFocusLost (copy), p26 (ref), var116 (copy)
					var194 = nil
					
					if var193 then
						var193:Disconnect()
					end
					var193 = onChatInputBarFocusLost(p26.onSelectionLost, p26.keybinds, var116)
				end)
			end
		end)
		
		return function() --[[ line: 1045 ]]
			-- upvalues: eventConnection (ref), var194 (write), var193 (write)
			eventConnection:disconnect()
			
			if var194 then
				task.cancel(var194)
				var194 = nil
			end
			if var193 then
				var193:Disconnect()
				var193 = nil
			end
		end
	end, { var96.current, var97.current })
	useEffectChatInputBarFocus(var96, var97, var99, var115, var116)
	
	local function handlePresetAutocomplete(value, p27) --[[ line: 1066 ]]
		-- upvalues: p14 (ref), fFlagExpChatUniverseChatPresetEnabledModule (copy), presetSearchModule (copy), getPresetChatStoreModule (copy)
		if p27 < 1 then return end
		local var197 = if not (p14.targetTextChannel == nil and not fFlagExpChatUniverseChatPresetEnabledModule) then presetSearchModule.findMatchingPresets(getPresetChatStoreModule(false), string.sub(value, 1, p27 - 1)) else {}
		
		if #var197 == 0 then
			if p14.autocompleteDropdownReducer.autocompleteType == "presets" then
				p14.autocompleteDropdownDeactivated()
			end
			return
		else
			p14.autocompleteDropdownTypeChanged("presets")
			p14.autocompleteDropdownActivated(true)
			p14.autocompleteDropdownResultsChanged(var197)
			p14.autocompleteDropdownSelectionChanged(0)
		end
	end
	
	local function handleAutocomplete(p28, p29, p30) --[[ line: 1103 ]]
		-- upvalues: p14 (ref), var62 (copy), var61 (copy), sortCommandResultsCallbackModule (copy), var60 (copy), sortEmojiResultsCallbackModule (copy), var88 (write), list (copy), var81 (ref), expChatDoNotSetCursorPosition (copy), var100 (ref), var114 (ref), var89 (write), fFlagExpChatPresetChatAutocompleteEnabledModule (copy), handlePresetAutocomplete (ref)
		if p30 == "/" and p28.CursorPosition == 2 or p14.autocompleteDropdownReducer.autocompleteType == "commands" and p30 ~= ":" then
			p14.autocompleteDropdownTypeChanged("commands")
			p14.autocompleteDropdownActivated(true)
			
			if p30 == "" or p30 == " " then
				p14.autocompleteDropdownDeactivated()
			else
				local var198 = string.sub(p29, 1, p28.CursorPosition - 1):lower()
				local var199 = (if p14.isGlobalChatTabActive and var62 then var62 else var61):getResults(var198, sortCommandResultsCallbackModule)
				p14.autocompleteDropdownResultsChanged(var199)
				
				if var198 == var199[1] then
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
					if matchIndex == var88 then
						p14.autocompleteDropdownResultsChanged({})
						
						return
					end
					local var202 = string.sub(p29, var88 + 1, p28.CursorPosition - 2):lower()
					
					if list.includes(p14.autocompleteDropdownReducer.results, var202) then
						local text = string.sub(p29, 1, p28.CursorPosition - 2) .. string.sub(p29, p28.CursorPosition, #p29)
						p28.Text = text
						var81(text)
						
						if not expChatDoNotSetCursorPosition then
							p28.CursorPosition -= 1
						end
						local current = var100.current
						
						if current then
							for i, v in ipairs(current.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame:GetChildren()) do
								if v.ClassName == "Frame" then
									local textLabelButton = v:FindFirstChild("TextLabelButton")
									
									if textLabelButton then
										local textLabel = textLabelButton:FindFirstChild("TextLabel")
										
										if textLabel and textLabel.Text and textLabel.Text == var202 then
											var114(textLabelButton)
											
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
				var89(0)
				
				return
			else
				local var201 = string.sub(p29, matchIndex + 1, p28.CursorPosition - 1):lower()
				p14.autocompleteDropdownResultsChanged(if var201 and string.len(var201) > 1 then var60:getResults(var201, sortEmojiResultsCallbackModule) else {})
				
				return
			end
		else
			local matchIndex = string.find(p29, ":[^:]*$")
			
			if p30 == ":" then
				p14.autocompleteDropdownTypeChanged("emojis")
				p14.autocompleteDropdownActivated(true)
				p14.autocompleteDropdownResultsChanged({})
				var89(matchIndex)
				
				return
			elseif fFlagExpChatPresetChatAutocompleteEnabledModule then
				handlePresetAutocomplete(p29, p28.CursorPosition)
			end
		end
	end
	
	reactModule.useEffect(function() --[[ line: 1222 ]]
		-- upvalues: textChatService (copy), var63 (copy), RBXTeamCommand (copy), var64 (copy), RBXWhisperCommand (copy)
		if textChatService.CreateDefaultCommands then
			var63 = textChatService:FindFirstChild(RBXTeamCommand.name, true)
			var64 = textChatService:FindFirstChild(RBXWhisperCommand.name, true)
		end
	end, {})
	local var119 = reactModule.useCallback(function(p31) --[[ line: 1229 ]]
		-- upvalues: p14 (ref), var81 (ref), var20 (copy), var80 (ref), getEnableChatInputBarConfigurationAutocompleteEnabledModule (copy), handleAutocomplete (ref), var103 (ref), chatOptimizeCommandProcessing (copy), var79 (ref), var63 (copy), autoCastCommand (copy), RBXTeamCommand (copy), var64 (copy), RBXWhisperCommand (copy), promiseModule (copy)
		local text = p31.Text
		
		if p14.autocompleteEnabled then
			local var207 = p31.CursorPosition < #text + 1
			
			if string.find(text, "\r") then
				local replaced = string.gsub(text, "\r", "")
				p31.Text = replaced
				var81(replaced)
				
				if var207 then
					p31.CursorPosition -= 1
				end
				return
			else
				local substring = string.sub(text, p31.CursorPosition - 1, p31.CursorPosition - 1)
				var20:trace("Input: {}", text)
				local var210 = if utf8.len(text) then utf8.len(utf8.nfcnormalize(text)) else string.len(text)
				
				if var210 and p14.messageCharacterLimit < var210 then
					var20:debug("Message is over the character limit of {}", tostring(p14.messageCharacterLimit))
					p31.Text = var80
					
					return
				end
				var81(text)
				
				if getEnableChatInputBarConfigurationAutocompleteEnabledModule() and p14.autocompleteEnabled then
					handleAutocomplete(p31, text, substring)
				end
				var103.current = #text == 0 and var103.current
				
				if chatOptimizeCommandProcessing then
					if string.sub(text, 1, 1) == "/" and p14.localPlayer and text ~= var79.current then
						var79.current = text
						local userId = p14.localPlayer.UserId
						local t = {}
						
						if var63 and var63.Enabled then
							table.insert(t, autoCastCommand(RBXTeamCommand, userId, text))
						end
						if var64 and var64.Enabled then
							table.insert(t, autoCastCommand(RBXWhisperCommand, userId, text))
						end
						if #t == 0 then
							t = { promiseModule.reject() }
						end
						promiseModule.any(t):andThen(function() --[[ line: 1285 ]]
							-- upvalues: p31 (ref), var81 (copy), var103 (copy)
							p31.Text = ""
							var81("")
							var103.current = true
						end):catch(function(p32) --[[ line: 1291 ]]
							-- upvalues: var20 (copy)
							var20:trace("Could not send autoCastCommand. Error: {}", p32)
						end)
						
						return
					elseif string.sub(text, 1, 1) == "/" then
						return
					else
						var79.current = ""
						
						return
					end
				elseif p14.localPlayer then
					local userId = p14.localPlayer.UserId
					local t = {}
					
					if var63 and var63.Enabled then
						table.insert(t, autoCastCommand(RBXTeamCommand, userId, text))
					end
					if var64 and var64.Enabled then
						table.insert(t, autoCastCommand(RBXWhisperCommand, userId, text))
					end
					if #t == 0 then
						t = { promiseModule.reject() }
					end
					promiseModule.any(t):andThen(function() --[[ line: 1314 ]]
						-- upvalues: p31 (ref), var81 (copy), var103 (copy)
						p31.Text = ""
						var81("")
						var103.current = true
					end):catch(function(p33) --[[ line: 1320 ]]
						-- upvalues: var20 (copy)
						var20:trace("Could not send autoCastCommand. Error: {}", p33)
					end)
				end
			end
		end
	end)
	local var120 = reactModule.useCallback(function() --[[ line: 1327 ]]
		-- upvalues: var97 (ref), var96 (ref)
		local var213 = if var97.current then var97.current else var96.current
		
		if var213 then
			var213:ReleaseFocus(true)
		end
	end, { var96.current, var97.current })
	local var121 = reactModule.useCallback(function(p34) --[[ line: 1334 ]]
		-- upvalues: var94 (ref)
		var94(if p34.Visible then p34.AbsoluteSize.X else 0)
	end)
	local var122 = useCursor()
	local var123 = reactModule.useCallback(function(p35) --[[ line: 1340 ]]
		-- upvalues: p14 (ref)
		p14.autocompleteDropdownSelectionChanged(p35.LayoutOrder)
	end)
	local var124 = var80 == ""
	local var125 = var124 and not var90
	local chatInputBarSettings = p14.chatInputBarSettings
	local chatWindowSettings = p14.chatWindowSettings
	local var126 = if fFlagExpChatUseMessagesStore and var107 ~= nil then var107 else p14.canLocalUserChat
	reactModule.useEffect(function() --[[ line: 1355 ]]
		-- upvalues: expChatDictationIXPExposure (copy), var126 (ref), IXPServiceWrapperModule (copy), expChatDictationIXPLayerName (copy)
		if expChatDictationIXPExposure and var126 then
			IXPServiceWrapperModule:LogUserLayerExposure(expChatDictationIXPLayerName)
		end
	end, { var126 })
	local backgroundTransparency = useInterpolatedClientSettingsModule(chatInputBarSettings).BackgroundTransparency
	local backgroundTransparency_1 = useInterpolatedClientSettingsModule(chatWindowSettings).BackgroundTransparency
	local backgroundColor3 = useInterpolatedClientSettingsModule(chatWindowSettings).BackgroundColor3
	local isSpatialUIEnabled = p14.isSpatialUIEnabled
	local createElement = reactModule.createElement
	local var127 = "Frame"
	local t = {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = backgroundColor3,
		BackgroundTransparency = if fFlagExpChatNewInputBarModule then 1 else p14.transparencyValue:map(function(p36) --[[ line: 107 ]]
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
		[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p37) --[[ line: 1381 ]]
			-- upvalues: textChatService (copy), p14 (ref)
			local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			
			if chatInputBarConfiguration and p14.onAbsoluteSizeChanged then
				p14.onAbsoluteSizeChanged(p37, chatInputBarConfiguration)
			end
		end),
		[reactModule.Change.AbsolutePosition] = reactModule.useCallback(function(p38) --[[ line: 1387 ]]
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
			activated = p14.autocompleteDropdownReducer.activated and var90,
			results = p14.autocompleteDropdownReducer.results,
			selectedIndex = p14.autocompleteDropdownReducer.selectedIndex,
			autocompleteType = p14.autocompleteDropdownReducer.autocompleteType,
			onAutocompleteDropdownHover = var123,
			onAutocompleteSelected = var114,
			autocompleteDropdownRef = var100,
			textBoxRef = if chatInputBarSettings.TextBox then var97 else var96
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
		ChatInputBarV2 = if not fFlagExpChatNewInputBarModule then if fFlagExpChatNewInputBarDictationModule and fFlagExpChatDictation_1 and var126 then reactModule.createElement(chatInputBarV2DictationModule, {
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
			canLocalUserChatDerived = var107,
			targetChannelWidth = var93,
			showPlaceholderText = var125,
			hasEmptyInputText = var124,
			shouldTruncatePlaceholder = if fFlagExpChatPresetChatEnabled then var109 else nil,
			cursor = var122,
			placeholderRef = var99,
			textBoxRef = var96,
			customTextBoxRef = var97,
			onAbsoluteSizeChanged = var121,
			onFocused = var115,
			onFocusLost = var116,
			onTextChanged = var119,
			onReturnPressedFromOnScreenKeyboard = var120,
			onSendActivated = var111,
			onSendRecordingTap = var112,
			onTranscriptionStaged = if var98 then var98.stageTranscription else nil,
			inputText = var80,
			setInputText = var81,
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
			canLocalUserChatDerived = var107,
			targetChannelWidth = var93,
			showPlaceholderText = var125,
			hasEmptyInputText = var124,
			shouldTruncatePlaceholder = if fFlagExpChatPresetChatEnabled then var109 else nil,
			cursor = var122,
			placeholderRef = var99,
			textBoxRef = var96,
			customTextBoxRef = var97,
			onAbsoluteSizeChanged = var121,
			onFocused = var115,
			onFocusLost = var116,
			onTextChanged = var119,
			onReturnPressedFromOnScreenKeyboard = var120,
			onSendActivated = var111,
			isGlobalChatTabActive = if fFlagExpChatFixBackspaceNilTargetChannel then p14.isGlobalChatTabActive else nil
		}) else nil
	}
	
	if fFlagExpChatNewInputBarModule then
		createElement_1 = nil
	elseif fFlagExpChatDictation_1 and var126 then
		createElement_1 = reactModule.createElement(dictationInputBarModule, {
			chatInputBarSettings = chatInputBarSettings,
			transparencyValue = p14.transparencyValue,
			chatInputBarBackgroundTransparency = backgroundTransparency,
			inputText = var80,
			setInputText = var81,
			canLocalUserChat = var126,
			disabledChatPlaceholderText = p14.disabledChatPlaceholderText,
			targetChannelWidth = var93,
			showPlaceholderText = var125,
			placeholderText = p14.placeholderText,
			cursor = var122,
			placeholderRef = if expChatFocusablePlaceholderText then var99 else nil,
			textBoxRef = var96,
			customTextBoxRef = var97,
			onFocused = var115,
			onFocusLost = var116,
			onTextChanged = var119,
			onReturnPressedFromOnScreenKeyboard = var120,
			onChannelChipAbsoluteSizeChanged = var121,
			onChannelChipActivated = if fFlagExpChatFixBackspaceNilTargetChannel then function() --[[ line: 1526 ]]
				-- upvalues: p14 (ref)
				p14.resetTargetChannel(p14.isGlobalChatTabActive)
			end else p14.resetTargetChannel,
			targetTextChannel = p14.targetTextChannel,
			targetTextChannelDisplayName = p14.targetTextChannelDisplayName or "",
			isChannelBarVisible = p14.isChannelBarVisible,
			isGlobalChatTabActive = p14.isGlobalChatTabActive,
			developerChannelTabsEnabled = p14.developerChannelTabsEnabled,
			onDictationActivityChanged = p14.onDictationActivityChanged,
			onSendActivated = var111,
			onSendRecordingTap = var112,
			onTranscriptionStaged = if var98 then var98.stageTranscription else nil,
			isSpatialUIEnabled = isSpatialUIEnabled,
			isTextBoxSelectable = if fFlagEnableConsoleExpControls then true else nil,
			isPlaceholderSelectable = if expChatFocusablePlaceholderText then true else nil,
			placeholderSelectionImageObject = if expChatFocusablePlaceholderText then var122 else nil
		})
	else
		createElement_1 = reactModule.createElement
		local var130 = "Frame"
		local t_2 = {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = chatInputBarSettings.BackgroundColor3,
			BackgroundTransparency = if fFlagExpChatNewInputBarModule then 1 else p14.transparencyValue:map(function(p39) --[[ line: 107 ]]
				-- upvalues: backgroundTransparency (ref)
				return backgroundTransparency + p39 * (1 - backgroundTransparency)
			end),
			Size = UDim2.new(1, 0, 0, 0)
		}
		local t_3 = {}
		local createElement_2 = reactModule.createElement
		local var133 = "UIStroke"
		local t_4 = {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = configModule.ChatInputBarBorderColor3
		}
		local chatInputBarBorderTransparency = configModule.ChatInputBarBorderTransparency
		t_4.Transparency = p14.transparencyValue:map(function(p40) --[[ line: 107 ]]
			-- upvalues: chatInputBarBorderTransparency (ref)
			return chatInputBarBorderTransparency + p40 * (1 - chatInputBarBorderTransparency)
		end)
		t_3.Border = createElement_2(var133, t_4)
		t_3.Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 3) })
		local createElement_3 = reactModule.createElement
		local var135 = "Frame"
		local t_5 = {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}
		local t_6 = {}
		local createElement_4 = reactModule.createElement
		local var138 = "Frame"
		local t_7 = {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, -p14.sendButtonContainerWidth, 0, 0)
		}
		local t_8 = {}
		local createElement_5 = reactModule.createElement
		local t_9 = {}
		local var142 = 0
		t_9.transparency = p14.transparencyValue:map(function(p41) --[[ line: 107 ]]
			-- upvalues: var142 (ref)
			return var142 + p41 * (1 - var142)
		end)
		t_9.onAbsoluteSizeChanged = var121
		t_9.onChannelChipActivated = if fFlagExpChatFixBackspaceNilTargetChannel then function() --[[ line: 1574 ]]
			-- upvalues: p14 (ref)
			p14.resetTargetChannel(p14.isGlobalChatTabActive)
		end else p14.resetTargetChannel
		t_9.targetTextChannelDisplayName = p14.targetTextChannelDisplayName or ""
		t_9.isChannelBarVisible = p14.isChannelBarVisible
		t_9.developerChannelTabsEnabled = p14.developerChannelTabsEnabled
		t_8.TargetChannelChip = createElement_5(channelChipModule, t_9)
		local var143 = if fFlagExpChatUseMessagesStore then not var107 else not p14.canLocalUserChat
		
		if var143 then
			var143 = reactModule.createElement
			local var144 = "TextLabel"
			local t_10 = {
				BackgroundTransparency = 1,
				TextWrapped = true,
				AnchorPoint = Vector2.new(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Font = configModule.ChatInputBarFont,
				Text = p14.disabledChatPlaceholderText,
				Position = UDim2.fromScale(1, 0),
				Size = var93:map(function(p42) --[[ line: 1591 ]]
					return UDim2.new(1, -(p42 + 8), 0, 0)
				end),
				TextColor3 = if var125 then chatInputBarSettings.PlaceholderColor3 else chatInputBarSettings.TextColor3,
				TextSize = if isSpatialUIEnabled then chatInputBarSettings.SpatialPanelTextSize else chatInputBarSettings.TextSize
			}
			local var146 = if var125 then 0.5 else 0
			t_10.TextTransparency = p14.transparencyValue:map(function(p43) --[[ line: 107 ]]
				-- upvalues: var146 (ref)
				return var146 + p43 * (1 - var146)
			end)
			t_10.Selectable = if expChatFocusablePlaceholderText then true else nil
			t_10.SelectionImageObject = if expChatFocusablePlaceholderText then var122 else nil
			t_10.TextXAlignment = Enum.TextXAlignment.Left
			t_10.TextYAlignment = Enum.TextYAlignment.Top
			t_10.ref = if expChatFocusablePlaceholderText then var99 else nil
			var143 = var143(var144, t_10)
		end
		t_8.DisabledPlaceholderLabel = var143
		local var147 = if fFlagExpChatUseMessagesStore then var107 else p14.canLocalUserChat
		
		if var147 then
			var147 = reactModule.createElement
			local var148 = "Frame"
			local t_10 = {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Position = UDim2.fromScale(1, 0),
				Size = var93:map(function(p44) --[[ line: 1619 ]]
					return UDim2.new(1, -(p44 + 8), 0, 0)
				end)
			}
			local t_11 = {}
			local var151 = if fFlagExpChatUseMessagesStore then var107 else p14.canLocalUserChat
			
			if var151 then
				var151 = reactModule.createElement
				local var152 = "TextBox"
				local t_12 = {
					AnchorPoint = Vector2.new(0, 0),
					AutomaticSize = Enum.AutomaticSize.XY,
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					FontFace = chatInputBarSettings.FontFace,
					PlaceholderText = if var125 then p14.placeholderText else "",
					Selectable = if fFlagEnableConsoleExpControls then true else nil,
					SelectionImageObject = var122,
					Size = UDim2.fromScale(1, 0),
					Text = "",
					PlaceholderColor3 = chatInputBarSettings.PlaceholderColor3,
					TextColor3 = chatInputBarSettings.TextColor3,
					TextSize = if isSpatialUIEnabled then chatInputBarSettings.SpatialPanelTextSize else chatInputBarSettings.TextSize
				}
				local var154 = if var125 then 0.5 else 0
				t_12.TextTransparency = p14.transparencyValue:map(function(p45) --[[ line: 107 ]]
					-- upvalues: var154 (ref)
					return var154 + p45 * (1 - var154)
				end)
				local textStrokeTransparency = chatInputBarSettings.TextStrokeTransparency
				t_12.TextStrokeTransparency = p14.transparencyValue:map(function(p46) --[[ line: 107 ]]
					-- upvalues: textStrokeTransparency (ref)
					return textStrokeTransparency + p46 * (1 - textStrokeTransparency)
				end)
				t_12.TextStrokeColor3 = chatInputBarSettings.TextStrokeColor3
				t_12.TextWrapped = true
				t_12.TextXAlignment = Enum.TextXAlignment.Left
				t_12.TextYAlignment = Enum.TextYAlignment.Top
				t_12.ZIndex = 2
				t_12[reactModule.Event.Focused] = var115
				t_12[reactModule.Event.FocusLost] = var116
				t_12[reactModule.Change.Text] = var119
				t_12[reactModule.Event.ReturnPressedFromOnScreenKeyboard] = var120
				t_12.ref = if chatInputBarSettings.TextBox then var97 else var96
				var151 = var151(var152, t_12)
			end
			t_11.TextBox = var151
			var147 = var147(var148, t_10, t_11)
		end
		t_8.TextBoxContainer = var147
		t_8.UIPadding = reactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 10),
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10)
		})
		t_6.TextContainer = createElement_4(var138, t_7, t_8)
		local createElement_6 = reactModule.createElement
		local var155 = "TextButton"
		local t_10 = {
			AnchorPoint = Vector2.new(1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Position = UDim2.fromScale(1, 0),
			Selectable = false,
			Size = UDim2.new(0, p14.sendButtonContainerWidth, 1, 0),
			Text = "",
			[reactModule.Event.Activated] = var111
		}
		local t_11 = {
			Layout = reactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			})
		}
		local createElement_7 = reactModule.createElement
		local var158 = imageSetLabel
		local t_12 = {
			BackgroundTransparency = 1,
			ZIndex = 2,
			ImageColor3 = if var124 then chatInputBarSettings.PlaceholderColor3 else chatInputBarSettings.TextColor3
		}
		local var160 = if var124 then 0.5 else 0
		t_12.ImageTransparency = p14.transparencyValue:map(function(p47) --[[ line: 107 ]]
			-- upvalues: var160 (ref)
			return var160 + p47 * (1 - var160)
		end)
		t_12.Image = images["icons/actions/send"]
		t_12.Size = UDim2.new(0, 30, 0, 30)
		t_11.SendIcon = createElement_7(var158, t_12)
		t_6.SendButton = createElement_6(var155, t_10, t_11)
		t_3.Container = createElement_3(var135, t_5, t_6)
		createElement_1 = createElement_1(var130, t_2, t_3)
	end
	t_1.Background = createElement_1
	
	return createElement(var127, t, t_1)
end))