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
local GetPresetChatStoreModule = require(ExpChat.Stores.GetPresetChatStore)
local GetChatTooltipStoreModule = require(ExpChat.Stores.GetChatTooltipStore)
local InitializePresetChatModule = require(ExpChat.PresetChat.initializePresetChat)
local FFlagExpChatPresetChatEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local FFlagExpChatPresetChatLoadTestEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatLoadTestEnabled
local FFlagExpChatUseUnifiedTooltipStore = ExpChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore
local GetFFlagExpChatProtectedChatInternalAPIsFunction = SharedFlagsModule.getFFlagExpChatProtectedChatInternalAPIs
local FFlagConnectionsToFriendsRename = SharedFlagsModule.FFlagConnectionsToFriendsRename
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
local IncomingMessageReceivedModule = require(Actions.IncomingMessageReceived)
local UniverseChatSystemMessageAddedModule = require(Actions.UniverseChatSystemMessageAdded)
local IncomingBubbleChatMessageReceivedModule = require(Actions.IncomingBubbleChatMessageReceived)
local OutgoingMessageSentModule = require(Actions.OutgoingMessageSent)
local MarkChannelUnreadForIncomingMessageModule = require(Actions.MarkChannelUnreadForIncomingMessage)
local MarkChannelUnreadForSystemMessageModule = require(Actions.MarkChannelUnreadForSystemMessage)
local TextChannelCreatedFunction = ExpChatSharedModule.Actions.TextChannelCreated
local TextChannelRemovedFunction = ExpChatSharedModule.Actions.TextChannelRemoved
local UserMutedFunction = ExpChatSharedModule.Actions.UserMuted
local UserUnmutedFunction = ExpChatSharedModule.Actions.UserUnmuted
local PlayerAddedFunction = ExpChatSharedModule.Actions.PlayerAdded
local PlayerRemovedFunction = ExpChatSharedModule.Actions.PlayerRemoved
local CharacterAddedFunction = ExpChatSharedModule.Actions.CharacterAdded
local LocalCharacterLoadedFunction = ExpChatSharedModule.Actions.LocalCharacterLoaded
local LocalTeamChangedFunction = ExpChatSharedModule.Actions.LocalTeamChanged
local ClientAppLoadedFunction = ExpChatSharedModule.Actions.ClientAppLoaded
local LastInputTypeChangedModule = require(Actions.LastInputTypeChanged)
local ChatPrivacySettingsReceivedModule = require(Actions.ChatPrivacySettingsReceived)
local ChatPrivacySettingsFetchFailedModule = require(Actions.ChatPrivacySettingsFetchFailed)
local CommandAliasChangedFunction = ExpChatSharedModule.Actions.CommandAliasChanged
local HumanoidDiedModule = require(Actions.HumanoidDied)
local AdorneeAddedModule = require(Actions.AdorneeAdded)
local LegacyBubbleChatEnabledChangedModule = require(Actions.LegacyBubbleChatEnabledChanged)
local LegacyBubbleChatSettingsChangedModule = require(Actions.LegacyBubbleChatSettingsChanged)
local LocalTextChannelParticipantAddedModule = require(Actions.LocalTextChannelParticipantAdded)
local LocalTextChannelParticipantRemovedFunction = ExpChatSharedModule.Actions.LocalTextChannelParticipantRemoved
local HiddenMessageReceivedModule = require(Actions.HiddenMessageReceived)
local HiddenMessagesClearedModule = require(Actions.HiddenMessagesCleared)
local UniverseChatChannelAddedModule = require(Actions.UniverseChatChannelAdded)
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
local Flags = ExpChat.Flags
local GetEngineFeatureFlagEnableDisplayBubbleModule = require(Flags.getEngineFeatureFlagEnableDisplayBubble)
local GetFFlagUnreduxLastInputTypeChangedModule = require(Flags.getFFlagUnreduxLastInputTypeChanged)
local GetFFlagExpChatEnableChannelTabsUIModule = require(Flags.getFFlagExpChatEnableChannelTabsUI)
local GetFFlagUseCharacterStoreFunction = ExpChatSharedModule.Flags.getFFlagUseCharacterStore
local GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction = ExpChatSharedModule.Flags.GetFFlagExpChatSuppressWelcomeMessageTabUnread
local GetFFlagExpChatTelemetryEventTriggerModule = require(ExpChat.Flags.getFFlagExpChatTelemetryEventTrigger)
local FFlagAEGIS2EnableGatesForExpChatModule = require(Flags.FFlagAEGIS2EnableGatesForExpChat)
local ExpChatMessageResponseThrottlePermyriad = game:DefineFastInt("ExpChatMessageResponseThrottlePermyriad", 0)
local ExpChatMessageResponseUserSamplePermyriad = game:DefineFastInt("ExpChatMessageResponseUserSamplePermyriad", 0)
local ExpChatHiddenMessagesPromptThresholdLowerBound = game:DefineFastInt("ExpChatHiddenMessagesPromptThresholdLowerBound", 10)
local ExpChatHiddenMessagesPromptThresholdUpperBound = game:DefineFastInt("ExpChatHiddenMessagesPromptThresholdUpperBound", 45)
local FFlagExpChatEnableFOMOUpsellModule = require(Flags.FFlagExpChatEnableFOMOUpsell)
local FFlagExpChatClearHiddenMessagesPostAgeCheckModule = require(Flags.FFlagExpChatClearHiddenMessagesPostAgeCheck)
local FFlagEnableInExpChatSummaryOnLuaModule = require(Flags.FFlagEnableInExpChatSummaryOnLua)
local FFlagExpChatEnableCrossAgeChatActivityModule = require(Flags.FFlagExpChatEnableCrossAgeChatActivity)
local FFlagExpChatUnreadTabIndicatorV2WindowModule = require(Flags.FFlagExpChatUnreadTabIndicatorV2Window)
local FFlagExpChatUseAdorneeStore = SharedFlagsModule.FFlagExpChatUseAdorneeStore
local FFlagExpChatUseMessagesStore = SharedFlagsModule.FFlagExpChatUseMessagesStore
local FFlagExpChatUseChannelTabsStore = SharedFlagsModule.FFlagExpChatUseChannelTabsStore
local FFlagExpChatUseChatConfigStore = SharedFlagsModule.FFlagExpChatUseChatConfigStore
local FFlagEnableModerateChatRemoteEvent = SharedFlagsModule.FFlagEnableModerateChatRemoteEvent
local FFlagEnableClientSummarySystemMessageOnLua = SharedFlagsModule.FFlagEnableClientSummarySystemMessageOnLua
local FFlagExpChatPerfTracking = SharedFlagsModule.FFlagExpChatPerfTracking
local GetFFlagTextChatEnableUniverseChatTabsFunction = ExpChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local GetFFlagEnableExpChatUniverseChatTabNamesFunction = ExpChatSharedModule.Flags.GetFFlagEnableExpChatUniverseChatTabNames
local ExpChatRemoveSpaceFromTeamPrefix = game:DefineFastFlag("ExpChatRemoveSpaceFromTeamPrefix", false)
local FFlagChatLineReportingGlobalMuteEnabled = SharedFlagsModule.FFlagChatLineReportingGlobalMuteEnabled
local FFlagAIRephraseSettingEnabled = SharedFlagsModule.FFlagAIRephraseSettingEnabled
local FFlagChatSummariesSettingEnabled = SharedFlagsModule.FFlagChatSummariesSettingEnabled
local FFlagExpChatUseChatMuteStoreModule = require(Flags.FFlagExpChatUseChatMuteStore)
local FFlagEnableGlobalChat3pSummaryLuaAppsModule = require(Flags.FFlagEnableGlobalChat3pSummaryLuaApps)
local FFlagExpChatEnableGlobalChatSummarySystemMessageModule = require(Flags.FFlagExpChatEnableGlobalChatSummarySystemMessage)
local FFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule = require(Flags.FFlagExpChatEnablePostProcessRichSystemMessageTextFormat)
local FFlagFixGlobalChat3pSummarySystemMessageModule = require(Flags.FFlagFixGlobalChat3pSummarySystemMessage)
local ExpChatSuppressGlobalSummaryTabUnread = game:DefineFastFlag("ExpChatSuppressGlobalSummaryTabUnread", false)
local FFlagExpChatRefactorEnabledMessageLogicModule = require(Flags.FFlagExpChatRefactorEnabledMessageLogic)
local FStringExpChatChatWithTFAmpFeatureNameModule = require(Flags.FStringExpChatChatWithTFAmpFeatureName)
local FStringExpChatChatWithTFAmpNameSpaceModule = require(Flags.FStringExpChatChatWithTFAmpNameSpace)
local ExpChatNewSystemMessagesExperimentation = require(Parent.SocialExperiments).ExpChatNewSystemMessagesExperimentation

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
local Context = ExpChatSharedModule.context
local ReportVersionLoadedModule = require(script.reportVersionLoaded)
local Version = ExpChatSharedModule.Version
local AtomicBindingModule = require(ExpChat.AtomicBinding)
local ChatEnabledSystemMessageModule = require(script.SystemMessages.ChatEnabledSystemMessage)

local function watchPlayersService(JoinResult, Store, MessagesStore)
	-- upvalues: NewResult (copy), IsPlayerVerifiedModule (copy), PlayerAddedFunction (copy), Players (copy), LocalTeamChangedFunction (copy), FFlagExpChatUseAdorneeStore (copy), Context (copy), AdorneeAddedModule (copy), HumanoidDiedModule (copy), AtomicBindingModule (copy), WaitForFirstModule (copy), LocalCharacterLoadedFunction (copy), GetFFlagUseCharacterStoreFunction (copy), CharacterAddedFunction (copy), PromiseModule (copy), DisplaySystemMessageModule (copy), FFlagConnectionsToFriendsRename (copy), PlayerRemovedFunction (copy), FFlagExpChatUseMessagesStore (copy)
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
		-- upvalues: onPlayerAdded (copy), Players (upval), PromiseModule (upval), DisplaySystemMessageModule (upval), FFlagConnectionsToFriendsRename (upval), JoinResult (copy), NewResult (upval)
		onPlayerAdded(Player)
		
		if Players.LocalPlayer then
			PromiseModule.try(function()
				-- upvalues: Player (copy), Players (upval)
				return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then Player:IsFriendsWithAsync(Players.LocalPlayer.UserId) else Player:IsFriendsWith(Players.LocalPlayer.UserId)
			end):andThen(function(Result)
				-- upvalues: DisplaySystemMessageModule (upval), FFlagConnectionsToFriendsRename (upval), Player (copy), JoinResult (upval)
				if Result then
					DisplaySystemMessageModule(if FFlagConnectionsToFriendsRename then "InGame.UnknownNamespace.GameChat.FriendChatNotifier.JoinMessage" else "InGame.UnknownNamespace.GameChat_FriendChatNotifier_JoinMessage", { RBX_NAME = Player.DisplayName }, "Roblox.Notification.Friend.Joined", JoinResult.translator, JoinResult.defaultSystemTextChannel)
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
		-- upvalues: NewResult (upval), Store (copy), PlayerRemovedFunction (upval), FFlagExpChatUseMessagesStore (upval), MessagesStore (copy), FFlagExpChatUseAdorneeStore (upval), Context (upval), GetFFlagUseCharacterStoreFunction (upval), t (copy)
		NewResult:trace("Player removed: {} {}", Player.Name, (tostring(Player.UserId)))
		Store:dispatch(PlayerRemovedFunction(Player.UserId))
		
		if FFlagExpChatUseMessagesStore then
			MessagesStore.handlePlayerRemoved(Player.UserId)
		end
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
	-- upvalues: NewResult (copy), Dictionary (copy), config1 (copy), CreateStoreModule (copy), CreateDispatchBindableEventModule (copy), BindableEventQueueModule (copy), WatchForErrorsFunction (copy), Context (copy), FFlagExpChatUseAdorneeStore (copy), GetAdorneeStoreModule (copy), FFlagExpChatUseProximityStore (copy), GetProximityStoreModule (copy), FFlagExpChatUseMessagesStore (copy), GetMessagesStoreModule (copy), FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy), FFlagExpChatUseChatConfigStore (copy), GetChatConfigurationStoreModule (copy), FFlagAEGIS2EnableGatesForExpChatModule (copy), GetChatStatusStoreModule (copy), GetGlobalMutedUsersStoreModule (copy), FFlagExpChatUseChatMuteStoreModule (copy), Parent (copy), SignalsModule (copy), UserMutedFunction (copy), UserUnmutedFunction (copy), GetFFlagUseCharacterStoreFunction (copy), GetCharacterStoreModule (copy), Analytics (copy), GetFFlagUnreduxLastInputTypeChangedModule (copy), UserInputService (copy), LastInputTypeChangedModule (copy), OnIncomingMessage (copy), Chat (copy), TextChatService (copy), SetUpConfigurationObjectsModule (copy), SetUpClientSettingsModule (copy), Players (copy), DisplaySystemMessageModule (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (copy), FFlagExpChatPerfTracking (copy), ExpChatPerfTracker (copy), ReportMessageReceivedModule (copy), HandleChannelWelcomeMessageModule (copy), GetTransparencyStoreModule (copy), FFlagExpChatUnreadTabIndicatorV2WindowModule (copy), MarkChannelUnreadForIncomingMessageModule (copy), IncomingMessageReceivedModule (copy), GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction (copy), ShouldSuppressUnreadForTabMetadataModule (copy), MarkChannelUnreadForSystemMessageModule (copy), UniverseChatSystemMessageAddedModule (copy), ShouldSendHighFrequencyTelemetryModule (copy), ExpChatMessageResponseUserSamplePermyriad (copy), config (copy), TextChannelCreatedFunction (copy), GetFFlagExpChatEnableChannelTabsUIModule (copy), GetNameColorModule (copy), ExpChatRemoveSpaceFromTeamPrefix (copy), GetOtherDisplayNameInWhisperChannelModule (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), ExpChatNewSystemMessagesExperimentation (copy), SummaryMessageRichTextModule (copy), FFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule (copy), FFlagExpChatEnableGlobalChatSummarySystemMessageModule (copy), ExpChatSuppressGlobalSummaryTabUnread (copy), FFlagFixGlobalChat3pSummarySystemMessageModule (copy), FFlagEnableInExpChatSummaryOnLuaModule (copy), FFlagEnableClientSummarySystemMessageOnLua (copy), TextChannelRemovedFunction (copy), TextChatMessageChatActionTypeModule (copy), FFlagEnableGlobalChat3pSummaryLuaAppsModule (copy), FFlagAIRephraseSettingEnabled (copy), FFlagChatSummariesSettingEnabled (copy), RobloxReplicatedStorage (copy), GetUserChatSettingsStoreModule (copy), OutgoingMessageSentModule (copy), CountParticipantsInTextChannelFunction (copy), LocalTextChannelParticipantAddedModule (copy), LocalTextChannelParticipantRemovedFunction (copy), FFlagExpChatUseUnifiedTooltipStore (copy), GetChatTooltipStoreModule (copy), UniverseChatChannelAddedModule (copy), GetFFlagEnableExpChatUniverseChatTabNamesFunction (copy), ShouldFilterGlobalMessageModule (copy), FFlagChatLineReportingGlobalMuteEnabled (copy), HttpService (copy), IncomingBubbleChatMessageReceivedModule (copy), LegacyBubbleChatEnabledChangedModule (copy), LegacyBubbleChatSettingsChangedModule (copy), GetEngineFeatureFlagEnableDisplayBubbleModule (copy), Commands (copy), CommandAliasChangedFunction (copy), PromiseModule (copy), ChatPrivacySettingsReceivedModule (copy), ChatPrivacySettingsFetchFailedModule (copy), watchPlayersService (copy), UIBloxModule (copy), RoactModule (copy), AppModule (copy), GetFFlagExpChatTelemetryEventTriggerModule (copy), ClientAppLoadedFunction (copy), StarterGui (copy), ReportVersionLoadedModule (copy), Version (copy), ChatEnabledSystemMessageModule (copy), IsChatRegionLockedModule (copy), CanPlatformEnableChatModule (copy), FFlagExpChatRefactorEnabledMessageLogicModule (copy), FStringExpChatChatWithTFAmpFeatureNameModule (copy), FStringExpChatChatWithTFAmpNameSpaceModule (copy), AmpApiProvider (copy), AccessResponseEnum (copy), CanOnlyChatInRegionModule (copy), ExpChatHiddenMessagesPromptThresholdLowerBound (copy), ExpChatHiddenMessagesPromptThresholdUpperBound (copy), HiddenMessageReceivedModule (copy), IsUserChatEnabledModule (copy), FFlagExpChatEnableFOMOUpsellModule (copy), ShouldShowFOMOUpsellModule (copy), FFlagExpChatEnableCrossAgeChatActivityModule (copy), ShouldShowCrossAgeChatActivityModule (copy), FFlagEnableModerateChatRemoteEvent (copy), GetExperienceChatVisualConfigModule (copy), GetChatModerationStoreModule (copy), NotificationModalsManagerModule (copy), FFlagConnectionsToFriendsRename (copy), FFlagExpChatPresetChatEnabled (copy), FFlagExpChatPresetChatLoadTestEnabled (copy), InitializePresetChatModule (copy), GetPresetChatStoreModule (copy), FFlagExpChatClearHiddenMessagesPostAgeCheckModule (copy), HiddenMessagesClearedModule (copy)
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
	local MessagesStoreModule = if FFlagExpChatUseMessagesStore then GetMessagesStoreModule(false) else nil
	local ChannelTabsStoreModule = if FFlagExpChatUseChannelTabsStore then GetChannelTabsStoreModule(false) else nil
	local ChatConfigurationStoreModule = if FFlagExpChatUseChatConfigStore then GetChatConfigurationStoreModule(false) else nil
	local ChatStatusStoreModule = if FFlagAEGIS2EnableGatesForExpChatModule then GetChatStatusStoreModule(false) else nil
	
	if FFlagExpChatUseMessagesStore then
		Context.messagesStore = MessagesStoreModule
	end
	Context.globalMutedUsersStore = GetGlobalMutedUsersStoreModule(false)
	
	if FFlagExpChatUseChatMuteStoreModule and not FFlagExpChatUseMessagesStore then
		local MutedUserIds = require(Parent.ChatMute).getMutedUserIds()
		local t = {}
		JoinResult.chatMuteSyncDisposeEffect = SignalsModule.createEffect(function(p2)
			-- upvalues: MutedUserIds (copy), t (ref), StoreModule (copy), UserMutedFunction (upval), UserUnmutedFunction (upval)
			local MutedUserIdsResult = MutedUserIds(p2)
			
			for i in MutedUserIdsResult do
				if not t[i] then
					StoreModule:dispatch(UserMutedFunction(i))
				end
			end
			for i1 in t do
				if not MutedUserIdsResult[i1] then
					StoreModule:dispatch(UserUnmutedFunction(i1))
				end
			end
			t = MutedUserIdsResult
		end)
	end
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
	local config2 = {
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
	
	local function _processIncomingMessageCore(TextChatMessage, ChannelNameOverride, IsUniverseChat)
		-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), NewResult (upval), FFlagExpChatPerfTracking (upval), LocalPlayer (copy), ExpChatPerfTracker (upval), ReportMessageReceivedModule (upval), HandleChannelWelcomeMessageModule (upval), DisplaySystemMessageModule (upval), JoinResult (ref), FFlagExpChatUseMessagesStore (upval), MessagesStoreModule (copy), GetTransparencyStoreModule (upval), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (copy), FFlagExpChatUnreadTabIndicatorV2WindowModule (upval), StoreModule (copy), MarkChannelUnreadForIncomingMessageModule (upval), IncomingMessageReceivedModule (upval), config2 (copy), GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction (upval), ShouldSuppressUnreadForTabMetadataModule (upval), MarkChannelUnreadForSystemMessageModule (upval), UniverseChatSystemMessageAddedModule (upval), TextChatService (upval), ShouldSendHighFrequencyTelemetryModule (upval), ExpChatMessageResponseUserSamplePermyriad (upval), Analytics (upval), config (upval)
		if GetFFlagExpChatProtectedChatInternalAPIsFunction() then
			NewResult:debug("Incoming MessageReceived Status: {} TextInternal: {}", TextChatMessage.Status.Name, TextChatMessage.TextInternal)
		else
			NewResult:debug("Incoming MessageReceived Status: {} Text: {}", TextChatMessage.Status.Name, TextChatMessage.Text)
		end
		if FFlagExpChatPerfTracking and (TextChatMessage.TextSource and TextChatMessage.TextSource.UserId or "UNKNOWN_TEXT_SOURCE_USER_ID") ~= (LocalPlayer and LocalPlayer.UserId or "UNKNOWN_LOCAL_USER_ID") then
			ExpChatPerfTracker.start(ExpChatPerfTracker.Events.MessageReceiveToWindowRenderInterval, { messageId = TextChatMessage.MessageId })
		end
		if LocalPlayer then
			ReportMessageReceivedModule(LocalPlayer.UserId, TextChatMessage)
		end
		if LocalPlayer and TextChatMessage.TextSource and TextChatMessage.TextSource.UserId ~= LocalPlayer.UserId then
			local HandleChannelWelcomeMessageModuleResult = HandleChannelWelcomeMessageModule(TextChatMessage, LocalPlayer)
			
			if HandleChannelWelcomeMessageModuleResult then
				DisplaySystemMessageModule(HandleChannelWelcomeMessageModuleResult.key, HandleChannelWelcomeMessageModuleResult.args, HandleChannelWelcomeMessageModuleResult.metadata, JoinResult.translator, TextChatMessage.TextChannel)
			end
		end
		local IsUserIdMatch: boolean = LocalPlayer and (TextChatMessage.TextSource and TextChatMessage.TextSource.UserId == LocalPlayer.UserId)
		
		if FFlagExpChatUseMessagesStore then
			MessagesStoreModule.handleIncomingOrOutgoingMessage(TextChatMessage, IsUserIdMatch, ChannelNameOverride, IsUniverseChat)
			GetTransparencyStoreModule(false).resetTextTransparency()
			
			if FFlagExpChatUseChannelTabsStore and ChannelTabsStoreModule then
				ChannelTabsStoreModule.handleIncomingOrOutgoingMessage(TextChatMessage, IsUserIdMatch, ChannelNameOverride)
			elseif FFlagExpChatUnreadTabIndicatorV2WindowModule then
				StoreModule:dispatch(MarkChannelUnreadForIncomingMessageModule(TextChatMessage, IsUserIdMatch, ChannelNameOverride, IsUniverseChat))
			end
		else
			StoreModule:dispatch(IncomingMessageReceivedModule(TextChatMessage, IsUserIdMatch, ChannelNameOverride, IsUniverseChat))
			GetTransparencyStoreModule(false).resetTextTransparency()
		end
		local Entry = config2[TextChatMessage.Status]
		
		if Entry then
			local Success, Result = pcall(function()
				-- upvalues: JoinResult (upval), Entry (copy)
				return JoinResult.translator:FormatByKey(Entry.key)
			end)
			
			if Success then
				Success = Result and Result ~= ""
			end
			if ChannelNameOverride and Success then
				if FFlagExpChatUseMessagesStore and MessagesStoreModule then
					MessagesStoreModule.addSystemMessage(Result, ChannelNameOverride, if GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction() then Entry.metadata else nil)
					
					if FFlagExpChatUseChannelTabsStore and ChannelTabsStoreModule and (not GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction() or not ShouldSuppressUnreadForTabMetadataModule(Entry.metadata)) then
						ChannelTabsStoreModule.markChannelUnread(ChannelNameOverride)
					elseif FFlagExpChatUnreadTabIndicatorV2WindowModule then
						StoreModule:dispatch(MarkChannelUnreadForSystemMessageModule(Result, ChannelNameOverride, if GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction() then Entry.metadata else nil))
					end
				else
					StoreModule:dispatch(UniverseChatSystemMessageAddedModule(Result, ChannelNameOverride, if GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction() then Entry.metadata else nil))
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
	
	local function _(p3, ChildName)
		-- upvalues: _processIncomingMessageCore (copy)
		_processIncomingMessageCore(p3, ChildName, nil)
	end
	
	local _ = function(p3, p4)
		-- upvalues: _processIncomingMessageCore (copy)
		_processIncomingMessageCore(p3, p4 and p4.channelNameOverride, p4 and p4.isUniverseChat)
	end
	
	local function handleMessageReceived(p3)
		-- upvalues: StoreModule (copy), TextChannelCreatedFunction (upval), GetFFlagExpChatEnableChannelTabsUIModule (upval), TextChatService (upval), GetNameColorModule (upval), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), NewResult (upval), Players (upval), ExpChatRemoveSpaceFromTeamPrefix (upval), LocalPlayer (copy), GetOtherDisplayNameInWhisperChannelModule (upval), JoinResult (ref), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), _processIncomingMessageCore (copy), FFlagExpChatPerfTracking (upval), ExpChatPerfTracker (upval), ReportMessageReceivedModule (upval), HandleChannelWelcomeMessageModule (upval), DisplaySystemMessageModule (upval), FFlagExpChatUseMessagesStore (upval), MessagesStoreModule (copy), GetTransparencyStoreModule (upval), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (copy), FFlagExpChatUnreadTabIndicatorV2WindowModule (upval), MarkChannelUnreadForIncomingMessageModule (upval), IncomingMessageReceivedModule (upval), ShouldSendHighFrequencyTelemetryModule (upval), ExpChatMessageResponseUserSamplePermyriad (upval), Analytics (upval), config (upval)
		StoreModule:dispatch(TextChannelCreatedFunction(p3))
		local Enabled = false
		
		if GetFFlagExpChatEnableChannelTabsUIModule() then
			local ChannelTabsConfiguration = TextChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
			
			if ChannelTabsConfiguration then
				Enabled = ChannelTabsConfiguration.Enabled
			end
		end
		if string.find(p3.Name, "RBXGeneral") then
			function p3.OnIncomingMessage(TextChatMessage)
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
		elseif string.find(p3.Name, "^RBXTeam") then
			function p3.OnIncomingMessage(TextChatMessage)
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
		elseif string.find(p3.Name, "^RBXWhisper") and LocalPlayer then
			function p3.OnIncomingMessage(TextChatMessage)
				-- upvalues: GetOtherDisplayNameInWhisperChannelModule (upval), p3 (copy), LocalPlayer (upval), Enabled (ref), JoinResult (upval), GetNameColorModule (upval), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval)
				local TextSource = TextChatMessage.TextSource
				
				if TextSource then
					local OtherDisplayNameInWhisperChannelModule = GetOtherDisplayNameInWhisperChannelModule(p3, LocalPlayer)
					
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
		p3.MessageReceived:Connect(function(TextChatMessage)
			-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (upval), _processIncomingMessageCore (upval), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), NewResult (upval), FFlagExpChatPerfTracking (upval), LocalPlayer (upval), ExpChatPerfTracker (upval), ReportMessageReceivedModule (upval), HandleChannelWelcomeMessageModule (upval), DisplaySystemMessageModule (upval), JoinResult (upval), FFlagExpChatUseMessagesStore (upval), MessagesStoreModule (upval), GetTransparencyStoreModule (upval), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (upval), FFlagExpChatUnreadTabIndicatorV2WindowModule (upval), StoreModule (upval), MarkChannelUnreadForIncomingMessageModule (upval), IncomingMessageReceivedModule (upval), ShouldSendHighFrequencyTelemetryModule (upval), ExpChatMessageResponseUserSamplePermyriad (upval), Analytics (upval), config (upval)
			if GetFFlagTextChatEnableUniverseChatTabsFunction() then
				_processIncomingMessageCore(TextChatMessage, nil, nil)
				
				return
			end
			if GetFFlagExpChatProtectedChatInternalAPIsFunction() then
				NewResult:debug("Incoming MessageReceived Status: {} TextInternal: {}", TextChatMessage.Status.Name, TextChatMessage.TextInternal)
			else
				NewResult:debug("Incoming MessageReceived Status: {} Text: {}", TextChatMessage.Status.Name, TextChatMessage.Text)
			end
			if FFlagExpChatPerfTracking and (TextChatMessage.TextSource and TextChatMessage.TextSource.UserId or "UNKNOWN_TEXT_SOURCE_USER_ID") ~= (LocalPlayer and LocalPlayer.UserId or "UNKNOWN_LOCAL_USER_ID") then
				ExpChatPerfTracker.start(ExpChatPerfTracker.Events.MessageReceiveToWindowRenderInterval, { messageId = TextChatMessage.MessageId })
			end
			if LocalPlayer then
				ReportMessageReceivedModule(LocalPlayer.UserId, TextChatMessage)
			end
			if LocalPlayer and TextChatMessage.TextSource and TextChatMessage.TextSource.UserId ~= LocalPlayer.UserId then
				local HandleChannelWelcomeMessageModuleResult = HandleChannelWelcomeMessageModule(TextChatMessage, LocalPlayer)
				
				if HandleChannelWelcomeMessageModuleResult then
					DisplaySystemMessageModule(HandleChannelWelcomeMessageModuleResult.key, HandleChannelWelcomeMessageModuleResult.args, HandleChannelWelcomeMessageModuleResult.metadata, JoinResult.translator, TextChatMessage.TextChannel)
				end
			end
			local IsUserIdMatch: boolean = LocalPlayer and (TextChatMessage.TextSource and TextChatMessage.TextSource.UserId == LocalPlayer.UserId)
			
			if FFlagExpChatUseMessagesStore then
				MessagesStoreModule.handleIncomingOrOutgoingMessage(TextChatMessage, IsUserIdMatch)
				GetTransparencyStoreModule(false).resetTextTransparency()
				
				if FFlagExpChatUseChannelTabsStore and ChannelTabsStoreModule then
					ChannelTabsStoreModule.handleIncomingOrOutgoingMessage(TextChatMessage, IsUserIdMatch)
				elseif FFlagExpChatUnreadTabIndicatorV2WindowModule then
					StoreModule:dispatch(MarkChannelUnreadForIncomingMessageModule(TextChatMessage, IsUserIdMatch))
				end
			else
				StoreModule:dispatch(IncomingMessageReceivedModule(TextChatMessage, IsUserIdMatch))
				GetTransparencyStoreModule(false).resetTextTransparency()
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
	local t1 = {}
	local Flag1 = false
	
	local _ = function()
		-- upvalues: ExpChatNewSystemMessagesExperimentation (upval), Flag1 (ref)
		if ExpChatNewSystemMessagesExperimentation.isExperimentEnabled and not Flag1 then
			Flag1 = true
			ExpChatNewSystemMessagesExperimentation.logExposure()
			
			return
		end
	end
	
	local function postProcessSummarySystemMessage(p3)
		-- upvalues: SummaryMessageRichTextModule (upval)
		return SummaryMessageRichTextModule.wrapInSummaryMutedStyle(`{SummaryMessageRichTextModule.getSummaryIconPrefix()} {p3}`)
	end
	
	local function tryShowSummarySystemMessageOnChannel(TextChannel)
		-- upvalues: IsEnabled (ref), t1 (copy), ExpChatNewSystemMessagesExperimentation (upval), Flag1 (ref), DisplaySystemMessageModule (upval), JoinResult (ref), FFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule (upval), postProcessSummarySystemMessage (copy), SummaryMessageRichTextModule (upval)
		if not TextChannel then return end
		if not IsEnabled then return end
		if t1[TextChannel.Name] then return end
		if TextChannel.Name ~= "RBXGeneral" then return end
		t1[TextChannel.Name] = true
		
		if ExpChatNewSystemMessagesExperimentation.isExperimentEnabled and ExpChatNewSystemMessagesExperimentation.isExperimentEnabled and not Flag1 then
			Flag1 = true
			ExpChatNewSystemMessagesExperimentation.logExposure()
		end
		DisplaySystemMessageModule(if ExpChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "CoreScripts.TextChat.Description.RobloxSummarizesMessagesFromAllPlayers" else "CoreScripts.TextChat.ChatWindow.SummarySystemMessage", nil, "Roblox.Summary.Info", JoinResult.translator, TextChannel, if ExpChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "Roblox summarizes messages from players of all ages." else "Roblox auto-generates summaries of players' messages.", if FFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule then postProcessSummarySystemMessage else function(p3)
			-- upvalues: SummaryMessageRichTextModule (upval)
			return SummaryMessageRichTextModule.wrapInSummaryMutedStyle(`{SummaryMessageRichTextModule.getSummaryIconPrefix()} {p3}`)
		end)
	end
	
	local function tryAddThirdPartySummaryGlobalSystemMessage()
		-- upvalues: Flag (ref), IsEnabled (ref), FFlagExpChatEnableGlobalChatSummarySystemMessageModule (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), TextChatService (upval), JoinResult (ref), ExpChatSuppressGlobalSummaryTabUnread (upval), FFlagExpChatUseMessagesStore (upval), MessagesStoreModule (copy), FFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule (upval), postProcessSummarySystemMessage (copy), StoreModule (copy), UniverseChatSystemMessageAddedModule (upval), FFlagFixGlobalChat3pSummarySystemMessageModule (upval)
		if Flag or not IsEnabled or not FFlagExpChatEnableGlobalChatSummarySystemMessageModule or not GetFFlagTextChatEnableUniverseChatTabsFunction() or not TextChatService:HasAllocatedUniverseChatContext("global") then return end
		local CoreScriptsTextChatChatWindowSummarySystemMessage = JoinResult.translator:FormatByKey("CoreScripts.TextChat.ChatWindow.SummarySystemMessage")
		local RobloxSummaryGlobalChat = if ExpChatSuppressGlobalSummaryTabUnread then "Roblox.Summary.GlobalChat" else nil
		Flag = true
		
		if FFlagExpChatUseMessagesStore and MessagesStoreModule then
			MessagesStoreModule.addSystemMessage(CoreScriptsTextChatChatWindowSummarySystemMessage, "RBXGlobal", RobloxSummaryGlobalChat, if FFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule then postProcessSummarySystemMessage else nil)
			
			return
		else
			StoreModule:dispatch(UniverseChatSystemMessageAddedModule(CoreScriptsTextChatChatWindowSummarySystemMessage, "RBXGlobal", RobloxSummaryGlobalChat, nil, if FFlagFixGlobalChat3pSummarySystemMessageModule and FFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule then postProcessSummarySystemMessage else nil))
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
				ExpChatFeatureValueChanged.OnClientEvent:Connect(function(UserId, p3, p4)
					-- upvalues: NewResult (upval), LocalPlayer (upval), FFlagEnableClientSummarySystemMessageOnLua (upval), FFlagChatSummariesSettingEnabled (upval), IsEnabled (upval), TextChatService (upval), tryShowSummarySystemMessageOnChannel (upval), tryAddThirdPartySummaryGlobalSystemMessage (upval), FFlagAIRephraseSettingEnabled (upval), GetUserChatSettingsStoreModule (upval)
					NewResult:debug("Incoming ExpChatFeatureValueChanged userId: {}, featureName: {}, featureValue: {}", UserId, p3, p4)
					
					if LocalPlayer and UserId == LocalPlayer.UserId then
						if FFlagEnableClientSummarySystemMessageOnLua and p3 == "EligibleForThirdPartySummary" and not FFlagChatSummariesSettingEnabled then
							IsEnabled = p4 == "true"
							
							if IsEnabled then
								for _, TextChannel in TextChatService:GetDescendants() do
									if TextChannel:IsA("TextChannel") then
										tryShowSummarySystemMessageOnChannel(TextChannel)
									end
								end
								tryAddThirdPartySummaryGlobalSystemMessage()
							end
						end
						if FFlagAIRephraseSettingEnabled and p3 == "AIRephraseSettingStatus" then
							GetUserChatSettingsStoreModule.updateExpChatFeatureValue(p3, p4)
						end
						if FFlagChatSummariesSettingEnabled and p3 == "AllowThirdPartySummary" then
							GetUserChatSettingsStoreModule.updateExpChatFeatureValue(p3, p4)
							IsEnabled = p4 == "Enabled"
							
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
	TextChatService.SendingMessage:Connect(function(TextChatMessage)
		-- upvalues: FFlagExpChatPerfTracking (upval), ExpChatPerfTracker (upval), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), NewResult (upval), LocalPlayer (copy), HandleChannelWelcomeMessageModule (upval), DisplaySystemMessageModule (upval), JoinResult (ref), FFlagExpChatUseMessagesStore (upval), MessagesStoreModule (copy), StoreModule (copy), OutgoingMessageSentModule (upval), Analytics (upval), CountParticipantsInTextChannelFunction (upval)
		if FFlagExpChatPerfTracking then
			ExpChatPerfTracker.start(ExpChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = TextChatMessage.MessageId })
		end
		if GetFFlagExpChatProtectedChatInternalAPIsFunction() then
			NewResult:debug("Outgoing SendingMessage Status: {} TextInternal: {}", TextChatMessage.Status.Name, TextChatMessage.TextInternal)
		else
			NewResult:debug("Outgoing SendingMessage Status: {} Text: {}", TextChatMessage.Status.Name, TextChatMessage.Text)
		end
		if LocalPlayer then
			local HandleChannelWelcomeMessageModuleResult = HandleChannelWelcomeMessageModule(TextChatMessage, LocalPlayer)
			
			if HandleChannelWelcomeMessageModuleResult and HandleChannelWelcomeMessageModuleResult.key then
				DisplaySystemMessageModule(HandleChannelWelcomeMessageModuleResult.key, HandleChannelWelcomeMessageModuleResult.args, HandleChannelWelcomeMessageModuleResult.metadata, JoinResult.translator, TextChatMessage.TextChannel)
			end
		end
		if FFlagExpChatUseMessagesStore then
			MessagesStoreModule.handleIncomingOrOutgoingMessage(TextChatMessage, true)
		else
			StoreModule:dispatch(OutgoingMessageSentModule(TextChatMessage))
		end
		local TextChannel = TextChatMessage.TextChannel
		
		if TextChannel then
			Analytics.FireClientAnalyticsWithEventName("MessageSent", {
				channelName = TextChannel.Name,
				totalParticipants = CountParticipantsInTextChannelFunction(TextChannel)
			})
		end
	end)
	
	local _ = function()
		-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (upval), TextChatService (upval), FFlagExpChatPerfTracking (upval), ExpChatPerfTracker (upval), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), NewResult (upval), LocalPlayer (copy), HandleChannelWelcomeMessageModule (upval), DisplaySystemMessageModule (upval), JoinResult (ref), FFlagExpChatUseMessagesStore (upval), MessagesStoreModule (copy), StoreModule (copy), OutgoingMessageSentModule (upval), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (copy), Analytics (upval), CountParticipantsInTextChannelFunction (upval)
		if GetFFlagTextChatEnableUniverseChatTabsFunction() then
			TextChatService.SendingUniverseChatMessage:Connect(function(TextChatMessage)
				-- upvalues: FFlagExpChatPerfTracking (upval), ExpChatPerfTracker (upval), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), NewResult (upval), LocalPlayer (upval), HandleChannelWelcomeMessageModule (upval), DisplaySystemMessageModule (upval), JoinResult (upval), TextChatService (upval), FFlagExpChatUseMessagesStore (upval), MessagesStoreModule (upval), StoreModule (upval), OutgoingMessageSentModule (upval), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (upval), Analytics (upval), CountParticipantsInTextChannelFunction (upval)
				if FFlagExpChatPerfTracking then
					ExpChatPerfTracker.start(ExpChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = TextChatMessage.MessageId })
				end
				if GetFFlagExpChatProtectedChatInternalAPIsFunction() then
					NewResult:debug("Outgoing SendingMessage Status: {} TextInternal: {}", TextChatMessage.Status.Name, TextChatMessage.TextInternal)
				else
					NewResult:debug("Outgoing SendingMessage Status: {} Text: {}", TextChatMessage.Status.Name, TextChatMessage.Text)
				end
				if LocalPlayer then
					local HandleChannelWelcomeMessageModuleResult = HandleChannelWelcomeMessageModule(TextChatMessage, LocalPlayer)
					
					if HandleChannelWelcomeMessageModuleResult and HandleChannelWelcomeMessageModuleResult.key then
						DisplaySystemMessageModule(HandleChannelWelcomeMessageModuleResult.key, HandleChannelWelcomeMessageModuleResult.args, HandleChannelWelcomeMessageModuleResult.metadata, JoinResult.translator, TextChatMessage.TextChannel)
					end
				end
				local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
				local TargetTextChannel = ChatInputBarConfiguration and ChatInputBarConfiguration.TargetTextChannel
				local RBXGlobal = if TargetTextChannel then nil else "RBXGlobal"
				
				if FFlagExpChatUseMessagesStore then
					MessagesStoreModule.handleIncomingOrOutgoingMessage(TextChatMessage, true, RBXGlobal)
				else
					StoreModule:dispatch(OutgoingMessageSentModule(TextChatMessage, RBXGlobal))
				end
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
			-- upvalues: FFlagExpChatPerfTracking (upval), ExpChatPerfTracker (upval), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), NewResult (upval), LocalPlayer (copy), HandleChannelWelcomeMessageModule (upval), DisplaySystemMessageModule (upval), JoinResult (ref), TextChatService (upval), FFlagExpChatUseMessagesStore (upval), MessagesStoreModule (copy), StoreModule (copy), OutgoingMessageSentModule (upval), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (copy), Analytics (upval), CountParticipantsInTextChannelFunction (upval)
			if FFlagExpChatPerfTracking then
				ExpChatPerfTracker.start(ExpChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = TextChatMessage.MessageId })
			end
			if GetFFlagExpChatProtectedChatInternalAPIsFunction() then
				NewResult:debug("Outgoing SendingMessage Status: {} TextInternal: {}", TextChatMessage.Status.Name, TextChatMessage.TextInternal)
			else
				NewResult:debug("Outgoing SendingMessage Status: {} Text: {}", TextChatMessage.Status.Name, TextChatMessage.Text)
			end
			if LocalPlayer then
				local HandleChannelWelcomeMessageModuleResult = HandleChannelWelcomeMessageModule(TextChatMessage, LocalPlayer)
				
				if HandleChannelWelcomeMessageModuleResult and HandleChannelWelcomeMessageModuleResult.key then
					DisplaySystemMessageModule(HandleChannelWelcomeMessageModuleResult.key, HandleChannelWelcomeMessageModuleResult.args, HandleChannelWelcomeMessageModuleResult.metadata, JoinResult.translator, TextChatMessage.TextChannel)
				end
			end
			local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			local TargetTextChannel = ChatInputBarConfiguration and ChatInputBarConfiguration.TargetTextChannel
			local RBXGlobal = if TargetTextChannel then nil else "RBXGlobal"
			
			if FFlagExpChatUseMessagesStore then
				MessagesStoreModule.handleIncomingOrOutgoingMessage(TextChatMessage, true, RBXGlobal)
			else
				StoreModule:dispatch(OutgoingMessageSentModule(TextChatMessage, RBXGlobal))
			end
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
	
	if GetFFlagExpChatEnableChannelTabsUIModule() then
		local ChannelTabsConfiguration = TextChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
		local Enabled = if ChannelTabsConfiguration then ChannelTabsConfiguration.Enabled else false
		local NoEnabled: boolean = GetFFlagTextChatEnableUniverseChatTabsFunction() and not Enabled
		for _, descendant1 in pairs(TextChatService:GetDescendants()) do
			if descendant1.Parent and descendant1.Parent:IsA("TextChannel") and (descendant1 and (descendant1:IsA("TextSource") and (Players.LocalPlayer and Players.LocalPlayer.UserId == descendant1.UserId))) then
				StoreModule:dispatch(LocalTextChannelParticipantAddedModule(descendant1.Parent))
				
				if FFlagExpChatUseChannelTabsStore and ChannelTabsStoreModule then
					local Name = descendant1.Parent.Name
					
					if Name ~= "RBXSystem" and (not NoEnabled or Name == "RBXGeneral") then
						ChannelTabsStoreModule.addChannelTab({ type = "TextChat", name = Name }, if Name == "RBXGeneral" then nil elseif GetFFlagTextChatEnableUniverseChatTabsFunction() then if Name == "RBXGeneral" then 1 elseif Name == "RBXGlobal" then 2 else 3 else 2)
					end
				end
			end
			if descendant1:IsA("TextChannel") then
				descendant1.DescendantRemoving:Connect(function(Descendant)
					-- upvalues: Players (upval), StoreModule (copy), LocalTextChannelParticipantRemovedFunction (upval), descendant1 (copy), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (copy)
					if Descendant and (Descendant:IsA("TextSource") and (Players.LocalPlayer and Players.LocalPlayer.UserId == Descendant.UserId)) then
						StoreModule:dispatch(LocalTextChannelParticipantRemovedFunction(descendant1))
						
						if FFlagExpChatUseChannelTabsStore and ChannelTabsStoreModule then
							ChannelTabsStoreModule.removeChannelTab(descendant1.Name)
						end
					end
				end)
			end
		end
		TextChatService.DescendantAdded:Connect(function(Descendant)
			-- upvalues: Players (upval), StoreModule (copy), LocalTextChannelParticipantAddedModule (upval), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (copy), NoEnabled (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), LocalTextChannelParticipantRemovedFunction (upval)
			if Descendant.Parent and Descendant.Parent:IsA("TextChannel") and (Descendant and (Descendant:IsA("TextSource") and (Players.LocalPlayer and Players.LocalPlayer.UserId == Descendant.UserId))) then
				StoreModule:dispatch(LocalTextChannelParticipantAddedModule(Descendant.Parent))
				
				if FFlagExpChatUseChannelTabsStore and ChannelTabsStoreModule then
					local Name = Descendant.Parent.Name
					
					if Name ~= "RBXSystem" and (not NoEnabled or Name == "RBXGeneral") then
						ChannelTabsStoreModule.addChannelTab({ type = "TextChat", name = Name }, if Name == "RBXGeneral" then nil elseif GetFFlagTextChatEnableUniverseChatTabsFunction() then if Name == "RBXGeneral" then 1 elseif Name == "RBXGlobal" then 2 else 3 else 2)
					end
				end
			end
			if Descendant:IsA("TextChannel") then
				Descendant.DescendantRemoving:Connect(function(Descendant1)
					-- upvalues: Players (upval), StoreModule (upval), LocalTextChannelParticipantRemovedFunction (upval), Descendant (copy), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (upval)
					if Descendant1 and (Descendant1:IsA("TextSource") and (Players.LocalPlayer and Players.LocalPlayer.UserId == Descendant1.UserId)) then
						StoreModule:dispatch(LocalTextChannelParticipantRemovedFunction(Descendant))
						
						if FFlagExpChatUseChannelTabsStore and ChannelTabsStoreModule then
							ChannelTabsStoreModule.removeChannelTab(Descendant.Name)
						end
					end
				end)
			end
		end)
	end
	if GetFFlagTextChatEnableUniverseChatTabsFunction() then
		local t2 = {}
		
		local function handleUniverseChatChannelAllocated(Context)
			-- upvalues: t2 (copy), TextChatService (upval), FFlagExpChatUseUnifiedTooltipStore (upval), GetChatTooltipStoreModule (upval), StoreModule (copy), UniverseChatChannelAddedModule (upval), FFlagExpChatUseChannelTabsStore (upval), ChannelTabsStoreModule (copy), GetFFlagEnableExpChatUniverseChatTabNamesFunction (upval), JoinResult (ref), FFlagExpChatUseMessagesStore (upval), MessagesStoreModule (copy), GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction (upval), FFlagExpChatUnreadTabIndicatorV2WindowModule (upval), MarkChannelUnreadForSystemMessageModule (upval), UniverseChatSystemMessageAddedModule (upval), tryAddThirdPartySummaryGlobalSystemMessage (copy)
			if t2[Context] then return end
			t2[Context] = true
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
			end
			StoreModule:dispatch(UniverseChatChannelAddedModule(Name, if Name == "RBXGeneral" then 1 elseif Name == "RBXGlobal" then 2 else 3))
			
			if FFlagExpChatUseChannelTabsStore and ChannelTabsStoreModule then
				ChannelTabsStoreModule.addChannelTab({ type = "UniverseChat", name = Name }, nil)
			end
			if GetFFlagEnableExpChatUniverseChatTabNamesFunction() and Name ~= "" then
				local Success, Result = pcall(function()
					-- upvalues: JoinResult (upval)
					return JoinResult.translator:FormatByKey("CoreScripts.TextChat.ChatWindow.ChatEnabled.Global2")
				end)
				
				if Success and Result and Result ~= "" then
					if FFlagExpChatUseMessagesStore and MessagesStoreModule then
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
					elseif GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction() then
						StoreModule:dispatch(UniverseChatSystemMessageAddedModule(Result, Name, "Roblox.Welcome.GlobalChat"))
					else
						StoreModule:dispatch(UniverseChatSystemMessageAddedModule(Result, Name))
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
			-- upvalues: ShouldFilterGlobalMessageModule (upval), GetGlobalMutedUsersStoreModule (upval), LocalPlayer (copy), FFlagChatLineReportingGlobalMuteEnabled (upval), _processIncomingMessageCore (copy)
			if ShouldFilterGlobalMessageModule(TextChatMessage, GetGlobalMutedUsersStoreModule(false), LocalPlayer and LocalPlayer.UserId) then return end
			if FFlagChatLineReportingGlobalMuteEnabled then
				local config = { channelNameOverride = "RBXGlobal", isUniverseChat = true }
				_processIncomingMessageCore(TextChatMessage, config and config.channelNameOverride, config and config.isUniverseChat)
				
				return
			else
				_processIncomingMessageCore(TextChatMessage, "RBXGlobal", nil)
			end
		end)
	end
	local function runOnBubbleDisplayed(Model: Model, Message, TextChatMessage)
		-- upvalues: Players (upval), HttpService (upval), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), FFlagExpChatUseMessagesStore (upval), MessagesStoreModule (copy), StoreModule (copy), IncomingBubbleChatMessageReceivedModule (upval)
		local Player = if Model:IsA("Model") then Players:GetPlayerFromCharacter(Model) else nil
		local Guid = HttpService:GenerateGUID(false)
		local BubbleChatMessageProperties = nil
		local TranslationInternal = nil
		
		if TextChatMessage then
			Guid = TextChatMessage.MessageId
			BubbleChatMessageProperties = TextChatMessage.BubbleChatMessageProperties
			TranslationInternal = if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.TranslationInternal else TextChatMessage.Translation
		end
		local config = {
			message = Message,
			translation = TranslationInternal,
			bubbleChatMessageId = Guid,
			bubbleChatMessageUserId = Player and tostring(Player.UserId) or nil,
			partOrModel = Model,
			timestamp = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000),
			bubbleChatMessageProperties = BubbleChatMessageProperties
		}
		
		if FFlagExpChatUseMessagesStore then
			MessagesStoreModule.handleIncomingBubbleChatMessage(config)
			
			return
		else
			StoreModule:dispatch(IncomingBubbleChatMessageReceivedModule(config))
		end
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
		-- upvalues: JoinResult (ref), FFlagExpChatUseMessagesStore (upval), ChatConfigurationStoreModule (copy), StoreModule (copy), LegacyBubbleChatSettingsChangedModule (upval)
		if JoinResult.validateLegacyBubbleChatSettings then
			local ValidateLegacyBubbleChatSettingsResult, ValidateLegacyBubbleChatSettingsResult2 = JoinResult.validateLegacyBubbleChatSettings(Settings)
			assert(ValidateLegacyBubbleChatSettingsResult, "Bad settings object passed to Chat:SetBubbleChatSettings:\n inside consolidated BubbleChat " .. (ValidateLegacyBubbleChatSettingsResult2 or ""))
			
			if FFlagExpChatUseMessagesStore and ChatConfigurationStoreModule then
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
	
	local t3 = {}
	
	local function setupTextChatCommands()
		-- upvalues: Commands (upval), findCommandInstance (copy), t3 (copy), FFlagExpChatUseMessagesStore (upval), StoreModule (copy), Context (upval), DisplaySystemMessageModule (upval), JoinResult (ref), CommandAliasChangedFunction (upval)
		for _, enabledCommand in ipairs(Commands.enabledCommands) do
			if enabledCommand.clientRun then
				local CommandInstance = findCommandInstance(enabledCommand.name)
				
				if CommandInstance and not t3[CommandInstance] then
					t3[CommandInstance] = true
					CommandInstance.Triggered:Connect(function(Player: Player, ...)
						-- upvalues: FFlagExpChatUseMessagesStore (upval), enabledCommand (copy), StoreModule (upval), Context (upval), DisplaySystemMessageModule (upval), JoinResult (upval)
						local ClientRunResult = if FFlagExpChatUseMessagesStore then enabledCommand.clientRun(StoreModule, Player.UserId, (...), Context) else enabledCommand.clientRun(StoreModule, Player.UserId, ...)
						
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
			-- upvalues: FFlagExpChatUseMessagesStore (upval), MessagesStoreModule (copy), StoreModule (copy), ChatPrivacySettingsReceivedModule (upval)
			if FFlagExpChatUseMessagesStore then
				MessagesStoreModule.setCanLocalUserChat(Result)
				
				return
			else
				StoreModule:dispatch(ChatPrivacySettingsReceivedModule(Result))
			end
		end):catch(function()
			-- upvalues: FFlagExpChatUseMessagesStore (upval), MessagesStoreModule (copy), StoreModule (copy), ChatPrivacySettingsFetchFailedModule (upval)
			if FFlagExpChatUseMessagesStore then
				MessagesStoreModule.setCanLocalUserChat(false)
				
				return
			else
				StoreModule:dispatch(ChatPrivacySettingsFetchFailedModule())
			end
		end)
	end
	watchPlayersService(JoinResult, StoreModule, MessagesStoreModule)
	local Constants = UIBloxModule.App.Style.Constants
	local Element = RoactModule.createElement(UIBloxModule.App.Style.AppStyleProvider, {
		style = ({
			Dark = {
				themeName = Constants.ThemeName.Dark,
				fontName = Constants.FontName.Gotham
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
			gameTranslator = if GetFFlagExpChatEnableChannelTabsUIModule() then JoinResult.gameTranslator else nil,
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
		isGamepadEnabled = UserInputService.PreferredInput == Enum.PreferredInput.Gamepad
	}))
	ReportVersionLoadedModule(Analytics, Version[1])
	NewResult:trace("Roact.mount to {}", (tostring(JoinResult.parent)))
	local ExperienceChat = RoactModule.mount(Element, JoinResult.parent, "ExperienceChat")
	local ChatEnabledSystemMessageModuleResult = ChatEnabledSystemMessageModule({
		translator = JoinResult.translator,
		defaultSystemTextChannel = JoinResult.defaultSystemTextChannel,
		localPlayer = LocalPlayer
	})
	
	local function updateChatStatus(ChatAvailabilityStatus)
		-- upvalues: ChatStatusStoreModule (copy), IsChatRegionLockedModule (upval), DisplaySystemMessageModule (upval), JoinResult (ref), ExpChatNewSystemMessagesExperimentation (upval), Flag1 (ref), CanPlatformEnableChatModule (upval), FFlagExpChatRefactorEnabledMessageLogicModule (upval), FStringExpChatChatWithTFAmpFeatureNameModule (upval), FStringExpChatChatWithTFAmpNameSpaceModule (upval), NewResult (upval), AmpApiProvider (upval), LocalPlayer (copy), AccessResponseEnum (upval), CanOnlyChatInRegionModule (upval), ChatEnabledSystemMessageModuleResult (copy)
		ChatStatusStoreModule.setChatStatus(ChatAvailabilityStatus)
		
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
					-- upvalues: FStringExpChatChatWithTFAmpFeatureNameModule (upval), FStringExpChatChatWithTFAmpNameSpaceModule (upval), NewResult (upval), AmpApiProvider (upval), LocalPlayer (upval), AccessResponseEnum (upval), DisplaySystemMessageModule (upval), JoinResult (upval), CanOnlyChatInRegionModule (upval), ChatEnabledSystemMessageModuleResult (upval)
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
						DisplaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithTF", nil, "Roblox.ChatEnabled.Info", JoinResult.translator, JoinResult.defaultSystemTextChannel, "Only your trusted friends can chat with you.")
						
						return
					end
					if CanOnlyChatInRegionModule() then
						DisplaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatInRegion", nil, "Roblox.ChatEnabled.Info", JoinResult.translator, JoinResult.defaultSystemTextChannel, "You can view system messages and chat with users in your region only.")
						
						return
					else
						ChatEnabledSystemMessageModuleResult()
					end
				end)()
				
				return
			else
				if ChatAvailabilityStatus == "EnabledBubble" or ChatAvailabilityStatus == "Enabled" and CanOnlyChatInRegionModule() then
					DisplaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatInRegion", nil, "Roblox.ChatEnabled.Info", JoinResult.translator, JoinResult.defaultSystemTextChannel, "You can view system messages and chat with users in your region only.")
					
					return
				end
				if ChatAvailabilityStatus == "Enabled" then
					ChatEnabledSystemMessageModuleResult()
					
					return
				end
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
		-- upvalues: NewResult (upval), FFlagExpChatUseMessagesStore (upval), MessagesStoreModule (copy), StoreModule (copy), HiddenMessageReceivedModule (upval), IsUserChatEnabledModule (upval), LocalPlayer (copy), Count (ref), RandomValue (ref), ExpChatHiddenMessagesPromptThresholdLowerBound (upval), ExpChatHiddenMessagesPromptThresholdUpperBound (upval), DisplaySystemMessageModule (upval), JoinResult (ref), GetTransparencyStoreModule (upval)
		NewResult:debug("Handling a message from UserMessageIntentSent")
		
		if FFlagExpChatUseMessagesStore then
			MessagesStoreModule.handleHiddenMessageReceived(UserIntentMessage)
		else
			StoreModule:dispatch(HiddenMessageReceivedModule(UserIntentMessage))
		end
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
	
	if FFlagAEGIS2EnableGatesForExpChatModule and LocalPlayer then
		if FFlagEnableModerateChatRemoteEvent then
			local ExperienceChatVisualConfigModule = GetExperienceChatVisualConfigModule()
			local ChatModerationStoreModule = GetChatModerationStoreModule(false)
			local IsSettingEnabled = false
			JoinResult.moderateChatStoreDisposeEffect = SignalsModule.createEffect(function(p3)
				-- upvalues: ChatModerationStoreModule (copy), IsSettingEnabled (ref), DisplaySystemMessageModule (upval), JoinResult (ref), NotificationModalsManagerModule (upval), UIBloxModule (upval), ExperienceChatVisualConfigModule (copy), FFlagConnectionsToFriendsRename (upval)
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
							toastSubtitle = JoinResult.translator:FormatByKey(if FFlagConnectionsToFriendsRename then "CoreScripts.TextChat.Toast.ModerateChatOff.Subtitle.FriendsRename" else "CoreScripts.TextChat.Toast.ModerateChatOff.Subtitle"),
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
			-- upvalues: ChatAvailabilityStatus (ref), LocalPlayer (copy), NewResult (upval), updateChatStatus (copy), FFlagExpChatPresetChatEnabled (upval), FFlagExpChatPresetChatLoadTestEnabled (upval), IsUserChatEnabledModule (upval), InitializePresetChatModule (upval), GetPresetChatStoreModule (upval), FFlagExpChatEnableFOMOUpsellModule (upval), ShouldShowFOMOUpsellModule (upval), FFlagExpChatEnableCrossAgeChatActivityModule (upval), ShouldShowCrossAgeChatActivityModule (upval), UserMessageIntentSentConnection (ref), TextChatService (upval), handleUserMessageIntentSent (copy), FFlagExpChatClearHiddenMessagesPostAgeCheckModule (upval), FFlagExpChatUseMessagesStore (upval), MessagesStoreModule (copy), StoreModule (copy), HiddenMessagesClearedModule (upval), GetTransparencyStoreModule (upval), ChatPrivacySettingsReceivedModule (upval)
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
					if FFlagExpChatUseMessagesStore then
						MessagesStoreModule.handleHiddenMessagesCleared()
					else
						StoreModule:dispatch(HiddenMessagesClearedModule())
					end
					GetTransparencyStoreModule(false).resetTextTransparency()
				end
			end
			if FFlagExpChatUseMessagesStore then
				MessagesStoreModule.setCanLocalUserChat(IsUserChatEnabledModule(ChatAvailabilityStatus))
				
				return
			else
				StoreModule:dispatch(ChatPrivacySettingsReceivedModule(IsUserChatEnabledModule(ChatAvailabilityStatus)))
			end
		end)
	elseif IsChatRegionLockedModule() then
		DisplaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionUnavailable", nil, "Roblox.ChatDisabled.Info", JoinResult.translator, JoinResult.defaultSystemTextChannel, if FFlagAEGIS2EnableGatesForExpChatModule then "You can only view system messages here. Chat is currently unavailable in your region." else "Chat is unavailable in your region. You can still receive system messages.")
	elseif not FFlagAEGIS2EnableGatesForExpChatModule and getChatTranslationEnabled() then
		DisplaySystemMessageModule("CoreScripts.TextChat.ChatTranslation.ChatWindow.SystemMessageNew", nil, "Roblox.ChatTranslation.ChatWindow.SystemMessage", JoinResult.translator, JoinResult.defaultSystemTextChannel, "Roblox automatically translates supported languages in chat")
	end
	if FFlagExpChatPresetChatEnabled or FFlagExpChatPresetChatLoadTestEnabled then
		InitializePresetChatModule(GetPresetChatStoreModule(false), not FFlagExpChatPresetChatEnabled and FFlagExpChatPresetChatLoadTestEnabled)
	end
	return { roactInstance = ExperienceChat }
end