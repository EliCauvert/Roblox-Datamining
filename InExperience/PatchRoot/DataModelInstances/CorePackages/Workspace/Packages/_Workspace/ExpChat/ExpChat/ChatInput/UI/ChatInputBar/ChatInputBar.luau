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
local var1 = expChatSharedModule.Logger:new("ExpChat/" .. script.Name)
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
local fFlagExpChatPresetChatSendEnabled = require(expChat.Flags.FFlagExpChatPresetAutocompleteIxpGated) and expChatSharedModule.Flags.FFlagExpChatPresetChatSendEnabled
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
local expChatPresetChatAutocompleteExperimentation = require(parent.SocialExperiments).ExpChatPresetChatAutocompleteExperimentation
local actionBindableEvent = expChatSharedModule.ActionBindableEvent
local var2 = getFocusNavigationStoreModule(false)
local var3 = expChatSharedModule.Flags.FIntPresetChatCooldownLuaMs / 1000

local function setTransparency(value, p1)
	return p1:map(function(p2)
		-- upvalues: value (ref)
		return value + p2 * (1 - value)
	end)
end

local var4 = nil
local var5 = nil
local var6 = nil
local var7 = nil
local var8 = nil

local function onChatInputBarFocusLost(p1, p2, p3)
	-- upvalues: userInputService (ref), guiService (ref)
	p2 = p2 or { Enum.KeyCode.ButtonB }
	local var9 = nil
	
	return userInputService.InputBegan:Connect(function(p4)
		-- upvalues: p2 (ref), guiService (copy), p3 (ref), p1 (ref), var9 (write)
		local var10 = if p4 then p4.KeyCode else nil
		
		for i, v in p2 do
			if var10 == v then
				guiService:SetMenuIsOpen(false, "ExperienceChat")
				p3()
				
				if p1 then
					p1()
				else
					guiService.SelectedCoreObject = nil
				end
				if not var9 then break end
				var9:Disconnect()
				var9 = nil
				
				return
			end
		end
	end)
end

local function useEffectChatInputBarFocus(p4, p5, p6, p7, p8)
	-- upvalues: fFlagConsoleChatUseChromeFocusUtils (ref), reactModule (ref), signalsModule (ref), var2 (ref), expChatFocusablePlaceholderText (ref), guiService (ref), userInputService (ref), focusUtils (ref), fFlagChromeChatGamepadSupportFix (ref), fFlagEnableConsoleExpControls (ref), onChatInputBarFocusLost (ref), actionBindableEvent (ref)
	if fFlagConsoleChatUseChromeFocusUtils then
		reactModule.useEffect(function()
			-- upvalues: signalsModule (copy), var2 (copy), p5 (ref), p4 (ref), expChatFocusablePlaceholderText (copy), p6 (ref), guiService (copy), p7 (ref), userInputService (copy), focusUtils (copy), p8 (ref)
			local t = {}
			local var10 = nil
			local var11 = signalsModule.createEffect(function(p9)
				-- upvalues: var2 (copy), p5 (copy), p4 (copy), expChatFocusablePlaceholderText (copy), p6 (copy), guiService (copy), p7 (copy), var10 (write), userInputService (copy), t (ref), focusUtils (copy), p8 (copy)
				local chatInputBarFocused = var2.getChatInputBarFocused(p9)
				local var12 = if p5.current then p5.current else p4.current
				
				if expChatFocusablePlaceholderText then
					var12 = var12 or p6.current
				end
				if not var12 then return end
				if chatInputBarFocused then
					guiService:SetMenuIsOpen(true, "ExperienceChat")
					p7()
					guiService.SelectedCoreObject = var12
					
					if var10 then
						return
					else
						var10 = userInputService.InputBegan:Connect(function(p10)
							-- upvalues: t (copy), focusUtils (copy), var2 (copy)
							if p10 and t[p10.KeyCode] then
								focusUtils.FocusOnChrome(function()
									-- upvalues: var2 (copy)
									var2.unfocusChatInputBar()
								end, "chat")
							end
						end)
						
						return
					end
				elseif guiService.MenuIsOpen then
					guiService:SetMenuIsOpen(false, "ExperienceChat")
					p8()
					
					if var10 then
						var10:Disconnect()
						var10 = nil
					end
				end
			end)
			
			return function()
				-- upvalues: var11 (ref), var10 (write)
				var11()
				
				if var10 then
					var10:Disconnect()
					var10 = nil
				end
			end
		end, {})
		
		return
	elseif fFlagChromeChatGamepadSupportFix then
		reactModule.useEffect(function()
			-- upvalues: p5 (ref), p4 (ref), fFlagEnableConsoleExpControls (copy), guiService (copy), p7 (ref), onChatInputBarFocusLost (copy), p8 (ref), actionBindableEvent (copy)
			local var10 = nil
			local var11 = nil
			local eventConnection = actionBindableEvent.Event:Connect(function(p9)
				-- upvalues: p5 (copy), p4 (copy), fFlagEnableConsoleExpControls (copy), guiService (copy), p7 (copy), var11 (write), var10 (write), onChatInputBarFocusLost (copy), p8 (copy)
				local var12 = if p5.current then p5.current else p4.current
				
				if fFlagEnableConsoleExpControls and p9.type == "ChatTopBarFocusSelect" and var12 then
					guiService:SetMenuIsOpen(true, "ExperienceChat")
					p7()
					guiService.SelectedCoreObject = var12
					var11 = task.delay(0, function()
						-- upvalues: var11 (copy), var10 (copy), onChatInputBarFocusLost (copy), p9 (ref), p8 (copy)
						var11 = nil
						
						if var10 then
							var10:Disconnect()
						end
						var10 = onChatInputBarFocusLost(p9.onSelectionLost, p9.keybinds, p8)
					end)
				end
			end)
			
			return function()
				-- upvalues: eventConnection (ref), var11 (write), var10 (write)
				eventConnection:disconnect()
				
				if var11 then
					task.cancel(var11)
					var11 = nil
				end
				if var10 then
					var10:Disconnect()
					var10 = nil
				end
			end
		end, { p4.current, p5.current })
	end
end

return reactModule.memo(localizationModule.connect(function(p4)
	-- upvalues: getOtherDisplayNameInWhisperChannelModule (ref)
	local list = nil
	
	if p4.targetTextChannel then
		for i, v in pairs({
			RBXTeam = "CoreScripts.TextChat.TeamChat.PrefixText",
			RBXWhisper = "CoreScripts.TextChat.WhisperChat.PrefixText.Outgoing"
		}) do
			if string.match(p4.targetTextChannel.Name, i) then
				if i == "RBXWhisper" then
					local var10 = getOtherDisplayNameInWhisperChannelModule(p4.targetTextChannel, p4.localPlayer)
					
					if var10 then
						list = { v, { RBX_NAME = var10 } }
					end
				else
					list = v
				end
			end
		end
	end
	return { targetTextChannelDisplayName = list }
end)(function(p5)
	-- upvalues: reactModule (ref), fFlagExpChatUseUnifiedTooltipStore (ref), getChatTooltipStoreModule (ref), expChatMainInputBarClickAnalytics (ref), fFlagExpChatDictation_1 (ref), useSendTelemetryModule (ref), reactFocusNavigationModule (ref), fFlagExpChatFocusViaLastModeFixModule (ref), focusNavigationUtilsModule (ref), signalsReactModule (ref), var2 (ref), fFlagExpChatUseMessagesStore (ref), getMessagesStoreModule (ref), fFlagExpChatPresetChatEnabled (ref), getPresetChatStoreModule (ref), textChatService (ref), var5 (write), autocompleteTextModule (ref), initializeCommandsModule (ref), getEnableChatInputBarConfigurationAutocompleteEnabledModule (ref), var4 (write), initializeEmojisModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), var6 (write), initializeGlobalCommandsModule (ref), initialCommandsModule (ref), var1 (ref), fFlagExpChatDictation (ref), fFlagExpChatPresetChatGamepadEnabledModule (ref), guiService (ref), fFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule (ref), usePresetAutocompleteAnalyticsModule (ref), presetSearchModule (ref), var3 (ref), sendPresetModule (ref), expChatSharedModule (ref), constantsModule (ref), fFlagExpChatPresetChatAutocompleteEnabledModule (ref), presetEntryTextModule (ref), expChatDoNotSetCursorPosition (ref), expChatPresetChatIXPExposure (ref), IXPServiceWrapper (ref), expChatPresetChatIXPLayerName (ref), fFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule (ref), fFlagExpChatFixBackspaceNilTargetChannel (ref), configModule (ref), playersService (ref), fFlagEnableConsoleExpControls (ref), fFlagChromeChatGamepadSupportFix (ref), onChatInputBarFocusLost (ref), actionBindableEvent (ref), useEffectChatInputBarFocus (ref), fFlagExpChatUniverseChatPresetEnabledModule (ref), sortCommandResultsCallbackModule (ref), sortEmojiResultsCallbackModule (ref), list (ref), var7 (write), RBXTeamCommand (ref), var8 (write), RBXWhisperCommand (ref), chatOptimizeCommandProcessing (ref), autoCastCommand (ref), promiseModule (ref), useCursor (ref), expChatDictationIXPExposure (ref), expChatDictationIXPLayerName (ref), expChatPresetAutocompleteIxpEnabled (ref), expChatPresetAutocompleteIxpLayer (ref), fFlagExpChatPresetChatSendEnabled (ref), expChatPresetChatAutocompleteExperimentation (ref), useInterpolatedClientSettingsModule (ref), fFlagExpChatNewInputBarModule (ref), autocompleteDropdownModule (ref), setTransparency (ref), fFlagExpChatNewInputBarDictationModule (ref), chatInputBarV2DictationModule (ref), chatInputBarV2Module (ref), dictationInputBarModule (ref), expChatFocusablePlaceholderText (ref), channelChipModule (ref), imageSetLabel (ref), images (ref)
	local var11 = reactModule.useRef("")
	
	if fFlagExpChatUseUnifiedTooltipStore then
		local setIsChatInputBarVisible = getChatTooltipStoreModule(false).setIsChatInputBarVisible
		reactModule.useEffect(function()
			-- upvalues: p5 (ref), setIsChatInputBarVisible (ref)
			if p5.visible == nil then
				setIsChatInputBarVisible(true)
			else
				setIsChatInputBarVisible(p5.visible)
			end
			return function()
				-- upvalues: setIsChatInputBarVisible (copy)
				setIsChatInputBarVisible(false)
			end
		end, { p5.visible, setIsChatInputBarVisible })
	end
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var12, var13 = reactModule.useState("")
	local var14, var15 = reactModule.useState(0)
	local var16 = var14
	local var17 = var15
	local var18, var19 = reactModule.useState(0)
	local var20 = var18
	local var21 = var19
	local var22 = if expChatMainInputBarClickAnalytics then reactModule.useRef(false) else nil
	local var23, var24 = reactModule.useState(false)
	local var25, _ = reactModule.useState(true)
	local var26, var27 = reactModule.useBinding(0)
	local var28 = reactModule.useRef(false)
	local var29 = reactModule.useRef(nil)
	local var30 = reactModule.useRef(nil)
	local var31 = if fFlagExpChatDictation_1 then useSendTelemetryModule({
		enabled = fFlagExpChatDictation_1,
		textBoxRef = var29,
		customTextBoxRef = var30
	}) else nil
	local var32 = reactModule.useRef(nil)
	local var33 = reactModule.useRef(nil)
	local var34 = reactModule.useRef(nil)
	local var35 = reactModule.useRef(nil)
	local var36 = reactModule.useRef(false)
	local var37 = reactFocusNavigationModule.useFocusGuiObject()
	local var38 = if not fFlagExpChatFocusViaLastModeFixModule then focusNavigationUtilsModule.useLastInputMode() else nil
	local var39 = if fFlagExpChatFocusViaLastModeFixModule then signalsReactModule.useSignalState(var2.getChatInputBarFocused) else nil
	local var40 = nil
	local _ = nil
	
	if fFlagExpChatUseMessagesStore then
		var40 = signalsReactModule.useSignalState(getMessagesStoreModule(false).getCanLocalUserChat)
	end
	local var41 = if fFlagExpChatPresetChatEnabled then signalsReactModule.useSignalState(getPresetChatStoreModule(false).getIsTrayOpen) else nil
	local var42 = if fFlagExpChatPresetChatEnabled then signalsReactModule.useSignalState(getPresetChatStoreModule(false).getIsEnabled) else nil
	local var43 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var30 (ref), p5 (ref)
		var30.current = p5.chatInputBarSettings.TextBox
	end, {
		if p5.chatInputBarSettings.TextBox ~= nil then "nil" else p5.chatInputBarSettings.TextBox
	})
	reactModule.useEffect(function()
		-- upvalues: p5 (ref), textChatService (copy), var5 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy), getEnableChatInputBarConfigurationAutocompleteEnabledModule (copy), var4 (copy), initializeEmojisModule (copy), getFFlagTextChatEnableUniverseChatTabs (copy), var6 (copy), initializeGlobalCommandsModule (copy), initialCommandsModule (copy)
		if not p5.autocompleteEnabled then return end
		local t = {}
		local descendantAddedConnection = textChatService.DescendantAdded:Connect(function(p6)
			-- upvalues: var5 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy), t (ref)
			if p6:IsA("TextChatCommand") and string.sub(p6.PrimaryAlias, 1, 1) == "/" then
				var5 = autocompleteTextModule.new(initializeCommandsModule)
				table.insert(t, p6:GetPropertyChangedSignal("AutocompleteVisible"):Connect(function()
					-- upvalues: var5 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy)
					var5 = autocompleteTextModule.new(initializeCommandsModule)
				end))
			end
		end)
		local descendantRemovingConnection = textChatService.DescendantRemoving:Connect(function(p6)
			-- upvalues: var5 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy)
			if p6:IsA("TextChatCommand") and string.sub(p6.PrimaryAlias, 1, 1) == "/" then
				var5 = autocompleteTextModule.new(initializeCommandsModule)
			end
		end)
		
		if getEnableChatInputBarConfigurationAutocompleteEnabledModule() then
			var5 = autocompleteTextModule.new(initializeCommandsModule)
			var4 = autocompleteTextModule.new(initializeEmojisModule)
			
			if getFFlagTextChatEnableUniverseChatTabs() then
				var6 = autocompleteTextModule.new(initializeGlobalCommandsModule)
			end
			local var44 = initialCommandsModule()
			
			if var44 then
				for i, v in var44 do
					table.insert(t, v:GetPropertyChangedSignal("AutocompleteVisible"):Connect(function()
						-- upvalues: var5 (copy), autocompleteTextModule (copy), initializeCommandsModule (copy)
						var5 = autocompleteTextModule.new(initializeCommandsModule)
					end))
				end
			end
		end
		return function()
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
	local var45 = reactModule.useCallback(function()
		-- upvalues: var1 (copy), var12 (ref), fFlagExpChatUseMessagesStore (copy), var40 (write), p5 (ref), var28 (ref), var29 (ref), var30 (ref), var31 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagExpChatDictation (copy), var13 (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy), var36 (ref)
		var1:trace("onSendActivated with input text: '{}'", var12)
		local var46 = if fFlagExpChatUseMessagesStore then var40 else p5.canLocalUserChat
		
		if not var28.current or not var46 then
			var1:debug("onSendActivated could not send message. isMounted: {} canLocalUserChat: {}", tostring(var28.current), var46)
			
			return
		elseif var29.current or var30.current then
			local var47 = if var30.current then var30.current.Text else var29.current.Text
			local var48 = if var31 then var31.consumeOnSend(var47) else nil
			local var49 = if getFFlagTextChatEnableUniverseChatTabs() and p5.isGlobalChatTabActive and p5.onSendGlobalChat then p5.onSendGlobalChat else p5.onSendChat
			
			if not var49 or string.find(var47, "%S") == nil then
				var1:debug("onSendActivated could not send message. text: '{}' canLocalUserChat: {}", var47, var46)
			elseif fFlagExpChatDictation then
				var49(var47, var48, var48 ~= nil)
			else
				var49(var47)
			end
			if var30.current then
				var30.current.Text = ""
				var30.current:ReleaseFocus()
			end
			if var29.current then
				var29.current.Text = ""
				var29.current:ReleaseFocus()
			end
			var13("")
			
			if fFlagExpChatPresetChatGamepadEnabledModule then
				local current = var30.current or var29.current
				
				if current then
					guiService.SelectedCoreObject = current
				end
			end
			if p5.targetTextChannel and p5.targetTextChannelDisplayName ~= "" then
				var36.current = true
				
				return
			end
		else
			var1:debug("onSendActivated could not send message because textBoxRef.current was nil")
		end
	end, {
		var12, var30.current, var40, p5.canLocalUserChat, p5.isGlobalChatTabActive,
		p5.onSendChat or false, p5.onSendGlobalChat or false,
		p5.targetTextChannel or false, p5.targetTextChannelDisplayName,
		if var31 then var31.consumeOnSend else false
	})
	local var46 = if fFlagExpChatDictation_1 then reactModule.useCallback(function(p6)
		-- upvalues: fFlagExpChatUseMessagesStore (copy), var40 (write), p5 (ref), var28 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), var30 (ref), var29 (ref), var13 (ref), fFlagExpChatPresetChatGamepadEnabledModule (copy), guiService (copy), var36 (ref)
		if not var28.current or not (if fFlagExpChatUseMessagesStore then var40 else p5.canLocalUserChat) then return end
		local var47 = if p6 then p6.textSent else ""
		local var48 = if getFFlagTextChatEnableUniverseChatTabs() and p5.isGlobalChatTabActive and p5.onSendGlobalChat then p5.onSendGlobalChat else p5.onSendChat
		
		if var48 and string.find(var47, "%S") ~= nil then
			var48(var47, p6, true)
		end
		if var30.current then
			var30.current.Text = ""
			var30.current:ReleaseFocus()
		end
		if var29.current then
			var29.current.Text = ""
			var29.current:ReleaseFocus()
		end
		var13("")
		
		if fFlagExpChatPresetChatGamepadEnabledModule then
			local current = var30.current or var29.current
			
			if current then
				guiService.SelectedCoreObject = current
			end
		end
		if p5.targetTextChannel and p5.targetTextChannelDisplayName ~= "" then
			var36.current = true
		end
	end, {
		var30.current, var40, p5.canLocalUserChat, p5.isGlobalChatTabActive,
		p5.onSendChat or false, p5.onSendGlobalChat or false,
		p5.targetTextChannel or false, p5.targetTextChannelDisplayName
	}) else nil
	local var47 = if fFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule then usePresetAutocompleteAnalyticsModule({
		isFocused = var23,
		autocompleteEnabled = p5.autocompleteEnabled,
		autocompleteDropdownReducer = p5.autocompleteDropdownReducer
	}).recordPresetChosen else nil
	
	local function sendSelectedPreset(value)
		-- upvalues: getPresetChatStoreModule (copy), presetSearchModule (copy), var1 (copy), var3 (copy), sendPresetModule (copy), p5 (ref), expChatSharedModule (copy), constantsModule (copy), fFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule (copy)
		local var48 = getPresetChatStoreModule(false)
		local presetIdForValue = presetSearchModule.getPresetIdForValue(var48, value)
		
		if presetIdForValue == nil then
			var1:warning("Could not resolve a preset id for autocomplete entry '{}'; skipping send.", value)
			
			return
		end
		var48.setPresetCooldownEndsAt(os.clock() + var3)
		local var49 = sendPresetModule(presetIdForValue, p5.targetTextChannel)
		
		if var49 == "Sent" then
			expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
				event_type = constantsModule.Analytics.EventTypes.Click,
				component = if fFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule then constantsModule.Analytics.Components.AutocompleteDropdown else constantsModule.Analytics.Components.PresetAutocomplete,
				preset_id = presetIdForValue
			}, if fFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule then constantsModule.Analytics.ExtendedStandardizedFields else expChatSharedModule.Analytics.DefaultStandardizedFields)
			
			return
		end
		var48.setPresetCooldownEndsAt(nil)
		var1:warning("Could not send preset {} from autocomplete: {}", presetIdForValue, var49)
	end
	
	local var48 = reactModule.useCallback(function(p6)
		-- upvalues: fFlagExpChatPresetChatAutocompleteEnabledModule (copy), p5 (ref), presetEntryTextModule (copy), fFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule (copy), var47 (write), var30 (ref), var29 (ref), var16 (write), var13 (ref), var28 (ref), expChatMainInputBarClickAnalytics (copy), var22 (ref), fFlagExpChatFocusViaLastModeFixModule (copy), var39 (ref), var37 (ref), var38 (ref), expChatDoNotSetCursorPosition (copy), sendSelectedPreset (ref), var1 (copy)
		local var49 = if fFlagExpChatPresetChatAutocompleteEnabledModule and p5.autocompleteDropdownReducer.autocompleteType == "presets" then presetEntryTextModule.undecorate(p6.TextLabel.Text, p5.chatInputBarSettings.TextSize) else nil
		
		if fFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule and var47 ~= nil and var49 ~= nil then
			var47(var49)
		end
		p5.autocompleteDropdownActivated(false)
		p5.autocompleteDropdownResultsChanged({})
		local var50 = if var30.current then var30.current else var29.current
		
		if var50 then
			local text = var50.Text
			local substring = string.sub(text, 1, var16 - 1)
			local var51 = if fFlagExpChatPresetChatAutocompleteEnabledModule and var49 ~= nil then "" else string.sub(text, var16, #text)
			local var52 = ""
			
			if p5.autocompleteDropdownReducer.autocompleteType == "emojis" then
				var52 = string.gsub(substring, ":[^:]*$", p6.EmojiLabel.Text)
			elseif p5.autocompleteDropdownReducer.autocompleteType == "commands" then
				var52 = string.gsub(substring, "(/.*)", p6.TextLabel.Text)
			end
			if var51 ~= "" then
				var52 ..= var51
			end
			var50.Text = var52
			var13(var52)
			
			if var28.current then
				if expChatMainInputBarClickAnalytics and var22 and not var50:IsFocused() then
					var22.current = true
				end
				var50:CaptureFocus()
				
				if fFlagExpChatFocusViaLastModeFixModule then
					if var39 then
						var37(var50)
					end
				elseif var38 == "Focus" then
					var37(var50)
				end
				if var51 ~= "" and not expChatDoNotSetCursorPosition then
					var50.CursorPosition = #var52 - #var51 + 1
				end
			end
			p5.autocompleteDropdownDeactivated()
			
			if fFlagExpChatPresetChatAutocompleteEnabledModule and var49 ~= nil then
				sendSelectedPreset(var49)
				
				return
			end
		else
			var1:error("Could not find textBox")
		end
	end, {
		if fFlagExpChatFocusViaLastModeFixModule then var39 else nil, var37, var25,
		var16, if fFlagExpChatFocusViaLastModeFixModule then nil else var38,
		p5.autocompleteDropdownActivated, p5.autocompleteDropdownDeactivated,
		p5.autocompleteDropdownReducer and p5.autocompleteDropdownReducer.autocompleteType,
		p5.autocompleteDropdownResultsChanged,
		if fFlagExpChatPresetChatAutocompleteEnabledModule then p5.targetTextChannel or false else nil,
		if fFlagExpChatPresetChatAutocompleteEnabledModule then p5.chatInputBarSettings.TextSize else nil,
		if fFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule then var47 else nil
	})
	reactModule.useEffect(function()
		-- upvalues: var28 (ref), var30 (ref), var29 (ref), var1 (copy)
		if var28.current then
			local var49 = if var30.current then var30.current else var29.current
			
			if var49 then
				var49:CaptureFocus()
				
				return
			end
			var1:error("Could not focus chat input bar because textBox not found")
		end
	end, { p5.shouldFocusChatInputBar, var30.current })
	
	if fFlagExpChatPresetChatEnabled then
		reactModule.useEffect(function()
			-- upvalues: var41 (ref), var30 (ref), var29 (ref)
			if not var41 then return end
			local var49 = if var30.current then var30.current else var29.current
			
			if var49 and var49:IsFocused() then
				var49:ReleaseFocus()
			end
		end, { var41 })
	end
	local createElement_1
	reactModule.useEffect(function()
		-- upvalues: var1 (copy), var28 (ref), expChatPresetChatIXPExposure (copy), IXPServiceWrapper (copy), expChatPresetChatIXPLayerName (copy)
		var1:trace("Mounted")
		var28.current = true
		
		if expChatPresetChatIXPExposure then
			IXPServiceWrapper:LogUserLayerExposure(expChatPresetChatIXPLayerName)
		end
		return function()
			-- upvalues: var1 (copy), var28 (copy)
			var1:trace("Unmounting")
			var28.current = false
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p5 (ref), var30 (ref), var29 (ref), var17 (write)
		local var49 = nil
		
		if p5.autocompleteEnabled then
			local var50 = if var30.current then var30.current else var29.current
			
			if var50 then
				var49 = var50:GetPropertyChangedSignal("CursorPosition"):Connect(function()
					-- upvalues: var50 (ref), var17 (copy)
					local cursorPosition = var50.CursorPosition
					
					if cursorPosition and cursorPosition ~= -1 then
						var17(cursorPosition)
					end
				end)
			end
		end
		return function()
			-- upvalues: var49 (write)
			if var49 then
				var49:Disconnect()
			end
		end
	end, { var30.current })
	reactModule.useEffect(function()
		-- upvalues: p5 (ref), var35 (ref)
		if p5.autocompleteEnabled then
			var35.current = p5.userInputService.InputBegan:connect(function(p6, _)
				-- upvalues: p5 (copy)
				if p5.autocompleteDropdownReducer.activated and (Enum.KeyCode.Up or Enum.KeyCode.Down) then
					if p6 and p6.KeyCode == Enum.KeyCode.Up and p5.autocompleteDropdownReducer.selectedIndex > 1 then
						p5.autocompleteDropdownSelectionChanged(p5.autocompleteDropdownReducer.selectedIndex - 1)
					end
					if p6 and p6.KeyCode == Enum.KeyCode.Down and p5.autocompleteDropdownReducer.selectedIndex < #p5.autocompleteDropdownReducer.results then
						p5.autocompleteDropdownSelectionChanged(p5.autocompleteDropdownReducer.selectedIndex + 1)
					end
				end
			end)
			
			return function()
				-- upvalues: var35 (copy)
				local current = var35.current
				
				if current and current.Connected then
					current:Disconnect()
				end
				var35.current = nil
			end
		end
		return function() end
	end, { p5.userInputService, p5.autocompleteDropdownReducer })
	reactModule.useEffect(function()
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), p5 (ref), fFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule (copy), var34 (ref), var30 (ref), var29 (ref), var36 (ref), fFlagExpChatFixBackspaceNilTargetChannel (copy), var1 (copy), var12 (ref)
		local var49 = if fFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule then not p5.isChannelBarVisible or getFFlagTextChatEnableUniverseChatTabs() and not p5.developerChannelTabsEnabled else not p5.isChannelBarVisible
		var34.current = p5.userInputService.InputEnded:connect(function(p6, _)
			-- upvalues: var30 (copy), var29 (copy), p5 (copy), var36 (copy), var49 (ref), fFlagExpChatFixBackspaceNilTargetChannel (copy), var1 (copy), var12 (copy)
			local current
			if var30.current then
				current = var30.current
				
				if current then
					current = var30.current:IsFocused()
					
					if current then
						current = p6
						
						if current then
							current = p6.KeyCode == Enum.KeyCode.Backspace
							current = nil
						end
					end
				end
			else
				current = var29.current and (var29.current:IsFocused() and (p6 and p6.KeyCode == Enum.KeyCode.Backspace))
			end
			if current then
				local var50 = (p5.targetTextChannelDisplayName or "") ~= ""
				
				if var36.current and var49 and (if fFlagExpChatFixBackspaceNilTargetChannel then var50 else true) then
					p5.resetTargetChannel(if fFlagExpChatFixBackspaceNilTargetChannel then p5.isGlobalChatTabActive else nil)
					var1:debug("ChatInputBar ChatInputBarResetTargetChannel()")
					var36.current = false
					
					return
				elseif var12 == "" and (if fFlagExpChatFixBackspaceNilTargetChannel then var50 else p5.targetTextChannelDisplayName ~= "") then
					var36.current = true
				end
			end
		end)
		
		return function()
			-- upvalues: var34 (copy)
			local current = var34.current
			
			if current and current.Connected then
				current:Disconnect()
			end
			var34.current = nil
		end
	end, {
		p5.userInputService, var30.current, p5.isChannelBarVisible,
		p5.targetTextChannelDisplayName, p5.resetTargetChannel,
		if fFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule then p5.developerChannelTabsEnabled else nil,
		if fFlagExpChatFixBackspaceNilTargetChannel then p5.isGlobalChatTabActive else nil
	})
	reactModule.useEffect(function()
		-- upvalues: p5 (ref), configModule (copy), var30 (ref), var29 (ref), var43 (ref)
		p5.contextActionService:BindCoreAction("FocusChat", function(_, p6, p7)
			-- upvalues: p5 (copy), configModule (copy), var30 (copy), var29 (copy), var43 (copy)
			if p5.isChatHotkeyEnabled and p7 and (p7.KeyCode == configModule.ChatInputBarDefaultFocusKeyCode or p7.KeyCode == p5.devDefinedFocusKeyCode) then
				local var49 = if var30.current then var30.current else var29.current
				
				if var49 and p6 == Enum.UserInputState.Begin and (var49 and not var49:IsFocused()) then
					task.delay(0, function()
						-- upvalues: var49 (ref)
						var49:CaptureFocus()
					end)
					p5.focusChatHotKeyActivated()
					var43.current = true
					
					return Enum.ContextActionResult.Sink
				end
			end
			return Enum.ContextActionResult.Pass
		end, false, Enum.UserInputType.Keyboard)
		
		return function()
			-- upvalues: p5 (copy)
			p5.contextActionService:UnbindCoreAction("FocusChat")
		end
	end, {
		p5.isChatHotkeyEnabled,
		p5.devDefinedFocusKeyCode,
		var43.current,
		var30.current
	})
	
	local _ = function(p6)
		-- upvalues: textChatService (copy)
		local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		
		if chatInputBarConfiguration then
			chatInputBarConfiguration.IsFocusedWrite = p6
		end
	end
	
	local var49 = reactModule.useCallback(function()
		-- upvalues: var24 (ref), p5 (ref), textChatService (copy), expChatMainInputBarClickAnalytics (copy), var22 (ref), expChatSharedModule (copy), constantsModule (copy)
		var24(true)
		p5.onFocus()
		local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		
		if chatInputBarConfiguration then
			chatInputBarConfiguration.IsFocusedWrite = true
		end
		if expChatMainInputBarClickAnalytics and var22 then
			if var22.current then
				var22.current = false
				
				return
			end
			expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
				event_type = constantsModule.Analytics.EventTypes.Click,
				component = constantsModule.Analytics.Components.MainInputBar
			}, constantsModule.Analytics.ExtendedStandardizedFields)
		end
	end, { p5.onFocus })
	local var50 = reactModule.useCallback(function(_, p6, p7)
		-- upvalues: var1 (copy), var33 (ref), p5 (ref), fFlagExpChatPresetChatAutocompleteEnabledModule (copy), var48 (ref), var45 (ref), var28 (ref), var30 (ref), var29 (ref), var16 (write), expChatMainInputBarClickAnalytics (copy), var22 (ref), expChatDoNotSetCursorPosition (copy), var24 (ref), textChatService (copy), var43 (ref), playersService (copy)
		local v
		var1:debug("Focus lost with enter: {}", tostring(p6))
		local current = var33.current
		
		if p6 or p7 and (p7.KeyCode == Enum.KeyCode.Return or p7.KeyCode == Enum.KeyCode.KeypadEnter) then
			if p5.autocompleteEnabled and current and (p5.autocompleteDropdownReducer.activated and #p5.autocompleteDropdownReducer.results > 0) and (not fFlagExpChatPresetChatAutocompleteEnabledModule or p5.autocompleteDropdownReducer.selectedIndex > 0) then
				for i, v in ipairs(current.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame:GetChildren()) do
					if v.ClassName == "Frame" and v.LayoutOrder == p5.autocompleteDropdownReducer.selectedIndex then
						var48(v.TextLabelButton)
						
						return
					end
				end
			else
				local x, y
				var45()
				
				if fFlagExpChatPresetChatAutocompleteEnabledModule and p5.autocompleteEnabled and p5.autocompleteDropdownReducer.autocompleteType == "presets" then
					p5.autocompleteDropdownDeactivated()
				end
			end
		end
		if var28.current then
			if not p5.autocompleteEnabled or not current or not p5.autocompleteDropdownReducer.activated then
				var24(false)
			elseif p7 then
				if p7.KeyCode == Enum.KeyCode.Escape then
					p5.autocompleteDropdownActivated(false)
					local var51 = if var30.current then var30.current else var29.current
					
					if var51 then
						local var52 = var16
						
						if expChatMainInputBarClickAnalytics and var22 and not var51:IsFocused() then
							var22.current = true
						end
						var51:CaptureFocus()
						
						if not expChatDoNotSetCursorPosition then
							var51.CursorPosition = var52
						end
						return
					else
						var1:error("Could not focus chat input bar because textBox not found")
					end
				else
					x = p7.Position.X
					y = p7.Position.Y
					local x_1 = current.AbsolutePosition.X
					local var53 = x_1 + current.AbsoluteSize.X
					local y_1 = current.AbsolutePosition.Y
					v = y_1 + current.AbsoluteSize.Y
					
					if x < x_1 or var53 < x or (y < y_1 or v < y) then
						p5.autocompleteDropdownActivated(false)
					end
				end
			end
		end
		p5.onUnfocus()
		x = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		
		if x then
			x.IsFocusedWrite = false
		end
		if var43.current then
			x = playersService.LocalPlayer
			
			if x then
				y = Instance.new("TextBox")
				y.Visible = false
				y.Parent = x:FindFirstChildOfClass("PlayerGui")
				y:CaptureFocus()
				y:ReleaseFocus()
				y:Destroy()
			end
			var43.current = false
		end
	end)
	reactModule.useEffect(function()
		-- upvalues: fFlagEnableConsoleExpControls (copy), var30 (ref), var29 (ref), fFlagChromeChatGamepadSupportFix (copy), guiService (copy), var49 (ref), onChatInputBarFocusLost (copy), var50 (ref), actionBindableEvent (copy)
		local var54 = nil
		local var55 = nil
		local eventConnection = actionBindableEvent.Event:Connect(function(p8)
			-- upvalues: fFlagEnableConsoleExpControls (copy), var30 (copy), var29 (copy), fFlagChromeChatGamepadSupportFix (copy), guiService (copy), var49 (copy), var55 (write), var54 (write), onChatInputBarFocusLost (copy), var50 (copy)
			local var56 = if fFlagEnableConsoleExpControls then if var30.current then var30.current else var29.current else nil
			
			if p8.type == "ChatTopBarFocusActivated" then
				if not fFlagEnableConsoleExpControls then
					var56 = if var30.current then var30.current else var29.current
				end
				if var56 then
					task.delay(0, function()
						-- upvalues: var56 (write)
						var56:CaptureFocus()
					end)
				end
			elseif not fFlagChromeChatGamepadSupportFix and fFlagEnableConsoleExpControls and (p8.type == "ChatTopBarFocusSelect" and var56) then
				guiService:SetMenuIsOpen(true, "ExperienceChat")
				var49()
				guiService.SelectedCoreObject = var56
				var55 = task.delay(0, function()
					-- upvalues: var55 (copy), var54 (copy), onChatInputBarFocusLost (copy), p8 (ref), var50 (copy)
					var55 = nil
					
					if var54 then
						var54:Disconnect()
					end
					var54 = onChatInputBarFocusLost(p8.onSelectionLost, p8.keybinds, var50)
				end)
			end
		end)
		
		return function()
			-- upvalues: eventConnection (ref), var55 (write), var54 (write)
			eventConnection:disconnect()
			
			if var55 then
				task.cancel(var55)
				var55 = nil
			end
			if var54 then
				var54:Disconnect()
				var54 = nil
			end
		end
	end, { var29.current, var30.current })
	useEffectChatInputBarFocus(var29, var30, var32, var49, var50)
	
	local function handlePresetAutocomplete(value, p8)
		-- upvalues: p5 (ref), fFlagExpChatUniverseChatPresetEnabledModule (copy), presetSearchModule (copy), getPresetChatStoreModule (copy)
		if p8 < 1 then return end
		local var54 = if not (p5.targetTextChannel == nil and not fFlagExpChatUniverseChatPresetEnabledModule) then presetSearchModule.findMatchingPresets(getPresetChatStoreModule(false), string.sub(value, 1, p8 - 1)) else {}
		
		if #var54 == 0 then
			if p5.autocompleteDropdownReducer.autocompleteType == "presets" then
				p5.autocompleteDropdownDeactivated()
			end
			return
		else
			p5.autocompleteDropdownTypeChanged("presets")
			p5.autocompleteDropdownActivated(true)
			p5.autocompleteDropdownResultsChanged(var54)
			p5.autocompleteDropdownSelectionChanged(0)
		end
	end
	
	local function handleAutocomplete(p8, p9, p10)
		-- upvalues: p5 (ref), var6 (copy), var5 (copy), sortCommandResultsCallbackModule (copy), var4 (copy), sortEmojiResultsCallbackModule (copy), var20 (write), list (copy), var13 (ref), expChatDoNotSetCursorPosition (copy), var33 (ref), var48 (ref), var21 (write), fFlagExpChatPresetChatAutocompleteEnabledModule (copy), handlePresetAutocomplete (ref)
		if p10 == "/" and p8.CursorPosition == 2 or p5.autocompleteDropdownReducer.autocompleteType == "commands" and p10 ~= ":" then
			p5.autocompleteDropdownTypeChanged("commands")
			p5.autocompleteDropdownActivated(true)
			
			if p10 == "" or p10 == " " then
				p5.autocompleteDropdownDeactivated()
			else
				local var54 = string.sub(p9, 1, p8.CursorPosition - 1):lower()
				local var55 = (if p5.isGlobalChatTabActive and var6 then var6 else var5):getResults(var54, sortCommandResultsCallbackModule)
				p5.autocompleteDropdownResultsChanged(var55)
				
				if var54 == var55[1] then
					p5.autocompleteDropdownActivated(false)
					p5.autocompleteDropdownResultsChanged({})
					
					return
				end
			end
			return
		elseif (p5.autocompleteDropdownReducer.activated or #p5.autocompleteDropdownReducer.results > 0) and p5.autocompleteDropdownReducer.autocompleteType == "emojis" then
			p5.autocompleteDropdownActivated(true)
			local matchIndex = string.find(string.sub(p9, 1, p8.CursorPosition - 1), ":[^:]*$")
			
			if p10 == "" or p10 == ":" or (p10 == " " or not matchIndex) then
				if p10 == ":" then
					if matchIndex == var20 then
						p5.autocompleteDropdownResultsChanged({})
						
						return
					end
					local var56 = string.sub(p9, var20 + 1, p8.CursorPosition - 2):lower()
					
					if list.includes(p5.autocompleteDropdownReducer.results, var56) then
						local text = string.sub(p9, 1, p8.CursorPosition - 2) .. string.sub(p9, p8.CursorPosition, #p9)
						p8.Text = text
						var13(text)
						
						if not expChatDoNotSetCursorPosition then
							p8.CursorPosition -= 1
						end
						local current = var33.current
						
						if current then
							for i, v in ipairs(current.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame:GetChildren()) do
								if v.ClassName == "Frame" then
									local textLabelButton = v:FindFirstChild("TextLabelButton")
									
									if textLabelButton then
										local textLabel = textLabelButton:FindFirstChild("TextLabel")
										
										if textLabel and textLabel.Text and textLabel.Text == var56 then
											var48(textLabelButton)
											
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
						p5.autocompleteDropdownActivated(false)
						p5.autocompleteDropdownResultsChanged({})
					end
				elseif p10 == " " then
					p5.autocompleteDropdownActivated(false)
					p5.autocompleteDropdownResultsChanged({})
					
					return
				end
				p5.autocompleteDropdownDeactivated()
				var21(0)
				
				return
			else
				local var57 = string.sub(p9, matchIndex + 1, p8.CursorPosition - 1):lower()
				p5.autocompleteDropdownResultsChanged(if var57 and string.len(var57) > 1 then var4:getResults(var57, sortEmojiResultsCallbackModule) else {})
				
				return
			end
		else
			local matchIndex = string.find(p9, ":[^:]*$")
			
			if p10 == ":" then
				p5.autocompleteDropdownTypeChanged("emojis")
				p5.autocompleteDropdownActivated(true)
				p5.autocompleteDropdownResultsChanged({})
				var21(matchIndex)
				
				return
			elseif fFlagExpChatPresetChatAutocompleteEnabledModule then
				handlePresetAutocomplete(p9, p8.CursorPosition)
			end
		end
	end
	
	reactModule.useEffect(function()
		-- upvalues: textChatService (copy), var7 (copy), RBXTeamCommand (copy), var8 (copy), RBXWhisperCommand (copy)
		if textChatService.CreateDefaultCommands then
			var7 = textChatService:FindFirstChild(RBXTeamCommand.name, true)
			var8 = textChatService:FindFirstChild(RBXWhisperCommand.name, true)
		end
	end, {})
	local var58 = reactModule.useCallback(function(p11)
		-- upvalues: p5 (ref), var13 (ref), var1 (copy), var12 (ref), getEnableChatInputBarConfigurationAutocompleteEnabledModule (copy), handleAutocomplete (ref), var36 (ref), chatOptimizeCommandProcessing (copy), var11 (ref), var7 (copy), autoCastCommand (copy), RBXTeamCommand (copy), var8 (copy), RBXWhisperCommand (copy), promiseModule (copy)
		local text = p11.Text
		
		if p5.autocompleteEnabled then
			local var59 = p11.CursorPosition < #text + 1
			
			if string.find(text, "\r") then
				local replaced = string.gsub(text, "\r", "")
				p11.Text = replaced
				var13(replaced)
				
				if var59 then
					p11.CursorPosition -= 1
				end
				return
			else
				local substring = string.sub(text, p11.CursorPosition - 1, p11.CursorPosition - 1)
				var1:trace("Input: {}", text)
				local var60 = if utf8.len(text) then utf8.len(utf8.nfcnormalize(text)) else string.len(text)
				
				if var60 and p5.messageCharacterLimit < var60 then
					var1:debug("Message is over the character limit of {}", tostring(p5.messageCharacterLimit))
					p11.Text = var12
					
					return
				end
				var13(text)
				
				if getEnableChatInputBarConfigurationAutocompleteEnabledModule() and p5.autocompleteEnabled then
					handleAutocomplete(p11, text, substring)
				end
				var36.current = #text == 0 and var36.current
				
				if chatOptimizeCommandProcessing then
					if string.sub(text, 1, 1) == "/" and p5.localPlayer and text ~= var11.current then
						var11.current = text
						local userId = p5.localPlayer.UserId
						local t = {}
						
						if var7 and var7.Enabled then
							table.insert(t, autoCastCommand(RBXTeamCommand, userId, text))
						end
						if var8 and var8.Enabled then
							table.insert(t, autoCastCommand(RBXWhisperCommand, userId, text))
						end
						if #t == 0 then
							t = { promiseModule.reject() }
						end
						promiseModule.any(t):andThen(function()
							-- upvalues: p11 (ref), var13 (copy), var36 (copy)
							p11.Text = ""
							var13("")
							var36.current = true
						end):catch(function(p12)
							-- upvalues: var1 (copy)
							var1:trace("Could not send autoCastCommand. Error: {}", p12)
						end)
						
						return
					elseif string.sub(text, 1, 1) == "/" then
						return
					else
						var11.current = ""
						
						return
					end
				elseif p5.localPlayer then
					local userId = p5.localPlayer.UserId
					local t = {}
					
					if var7 and var7.Enabled then
						table.insert(t, autoCastCommand(RBXTeamCommand, userId, text))
					end
					if var8 and var8.Enabled then
						table.insert(t, autoCastCommand(RBXWhisperCommand, userId, text))
					end
					if #t == 0 then
						t = { promiseModule.reject() }
					end
					promiseModule.any(t):andThen(function()
						-- upvalues: p11 (ref), var13 (copy), var36 (copy)
						p11.Text = ""
						var13("")
						var36.current = true
					end):catch(function(p12)
						-- upvalues: var1 (copy)
						var1:trace("Could not send autoCastCommand. Error: {}", p12)
					end)
				end
			end
		end
	end)
	local var59 = reactModule.useCallback(function()
		-- upvalues: var30 (ref), var29 (ref)
		local var60 = if var30.current then var30.current else var29.current
		
		if var60 then
			var60:ReleaseFocus(true)
		end
	end, { var29.current, var30.current })
	local var60 = reactModule.useCallback(function(p11)
		-- upvalues: var27 (ref)
		var27(if p11.Visible then p11.AbsoluteSize.X else 0)
	end)
	local var61 = useCursor()
	local var62 = reactModule.useCallback(function(p11)
		-- upvalues: p5 (ref)
		p5.autocompleteDropdownSelectionChanged(p11.LayoutOrder)
	end)
	local var63 = var12 == ""
	local var64 = var63 and not var23
	local chatInputBarSettings = p5.chatInputBarSettings
	local chatWindowSettings = p5.chatWindowSettings
	local var65 = if fFlagExpChatUseMessagesStore and var40 ~= nil then var40 else p5.canLocalUserChat
	reactModule.useEffect(function()
		-- upvalues: expChatDictationIXPExposure (copy), var65 (ref), IXPServiceWrapper (copy), expChatDictationIXPLayerName (copy)
		if expChatDictationIXPExposure and var65 then
			IXPServiceWrapper:LogUserLayerExposure(expChatDictationIXPLayerName)
		end
	end, { var65 })
	reactModule.useEffect(function()
		-- upvalues: expChatPresetAutocompleteIxpEnabled (copy), var23 (ref), getEnableChatInputBarConfigurationAutocompleteEnabledModule (copy), p5 (ref), getPresetChatStoreModule (copy), constantsModule (copy), IXPServiceWrapper (copy), expChatPresetAutocompleteIxpLayer (copy)
		if not expChatPresetAutocompleteIxpEnabled or not var23 then return end
		if not getEnableChatInputBarConfigurationAutocompleteEnabledModule() or not p5.autocompleteEnabled then return end
		local var66 = getPresetChatStoreModule(false)
		
		if var66.getIsEnabled(false) and var66.getAccessLevel(false) == constantsModule.AccessLevel.Enabled then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(expChatPresetAutocompleteIxpLayer)
			
			return
		end
	end, { var23, p5.autocompleteEnabled, var42 })
	reactModule.useEffect(function()
		-- upvalues: fFlagExpChatPresetChatSendEnabled (copy), var23 (ref), getEnableChatInputBarConfigurationAutocompleteEnabledModule (copy), p5 (ref), getPresetChatStoreModule (copy), constantsModule (copy), expChatPresetChatAutocompleteExperimentation (copy)
		if not fFlagExpChatPresetChatSendEnabled or not var23 then return end
		if not getEnableChatInputBarConfigurationAutocompleteEnabledModule() or not p5.autocompleteEnabled then return end
		local var66 = getPresetChatStoreModule(false)
		
		if var66.getIsEnabled(false) and var66.getAccessLevel(false) == constantsModule.AccessLevel.Enabled then
			expChatPresetChatAutocompleteExperimentation.logExposure()
			
			return
		end
	end, { var23, p5.autocompleteEnabled, var42 })
	local backgroundTransparency = useInterpolatedClientSettingsModule(chatInputBarSettings).BackgroundTransparency
	local backgroundTransparency_1 = useInterpolatedClientSettingsModule(chatWindowSettings).BackgroundTransparency
	local backgroundColor3 = useInterpolatedClientSettingsModule(chatWindowSettings).BackgroundColor3
	local isSpatialUIEnabled = p5.isSpatialUIEnabled
	local createElement = reactModule.createElement
	local var66 = "Frame"
	local t = {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = backgroundColor3,
		BackgroundTransparency = if fFlagExpChatNewInputBarModule then 1 else p5.transparencyValue:map(function(p11)
			-- upvalues: backgroundTransparency_1 (ref)
			return backgroundTransparency_1 + p11 * (1 - backgroundTransparency_1)
		end),
		BorderSizePixel = 0,
		LayoutOrder = p5.LayoutOrder,
		Size = p5.size,
		Visible = p5.visible,
		ZIndex = 2,
		[reactModule.Event.MouseEnter] = p5.onHovered,
		[reactModule.Event.MouseLeave] = p5.onUnhovered,
		[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p11)
			-- upvalues: textChatService (copy), p5 (ref)
			local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			
			if chatInputBarConfiguration and p5.onAbsoluteSizeChanged then
				p5.onAbsoluteSizeChanged(p11, chatInputBarConfiguration)
			end
		end),
		[reactModule.Change.AbsolutePosition] = reactModule.useCallback(function(p11)
			-- upvalues: textChatService (copy), p5 (ref)
			local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			
			if chatInputBarConfiguration and p5.onAbsolutePositionChanged then
				p5.onAbsolutePositionChanged(p11, chatInputBarConfiguration)
			end
		end)
	}
	local t_1 = {
		AutocompleteDropdown = getEnableChatInputBarConfigurationAutocompleteEnabledModule() and (p5.autocompleteEnabled and (reactModule.createElement(autocompleteDropdownModule, {
			chatInputBarSettings = chatInputBarSettings,
			chatWindowSettings = chatWindowSettings,
			setTransparency = setTransparency,
			transparencyValue = p5.transparencyValue,
			activated = p5.autocompleteDropdownReducer.activated and var23,
			results = p5.autocompleteDropdownReducer.results,
			selectedIndex = p5.autocompleteDropdownReducer.selectedIndex,
			autocompleteType = p5.autocompleteDropdownReducer.autocompleteType,
			onAutocompleteDropdownHover = var62,
			onAutocompleteSelected = var48,
			autocompleteDropdownRef = var33,
			textBoxRef = if chatInputBarSettings.TextBox then var30 else var29
		}) or nil)),
		UISizeConstraint = reactModule.createElement("UISizeConstraint", {
			MaxSize = Vector2.new(configModule.ChatWindowMaxWidth, 1e999)
		}),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = if fFlagExpChatNewInputBarModule then nil else UDim.new(0, 8),
			PaddingRight = if fFlagExpChatNewInputBarModule then nil else UDim.new(0, 8),
			PaddingTop = p5.addTopPadding and UDim.new(0, 8) or UDim.new(0, 0),
			PaddingBottom = UDim.new(0, 1)
		}),
		ChatInputBarV2 = if not fFlagExpChatNewInputBarModule then if fFlagExpChatNewInputBarDictationModule and fFlagExpChatDictation_1 and var65 then reactModule.createElement(chatInputBarV2DictationModule, {
			transparencyValue = p5.transparencyValue,
			sendButtonContainerWidth = p5.sendButtonContainerWidth,
			resetTargetChannel = p5.resetTargetChannel,
			targetTextChannel = p5.targetTextChannel,
			targetTextChannelDisplayName = p5.targetTextChannelDisplayName,
			isChannelBarVisible = p5.isChannelBarVisible,
			developerChannelTabsEnabled = p5.developerChannelTabsEnabled,
			canLocalUserChat = p5.canLocalUserChat,
			disabledChatPlaceholderText = p5.disabledChatPlaceholderText,
			placeholderText = p5.placeholderText,
			setTransparency = setTransparency,
			chatInputBarSettings = chatInputBarSettings,
			chatInputBarBackgroundTransparency = backgroundTransparency,
			isSpatialUIEnabled = isSpatialUIEnabled,
			canLocalUserChatDerived = var40,
			targetChannelWidth = var26,
			showPlaceholderText = var64,
			hasEmptyInputText = var63,
			shouldTruncatePlaceholder = if fFlagExpChatPresetChatEnabled then var42 else nil,
			cursor = var61,
			placeholderRef = var32,
			textBoxRef = var29,
			customTextBoxRef = var30,
			onAbsoluteSizeChanged = var60,
			onFocused = var49,
			onFocusLost = var50,
			onTextChanged = var58,
			onReturnPressedFromOnScreenKeyboard = var59,
			onSendActivated = var45,
			onSendRecordingTap = var46,
			onTranscriptionStaged = if var31 then var31.stageTranscription else nil,
			inputText = var12,
			setInputText = var13,
			isGlobalChatTabActive = p5.isGlobalChatTabActive,
			onDictationActivityChanged = p5.onDictationActivityChanged
		}) else reactModule.createElement(chatInputBarV2Module, {
			transparencyValue = p5.transparencyValue,
			sendButtonContainerWidth = p5.sendButtonContainerWidth,
			resetTargetChannel = p5.resetTargetChannel,
			targetTextChannel = p5.targetTextChannel,
			targetTextChannelDisplayName = p5.targetTextChannelDisplayName,
			isChannelBarVisible = p5.isChannelBarVisible,
			developerChannelTabsEnabled = p5.developerChannelTabsEnabled,
			canLocalUserChat = p5.canLocalUserChat,
			disabledChatPlaceholderText = p5.disabledChatPlaceholderText,
			placeholderText = p5.placeholderText,
			setTransparency = setTransparency,
			chatInputBarSettings = chatInputBarSettings,
			chatInputBarBackgroundTransparency = backgroundTransparency,
			isSpatialUIEnabled = isSpatialUIEnabled,
			canLocalUserChatDerived = var40,
			targetChannelWidth = var26,
			showPlaceholderText = var64,
			hasEmptyInputText = var63,
			shouldTruncatePlaceholder = if fFlagExpChatPresetChatEnabled then var42 else nil,
			cursor = var61,
			placeholderRef = var32,
			textBoxRef = var29,
			customTextBoxRef = var30,
			onAbsoluteSizeChanged = var60,
			onFocused = var49,
			onFocusLost = var50,
			onTextChanged = var58,
			onReturnPressedFromOnScreenKeyboard = var59,
			onSendActivated = var45,
			isGlobalChatTabActive = if fFlagExpChatFixBackspaceNilTargetChannel then p5.isGlobalChatTabActive else nil
		}) else nil
	}
	
	if fFlagExpChatNewInputBarModule then
		createElement_1 = nil
	elseif fFlagExpChatDictation_1 and var65 then
		createElement_1 = reactModule.createElement(dictationInputBarModule, {
			chatInputBarSettings = chatInputBarSettings,
			transparencyValue = p5.transparencyValue,
			chatInputBarBackgroundTransparency = backgroundTransparency,
			inputText = var12,
			setInputText = var13,
			canLocalUserChat = var65,
			disabledChatPlaceholderText = p5.disabledChatPlaceholderText,
			targetChannelWidth = var26,
			showPlaceholderText = var64,
			placeholderText = p5.placeholderText,
			cursor = var61,
			placeholderRef = if expChatFocusablePlaceholderText then var32 else nil,
			textBoxRef = var29,
			customTextBoxRef = var30,
			onFocused = var49,
			onFocusLost = var50,
			onTextChanged = var58,
			onReturnPressedFromOnScreenKeyboard = var59,
			onChannelChipAbsoluteSizeChanged = var60,
			onChannelChipActivated = if fFlagExpChatFixBackspaceNilTargetChannel then function()
				-- upvalues: p5 (ref)
				p5.resetTargetChannel(p5.isGlobalChatTabActive)
			end else p5.resetTargetChannel,
			targetTextChannel = p5.targetTextChannel,
			targetTextChannelDisplayName = p5.targetTextChannelDisplayName or "",
			isChannelBarVisible = p5.isChannelBarVisible,
			isGlobalChatTabActive = p5.isGlobalChatTabActive,
			developerChannelTabsEnabled = p5.developerChannelTabsEnabled,
			onDictationActivityChanged = p5.onDictationActivityChanged,
			onSendActivated = var45,
			onSendRecordingTap = var46,
			onTranscriptionStaged = if var31 then var31.stageTranscription else nil,
			isSpatialUIEnabled = isSpatialUIEnabled,
			isTextBoxSelectable = if fFlagEnableConsoleExpControls then true else nil,
			isPlaceholderSelectable = if expChatFocusablePlaceholderText then true else nil,
			placeholderSelectionImageObject = if expChatFocusablePlaceholderText then var61 else nil
		})
	else
		createElement_1 = reactModule.createElement
		local var67 = "Frame"
		local t_2 = {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = chatInputBarSettings.BackgroundColor3,
			BackgroundTransparency = if fFlagExpChatNewInputBarModule then 1 else p5.transparencyValue:map(function(p11)
				-- upvalues: backgroundTransparency (ref)
				return backgroundTransparency + p11 * (1 - backgroundTransparency)
			end),
			Size = UDim2.new(1, 0, 0, 0)
		}
		local t_3 = {}
		local createElement_2 = reactModule.createElement
		local var68 = "UIStroke"
		local t_4 = {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = configModule.ChatInputBarBorderColor3
		}
		local chatInputBarBorderTransparency = configModule.ChatInputBarBorderTransparency
		t_4.Transparency = p5.transparencyValue:map(function(p11)
			-- upvalues: chatInputBarBorderTransparency (ref)
			return chatInputBarBorderTransparency + p11 * (1 - chatInputBarBorderTransparency)
		end)
		t_3.Border = createElement_2(var68, t_4)
		t_3.Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 3) })
		local createElement_3 = reactModule.createElement
		local var69 = "Frame"
		local t_5 = {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}
		local t_6 = {}
		local createElement_4 = reactModule.createElement
		local var70 = "Frame"
		local t_7 = {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, -p5.sendButtonContainerWidth, 0, 0)
		}
		local t_8 = {}
		local createElement_5 = reactModule.createElement
		local t_9 = {}
		local var71 = 0
		t_9.transparency = p5.transparencyValue:map(function(p11)
			-- upvalues: var71 (ref)
			return var71 + p11 * (1 - var71)
		end)
		t_9.onAbsoluteSizeChanged = var60
		t_9.onChannelChipActivated = if fFlagExpChatFixBackspaceNilTargetChannel then function()
			-- upvalues: p5 (ref)
			p5.resetTargetChannel(p5.isGlobalChatTabActive)
		end else p5.resetTargetChannel
		t_9.targetTextChannelDisplayName = p5.targetTextChannelDisplayName or ""
		t_9.isChannelBarVisible = p5.isChannelBarVisible
		t_9.developerChannelTabsEnabled = p5.developerChannelTabsEnabled
		t_8.TargetChannelChip = createElement_5(channelChipModule, t_9)
		local var72 = if fFlagExpChatUseMessagesStore then not var40 else not p5.canLocalUserChat
		
		if var72 then
			var72 = reactModule.createElement
			local var73 = "TextLabel"
			local t_10 = {
				BackgroundTransparency = 1,
				TextWrapped = true,
				AnchorPoint = Vector2.new(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Font = configModule.ChatInputBarFont,
				Text = p5.disabledChatPlaceholderText,
				Position = UDim2.fromScale(1, 0),
				Size = var26:map(function(p11)
					return UDim2.new(1, -(p11 + 8), 0, 0)
				end),
				TextColor3 = if var64 then chatInputBarSettings.PlaceholderColor3 else chatInputBarSettings.TextColor3,
				TextSize = if isSpatialUIEnabled then chatInputBarSettings.SpatialPanelTextSize else chatInputBarSettings.TextSize
			}
			local var74 = if var64 then 0.5 else 0
			t_10.TextTransparency = p5.transparencyValue:map(function(p11)
				-- upvalues: var74 (ref)
				return var74 + p11 * (1 - var74)
			end)
			t_10.Selectable = if expChatFocusablePlaceholderText then true else nil
			t_10.SelectionImageObject = if expChatFocusablePlaceholderText then var61 else nil
			t_10.TextXAlignment = Enum.TextXAlignment.Left
			t_10.TextYAlignment = Enum.TextYAlignment.Top
			t_10.ref = if expChatFocusablePlaceholderText then var32 else nil
			var72 = var72(var73, t_10)
		end
		t_8.DisabledPlaceholderLabel = var72
		local var75 = if fFlagExpChatUseMessagesStore then var40 else p5.canLocalUserChat
		
		if var75 then
			var75 = reactModule.createElement
			local var76 = "Frame"
			local t_10 = {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Position = UDim2.fromScale(1, 0),
				Size = var26:map(function(p11)
					return UDim2.new(1, -(p11 + 8), 0, 0)
				end)
			}
			local t_11 = {}
			local var77 = if fFlagExpChatUseMessagesStore then var40 else p5.canLocalUserChat
			
			if var77 then
				var77 = reactModule.createElement
				local var78 = "TextBox"
				local t_12 = {
					AnchorPoint = Vector2.new(0, 0),
					AutomaticSize = Enum.AutomaticSize.XY,
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					FontFace = chatInputBarSettings.FontFace,
					PlaceholderText = if var64 then p5.placeholderText else "",
					Selectable = if fFlagEnableConsoleExpControls then true else nil,
					SelectionImageObject = var61,
					Size = UDim2.fromScale(1, 0),
					Text = "",
					PlaceholderColor3 = chatInputBarSettings.PlaceholderColor3,
					TextColor3 = chatInputBarSettings.TextColor3,
					TextSize = if isSpatialUIEnabled then chatInputBarSettings.SpatialPanelTextSize else chatInputBarSettings.TextSize
				}
				local var79 = if var64 then 0.5 else 0
				t_12.TextTransparency = p5.transparencyValue:map(function(p11)
					-- upvalues: var79 (ref)
					return var79 + p11 * (1 - var79)
				end)
				local textStrokeTransparency = chatInputBarSettings.TextStrokeTransparency
				t_12.TextStrokeTransparency = p5.transparencyValue:map(function(p11)
					-- upvalues: textStrokeTransparency (ref)
					return textStrokeTransparency + p11 * (1 - textStrokeTransparency)
				end)
				t_12.TextStrokeColor3 = chatInputBarSettings.TextStrokeColor3
				t_12.TextWrapped = true
				t_12.TextXAlignment = Enum.TextXAlignment.Left
				t_12.TextYAlignment = Enum.TextYAlignment.Top
				t_12.ZIndex = 2
				t_12[reactModule.Event.Focused] = var49
				t_12[reactModule.Event.FocusLost] = var50
				t_12[reactModule.Change.Text] = var58
				t_12[reactModule.Event.ReturnPressedFromOnScreenKeyboard] = var59
				t_12.ref = if chatInputBarSettings.TextBox then var30 else var29
				var77 = var77(var78, t_12)
			end
			t_11.TextBox = var77
			var75 = var75(var76, t_10, t_11)
		end
		t_8.TextBoxContainer = var75
		t_8.UIPadding = reactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 10),
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10)
		})
		t_6.TextContainer = createElement_4(var70, t_7, t_8)
		local createElement_6 = reactModule.createElement
		local var80 = "TextButton"
		local t_10 = {
			AnchorPoint = Vector2.new(1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Position = UDim2.fromScale(1, 0),
			Selectable = false,
			Size = UDim2.new(0, p5.sendButtonContainerWidth, 1, 0),
			Text = "",
			[reactModule.Event.Activated] = var45
		}
		local t_11 = {
			Layout = reactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			})
		}
		local createElement_7 = reactModule.createElement
		local var81 = imageSetLabel
		local t_12 = {
			BackgroundTransparency = 1,
			ZIndex = 2,
			ImageColor3 = if var63 then chatInputBarSettings.PlaceholderColor3 else chatInputBarSettings.TextColor3
		}
		local var82 = if var63 then 0.5 else 0
		t_12.ImageTransparency = p5.transparencyValue:map(function(p11)
			-- upvalues: var82 (ref)
			return var82 + p11 * (1 - var82)
		end)
		t_12.Image = images["icons/actions/send"]
		t_12.Size = UDim2.new(0, 30, 0, 30)
		t_11.SendIcon = createElement_7(var81, t_12)
		t_6.SendButton = createElement_6(var80, t_10, t_11)
		t_3.Container = createElement_3(var69, t_5, t_6)
		createElement_1 = createElement_1(var67, t_2, t_3)
	end
	t_1.Background = createElement_1
	
	return createElement(var66, t, t_1)
end))