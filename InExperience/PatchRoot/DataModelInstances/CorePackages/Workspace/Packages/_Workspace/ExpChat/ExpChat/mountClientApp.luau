local Chat = game:GetService("Chat")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local PromiseModule = require(Parent.Promise)
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local ColorMode = require(Parent.Foundation).Enums.ColorMode
local Dictionary = require(Parent.llama).Dictionary
local ExpChatSharedModule = require(Parent.ExpChatShared)
local NotificationModalsManagerModule = require(Parent.NotificationModalsManager)
local SharedFlagsModule = require(Parent.SharedFlags)
local SignalsModule = require(Parent.Signals)
local AmpUpsellModule = require(Parent.AmpUpsell)
local AmpApiProvider = AmpUpsellModule.AmpApiProvider
local AccessResponseEnum = AmpUpsellModule.AmpEnums.AccessResponseEnum
local GetAdorneeStoreModule = require(ExpChat.Stores.GetAdorneeStore)
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)
local GetTransparencyStoreModule = require(ExpChat.Stores.GetTransparencyStore)
local GetCharacterStoreModule = require(ExpChat.Stores.GetCharacterStore)
local GetChatConfigurationStoreModule = require(ExpChat.Stores.GetChatConfigurationStore)
local GetChatStatusStoreModule = require(ExpChat.Stores.GetChatStatusStore)
local GetChatModerationStoreModule = require(ExpChat.Stores.GetChatModerationStore)
local GetUserChatSettingsStoreModule = require(ExpChat.Stores.GetUserChatSettingsStore)
local GetGlobalMutedUsersStoreModule = require(ExpChat.Stores.GetGlobalMutedUsersStore)
local DictationSafetyReminderModule = require(ExpChat.ChatInput.UI.ChatInputBar.Dictation.DictationSafetyReminder)
local GetPresetChatStoreModule = require(ExpChat.Stores.GetPresetChatStore)
local GetChatTooltipStoreModule = require(ExpChat.Stores.GetChatTooltipStore)
local GetChatWindowStatusStoreModule = require(ExpChat.Stores.GetChatWindowStatusStore)
local InitializePresetChatModule = require(ExpChat.PresetChat.initializePresetChat)
local IsMessageForOpenChannelModule = require(ExpChat.isMessageForOpenChannel)
local FFlagExpChatPresetChatEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local FFlagExpChatPresetChatLoadTestEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatLoadTestEnabled
local FFlagExpChatUseUnifiedTooltipStore = ExpChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore
local GetFFlagExpChatProtectedChatInternalAPIsFunction = SharedFlagsModule.getFFlagExpChatProtectedChatInternalAPIs
local FFlagExpChatDictationContinuousSafetyReminder = SharedFlagsModule.FFlagExpChatDictationContinuousSafetyReminder
local FFlagExpChatInitializeWindowFromGameSettings = SharedFlagsModule.FFlagExpChatInitializeWindowFromGameSettings
local FFlagExpChatUseProximityStore = SharedFlagsModule.FFlagExpChatUseProximityStore
local GetProximityStoreModule = if FFlagExpChatUseProximityStore then require(ExpChat.Stores.GetProximityStore) else nil
local Analytics = ExpChatSharedModule.Analytics
local CountParticipantsInTextChannelFunction = ExpChatSharedModule.countParticipantsInTextChannel
local AppModule = require(script.Parent.App)
local NewResult = ExpChatSharedModule.Logger:new("ExpChat/" .. script.Name)
local CreateDispatchBindableEventModule = require(script.Parent.createDispatchBindableEvent)
local BindableEventQueueModule = require(ExpChat.Events.bindableEventQueue)
local CreateStoreModule = require(script.Parent.createStore)
local GetNameColorModule = require(script.Parent.GetNameColor)
local ReportMessageReceivedModule = require(script.Parent.reportMessageReceived)
local CanPlatformEnableChatModule = require(script.Parent.canPlatformEnableChat)
local WatchForErrorsFunction = ExpChatSharedModule.watchForErrors
local Commands = ExpChatSharedModule.Commands
local Actions = ExpChat.Actions
local MarkChannelUnreadForIncomingMessageModule = require(Actions.MarkChannelUnreadForIncomingMessage)
local MarkChannelUnreadForSystemMessageModule = require(Actions.MarkChannelUnreadForSystemMessage)
local TextChannelCreatedFunction = ExpChatSharedModule.Actions.TextChannelCreated
local TextChannelRemovedFunction = ExpChatSharedModule.Actions.TextChannelRemoved
local PlayerAddedFunction = ExpChatSharedModule.Actions.PlayerAdded
local PlayerRemovedFunction = ExpChatSharedModule.Actions.PlayerRemoved
local CharacterAddedFunction = ExpChatSharedModule.Actions.CharacterAdded
local LocalCharacterLoadedFunction = ExpChatSharedModule.Actions.LocalCharacterLoaded
local LocalTeamChangedFunction = ExpChatSharedModule.Actions.LocalTeamChanged
local ClientAppLoadedFunction = ExpChatSharedModule.Actions.ClientAppLoaded
local LastInputTypeChangedModule = require(Actions.LastInputTypeChanged)
local ChatTopBarButtonActivatedModule = require(Actions.ChatTopBarButtonActivated)
local CommandAliasChangedFunction = ExpChatSharedModule.Actions.CommandAliasChanged
local HumanoidDiedModule = require(Actions.HumanoidDied)
local AdorneeAddedModule = require(Actions.AdorneeAdded)
local LegacyBubbleChatEnabledChangedModule = require(Actions.LegacyBubbleChatEnabledChanged)
local LegacyBubbleChatSettingsChangedModule = require(Actions.LegacyBubbleChatSettingsChanged)
local LocalTextChannelParticipantAddedModule = require(Actions.LocalTextChannelParticipantAdded)
local LocalTextChannelParticipantRemovedFunction = ExpChatSharedModule.Actions.LocalTextChannelParticipantRemoved
local UniverseChatChannelAddedModule = require(Actions.UniverseChatChannelAdded)
local UniverseChatChannelSelectedFunction = ExpChatSharedModule.Actions.UniverseChatChannelSelected
local DisplaySystemMessageModule = require(ExpChat.displaySystemMessage)
local GenerateRichSystemMessageTextFormatModule = require(ExpChat.generateRichSystemMessageTextFormat)
local SummaryMessageRichTextModule = require(ExpChat.summaryMessageRichText)
local TextChatMessageChatActionTypeModule = require(ExpChat.TextChatMessageChatActionType)
local GetExperienceChatVisualConfigModule = require(ExpChat.getExperienceChatVisualConfig)
local GetOtherDisplayNameInWhisperChannelModule = require(ExpChat.getOtherDisplayNameInWhisperChannel)
local HandleChannelWelcomeMessageModule = require(ExpChat.handleChannelWelcomeMessage)
local IsPlayerVerifiedModule = require(ExpChat.isPlayerVerified)
local IsChatRegionLockedModule = require(ExpChat.isChatRegionLocked)
local IsUserChatEnabledModule = require(ExpChat.isUserChatEnabled)
local CanOnlyChatInRegionModule = require(ExpChat.canOnlyChatInRegion)
local ShouldSendHighFrequencyTelemetryModule = require(ExpChat.shouldSendHighFrequencyTelemetry)
local ShouldShowFOMOUpsellModule = require(ExpChat.shouldShowFOMOUpsell)
local ShouldShowCrossAgeChatActivityModule = require(ExpChat.shouldShowCrossAgeChatActivity)
local ShouldSuppressUnreadForTabMetadataModule = require(ExpChat.shouldSuppressUnreadForTabMetadata)
local ExpChatPerfTracker = require(Parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local ConnectHistoryReplayModule = require(ExpChat.connectHistoryReplay)
local IsHistoricalMessageModule = require(ExpChat.isHistoricalMessage)
local WhenFirstTrueModule = require(ExpChat.whenFirstTrue)
local WhenPresetAccessKnownModule = require(script.helpers.whenPresetAccessKnown)
local PrefixWithPresetIconModule = require(script.helpers.prefixWithPresetIcon)
local GetChannelsWithKeptHistoryModule = require(ExpChat.getChannelsWithKeptHistory)
local FFlagExpChatPerfTrackerTabName = require(Parent.ChatUIPrimitives).Flags.FFlagExpChatPerfTrackerTabName
local SelectSelectedTabNameModule = require(ExpChat.selectSelectedTabName)
local Flags = ExpChat.Flags
local GetEngineFeatureFlagEnableDisplayBubbleModule = require(Flags.getEngineFeatureFlagEnableDisplayBubble)
local GetFFlagUnreduxLastInputTypeChangedModule = require(Flags.getFFlagUnreduxLastInputTypeChanged)
local GetFFlagUseCharacterStoreFunction = ExpChatSharedModule.Flags.getFFlagUseCharacterStore
local GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction = ExpChatSharedModule.Flags.GetFFlagExpChatSuppressWelcomeMessageTabUnread
local GetFFlagExpChatTelemetryEventTriggerModule = require(ExpChat.Flags.getFFlagExpChatTelemetryEventTrigger)
local FFlagExpChatWindowStatusEventFixesModule = require(Flags.FFlagExpChatWindowStatusEventFixes)
local ExpChatMessageResponseThrottlePermyriad = game:DefineFastInt("ExpChatMessageResponseThrottlePermyriad", 0)
local ExpChatMessageResponseUserSamplePermyriad = game:DefineFastInt("ExpChatMessageResponseUserSamplePermyriad", 0)
local ExpChatHiddenMessagesPromptThresholdLowerBound = game:DefineFastInt("ExpChatHiddenMessagesPromptThresholdLowerBound", 10)
local ExpChatHiddenMessagesPromptThresholdUpperBound = game:DefineFastInt("ExpChatHiddenMessagesPromptThresholdUpperBound", 45)
local FFlagExpChatEnableFOMOUpsellModule = require(Flags.FFlagExpChatEnableFOMOUpsell)
local FFlagExpChatClearHiddenMessagesPostAgeCheckModule = require(Flags.FFlagExpChatClearHiddenMessagesPostAgeCheck)
local FFlagEnableInExpChatSummaryOnLuaModule = require(Flags.FFlagEnableInExpChatSummaryOnLua)
local FFlagExpChatEnableCrossAgeChatActivityModule = require(Flags.FFlagExpChatEnableCrossAgeChatActivity)
local FFlagExpChatUnreadTabIndicatorV2WindowModule = require(Flags.FFlagExpChatUnreadTabIndicatorV2Window)
local ExpChatOnlyWakeTextForSelectedTab = game:DefineFastFlag("ExpChatOnlyWakeTextForSelectedTab", false)
local FFlagExpChatFixOutgoingUniverseChatBubbleModule = require(Flags.FFlagExpChatFixOutgoingUniverseChatBubble)
local FFlagExpChatHistoricalMessagesUnibarUnread = SharedFlagsModule.FFlagExpChatHistoricalMessagesUnibarUnread
local FFlagExpChatRenderHistoricalMessages = SharedFlagsModule.FFlagExpChatRenderHistoricalMessages
local FFlagExpChatUseAdorneeStore = SharedFlagsModule.FFlagExpChatUseAdorneeStore
local FFlagExpChatUseChannelTabsStore = SharedFlagsModule.FFlagExpChatUseChannelTabsStore
local FFlagExpChatUseChatConfigStore = SharedFlagsModule.FFlagExpChatUseChatConfigStore
local FFlagEnableModerateChatRemoteEvent = SharedFlagsModule.FFlagEnableModerateChatRemoteEvent
local FFlagLuaSupportMicroGamepadPreferredInput = SharedFlagsModule.FFlagLuaSupportMicroGamepadPreferredInput
local FFlagEnableClientSummarySystemMessageOnLua = SharedFlagsModule.FFlagEnableClientSummarySystemMessageOnLua
local GetFFlagTextChatEnableUniverseChatTabsFunction = ExpChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local GetFFlagEnableExpChatUniverseChatTabNamesFunction = ExpChatSharedModule.Flags.GetFFlagEnableExpChatUniverseChatTabNames
local ExpChatRemoveSpaceFromTeamPrefix = game:DefineFastFlag("ExpChatRemoveSpaceFromTeamPrefix", false)
local FFlagAIRephraseSettingEnabled = SharedFlagsModule.FFlagAIRephraseSettingEnabled
local FFlagChatSummariesSettingEnabled = SharedFlagsModule.FFlagChatSummariesSettingEnabled
local FFlagEnableGlobalChat3pSummaryLuaAppsModule = require(Flags.FFlagEnableGlobalChat3pSummaryLuaApps)
local FFlagExpChatEnableGlobalChatSummarySystemMessageModule = require(Flags.FFlagExpChatEnableGlobalChatSummarySystemMessage)
local ExpChatSuppressGlobalSummaryTabUnread = game:DefineFastFlag("ExpChatSuppressGlobalSummaryTabUnread", false)
local FFlagExpChatRefactorEnabledMessageLogicModule = require(Flags.FFlagExpChatRefactorEnabledMessageLogic)
local FFlagExpChatMEUpdatedSystemMessageModule = require(Flags.FFlagExpChatMEUpdatedSystemMessage)
local FFlagExpChatVirtualizeSystemMessagesModule = require(Flags.FFlagExpChatVirtualizeSystemMessages)
local FStringExpChatChatWithTFAmpFeatureNameModule = require(Flags.FStringExpChatChatWithTFAmpFeatureName)
local FStringExpChatChatWithTFAmpNameSpaceModule = require(Flags.FStringExpChatChatWithTFAmpNameSpace)
local ExpChatNewSystemMessagesExperimentation = require(Parent.SocialExperiments).ExpChatNewSystemMessagesExperimentation
local ExpChatGlobalTabDefaultExperimentation = require(Parent.SocialExperiments).ExpChatGlobalTabDefaultExperimentation
local IsGlobalTabFirstModule = require(ExpChat.isGlobalTabFirst)
local GetGlobalWelcomeMessageKeyModule = require(ExpChat.getGlobalWelcomeMessageKey)
local FFlagExpChatGlobalTabDefaultModule = require(Flags.FFlagExpChatGlobalTabDefault)

function getChatTranslationEnabled()
	-- upvalues: TextChatService (copy)
	local Success, Result = pcall(function()
		-- upvalues: TextChatService (upval)
		return TextChatService.ChatTranslationEnabled
	end)
	
	return Success and Result
end

local config = {
	eventName = "MessageResponse",
	description = "When a client receives a text chat message through TextChatService.",
	links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/message_response.proto",
	backends = { "EventIngest" },
	throttlingPercentage = ExpChatMessageResponseThrottlePermyriad,
	lastUpdated = { 25, 10, 8 }
}
local Helpers = script.helpers
local SetUpConfigurationObjectsModule = require(Helpers.setUpConfigurationObjects)
local SetUpClientSettingsModule = require(Helpers.setUpClientSettings)
local WaitForFirstModule = require(Helpers.waitForFirst)
local ShouldFilterGlobalMessageModule = require(Helpers.shouldFilterGlobalMessage)
local HasUserSelectedTabModule = require(Helpers.hasUserSelectedTab)
local WriteVirtualSystemMessageModule = require(Helpers.writeVirtualSystemMessage)
local ShouldSkipHistoricalMessageModule = require(ExpChat.shouldSkipHistoricalMessage)
local Context = ExpChatSharedModule.context
local ReportVersionLoadedModule = require(script.reportVersionLoaded)
local Version = ExpChatSharedModule.Version
local AtomicBindingModule = require(ExpChat.AtomicBinding)
local ChatEnabledSystemMessageModule = require(script.SystemMessages.ChatEnabledSystemMessage)

local function watchPlayersService(JoinResult, Store, MessagesStore)
	-- upvalues: NewResult (copy), IsPlayerVerifiedModule (copy), PlayerAddedFunction (copy), Players (copy), LocalTeamChangedFunction (copy), FFlagExpChatUseAdorneeStore (copy), Context (copy), AdorneeAddedModule (copy), HumanoidDiedModule (copy), AtomicBindingModule (copy), WaitForFirstModule (copy), LocalCharacterLoadedFunction (copy), GetFFlagUseCharacterStoreFunction (copy), CharacterAddedFunction (copy), PromiseModule (copy), DisplaySystemMessageModule (copy), FFlagExpChatWindowStatusEventFixesModule (copy), GetChatWindowStatusStoreModule (copy), TextChatService (copy), PlayerRemovedFunction (copy)
	NewResult:trace("Watching Players service")
	local t = {}
	
	local function onPlayerAdded(Player: Player)
		-- upvalues: NewResult (upval), IsPlayerVerifiedModule (upval), Store (copy), PlayerAddedFunction (upval), Players (upval), LocalTeamChangedFunction (upval), FFlagExpChatUseAdorneeStore (upval), Context (upval), AdorneeAddedModule (upval), HumanoidDiedModule (upval), AtomicBindingModule (upval), WaitForFirstModule (upval), LocalCharacterLoadedFunction (upval), GetFFlagUseCharacterStoreFunction (upval), CharacterAddedFunction (upval), t (copy)
		NewResult:trace("Player added: {} {}", Player.Name, (tostring(Player.UserId)))
		Store:dispatch(PlayerAddedFunction(Player.UserId, Player.Name, Player.DisplayName, if IsPlayerVerifiedModule(Player) then true else nil))
		
		if Player == Players.LocalPlayer then
			NewResult:trace("Found local player")
			Player:GetPropertyChangedSignal("Team"):Connect(function()
				-- upvalues: Store (upval), LocalTeamChangedFunction (upval), Player (copy)
				Store:dispatch(LocalTeamChangedFunction(Player.Team))
			end)
		end
		local function _()
			-- upvalues: Player (copy), FFlagExpChatUseAdorneeStore (upval), Context (upval), Store (upval), AdorneeAddedModule (upval), HumanoidDiedModule (upval), AtomicBindingModule (upval)
			return (AtomicBindingModule.new({
				humanoid = "Humanoid",
				humanoidRootPart = "HumanoidRootPart"
			}, function(p1)
				-- upvalues: Player (upval), FFlagExpChatUseAdorneeStore (upval), Context (upval), Store (upval), AdorneeAddedModule (upval), HumanoidDiedModule (upval)
				local Root = p1.root
				local Humanoid = p1.humanoid
				local HumanoidRootPart = p1.humanoidRootPart
				
				if not Humanoid:IsA("Humanoid") or not HumanoidRootPart:IsA("BasePart") then
					return function() end
				end
				if Root and HumanoidRootPart and Player.Character == Root then
					if FFlagExpChatUseAdorneeStore then
						Context.adorneeStore.handleAdorneeAdded(Player.UserId, Root, Humanoid)
					else
						Store:dispatch(AdorneeAddedModule(Player.UserId, Root, Humanoid))
					end
				end
				local DiedConnection = Humanoid.Died:Connect(function()
					-- upvalues: FFlagExpChatUseAdorneeStore (upval), Context (upval), Player (upval), Store (upval), HumanoidDiedModule (upval)
					if FFlagExpChatUseAdorneeStore then
						Context.adorneeStore.handleHumanoidDied(Player.UserId)
						
						return
					else
						Store:dispatch(HumanoidDiedModule(Player.UserId))
					end
				end)
				
				return function()
					-- upvalues: DiedConnection (copy)
					if DiedConnection then
						DiedConnection:Disconnect()
					end
				end
			end))
		end
		
		local NewAtomicBinding = AtomicBindingModule.new({
			humanoid = "Humanoid",
			humanoidRootPart = "HumanoidRootPart"
		}, function(p1)
			-- upvalues: Player (copy), FFlagExpChatUseAdorneeStore (upval), Context (upval), Store (upval), AdorneeAddedModule (upval), HumanoidDiedModule (upval)
			local Root = p1.root
			local Humanoid = p1.humanoid
			local HumanoidRootPart = p1.humanoidRootPart
			
			if not Humanoid:IsA("Humanoid") or not HumanoidRootPart:IsA("BasePart") then
				return function() end
			end
			if Root and HumanoidRootPart and Player.Character == Root then
				if FFlagExpChatUseAdorneeStore then
					Context.adorneeStore.handleAdorneeAdded(Player.UserId, Root, Humanoid)
				else
					Store:dispatch(AdorneeAddedModule(Player.UserId, Root, Humanoid))
				end
			end
			local DiedConnection = Humanoid.Died:Connect(function()
				-- upvalues: FFlagExpChatUseAdorneeStore (upval), Context (upval), Player (upval), Store (upval), HumanoidDiedModule (upval)
				if FFlagExpChatUseAdorneeStore then
					Context.adorneeStore.handleHumanoidDied(Player.UserId)
					
					return
				else
					Store:dispatch(HumanoidDiedModule(Player.UserId))
				end
			end)
			
			return function()
				-- upvalues: DiedConnection (copy)
				if DiedConnection then
					DiedConnection:Disconnect()
				end
			end
		end)
		
		local function onCharacterAdded(Character)
			-- upvalues: WaitForFirstModule (upval), Player (copy), NewResult (upval), Players (upval), Store (upval), LocalCharacterLoadedFunction (upval), GetFFlagUseCharacterStoreFunction (upval), Context (upval), CharacterAddedFunction (upval), NewAtomicBinding (copy)
			if not Character.Parent then
				WaitForFirstModule(Character.AncestryChanged, Player.CharacterAdded)
			end
			if Player.Character ~= Character or not Character.Parent then
				NewResult:debug("Mismatched or unparented character in onCharacterAdded for {}", (tostring(Player.UserId)))
				
				return
			end
			if Player == Players.LocalPlayer then
				NewResult:debug("Local character loaded: {}", Character.Name)
				Store:dispatch(LocalCharacterLoadedFunction(Character))
			end
			if GetFFlagUseCharacterStoreFunction() then
				Context.characterStore.handleCharacterAdded(Player.UserId, Character)
			else
				Store:dispatch(CharacterAddedFunction(Player.UserId, Character))
			end
			NewAtomicBinding:bindRoot(Character)
		end
		
		local function onCharacterRemoving(Character)
			-- upvalues: NewAtomicBinding (copy)
			NewAtomicBinding:unbindRoot(Character)
		end
		
		if Player.Character then
			onCharacterAdded(Player.Character)
		end
		local CharacterAddedConnection = Player.CharacterAdded:Connect(onCharacterAdded)
		local CharacterRemovingConnection = Player.CharacterRemoving:Connect(onCharacterRemoving)
		
		if not t[Player.UserId] then
			t[Player.UserId] = { CharacterAddedConnection, CharacterRemovingConnection }
		end
	end
	
	local function onNewPlayerAdded(Player: Player)
		-- upvalues: onPlayerAdded (copy), Players (upval), PromiseModule (upval), DisplaySystemMessageModule (upval), JoinResult (copy), NewResult (upval)
		onPlayerAdded(Player)
		
		if Players.LocalPlayer then
			PromiseModule.try(function()
				-- upvalues: Player (copy), Players (upval)
				return Player:IsFriendsWithAsync(Players.LocalPlayer.UserId)
			end):andThen(function(Result)
				-- upvalues: DisplaySystemMessageModule (upval), Player (copy), JoinResult (upval)
				if Result then
					DisplaySystemMessageModule("InGame.UnknownNamespace.GameChat.FriendChatNotifier.JoinMessage", { RBX_NAME = Player.DisplayName }, "Roblox.Notification.Friend.Joined", JoinResult.translator, JoinResult.defaultSystemTextChannel)
				end
			end):catch(function(Err)
				-- upvalues: NewResult (upval)
				NewResult:error("Could not fetch friendship status. Error: {}", (tostring(Err)))
			end)
		end
	end
	
	for _, player in pairs(Players:GetPlayers()) do
		if player:IsA("Player") then
			onPlayerAdded(player)
		end
	end
	Players.PlayerAdded:Connect(onNewPlayerAdded)
	Players.PlayerRemoving:Connect(function(Player: Player)
		-- upvalues: NewResult (upval), FFlagExpChatWindowStatusEventFixesModule (upval), Players (upval), GetChatWindowStatusStoreModule (upval), TextChatService (upval), Store (copy), PlayerRemovedFunction (upval), MessagesStore (copy), FFlagExpChatUseAdorneeStore (upval), Context (upval), GetFFlagUseCharacterStoreFunction (upval), t (copy)
		NewResult:trace("Player removed: {} {}", Player.Name, (tostring(Player.UserId)))
		
		if FFlagExpChatWindowStatusEventFixesModule and Player == Players.LocalPlayer then
			local FlushFinalDurationResult, FlushFinalDurationResult2 = GetChatWindowStatusStoreModule(false).flushFinalDuration(os.clock())
			
			if FlushFinalDurationResult2 then
				TextChatService:SendExpChatWindowStatusChange(FlushFinalDurationResult.closedDuration, FlushFinalDurationResult.openDuration, FlushFinalDurationResult.backgroundIdleDuration, FlushFinalDurationResult.textIdleDuration)
			end
		end
		Store:dispatch(PlayerRemovedFunction(Player.UserId))
		MessagesStore.handlePlayerRemoved(Player.UserId)
		
		if FFlagExpChatUseAdorneeStore then
			Context.adorneeStore.handlePlayerRemoved(Player.UserId)
		end
		if GetFFlagUseCharacterStoreFunction() then
			Context.characterStore.handlePlayerRemoved(Player.UserId)
		end
		local Entry = t[Player.UserId]
		
		if Entry then
			for _, Connection in ipairs(Entry) do
				Connection:Disconnect()
			end
			t[Player.UserId] = nil
		end
	end)
end

local config1 = {
	canUserChatAsync = function(UserId)
		-- upvalues: Chat (copy)
		return Chat:CanUserChatAsync(UserId)
	end
}

local function OnIncomingMessage(TextChatMessage)
	-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (copy), NewResult (copy), FFlagEnableInExpChatSummaryOnLuaModule (copy), GenerateRichSystemMessageTextFormatModule (copy), UIBloxModule (copy)
	if GetFFlagExpChatProtectedChatInternalAPIsFunction() then
		NewResult:trace("System OnIncomingMessage started: PrefixTextInternal: {} TextInternal: {}", TextChatMessage.PrefixTextInternal, TextChatMessage.TextInternal)
	else
		NewResult:trace("System OnIncomingMessage started: {} {}", TextChatMessage.PrefixText, TextChatMessage.Text)
	end
	local TextChatMessageProperties = Instance.new("TextChatMessageProperties")
	TextChatMessageProperties.Text = if FFlagEnableInExpChatSummaryOnLuaModule then GenerateRichSystemMessageTextFormatModule(if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.TextInternal else TextChatMessage.Text, not not string.find(TextChatMessage.Metadata, "Error")) else string.format("<font color=\"#%s\">%s</font>", if string.find(TextChatMessage.Metadata, "Error") then UIBloxModule.App.Style.Colors.Red:ToHex() else UIBloxModule.App.Style.Colors.LightGrey:ToHex(), if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.TextInternal else TextChatMessage.Text)
	NewResult:trace("System OnIncomingMessage finished: {} {}", TextChatMessageProperties.PrefixText, TextChatMessageProperties.Text)
	
	return TextChatMessageProperties
end

return function(p1)
	-- upvalues: NewResult (copy), Dictionary (copy), config1 (copy), CreateStoreModule (copy), CreateDispatchBindableEventModule (copy), BindableEventQueueModule (copy), WatchForErrorsFunction (copy), Context (copy), FFlagExpChatUseAdorneeStore (copy), GetAdorneeStoreModule (copy), FFlagExpChatUseProximityStore (copy), GetProximityStoreModule (copy), GetMessagesStoreModule (copy), FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy), FFlagExpChatVirtualizeSystemMessagesModule (copy), GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction (copy), ExpChatOnlyWakeTextForSelectedTab (copy), IsMessageForOpenChannelModule (copy), GetTransparencyStoreModule (copy), DisplaySystemMessageModule (copy), WriteVirtualSystemMessageModule (copy), FFlagExpChatUseChatConfigStore (copy), GetChatConfigurationStoreModule (copy), GetChatStatusStoreModule (copy), GetGlobalMutedUsersStoreModule (copy), GetFFlagUseCharacterStoreFunction (copy), GetCharacterStoreModule (copy), Analytics (copy), GetFFlagUnreduxLastInputTypeChangedModule (copy), UserInputService (copy), LastInputTypeChangedModule (copy), OnIncomingMessage (copy), Chat (copy), TextChatService (copy), SetUpConfigurationObjectsModule (copy), SetUpClientSettingsModule (copy), FFlagExpChatInitializeWindowFromGameSettings (copy), ChatTopBarButtonActivatedModule (copy), Players (copy), FFlagExpChatRenderHistoricalMessages (copy), IsHistoricalMessageModule (copy), ShouldSkipHistoricalMessageModule (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (copy), ExpChatPerfTracker (copy), FFlagExpChatPerfTrackerTabName (copy), SelectSelectedTabNameModule (copy), ReportMessageReceivedModule (copy), HandleChannelWelcomeMessageModule (copy), FFlagExpChatUnreadTabIndicatorV2WindowModule (copy), MarkChannelUnreadForIncomingMessageModule (copy), ShouldSuppressUnreadForTabMetadataModule (copy), MarkChannelUnreadForSystemMessageModule (copy), ShouldSendHighFrequencyTelemetryModule (copy), ExpChatMessageResponseUserSamplePermyriad (copy), config (copy), TextChannelCreatedFunction (copy), GetNameColorModule (copy), ExpChatRemoveSpaceFromTeamPrefix (copy), GetOtherDisplayNameInWhisperChannelModule (copy), FFlagExpChatDictationContinuousSafetyReminder (copy), DictationSafetyReminderModule (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), ExpChatNewSystemMessagesExperimentation (copy), SummaryMessageRichTextModule (copy), FFlagExpChatEnableGlobalChatSummarySystemMessageModule (copy), ExpChatSuppressGlobalSummaryTabUnread (copy), FFlagEnableInExpChatSummaryOnLuaModule (copy), FFlagEnableClientSummarySystemMessageOnLua (copy), TextChannelRemovedFunction (copy), TextChatMessageChatActionTypeModule (copy), FFlagEnableGlobalChat3pSummaryLuaAppsModule (copy), FFlagAIRephraseSettingEnabled (copy), FFlagChatSummariesSettingEnabled (copy), RobloxReplicatedStorage (copy), GetUserChatSettingsStoreModule (copy), GetChannelsWithKeptHistoryModule (copy), WhenFirstTrueModule (copy), ConnectHistoryReplayModule (copy), FFlagExpChatHistoricalMessagesUnibarUnread (copy), CountParticipantsInTextChannelFunction (copy), FFlagExpChatGlobalTabDefaultModule (copy), FFlagExpChatFixOutgoingUniverseChatBubbleModule (copy), LocalTextChannelParticipantAddedModule (copy), LocalTextChannelParticipantRemovedFunction (copy), FFlagExpChatUseUnifiedTooltipStore (copy), GetChatTooltipStoreModule (copy), ExpChatGlobalTabDefaultExperimentation (copy), UniverseChatChannelAddedModule (copy), IsGlobalTabFirstModule (copy), HasUserSelectedTabModule (copy), UniverseChatChannelSelectedFunction (copy), GetFFlagEnableExpChatUniverseChatTabNamesFunction (copy), GetGlobalWelcomeMessageKeyModule (copy), ShouldFilterGlobalMessageModule (copy), HttpService (copy), LegacyBubbleChatEnabledChangedModule (copy), LegacyBubbleChatSettingsChangedModule (copy), GetEngineFeatureFlagEnableDisplayBubbleModule (copy), Commands (copy), CommandAliasChangedFunction (copy), PromiseModule (copy), watchPlayersService (copy), UIBloxModule (copy), ColorMode (copy), RoactModule (copy), AppModule (copy), GetFFlagExpChatTelemetryEventTriggerModule (copy), ClientAppLoadedFunction (copy), StarterGui (copy), FFlagLuaSupportMicroGamepadPreferredInput (copy), ReportVersionLoadedModule (copy), Version (copy), ChatEnabledSystemMessageModule (copy), FFlagExpChatMEUpdatedSystemMessageModule (copy), FFlagExpChatPresetChatEnabled (copy), WhenPresetAccessKnownModule (copy), GetPresetChatStoreModule (copy), PrefixWithPresetIconModule (copy), IsChatRegionLockedModule (copy), CanPlatformEnableChatModule (copy), FFlagExpChatRefactorEnabledMessageLogicModule (copy), FStringExpChatChatWithTFAmpFeatureNameModule (copy), FStringExpChatChatWithTFAmpNameSpaceModule (copy), AmpApiProvider (copy), AccessResponseEnum (copy), CanOnlyChatInRegionModule (copy), ExpChatHiddenMessagesPromptThresholdLowerBound (copy), ExpChatHiddenMessagesPromptThresholdUpperBound (copy), IsUserChatEnabledModule (copy), FFlagExpChatEnableFOMOUpsellModule (copy), ShouldShowFOMOUpsellModule (copy), FFlagExpChatEnableCrossAgeChatActivityModule (copy), ShouldShowCrossAgeChatActivityModule (copy), FFlagEnableModerateChatRemoteEvent (copy), GetExperienceChatVisualConfigModule (copy), GetChatModerationStoreModule (copy), SignalsModule (copy), NotificationModalsManagerModule (copy), FFlagExpChatPresetChatLoadTestEnabled (copy), InitializePresetChatModule (copy), FFlagExpChatClearHiddenMessagesPostAgeCheckModule (copy)
	NewResult:trace("mountClientApp started")
	local JoinResult = Dictionary.join(config1, p1)
	local StoreModule = CreateStoreModule()
	CreateDispatchBindableEventModule(StoreModule)
	BindableEventQueueModule:flush()
	WatchForErrorsFunction(game:GetService("ScriptContext"), JoinResult.script, false)
	Context.translator = JoinResult.translator
	Context.store = StoreModule
	
	if FFlagExpChatUseAdorneeStore then
		Context.adorneeStore = GetAdorneeStoreModule(false)
	end
	if FFlagExpChatUseProximityStore then
		Context.proximityStore = GetProximityStoreModule(false)
	end
	local MessagesStoreModule = GetMessagesStoreModule(false)
	local ChannelTabsStoreModule = if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false) else nil
	local HasMessagesStoreModule: boolean = FFlagExpChatVirtualizeSystemMessagesModule and MessagesStoreModule ~= nil
	local config2 = {
		messagesStore = MessagesStoreModule,
		channelTabsStore = ChannelTabsStoreModule,
		store = StoreModule,
		suppressWelcomeMessageTabUnread = GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction(),
		resetTextTransparency = function(p2)
			-- upvalues: ExpChatOnlyWakeTextForSelectedTab (upval), IsMessageForOpenChannelModule (upval), StoreModule (copy), GetTransparencyStoreModule (upval)
			if not ExpChatOnlyWakeTextForSelectedTab or IsMessageForOpenChannelModule(StoreModule:getState(), nil, p2) then
				GetTransparencyStoreModule(false).resetTextTransparency()
			end
		end
	}
	
	local function showWelcomeSystemMessage(p2, TextChannel)
		-- upvalues: HasMessagesStoreModule (copy), DisplaySystemMessageModule (upval), JoinResult (ref), WriteVirtualSystemMessageModule (upval), config2 (copy)
		if not HasMessagesStoreModule then
			DisplaySystemMessageModule(p2.key, p2.args, p2.metadata, JoinResult.translator, TextChannel)
			
			return
		end
		if not TextChannel then return end
		local Success, Result = pcall(function()
			-- upvalues: JoinResult (upval), p2 (copy)
			return JoinResult.translator:FormatByKey(p2.key, p2.args)
		end)
		
		if Success and type(Result) == "string" and Result ~= "" then
			WriteVirtualSystemMessageModule(config2, {
				text = Result,
				channelName = TextChannel.Name,
				metadata = p2.metadata,
				textChannel = TextChannel
			})
			
			return
		end
	end
	
	local function showVirtualChatEnabledSystemMessage(p2, p3, p4)
		-- upvalues: JoinResult (ref), WriteVirtualSystemMessageModule (upval), config2 (copy)
		local DefaultSystemTextChannel = JoinResult.defaultSystemTextChannel
		
		if not DefaultSystemTextChannel then return end
		local Success, Result = pcall(function()
			-- upvalues: JoinResult (upval), p2 (copy), p3 (copy)
			return JoinResult.translator:FormatByKey(p2, p3)
		end)
		
		if not Success or type(Result) ~= "string" or Result == "" then
			Result = p4
		end
		WriteVirtualSystemMessageModule(config2, {
			channelName = "RBXGeneral",
			metadata = "Roblox.ChatEnabled.Info",
			text = Result,
			textChannel = DefaultSystemTextChannel
		})
	end
	
	local ChatConfigurationStoreModule = if FFlagExpChatUseChatConfigStore then GetChatConfigurationStoreModule(false) else nil
	local ChatStatusStoreModule = GetChatStatusStoreModule(false)
	Context.messagesStore = MessagesStoreModule
	Context.globalMutedUsersStore = GetGlobalMutedUsersStoreModule(false)
	
	if GetFFlagUseCharacterStoreFunction() then
		Context.characterStore = GetCharacterStoreModule(false)
	end
	if JoinResult.analytics then
		Analytics.with(JoinResult.analytics)
	end
	if not GetFFlagUnreduxLastInputTypeChangedModule() then
		UserInputService.LastInputTypeChanged:Connect(function(LastInputType)
			-- upvalues: StoreModule (copy), LastInputTypeChangedModule (upval)
			StoreModule:dispatch(LastInputTypeChangedModule(LastInputType))
		end)
	end
	if JoinResult.defaultSystemTextChannel then
		JoinResult.defaultSystemTextChannel.OnIncomingMessage = OnIncomingMessage
	else
		Chat:GetPropertyChangedSignal("IsAutoMigrated"):Once(function()
			-- upvalues: TextChatService (upval), JoinResult (ref), OnIncomingMessage (upval)
			local RBXSystem = TextChatService:FindFirstChild("RBXSystem", true)
			
			if RBXSystem and RBXSystem:IsA("TextChannel") then
				JoinResult.defaultSystemTextChannel = RBXSystem
				RBXSystem.OnIncomingMessage = OnIncomingMessage
			end
		end)
	end
	SetUpConfigurationObjectsModule(StoreModule, JoinResult)
	SetUpClientSettingsModule(StoreModule)
	
	if FFlagExpChatInitializeWindowFromGameSettings then
		StoreModule:dispatch(ChatTopBarButtonActivatedModule(UserSettings().GameSettings.ChatVisible))
	end
	local LocalPlayer = Players.LocalPlayer
	
	if LocalPlayer then
		LocalPlayer:GetPropertyChangedSignal("Team"):Connect(function()
			-- upvalues: LocalPlayer (copy), DisplaySystemMessageModule (upval), JoinResult (ref)
			local Team = LocalPlayer.Team
			
			if Team then
				DisplaySystemMessageModule("InGame.UnknownNamespace.GameChat_TeamChat_NowInTeam", { RBX_NAME = Team.Name }, "Roblox.Team.Success.NowInTeam", JoinResult.translator, JoinResult.defaultSystemTextChannel)
			end
		end)
	end
	local config3 = {
		[Enum.TextChatMessageStatus.Floodchecked] = {
			key = "CoreScripts.TextChat.MessageStatus.Warning.Floodchecked",
			metadata = "Roblox.MessageStatus.Warning.Floodchecked"
		},
		[Enum.TextChatMessageStatus.TextFilterFailed] = {
			key = "CoreScripts.TextChat.MessageStatus.Warning.TextFilterFailed",
			metadata = "Roblox.MessageStatus.Warning.TextFilterFailed"
		},
		[Enum.TextChatMessageStatus.InvalidPrivacySettings] = {
			key = "CoreScripts.TextChat.MessageStatus.Warning.InvalidPrivacySettings",
			metadata = "Roblox.MessageStatus.Warning.InvalidPrivacySettings"
		},
		[Enum.TextChatMessageStatus.MessageTooLong] = {
			key = "CoreScripts.TextChat.MessageStatus.Warning.MessageTooLong",
			metadata = "Roblox.MessageStatus.Warning.MessageTooLong"
		},
		[Enum.TextChatMessageStatus.ModerationTimeout] = {
			key = "CoreScripts.TextChat.MessageStatus.Warning.ModerationTimeout",
			metadata = "Roblox.MessageStatus.Warning.ModerationTimeout"
		},
		[Enum.TextChatMessageStatus.Unknown] = {
			key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown",
			metadata = "Roblox.MessageStatus.Warning.Unknown"
		}
	}
	
	local function _(p2, p3, p4)
		-- upvalues: LocalPlayer (copy), MessagesStoreModule (copy)
		MessagesStoreModule.handleIncomingOrOutgoingMessage(p2, LocalPlayer ~= nil and (p2.TextSource ~= nil and p2.TextSource.UserId == LocalPlayer.UserId), p3, p4, true)
	end
	
	local function _processIncomingMessageCore(TextChatMessage, ChannelNameOverride, IsUniverseChat)
		-- upvalues: FFlagExpChatRenderHistoricalMessages (upval), IsHistoricalMessageModule (upval), LocalPlayer (copy), MessagesStoreModule (copy), ShouldSkipHistoricalMessageModule (upval), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), NewResult (upval), ExpChatPerfTracker (upval), FFlagExpChatPerfTrackerTabName (upval), SelectSelectedTabNameModule (upval), StoreModule (copy), ReportMessageReceivedModule (upval), HandleChannelWelcomeMessageModule (upval), showWelcomeSystemMessage (copy), ExpChatOnlyWakeTextForSelectedTab (upval), IsMessageForOpenChannelModule (upval), GetTransparencyStoreModule (upval), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (copy), FFlagExpChatUnreadTabIndicatorV2WindowModule (upval), MarkChannelUnreadForIncomingMessageModule (upval), config3 (copy), JoinResult (ref), GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction (upval), ShouldSuppressUnreadForTabMetadataModule (upval), MarkChannelUnreadForSystemMessageModule (upval), TextChatService (upval), DisplaySystemMessageModule (upval), ShouldSendHighFrequencyTelemetryModule (upval), ExpChatMessageResponseUserSamplePermyriad (upval), Analytics (upval), config (upval)
		if FFlagExpChatRenderHistoricalMessages and IsHistoricalMessageModule(TextChatMessage) then
			MessagesStoreModule.handleIncomingOrOutgoingMessage(TextChatMessage, LocalPlayer ~= nil and (TextChatMessage.TextSource ~= nil and TextChatMessage.TextSource.UserId == LocalPlayer.UserId), ChannelNameOverride, IsUniverseChat, true)
			
			return
		end
		if ShouldSkipHistoricalMessageModule(TextChatMessage) then return end
		if GetFFlagExpChatProtectedChatInternalAPIsFunction() then
			NewResult:debug("Incoming MessageReceived Status: {} TextInternal: {}", TextChatMessage.Status.Name, TextChatMessage.TextInternal)
		else
			NewResult:debug("Incoming MessageReceived Status: {} Text: {}", TextChatMessage.Status.Name, TextChatMessage.Text)
		end
		if (TextChatMessage.TextSource and TextChatMessage.TextSource.UserId or "UNKNOWN_TEXT_SOURCE_USER_ID") ~= (LocalPlayer and LocalPlayer.UserId or "UNKNOWN_LOCAL_USER_ID") then
			ExpChatPerfTracker.start(ExpChatPerfTracker.Events.MessageReceiveToWindowRenderInterval, { messageId = TextChatMessage.MessageId }, if FFlagExpChatPerfTrackerTabName then {
				tabName = SelectSelectedTabNameModule(StoreModule:getState())
			} else nil)
		end
		if LocalPlayer then
			ReportMessageReceivedModule(LocalPlayer.UserId, TextChatMessage)
		end
		if LocalPlayer and TextChatMessage.TextSource and TextChatMessage.TextSource.UserId ~= LocalPlayer.UserId then
			local HandleChannelWelcomeMessageModuleResult = HandleChannelWelcomeMessageModule(TextChatMessage, LocalPlayer)
			
			if HandleChannelWelcomeMessageModuleResult then
				showWelcomeSystemMessage(HandleChannelWelcomeMessageModuleResult, TextChatMessage.TextChannel)
			end
		end
		local IsUserIdMatch: boolean = LocalPlayer and (TextChatMessage.TextSource and TextChatMessage.TextSource.UserId == LocalPlayer.UserId)
		local NoExpChatOnlyWakeTextForSelectedTab = not ExpChatOnlyWakeTextForSelectedTab or IsMessageForOpenChannelModule(StoreModule:getState(), TextChatMessage, ChannelNameOverride)
		MessagesStoreModule.handleIncomingOrOutgoingMessage(TextChatMessage, IsUserIdMatch, ChannelNameOverride, IsUniverseChat)
		
		if NoExpChatOnlyWakeTextForSelectedTab then
			GetTransparencyStoreModule(false).resetTextTransparency()
		end
		if FFlagExpChatUseChannelTabsStore and ChannelTabsStoreModule then
			ChannelTabsStoreModule.handleIncomingOrOutgoingMessage(TextChatMessage, IsUserIdMatch, ChannelNameOverride)
		elseif FFlagExpChatUnreadTabIndicatorV2WindowModule then
			StoreModule:dispatch(MarkChannelUnreadForIncomingMessageModule(TextChatMessage, IsUserIdMatch, ChannelNameOverride, IsUniverseChat))
		end
		local Entry = config3[TextChatMessage.Status]
		
		if Entry then
			local Success, Result = pcall(function()
				-- upvalues: JoinResult (upval), Entry (copy)
				return JoinResult.translator:FormatByKey(Entry.key)
			end)
			
			if Success then
				Success = Result and Result ~= ""
			end
			if ChannelNameOverride and Success then
				MessagesStoreModule.addSystemMessage(Result, ChannelNameOverride, if GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction() then Entry.metadata else nil)
				
				if FFlagExpChatUseChannelTabsStore and ChannelTabsStoreModule and (not GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction() or not ShouldSuppressUnreadForTabMetadataModule(Entry.metadata)) then
					ChannelTabsStoreModule.markChannelUnread(ChannelNameOverride)
				elseif FFlagExpChatUnreadTabIndicatorV2WindowModule then
					StoreModule:dispatch(MarkChannelUnreadForSystemMessageModule(Result, ChannelNameOverride, if GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction() then Entry.metadata else nil))
				end
			else
				local DefaultSystemTextChannel = JoinResult.defaultSystemTextChannel
				
				if ChannelNameOverride then
					local ChannelNameOverride1 = TextChatService:FindFirstChild(ChannelNameOverride)
					
					if ChannelNameOverride1 and ChannelNameOverride1:IsA("TextChannel") then
						DefaultSystemTextChannel = ChannelNameOverride1
					end
				end
				DisplaySystemMessageModule(Entry.key, nil, Entry.metadata, JoinResult.translator, DefaultSystemTextChannel)
			end
		end
		if ShouldSendHighFrequencyTelemetryModule(ExpChatMessageResponseUserSamplePermyriad) then
			Analytics:TelemetryLogEvent(config, { messageStatus = TextChatMessage.Status.Name }, {
				"addOsInfo",
				"addSessionId",
				"addUniverseId",
				"addPlaceId"
			})
		end
	end
	
	local _ = function(p2, ChildName)
		-- upvalues: _processIncomingMessageCore (copy)
		_processIncomingMessageCore(p2, ChildName, nil)
	end
	
	local _ = function(p2, p3)
		-- upvalues: _processIncomingMessageCore (copy)
		_processIncomingMessageCore(p2, p3 and p3.channelNameOverride, p3 and p3.isUniverseChat)
	end
	
	local function handleMessageReceived(p2)
		-- upvalues: StoreModule (copy), TextChannelCreatedFunction (upval), TextChatService (upval), GetNameColorModule (upval), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), NewResult (upval), Players (upval), ExpChatRemoveSpaceFromTeamPrefix (upval), LocalPlayer (copy), GetOtherDisplayNameInWhisperChannelModule (upval), JoinResult (ref), ShouldSkipHistoricalMessageModule (upval), FFlagExpChatDictationContinuousSafetyReminder (upval), DictationSafetyReminderModule (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), _processIncomingMessageCore (copy), ExpChatPerfTracker (upval), FFlagExpChatPerfTrackerTabName (upval), SelectSelectedTabNameModule (upval), ReportMessageReceivedModule (upval), HandleChannelWelcomeMessageModule (upval), showWelcomeSystemMessage (copy), MessagesStoreModule (copy), GetTransparencyStoreModule (upval), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (copy), FFlagExpChatUnreadTabIndicatorV2WindowModule (upval), MarkChannelUnreadForIncomingMessageModule (upval), DisplaySystemMessageModule (upval), ShouldSendHighFrequencyTelemetryModule (upval), ExpChatMessageResponseUserSamplePermyriad (upval), Analytics (upval), config (upval)
		StoreModule:dispatch(TextChannelCreatedFunction(p2))
		local Enabled = false
		local ChannelTabsConfiguration = TextChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
		
		if ChannelTabsConfiguration then
			Enabled = ChannelTabsConfiguration.Enabled
		end
		if string.find(p2.Name, "RBXGeneral") then
			function p2.OnIncomingMessage(TextChatMessage)
				-- upvalues: GetNameColorModule (upval), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval)
				local TextChatMessageProperties = Instance.new("TextChatMessageProperties")
				
				if TextChatMessage.TextSource then
					local NameColorModule = GetNameColorModule(TextChatMessage.TextSource.UserId)
					
					if not TextChatMessage.ChatWindowMessageProperties then
						TextChatMessageProperties.PrefixText = string.format("<font color=\"#%s\">%s</font>", NameColorModule:ToHex(), if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.PrefixTextInternal else TextChatMessage.PrefixText)
					end
				end
				return TextChatMessageProperties
			end
		elseif string.find(p2.Name, "^RBXTeam") then
			function p2.OnIncomingMessage(TextChatMessage)
				-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), NewResult (upval), Players (upval), ExpChatRemoveSpaceFromTeamPrefix (upval), Enabled (ref)
				local PrefixTextInternal = if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.PrefixTextInternal else TextChatMessage.PrefixText
				
				if GetFFlagExpChatProtectedChatInternalAPIsFunction() then
					NewResult:trace("Team OnIncomingMessage started: PrefixTextInternal: {} TextInternal: {}", PrefixTextInternal, TextChatMessage.TextInternal)
				else
					NewResult:trace("Team OnIncomingMessage started: {} {}", PrefixTextInternal, TextChatMessage.Text)
				end
				local TextChatMessageProperties = Instance.new("TextChatMessageProperties")
				
				if Players.LocalPlayer then
					TextChatMessageProperties.PrefixText = string.format("<font color=\"#%s\">%s%s</font>", Players.LocalPlayer.TeamColor.Color:ToHex(), if ExpChatRemoveSpaceFromTeamPrefix then if Enabled then "" elseif #(PrefixTextInternal or "") > 0 then "[Team] " else "[Team]" elseif Enabled then "" else "[Team] ", PrefixTextInternal)
				end
				NewResult:trace("Team OnIncomingMessage finished: {} {}", TextChatMessageProperties.PrefixText, TextChatMessageProperties.Text)
				
				return TextChatMessageProperties
			end
		elseif string.find(p2.Name, "^RBXWhisper") and LocalPlayer then
			function p2.OnIncomingMessage(TextChatMessage)
				-- upvalues: GetOtherDisplayNameInWhisperChannelModule (upval), p2 (copy), LocalPlayer (upval), Enabled (ref), JoinResult (upval), GetNameColorModule (upval), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval)
				local TextSource = TextChatMessage.TextSource
				
				if TextSource then
					local OtherDisplayNameInWhisperChannelModule = GetOtherDisplayNameInWhisperChannelModule(p2, LocalPlayer)
					
					if OtherDisplayNameInWhisperChannelModule then
						local CoreScriptsTextChatWhisperChatPrefixTextOutgoing = if Enabled then nil elseif TextSource.UserId == LocalPlayer.UserId then JoinResult.translator:FormatByKey("CoreScripts.TextChat.WhisperChat.PrefixText.Outgoing", { RBX_NAME = OtherDisplayNameInWhisperChannelModule }) else JoinResult.translator:FormatByKey("CoreScripts.TextChat.WhisperChat.PrefixText.Incoming", { RBX_NAME = OtherDisplayNameInWhisperChannelModule })
						local TextChatMessageProperties = Instance.new("TextChatMessageProperties")
						TextChatMessageProperties.PrefixText = string.format("%s<font color=\"#%s\">%s</font>", if CoreScriptsTextChatWhisperChatPrefixTextOutgoing then CoreScriptsTextChatWhisperChatPrefixTextOutgoing .. " " else "", GetNameColorModule(TextSource.UserId):ToHex(), if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.PrefixTextInternal else TextChatMessage.PrefixText)
						
						return TextChatMessageProperties
					end
				end
				return nil
			end
		end
		p2.MessageReceived:Connect(function(TextChatMessage)
			-- upvalues: ShouldSkipHistoricalMessageModule (upval), FFlagExpChatDictationContinuousSafetyReminder (upval), DictationSafetyReminderModule (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), _processIncomingMessageCore (upval), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), NewResult (upval), LocalPlayer (upval), ExpChatPerfTracker (upval), FFlagExpChatPerfTrackerTabName (upval), SelectSelectedTabNameModule (upval), StoreModule (upval), ReportMessageReceivedModule (upval), HandleChannelWelcomeMessageModule (upval), showWelcomeSystemMessage (upval), MessagesStoreModule (upval), GetTransparencyStoreModule (upval), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (upval), FFlagExpChatUnreadTabIndicatorV2WindowModule (upval), MarkChannelUnreadForIncomingMessageModule (upval), DisplaySystemMessageModule (upval), JoinResult (upval), ShouldSendHighFrequencyTelemetryModule (upval), ExpChatMessageResponseUserSamplePermyriad (upval), Analytics (upval), config (upval)
			if ShouldSkipHistoricalMessageModule(TextChatMessage) then return end
			if FFlagExpChatDictationContinuousSafetyReminder then
				DictationSafetyReminderModule.onIncomingMessage(TextChatMessage)
			end
			if GetFFlagTextChatEnableUniverseChatTabsFunction() then
				_processIncomingMessageCore(TextChatMessage, nil, nil)
				
				return
			end
			if GetFFlagExpChatProtectedChatInternalAPIsFunction() then
				NewResult:debug("Incoming MessageReceived Status: {} TextInternal: {}", TextChatMessage.Status.Name, TextChatMessage.TextInternal)
			else
				NewResult:debug("Incoming MessageReceived Status: {} Text: {}", TextChatMessage.Status.Name, TextChatMessage.Text)
			end
			if (TextChatMessage.TextSource and TextChatMessage.TextSource.UserId or "UNKNOWN_TEXT_SOURCE_USER_ID") ~= (LocalPlayer and LocalPlayer.UserId or "UNKNOWN_LOCAL_USER_ID") then
				ExpChatPerfTracker.start(ExpChatPerfTracker.Events.MessageReceiveToWindowRenderInterval, { messageId = TextChatMessage.MessageId }, if FFlagExpChatPerfTrackerTabName then {
					tabName = SelectSelectedTabNameModule(StoreModule:getState())
				} else nil)
			end
			if LocalPlayer then
				ReportMessageReceivedModule(LocalPlayer.UserId, TextChatMessage)
			end
			if LocalPlayer and TextChatMessage.TextSource and TextChatMessage.TextSource.UserId ~= LocalPlayer.UserId then
				local HandleChannelWelcomeMessageModuleResult = HandleChannelWelcomeMessageModule(TextChatMessage, LocalPlayer)
				
				if HandleChannelWelcomeMessageModuleResult then
					showWelcomeSystemMessage(HandleChannelWelcomeMessageModuleResult, TextChatMessage.TextChannel)
				end
			end
			local IsUserIdMatch: boolean = LocalPlayer and (TextChatMessage.TextSource and TextChatMessage.TextSource.UserId == LocalPlayer.UserId)
			MessagesStoreModule.handleIncomingOrOutgoingMessage(TextChatMessage, IsUserIdMatch)
			GetTransparencyStoreModule(false).resetTextTransparency()
			
			if FFlagExpChatUseChannelTabsStore and ChannelTabsStoreModule then
				ChannelTabsStoreModule.handleIncomingOrOutgoingMessage(TextChatMessage, IsUserIdMatch)
			elseif FFlagExpChatUnreadTabIndicatorV2WindowModule then
				StoreModule:dispatch(MarkChannelUnreadForIncomingMessageModule(TextChatMessage, IsUserIdMatch))
			end
			if TextChatMessage.Status == Enum.TextChatMessageStatus.Floodchecked then
				DisplaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.Floodchecked", nil, "Roblox.MessageStatus.Warning.Floodchecked", JoinResult.translator, JoinResult.defaultSystemTextChannel)
			elseif TextChatMessage.Status == Enum.TextChatMessageStatus.TextFilterFailed then
				DisplaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.TextFilterFailed", nil, "Roblox.MessageStatus.Warning.TextFilterFailed", JoinResult.translator, JoinResult.defaultSystemTextChannel)
			elseif TextChatMessage.Status == Enum.TextChatMessageStatus.InvalidPrivacySettings then
				DisplaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.InvalidPrivacySettings", nil, "Roblox.MessageStatus.Warning.InvalidPrivacySettings", JoinResult.translator, JoinResult.defaultSystemTextChannel)
			elseif TextChatMessage.Status == Enum.TextChatMessageStatus.MessageTooLong then
				DisplaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.MessageTooLong", nil, "Roblox.MessageStatus.Warning.MessageTooLong", JoinResult.translator, JoinResult.defaultSystemTextChannel)
			elseif TextChatMessage.Status == Enum.TextChatMessageStatus.ModerationTimeout then
				DisplaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.ModerationTimeout", nil, "Roblox.MessageStatus.Warning.ModerationTimeout", JoinResult.translator, JoinResult.defaultSystemTextChannel)
			elseif TextChatMessage.Status == Enum.TextChatMessageStatus.Unknown then
				DisplaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.Unknown", nil, "Roblox.MessageStatus.Warning.Unknown", JoinResult.translator, JoinResult.defaultSystemTextChannel)
			end
			if ShouldSendHighFrequencyTelemetryModule(ExpChatMessageResponseUserSamplePermyriad) then
				Analytics:TelemetryLogEvent(config, { messageStatus = TextChatMessage.Status.Name }, {
					"addOsInfo",
					"addSessionId",
					"addUniverseId",
					"addPlaceId"
				})
			end
		end)
	end
	
	local _ = function(Prompt)
		-- upvalues: Analytics (upval)
		Prompt.Triggered:Connect(function()
			-- upvalues: Analytics (upval), Prompt (copy)
			Analytics.FireClientAnalyticsWithEventName("CommandSent", { commandName = Prompt.Name })
		end)
	end
	
	for _, descendant in pairs(TextChatService:GetDescendants()) do
		if descendant:IsA("TextChannel") then
			handleMessageReceived(descendant)
		elseif descendant:IsA("TextChatCommand") then
			descendant.Triggered:Connect(function()
				-- upvalues: Analytics (upval), descendant (copy)
				Analytics.FireClientAnalyticsWithEventName("CommandSent", { commandName = descendant.Name })
			end)
		end
	end
	local IsEnabled = false
	local Flag = false
	local t = {}
	local Flag1 = false
	
	local _ = function()
		-- upvalues: ExpChatNewSystemMessagesExperimentation (upval), Flag1 (ref)
		if ExpChatNewSystemMessagesExperimentation.isExperimentEnabled and not Flag1 then
			Flag1 = true
			ExpChatNewSystemMessagesExperimentation.logExposure()
			
			return
		end
	end
	
	local function postProcessSummarySystemMessage(p2)
		-- upvalues: SummaryMessageRichTextModule (upval)
		return SummaryMessageRichTextModule.wrapInSummaryMutedStyle(`{SummaryMessageRichTextModule.getSummaryIconPrefix()} {p2}`)
	end
	
	local function tryShowSummarySystemMessageOnChannel(TextChannel)
		-- upvalues: IsEnabled (ref), t (copy), ExpChatNewSystemMessagesExperimentation (upval), Flag1 (ref), HasMessagesStoreModule (copy), JoinResult (ref), WriteVirtualSystemMessageModule (upval), config2 (copy), postProcessSummarySystemMessage (copy), DisplaySystemMessageModule (upval)
		if not TextChannel then return end
		if not IsEnabled then return end
		if t[TextChannel.Name] then return end
		if TextChannel.Name ~= "RBXGeneral" then return end
		t[TextChannel.Name] = true
		
		if ExpChatNewSystemMessagesExperimentation.isExperimentEnabled and ExpChatNewSystemMessagesExperimentation.isExperimentEnabled and not Flag1 then
			Flag1 = true
			ExpChatNewSystemMessagesExperimentation.logExposure()
		end
		if not HasMessagesStoreModule then
			DisplaySystemMessageModule(if ExpChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "CoreScripts.TextChat.Description.RobloxSummarizesMessagesFromAllPlayers" else "CoreScripts.TextChat.ChatWindow.SummarySystemMessage", nil, "Roblox.Summary.Info", JoinResult.translator, TextChannel, if ExpChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "Roblox summarizes messages from players of all ages." else "Roblox auto-generates summaries of players' messages.", postProcessSummarySystemMessage)
			
			return
		end
		local NewSystemMessagesEnabled = ExpChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled()
		local CoreScriptsTextChatDescriptionRobloxSummarizesMessagesFromAllPlayers: string = if NewSystemMessagesEnabled then "CoreScripts.TextChat.Description.RobloxSummarizesMessagesFromAllPlayers" else "CoreScripts.TextChat.ChatWindow.SummarySystemMessage"
		local RobloxSummarizesMessagesFromPlayersOfAllAges: string = if NewSystemMessagesEnabled then "Roblox summarizes messages from players of all ages." else "Roblox auto-generates summaries of players' messages."
		local Success, Result = pcall(function()
			-- upvalues: JoinResult (upval), CoreScriptsTextChatDescriptionRobloxSummarizesMessagesFromAllPlayers (copy)
			return JoinResult.translator:FormatByKey(CoreScriptsTextChatDescriptionRobloxSummarizesMessagesFromAllPlayers)
		end)
		
		if not Success or type(Result) ~= "string" or Result == "" then
			Result = RobloxSummarizesMessagesFromPlayersOfAllAges
		end
		WriteVirtualSystemMessageModule(config2, {
			metadata = "Roblox.Summary.Info",
			text = Result,
			channelName = TextChannel.Name,
			postProcessMessage = postProcessSummarySystemMessage,
			textChannel = TextChannel
		})
	end
	
	local function tryAddThirdPartySummaryGlobalSystemMessage()
		-- upvalues: Flag (ref), IsEnabled (ref), FFlagExpChatEnableGlobalChatSummarySystemMessageModule (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), TextChatService (upval), JoinResult (ref), ExpChatSuppressGlobalSummaryTabUnread (upval), MessagesStoreModule (copy), postProcessSummarySystemMessage (copy)
		if not Flag and IsEnabled and FFlagExpChatEnableGlobalChatSummarySystemMessageModule and GetFFlagTextChatEnableUniverseChatTabsFunction() and TextChatService:HasAllocatedUniverseChatContext("global") then
			Flag = true
			MessagesStoreModule.addSystemMessage(JoinResult.translator:FormatByKey("CoreScripts.TextChat.ChatWindow.SummarySystemMessage"), "RBXGlobal", if ExpChatSuppressGlobalSummaryTabUnread then "Roblox.Summary.GlobalChat" else nil, postProcessSummarySystemMessage)
			
			return
		end
	end
	
	TextChatService.DescendantAdded:Connect(function(Descendant)
		-- upvalues: handleMessageReceived (copy), FFlagEnableInExpChatSummaryOnLuaModule (upval), FFlagEnableClientSummarySystemMessageOnLua (upval), tryShowSummarySystemMessageOnChannel (copy), Analytics (upval)
		if Descendant:IsA("TextChannel") then
			handleMessageReceived(Descendant)
			
			if FFlagEnableInExpChatSummaryOnLuaModule and FFlagEnableClientSummarySystemMessageOnLua then
				tryShowSummarySystemMessageOnChannel(Descendant)
				
				return
			end
		elseif Descendant:IsA("TextChatCommand") then
			Descendant.Triggered:Connect(function()
				-- upvalues: Analytics (upval), Descendant (copy)
				Analytics.FireClientAnalyticsWithEventName("CommandSent", { commandName = Descendant.Name })
			end)
		end
	end)
	TextChatService.DescendantRemoving:Connect(function(Descendant)
		-- upvalues: StoreModule (copy), TextChannelRemovedFunction (upval), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (copy)
		if Descendant:IsA("TextChannel") then
			StoreModule:dispatch(TextChannelRemovedFunction(Descendant))
			
			if FFlagExpChatUseChannelTabsStore and ChannelTabsStoreModule then
				ChannelTabsStoreModule.handleChannelRemoved(Descendant.Name)
			end
		end
	end)
	
	if FFlagEnableInExpChatSummaryOnLuaModule then
		TextChatService.ChatActionReceived:Connect(function(ChatActionMessage)
			-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), NewResult (upval), TextChatMessageChatActionTypeModule (upval), FFlagEnableGlobalChat3pSummaryLuaAppsModule (upval), _processIncomingMessageCore (copy)
			if GetFFlagExpChatProtectedChatInternalAPIsFunction() then
				NewResult:debug("Incoming ChatActionReceived ChatActionType: {}, TextInternal: {}", ChatActionMessage.ChatActionType, ChatActionMessage.TextInternal)
			else
				NewResult:debug("Incoming ChatActionReceived ChatActionType: {}, Text: {}", ChatActionMessage.ChatActionType, ChatActionMessage.Text)
			end
			if ChatActionMessage.ChatActionType ~= TextChatMessageChatActionTypeModule.Summary then
				NewResult:error("Unknown ChatActionType: {}", ChatActionMessage.ChatActionType)
				
				return
			end
			if FFlagEnableGlobalChat3pSummaryLuaAppsModule then
				local Config = if ChatActionMessage.TextChannel == nil then { channelNameOverride = "RBXGlobal", isUniverseChat = true } else nil
				_processIncomingMessageCore(ChatActionMessage, Config and Config.channelNameOverride, Config and Config.isUniverseChat)
				
				return
			else
				_processIncomingMessageCore(ChatActionMessage, nil, nil)
			end
		end)
	end
	if FFlagEnableInExpChatSummaryOnLuaModule or FFlagAIRephraseSettingEnabled or FFlagChatSummariesSettingEnabled then
		coroutine.wrap(function()
			-- upvalues: RobloxReplicatedStorage (upval), NewResult (upval), LocalPlayer (copy), FFlagEnableClientSummarySystemMessageOnLua (upval), FFlagChatSummariesSettingEnabled (upval), IsEnabled (ref), TextChatService (upval), tryShowSummarySystemMessageOnChannel (copy), tryAddThirdPartySummaryGlobalSystemMessage (copy), FFlagAIRephraseSettingEnabled (upval), GetUserChatSettingsStoreModule (upval)
			local ExpChatFeatureValueChanged = RobloxReplicatedStorage:WaitForChild("ExpChatFeatureValueChanged", 10)
			
			if ExpChatFeatureValueChanged then
				ExpChatFeatureValueChanged.OnClientEvent:Connect(function(UserId, p2, p3)
					-- upvalues: NewResult (upval), LocalPlayer (upval), FFlagEnableClientSummarySystemMessageOnLua (upval), FFlagChatSummariesSettingEnabled (upval), IsEnabled (upval), TextChatService (upval), tryShowSummarySystemMessageOnChannel (upval), tryAddThirdPartySummaryGlobalSystemMessage (upval), FFlagAIRephraseSettingEnabled (upval), GetUserChatSettingsStoreModule (upval)
					NewResult:debug("Incoming ExpChatFeatureValueChanged userId: {}, featureName: {}, featureValue: {}", UserId, p2, p3)
					
					if LocalPlayer and UserId == LocalPlayer.UserId then
						if FFlagEnableClientSummarySystemMessageOnLua and p2 == "EligibleForThirdPartySummary" and not FFlagChatSummariesSettingEnabled then
							IsEnabled = p3 == "true"
							
							if IsEnabled then
								for _, TextChannel in TextChatService:GetDescendants() do
									if TextChannel:IsA("TextChannel") then
										tryShowSummarySystemMessageOnChannel(TextChannel)
									end
								end
								tryAddThirdPartySummaryGlobalSystemMessage()
							end
						end
						if FFlagAIRephraseSettingEnabled and p2 == "AIRephraseSettingStatus" then
							GetUserChatSettingsStoreModule.updateExpChatFeatureValue(p2, p3)
						end
						if FFlagChatSummariesSettingEnabled and p2 == "AllowThirdPartySummary" then
							GetUserChatSettingsStoreModule.updateExpChatFeatureValue(p2, p3)
							IsEnabled = p3 == "Enabled"
							
							if IsEnabled then
								for _, TextChannel1 in TextChatService:GetDescendants() do
									if TextChannel1:IsA("TextChannel") then
										tryShowSummarySystemMessageOnChannel(TextChannel1)
									end
								end
								tryAddThirdPartySummaryGlobalSystemMessage()
							end
						end
					end
				end)
			end
		end)()
	end
	local function markChannelsUnreadForKeptHistory(p2)
		-- upvalues: MessagesStoreModule (copy), GetChannelsWithKeptHistoryModule (upval), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (copy), FFlagExpChatUnreadTabIndicatorV2WindowModule (upval), StoreModule (copy), MarkChannelUnreadForIncomingMessageModule (upval)
		local GetHistoricalWindowMessageCountFunction = MessagesStoreModule.getHistoricalWindowMessageCount
		local HistoricalWindowMessageCount = if GetHistoricalWindowMessageCountFunction then GetHistoricalWindowMessageCountFunction(false) else 0
		for i, value in GetChannelsWithKeptHistoryModule(p2, HistoricalWindowMessageCount) do
			if FFlagExpChatUseChannelTabsStore and ChannelTabsStoreModule then
				ChannelTabsStoreModule.markChannelUnread(i)
			elseif FFlagExpChatUnreadTabIndicatorV2WindowModule then
				StoreModule:dispatch(MarkChannelUnreadForIncomingMessageModule(value, false))
			end
		end
	end
	
	if FFlagExpChatRenderHistoricalMessages then
		WhenFirstTrueModule(MessagesStoreModule.getCanLocalUserChat, function()
			-- upvalues: ConnectHistoryReplayModule (upval), MessagesStoreModule (copy), LocalPlayer (copy), FFlagExpChatHistoricalMessagesUnibarUnread (upval), markChannelsUnreadForKeptHistory (copy)
			ConnectHistoryReplayModule(function(p3)
				-- upvalues: MessagesStoreModule (upval), LocalPlayer (upval), FFlagExpChatHistoricalMessagesUnibarUnread (upval), markChannelsUnreadForKeptHistory (upval)
				MessagesStoreModule.batchWrites(function()
					-- upvalues: p3 (copy), LocalPlayer (upval), MessagesStoreModule (upval)
					for _, value in p3 do
						MessagesStoreModule.handleIncomingOrOutgoingMessage(value, LocalPlayer ~= nil and (value.TextSource ~= nil and value.TextSource.UserId == LocalPlayer.UserId), nil, nil, true)
					end
				end)
				
				if FFlagExpChatHistoricalMessagesUnibarUnread then
					markChannelsUnreadForKeptHistory(p3)
				end
			end)
		end)
	end
	TextChatService.SendingMessage:Connect(function(TextChatMessage)
		-- upvalues: FFlagExpChatDictationContinuousSafetyReminder (upval), DictationSafetyReminderModule (upval), ExpChatPerfTracker (upval), FFlagExpChatPerfTrackerTabName (upval), SelectSelectedTabNameModule (upval), StoreModule (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), NewResult (upval), LocalPlayer (copy), HandleChannelWelcomeMessageModule (upval), showWelcomeSystemMessage (copy), MessagesStoreModule (copy), Analytics (upval), CountParticipantsInTextChannelFunction (upval)
		if FFlagExpChatDictationContinuousSafetyReminder then
			DictationSafetyReminderModule.onOutgoingMessage(TextChatMessage)
		end
		ExpChatPerfTracker.start(ExpChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = TextChatMessage.MessageId }, if FFlagExpChatPerfTrackerTabName then {
			tabName = SelectSelectedTabNameModule(StoreModule:getState())
		} else nil)
		
		if GetFFlagExpChatProtectedChatInternalAPIsFunction() then
			NewResult:debug("Outgoing SendingMessage Status: {} TextInternal: {}", TextChatMessage.Status.Name, TextChatMessage.TextInternal)
		else
			NewResult:debug("Outgoing SendingMessage Status: {} Text: {}", TextChatMessage.Status.Name, TextChatMessage.Text)
		end
		if LocalPlayer then
			local HandleChannelWelcomeMessageModuleResult = HandleChannelWelcomeMessageModule(TextChatMessage, LocalPlayer)
			
			if HandleChannelWelcomeMessageModuleResult and HandleChannelWelcomeMessageModuleResult.key then
				showWelcomeSystemMessage(HandleChannelWelcomeMessageModuleResult, TextChatMessage.TextChannel)
			end
		end
		MessagesStoreModule.handleIncomingOrOutgoingMessage(TextChatMessage, true)
		local TextChannel = TextChatMessage.TextChannel
		
		if TextChannel then
			Analytics.FireClientAnalyticsWithEventName("MessageSent", {
				channelName = TextChannel.Name,
				totalParticipants = CountParticipantsInTextChannelFunction(TextChannel)
			})
		end
	end)
	
	local _ = function()
		-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (upval), TextChatService (upval), FFlagExpChatDictationContinuousSafetyReminder (upval), DictationSafetyReminderModule (upval), ExpChatPerfTracker (upval), FFlagExpChatPerfTrackerTabName (upval), SelectSelectedTabNameModule (upval), StoreModule (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), NewResult (upval), LocalPlayer (copy), HandleChannelWelcomeMessageModule (upval), showWelcomeSystemMessage (copy), FFlagExpChatGlobalTabDefaultModule (upval), MessagesStoreModule (copy), FFlagExpChatFixOutgoingUniverseChatBubbleModule (upval), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (copy), Analytics (upval), CountParticipantsInTextChannelFunction (upval)
		if GetFFlagTextChatEnableUniverseChatTabsFunction() then
			TextChatService.SendingUniverseChatMessage:Connect(function(TextChatMessage)
				-- upvalues: FFlagExpChatDictationContinuousSafetyReminder (upval), DictationSafetyReminderModule (upval), ExpChatPerfTracker (upval), FFlagExpChatPerfTrackerTabName (upval), SelectSelectedTabNameModule (upval), StoreModule (upval), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), NewResult (upval), LocalPlayer (upval), HandleChannelWelcomeMessageModule (upval), showWelcomeSystemMessage (upval), TextChatService (upval), FFlagExpChatGlobalTabDefaultModule (upval), MessagesStoreModule (upval), FFlagExpChatFixOutgoingUniverseChatBubbleModule (upval), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (upval), Analytics (upval), CountParticipantsInTextChannelFunction (upval)
				if FFlagExpChatDictationContinuousSafetyReminder then
					DictationSafetyReminderModule.onOutgoingMessage(TextChatMessage)
				end
				ExpChatPerfTracker.start(ExpChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = TextChatMessage.MessageId }, if FFlagExpChatPerfTrackerTabName then {
					tabName = SelectSelectedTabNameModule(StoreModule:getState())
				} else nil)
				
				if GetFFlagExpChatProtectedChatInternalAPIsFunction() then
					NewResult:debug("Outgoing SendingMessage Status: {} TextInternal: {}", TextChatMessage.Status.Name, TextChatMessage.TextInternal)
				else
					NewResult:debug("Outgoing SendingMessage Status: {} Text: {}", TextChatMessage.Status.Name, TextChatMessage.Text)
				end
				if LocalPlayer then
					local HandleChannelWelcomeMessageModuleResult = HandleChannelWelcomeMessageModule(TextChatMessage, LocalPlayer)
					
					if HandleChannelWelcomeMessageModuleResult and HandleChannelWelcomeMessageModuleResult.key then
						showWelcomeSystemMessage(HandleChannelWelcomeMessageModuleResult, TextChatMessage.TextChannel)
					end
				end
				local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
				local TargetTextChannel = ChatInputBarConfiguration and ChatInputBarConfiguration.TargetTextChannel
				local RBXGlobal = if FFlagExpChatGlobalTabDefaultModule and SelectSelectedTabNameModule(StoreModule:getState()) == "RBXGlobal" then "RBXGlobal" elseif TargetTextChannel then nil else "RBXGlobal"
				MessagesStoreModule.handleIncomingOrOutgoingMessage(TextChatMessage, true, RBXGlobal, if FFlagExpChatFixOutgoingUniverseChatBubbleModule then true else nil)
				
				if FFlagExpChatUseChannelTabsStore and ChannelTabsStoreModule then
					ChannelTabsStoreModule.handleIncomingOrOutgoingMessage(TextChatMessage, true, RBXGlobal)
				end
				local TextChannel = TextChatMessage.TextChannel
				
				if TextChannel then
					Analytics.FireClientAnalyticsWithEventName("MessageSent", {
						channelName = TextChannel.Name,
						totalParticipants = CountParticipantsInTextChannelFunction(TextChannel)
					})
				end
			end)
			
			return
		end
	end
	
	if GetFFlagTextChatEnableUniverseChatTabsFunction() then
		TextChatService.SendingUniverseChatMessage:Connect(function(TextChatMessage)
			-- upvalues: FFlagExpChatDictationContinuousSafetyReminder (upval), DictationSafetyReminderModule (upval), ExpChatPerfTracker (upval), FFlagExpChatPerfTrackerTabName (upval), SelectSelectedTabNameModule (upval), StoreModule (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), NewResult (upval), LocalPlayer (copy), HandleChannelWelcomeMessageModule (upval), showWelcomeSystemMessage (copy), TextChatService (upval), FFlagExpChatGlobalTabDefaultModule (upval), MessagesStoreModule (copy), FFlagExpChatFixOutgoingUniverseChatBubbleModule (upval), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (copy), Analytics (upval), CountParticipantsInTextChannelFunction (upval)
			if FFlagExpChatDictationContinuousSafetyReminder then
				DictationSafetyReminderModule.onOutgoingMessage(TextChatMessage)
			end
			ExpChatPerfTracker.start(ExpChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = TextChatMessage.MessageId }, if FFlagExpChatPerfTrackerTabName then {
				tabName = SelectSelectedTabNameModule(StoreModule:getState())
			} else nil)
			
			if GetFFlagExpChatProtectedChatInternalAPIsFunction() then
				NewResult:debug("Outgoing SendingMessage Status: {} TextInternal: {}", TextChatMessage.Status.Name, TextChatMessage.TextInternal)
			else
				NewResult:debug("Outgoing SendingMessage Status: {} Text: {}", TextChatMessage.Status.Name, TextChatMessage.Text)
			end
			if LocalPlayer then
				local HandleChannelWelcomeMessageModuleResult = HandleChannelWelcomeMessageModule(TextChatMessage, LocalPlayer)
				
				if HandleChannelWelcomeMessageModuleResult and HandleChannelWelcomeMessageModuleResult.key then
					showWelcomeSystemMessage(HandleChannelWelcomeMessageModuleResult, TextChatMessage.TextChannel)
				end
			end
			local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			local TargetTextChannel = ChatInputBarConfiguration and ChatInputBarConfiguration.TargetTextChannel
			local RBXGlobal = if FFlagExpChatGlobalTabDefaultModule and SelectSelectedTabNameModule(StoreModule:getState()) == "RBXGlobal" then "RBXGlobal" elseif TargetTextChannel then nil else "RBXGlobal"
			MessagesStoreModule.handleIncomingOrOutgoingMessage(TextChatMessage, true, RBXGlobal, if FFlagExpChatFixOutgoingUniverseChatBubbleModule then true else nil)
			
			if FFlagExpChatUseChannelTabsStore and ChannelTabsStoreModule then
				ChannelTabsStoreModule.handleIncomingOrOutgoingMessage(TextChatMessage, true, RBXGlobal)
			end
			local TextChannel = TextChatMessage.TextChannel
			
			if TextChannel then
				Analytics.FireClientAnalyticsWithEventName("MessageSent", {
					channelName = TextChannel.Name,
					totalParticipants = CountParticipantsInTextChannelFunction(TextChannel)
				})
			end
		end)
	end
	local _ = function(TextSource): boolean
		-- upvalues: Players (upval)
		return TextSource and (TextSource:IsA("TextSource") and (Players.LocalPlayer and Players.LocalPlayer.UserId == TextSource.UserId))
	end
	
	local _ = function(p3): number
		return if p3 == "RBXGeneral" then 1 elseif p3 == "RBXGlobal" then 2 else 3
	end
	
	for _, descendant1 in pairs(TextChatService:GetDescendants()) do
		if descendant1.Parent and descendant1.Parent:IsA("TextChannel") and (descendant1 and (descendant1:IsA("TextSource") and (Players.LocalPlayer and Players.LocalPlayer.UserId == descendant1.UserId))) then
			if FFlagExpChatUseChannelTabsStore and ChannelTabsStoreModule then
				ChannelTabsStoreModule.handleLocalTextChannelParticipantAdded(descendant1.Parent)
			else
				StoreModule:dispatch(LocalTextChannelParticipantAddedModule(descendant1.Parent))
			end
		end
		if descendant1:IsA("TextChannel") then
			descendant1.DescendantRemoving:Connect(function(Descendant)
				-- upvalues: Players (upval), StoreModule (copy), LocalTextChannelParticipantRemovedFunction (upval), descendant1 (copy), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (copy)
				if Descendant and (Descendant:IsA("TextSource") and (Players.LocalPlayer and Players.LocalPlayer.UserId == Descendant.UserId)) then
					StoreModule:dispatch(LocalTextChannelParticipantRemovedFunction(descendant1))
					
					if FFlagExpChatUseChannelTabsStore and ChannelTabsStoreModule then
						ChannelTabsStoreModule.handleChannelRemoved(descendant1.Name)
					end
				end
			end)
		end
	end
	TextChatService.DescendantAdded:Connect(function(Descendant)
		-- upvalues: Players (upval), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (copy), StoreModule (copy), LocalTextChannelParticipantAddedModule (upval), LocalTextChannelParticipantRemovedFunction (upval)
		if Descendant.Parent and Descendant.Parent:IsA("TextChannel") and (Descendant and (Descendant:IsA("TextSource") and (Players.LocalPlayer and Players.LocalPlayer.UserId == Descendant.UserId))) then
			if FFlagExpChatUseChannelTabsStore and ChannelTabsStoreModule then
				ChannelTabsStoreModule.handleLocalTextChannelParticipantAdded(Descendant.Parent)
			else
				StoreModule:dispatch(LocalTextChannelParticipantAddedModule(Descendant.Parent))
			end
		end
		if Descendant:IsA("TextChannel") then
			Descendant.DescendantRemoving:Connect(function(Descendant1)
				-- upvalues: Players (upval), StoreModule (upval), LocalTextChannelParticipantRemovedFunction (upval), Descendant (copy), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (upval)
				if Descendant1 and (Descendant1:IsA("TextSource") and (Players.LocalPlayer and Players.LocalPlayer.UserId == Descendant1.UserId)) then
					StoreModule:dispatch(LocalTextChannelParticipantRemovedFunction(Descendant))
					
					if FFlagExpChatUseChannelTabsStore and ChannelTabsStoreModule then
						ChannelTabsStoreModule.handleChannelRemoved(Descendant.Name)
					end
				end
			end)
		end
	end)
	
	if GetFFlagTextChatEnableUniverseChatTabsFunction() then
		local t1 = {}
		
		local function handleUniverseChatChannelAllocated(Context)
			-- upvalues: t1 (copy), TextChatService (upval), FFlagExpChatUseUnifiedTooltipStore (upval), GetChatTooltipStoreModule (upval), FFlagExpChatGlobalTabDefaultModule (upval), ExpChatGlobalTabDefaultExperimentation (upval), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (copy), StoreModule (copy), UniverseChatChannelAddedModule (upval), IsGlobalTabFirstModule (upval), HasUserSelectedTabModule (upval), UniverseChatChannelSelectedFunction (upval), GetFFlagEnableExpChatUniverseChatTabNamesFunction (upval), JoinResult (ref), GetGlobalWelcomeMessageKeyModule (upval), GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction (upval), MessagesStoreModule (copy), FFlagExpChatUnreadTabIndicatorV2WindowModule (upval), MarkChannelUnreadForSystemMessageModule (upval), tryAddThirdPartySummaryGlobalSystemMessage (copy)
			if t1[Context] then return end
			t1[Context] = true
			local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
			local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			local NoChatInputBarConfiguration: boolean = not ChatInputBarConfiguration or ChatInputBarConfiguration.Enabled ~= false
			
			if ChatWindowConfiguration and ChatWindowConfiguration.Enabled == false or not NoChatInputBarConfiguration then return end
			local Name = ""
			
			if Context == "global" then
				Name = "RBXGlobal"
				
				if FFlagExpChatUseUnifiedTooltipStore then
					GetChatTooltipStoreModule(false).setIsGlobalChatAvailable(true)
				end
				if FFlagExpChatGlobalTabDefaultModule then
					ExpChatGlobalTabDefaultExperimentation.logExposure()
				end
			end
			if FFlagExpChatUseChannelTabsStore and ChannelTabsStoreModule then
				ChannelTabsStoreModule.addChannelTab({ type = "UniverseChat", name = Name }, nil)
			else
				StoreModule:dispatch(UniverseChatChannelAddedModule(Name, if Name == "RBXGeneral" then 1 elseif Name == "RBXGlobal" then 2 else 3))
			end
			if FFlagExpChatGlobalTabDefaultModule and IsGlobalTabFirstModule() and Name == "RBXGlobal" and not HasUserSelectedTabModule(StoreModule) then
				StoreModule:dispatch(UniverseChatChannelSelectedFunction(Name))
				
				if FFlagExpChatUseChannelTabsStore and ChannelTabsStoreModule then
					ChannelTabsStoreModule.setTargetChannel(Name, false)
				end
			end
			if GetFFlagEnableExpChatUniverseChatTabNamesFunction() and Name ~= "" then
				local Success, Result = pcall(function()
					-- upvalues: FFlagExpChatGlobalTabDefaultModule (upval), JoinResult (upval), GetGlobalWelcomeMessageKeyModule (upval)
					return if FFlagExpChatGlobalTabDefaultModule then JoinResult.translator:FormatByKey(GetGlobalWelcomeMessageKeyModule()) else JoinResult.translator:FormatByKey("CoreScripts.TextChat.ChatWindow.ChatEnabled.Global2")
				end)
				
				if Success and Result and Result ~= "" then
					if GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction() then
						MessagesStoreModule.addSystemMessage(Result, Name, "Roblox.Welcome.GlobalChat")
					else
						MessagesStoreModule.addSystemMessage(Result, Name)
					end
					if FFlagExpChatUseChannelTabsStore and ChannelTabsStoreModule and not GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction() then
						ChannelTabsStoreModule.markChannelUnread(Name)
					elseif FFlagExpChatUnreadTabIndicatorV2WindowModule then
						StoreModule:dispatch(MarkChannelUnreadForSystemMessageModule(Result, Name, if GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction() then "Roblox.Welcome.GlobalChat" else nil))
					end
				end
			end
			tryAddThirdPartySummaryGlobalSystemMessage()
		end
		
		if TextChatService:HasAllocatedUniverseChatContext("global") then
			handleUniverseChatChannelAllocated("global")
		end
		TextChatService.UniverseChatChannelAllocated:Connect(handleUniverseChatChannelAllocated)
		TextChatService.UniverseChatMessageReceived:Connect(function(TextChatMessage)
			-- upvalues: FFlagExpChatDictationContinuousSafetyReminder (upval), DictationSafetyReminderModule (upval), ShouldFilterGlobalMessageModule (upval), GetGlobalMutedUsersStoreModule (upval), LocalPlayer (copy), _processIncomingMessageCore (copy)
			if FFlagExpChatDictationContinuousSafetyReminder then
				DictationSafetyReminderModule.onIncomingMessage(TextChatMessage)
			end
			if not ShouldFilterGlobalMessageModule(TextChatMessage, GetGlobalMutedUsersStoreModule(false), LocalPlayer and LocalPlayer.UserId) then
				local config = { channelNameOverride = "RBXGlobal", isUniverseChat = true }
				_processIncomingMessageCore(TextChatMessage, config and config.channelNameOverride, config and config.isUniverseChat)
				
				return
			end
		end)
	end
	local function runOnBubbleDisplayed(Model: Model, Message, TextChatMessage)
		-- upvalues: Players (upval), HttpService (upval), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), MessagesStoreModule (copy)
		local Player = if Model:IsA("Model") then Players:GetPlayerFromCharacter(Model) else nil
		local Guid = HttpService:GenerateGUID(false)
		local BubbleChatMessageProperties = nil
		local TranslationInternal = nil
		
		if TextChatMessage then
			Guid = TextChatMessage.MessageId
			BubbleChatMessageProperties = TextChatMessage.BubbleChatMessageProperties
			TranslationInternal = if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.TranslationInternal else TextChatMessage.Translation
		end
		MessagesStoreModule.handleIncomingBubbleChatMessage({
			message = Message,
			translation = TranslationInternal,
			bubbleChatMessageId = Guid,
			bubbleChatMessageUserId = Player and tostring(Player.UserId) or nil,
			partOrModel = Model,
			timestamp = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000),
			bubbleChatMessageProperties = BubbleChatMessageProperties
		})
	end
	
	Chat.Chatted:Connect(function(Message, Recipient)
		-- upvalues: TextChatService (upval), Chat (upval), runOnBubbleDisplayed (copy)
		if TextChatService.ChatVersion ~= Enum.ChatVersion.LegacyChatService or Chat.BubbleChatEnabled then
			runOnBubbleDisplayed(Message, Recipient)
		end
	end)
	Chat:GetPropertyChangedSignal("BubbleChatEnabled"):Connect(function()
		-- upvalues: Chat (upval), StoreModule (copy), LegacyBubbleChatEnabledChangedModule (upval)
		StoreModule:dispatch(LegacyBubbleChatEnabledChangedModule("Enabled", Chat.BubbleChatEnabled))
	end)
	StoreModule:dispatch(LegacyBubbleChatEnabledChangedModule("Enabled", Chat.BubbleChatEnabled))
	Chat.BubbleChatSettingsChanged:Connect(function(Settings)
		-- upvalues: JoinResult (ref), ChatConfigurationStoreModule (copy), StoreModule (copy), LegacyBubbleChatSettingsChangedModule (upval)
		if JoinResult.validateLegacyBubbleChatSettings then
			local ValidateLegacyBubbleChatSettingsResult, ValidateLegacyBubbleChatSettingsResult2 = JoinResult.validateLegacyBubbleChatSettings(Settings)
			assert(ValidateLegacyBubbleChatSettingsResult, "Bad settings object passed to Chat:SetBubbleChatSettings:\n inside consolidated BubbleChat " .. (ValidateLegacyBubbleChatSettingsResult2 or ""))
			
			if ChatConfigurationStoreModule then
				ChatConfigurationStoreModule.setBubbleChatSettings(Settings)
				
				return
			end
			StoreModule:dispatch(LegacyBubbleChatSettingsChangedModule(Settings))
		end
	end)
	
	if GetEngineFeatureFlagEnableDisplayBubbleModule() then
		TextChatService.BubbleDisplayed:Connect(function(PartOrCharacter, TextChatMessage)
			-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), runOnBubbleDisplayed (copy)
			runOnBubbleDisplayed(PartOrCharacter, TextChatMessage and (if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.TextInternal else TextChatMessage.Text), TextChatMessage)
		end)
	end
	local function findCommandInstance(Name)
		-- upvalues: TextChatService (upval)
		for _, TextChatCommand in ipairs(TextChatService:GetDescendants()) do
			if TextChatCommand.Name == Name and TextChatCommand:IsA("TextChatCommand") then
				return TextChatCommand
			end
		end
		return nil
	end
	
	local t2 = {}
	
	local function setupTextChatCommands()
		-- upvalues: Commands (upval), findCommandInstance (copy), t2 (copy), StoreModule (copy), Context (upval), DisplaySystemMessageModule (upval), JoinResult (ref), CommandAliasChangedFunction (upval)
		for _, enabledCommand in ipairs(Commands.enabledCommands) do
			if enabledCommand.clientRun then
				local CommandInstance = findCommandInstance(enabledCommand.name)
				
				if CommandInstance and not t2[CommandInstance] then
					t2[CommandInstance] = true
					CommandInstance.Triggered:Connect(function(Player, ...)
						-- upvalues: enabledCommand (copy), StoreModule (upval), Context (upval), DisplaySystemMessageModule (upval), JoinResult (upval)
						local ClientRunResult = enabledCommand.clientRun(StoreModule, Player.UserId, (...), Context)
						
						if ClientRunResult then
							DisplaySystemMessageModule(ClientRunResult.key, ClientRunResult.args, ClientRunResult.metadata, JoinResult.translator, JoinResult.defaultSystemTextChannel)
						end
					end)
					
					if string.find(CommandInstance.Name, "RBXTeamCommand") or string.find(CommandInstance.Name, "RBXWhisperCommand") then
						for _, PropertyName in { "PrimaryAlias", "SecondaryAlias" } do
							CommandInstance:GetPropertyChangedSignal(PropertyName):Connect(function()
								-- upvalues: StoreModule (upval), CommandAliasChangedFunction (upval), CommandInstance (copy)
								StoreModule:dispatch(CommandAliasChangedFunction(CommandInstance.Name, CommandInstance.PrimaryAlias, CommandInstance.SecondaryAlias))
							end)
						end
					end
				end
			end
		end
	end
	
	setupTextChatCommands()
	Chat:GetPropertyChangedSignal("IsAutoMigrated"):Once(setupTextChatCommands)
	
	if JoinResult.canUserChatAsync and Players.LocalPlayer then
		PromiseModule.try(function()
			-- upvalues: JoinResult (ref), Players (upval)
			return JoinResult.canUserChatAsync(Players.LocalPlayer.UserId)
		end):andThen(function(Result)
			-- upvalues: MessagesStoreModule (copy)
			MessagesStoreModule.setCanLocalUserChat(Result)
		end):catch(function()
			-- upvalues: MessagesStoreModule (copy)
			MessagesStoreModule.setCanLocalUserChat(false)
		end)
	end
	watchPlayersService(JoinResult, StoreModule, MessagesStoreModule)
	local Element = RoactModule.createElement(UIBloxModule.App.Style.AppStyleProvider, {
		style = ({
			Dark = {
				themeName = ColorMode.Dark,
				fontName = UIBloxModule.App.Style.Constants.FontName.Gotham
			}
		}).Dark
	}, {
		app = RoactModule.createElement(AppModule, {
			isChatWindowVisible = true,
			isChatInputBarVisible = true,
			isChannelBarVisible = false,
			isDefaultChatEnabled = true,
			store = StoreModule,
			translator = JoinResult.translator,
			gameTranslator = JoinResult.gameTranslator,
			getIconVoiceIndicator = JoinResult.getIconVoiceIndicator,
			onClickedVoiceIndicator = JoinResult.onClickedVoiceIndicator,
			onClickedCameraIndicator = JoinResult.onClickedCameraIndicator,
			selfViewListenerChanged = JoinResult.selfViewListenerChanged,
			getPermissions = JoinResult.getPermissions,
			displayCameraDeniedToast = JoinResult.displayCameraDeniedToast,
			isCamEnabledForUserAndPlace = JoinResult.isCamEnabledForUserAndPlace,
			isCameraOnlyUser = JoinResult.isCameraOnlyUser,
			isVoiceServiceInitialized = JoinResult.isVoiceServiceInitialized,
			isSpatialUIEnabled = JoinResult.isSpatialUIEnabled,
			expChatLoadStartTime = if GetFFlagExpChatTelemetryEventTriggerModule() then os.clock() else nil
		})
	})
	StoreModule:dispatch(ClientAppLoadedFunction({
		team = Players.LocalPlayer and Players.LocalPlayer.Team,
		isChatCoreGuiEnabled = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Chat),
		isTouchEnabled = UserInputService.TouchEnabled,
		isGamepadEnabled = UserInputService.PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and UserInputService.PreferredInput == Enum.PreferredInput.MicroGamepad
	}))
	ReportVersionLoadedModule(Analytics, Version[1])
	NewResult:trace("Roact.mount to {}", (tostring(JoinResult.parent)))
	local ExperienceChat = RoactModule.mount(Element, JoinResult.parent, "ExperienceChat")
	local ChatEnabledSystemMessageModuleResult = ChatEnabledSystemMessageModule({
		translator = JoinResult.translator,
		defaultSystemTextChannel = JoinResult.defaultSystemTextChannel,
		localPlayer = LocalPlayer,
		displayVirtualSystemMessage = if HasMessagesStoreModule then showVirtualChatEnabledSystemMessage else nil
	})
	
	local function displayRegionUnavailableMessage()
		-- upvalues: DisplaySystemMessageModule (upval), JoinResult (ref)
		DisplaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionUnavailable", nil, "Roblox.ChatDisabled.Info", JoinResult.translator, JoinResult.defaultSystemTextChannel, "You can only view system messages here. Chat is not available in your region.")
	end
	
	local FFlagEnableClientSummarySystemMessageOnLua1 = FFlagExpChatMEUpdatedSystemMessageModule and (FFlagExpChatPresetChatEnabled and FFlagEnableClientSummarySystemMessageOnLua)
	
	local _ = function(p3, p4, p5)
		-- upvalues: WhenPresetAccessKnownModule (upval), GetPresetChatStoreModule (upval), DisplaySystemMessageModule (upval), JoinResult (ref), PrefixWithPresetIconModule (upval)
		WhenPresetAccessKnownModule(GetPresetChatStoreModule(false), function(p6)
			-- upvalues: DisplaySystemMessageModule (upval), p3 (copy), JoinResult (upval), p4 (copy), PrefixWithPresetIconModule (upval), p5 (copy)
			if p6 then
				DisplaySystemMessageModule(p3, nil, "Roblox.ChatDisabled.Info", JoinResult.translator, JoinResult.defaultSystemTextChannel, p4, PrefixWithPresetIconModule)
				
				return
			else
				p5()
			end
		end)
	end
	
	local function updateChatStatus(ChatAvailabilityStatus)
		-- upvalues: ChatStatusStoreModule (copy), FFlagEnableClientSummarySystemMessageOnLua1 (copy), displayRegionUnavailableMessage (copy), WhenPresetAccessKnownModule (upval), GetPresetChatStoreModule (upval), DisplaySystemMessageModule (upval), JoinResult (ref), PrefixWithPresetIconModule (upval), IsChatRegionLockedModule (upval), ExpChatNewSystemMessagesExperimentation (upval), Flag1 (ref), CanPlatformEnableChatModule (upval), FFlagExpChatRefactorEnabledMessageLogicModule (upval), FStringExpChatChatWithTFAmpFeatureNameModule (upval), FStringExpChatChatWithTFAmpNameSpaceModule (upval), NewResult (upval), AmpApiProvider (upval), LocalPlayer (copy), AccessResponseEnum (upval), HasMessagesStoreModule (copy), showVirtualChatEnabledSystemMessage (copy), CanOnlyChatInRegionModule (upval), ChatEnabledSystemMessageModuleResult (copy)
		ChatStatusStoreModule.setChatStatus(ChatAvailabilityStatus)
		
		if FFlagEnableClientSummarySystemMessageOnLua1 and ChatAvailabilityStatus == "GeoBlocked" then
			local v1 = "CoreScripts.TextChat.Description.UseQuickWordsChatIsntAvailableInYourRegion"
			local v2 = "Use Quick Words to coordinate gameplay. Chat isn’t available in your region."
			WhenPresetAccessKnownModule(GetPresetChatStoreModule(false), function(p3)
				-- upvalues: DisplaySystemMessageModule (upval), v1 (copy), JoinResult (upval), v2 (copy), PrefixWithPresetIconModule (upval), displayRegionUnavailableMessage (copy)
				if p3 then
					DisplaySystemMessageModule(v1, nil, "Roblox.ChatDisabled.Info", JoinResult.translator, JoinResult.defaultSystemTextChannel, v2, PrefixWithPresetIconModule)
					
					return
				else
					displayRegionUnavailableMessage()
				end
			end)
			
			return
		end
		if ChatAvailabilityStatus == "GeoBlocked" or ChatAvailabilityStatus ~= "Unknown" and IsChatRegionLockedModule() then
			DisplaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionUnavailable", nil, "Roblox.ChatDisabled.Info", JoinResult.translator, JoinResult.defaultSystemTextChannel, "You can only view system messages here. Chat is not available in your region.")
			
			return
		end
		if ChatAvailabilityStatus == "AgeCheckGateExperiment" then
			DisplaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatDisabled.CheckAgeInAccountInfo", nil, "Roblox.ChatDisabled.Info", JoinResult.translator, JoinResult.defaultSystemTextChannel, "You can only view system messages here. Unlock chat with an age check at Settings > Account info.")
			
			return
		end
		if ChatAvailabilityStatus == "SettingsDisabled" then
			if ExpChatNewSystemMessagesExperimentation.isExperimentEnabled and ExpChatNewSystemMessagesExperimentation.isExperimentEnabled and not Flag1 then
				Flag1 = true
				ExpChatNewSystemMessagesExperimentation.logExposure()
			end
			DisplaySystemMessageModule(if ExpChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "CoreScripts.TextChat.Description.TurnOnChatInSettings" else "CoreScripts.TextChat.ChatWindow.ChatDisabled.SettingOff", nil, "Roblox.ChatDisabled.Info", JoinResult.translator, JoinResult.defaultSystemTextChannel, if ExpChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "Chat with people of similar age groups and trusted friends." else "You can only view system messages here. Update your Communication settings to turn on chat.")
			
			return
		elseif ChatAvailabilityStatus == "SettingsDisabledVpc" then
			if ExpChatNewSystemMessagesExperimentation.isExperimentEnabled and ExpChatNewSystemMessagesExperimentation.isExperimentEnabled and not Flag1 then
				Flag1 = true
				ExpChatNewSystemMessagesExperimentation.logExposure()
			end
			DisplaySystemMessageModule(if ExpChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "CoreScripts.TextChat.Description.AskYourParentForPermissionToChat" else "CoreScripts.TextChat.ChatWindow.ChatDisabled.AskForPermission", nil, "Roblox.ChatDisabled.Info", JoinResult.translator, JoinResult.defaultSystemTextChannel, if ExpChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "Ask your parent for permission to chat in Privacy>Communication settings." else "You can only view system messages here. Ask your parent for permission to chat in Communication settings.")
			
			return
		elseif ChatAvailabilityStatus == "AgeCheckVpc" then
			if ExpChatNewSystemMessagesExperimentation.isExperimentEnabled and ExpChatNewSystemMessagesExperimentation.isExperimentEnabled and not Flag1 then
				Flag1 = true
				ExpChatNewSystemMessagesExperimentation.logExposure()
			end
			DisplaySystemMessageModule(if ExpChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "CoreScripts.TextChat.Description.AskYourParentForPermissionToChat" else "CoreScripts.TextChat.ChatWindow.ChatDisabled.AskForPermissionToAgeCheck", nil, "Roblox.ChatDisabled.Info", JoinResult.translator, JoinResult.defaultSystemTextChannel, if ExpChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "Ask your parent for permission to chat in Privacy>Communication settings." else "You can only view system messages here. Ask your parent for permission to age check in Communication settings.")
			
			return
		elseif (CanPlatformEnableChatModule() or ChatAvailabilityStatus ~= "AgeVerificationRequired") and ChatAvailabilityStatus ~= "IdVerificationRequired" then
			if ChatAvailabilityStatus == "AgeVerificationRequired" then
				if ExpChatNewSystemMessagesExperimentation.isExperimentEnabled and ExpChatNewSystemMessagesExperimentation.isExperimentEnabled and not Flag1 then
					Flag1 = true
					ExpChatNewSystemMessagesExperimentation.logExposure()
				end
				DisplaySystemMessageModule(if ExpChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "CoreScripts.TextChat.Description.UnlockChatWithAnAgeCheck" else "CoreScripts.TextChat.ChatWindow.ChatDisabled.GetAnAgeCheck", nil, "Roblox.ChatDisabled.Info", JoinResult.translator, JoinResult.defaultSystemTextChannel, if ExpChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "Unlock chat with an age check." else "You can only view system messages here. Get an age check to chat.")
				
				return
			elseif FFlagExpChatRefactorEnabledMessageLogicModule and ChatAvailabilityStatus == "Enabled" then
				coroutine.wrap(function()
					-- upvalues: FStringExpChatChatWithTFAmpFeatureNameModule (upval), FStringExpChatChatWithTFAmpNameSpaceModule (upval), NewResult (upval), AmpApiProvider (upval), LocalPlayer (upval), AccessResponseEnum (upval), HasMessagesStoreModule (upval), showVirtualChatEnabledSystemMessage (upval), DisplaySystemMessageModule (upval), JoinResult (upval), CanOnlyChatInRegionModule (upval), ChatEnabledSystemMessageModuleResult (upval)
					if FStringExpChatChatWithTFAmpFeatureNameModule == "" or FStringExpChatChatWithTFAmpNameSpaceModule == "" then
						NewResult:error("AMP feature name or namespace are not set")
						
						return
					end
					local FeatureAccess = AmpApiProvider.getFeatureAccess({ FStringExpChatChatWithTFAmpFeatureNameModule }, FStringExpChatChatWithTFAmpNameSpaceModule)
					
					if LocalPlayer.ChatAvailabilityStatus ~= "Enabled" then return end
					local IsAccessMatch = if FeatureAccess.featureAccessList and #FeatureAccess.featureAccessList > 0 and FeatureAccess.featureAccessList[1] then FeatureAccess.featureAccessList[1].access == AccessResponseEnum.Granted else nil
					
					if IsAccessMatch == nil then
						NewResult:error("No feature access list found after AMP call")
						
						return
					end
					if IsAccessMatch then
						if HasMessagesStoreModule then
							showVirtualChatEnabledSystemMessage("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithTF", nil, "Only your trusted friends can chat with you.")
							
							return
						else
							DisplaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithTF", nil, "Roblox.ChatEnabled.Info", JoinResult.translator, JoinResult.defaultSystemTextChannel, "Only your trusted friends can chat with you.")
							
							return
						end
					elseif not CanOnlyChatInRegionModule() then
						ChatEnabledSystemMessageModuleResult()
						
						return
					else
						if HasMessagesStoreModule then
							showVirtualChatEnabledSystemMessage("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatInRegion", nil, "You can view system messages and chat with users in your region only.")
							
							return
						else
							DisplaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatInRegion", nil, "Roblox.ChatEnabled.Info", JoinResult.translator, JoinResult.defaultSystemTextChannel, "You can view system messages and chat with users in your region only.")
						end
					end
				end)()
				
				return
			else
				if ChatAvailabilityStatus == "EnabledBubble" or ChatAvailabilityStatus == "Enabled" and CanOnlyChatInRegionModule() then
					if HasMessagesStoreModule then
						showVirtualChatEnabledSystemMessage("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatInRegion", nil, "You can view system messages and chat with users in your region only.")
						
						return
					else
						DisplaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatInRegion", nil, "Roblox.ChatEnabled.Info", JoinResult.translator, JoinResult.defaultSystemTextChannel, "You can view system messages and chat with users in your region only.")
						
						return
					end
				elseif ChatAvailabilityStatus == "Enabled" then
					ChatEnabledSystemMessageModuleResult()
					
					return
				else
					if ChatAvailabilityStatus == "AllUsers" or ChatAvailabilityStatus == "NoOne" then
						if getChatTranslationEnabled() then
							DisplaySystemMessageModule("CoreScripts.TextChat.ChatTranslation.ChatWindow.SystemMessageNew", nil, "Roblox.ChatTranslation.ChatWindow.SystemMessage", JoinResult.translator, JoinResult.defaultSystemTextChannel, "Roblox automatically translates supported languages in chat")
							
							return
						end
					elseif ChatAvailabilityStatus == "Ineligible" or ChatAvailabilityStatus ~= "Unknown" then
						DisplaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatDisabled.OnlyViewSystemMessages", nil, "Roblox.ChatDisabled.Info", JoinResult.translator, JoinResult.defaultSystemTextChannel, "You can only view system messages here.")
					end
					return
				end
			end
		else
			if ExpChatNewSystemMessagesExperimentation.isExperimentEnabled and ExpChatNewSystemMessagesExperimentation.isExperimentEnabled and not Flag1 then
				Flag1 = true
				ExpChatNewSystemMessagesExperimentation.logExposure()
			end
			DisplaySystemMessageModule(if ExpChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "CoreScripts.TextChat.Description.UnlockChatPrivacyCommunications" else "CoreScripts.TextChat.ChatWindow.ChatDisabled.CheckAgeInSettings", nil, "Roblox.ChatDisabled.Info", JoinResult.translator, JoinResult.defaultSystemTextChannel, if ExpChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "Unlock chat with an age check in Privacy>Communication settings." else "You can only view system messages here. To chat, get an age check in your Communication settings.")
		end
	end
	
	local Count = 0
	local RandomValue = math.random(ExpChatHiddenMessagesPromptThresholdLowerBound, ExpChatHiddenMessagesPromptThresholdUpperBound)
	
	local function handleUserMessageIntentSent(UserIntentMessage)
		-- upvalues: NewResult (upval), MessagesStoreModule (copy), IsUserChatEnabledModule (upval), LocalPlayer (copy), Count (ref), RandomValue (ref), ExpChatHiddenMessagesPromptThresholdLowerBound (upval), ExpChatHiddenMessagesPromptThresholdUpperBound (upval), DisplaySystemMessageModule (upval), JoinResult (ref), GetTransparencyStoreModule (upval)
		NewResult:debug("Handling a message from UserMessageIntentSent")
		MessagesStoreModule.handleHiddenMessageReceived(UserIntentMessage)
		
		if not IsUserChatEnabledModule(LocalPlayer.ChatAvailabilityStatus) then
			Count += 1
			
			if Count == RandomValue then
				RandomValue += math.random(ExpChatHiddenMessagesPromptThresholdLowerBound, ExpChatHiddenMessagesPromptThresholdUpperBound)
				DisplaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatDisabled.DontMissMessages", nil, "Roblox.ChatDisabled.Info", JoinResult.translator, JoinResult.defaultSystemTextChannel, "Don’t miss messages. Unlock chat with an age check.")
			end
		end
		GetTransparencyStoreModule(false).resetTextTransparency()
	end
	
	local _ = function()
		-- upvalues: FFlagExpChatEnableFOMOUpsellModule (upval), ShouldShowFOMOUpsellModule (upval), FFlagExpChatEnableCrossAgeChatActivityModule (upval), ShouldShowCrossAgeChatActivityModule (upval)
		local ShouldShowFOMOUpsellModule1 = FFlagExpChatEnableFOMOUpsellModule and ShouldShowFOMOUpsellModule()
		local ShouldShowCrossAgeChatActivityModule1 = FFlagExpChatEnableCrossAgeChatActivityModule and ShouldShowCrossAgeChatActivityModule()
		
		return ShouldShowFOMOUpsellModule1 or ShouldShowCrossAgeChatActivityModule1
	end
	
	if LocalPlayer then
		if FFlagEnableModerateChatRemoteEvent then
			local ExperienceChatVisualConfigModule = GetExperienceChatVisualConfigModule()
			local ChatModerationStoreModule = GetChatModerationStoreModule(false)
			local IsSettingEnabled = false
			JoinResult.moderateChatStoreDisposeEffect = SignalsModule.createEffect(function(p3)
				-- upvalues: ChatModerationStoreModule (copy), IsSettingEnabled (ref), DisplaySystemMessageModule (upval), JoinResult (ref), NotificationModalsManagerModule (upval), UIBloxModule (upval), ExperienceChatVisualConfigModule (copy)
				local IsSettingEnabled1 = ChatModerationStoreModule.getIsSettingEnabled(p3)
				
				if IsSettingEnabled1 ~= IsSettingEnabled then
					if IsSettingEnabled1 then
						DisplaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.ModerateChatOn", nil, "Roblox.MessageStatus.Warning.ModerateChatOn", JoinResult.translator, JoinResult.defaultSystemTextChannel)
						NotificationModalsManagerModule.SetUIBloxToast({
							iconImage = UIBloxModule.App.ImageSet.Images[ExperienceChatVisualConfigModule.icon.off],
							toastSubtitle = JoinResult.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOn.Subtitle"),
							toastTitle = JoinResult.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOn.Title")
						})
					else
						DisplaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.ModerateChatOff", nil, "Roblox.MessageStatus.Warning.ModerateChatOff", JoinResult.translator, JoinResult.defaultSystemTextChannel)
						NotificationModalsManagerModule.SetUIBloxToast({
							iconImage = UIBloxModule.App.ImageSet.Images[ExperienceChatVisualConfigModule.icon.off],
							toastSubtitle = JoinResult.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOff.Subtitle.FriendsRename"),
							toastTitle = JoinResult.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOff.Title")
						})
					end
					IsSettingEnabled = IsSettingEnabled1
				end
			end)
		end
		local ChatAvailabilityStatus = LocalPlayer.ChatAvailabilityStatus
		NewResult:debug("Local player's initial ChatAvailabilityStatus is {}", ChatAvailabilityStatus)
		updateChatStatus(ChatAvailabilityStatus)
		local UserMessageIntentSentConnection = nil
		local ShouldShowFOMOUpsellModule1 = FFlagExpChatEnableFOMOUpsellModule and ShouldShowFOMOUpsellModule()
		local ShouldShowCrossAgeChatActivityModule1 = FFlagExpChatEnableCrossAgeChatActivityModule and ShouldShowCrossAgeChatActivityModule()
		
		if ShouldShowFOMOUpsellModule1 or ShouldShowCrossAgeChatActivityModule1 then
			NewResult:debug("Connecting to UserMessageIntentSent")
			UserMessageIntentSentConnection = TextChatService.UserMessageIntentSent:Connect(handleUserMessageIntentSent)
		end
		LocalPlayer:GetPropertyChangedSignal("ChatAvailabilityStatus"):Connect(function()
			-- upvalues: ChatAvailabilityStatus (ref), LocalPlayer (copy), NewResult (upval), updateChatStatus (copy), FFlagExpChatPresetChatEnabled (upval), FFlagExpChatPresetChatLoadTestEnabled (upval), IsUserChatEnabledModule (upval), InitializePresetChatModule (upval), GetPresetChatStoreModule (upval), FFlagExpChatEnableFOMOUpsellModule (upval), ShouldShowFOMOUpsellModule (upval), FFlagExpChatEnableCrossAgeChatActivityModule (upval), ShouldShowCrossAgeChatActivityModule (upval), UserMessageIntentSentConnection (ref), TextChatService (upval), handleUserMessageIntentSent (copy), FFlagExpChatClearHiddenMessagesPostAgeCheckModule (upval), MessagesStoreModule (copy), GetTransparencyStoreModule (upval)
			ChatAvailabilityStatus = LocalPlayer.ChatAvailabilityStatus
			NewResult:debug("Local player's ChatAvailabilityStatus has changed to {}", ChatAvailabilityStatus)
			updateChatStatus(ChatAvailabilityStatus)
			
			if (FFlagExpChatPresetChatEnabled or FFlagExpChatPresetChatLoadTestEnabled) and IsUserChatEnabledModule(ChatAvailabilityStatus) then
				InitializePresetChatModule(GetPresetChatStoreModule(false), not FFlagExpChatPresetChatEnabled and FFlagExpChatPresetChatLoadTestEnabled)
			end
			local ShouldShowFOMOUpsellModule1 = FFlagExpChatEnableFOMOUpsellModule and ShouldShowFOMOUpsellModule()
			local ShouldShowCrossAgeChatActivityModule1 = FFlagExpChatEnableCrossAgeChatActivityModule and ShouldShowCrossAgeChatActivityModule()
			
			if (ShouldShowFOMOUpsellModule1 or ShouldShowCrossAgeChatActivityModule1) and not UserMessageIntentSentConnection then
				NewResult:debug("Connecting to UserMessageIntentSent")
				UserMessageIntentSentConnection = TextChatService.UserMessageIntentSent:Connect(handleUserMessageIntentSent)
			end
			if FFlagExpChatEnableFOMOUpsellModule and IsUserChatEnabledModule(ChatAvailabilityStatus) and UserMessageIntentSentConnection and (not FFlagExpChatEnableCrossAgeChatActivityModule or not ShouldShowCrossAgeChatActivityModule()) then
				NewResult:debug("Disconnecting from UserMessageIntentSent")
				UserMessageIntentSentConnection:Disconnect()
				
				if FFlagExpChatClearHiddenMessagesPostAgeCheckModule then
					MessagesStoreModule.handleHiddenMessagesCleared()
					GetTransparencyStoreModule(false).resetTextTransparency()
				end
			end
			MessagesStoreModule.setCanLocalUserChat(IsUserChatEnabledModule(ChatAvailabilityStatus))
		end)
	elseif IsChatRegionLockedModule() then
		DisplaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionUnavailable", nil, "Roblox.ChatDisabled.Info", JoinResult.translator, JoinResult.defaultSystemTextChannel, "You can only view system messages here. Chat is currently unavailable in your region.")
	end
	if FFlagExpChatPresetChatEnabled or FFlagExpChatPresetChatLoadTestEnabled then
		InitializePresetChatModule(GetPresetChatStoreModule(false), not FFlagExpChatPresetChatEnabled and FFlagExpChatPresetChatLoadTestEnabled)
	end
	return { roactInstance = ExperienceChat }
end