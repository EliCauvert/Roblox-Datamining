local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local FocusUtils = require(Parent.Chrome).FocusUtils
local UseFocusInputBarFunction = require(Parent.ChatUIPrimitives).Hooks.useFocusInputBar
local UseInputBarTabNavigationFunction = require(Parent.ChatUIPrimitives).Hooks.useInputBarTabNavigation
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local IXPServiceWrapper = require(Parent.IxpServiceWrapper).IXPServiceWrapper
local GetChatTooltipStoreModule = require(ExpChat.Stores.GetChatTooltipStore)
local UIBloxModule = require(Parent.UIBlox)
local PromiseModule = require(Parent.Promise)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local List = require(Parent.llama).List
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseCursorFunction = UIBloxModule.App.SelectionCursor.useCursor
local UseInterpolatedClientSettingsModule = require(ExpChat.ClientSettings.useInterpolatedClientSettings)
local ConfigModule = require(ExpChat.Config)
local GetPresetChatStoreModule = require(ExpChat.Stores.GetPresetChatStore)
local NewResult = ExpChatSharedModule.Logger:new("ExpChat/" .. script.Name)
local AutoCastCommandFunction = ExpChatSharedModule.Commands.autoCastCommand
local RBXWhisperCommand = ExpChatSharedModule.Commands.Whisper.RBXWhisperCommand
local RBXTeamCommand = ExpChatSharedModule.Commands.RBXTeamCommand
local LocalizationModule = require(ExpChat.Localization)
local GetOtherDisplayNameInWhisperChannelModule = require(ExpChat.getOtherDisplayNameInWhisperChannel)
local ChannelChipModule = require(script.Parent.ChannelChip)
local AutocompleteTextModule = require(ExpChat.Autocomplete.AutocompleteText)
local PresetEntryTextModule = require(ExpChat.Autocomplete.PresetEntryText)
local PresetSearchModule = require(ExpChat.Autocomplete.PresetSearch)
local ConstantsModule = require(ExpChat.PresetChat.Constants)
local SendPresetModule = require(ExpChat.PresetChat.sendPreset)
local InitializeEmojisModule = require(ExpChat.Autocomplete.Initializations.initializeEmojis)
local InitializeCommandsModule = require(ExpChat.Autocomplete.Initializations.initializeCommands)
local InitializeGlobalCommandsModule = require(ExpChat.Autocomplete.Initializations.initializeGlobalCommands)
local InitialCommandsModule = require(ExpChat.Autocomplete.Initializations.initialCommands)
local SortEmojiResultsCallbackModule = require(ExpChat.Autocomplete.SortingCallbacks.sortEmojiResultsCallback)
local SortCommandResultsCallbackModule = require(ExpChat.Autocomplete.SortingCallbacks.sortCommandResultsCallback)
local AutocompleteDropdownModule = require(script:FindFirstAncestor("ChatInput").UI.AutocompleteDropdown)
local ChatInputBarV2Module = require(script.Parent.ChatInputBarV2)
local ChatInputBarV2DictationModule = require(script.Parent.ChatInputBarV2Dictation)
local FFlagExpChatPresetChatEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local FFlagExpChatPresetChatAutocompleteEnabledModule = require(ExpChat.Flags.FFlagExpChatPresetChatAutocompleteEnabled)
local FFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule = require(ExpChat.Flags.FFlagExpChatPresetChatAutocompleteAnalyticsEnabled)
local FFlagExpChatEmojiDropdownShowAnalyticsModule = require(ExpChat.Flags.FFlagExpChatEmojiDropdownShowAnalytics)
local FFlagExpChatEmojiDropdownDismissAnalyticsModule = require(ExpChat.Flags.FFlagExpChatEmojiDropdownDismissAnalytics)
local FFlagExpChatUniverseChatPresetEnabledModule = require(ExpChat.Flags.FFlagExpChatUniverseChatPresetEnabled)
local FFlagExpChatUseUnifiedTooltipStore = ExpChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore
local FFlagExpChatNewInputBarModule = require(ExpChat.Flags.FFlagExpChatNewInputBar)
local FFlagExpChatAutocompleteDropdownRedesignModule = require(ExpChat.Flags.FFlagExpChatAutocompleteDropdownRedesign)
local FFlagExpChatNewInputBarDictationModule = require(ExpChat.Flags.FFlagExpChatNewInputBarDictation)
local FFlagExpChatPresetChatGamepadEnabledModule = require(ExpChat.Flags.FFlagExpChatPresetChatGamepadEnabled)
local ExpChatPresetChatIXPExposure = game:DefineFastFlag("ExpChatPresetChatIXPExposure", false)
local ExpChatPresetChatIXPLayerName = game:DefineFastString("ExpChatPresetChatIXPLayerName", "UniverseChat.PresetChat")
local ExpChatDictationIXPExposure = game:DefineFastFlag("ExpChatDictationIXPExposure", false)
local ExpChatDictationIXPLayerName = game:DefineFastString("ExpChatDictationIXPLayerName", "UniverseChat.Dictation")
local ExpChatPresetAutocompleteIxpEnabled = game:DefineFastFlag("ExpChatPresetAutocompleteIxpEnabled", false)
local ExpChatPresetAutocompleteIxpLayer = game:DefineFastString("ExpChatPresetAutocompleteIxpLayer", "")
local ExpChatPresetAutocompleteSearchVariants = game:DefineFastFlag("ExpChatPresetAutocompleteSearchVariants", false)
local FFlagExpChatPresetChatSendEnabled = require(ExpChat.Flags.FFlagExpChatPresetAutocompleteIxpGated) and ExpChatSharedModule.Flags.FFlagExpChatPresetChatSendEnabled
local ExpChatMainInputBarClickAnalytics = game:DefineFastFlag("ExpChatMainInputBarClickAnalytics", false)
local GetEnableChatInputBarConfigurationAutocompleteEnabledModule = require(ExpChat.Flags.getEnableChatInputBarConfigurationAutocompleteEnabled)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagChromeChatGamepadSupportFix = SharedFlagsModule.FFlagChromeChatGamepadSupportFix
local FFlagConsoleChatUseChromeFocusUtils = SharedFlagsModule.FFlagConsoleChatUseChromeFocusUtils
local ChatOptimizeCommandProcessing = game:DefineFastFlag("ChatOptimizeCommandProcessing", false)
local ExpChatDoNotSetCursorPosition = game:DefineFastFlag("ExpChatDoNotSetCursorPosition", false)
local FFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule = require(ExpChat.Flags.FFlagExpChatBackspaceExitsTargetChannelInGlobalTabs)
local FFlagExpChatFixBackspaceNilTargetChannel = ExpChatSharedModule.Flags.FFlagExpChatFixBackspaceNilTargetChannel
local GetFFlagTextChatEnableUniverseChatTabsFunction = ExpChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local FFlagExpChatDictation = SharedFlagsModule.FFlagExpChatDictation
local FFlagExpChatContinuousDictation = SharedFlagsModule.FFlagExpChatContinuousDictation
local FFlagExpChatTabShortcutNav = SharedFlagsModule.FFlagExpChatTabShortcutNav
local FFlagExpChatDictation1 = FFlagExpChatDictation or FFlagExpChatContinuousDictation
local DictationInputBarModule = require(script.Parent.Dictation.DictationInputBar)
local UseSendTelemetryModule = require(script.Parent.Dictation.useSendTelemetry)
local UsePresetAutocompleteAnalyticsModule = require(script.Parent.usePresetAutocompleteAnalytics)
local ExpChatPresetChatAutocompleteExperimentation = require(Parent.SocialExperiments).ExpChatPresetChatAutocompleteExperimentation
local ActionBindableEvent = ExpChatSharedModule.ActionBindableEvent
local v1 = require(ExpChat.Stores.GetFocusNavigationStore)(false)
local FIntPresetChatCooldownLuaMsRatio = ExpChatSharedModule.Flags.FIntPresetChatCooldownLuaMs / 1000

local function setTransparency(p1, p2)
	return p2:map(function(p3): number
		-- upvalues: p1 (copy)
		return p1 + p3 * (1 - p1)
	end)
end

local NewResult1 = nil
local NewResult2 = nil
local NewResult3 = nil
local Name = nil
local Name1 = nil

local function onChatInputBarFocusLost(Callback1, Keybinds, Callback)
	-- upvalues: UserInputService (copy), GuiService (copy)
	local list = { Enum.KeyCode.ButtonB }
	local Keybinds1 = Keybinds or list
	local Connection = nil
	Connection = UserInputService.InputBegan:Connect(function(Input)
		-- upvalues: Keybinds1 (copy), GuiService (upval), Callback (copy), Callback1 (copy), Connection (ref)
		local KeyCode = if Input then Input.KeyCode else nil
		for _, value in Keybinds1 do
			if KeyCode == value then
				GuiService:SetMenuIsOpen(false, "ExperienceChat")
				Callback()
				
				if Callback1 then
					Callback1()
				else
					GuiService.SelectedCoreObject = nil
				end
				if not Connection then break end
				Connection:Disconnect()
				Connection = nil
				break
			end
		end
	end)
	
	return Connection
end

local function useEffectChatInputBarFocus(UseRefResult, UseRefResult1, UseRefResult2, Callback, Callback1)
	-- upvalues: FFlagConsoleChatUseChromeFocusUtils (copy), ReactModule (copy), SignalsModule (copy), v1 (copy), GuiService (copy), UserInputService (copy), FocusUtils (copy), FFlagChromeChatGamepadSupportFix (copy), FFlagEnableConsoleExpControls (copy), onChatInputBarFocusLost (copy), ActionBindableEvent (copy)
	if FFlagConsoleChatUseChromeFocusUtils then
		ReactModule.useEffect(function()
			-- upvalues: SignalsModule (upval), v1 (upval), UseRefResult1 (copy), UseRefResult (copy), UseRefResult2 (copy), GuiService (upval), Callback (copy), UserInputService (upval), FocusUtils (upval), Callback1 (copy)
			local t = {}
			local InputBeganConnection = nil
			local Effect = SignalsModule.createEffect(function(p1)
				-- upvalues: v1 (upval), UseRefResult1 (upval), UseRefResult (upval), UseRefResult2 (upval), GuiService (upval), Callback (upval), InputBeganConnection (ref), UserInputService (upval), t (copy), FocusUtils (upval), Callback1 (upval)
				local ChatInputBarFocused = v1.getChatInputBarFocused(p1)
				local Current = (if UseRefResult1.current then UseRefResult1.current else UseRefResult.current) or UseRefResult2.current
				
				if not Current then return end
				if ChatInputBarFocused then
					GuiService:SetMenuIsOpen(true, "ExperienceChat")
					Callback()
					GuiService.SelectedCoreObject = Current
					
					if not InputBeganConnection then
						InputBeganConnection = UserInputService.InputBegan:Connect(function(Input)
							-- upvalues: t (upval), FocusUtils (upval), v1 (upval)
							if Input and t[Input.KeyCode] then
								FocusUtils.FocusOnChrome(function()
									-- upvalues: v1 (upval)
									v1.unfocusChatInputBar()
								end, "chat")
							end
						end)
						
						return
					end
				elseif GuiService.MenuIsOpen then
					GuiService:SetMenuIsOpen(false, "ExperienceChat")
					Callback1()
					
					if InputBeganConnection then
						InputBeganConnection:Disconnect()
						InputBeganConnection = nil
					end
				end
			end)
			
			return function()
				-- upvalues: Effect (copy), InputBeganConnection (ref)
				Effect()
				
				if InputBeganConnection then
					InputBeganConnection:Disconnect()
					InputBeganConnection = nil
				end
			end
		end, {})
		
		return
	end
	if FFlagChromeChatGamepadSupportFix then
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult1 (copy), UseRefResult (copy), FFlagEnableConsoleExpControls (upval), GuiService (upval), Callback (copy), onChatInputBarFocusLost (upval), Callback1 (copy), ActionBindableEvent (upval)
			local Connection = nil
			local DelayedThread = nil
			local EventConnection = ActionBindableEvent.Event:Connect(function(p1)
				-- upvalues: UseRefResult1 (upval), UseRefResult (upval), FFlagEnableConsoleExpControls (upval), GuiService (upval), Callback (upval), DelayedThread (ref), Connection (ref), onChatInputBarFocusLost (upval), Callback1 (upval)
				local Current = if UseRefResult1.current then UseRefResult1.current else UseRefResult.current
				
				if FFlagEnableConsoleExpControls and p1.type == "ChatTopBarFocusSelect" and Current then
					GuiService:SetMenuIsOpen(true, "ExperienceChat")
					Callback()
					GuiService.SelectedCoreObject = Current
					DelayedThread = task.delay(0, function()
						-- upvalues: DelayedThread (upval), Connection (upval), onChatInputBarFocusLost (upval), p1 (copy), Callback1 (upval)
						DelayedThread = nil
						
						if Connection then
							Connection:Disconnect()
						end
						Connection = onChatInputBarFocusLost(p1.onSelectionLost, p1.keybinds, Callback1)
					end)
				end
			end)
			
			return function()
				-- upvalues: EventConnection (copy), DelayedThread (ref), Connection (ref)
				EventConnection:disconnect()
				
				if DelayedThread then
					task.cancel(DelayedThread)
					DelayedThread = nil
				end
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
			end
		end, { UseRefResult.current, UseRefResult1.current })
	end
end

return ReactModule.memo((LocalizationModule.connect(function(p1)
	-- upvalues: GetOtherDisplayNameInWhisperChannelModule (copy)
	local TargetTextChannelDisplayName = nil
	
	if p1.targetTextChannel then
		for i, value in pairs({
			RBXTeam = "CoreScripts.TextChat.TeamChat.PrefixText",
			RBXWhisper = "CoreScripts.TextChat.WhisperChat.PrefixText.Outgoing"
		}) do
			if string.match(p1.targetTextChannel.Name, i) then
				if i == "RBXWhisper" then
					local OtherDisplayNameInWhisperChannelModule = GetOtherDisplayNameInWhisperChannelModule(p1.targetTextChannel, p1.localPlayer)
					
					if OtherDisplayNameInWhisperChannelModule then
						TargetTextChannelDisplayName = {
							value,
							{ RBX_NAME = OtherDisplayNameInWhisperChannelModule }
						}
					end
				else
					TargetTextChannelDisplayName = value
				end
			end
		end
	end
	return {
		targetTextChannelDisplayName = TargetTextChannelDisplayName
	}
end)(function(Frame)
	-- upvalues: ReactModule (copy), FFlagExpChatUseUnifiedTooltipStore (copy), GetChatTooltipStoreModule (copy), ExpChatMainInputBarClickAnalytics (copy), FFlagExpChatDictation1 (copy), UseSendTelemetryModule (copy), FFlagExpChatEmojiDropdownDismissAnalyticsModule (copy), ReactFocusNavigationModule (copy), SignalsReactModule (copy), v1 (copy), GetMessagesStoreModule (copy), FFlagExpChatPresetChatEnabled (copy), GetPresetChatStoreModule (copy), FFlagExpChatTabShortcutNav (copy), UseFocusInputBarFunction (copy), UseInputBarTabNavigationFunction (copy), SignalsModule (copy), TextChatService (copy), NewResult2 (ref), AutocompleteTextModule (copy), InitializeCommandsModule (copy), GetEnableChatInputBarConfigurationAutocompleteEnabledModule (copy), NewResult1 (ref), InitializeEmojisModule (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), NewResult3 (ref), InitializeGlobalCommandsModule (copy), InitialCommandsModule (copy), NewResult (copy), FFlagExpChatDictation (copy), FFlagExpChatPresetChatGamepadEnabledModule (copy), GuiService (copy), FFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule (copy), UsePresetAutocompleteAnalyticsModule (copy), PresetSearchModule (copy), FIntPresetChatCooldownLuaMsRatio (copy), SendPresetModule (copy), ExpChatSharedModule (copy), ConstantsModule (copy), FFlagExpChatAutocompleteDropdownRedesignModule (copy), FFlagExpChatPresetChatAutocompleteEnabledModule (copy), PresetEntryTextModule (copy), ExpChatDoNotSetCursorPosition (copy), ExpChatPresetChatIXPExposure (copy), IXPServiceWrapper (copy), ExpChatPresetChatIXPLayerName (copy), FFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule (copy), FFlagExpChatFixBackspaceNilTargetChannel (copy), ConfigModule (copy), Players (copy), FFlagEnableConsoleExpControls (copy), FFlagChromeChatGamepadSupportFix (copy), onChatInputBarFocusLost (copy), ActionBindableEvent (copy), useEffectChatInputBarFocus (copy), FFlagExpChatUniverseChatPresetEnabledModule (copy), ExpChatPresetAutocompleteSearchVariants (copy), ExpChatPresetChatAutocompleteExperimentation (copy), SortCommandResultsCallbackModule (copy), SortEmojiResultsCallbackModule (copy), List (copy), Name (ref), RBXTeamCommand (copy), Name1 (ref), RBXWhisperCommand (copy), ChatOptimizeCommandProcessing (copy), AutoCastCommandFunction (copy), PromiseModule (copy), UseCursorFunction (copy), ExpChatDictationIXPExposure (copy), ExpChatDictationIXPLayerName (copy), ExpChatPresetAutocompleteIxpEnabled (copy), ExpChatPresetAutocompleteIxpLayer (copy), FFlagExpChatPresetChatSendEnabled (copy), UseInterpolatedClientSettingsModule (copy), FFlagExpChatNewInputBarModule (copy), AutocompleteDropdownModule (copy), setTransparency (copy), FFlagExpChatEmojiDropdownShowAnalyticsModule (copy), FFlagExpChatNewInputBarDictationModule (copy), ChatInputBarV2DictationModule (copy), ChatInputBarV2Module (copy), DictationInputBarModule (copy), ChannelChipModule (copy), ImageSetLabel (copy), Images (copy)
	local UseRefResult = ReactModule.useRef("")
	
	if FFlagExpChatUseUnifiedTooltipStore then
		local SetIsChatInputBarVisibleFunction = GetChatTooltipStoreModule(false).setIsChatInputBarVisible
		ReactModule.useEffect(function()
			-- upvalues: Frame (copy), SetIsChatInputBarVisibleFunction (copy)
			if Frame.visible == nil then
				SetIsChatInputBarVisibleFunction(true)
			else
				SetIsChatInputBarVisibleFunction(Frame.visible)
			end
			return function()
				-- upvalues: SetIsChatInputBarVisibleFunction (upval)
				SetIsChatInputBarVisibleFunction(false)
			end
		end, { Frame.visible, SetIsChatInputBarVisibleFunction })
	end
	local UseStateResult1 = nil
	local UseStateResult2_1 = nil
	local UseStateResult3 = nil
	local UseStateResult2_2 = nil
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	UseStateResult3, UseStateResult2_2 = ReactModule.useState(0)
	local UseRefResult1 = if ExpChatMainInputBarClickAnalytics then ReactModule.useRef(false) else nil
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseStateResult5, _ = ReactModule.useState(true)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseSendTelemetryModuleResult = if FFlagExpChatDictation1 then UseSendTelemetryModule({
		enabled = FFlagExpChatDictation1,
		textBoxRef = UseRefResult3,
		customTextBoxRef = UseRefResult4
	}) else nil
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseRefResult6 = ReactModule.useRef(nil)
	local UseRefResult7 = if FFlagExpChatEmojiDropdownDismissAnalyticsModule then ReactModule.useRef(nil) else nil
	local UseRefResult8 = ReactModule.useRef(nil)
	local UseRefResult9 = ReactModule.useRef(nil)
	local UseRefResult10 = ReactModule.useRef(false)
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local UseSignalStateResult = SignalsReactModule.useSignalState(v1.getChatInputBarFocused)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(GetMessagesStoreModule(false).getCanLocalUserChat)
	local UseSignalStateResult2 = if FFlagExpChatPresetChatEnabled then SignalsReactModule.useSignalState(GetPresetChatStoreModule(false).getIsTrayOpen) else nil
	local UseSignalStateResult3 = if FFlagExpChatPresetChatEnabled then SignalsReactModule.useSignalState(GetPresetChatStoreModule(false).getIsEnabled) else nil
	local UseRefResult11 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult4 (copy), Frame (copy)
		UseRefResult4.current = Frame.chatInputBarSettings.TextBox
	end, {
		if Frame.chatInputBarSettings.TextBox == nil then "nil" else Frame.chatInputBarSettings.TextBox
	})
	local FocusFunction = nil
	
	if FFlagExpChatTabShortcutNav then
		local UseRefResult12 = if Frame.chatInputBarSettings.TextBox == nil then UseRefResult3 else UseRefResult4
		FocusFunction = UseFocusInputBarFunction(UseRefResult12).focus
		UseInputBarTabNavigationFunction(UseRefResult12, Frame.userInputService)
	end
	ReactModule.useEffect(function()
		-- upvalues: FFlagExpChatTabShortcutNav (upval), SignalsModule (upval), v1 (upval), FocusFunction (ref)
		if not FFlagExpChatTabShortcutNav then return end
		return SignalsModule.createEffect(function(p2)
			-- upvalues: v1 (upval), FocusFunction (upval)
			local ChatInputBarFocusRequestTime = v1.getChatInputBarFocusRequestTime(p2)
			
			if ChatInputBarFocusRequestTime == nil then return end
			if os.clock() - ChatInputBarFocusRequestTime <= 5 then
				FocusFunction()
			end
			v1.clearChatInputBarFocusRequest()
		end)
	end, { FocusFunction })
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), TextChatService (upval), NewResult2 (upval), AutocompleteTextModule (upval), InitializeCommandsModule (upval), GetEnableChatInputBarConfigurationAutocompleteEnabledModule (upval), NewResult1 (upval), InitializeEmojisModule (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), NewResult3 (upval), InitializeGlobalCommandsModule (upval), InitialCommandsModule (upval)
		if not Frame.autocompleteEnabled then return end
		local List = {}
		local DescendantAddedConnection = TextChatService.DescendantAdded:Connect(function(Descendant)
			-- upvalues: NewResult2 (upval), AutocompleteTextModule (upval), InitializeCommandsModule (upval), List (copy)
			if Descendant:IsA("TextChatCommand") and string.sub(Descendant.PrimaryAlias, 1, 1) == "/" then
				NewResult2 = AutocompleteTextModule.new(InitializeCommandsModule)
				table.insert(List, (Descendant:GetPropertyChangedSignal("AutocompleteVisible"):Connect(function()
					-- upvalues: NewResult2 (upval), AutocompleteTextModule (upval), InitializeCommandsModule (upval)
					NewResult2 = AutocompleteTextModule.new(InitializeCommandsModule)
				end)))
			end
		end)
		local DescendantRemovingConnection = TextChatService.DescendantRemoving:Connect(function(Descendant)
			-- upvalues: NewResult2 (upval), AutocompleteTextModule (upval), InitializeCommandsModule (upval)
			if Descendant:IsA("TextChatCommand") and string.sub(Descendant.PrimaryAlias, 1, 1) == "/" then
				NewResult2 = AutocompleteTextModule.new(InitializeCommandsModule)
			end
		end)
		
		if GetEnableChatInputBarConfigurationAutocompleteEnabledModule() then
			NewResult2 = AutocompleteTextModule.new(InitializeCommandsModule)
			NewResult1 = AutocompleteTextModule.new(InitializeEmojisModule)
			
			if GetFFlagTextChatEnableUniverseChatTabsFunction() then
				NewResult3 = AutocompleteTextModule.new(InitializeGlobalCommandsModule)
			end
			local InitialCommandsModuleResult = InitialCommandsModule()
			
			if InitialCommandsModuleResult then
				for _, value in InitialCommandsModuleResult do
					table.insert(List, (value:GetPropertyChangedSignal("AutocompleteVisible"):Connect(function()
						-- upvalues: NewResult2 (upval), AutocompleteTextModule (upval), InitializeCommandsModule (upval)
						NewResult2 = AutocompleteTextModule.new(InitializeCommandsModule)
					end)))
				end
			end
		end
		return function()
			-- upvalues: DescendantRemovingConnection (copy), DescendantAddedConnection (copy), List (copy)
			if DescendantRemovingConnection then
				DescendantRemovingConnection:Disconnect()
			end
			DescendantAddedConnection:Disconnect()
			
			for _, Connection in ipairs(List) do
				Connection:Disconnect()
			end
			table.clear(List)
		end
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: NewResult (upval), UseStateResult (copy), UseSignalStateResult1 (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseRefResult4 (copy), UseSendTelemetryModuleResult (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Frame (copy), FFlagExpChatDictation (upval), UseStateResult2 (copy), FFlagExpChatPresetChatGamepadEnabledModule (upval), GuiService (upval), UseRefResult10 (copy)
		NewResult:trace("onSendActivated with input text: '{}'", UseStateResult)
		
		if not UseRefResult2.current or not UseSignalStateResult1 then
			NewResult:debug("onSendActivated could not send message. isMounted: {} canLocalUserChat: {}", tostring(UseRefResult2.current), UseSignalStateResult1)
			
			return
		end
		if UseRefResult3.current or UseRefResult4.current then
			local Text = if UseRefResult4.current then UseRefResult4.current.Text else UseRefResult3.current.Text
			local ConsumeOnSendResult = if UseSendTelemetryModuleResult then UseSendTelemetryModuleResult.consumeOnSend(Text) else nil
			local OnSendGlobalChat: (any, any, any) -> () = if GetFFlagTextChatEnableUniverseChatTabsFunction() and Frame.isGlobalChatTabActive and Frame.onSendGlobalChat then Frame.onSendGlobalChat else Frame.onSendChat
			
			if OnSendGlobalChat and string.find(Text, "%S") ~= nil then
				if FFlagExpChatDictation then
					OnSendGlobalChat(Text, ConsumeOnSendResult, ConsumeOnSendResult ~= nil)
				else
					OnSendGlobalChat(Text)
				end
			else
				NewResult:debug("onSendActivated could not send message. text: '{}' canLocalUserChat: {}", Text, UseSignalStateResult1)
			end
			if UseRefResult4.current then
				UseRefResult4.current.Text = ""
				UseRefResult4.current:ReleaseFocus()
			end
			if UseRefResult3.current then
				UseRefResult3.current.Text = ""
				UseRefResult3.current:ReleaseFocus()
			end
			UseStateResult2("")
			
			if FFlagExpChatPresetChatGamepadEnabledModule then
				local Current = UseRefResult4.current or UseRefResult3.current
				
				if Current then
					GuiService.SelectedCoreObject = Current
				end
			end
			if Frame.targetTextChannel and Frame.targetTextChannelDisplayName ~= "" then
				UseRefResult10.current = true
				
				return
			end
		else
			NewResult:debug("onSendActivated could not send message because textBoxRef.current was nil")
		end
	end, {
		UseStateResult, UseRefResult4.current, UseSignalStateResult1,
		Frame.canLocalUserChat, Frame.isGlobalChatTabActive, Frame.onSendChat or false,
		Frame.onSendGlobalChat or false, Frame.targetTextChannel or false,
		Frame.targetTextChannelDisplayName,
		if UseSendTelemetryModuleResult then UseSendTelemetryModuleResult.consumeOnSend else false
	})
	local UseResult1 = if FFlagExpChatDictation1 then ReactModule.useCallback(function(p2)
		-- upvalues: UseSignalStateResult1 (copy), UseRefResult2 (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Frame (copy), UseRefResult4 (copy), UseRefResult3 (copy), UseStateResult2 (copy), FFlagExpChatPresetChatGamepadEnabledModule (upval), GuiService (upval), UseRefResult10 (copy)
		if not UseRefResult2.current or not UseSignalStateResult1 then return end
		local TextSent = p2 and p2.textSent or ""
		local OnSendGlobalChat: (any, any, any) -> () = if GetFFlagTextChatEnableUniverseChatTabsFunction() and Frame.isGlobalChatTabActive and Frame.onSendGlobalChat then Frame.onSendGlobalChat else Frame.onSendChat
		
		if OnSendGlobalChat and string.find(TextSent, "%S") ~= nil then
			OnSendGlobalChat(TextSent, p2, true)
		end
		if UseRefResult4.current then
			UseRefResult4.current.Text = ""
			UseRefResult4.current:ReleaseFocus()
		end
		if UseRefResult3.current then
			UseRefResult3.current.Text = ""
			UseRefResult3.current:ReleaseFocus()
		end
		UseStateResult2("")
		
		if FFlagExpChatPresetChatGamepadEnabledModule then
			local Current = UseRefResult4.current or UseRefResult3.current
			
			if Current then
				GuiService.SelectedCoreObject = Current
			end
		end
		if Frame.targetTextChannel and Frame.targetTextChannelDisplayName ~= "" then
			UseRefResult10.current = true
		end
	end, {
		UseRefResult4.current, UseSignalStateResult1, Frame.canLocalUserChat,
		Frame.isGlobalChatTabActive, Frame.onSendChat or false,
		Frame.onSendGlobalChat or false, Frame.targetTextChannel or false,
		Frame.targetTextChannelDisplayName
	}) else nil
	local RecordPresetChosen = if FFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule then UsePresetAutocompleteAnalyticsModule({
		isFocused = UseStateResult4,
		autocompleteEnabled = Frame.autocompleteEnabled,
		autocompleteDropdownReducer = Frame.autocompleteDropdownReducer
	}).recordPresetChosen else nil
	
	local function sendSelectedPreset(UndecorateResult)
		-- upvalues: GetPresetChatStoreModule (upval), PresetSearchModule (upval), NewResult (upval), FIntPresetChatCooldownLuaMsRatio (upval), SendPresetModule (upval), Frame (copy), ExpChatSharedModule (upval), ConstantsModule (upval), FFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule (upval)
		local PresetChatStoreModule = GetPresetChatStoreModule(false)
		local PresetIdForValue = PresetSearchModule.getPresetIdForValue(PresetChatStoreModule, UndecorateResult)
		
		if PresetIdForValue == nil then
			NewResult:warning("Could not resolve a preset id for autocomplete entry '{}'; skipping send.", UndecorateResult)
			
			return
		end
		PresetChatStoreModule.setPresetCooldownEndsAt(os.clock() + FIntPresetChatCooldownLuaMsRatio)
		local SendPresetModuleResult = SendPresetModule(PresetIdForValue, Frame.targetTextChannel)
		
		if SendPresetModuleResult == "Sent" then
			ExpChatSharedModule.Analytics:TelemetryLogEvent(ExpChatSharedModule.Analytics.ExpChatPresetActionConfig, {
				event_type = ConstantsModule.Analytics.EventTypes.Click,
				component = if FFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule then ConstantsModule.Analytics.Components.AutocompleteDropdown else ConstantsModule.Analytics.Components.PresetAutocomplete,
				preset_id = PresetIdForValue
			}, if FFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule then ConstantsModule.Analytics.ExtendedStandardizedFields else ExpChatSharedModule.Analytics.DefaultStandardizedFields)
			
			return
		else
			PresetChatStoreModule.setPresetCooldownEndsAt(nil)
			NewResult:warning("Could not send preset {} from autocomplete: {}", PresetIdForValue, SendPresetModuleResult)
		end
	end
	
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: FFlagExpChatAutocompleteDropdownRedesignModule (upval), Frame (copy), FFlagExpChatPresetChatAutocompleteEnabledModule (upval), PresetEntryTextModule (upval), FFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule (upval), RecordPresetChosen (ref), FFlagExpChatEmojiDropdownDismissAnalyticsModule (upval), UseRefResult7 (ref), UseRefResult4 (copy), UseRefResult3 (copy), UseStateResult1 (ref), UseStateResult2 (copy), UseRefResult2 (copy), ExpChatMainInputBarClickAnalytics (upval), UseRefResult1 (copy), UseSignalStateResult (copy), UseFocusGuiObjectResult (copy), ExpChatDoNotSetCursorPosition (upval), sendSelectedPreset (copy), NewResult (upval)
		local Result = if FFlagExpChatAutocompleteDropdownRedesignModule then Frame.autocompleteDropdownReducer.results[p2.Parent.LayoutOrder] else nil
		local Result1 = if FFlagExpChatPresetChatAutocompleteEnabledModule and Frame.autocompleteDropdownReducer.autocompleteType == "presets" then if FFlagExpChatAutocompleteDropdownRedesignModule then Result else PresetEntryTextModule.undecorate(p2.TextLabel.Text, Frame.chatInputBarSettings.TextSize) else nil
		
		if FFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule and RecordPresetChosen ~= nil and Result1 ~= nil then
			RecordPresetChosen(Result1)
		end
		if FFlagExpChatEmojiDropdownDismissAnalyticsModule and UseRefResult7 and Frame.autocompleteDropdownReducer.autocompleteType == "emojis" then
			UseRefResult7.current = if FFlagExpChatAutocompleteDropdownRedesignModule then Result else p2.TextLabel.Text
		end
		Frame.autocompleteDropdownActivated(false)
		Frame.autocompleteDropdownResultsChanged({})
		local Current = if UseRefResult4.current then UseRefResult4.current else UseRefResult3.current
		
		if Current then
			local Text: string = Current.Text
			local Segment = string.sub(Text, 1, UseStateResult1 - 1)
			local Segment1: string = if FFlagExpChatPresetChatAutocompleteEnabledModule and Result1 ~= nil then "" else string.sub(Text, UseStateResult1, #Text)
			local Replaced = ""
			
			if Frame.autocompleteDropdownReducer.autocompleteType == "emojis" then
				Replaced = string.gsub(Segment, ":[^:]*$", p2.EmojiLabel.Text)
			elseif Frame.autocompleteDropdownReducer.autocompleteType == "commands" then
				Replaced = string.gsub(Segment, "(/.*)", if FFlagExpChatAutocompleteDropdownRedesignModule then Result else p2.TextLabel.Text)
			end
			if Segment1 ~= "" then
				Replaced ..= Segment1
			end
			Current.Text = Replaced
			UseStateResult2(Replaced)
			
			if UseRefResult2.current then
				if ExpChatMainInputBarClickAnalytics and UseRefResult1 and not Current:IsFocused() then
					UseRefResult1.current = true
				end
				Current:CaptureFocus()
				
				if UseSignalStateResult then
					UseFocusGuiObjectResult(Current)
				end
				if Segment1 ~= "" and not ExpChatDoNotSetCursorPosition then
					Current.CursorPosition = #Replaced - #Segment1 + 1
				end
			end
			Frame.autocompleteDropdownDeactivated()
			
			if FFlagExpChatPresetChatAutocompleteEnabledModule and Result1 ~= nil then
				sendSelectedPreset(Result1)
				
				return
			end
		else
			NewResult:error("Could not find textBox")
		end
	end, {
		UseSignalStateResult, UseFocusGuiObjectResult, UseStateResult5,
		UseStateResult1, Frame.autocompleteDropdownActivated,
		Frame.autocompleteDropdownDeactivated,
		Frame.autocompleteDropdownReducer and Frame.autocompleteDropdownReducer.autocompleteType,
		Frame.autocompleteDropdownResultsChanged,
		if FFlagExpChatPresetChatAutocompleteEnabledModule then Frame.targetTextChannel or false else nil,
		if FFlagExpChatPresetChatAutocompleteEnabledModule then Frame.chatInputBarSettings.TextSize else nil,
		if FFlagExpChatPresetChatAutocompleteAnalyticsEnabledModule then RecordPresetChosen else nil,
		if FFlagExpChatEmojiDropdownDismissAnalyticsModule then UseRefResult7 else nil,
		if FFlagExpChatAutocompleteDropdownRedesignModule then Frame.autocompleteDropdownReducer and Frame.autocompleteDropdownReducer.results else nil
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), UseRefResult4 (copy), UseRefResult3 (copy), NewResult (upval)
		if UseRefResult2.current then
			local Current = if UseRefResult4.current then UseRefResult4.current else UseRefResult3.current
			
			if Current then
				Current:CaptureFocus()
				
				return
			end
			NewResult:error("Could not focus chat input bar because textBox not found")
		end
	end, { Frame.shouldFocusChatInputBar, UseRefResult4.current })
	
	if FFlagExpChatPresetChatEnabled then
		ReactModule.useEffect(function()
			-- upvalues: UseSignalStateResult2 (copy), UseRefResult4 (copy), UseRefResult3 (copy)
			if not UseSignalStateResult2 then return end
			local Current = if UseRefResult4.current then UseRefResult4.current else UseRefResult3.current
			
			if Current and Current:IsFocused() then
				Current:ReleaseFocus()
			end
		end, { UseSignalStateResult2 })
	end
	ReactModule.useEffect(function()
		-- upvalues: NewResult (upval), UseRefResult2 (copy), ExpChatPresetChatIXPExposure (upval), IXPServiceWrapper (upval), ExpChatPresetChatIXPLayerName (upval)
		NewResult:trace("Mounted")
		UseRefResult2.current = true
		
		if ExpChatPresetChatIXPExposure then
			IXPServiceWrapper:LogUserLayerExposure(ExpChatPresetChatIXPLayerName)
		end
		return function()
			-- upvalues: NewResult (upval), UseRefResult2 (upval)
			NewResult:trace("Unmounting")
			UseRefResult2.current = false
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UseRefResult4 (copy), UseRefResult3 (copy), UseStateResult2_1 (ref)
		local Connection = nil
		
		if Frame.autocompleteEnabled then
			local Current = if UseRefResult4.current then UseRefResult4.current else UseRefResult3.current
			
			if Current then
				Connection = Current:GetPropertyChangedSignal("CursorPosition"):Connect(function()
					-- upvalues: Current (copy), UseStateResult2_1 (upval)
					local CursorPosition = Current.CursorPosition
					
					if CursorPosition and CursorPosition ~= -1 then
						UseStateResult2_1(CursorPosition)
					end
				end)
			end
		end
		return function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { UseRefResult4.current })
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UseRefResult9 (copy)
		if Frame.autocompleteEnabled then
			UseRefResult9.current = Frame.userInputService.InputBegan:connect(function(Input, _)
				-- upvalues: Frame (upval)
				if Frame.autocompleteDropdownReducer.activated and (Enum.KeyCode.Up or Enum.KeyCode.Down) then
					if Input and Input.KeyCode == Enum.KeyCode.Up and Frame.autocompleteDropdownReducer.selectedIndex > 1 then
						Frame.autocompleteDropdownSelectionChanged(Frame.autocompleteDropdownReducer.selectedIndex - 1)
					end
					if Input and Input.KeyCode == Enum.KeyCode.Down and Frame.autocompleteDropdownReducer.selectedIndex < #Frame.autocompleteDropdownReducer.results then
						Frame.autocompleteDropdownSelectionChanged(Frame.autocompleteDropdownReducer.selectedIndex + 1)
					end
				end
			end)
			
			return function()
				-- upvalues: UseRefResult9 (upval)
				local Current = UseRefResult9.current
				
				if Current and Current.Connected then
					Current:Disconnect()
				end
				UseRefResult9.current = nil
			end
		else
			return function() end
		end
	end, {
		Frame.userInputService,
		Frame.autocompleteDropdownReducer
	})
	ReactModule.useEffect(function()
		-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Frame (copy), FFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule (upval), UseRefResult8 (copy), UseRefResult4 (copy), UseRefResult3 (copy), UseRefResult10 (copy), FFlagExpChatFixBackspaceNilTargetChannel (upval), NewResult (upval), UseStateResult (copy)
		local NoDeveloperChannelTabsEnabled: boolean = GetFFlagTextChatEnableUniverseChatTabsFunction() and not Frame.developerChannelTabsEnabled
		local NoIsChannelBarVisible: boolean = if FFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule then not Frame.isChannelBarVisible or NoDeveloperChannelTabsEnabled else not Frame.isChannelBarVisible
		UseRefResult8.current = Frame.userInputService.InputEnded:connect(function(Input, _)
			-- upvalues: UseRefResult4 (upval), UseRefResult3 (upval), Frame (upval), UseRefResult10 (upval), NoIsChannelBarVisible (copy), FFlagExpChatFixBackspaceNilTargetChannel (upval), NewResult (upval), UseStateResult (upval)
			if if UseRefResult4.current then UseRefResult4.current and (UseRefResult4.current:IsFocused() and (Input and Input.KeyCode == Enum.KeyCode.Backspace)) else UseRefResult3.current and (UseRefResult3.current:IsFocused() and (Input and Input.KeyCode == Enum.KeyCode.Backspace)) then
				local v2 = (Frame.targetTextChannelDisplayName or "") ~= ""
				
				if UseRefResult10.current and NoIsChannelBarVisible and (not FFlagExpChatFixBackspaceNilTargetChannel or v2) then
					Frame.resetTargetChannel(if FFlagExpChatFixBackspaceNilTargetChannel then Frame.isGlobalChatTabActive else nil)
					NewResult:debug("ChatInputBar ChatInputBarResetTargetChannel()")
					UseRefResult10.current = false
					
					return
				elseif UseStateResult == "" and (if FFlagExpChatFixBackspaceNilTargetChannel then v2 else Frame.targetTextChannelDisplayName ~= "") then
					UseRefResult10.current = true
				end
			end
		end)
		
		return function()
			-- upvalues: UseRefResult8 (upval)
			local Current = UseRefResult8.current
			
			if Current and Current.Connected then
				Current:Disconnect()
			end
			UseRefResult8.current = nil
		end
	end, {
		Frame.userInputService, UseRefResult4.current, Frame.isChannelBarVisible,
		Frame.targetTextChannelDisplayName, Frame.resetTargetChannel,
		if FFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule then Frame.developerChannelTabsEnabled else nil,
		if FFlagExpChatFixBackspaceNilTargetChannel then Frame.isGlobalChatTabActive else nil
	})
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), ConfigModule (upval), UseRefResult4 (copy), UseRefResult3 (copy), UseRefResult11 (copy)
		Frame.contextActionService:BindCoreAction("FocusChat", function(_, UserInputState, Input)
			-- upvalues: Frame (upval), ConfigModule (upval), UseRefResult4 (upval), UseRefResult3 (upval), UseRefResult11 (upval)
			if Frame.isChatHotkeyEnabled and Input and (Input.KeyCode == ConfigModule.ChatInputBarDefaultFocusKeyCode or Input.KeyCode == Frame.devDefinedFocusKeyCode) then
				local Current = if UseRefResult4.current then UseRefResult4.current else UseRefResult3.current
				
				if Current and UserInputState == Enum.UserInputState.Begin and Current and not Current:IsFocused() then
					task.delay(0, function()
						-- upvalues: Current (copy)
						Current:CaptureFocus()
					end)
					Frame.focusChatHotKeyActivated()
					UseRefResult11.current = true
					
					return Enum.ContextActionResult.Sink
				end
			end
			return Enum.ContextActionResult.Pass
		end, false, Enum.UserInputType.Keyboard)
		
		return function()
			-- upvalues: Frame (upval)
			Frame.contextActionService:UnbindCoreAction("FocusChat")
		end
	end, {
		Frame.isChatHotkeyEnabled,
		Frame.devDefinedFocusKeyCode,
		UseRefResult11.current,
		UseRefResult4.current
	})
	
	local function _(IsFocusedWrite)
		-- upvalues: TextChatService (upval)
		local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		
		if ChatInputBarConfiguration then
			ChatInputBarConfiguration.IsFocusedWrite = IsFocusedWrite
		end
	end
	
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_3 (copy), Frame (copy), TextChatService (upval), ExpChatMainInputBarClickAnalytics (upval), UseRefResult1 (copy), ExpChatSharedModule (upval), ConstantsModule (upval)
		UseStateResult2_3(true)
		Frame.onFocus()
		local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		
		if ChatInputBarConfiguration then
			ChatInputBarConfiguration.IsFocusedWrite = true
		end
		if ExpChatMainInputBarClickAnalytics and UseRefResult1 then
			if UseRefResult1.current then
				UseRefResult1.current = false
				
				return
			end
			ExpChatSharedModule.Analytics:TelemetryLogEvent(ExpChatSharedModule.Analytics.ExpChatPresetActionConfig, {
				event_type = ConstantsModule.Analytics.EventTypes.Click,
				component = ConstantsModule.Analytics.Components.MainInputBar
			}, ConstantsModule.Analytics.ExtendedStandardizedFields)
		end
	end, { Frame.onFocus })
	local UseResult4 = ReactModule.useCallback(function(_, p2, Input)
		-- upvalues: NewResult (upval), UseRefResult6 (copy), Frame (copy), FFlagExpChatPresetChatAutocompleteEnabledModule (upval), UseResult2 (copy), UseResult (copy), UseRefResult2 (copy), UseRefResult4 (copy), UseRefResult3 (copy), UseStateResult1 (ref), ExpChatMainInputBarClickAnalytics (upval), UseRefResult1 (copy), ExpChatDoNotSetCursorPosition (upval), UseStateResult2_3 (copy), TextChatService (upval), UseRefResult11 (copy), Players (upval)
		NewResult:debug("Focus lost with enter: {}", (tostring(p2)))
		local Current = UseRefResult6.current
		
		if p2 or Input and (Input.KeyCode == Enum.KeyCode.Return or Input.KeyCode == Enum.KeyCode.KeypadEnter) then
			if Frame.autocompleteEnabled and Current and Frame.autocompleteDropdownReducer.activated and #Frame.autocompleteDropdownReducer.results > 0 and (not FFlagExpChatPresetChatAutocompleteEnabledModule or Frame.autocompleteDropdownReducer.selectedIndex > 0) then
				for _, Frame1 in ipairs(Current.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame:GetChildren()) do
					if Frame1.ClassName == "Frame" and Frame1.LayoutOrder == Frame.autocompleteDropdownReducer.selectedIndex then
						UseResult2(Frame1.TextLabelButton)
						
						return
					end
				end
			else
				UseResult()
				
				if FFlagExpChatPresetChatAutocompleteEnabledModule and Frame.autocompleteEnabled and Frame.autocompleteDropdownReducer.autocompleteType == "presets" then
					Frame.autocompleteDropdownDeactivated()
				end
			end
		end
		if UseRefResult2.current then
			if Frame.autocompleteEnabled and Current and Frame.autocompleteDropdownReducer.activated then
				if Input then
					if Input.KeyCode == Enum.KeyCode.Escape then
						Frame.autocompleteDropdownActivated(false)
						local Current1 = if UseRefResult4.current then UseRefResult4.current else UseRefResult3.current
						
						if Current1 then
							local CursorPosition = UseStateResult1
							
							if ExpChatMainInputBarClickAnalytics and UseRefResult1 and not Current1:IsFocused() then
								UseRefResult1.current = true
							end
							Current1:CaptureFocus()
							
							if not ExpChatDoNotSetCursorPosition then
								Current1.CursorPosition = CursorPosition
							end
							return
						else
							NewResult:error("Could not focus chat input bar because textBox not found")
						end
					else
						local X = Input.Position.X
						local Y = Input.Position.Y
						local X1 = Current.AbsolutePosition.X
						local NewX = X1 + Current.AbsoluteSize.X
						local Y1 = Current.AbsolutePosition.Y
						local NewY = Y1 + Current.AbsoluteSize.Y
						
						if X < X1 or NewX < X or Y < Y1 or NewY < Y then
							Frame.autocompleteDropdownActivated(false)
						end
					end
				end
			else
				UseStateResult2_3(false)
			end
		end
		Frame.onUnfocus()
		local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		
		if ChatInputBarConfiguration then
			ChatInputBarConfiguration.IsFocusedWrite = false
		end
		if UseRefResult11.current then
			local LocalPlayer = Players.LocalPlayer
			
			if LocalPlayer then
				local TextBox = Instance.new("TextBox")
				TextBox.Visible = false
				TextBox.Parent = LocalPlayer:FindFirstChildOfClass("PlayerGui")
				TextBox:CaptureFocus()
				TextBox:ReleaseFocus()
				TextBox:Destroy()
			end
			UseRefResult11.current = false
		end
	end)
	ReactModule.useEffect(function()
		-- upvalues: FFlagEnableConsoleExpControls (upval), UseRefResult4 (copy), UseRefResult3 (copy), FFlagChromeChatGamepadSupportFix (upval), GuiService (upval), UseResult3 (copy), onChatInputBarFocusLost (upval), UseResult4 (copy), ActionBindableEvent (upval)
		local Connection = nil
		local DelayedThread = nil
		local EventConnection = ActionBindableEvent.Event:Connect(function(p3)
			-- upvalues: FFlagEnableConsoleExpControls (upval), UseRefResult4 (upval), UseRefResult3 (upval), FFlagChromeChatGamepadSupportFix (upval), GuiService (upval), UseResult3 (upval), DelayedThread (ref), Connection (ref), onChatInputBarFocusLost (upval), UseResult4 (upval)
			local Current = if FFlagEnableConsoleExpControls then if UseRefResult4.current then UseRefResult4.current else UseRefResult3.current else nil
			
			if p3.type == "ChatTopBarFocusActivated" then
				if not FFlagEnableConsoleExpControls then
					Current = if UseRefResult4.current then UseRefResult4.current else UseRefResult3.current
				end
				if Current then
					task.delay(0, function()
						-- upvalues: Current (ref)
						Current:CaptureFocus()
					end)
				end
			elseif not FFlagChromeChatGamepadSupportFix and FFlagEnableConsoleExpControls and p3.type == "ChatTopBarFocusSelect" and Current then
				GuiService:SetMenuIsOpen(true, "ExperienceChat")
				UseResult3()
				GuiService.SelectedCoreObject = Current
				DelayedThread = task.delay(0, function()
					-- upvalues: DelayedThread (upval), Connection (upval), onChatInputBarFocusLost (upval), p3 (copy), UseResult4 (upval)
					DelayedThread = nil
					
					if Connection then
						Connection:Disconnect()
					end
					Connection = onChatInputBarFocusLost(p3.onSelectionLost, p3.keybinds, UseResult4)
				end)
			end
		end)
		
		return function()
			-- upvalues: EventConnection (copy), DelayedThread (ref), Connection (ref)
			EventConnection:disconnect()
			
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
		end
	end, { UseRefResult3.current, UseRefResult4.current })
	useEffectChatInputBarFocus(UseRefResult3, UseRefResult4, UseRefResult5, UseResult3, UseResult4)
	
	local function handlePresetAutocomplete(Text: string, CursorPosition: number)
		-- upvalues: Frame (copy), FFlagExpChatUniverseChatPresetEnabledModule (upval), PresetSearchModule (upval), GetPresetChatStoreModule (upval), ExpChatPresetAutocompleteSearchVariants (upval), ExpChatPresetChatAutocompleteExperimentation (upval), FFlagExpChatAutocompleteDropdownRedesignModule (upval)
		if CursorPosition < 1 then return end
		local Segment = string.sub(Text, 1, CursorPosition - 1)
		local MatchingPresets = if Frame.targetTextChannel ~= nil or FFlagExpChatUniverseChatPresetEnabledModule then PresetSearchModule.findMatchingPresets(GetPresetChatStoreModule(false), Segment, if ExpChatPresetAutocompleteSearchVariants then ExpChatPresetChatAutocompleteExperimentation.getSearchVariant() else nil) else {}
		
		if #MatchingPresets ~= 0 then
			Frame.autocompleteDropdownTypeChanged("presets")
			Frame.autocompleteDropdownActivated(true)
			Frame.autocompleteDropdownResultsChanged(MatchingPresets, if FFlagExpChatAutocompleteDropdownRedesignModule then Segment else nil)
			Frame.autocompleteDropdownSelectionChanged(0)
			
			return
		elseif Frame.autocompleteDropdownReducer.autocompleteType == "presets" then
			Frame.autocompleteDropdownDeactivated()
		end
	end
	
	local function handleAutocomplete(TextBox, Text: string, Segment)
		-- upvalues: Frame (copy), NewResult3 (upval), NewResult2 (upval), SortCommandResultsCallbackModule (upval), FFlagExpChatAutocompleteDropdownRedesignModule (upval), NewResult1 (upval), SortEmojiResultsCallbackModule (upval), UseStateResult3 (ref), List (upval), UseStateResult2 (copy), ExpChatDoNotSetCursorPosition (upval), UseRefResult6 (copy), UseResult2 (copy), UseStateResult2_2 (ref), FFlagExpChatPresetChatAutocompleteEnabledModule (upval), handlePresetAutocomplete (copy)
		if Segment == "/" and TextBox.CursorPosition == 2 or Frame.autocompleteDropdownReducer.autocompleteType == "commands" and Segment ~= ":" then
			Frame.autocompleteDropdownTypeChanged("commands")
			Frame.autocompleteDropdownActivated(true)
			
			if Segment == "" or Segment == " " then
				Frame.autocompleteDropdownDeactivated()
			else
				local Lowered = string.sub(Text, 1, TextBox.CursorPosition - 1):lower()
				local Results = (if Frame.isGlobalChatTabActive and NewResult3 then NewResult3 else NewResult2):getResults(Lowered, SortCommandResultsCallbackModule)
				Frame.autocompleteDropdownResultsChanged(Results, if FFlagExpChatAutocompleteDropdownRedesignModule then Lowered else nil)
				
				if Lowered == Results[1] then
					Frame.autocompleteDropdownActivated(false)
					Frame.autocompleteDropdownResultsChanged({})
					
					return
				end
			end
			return
		elseif (Frame.autocompleteDropdownReducer.activated or #Frame.autocompleteDropdownReducer.results > 0) and Frame.autocompleteDropdownReducer.autocompleteType == "emojis" then
			Frame.autocompleteDropdownActivated(true)
			local FoundAt1: number? = string.find(string.sub(Text, 1, TextBox.CursorPosition - 1), ":[^:]*$")
			
			if Segment ~= "" and Segment ~= ":" and Segment ~= " " and FoundAt1 then
				local Lowered: string = string.sub(Text, FoundAt1 + 1, TextBox.CursorPosition - 1):lower()
				Frame.autocompleteDropdownResultsChanged(if Lowered and string.len(Lowered) > 1 then NewResult1:getResults(Lowered, SortEmojiResultsCallbackModule) else {}, if FFlagExpChatAutocompleteDropdownRedesignModule then Lowered else nil)
				
				return
			end
			if Segment == ":" then
				if FoundAt1 == UseStateResult3 then
					Frame.autocompleteDropdownResultsChanged({})
					
					return
				end
				local Lowered = string.sub(Text, UseStateResult3 + 1, TextBox.CursorPosition - 2):lower()
				
				if List.includes(Frame.autocompleteDropdownReducer.results, Lowered) then
					local Text1 = string.sub(Text, 1, TextBox.CursorPosition - 2) .. string.sub(Text, TextBox.CursorPosition, #Text)
					TextBox.Text = Text1
					UseStateResult2(Text1)
					
					if not ExpChatDoNotSetCursorPosition then
						TextBox.CursorPosition -= 1
					end
					local Current = UseRefResult6.current
					
					if Current then
						local TextLabelButton = nil
						local TextLabelButton1 = nil
						for _, Frame1 in ipairs(Current.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame:GetChildren()) do
							if FFlagExpChatAutocompleteDropdownRedesignModule then
								if Frame1.ClassName == "Frame" and Frame.autocompleteDropdownReducer.results[Frame1.LayoutOrder] == Lowered then
									TextLabelButton = Frame1:FindFirstChild("TextLabelButton")
									
									if TextLabelButton then
										UseResult2(TextLabelButton)
										break
									end
								end
							elseif Frame1.ClassName == "Frame" then
								TextLabelButton1 = Frame1:FindFirstChild("TextLabelButton")
								
								if TextLabelButton1 then
									local TextLabel = TextLabelButton1:FindFirstChild("TextLabel")
									
									if TextLabel and TextLabel.Text and TextLabel.Text == Lowered then
										UseResult2(TextLabelButton1)
										break
									end
								end
							end
						end
						return
					end
				else
					Frame.autocompleteDropdownActivated(false)
					Frame.autocompleteDropdownResultsChanged({})
				end
				return
			elseif Segment == " " then
				Frame.autocompleteDropdownActivated(false)
				Frame.autocompleteDropdownResultsChanged({})
				
				return
			else
				Frame.autocompleteDropdownDeactivated()
				UseStateResult2_2(0)
				
				return
			end
		else
			local FoundAt: number? = string.find(Text, ":[^:]*$")
			
			if Segment == ":" then
				Frame.autocompleteDropdownTypeChanged("emojis")
				Frame.autocompleteDropdownActivated(true)
				Frame.autocompleteDropdownResultsChanged({})
				UseStateResult2_2(FoundAt)
				
				return
			elseif FFlagExpChatPresetChatAutocompleteEnabledModule then
				handlePresetAutocomplete(Text, TextBox.CursorPosition)
			end
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: TextChatService (upval), Name (upval), RBXTeamCommand (upval), Name1 (upval), RBXWhisperCommand (upval)
		if TextChatService.CreateDefaultCommands then
			Name = TextChatService:FindFirstChild(RBXTeamCommand.name, true)
			Name1 = TextChatService:FindFirstChild(RBXWhisperCommand.name, true)
		end
	end, {})
	local UseResult5 = ReactModule.useCallback(function(TextBox)
		-- upvalues: Frame (copy), UseStateResult2 (copy), NewResult (upval), UseStateResult (copy), GetEnableChatInputBarConfigurationAutocompleteEnabledModule (upval), handleAutocomplete (copy), UseRefResult10 (copy), ChatOptimizeCommandProcessing (upval), UseRefResult (copy), Name (upval), AutoCastCommandFunction (upval), RBXTeamCommand (upval), Name1 (upval), RBXWhisperCommand (upval), PromiseModule (upval)
		local Text: string = TextBox.Text
		
		if Frame.autocompleteEnabled then
			local IsCursorPositionBelow = TextBox.CursorPosition < #Text + 1
			
			if string.find(Text, "\r") then
				local Replaced = string.gsub(Text, "\r", "")
				TextBox.Text = Replaced
				UseStateResult2(Replaced)
				
				if IsCursorPositionBelow then
					TextBox.CursorPosition -= 1
				end
				return
			end
		end
		local Segment = string.sub(Text, TextBox.CursorPosition - 1, TextBox.CursorPosition - 1)
		NewResult:trace("Input: {}", Text)
		local Length: number = if utf8.len(Text) then utf8.len(utf8.nfcnormalize(Text)) else string.len(Text)
		
		if Length and Frame.messageCharacterLimit < Length then
			NewResult:debug("Message is over the character limit of {}", (tostring(Frame.messageCharacterLimit)))
			TextBox.Text = UseStateResult
			
			return
		end
		UseStateResult2(Text)
		
		if GetEnableChatInputBarConfigurationAutocompleteEnabledModule() and Frame.autocompleteEnabled then
			handleAutocomplete(TextBox, Text, Segment)
		end
		UseRefResult10.current = #Text == 0 and UseRefResult10.current
		
		if ChatOptimizeCommandProcessing then
			if string.sub(Text, 1, 1) == "/" and Frame.localPlayer and Text ~= UseRefResult.current then
				UseRefResult.current = Text
				local UserId = Frame.localPlayer.UserId
				local List = {}
				
				if Name and Name.Enabled then
					table.insert(List, AutoCastCommandFunction(RBXTeamCommand, UserId, Text))
				end
				if Name1 and Name1.Enabled then
					table.insert(List, AutoCastCommandFunction(RBXWhisperCommand, UserId, Text))
				end
				if #List == 0 then
					List = { PromiseModule.reject() }
				end
				PromiseModule.any(List):andThen(function()
					-- upvalues: TextBox (copy), UseStateResult2 (upval), UseRefResult10 (upval)
					TextBox.Text = ""
					UseStateResult2("")
					UseRefResult10.current = true
				end):catch(function(Err)
					-- upvalues: NewResult (upval)
					NewResult:trace("Could not send autoCastCommand. Error: {}", Err)
				end)
				
				return
			elseif string.sub(Text, 1, 1) ~= "/" then
				UseRefResult.current = ""
				
				return
			end
		elseif Frame.localPlayer then
			local UserId = Frame.localPlayer.UserId
			local List = {}
			
			if Name and Name.Enabled then
				table.insert(List, AutoCastCommandFunction(RBXTeamCommand, UserId, Text))
			end
			if Name1 and Name1.Enabled then
				table.insert(List, AutoCastCommandFunction(RBXWhisperCommand, UserId, Text))
			end
			if #List == 0 then
				List = { PromiseModule.reject() }
			end
			PromiseModule.any(List):andThen(function()
				-- upvalues: TextBox (copy), UseStateResult2 (upval), UseRefResult10 (upval)
				TextBox.Text = ""
				UseStateResult2("")
				UseRefResult10.current = true
			end):catch(function(Err)
				-- upvalues: NewResult (upval)
				NewResult:trace("Could not send autoCastCommand. Error: {}", Err)
			end)
		end
	end)
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult4 (copy), UseRefResult3 (copy)
		local Current = if UseRefResult4.current then UseRefResult4.current else UseRefResult3.current
		
		if Current then
			Current:ReleaseFocus(true)
		end
	end, { UseRefResult3.current, UseRefResult4.current })
	local UseResult7 = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(Frame.Visible and Frame.AbsoluteSize.X or 0)
	end)
	local UseCursorResult = UseCursorFunction()
	local UseResult8 = ReactModule.useCallback(function(Frame1)
		-- upvalues: Frame (copy)
		Frame.autocompleteDropdownSelectionChanged(Frame1.LayoutOrder)
	end)
	local IsUseStateResultMatch = UseStateResult == ""
	local NoUseStateResult4: boolean = IsUseStateResultMatch and not UseStateResult4
	local ChatInputBarSettings = Frame.chatInputBarSettings
	local ChatWindowSettings = Frame.chatWindowSettings
	local CanLocalUserChat = if UseSignalStateResult1 == nil then Frame.canLocalUserChat else UseSignalStateResult1
	ReactModule.useEffect(function()
		-- upvalues: ExpChatDictationIXPExposure (upval), CanLocalUserChat (copy), IXPServiceWrapper (upval), ExpChatDictationIXPLayerName (upval)
		if ExpChatDictationIXPExposure and CanLocalUserChat then
			IXPServiceWrapper:LogUserLayerExposure(ExpChatDictationIXPLayerName)
		end
	end, { CanLocalUserChat })
	ReactModule.useEffect(function()
		-- upvalues: ExpChatPresetAutocompleteIxpEnabled (upval), UseStateResult4 (copy), GetEnableChatInputBarConfigurationAutocompleteEnabledModule (upval), Frame (copy), GetPresetChatStoreModule (upval), ConstantsModule (upval), IXPServiceWrapper (upval), ExpChatPresetAutocompleteIxpLayer (upval)
		if not ExpChatPresetAutocompleteIxpEnabled or not UseStateResult4 then return end
		if not GetEnableChatInputBarConfigurationAutocompleteEnabledModule() or not Frame.autocompleteEnabled then return end
		local PresetChatStoreModule = GetPresetChatStoreModule(false)
		
		if PresetChatStoreModule.getIsEnabled(false) and PresetChatStoreModule.getAccessLevel(false) == ConstantsModule.AccessLevel.Enabled then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(ExpChatPresetAutocompleteIxpLayer)
			
			return
		end
	end, {
		UseStateResult4,
		Frame.autocompleteEnabled,
		UseSignalStateResult3
	})
	ReactModule.useEffect(function()
		-- upvalues: FFlagExpChatPresetChatSendEnabled (upval), UseStateResult4 (copy), GetEnableChatInputBarConfigurationAutocompleteEnabledModule (upval), Frame (copy), GetPresetChatStoreModule (upval), ConstantsModule (upval), ExpChatPresetChatAutocompleteExperimentation (upval)
		if not FFlagExpChatPresetChatSendEnabled or not UseStateResult4 then return end
		if not GetEnableChatInputBarConfigurationAutocompleteEnabledModule() or not Frame.autocompleteEnabled then return end
		local PresetChatStoreModule = GetPresetChatStoreModule(false)
		
		if PresetChatStoreModule.getIsEnabled(false) and PresetChatStoreModule.getAccessLevel(false) == ConstantsModule.AccessLevel.Enabled then
			ExpChatPresetChatAutocompleteExperimentation.logExposure()
			
			return
		end
	end, {
		UseStateResult4,
		Frame.autocompleteEnabled,
		UseSignalStateResult3
	})
	local BackgroundTransparency = UseInterpolatedClientSettingsModule(ChatInputBarSettings).BackgroundTransparency
	local BackgroundTransparency1 = UseInterpolatedClientSettingsModule(ChatWindowSettings).BackgroundTransparency
	local IsSpatialUIEnabled = Frame.isSpatialUIEnabled
	local CreateElementFunction = ReactModule.createElement
	local v2 = "Frame"
	local config5 = {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = UseInterpolatedClientSettingsModule(ChatWindowSettings).BackgroundColor3,
		BackgroundTransparency = if FFlagExpChatNewInputBarModule then 1 else Frame.transparencyValue:map(function(p3): number
			-- upvalues: BackgroundTransparency1 (copy)
			return BackgroundTransparency1 + p3 * (1 - BackgroundTransparency1)
		end),
		BorderSizePixel = 0,
		LayoutOrder = Frame.LayoutOrder,
		Size = Frame.size,
		Visible = Frame.visible,
		ZIndex = 2,
		[ReactModule.Event.MouseEnter] = Frame.onHovered,
		[ReactModule.Event.MouseLeave] = Frame.onUnhovered,
		[ReactModule.Change.AbsoluteSize] = ReactModule.useCallback(function(p3)
			-- upvalues: TextChatService (upval), Frame (copy)
			local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			
			if ChatInputBarConfiguration and Frame.onAbsoluteSizeChanged then
				Frame.onAbsoluteSizeChanged(p3, ChatInputBarConfiguration)
			end
		end),
		[ReactModule.Change.AbsolutePosition] = ReactModule.useCallback(function(p3)
			-- upvalues: TextChatService (upval), Frame (copy)
			local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			
			if ChatInputBarConfiguration and Frame.onAbsolutePositionChanged then
				Frame.onAbsolutePositionChanged(p3, ChatInputBarConfiguration)
			end
		end)
	}
	local config6 = {
		AutocompleteDropdown = GetEnableChatInputBarConfigurationAutocompleteEnabledModule() and Frame.autocompleteEnabled and ReactModule.createElement(AutocompleteDropdownModule, {
			chatInputBarSettings = ChatInputBarSettings,
			chatWindowSettings = ChatWindowSettings,
			setTransparency = setTransparency,
			transparencyValue = Frame.transparencyValue,
			activated = Frame.autocompleteDropdownReducer.activated and UseStateResult4,
			isChatInputBarVisible = if FFlagExpChatEmojiDropdownShowAnalyticsModule then Frame.visible else nil,
			chosenEmojiForAnalyticsRef = if FFlagExpChatEmojiDropdownDismissAnalyticsModule then UseRefResult7 else nil,
			results = Frame.autocompleteDropdownReducer.results,
			query = if FFlagExpChatAutocompleteDropdownRedesignModule then Frame.autocompleteDropdownReducer.query else nil,
			selectedIndex = Frame.autocompleteDropdownReducer.selectedIndex,
			autocompleteType = Frame.autocompleteDropdownReducer.autocompleteType,
			onAutocompleteDropdownHover = UseResult8,
			onAutocompleteSelected = UseResult2,
			autocompleteDropdownRef = UseRefResult6,
			textBoxRef = if ChatInputBarSettings.TextBox then UseRefResult4 else UseRefResult3
		}) or nil,
		UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
			MaxSize = Vector2.new(ConfigModule.ChatWindowMaxWidth, 1e999)
		}),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = if FFlagExpChatNewInputBarModule then nil else UDim.new(0, 8),
			PaddingRight = if FFlagExpChatNewInputBarModule then nil else UDim.new(0, 8),
			PaddingTop = Frame.addTopPadding and UDim.new(0, 8) or UDim.new(0, 0),
			PaddingBottom = UDim.new(0, 1)
		}),
		ChatInputBarV2 = if FFlagExpChatNewInputBarModule then if FFlagExpChatNewInputBarDictationModule and FFlagExpChatDictation1 and CanLocalUserChat then ReactModule.createElement(ChatInputBarV2DictationModule, {
			transparencyValue = Frame.transparencyValue,
			sendButtonContainerWidth = Frame.sendButtonContainerWidth,
			resetTargetChannel = Frame.resetTargetChannel,
			targetTextChannel = Frame.targetTextChannel,
			targetTextChannelDisplayName = Frame.targetTextChannelDisplayName,
			isChannelBarVisible = Frame.isChannelBarVisible,
			developerChannelTabsEnabled = Frame.developerChannelTabsEnabled,
			canLocalUserChat = Frame.canLocalUserChat,
			disabledChatPlaceholderText = Frame.disabledChatPlaceholderText,
			placeholderText = Frame.placeholderText,
			setTransparency = setTransparency,
			chatInputBarSettings = ChatInputBarSettings,
			chatInputBarBackgroundTransparency = BackgroundTransparency,
			isSpatialUIEnabled = IsSpatialUIEnabled,
			canLocalUserChatDerived = UseSignalStateResult1,
			targetChannelWidth = UseBindingResult,
			showPlaceholderText = NoUseStateResult4,
			hasEmptyInputText = IsUseStateResultMatch,
			shouldTruncatePlaceholder = if FFlagExpChatPresetChatEnabled then UseSignalStateResult3 else nil,
			cursor = UseCursorResult,
			placeholderRef = UseRefResult5,
			textBoxRef = UseRefResult3,
			customTextBoxRef = UseRefResult4,
			onAbsoluteSizeChanged = UseResult7,
			onFocused = UseResult3,
			onFocusLost = UseResult4,
			onTextChanged = UseResult5,
			onReturnPressedFromOnScreenKeyboard = UseResult6,
			onSendActivated = UseResult,
			onSendRecordingTap = UseResult1,
			onTranscriptionStaged = if UseSendTelemetryModuleResult then UseSendTelemetryModuleResult.stageTranscription else nil,
			inputText = UseStateResult,
			setInputText = UseStateResult2,
			isGlobalChatTabActive = Frame.isGlobalChatTabActive,
			onDictationActivityChanged = Frame.onDictationActivityChanged,
			onDictationStateChanged = Frame.onDictationStateChanged
		}) else ReactModule.createElement(ChatInputBarV2Module, {
			transparencyValue = Frame.transparencyValue,
			sendButtonContainerWidth = Frame.sendButtonContainerWidth,
			resetTargetChannel = Frame.resetTargetChannel,
			targetTextChannel = Frame.targetTextChannel,
			targetTextChannelDisplayName = Frame.targetTextChannelDisplayName,
			isChannelBarVisible = Frame.isChannelBarVisible,
			developerChannelTabsEnabled = Frame.developerChannelTabsEnabled,
			canLocalUserChat = Frame.canLocalUserChat,
			disabledChatPlaceholderText = Frame.disabledChatPlaceholderText,
			placeholderText = Frame.placeholderText,
			setTransparency = setTransparency,
			chatInputBarSettings = ChatInputBarSettings,
			chatInputBarBackgroundTransparency = BackgroundTransparency,
			isSpatialUIEnabled = IsSpatialUIEnabled,
			canLocalUserChatDerived = UseSignalStateResult1,
			targetChannelWidth = UseBindingResult,
			showPlaceholderText = NoUseStateResult4,
			hasEmptyInputText = IsUseStateResultMatch,
			shouldTruncatePlaceholder = if FFlagExpChatPresetChatEnabled then UseSignalStateResult3 else nil,
			cursor = UseCursorResult,
			placeholderRef = UseRefResult5,
			textBoxRef = UseRefResult3,
			customTextBoxRef = UseRefResult4,
			onAbsoluteSizeChanged = UseResult7,
			onFocused = UseResult3,
			onFocusLost = UseResult4,
			onTextChanged = UseResult5,
			onReturnPressedFromOnScreenKeyboard = UseResult6,
			onSendActivated = UseResult,
			isGlobalChatTabActive = if FFlagExpChatFixBackspaceNilTargetChannel then Frame.isGlobalChatTabActive else nil
		}) else nil
	}
	local Element = nil
	
	if FFlagExpChatNewInputBarModule then
		Element = nil
	elseif FFlagExpChatDictation1 and CanLocalUserChat then
		Element = ReactModule.createElement(DictationInputBarModule, {
			chatInputBarSettings = ChatInputBarSettings,
			transparencyValue = Frame.transparencyValue,
			chatInputBarBackgroundTransparency = BackgroundTransparency,
			inputText = UseStateResult,
			setInputText = UseStateResult2,
			canLocalUserChat = CanLocalUserChat,
			disabledChatPlaceholderText = Frame.disabledChatPlaceholderText,
			targetChannelWidth = UseBindingResult,
			showPlaceholderText = NoUseStateResult4,
			placeholderText = Frame.placeholderText,
			cursor = UseCursorResult,
			placeholderRef = UseRefResult5,
			textBoxRef = UseRefResult3,
			customTextBoxRef = UseRefResult4,
			onFocused = UseResult3,
			onFocusLost = UseResult4,
			onTextChanged = UseResult5,
			onReturnPressedFromOnScreenKeyboard = UseResult6,
			onChannelChipAbsoluteSizeChanged = UseResult7,
			onChannelChipActivated = if FFlagExpChatFixBackspaceNilTargetChannel then function()
				-- upvalues: Frame (copy)
				Frame.resetTargetChannel(Frame.isGlobalChatTabActive)
			end else Frame.resetTargetChannel,
			targetTextChannel = Frame.targetTextChannel,
			targetTextChannelDisplayName = Frame.targetTextChannelDisplayName or "",
			isChannelBarVisible = Frame.isChannelBarVisible,
			isGlobalChatTabActive = Frame.isGlobalChatTabActive,
			developerChannelTabsEnabled = Frame.developerChannelTabsEnabled,
			onDictationActivityChanged = Frame.onDictationActivityChanged,
			onDictationStateChanged = Frame.onDictationStateChanged,
			onSendActivated = UseResult,
			onSendRecordingTap = UseResult1,
			onTranscriptionStaged = if UseSendTelemetryModuleResult then UseSendTelemetryModuleResult.stageTranscription else nil,
			isSpatialUIEnabled = IsSpatialUIEnabled,
			isTextBoxSelectable = if FFlagEnableConsoleExpControls then true else nil,
			isPlaceholderSelectable = true,
			placeholderSelectionImageObject = UseCursorResult
		})
	else
		local CreateElementFunction2 = ReactModule.createElement
		local v3 = "Frame"
		local config = {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = ChatInputBarSettings.BackgroundColor3,
			BackgroundTransparency = if FFlagExpChatNewInputBarModule then 1 else Frame.transparencyValue:map(function(p3): number
				-- upvalues: BackgroundTransparency (copy)
				return BackgroundTransparency + p3 * (1 - BackgroundTransparency)
			end),
			Size = UDim2.new(1, 0, 0, 0)
		}
		local ChatInputBarBorderTransparency = ConfigModule.ChatInputBarBorderTransparency
		local config1 = {
			Border = ReactModule.createElement("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = ConfigModule.ChatInputBarBorderColor3,
				Transparency = Frame.transparencyValue:map(function(p3): number
					-- upvalues: ChatInputBarBorderTransparency (copy)
					return ChatInputBarBorderTransparency + p3 * (1 - ChatInputBarBorderTransparency)
				end)
			}),
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 3) })
		}
		local CreateElementFunction3 = ReactModule.createElement
		local v4 = "Frame"
		local config2 = {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}
		local t = {}
		local CreateElementFunction1 = ReactModule.createElement
		local v5 = "Frame"
		local config3 = {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, -Frame.sendButtonContainerWidth, 0, 0)
		}
		local v6 = 0
		local config4 = {
			TargetChannelChip = ReactModule.createElement(ChannelChipModule, {
				transparency = Frame.transparencyValue:map(function(p3): number
					-- upvalues: v6 (copy)
					return v6 + p3 * (1 - v6)
				end),
				onAbsoluteSizeChanged = UseResult7,
				onChannelChipActivated = if FFlagExpChatFixBackspaceNilTargetChannel then function()
					-- upvalues: Frame (copy)
					Frame.resetTargetChannel(Frame.isGlobalChatTabActive)
				end else Frame.resetTargetChannel,
				targetTextChannelDisplayName = Frame.targetTextChannelDisplayName or "",
				isChannelBarVisible = Frame.isChannelBarVisible,
				developerChannelTabsEnabled = Frame.developerChannelTabsEnabled
			})
		}
		local NoUseSignalStateResult1 = not UseSignalStateResult1
		
		if NoUseSignalStateResult1 then
			local v7: number = if NoUseStateResult4 then 0.5 else 0
			NoUseSignalStateResult1 = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Selectable = true,
				TextWrapped = true,
				AnchorPoint = Vector2.new(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Font = ConfigModule.ChatInputBarFont,
				Text = Frame.disabledChatPlaceholderText,
				Position = UDim2.fromScale(1, 0),
				Size = UseBindingResult:map(function(p3: number): UDim2
					return UDim2.new(1, -(p3 + 8), 0, 0)
				end),
				TextColor3 = NoUseStateResult4 and ChatInputBarSettings.PlaceholderColor3 or ChatInputBarSettings.TextColor3,
				TextSize = if IsSpatialUIEnabled then ChatInputBarSettings.SpatialPanelTextSize else ChatInputBarSettings.TextSize,
				TextTransparency = Frame.transparencyValue:map(function(p3): number
					-- upvalues: v7 (copy)
					return v7 + p3 * (1 - v7)
				end),
				SelectionImageObject = UseCursorResult,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				ref = UseRefResult5
			})
		end
		config4.DisabledPlaceholderLabel = NoUseSignalStateResult1
		local TextBoxContainer = UseSignalStateResult1
		
		if TextBoxContainer then
			local CreateElementFunction4 = ReactModule.createElement
			local v8 = "Frame"
			local config7 = {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Position = UDim2.fromScale(1, 0),
				Size = UseBindingResult:map(function(p3: number): UDim2
					return UDim2.new(1, -(p3 + 8), 0, 0)
				end)
			}
			local t1 = {}
			local TextBox = UseSignalStateResult1
			
			if TextBox then
				local v9: number = if NoUseStateResult4 then 0.5 else 0
				local TextStrokeTransparency = ChatInputBarSettings.TextStrokeTransparency
				TextBox = ReactModule.createElement("TextBox", {
					AnchorPoint = Vector2.new(0, 0),
					AutomaticSize = Enum.AutomaticSize.XY,
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					FontFace = ChatInputBarSettings.FontFace,
					PlaceholderText = NoUseStateResult4 and Frame.placeholderText or "",
					Selectable = if FFlagEnableConsoleExpControls then true else nil,
					SelectionImageObject = UseCursorResult,
					Size = UDim2.fromScale(1, 0),
					Text = "",
					PlaceholderColor3 = ChatInputBarSettings.PlaceholderColor3,
					TextColor3 = ChatInputBarSettings.TextColor3,
					TextSize = if IsSpatialUIEnabled then ChatInputBarSettings.SpatialPanelTextSize else ChatInputBarSettings.TextSize,
					TextTransparency = Frame.transparencyValue:map(function(p3): number
						-- upvalues: v9 (copy)
						return v9 + p3 * (1 - v9)
					end),
					TextStrokeTransparency = Frame.transparencyValue:map(function(p3): number
						-- upvalues: TextStrokeTransparency (copy)
						return TextStrokeTransparency + p3 * (1 - TextStrokeTransparency)
					end),
					TextStrokeColor3 = ChatInputBarSettings.TextStrokeColor3,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					ZIndex = 2,
					[ReactModule.Event.Focused] = UseResult3,
					[ReactModule.Event.FocusLost] = UseResult4,
					[ReactModule.Change.Text] = UseResult5,
					[ReactModule.Event.ReturnPressedFromOnScreenKeyboard] = UseResult6,
					ref = if ChatInputBarSettings.TextBox then UseRefResult4 else UseRefResult3
				})
			end
			t1.TextBox = TextBox
			TextBoxContainer = CreateElementFunction4(v8, config7, t1)
		end
		config4.TextBoxContainer = TextBoxContainer
		config4.UIPadding = ReactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 10),
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10)
		})
		t.TextContainer = CreateElementFunction1(v5, config3, config4)
		local v10: number = if IsUseStateResultMatch then 0.5 else 0
		t.SendButton = ReactModule.createElement("TextButton", {
			AnchorPoint = Vector2.new(1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Position = UDim2.fromScale(1, 0),
			Selectable = false,
			Size = UDim2.new(0, Frame.sendButtonContainerWidth, 1, 0),
			Text = "",
			[ReactModule.Event.Activated] = UseResult
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			SendIcon = ReactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				ZIndex = 2,
				ImageColor3 = IsUseStateResultMatch and ChatInputBarSettings.PlaceholderColor3 or ChatInputBarSettings.TextColor3,
				ImageTransparency = Frame.transparencyValue:map(function(p3): number
					-- upvalues: v10 (copy)
					return v10 + p3 * (1 - v10)
				end),
				Image = Images["icons/actions/send"],
				Size = UDim2.new(0, 30, 0, 30)
			})
		})
		config1.Container = CreateElementFunction3(v4, config2, t)
		Element = CreateElementFunction2(v3, config, config1)
	end
	config6.Background = Element
	
	return CreateElementFunction(v2, config5, config6)
end)))