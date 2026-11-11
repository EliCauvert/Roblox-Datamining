local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local FocusUtils = require(Parent.Chrome).FocusUtils
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local IXPServiceWrapperModule = require(ExpChat.IXPServiceWrapper)
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
local GetOtherDisplayNameInWhisperChannelModule = require(ExpChat.getOtherDisplayNameInWhisperChannel)
local ChannelChipModule = require(script.Parent.ChannelChip)
local AutocompleteTextModule = require(ExpChat.Autocomplete.AutocompleteText)
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
local FFlagExpChatUseUnifiedTooltipStore = ExpChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore
local FFlagExpChatNewInputBarModule = require(ExpChat.Flags.FFlagExpChatNewInputBar)
local FFlagExpChatNewInputBarDictationModule = require(ExpChat.Flags.FFlagExpChatNewInputBarDictation)
local FFlagExpChatPresetChatGamepadEnabledModule = require(ExpChat.Flags.FFlagExpChatPresetChatGamepadEnabled)
local ExpChatPresetChatIXPExposure = game:DefineFastFlag("ExpChatPresetChatIXPExposure", false)
local ExpChatPresetChatIXPLayerName = game:DefineFastString("ExpChatPresetChatIXPLayerName", "UniverseChat.PresetChat")
local ExpChatDictationIXPExposure = game:DefineFastFlag("ExpChatDictationIXPExposure", false)
local ExpChatDictationIXPLayerName = game:DefineFastString("ExpChatDictationIXPLayerName", "UniverseChat.Dictation")
local GetEnableChatInputBarConfigurationAutocompleteEnabledModule = require(ExpChat.Flags.getEnableChatInputBarConfigurationAutocompleteEnabled)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagExpChatUseMessagesStore = SharedFlagsModule.FFlagExpChatUseMessagesStore
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagChromeChatGamepadSupportFix = SharedFlagsModule.FFlagChromeChatGamepadSupportFix
local FFlagConsoleChatUseChromeFocusUtils = SharedFlagsModule.FFlagConsoleChatUseChromeFocusUtils
local FFlagExpChatEnableFocusNavigationModule = require(ExpChat.Flags.FFlagExpChatEnableFocusNavigation)
local FFlagExpChatFocusViaLastModeFixModule = require(ExpChat.Flags.FFlagExpChatFocusViaLastModeFix)
local ChatOptimizeCommandProcessing = game:DefineFastFlag("ChatOptimizeCommandProcessing", false)
local ExpChatFocusablePlaceholderText = game:DefineFastFlag("ExpChatFocusablePlaceholderText", false)
local ExpChatDoNotSetCursorPosition = game:DefineFastFlag("ExpChatDoNotSetCursorPosition", false)
local FFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule = require(ExpChat.Flags.FFlagExpChatBackspaceExitsTargetChannelInGlobalTabs)
local FFlagExpChatFixBackspaceNilTargetChannel = ExpChatSharedModule.Flags.FFlagExpChatFixBackspaceNilTargetChannel
local GetFFlagTextChatEnableUniverseChatTabsFunction = ExpChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local FFlagExpChatDictation = SharedFlagsModule.FFlagExpChatDictation
local FFlagExpChatContinuousDictation = SharedFlagsModule.FFlagExpChatContinuousDictation
local FFlagExpChatDictation1 = FFlagExpChatDictation or FFlagExpChatContinuousDictation
local DictationInputBarModule = require(script.Parent.Dictation.DictationInputBar)
local UseSendTelemetryModule = require(script.Parent.Dictation.useSendTelemetry)
local ActionBindableEvent = ExpChatSharedModule.ActionBindableEvent
local v1 = require(ExpChat.Stores.GetFocusNavigationStore)(false)

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
	-- upvalues: FFlagConsoleChatUseChromeFocusUtils (copy), ReactModule (copy), FFlagExpChatEnableFocusNavigationModule (copy), SignalsModule (copy), v1 (copy), ExpChatFocusablePlaceholderText (copy), GuiService (copy), UserInputService (copy), FocusUtils (copy), FFlagChromeChatGamepadSupportFix (copy), FFlagEnableConsoleExpControls (copy), onChatInputBarFocusLost (copy), ActionBindableEvent (copy)
	if FFlagConsoleChatUseChromeFocusUtils then
		ReactModule.useEffect(function()
			-- upvalues: FFlagExpChatEnableFocusNavigationModule (upval), SignalsModule (upval), v1 (upval), UseRefResult1 (copy), UseRefResult (copy), ExpChatFocusablePlaceholderText (upval), UseRefResult2 (copy), GuiService (upval), Callback (copy), UserInputService (upval), FocusUtils (upval), Callback1 (copy)
			local config = {
				[Enum.KeyCode.DPadUp] = not FFlagExpChatEnableFocusNavigationModule or nil
			}
			local InputBeganConnection = nil
			local Effect = SignalsModule.createEffect(function(p1)
				-- upvalues: v1 (upval), UseRefResult1 (upval), UseRefResult (upval), ExpChatFocusablePlaceholderText (upval), UseRefResult2 (upval), GuiService (upval), Callback (upval), InputBeganConnection (ref), UserInputService (upval), config (copy), FocusUtils (upval), Callback1 (upval)
				local ChatInputBarFocused = v1.getChatInputBarFocused(p1)
				local Current = if UseRefResult1.current then UseRefResult1.current else UseRefResult.current
				
				if ExpChatFocusablePlaceholderText then
					Current = Current or UseRefResult2.current
				end
				if not Current then return end
				if ChatInputBarFocused then
					GuiService:SetMenuIsOpen(true, "ExperienceChat")
					Callback()
					GuiService.SelectedCoreObject = Current
					
					if not InputBeganConnection then
						InputBeganConnection = UserInputService.InputBegan:Connect(function(Input)
							-- upvalues: config (upval), FocusUtils (upval), v1 (upval)
							if Input and config[Input.KeyCode] then
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

return ReactModule.memo((require(ExpChat.Localization).connect(function(p1)
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
	-- upvalues: ReactModule (copy), FFlagExpChatUseUnifiedTooltipStore (copy), GetChatTooltipStoreModule (copy), FFlagExpChatDictation1 (copy), UseSendTelemetryModule (copy), FFlagExpChatEnableFocusNavigationModule (copy), ReactFocusNavigationModule (copy), FFlagExpChatFocusViaLastModeFixModule (copy), FocusNavigationUtilsModule (copy), SignalsReactModule (copy), v1 (copy), FFlagExpChatUseMessagesStore (copy), GetMessagesStoreModule (copy), FFlagExpChatPresetChatEnabled (copy), GetPresetChatStoreModule (copy), TextChatService (copy), NewResult2 (ref), AutocompleteTextModule (copy), InitializeCommandsModule (copy), GetEnableChatInputBarConfigurationAutocompleteEnabledModule (copy), NewResult1 (ref), InitializeEmojisModule (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), NewResult3 (ref), InitializeGlobalCommandsModule (copy), InitialCommandsModule (copy), NewResult (copy), FFlagExpChatDictation (copy), FFlagExpChatPresetChatGamepadEnabledModule (copy), GuiService (copy), ExpChatDoNotSetCursorPosition (copy), ExpChatPresetChatIXPExposure (copy), IXPServiceWrapperModule (copy), ExpChatPresetChatIXPLayerName (copy), FFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule (copy), FFlagExpChatFixBackspaceNilTargetChannel (copy), ConfigModule (copy), Players (copy), FFlagEnableConsoleExpControls (copy), FFlagChromeChatGamepadSupportFix (copy), onChatInputBarFocusLost (copy), ActionBindableEvent (copy), useEffectChatInputBarFocus (copy), SortCommandResultsCallbackModule (copy), SortEmojiResultsCallbackModule (copy), List (copy), Name (ref), RBXTeamCommand (copy), Name1 (ref), RBXWhisperCommand (copy), ChatOptimizeCommandProcessing (copy), AutoCastCommandFunction (copy), PromiseModule (copy), UseCursorFunction (copy), ExpChatDictationIXPExposure (copy), ExpChatDictationIXPLayerName (copy), UseInterpolatedClientSettingsModule (copy), FFlagExpChatNewInputBarModule (copy), AutocompleteDropdownModule (copy), setTransparency (copy), FFlagExpChatNewInputBarDictationModule (copy), ChatInputBarV2DictationModule (copy), ChatInputBarV2Module (copy), DictationInputBarModule (copy), ExpChatFocusablePlaceholderText (copy), ChannelChipModule (copy), ImageSetLabel (copy), Images (copy)
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
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseStateResult5, _ = ReactModule.useState(true)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseSendTelemetryModuleResult = if FFlagExpChatDictation1 then UseSendTelemetryModule({
		enabled = FFlagExpChatDictation1,
		textBoxRef = UseRefResult2,
		customTextBoxRef = UseRefResult3
	}) else nil
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseRefResult6 = ReactModule.useRef(nil)
	local UseRefResult7 = ReactModule.useRef(nil)
	local UseRefResult8 = ReactModule.useRef(false)
	local UseFocusGuiObjectResult = if FFlagExpChatEnableFocusNavigationModule then ReactFocusNavigationModule.useFocusGuiObject() else nil
	local UseLastInputModeResult = if FFlagExpChatEnableFocusNavigationModule and not FFlagExpChatFocusViaLastModeFixModule then FocusNavigationUtilsModule.useLastInputMode() else nil
	local UseSignalStateResult = if FFlagExpChatFocusViaLastModeFixModule then SignalsReactModule.useSignalState(v1.getChatInputBarFocused) else nil
	local UseSignalStateResult1 = if FFlagExpChatUseMessagesStore then SignalsReactModule.useSignalState(GetMessagesStoreModule(false).getCanLocalUserChat) else nil
	local UseSignalStateResult2 = if FFlagExpChatPresetChatEnabled then SignalsReactModule.useSignalState(GetPresetChatStoreModule(false).getIsTrayOpen) else nil
	local UseSignalStateResult3 = if FFlagExpChatPresetChatEnabled then SignalsReactModule.useSignalState(GetPresetChatStoreModule(false).getIsEnabled) else nil
	local UseRefResult9 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult3 (copy), Frame (copy)
		UseRefResult3.current = Frame.chatInputBarSettings.TextBox
	end, {
		if Frame.chatInputBarSettings.TextBox == nil then "nil" else Frame.chatInputBarSettings.TextBox
	})
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
		-- upvalues: NewResult (upval), UseStateResult (copy), FFlagExpChatUseMessagesStore (upval), UseSignalStateResult1 (ref), Frame (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseSendTelemetryModuleResult (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), FFlagExpChatDictation (upval), UseStateResult2 (copy), FFlagExpChatPresetChatGamepadEnabledModule (upval), GuiService (upval), UseRefResult8 (copy)
		NewResult:trace("onSendActivated with input text: '{}'", UseStateResult)
		local UseSignalStateResult = if FFlagExpChatUseMessagesStore then UseSignalStateResult1 else Frame.canLocalUserChat
		
		if not UseRefResult1.current or not UseSignalStateResult then
			NewResult:debug("onSendActivated could not send message. isMounted: {} canLocalUserChat: {}", tostring(UseRefResult1.current), UseSignalStateResult)
			
			return
		end
		if UseRefResult2.current or UseRefResult3.current then
			local Text = if UseRefResult3.current then UseRefResult3.current.Text else UseRefResult2.current.Text
			local ConsumeOnSendResult = if UseSendTelemetryModuleResult then UseSendTelemetryModuleResult.consumeOnSend(Text) else nil
			local OnSendGlobalChat: (any, any, any) -> () = if GetFFlagTextChatEnableUniverseChatTabsFunction() and Frame.isGlobalChatTabActive and Frame.onSendGlobalChat then Frame.onSendGlobalChat else Frame.onSendChat
			
			if OnSendGlobalChat and string.find(Text, "%S") ~= nil then
				if FFlagExpChatDictation then
					OnSendGlobalChat(Text, ConsumeOnSendResult, ConsumeOnSendResult ~= nil)
				else
					OnSendGlobalChat(Text)
				end
			else
				NewResult:debug("onSendActivated could not send message. text: '{}' canLocalUserChat: {}", Text, UseSignalStateResult)
			end
			if UseRefResult3.current then
				UseRefResult3.current.Text = ""
				UseRefResult3.current:ReleaseFocus()
			end
			if UseRefResult2.current then
				UseRefResult2.current.Text = ""
				UseRefResult2.current:ReleaseFocus()
			end
			UseStateResult2("")
			
			if FFlagExpChatPresetChatGamepadEnabledModule then
				local Current = UseRefResult3.current or UseRefResult2.current
				
				if Current then
					GuiService.SelectedCoreObject = Current
				end
			end
			if Frame.targetTextChannel and Frame.targetTextChannelDisplayName ~= "" then
				UseRefResult8.current = true
				
				return
			end
		else
			NewResult:debug("onSendActivated could not send message because textBoxRef.current was nil")
		end
	end, {
		UseStateResult, UseRefResult3.current, UseSignalStateResult1,
		Frame.canLocalUserChat, Frame.isGlobalChatTabActive, Frame.onSendChat or false,
		Frame.onSendGlobalChat or false, Frame.targetTextChannel or false,
		Frame.targetTextChannelDisplayName,
		if UseSendTelemetryModuleResult then UseSendTelemetryModuleResult.consumeOnSend else false
	})
	local UseResult1 = if FFlagExpChatDictation1 then ReactModule.useCallback(function(p2)
		-- upvalues: FFlagExpChatUseMessagesStore (upval), UseSignalStateResult1 (ref), Frame (copy), UseRefResult1 (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), UseRefResult3 (copy), UseRefResult2 (copy), UseStateResult2 (copy), FFlagExpChatPresetChatGamepadEnabledModule (upval), GuiService (upval), UseRefResult8 (copy)
		local UseSignalStateResult = if FFlagExpChatUseMessagesStore then UseSignalStateResult1 else Frame.canLocalUserChat
		
		if not UseRefResult1.current or not UseSignalStateResult then return end
		local TextSent = p2 and p2.textSent or ""
		local OnSendGlobalChat: (any, any, any) -> () = if GetFFlagTextChatEnableUniverseChatTabsFunction() and Frame.isGlobalChatTabActive and Frame.onSendGlobalChat then Frame.onSendGlobalChat else Frame.onSendChat
		
		if OnSendGlobalChat and string.find(TextSent, "%S") ~= nil then
			OnSendGlobalChat(TextSent, p2, true)
		end
		if UseRefResult3.current then
			UseRefResult3.current.Text = ""
			UseRefResult3.current:ReleaseFocus()
		end
		if UseRefResult2.current then
			UseRefResult2.current.Text = ""
			UseRefResult2.current:ReleaseFocus()
		end
		UseStateResult2("")
		
		if FFlagExpChatPresetChatGamepadEnabledModule then
			local Current = UseRefResult3.current or UseRefResult2.current
			
			if Current then
				GuiService.SelectedCoreObject = Current
			end
		end
		if Frame.targetTextChannel and Frame.targetTextChannelDisplayName ~= "" then
			UseRefResult8.current = true
		end
	end, {
		UseRefResult3.current, UseSignalStateResult1, Frame.canLocalUserChat,
		Frame.isGlobalChatTabActive, Frame.onSendChat or false,
		Frame.onSendGlobalChat or false, Frame.targetTextChannel or false,
		Frame.targetTextChannelDisplayName
	}) else nil
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: Frame (copy), UseRefResult3 (copy), UseRefResult2 (copy), UseStateResult1 (ref), UseStateResult2 (copy), UseRefResult1 (copy), FFlagExpChatFocusViaLastModeFixModule (upval), UseSignalStateResult (copy), UseFocusGuiObjectResult (copy), UseLastInputModeResult (copy), ExpChatDoNotSetCursorPosition (upval), NewResult (upval)
		Frame.autocompleteDropdownActivated(false)
		Frame.autocompleteDropdownResultsChanged({})
		local Current = if UseRefResult3.current then UseRefResult3.current else UseRefResult2.current
		
		if not Current then
			NewResult:error("Could not find textBox")
			
			return
		end
		local Text: string = Current.Text
		local Segment = string.sub(Text, 1, UseStateResult1 - 1)
		local Segment1 = string.sub(Text, UseStateResult1, #Text)
		local Replaced = ""
		
		if Frame.autocompleteDropdownReducer.autocompleteType == "emojis" then
			Replaced = string.gsub(Segment, ":[^:]*$", p2.EmojiLabel.Text)
		elseif Frame.autocompleteDropdownReducer.autocompleteType == "commands" then
			Replaced = string.gsub(Segment, "(/.*)", p2.TextLabel.Text)
		end
		if Segment1 ~= "" then
			Replaced ..= Segment1
		end
		Current.Text = Replaced
		UseStateResult2(Replaced)
		
		if UseRefResult1.current then
			Current:CaptureFocus()
			
			if FFlagExpChatFocusViaLastModeFixModule then
				if UseSignalStateResult then
					UseFocusGuiObjectResult(Current)
				end
			elseif UseLastInputModeResult == "Focus" then
				UseFocusGuiObjectResult(Current)
			end
			if Segment1 ~= "" and not ExpChatDoNotSetCursorPosition then
				Current.CursorPosition = #Replaced - #Segment1 + 1
			end
		end
		Frame.autocompleteDropdownDeactivated()
	end, if FFlagExpChatEnableFocusNavigationModule then {
		if FFlagExpChatFocusViaLastModeFixModule then UseSignalStateResult else nil,
		UseFocusGuiObjectResult, UseStateResult5, UseStateResult1,
		if FFlagExpChatFocusViaLastModeFixModule then nil else UseLastInputModeResult,
		Frame.autocompleteDropdownActivated, Frame.autocompleteDropdownDeactivated,
		Frame.autocompleteDropdownReducer and Frame.autocompleteDropdownReducer.autocompleteType,
		Frame.autocompleteDropdownResultsChanged
	} else nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult3 (copy), UseRefResult2 (copy), NewResult (upval)
		if UseRefResult1.current then
			local Current = if UseRefResult3.current then UseRefResult3.current else UseRefResult2.current
			
			if Current then
				Current:CaptureFocus()
				
				return
			end
			NewResult:error("Could not focus chat input bar because textBox not found")
		end
	end, { Frame.shouldFocusChatInputBar, UseRefResult3.current })
	
	if FFlagExpChatPresetChatEnabled then
		ReactModule.useEffect(function()
			-- upvalues: UseSignalStateResult2 (copy), UseRefResult3 (copy), UseRefResult2 (copy)
			if not UseSignalStateResult2 then return end
			local Current = if UseRefResult3.current then UseRefResult3.current else UseRefResult2.current
			
			if Current and Current:IsFocused() then
				Current:ReleaseFocus()
			end
		end, { UseSignalStateResult2 })
	end
	ReactModule.useEffect(function()
		-- upvalues: NewResult (upval), UseRefResult1 (copy), ExpChatPresetChatIXPExposure (upval), IXPServiceWrapperModule (upval), ExpChatPresetChatIXPLayerName (upval)
		NewResult:trace("Mounted")
		UseRefResult1.current = true
		
		if ExpChatPresetChatIXPExposure then
			IXPServiceWrapperModule:LogUserLayerExposure(ExpChatPresetChatIXPLayerName)
		end
		return function()
			-- upvalues: NewResult (upval), UseRefResult1 (upval)
			NewResult:trace("Unmounting")
			UseRefResult1.current = false
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UseRefResult3 (copy), UseRefResult2 (copy), UseStateResult2_1 (ref)
		local Connection = nil
		
		if Frame.autocompleteEnabled then
			local Current = if UseRefResult3.current then UseRefResult3.current else UseRefResult2.current
			
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
	end, { UseRefResult3.current })
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UseRefResult7 (copy)
		if Frame.autocompleteEnabled then
			UseRefResult7.current = Frame.userInputService.InputBegan:connect(function(Input, _)
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
				-- upvalues: UseRefResult7 (upval)
				local Current = UseRefResult7.current
				
				if Current and Current.Connected then
					Current:Disconnect()
				end
				UseRefResult7.current = nil
			end
		else
			return function() end
		end
	end, {
		Frame.userInputService,
		Frame.autocompleteDropdownReducer
	})
	ReactModule.useEffect(function()
		-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Frame (copy), FFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule (upval), UseRefResult6 (copy), UseRefResult3 (copy), UseRefResult2 (copy), UseRefResult8 (copy), FFlagExpChatFixBackspaceNilTargetChannel (upval), NewResult (upval), UseStateResult (copy)
		local NoDeveloperChannelTabsEnabled: boolean = GetFFlagTextChatEnableUniverseChatTabsFunction() and not Frame.developerChannelTabsEnabled
		local NoIsChannelBarVisible: boolean = if FFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule then not Frame.isChannelBarVisible or NoDeveloperChannelTabsEnabled else not Frame.isChannelBarVisible
		UseRefResult6.current = Frame.userInputService.InputEnded:connect(function(Input, _)
			-- upvalues: UseRefResult3 (upval), UseRefResult2 (upval), Frame (upval), UseRefResult8 (upval), NoIsChannelBarVisible (copy), FFlagExpChatFixBackspaceNilTargetChannel (upval), NewResult (upval), UseStateResult (upval)
			if if UseRefResult3.current then UseRefResult3.current and (UseRefResult3.current:IsFocused() and (Input and Input.KeyCode == Enum.KeyCode.Backspace)) else UseRefResult2.current and (UseRefResult2.current:IsFocused() and (Input and Input.KeyCode == Enum.KeyCode.Backspace)) then
				local v2 = (Frame.targetTextChannelDisplayName or "") ~= ""
				
				if UseRefResult8.current and NoIsChannelBarVisible and (not FFlagExpChatFixBackspaceNilTargetChannel or v2) then
					Frame.resetTargetChannel(if FFlagExpChatFixBackspaceNilTargetChannel then Frame.isGlobalChatTabActive else nil)
					NewResult:debug("ChatInputBar ChatInputBarResetTargetChannel()")
					UseRefResult8.current = false
					
					return
				elseif UseStateResult == "" and (if FFlagExpChatFixBackspaceNilTargetChannel then v2 else Frame.targetTextChannelDisplayName ~= "") then
					UseRefResult8.current = true
				end
			end
		end)
		
		return function()
			-- upvalues: UseRefResult6 (upval)
			local Current = UseRefResult6.current
			
			if Current and Current.Connected then
				Current:Disconnect()
			end
			UseRefResult6.current = nil
		end
	end, {
		Frame.userInputService, UseRefResult3.current, Frame.isChannelBarVisible,
		Frame.targetTextChannelDisplayName, Frame.resetTargetChannel,
		if FFlagExpChatBackspaceExitsTargetChannelInGlobalTabsModule then Frame.developerChannelTabsEnabled else nil,
		if FFlagExpChatFixBackspaceNilTargetChannel then Frame.isGlobalChatTabActive else nil
	})
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), ConfigModule (upval), UseRefResult3 (copy), UseRefResult2 (copy), UseRefResult9 (copy)
		Frame.contextActionService:BindCoreAction("FocusChat", function(_, UserInputState, Input)
			-- upvalues: Frame (upval), ConfigModule (upval), UseRefResult3 (upval), UseRefResult2 (upval), UseRefResult9 (upval)
			if Frame.isChatHotkeyEnabled and Input and (Input.KeyCode == ConfigModule.ChatInputBarDefaultFocusKeyCode or Input.KeyCode == Frame.devDefinedFocusKeyCode) then
				local Current = if UseRefResult3.current then UseRefResult3.current else UseRefResult2.current
				
				if Current and UserInputState == Enum.UserInputState.Begin and Current and not Current:IsFocused() then
					task.delay(0, function()
						-- upvalues: Current (copy)
						Current:CaptureFocus()
					end)
					Frame.focusChatHotKeyActivated()
					UseRefResult9.current = true
					
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
		UseRefResult9.current,
		UseRefResult3.current
	})
	
	local function _(IsFocusedWrite)
		-- upvalues: TextChatService (upval)
		local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		
		if ChatInputBarConfiguration then
			ChatInputBarConfiguration.IsFocusedWrite = IsFocusedWrite
		end
	end
	
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_3 (copy), Frame (copy), TextChatService (upval)
		UseStateResult2_3(true)
		Frame.onFocus()
		local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		
		if ChatInputBarConfiguration then
			ChatInputBarConfiguration.IsFocusedWrite = true
		end
	end, { Frame.onFocus })
	local UseResult4 = ReactModule.useCallback(function(_, p2, Input)
		-- upvalues: NewResult (upval), UseRefResult5 (copy), FFlagExpChatEnableFocusNavigationModule (upval), Frame (copy), UseResult2 (copy), UseResult (copy), UseRefResult1 (copy), UseRefResult3 (copy), UseRefResult2 (copy), UseStateResult1 (ref), ExpChatDoNotSetCursorPosition (upval), UseStateResult2_3 (copy), TextChatService (upval), UseRefResult9 (copy), Players (upval)
		NewResult:debug("Focus lost with enter: {}", (tostring(p2)))
		local Current = UseRefResult5.current
		
		if p2 or FFlagExpChatEnableFocusNavigationModule and Input and (Input.KeyCode == Enum.KeyCode.Return or Input.KeyCode == Enum.KeyCode.KeypadEnter) then
			if Frame.autocompleteEnabled and Current and Frame.autocompleteDropdownReducer.activated and #Frame.autocompleteDropdownReducer.results > 0 then
				for _, Frame1 in ipairs(Current.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame:GetChildren()) do
					if Frame1.ClassName == "Frame" and Frame1.LayoutOrder == Frame.autocompleteDropdownReducer.selectedIndex then
						UseResult2(Frame1.TextLabelButton)
						
						return
					end
				end
			else
				UseResult()
			end
		end
		if UseRefResult1.current then
			if Frame.autocompleteEnabled and Current and Frame.autocompleteDropdownReducer.activated then
				if Input then
					if Input.KeyCode == Enum.KeyCode.Escape then
						Frame.autocompleteDropdownActivated(false)
						local Current1 = if UseRefResult3.current then UseRefResult3.current else UseRefResult2.current
						
						if Current1 then
							local CursorPosition = UseStateResult1
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
		if UseRefResult9.current then
			local LocalPlayer = Players.LocalPlayer
			
			if LocalPlayer then
				local TextBox = Instance.new("TextBox")
				TextBox.Visible = false
				TextBox.Parent = LocalPlayer:FindFirstChildOfClass("PlayerGui")
				TextBox:CaptureFocus()
				TextBox:ReleaseFocus()
				TextBox:Destroy()
			end
			UseRefResult9.current = false
		end
	end)
	ReactModule.useEffect(function()
		-- upvalues: FFlagEnableConsoleExpControls (upval), UseRefResult3 (copy), UseRefResult2 (copy), FFlagChromeChatGamepadSupportFix (upval), GuiService (upval), UseResult3 (copy), onChatInputBarFocusLost (upval), UseResult4 (copy), ActionBindableEvent (upval)
		local Connection = nil
		local DelayedThread = nil
		local EventConnection = ActionBindableEvent.Event:Connect(function(p3)
			-- upvalues: FFlagEnableConsoleExpControls (upval), UseRefResult3 (upval), UseRefResult2 (upval), FFlagChromeChatGamepadSupportFix (upval), GuiService (upval), UseResult3 (upval), DelayedThread (ref), Connection (ref), onChatInputBarFocusLost (upval), UseResult4 (upval)
			local Current = if FFlagEnableConsoleExpControls then if UseRefResult3.current then UseRefResult3.current else UseRefResult2.current else nil
			
			if p3.type == "ChatTopBarFocusActivated" then
				if not FFlagEnableConsoleExpControls then
					Current = if UseRefResult3.current then UseRefResult3.current else UseRefResult2.current
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
	end, { UseRefResult2.current, UseRefResult3.current })
	useEffectChatInputBarFocus(UseRefResult2, UseRefResult3, UseRefResult4, UseResult3, UseResult4)
	
	local function handleAutocomplete(TextBox, Text: string, Segment)
		-- upvalues: Frame (copy), NewResult3 (upval), NewResult2 (upval), SortCommandResultsCallbackModule (upval), NewResult1 (upval), SortEmojiResultsCallbackModule (upval), UseStateResult3 (ref), List (upval), UseStateResult2 (copy), ExpChatDoNotSetCursorPosition (upval), UseRefResult5 (copy), UseResult2 (copy), UseStateResult2_2 (ref)
		if Segment == "/" and TextBox.CursorPosition == 2 or Frame.autocompleteDropdownReducer.autocompleteType == "commands" and Segment ~= ":" then
			Frame.autocompleteDropdownTypeChanged("commands")
			Frame.autocompleteDropdownActivated(true)
			
			if Segment == "" or Segment == " " then
				Frame.autocompleteDropdownDeactivated()
			else
				local Lowered = string.sub(Text, 1, TextBox.CursorPosition - 1):lower()
				local Results = (if Frame.isGlobalChatTabActive and NewResult3 then NewResult3 else NewResult2):getResults(Lowered, SortCommandResultsCallbackModule)
				Frame.autocompleteDropdownResultsChanged(Results)
				
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
				Frame.autocompleteDropdownResultsChanged(if Lowered and string.len(Lowered) > 1 then NewResult1:getResults(Lowered, SortEmojiResultsCallbackModule) else {})
				
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
					local Current = UseRefResult5.current
					
					if Current then
						local TextLabelButton = nil
						for _, Frame1 in ipairs(Current.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame:GetChildren()) do
							if Frame1.ClassName == "Frame" then
								TextLabelButton = Frame1:FindFirstChild("TextLabelButton")
								
								if TextLabelButton then
									local TextLabel = TextLabelButton:FindFirstChild("TextLabel")
									
									if TextLabel and TextLabel.Text and TextLabel.Text == Lowered then
										UseResult2(TextLabelButton)
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
		-- upvalues: Frame (copy), UseStateResult2 (copy), NewResult (upval), UseStateResult (copy), GetEnableChatInputBarConfigurationAutocompleteEnabledModule (upval), handleAutocomplete (copy), UseRefResult8 (copy), ChatOptimizeCommandProcessing (upval), UseRefResult (copy), Name (upval), AutoCastCommandFunction (upval), RBXTeamCommand (upval), Name1 (upval), RBXWhisperCommand (upval), PromiseModule (upval)
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
		UseRefResult8.current = #Text == 0 and UseRefResult8.current
		
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
					-- upvalues: TextBox (copy), UseStateResult2 (upval), UseRefResult8 (upval)
					TextBox.Text = ""
					UseStateResult2("")
					UseRefResult8.current = true
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
				-- upvalues: TextBox (copy), UseStateResult2 (upval), UseRefResult8 (upval)
				TextBox.Text = ""
				UseStateResult2("")
				UseRefResult8.current = true
			end):catch(function(Err)
				-- upvalues: NewResult (upval)
				NewResult:trace("Could not send autoCastCommand. Error: {}", Err)
			end)
		end
	end)
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult3 (copy), UseRefResult2 (copy)
		local Current = if UseRefResult3.current then UseRefResult3.current else UseRefResult2.current
		
		if Current then
			Current:ReleaseFocus(true)
		end
	end, { UseRefResult2.current, UseRefResult3.current })
	local UseResult7 = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(Frame.Visible and Frame.AbsoluteSize.X or 0)
	end)
	local UseCursorResult = if FFlagExpChatEnableFocusNavigationModule then UseCursorFunction() else nil
	local UseResult8 = ReactModule.useCallback(function(Frame1)
		-- upvalues: Frame (copy)
		Frame.autocompleteDropdownSelectionChanged(Frame1.LayoutOrder)
	end)
	local IsUseStateResultMatch = UseStateResult == ""
	local NoUseStateResult4: boolean = IsUseStateResultMatch and not UseStateResult4
	local ChatInputBarSettings = Frame.chatInputBarSettings
	local ChatWindowSettings = Frame.chatWindowSettings
	local UseSignalStateResult4 = if FFlagExpChatUseMessagesStore and UseSignalStateResult1 ~= nil then UseSignalStateResult1 else Frame.canLocalUserChat
	ReactModule.useEffect(function()
		-- upvalues: ExpChatDictationIXPExposure (upval), UseSignalStateResult4 (copy), IXPServiceWrapperModule (upval), ExpChatDictationIXPLayerName (upval)
		if ExpChatDictationIXPExposure and UseSignalStateResult4 then
			IXPServiceWrapperModule:LogUserLayerExposure(ExpChatDictationIXPLayerName)
		end
	end, { UseSignalStateResult4 })
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
			results = Frame.autocompleteDropdownReducer.results,
			selectedIndex = Frame.autocompleteDropdownReducer.selectedIndex,
			autocompleteType = Frame.autocompleteDropdownReducer.autocompleteType,
			onAutocompleteDropdownHover = UseResult8,
			onAutocompleteSelected = UseResult2,
			autocompleteDropdownRef = UseRefResult5,
			textBoxRef = if ChatInputBarSettings.TextBox then UseRefResult3 else UseRefResult2
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
		ChatInputBarV2 = if FFlagExpChatNewInputBarModule then if FFlagExpChatNewInputBarDictationModule and (FFlagExpChatDictation1 and UseSignalStateResult4) then ReactModule.createElement(ChatInputBarV2DictationModule, {
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
			placeholderRef = UseRefResult4,
			textBoxRef = UseRefResult2,
			customTextBoxRef = UseRefResult3,
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
			onDictationActivityChanged = Frame.onDictationActivityChanged
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
			placeholderRef = UseRefResult4,
			textBoxRef = UseRefResult2,
			customTextBoxRef = UseRefResult3,
			onAbsoluteSizeChanged = UseResult7,
			onFocused = UseResult3,
			onFocusLost = UseResult4,
			onTextChanged = UseResult5,
			onReturnPressedFromOnScreenKeyboard = UseResult6,
			onSendActivated = UseResult,
			isGlobalChatTabActive = if FFlagExpChatFixBackspaceNilTargetChannel then Frame.isGlobalChatTabActive else nil
		}) else nil
	}
	local Element1 = nil
	
	if FFlagExpChatNewInputBarModule then
		Element1 = nil
	elseif FFlagExpChatDictation1 and UseSignalStateResult4 then
		Element1 = ReactModule.createElement(DictationInputBarModule, {
			chatInputBarSettings = ChatInputBarSettings,
			transparencyValue = Frame.transparencyValue,
			chatInputBarBackgroundTransparency = BackgroundTransparency,
			inputText = UseStateResult,
			setInputText = UseStateResult2,
			canLocalUserChat = UseSignalStateResult4,
			disabledChatPlaceholderText = Frame.disabledChatPlaceholderText,
			targetChannelWidth = UseBindingResult,
			showPlaceholderText = NoUseStateResult4,
			placeholderText = Frame.placeholderText,
			cursor = UseCursorResult,
			placeholderRef = if ExpChatFocusablePlaceholderText then UseRefResult4 else nil,
			textBoxRef = UseRefResult2,
			customTextBoxRef = UseRefResult3,
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
			onSendActivated = UseResult,
			onSendRecordingTap = UseResult1,
			onTranscriptionStaged = if UseSendTelemetryModuleResult then UseSendTelemetryModuleResult.stageTranscription else nil,
			isSpatialUIEnabled = IsSpatialUIEnabled,
			isTextBoxSelectable = if FFlagEnableConsoleExpControls then true else nil,
			isPlaceholderSelectable = if ExpChatFocusablePlaceholderText then true else nil,
			placeholderSelectionImageObject = if ExpChatFocusablePlaceholderText then UseCursorResult else nil,
			selectionBehavior = if FFlagEnableConsoleExpControls and not FFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
			selectionGroup = FFlagEnableConsoleExpControls and not FFlagExpChatEnableFocusNavigationModule or nil
		})
	else
		local CreateElementFunction3 = ReactModule.createElement
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
		local CreateElementFunction4 = ReactModule.createElement
		local v4 = "Frame"
		local config2 = {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}
		local t = {}
		local CreateElementFunction2 = ReactModule.createElement
		local v5 = "Frame"
		local config3 = {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			SelectionBehaviorDown = if FFlagEnableConsoleExpControls and not FFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorLeft = if FFlagEnableConsoleExpControls and not FFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorRight = if FFlagEnableConsoleExpControls and not FFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorUp = if FFlagEnableConsoleExpControls and not FFlagExpChatEnableFocusNavigationModule then Enum.SelectionBehavior.Stop else nil,
			SelectionGroup = FFlagEnableConsoleExpControls and not FFlagExpChatEnableFocusNavigationModule or nil,
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
		local NoUseSignalStateResult1 = if FFlagExpChatUseMessagesStore then not UseSignalStateResult1 else not Frame.canLocalUserChat
		
		if NoUseSignalStateResult1 then
			local v7: number = if NoUseStateResult4 then 0.5 else 0
			NoUseSignalStateResult1 = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
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
				Selectable = if ExpChatFocusablePlaceholderText then true else nil,
				SelectionImageObject = if ExpChatFocusablePlaceholderText then UseCursorResult else nil,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				ref = if ExpChatFocusablePlaceholderText then UseRefResult4 else nil
			})
		end
		config4.DisabledPlaceholderLabel = NoUseSignalStateResult1
		local Element = if FFlagExpChatUseMessagesStore then UseSignalStateResult1 else Frame.canLocalUserChat
		
		if Element then
			local CreateElementFunction1 = ReactModule.createElement
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
			local TextBox = if FFlagExpChatUseMessagesStore then UseSignalStateResult1 else Frame.canLocalUserChat
			
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
					ref = if ChatInputBarSettings.TextBox then UseRefResult3 else UseRefResult2
				})
			end
			t1.TextBox = TextBox
			Element = CreateElementFunction1(v8, config7, t1)
		end
		config4.TextBoxContainer = Element
		config4.UIPadding = ReactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 10),
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10)
		})
		t.TextContainer = CreateElementFunction2(v5, config3, config4)
		local v10: number = if IsUseStateResultMatch then 0.5 else 0
		t.SendButton = ReactModule.createElement("TextButton", {
			AnchorPoint = Vector2.new(1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Position = UDim2.fromScale(1, 0),
			Selectable = not FFlagExpChatEnableFocusNavigationModule and nil,
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
		config1.Container = CreateElementFunction4(v4, config2, t)
		Element1 = CreateElementFunction3(v3, config, config1)
	end
	config6.Background = Element1
	
	return CreateElementFunction(v2, config5, config6)
end)))