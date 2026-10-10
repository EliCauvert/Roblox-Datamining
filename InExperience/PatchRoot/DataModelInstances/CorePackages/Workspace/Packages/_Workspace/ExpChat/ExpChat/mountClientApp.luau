local chatService = game:GetService("Chat")
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local textChatService = game:GetService("TextChatService")
local userInputService = game:GetService("UserInputService")
local starterGuiService = game:GetService("StarterGui")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local promiseModule = require(parent.Promise)
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local colorMode = require(parent.Foundation).Enums.ColorMode
local dictionary = require(parent.llama).Dictionary
local expChatSharedModule = require(parent.ExpChatShared)
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local ampUpsellModule = require(parent.AmpUpsell)
local ampApiProvider = ampUpsellModule.AmpApiProvider
local accessResponseEnum = ampUpsellModule.AmpEnums.AccessResponseEnum
local getAdorneeStoreModule = require(expChat.Stores.GetAdorneeStore)
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)
local getTransparencyStoreModule = require(expChat.Stores.GetTransparencyStore)
local getCharacterStoreModule = require(expChat.Stores.GetCharacterStore)
local getChatConfigurationStoreModule = require(expChat.Stores.GetChatConfigurationStore)
local getChatStatusStoreModule = require(expChat.Stores.GetChatStatusStore)
local getChatModerationStoreModule = require(expChat.Stores.GetChatModerationStore)
local getUserChatSettingsStoreModule = require(expChat.Stores.GetUserChatSettingsStore)
local getGlobalMutedUsersStoreModule = require(expChat.Stores.GetGlobalMutedUsersStore)
local dictationSafetyReminderModule = require(expChat.ChatInput.UI.ChatInputBar.Dictation.DictationSafetyReminder)
local getPresetChatStoreModule = require(expChat.Stores.GetPresetChatStore)
local getChatTooltipStoreModule = require(expChat.Stores.GetChatTooltipStore)
local getChatWindowStatusStoreModule = require(expChat.Stores.GetChatWindowStatusStore)
local initializePresetChatModule = require(expChat.PresetChat.initializePresetChat)
local isMessageForOpenChannelModule = require(expChat.isMessageForOpenChannel)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local fFlagExpChatPresetChatLoadTestEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatLoadTestEnabled
local fFlagExpChatUseUnifiedTooltipStore = expChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore
local getFFlagExpChatProtectedChatInternalAPIs = sharedFlagsModule.getFFlagExpChatProtectedChatInternalAPIs
local fFlagExpChatDictationContinuousSafetyReminder = sharedFlagsModule.FFlagExpChatDictationContinuousSafetyReminder
local fFlagExpChatInitializeWindowFromGameSettings = sharedFlagsModule.FFlagExpChatInitializeWindowFromGameSettings
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local fFlagExpChatUseProximityStore = sharedFlagsModule.FFlagExpChatUseProximityStore
local var1 = if fFlagExpChatUseProximityStore then require(expChat.Stores.GetProximityStore) else nil
local analytics = expChatSharedModule.Analytics
local countParticipantsInTextChannel = expChatSharedModule.countParticipantsInTextChannel
local appModule = require(script.Parent.App)
local var2 = expChatSharedModule.Logger:new("ExpChat/" .. script.Name)
local createDispatchBindableEventModule = require(script.Parent.createDispatchBindableEvent)
local bindableEventQueueModule = require(expChat.Events.bindableEventQueue)
local createStoreModule = require(script.Parent.createStore)
local getNameColorModule = require(script.Parent.GetNameColor)
local reportMessageReceivedModule = require(script.Parent.reportMessageReceived)
local canPlatformEnableChatModule = require(script.Parent.canPlatformEnableChat)
local watchForErrors = expChatSharedModule.watchForErrors
local commands = expChatSharedModule.Commands
local actions = expChat.Actions
local markChannelUnreadForIncomingMessageModule = require(actions.MarkChannelUnreadForIncomingMessage)
local markChannelUnreadForSystemMessageModule = require(actions.MarkChannelUnreadForSystemMessage)
local textChannelCreated = expChatSharedModule.Actions.TextChannelCreated
local textChannelRemoved = expChatSharedModule.Actions.TextChannelRemoved
local playerAdded = expChatSharedModule.Actions.PlayerAdded
local playerRemoved = expChatSharedModule.Actions.PlayerRemoved
local characterAdded = expChatSharedModule.Actions.CharacterAdded
local localCharacterLoaded = expChatSharedModule.Actions.LocalCharacterLoaded
local localTeamChanged = expChatSharedModule.Actions.LocalTeamChanged
local clientAppLoaded = expChatSharedModule.Actions.ClientAppLoaded
local lastInputTypeChangedModule = require(actions.LastInputTypeChanged)
local chatTopBarButtonActivatedModule = require(actions.ChatTopBarButtonActivated)
local commandAliasChanged = expChatSharedModule.Actions.CommandAliasChanged
local humanoidDiedModule = require(actions.HumanoidDied)
local adorneeAddedModule = require(actions.AdorneeAdded)
local legacyBubbleChatEnabledChangedModule = require(actions.LegacyBubbleChatEnabledChanged)
local legacyBubbleChatSettingsChangedModule = require(actions.LegacyBubbleChatSettingsChanged)
local localTextChannelParticipantAddedModule = require(actions.LocalTextChannelParticipantAdded)
local localTextChannelParticipantRemoved = expChatSharedModule.Actions.LocalTextChannelParticipantRemoved
local universeChatChannelAddedModule = require(actions.UniverseChatChannelAdded)
local universeChatChannelSelected = expChatSharedModule.Actions.UniverseChatChannelSelected
local displaySystemMessageModule = require(expChat.displaySystemMessage)
local generateRichSystemMessageTextFormatModule = require(expChat.generateRichSystemMessageTextFormat)
local summaryMessageRichTextModule = require(expChat.summaryMessageRichText)
local textChatMessageChatActionTypeModule = require(expChat.TextChatMessageChatActionType)
local getExperienceChatVisualConfigModule = require(expChat.getExperienceChatVisualConfig)
local getOtherDisplayNameInWhisperChannelModule = require(expChat.getOtherDisplayNameInWhisperChannel)
local handleChannelWelcomeMessageModule = require(expChat.handleChannelWelcomeMessage)
local isPlayerVerifiedModule = require(expChat.isPlayerVerified)
local isChatRegionLockedModule = require(expChat.isChatRegionLocked)
local isUserChatEnabledModule = require(expChat.isUserChatEnabled)
local canOnlyChatInRegionModule = require(expChat.canOnlyChatInRegion)
local shouldSendHighFrequencyTelemetryModule = require(expChat.shouldSendHighFrequencyTelemetry)
local shouldShowFOMOUpsellModule = require(expChat.shouldShowFOMOUpsell)
local shouldShowCrossAgeChatActivityModule = require(expChat.shouldShowCrossAgeChatActivity)
local shouldSuppressUnreadForTabMetadataModule = require(expChat.shouldSuppressUnreadForTabMetadata)
local expChatPerfTracker = require(parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local fFlagExpChatPerfTrackerTabName = require(parent.ChatUIPrimitives).Flags.FFlagExpChatPerfTrackerTabName
local selectSelectedTabNameModule = require(expChat.selectSelectedTabName)
local flags = expChat.Flags
local getEngineFeatureFlagEnableDisplayBubbleModule = require(flags.getEngineFeatureFlagEnableDisplayBubble)
local getFFlagUnreduxLastInputTypeChangedModule = require(flags.getFFlagUnreduxLastInputTypeChanged)
local getFFlagUseCharacterStore = expChatSharedModule.Flags.getFFlagUseCharacterStore
local getFFlagExpChatSuppressWelcomeMessageTabUnread = expChatSharedModule.Flags.GetFFlagExpChatSuppressWelcomeMessageTabUnread
local getFFlagExpChatTelemetryEventTriggerModule = require(expChat.Flags.getFFlagExpChatTelemetryEventTrigger)
local fFlagExpChatWindowStatusEventFixesModule = require(flags.FFlagExpChatWindowStatusEventFixes)
local expChatMessageResponseThrottlePermyriad = game:DefineFastInt("ExpChatMessageResponseThrottlePermyriad", 0)
local expChatMessageResponseUserSamplePermyriad = game:DefineFastInt("ExpChatMessageResponseUserSamplePermyriad", 0)
local expChatHiddenMessagesPromptThresholdLowerBound = game:DefineFastInt("ExpChatHiddenMessagesPromptThresholdLowerBound", 10)
local expChatHiddenMessagesPromptThresholdUpperBound = game:DefineFastInt("ExpChatHiddenMessagesPromptThresholdUpperBound", 45)
local fFlagExpChatEnableFOMOUpsellModule = require(flags.FFlagExpChatEnableFOMOUpsell)
local fFlagExpChatClearHiddenMessagesPostAgeCheckModule = require(flags.FFlagExpChatClearHiddenMessagesPostAgeCheck)
local fFlagEnableInExpChatSummaryOnLuaModule = require(flags.FFlagEnableInExpChatSummaryOnLua)
local fFlagExpChatEnableCrossAgeChatActivityModule = require(flags.FFlagExpChatEnableCrossAgeChatActivity)
local fFlagExpChatUnreadTabIndicatorV2WindowModule = require(flags.FFlagExpChatUnreadTabIndicatorV2Window)
local expChatOnlyWakeTextForSelectedTab = game:DefineFastFlag("ExpChatOnlyWakeTextForSelectedTab", false)
local fFlagExpChatFixOutgoingUniverseChatBubbleModule = require(flags.FFlagExpChatFixOutgoingUniverseChatBubble)
local fFlagExpChatUseAdorneeStore = sharedFlagsModule.FFlagExpChatUseAdorneeStore
local fFlagExpChatUseChannelTabsStore = sharedFlagsModule.FFlagExpChatUseChannelTabsStore
local fFlagExpChatUseChatConfigStore = sharedFlagsModule.FFlagExpChatUseChatConfigStore
local fFlagEnableModerateChatRemoteEvent = sharedFlagsModule.FFlagEnableModerateChatRemoteEvent
local fFlagLuaSupportMicroGamepadPreferredInput = sharedFlagsModule.FFlagLuaSupportMicroGamepadPreferredInput
local fFlagEnableClientSummarySystemMessageOnLua = sharedFlagsModule.FFlagEnableClientSummarySystemMessageOnLua
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local getFFlagEnableExpChatUniverseChatTabNames = expChatSharedModule.Flags.GetFFlagEnableExpChatUniverseChatTabNames
local expChatRemoveSpaceFromTeamPrefix = game:DefineFastFlag("ExpChatRemoveSpaceFromTeamPrefix", false)
local fFlagAIRephraseSettingEnabled = sharedFlagsModule.FFlagAIRephraseSettingEnabled
local fFlagChatSummariesSettingEnabled = sharedFlagsModule.FFlagChatSummariesSettingEnabled
local fFlagEnableGlobalChat3pSummaryLuaAppsModule = require(flags.FFlagEnableGlobalChat3pSummaryLuaApps)
local fFlagExpChatEnableGlobalChatSummarySystemMessageModule = require(flags.FFlagExpChatEnableGlobalChatSummarySystemMessage)
local expChatSuppressGlobalSummaryTabUnread = game:DefineFastFlag("ExpChatSuppressGlobalSummaryTabUnread", false)
local fFlagExpChatRefactorEnabledMessageLogicModule = require(flags.FFlagExpChatRefactorEnabledMessageLogic)
local fFlagExpChatVirtualizeSystemMessagesModule = require(flags.FFlagExpChatVirtualizeSystemMessages)
local fStringExpChatChatWithTFAmpFeatureNameModule = require(flags.FStringExpChatChatWithTFAmpFeatureName)
local fStringExpChatChatWithTFAmpNameSpaceModule = require(flags.FStringExpChatChatWithTFAmpNameSpace)
local expChatNewSystemMessagesExperimentation = require(parent.SocialExperiments).ExpChatNewSystemMessagesExperimentation
local expChatGlobalTabDefaultExperimentation = require(parent.SocialExperiments).ExpChatGlobalTabDefaultExperimentation
local isGlobalTabFirstModule = require(expChat.isGlobalTabFirst)
local getGlobalWelcomeMessageKeyModule = require(expChat.getGlobalWelcomeMessageKey)
local fFlagExpChatGlobalTabDefaultModule = require(flags.FFlagExpChatGlobalTabDefault)

function getChatTranslationEnabled()
	-- upvalues: textChatService (ref)
	local ok, status = pcall(function()
		-- upvalues: textChatService (copy)
		return textChatService.ChatTranslationEnabled
	end)
	
	return ok and status
end

local t = {
	eventName = "MessageResponse",
	description = "When a client receives a text chat message through TextChatService.",
	links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/message_response.proto",
	backends = { "EventIngest" },
	throttlingPercentage = expChatMessageResponseThrottlePermyriad,
	lastUpdated = { 25, 10, 8 }
}
local helpers = script.helpers
local setUpConfigurationObjectsModule = require(helpers.setUpConfigurationObjects)
local setUpClientSettingsModule = require(helpers.setUpClientSettings)
local waitForFirstModule = require(helpers.waitForFirst)
local shouldFilterGlobalMessageModule = require(helpers.shouldFilterGlobalMessage)
local hasUserSelectedTabModule = require(helpers.hasUserSelectedTab)
local writeVirtualSystemMessageModule = require(helpers.writeVirtualSystemMessage)
local shouldSkipHistoricalMessageModule = require(expChat.shouldSkipHistoricalMessage)
local context = expChatSharedModule.context
local reportVersionLoadedModule = require(script.reportVersionLoaded)
local version = expChatSharedModule.Version
local atomicBindingModule = require(expChat.AtomicBinding)
local chatEnabledSystemMessageModule = require(script.SystemMessages.ChatEnabledSystemMessage)

local function watchPlayersService(p1, p2, p3)
	-- upvalues: var2 (ref), isPlayerVerifiedModule (ref), playerAdded (ref), playersService (ref), localTeamChanged (ref), fFlagExpChatUseAdorneeStore (ref), context (ref), adorneeAddedModule (ref), humanoidDiedModule (ref), atomicBindingModule (ref), waitForFirstModule (ref), localCharacterLoaded (ref), getFFlagUseCharacterStore (ref), characterAdded (ref), promiseModule (ref), displaySystemMessageModule (ref), fFlagConnectionsToFriendsRename (ref), fFlagExpChatWindowStatusEventFixesModule (ref), getChatWindowStatusStoreModule (ref), textChatService (ref), playerRemoved (ref)
	var2:trace("Watching Players service")
	local t = {}
	
	local function onPlayerAdded(p4)
		-- upvalues: var2 (copy), isPlayerVerifiedModule (copy), p2 (ref), playerAdded (copy), playersService (copy), localTeamChanged (copy), fFlagExpChatUseAdorneeStore (copy), context (copy), adorneeAddedModule (copy), humanoidDiedModule (copy), atomicBindingModule (copy), waitForFirstModule (copy), localCharacterLoaded (copy), getFFlagUseCharacterStore (copy), characterAdded (copy), t (ref)
		var2:trace("Player added: {} {}", p4.Name, tostring(p4.UserId))
		p2:dispatch(playerAdded(p4.UserId, p4.Name, p4.DisplayName, if isPlayerVerifiedModule(p4) then true else nil))
		
		if p4 == playersService.LocalPlayer then
			var2:trace("Found local player")
			p4:GetPropertyChangedSignal("Team"):Connect(function()
				-- upvalues: p2 (copy), localTeamChanged (copy), p4 (ref)
				p2:dispatch(localTeamChanged(p4.Team))
			end)
		end
		local function _()
			-- upvalues: p4 (ref), fFlagExpChatUseAdorneeStore (copy), context (copy), p2 (copy), adorneeAddedModule (copy), humanoidDiedModule (copy), atomicBindingModule (copy)
			return atomicBindingModule.new({
				humanoid = "Humanoid",
				humanoidRootPart = "HumanoidRootPart"
			}, function(p5)
				-- upvalues: p4 (copy), fFlagExpChatUseAdorneeStore (copy), context (copy), p2 (copy), adorneeAddedModule (copy), humanoidDiedModule (copy)
				local root = p5.root
				local humanoid = p5.humanoid
				local humanoidRootPart = p5.humanoidRootPart
				
				if not humanoid:IsA("Humanoid") or not humanoidRootPart:IsA("BasePart") then
					return function() end
				elseif root and humanoidRootPart and p4.Character == root then
					if fFlagExpChatUseAdorneeStore then
						context.adorneeStore.handleAdorneeAdded(p4.UserId, root, humanoid)
					else
						p2:dispatch(adorneeAddedModule(p4.UserId, root, humanoid))
					end
				end
				local diedConnection = humanoid.Died:Connect(function()
					-- upvalues: fFlagExpChatUseAdorneeStore (copy), context (copy), p4 (copy), p2 (copy), humanoidDiedModule (copy)
					if fFlagExpChatUseAdorneeStore then
						context.adorneeStore.handleHumanoidDied(p4.UserId)
						
						return
					end
					p2:dispatch(humanoidDiedModule(p4.UserId))
				end)
				
				return function()
					-- upvalues: diedConnection (ref)
					if diedConnection then
						diedConnection:Disconnect()
					end
				end
			end)
		end
		
		local var3 = atomicBindingModule.new({
			humanoid = "Humanoid",
			humanoidRootPart = "HumanoidRootPart"
		}, function(p5)
			-- upvalues: p4 (ref), fFlagExpChatUseAdorneeStore (copy), context (copy), p2 (copy), adorneeAddedModule (copy), humanoidDiedModule (copy)
			local root = p5.root
			local humanoid = p5.humanoid
			local humanoidRootPart = p5.humanoidRootPart
			
			if not humanoid:IsA("Humanoid") or not humanoidRootPart:IsA("BasePart") then
				return function() end
			elseif root and humanoidRootPart and p4.Character == root then
				if fFlagExpChatUseAdorneeStore then
					context.adorneeStore.handleAdorneeAdded(p4.UserId, root, humanoid)
				else
					p2:dispatch(adorneeAddedModule(p4.UserId, root, humanoid))
				end
			end
			local diedConnection = humanoid.Died:Connect(function()
				-- upvalues: fFlagExpChatUseAdorneeStore (copy), context (copy), p4 (copy), p2 (copy), humanoidDiedModule (copy)
				if fFlagExpChatUseAdorneeStore then
					context.adorneeStore.handleHumanoidDied(p4.UserId)
					
					return
				end
				p2:dispatch(humanoidDiedModule(p4.UserId))
			end)
			
			return function()
				-- upvalues: diedConnection (ref)
				if diedConnection then
					diedConnection:Disconnect()
				end
			end
		end)
		
		local function onCharacterAdded(p5)
			-- upvalues: waitForFirstModule (copy), p4 (ref), var2 (copy), playersService (copy), p2 (copy), localCharacterLoaded (copy), getFFlagUseCharacterStore (copy), context (copy), characterAdded (copy), var3 (ref)
			if not p5.Parent then
				waitForFirstModule(p5.AncestryChanged, p4.CharacterAdded)
			end
			if p4.Character ~= p5 or not p5.Parent then
				var2:debug("Mismatched or unparented character in onCharacterAdded for {}", tostring(p4.UserId))
				
				return
			elseif p4 == playersService.LocalPlayer then
				var2:debug("Local character loaded: {}", p5.Name)
				p2:dispatch(localCharacterLoaded(p5))
			end
			if getFFlagUseCharacterStore() then
				context.characterStore.handleCharacterAdded(p4.UserId, p5)
			else
				p2:dispatch(characterAdded(p4.UserId, p5))
			end
			var3:bindRoot(p5)
		end
		
		var3 = function(p5)
			-- upvalues: var3 (ref)
			var3:unbindRoot(p5)
		end
		
		if p4.Character then
			onCharacterAdded(p4.Character)
		end
		local characterAddedConnection = p4.CharacterAdded:Connect(onCharacterAdded)
		local characterRemovingConnection = p4.CharacterRemoving:Connect(var3)
		
		if not t[p4.UserId] then
			t[p4.UserId] = { characterAddedConnection, characterRemovingConnection }
		end
	end
	
	local function onNewPlayerAdded(p4)
		-- upvalues: onPlayerAdded (ref), playersService (copy), promiseModule (copy), displaySystemMessageModule (copy), fFlagConnectionsToFriendsRename (copy), p1 (ref), var2 (copy)
		onPlayerAdded(p4)
		
		if playersService.LocalPlayer then
			promiseModule.try(function()
				-- upvalues: p4 (ref), playersService (copy)
				return p4:IsFriendsWithAsync(playersService.LocalPlayer.UserId)
			end):andThen(function(p5)
				-- upvalues: displaySystemMessageModule (copy), fFlagConnectionsToFriendsRename (copy), p4 (ref), p1 (copy)
				if p5 then
					displaySystemMessageModule(if fFlagConnectionsToFriendsRename then "InGame.UnknownNamespace.GameChat.FriendChatNotifier.JoinMessage" else "InGame.UnknownNamespace.GameChat_FriendChatNotifier_JoinMessage", { RBX_NAME = p4.DisplayName }, "Roblox.Notification.Friend.Joined", p1.translator, p1.defaultSystemTextChannel)
				end
			end):catch(function(p5)
				-- upvalues: var2 (copy)
				var2:error("Could not fetch friendship status. Error: {}", tostring(p5))
			end)
		end
	end
	
	for i, v in pairs(playersService:GetPlayers()) do
		if v:IsA("Player") then
			onPlayerAdded(v)
		end
	end
	playersService.PlayerAdded:Connect(onNewPlayerAdded)
	playersService.PlayerRemoving:Connect(function(p4)
		-- upvalues: var2 (copy), fFlagExpChatWindowStatusEventFixesModule (copy), playersService (copy), getChatWindowStatusStoreModule (copy), textChatService (copy), p2 (ref), playerRemoved (copy), p3 (ref), fFlagExpChatUseAdorneeStore (copy), context (copy), getFFlagUseCharacterStore (copy), t (ref)
		var2:trace("Player removed: {} {}", p4.Name, tostring(p4.UserId))
		
		if fFlagExpChatWindowStatusEventFixesModule and p4 == playersService.LocalPlayer then
			local var3, var4 = getChatWindowStatusStoreModule(false).flushFinalDuration(os.clock())
			
			if var4 then
				textChatService:SendExpChatWindowStatusChange(var3.closedDuration, var3.openDuration, var3.backgroundIdleDuration, var3.textIdleDuration)
			end
		end
		p2:dispatch(playerRemoved(p4.UserId))
		p3.handlePlayerRemoved(p4.UserId)
		
		if fFlagExpChatUseAdorneeStore then
			context.adorneeStore.handlePlayerRemoved(p4.UserId)
		end
		if getFFlagUseCharacterStore() then
			context.characterStore.handlePlayerRemoved(p4.UserId)
		end
		local userId = t[p4.UserId]
		
		if userId then
			for i, v in ipairs(userId) do
				v:Disconnect()
			end
			t[p4.UserId] = nil
		end
	end)
end

local t_1 = {
	canUserChatAsync = function(p4)
		-- upvalues: chatService (ref)
		return chatService:CanUserChatAsync(p4)
	end
}

local var3 = function(p4)
	-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (ref), var2 (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), generateRichSystemMessageTextFormatModule (ref), UIBloxModule (ref)
	if getFFlagExpChatProtectedChatInternalAPIs() then
		var2:trace("System OnIncomingMessage started: PrefixTextInternal: {} TextInternal: {}", p4.PrefixTextInternal, p4.TextInternal)
	else
		var2:trace("System OnIncomingMessage started: {} {}", p4.PrefixText, p4.Text)
	end
	local textChatMessageProperties = Instance.new("TextChatMessageProperties")
	textChatMessageProperties.Text = if fFlagEnableInExpChatSummaryOnLuaModule then generateRichSystemMessageTextFormatModule(if getFFlagExpChatProtectedChatInternalAPIs() then p4.TextInternal else p4.Text, not not string.find(p4.Metadata, "Error")) else string.format("<font color=\"#%s\">%s</font>", if string.find(p4.Metadata, "Error") then UIBloxModule.App.Style.Colors.Red:ToHex() else UIBloxModule.App.Style.Colors.LightGrey:ToHex(), if getFFlagExpChatProtectedChatInternalAPIs() then p4.TextInternal else p4.Text)
	var2:trace("System OnIncomingMessage finished: {} {}", textChatMessageProperties.PrefixText, textChatMessageProperties.Text)
	
	return textChatMessageProperties
end

return function(p4)
	-- upvalues: var2 (ref), dictionary (ref), t_1 (ref), createStoreModule (ref), createDispatchBindableEventModule (ref), bindableEventQueueModule (ref), watchForErrors (ref), context (ref), fFlagExpChatUseAdorneeStore (ref), getAdorneeStoreModule (ref), fFlagExpChatUseProximityStore (ref), var1 (ref), getMessagesStoreModule (ref), fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref), fFlagExpChatVirtualizeSystemMessagesModule (ref), getFFlagExpChatSuppressWelcomeMessageTabUnread (ref), expChatOnlyWakeTextForSelectedTab (ref), isMessageForOpenChannelModule (ref), getTransparencyStoreModule (ref), displaySystemMessageModule (ref), writeVirtualSystemMessageModule (ref), fFlagExpChatUseChatConfigStore (ref), getChatConfigurationStoreModule (ref), getChatStatusStoreModule (ref), getGlobalMutedUsersStoreModule (ref), getFFlagUseCharacterStore (ref), getCharacterStoreModule (ref), analytics (ref), getFFlagUnreduxLastInputTypeChangedModule (ref), userInputService (ref), lastInputTypeChangedModule (ref), var3 (ref), chatService (ref), textChatService (ref), setUpConfigurationObjectsModule (ref), setUpClientSettingsModule (ref), fFlagExpChatInitializeWindowFromGameSettings (ref), chatTopBarButtonActivatedModule (ref), playersService (ref), shouldSkipHistoricalMessageModule (ref), getFFlagExpChatProtectedChatInternalAPIs (ref), expChatPerfTracker (ref), fFlagExpChatPerfTrackerTabName (ref), selectSelectedTabNameModule (ref), reportMessageReceivedModule (ref), handleChannelWelcomeMessageModule (ref), fFlagExpChatUnreadTabIndicatorV2WindowModule (ref), markChannelUnreadForIncomingMessageModule (ref), shouldSuppressUnreadForTabMetadataModule (ref), markChannelUnreadForSystemMessageModule (ref), shouldSendHighFrequencyTelemetryModule (ref), expChatMessageResponseUserSamplePermyriad (ref), t (ref), textChannelCreated (ref), getNameColorModule (ref), expChatRemoveSpaceFromTeamPrefix (ref), getOtherDisplayNameInWhisperChannelModule (ref), fFlagExpChatDictationContinuousSafetyReminder (ref), dictationSafetyReminderModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), expChatNewSystemMessagesExperimentation (ref), summaryMessageRichTextModule (ref), fFlagExpChatEnableGlobalChatSummarySystemMessageModule (ref), expChatSuppressGlobalSummaryTabUnread (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagEnableClientSummarySystemMessageOnLua (ref), textChannelRemoved (ref), textChatMessageChatActionTypeModule (ref), fFlagEnableGlobalChat3pSummaryLuaAppsModule (ref), fFlagAIRephraseSettingEnabled (ref), fFlagChatSummariesSettingEnabled (ref), robloxReplicatedStorageService (ref), getUserChatSettingsStoreModule (ref), countParticipantsInTextChannel (ref), fFlagExpChatGlobalTabDefaultModule (ref), fFlagExpChatFixOutgoingUniverseChatBubbleModule (ref), localTextChannelParticipantAddedModule (ref), localTextChannelParticipantRemoved (ref), fFlagExpChatUseUnifiedTooltipStore (ref), getChatTooltipStoreModule (ref), expChatGlobalTabDefaultExperimentation (ref), universeChatChannelAddedModule (ref), isGlobalTabFirstModule (ref), hasUserSelectedTabModule (ref), universeChatChannelSelected (ref), getFFlagEnableExpChatUniverseChatTabNames (ref), getGlobalWelcomeMessageKeyModule (ref), shouldFilterGlobalMessageModule (ref), httpService (ref), legacyBubbleChatEnabledChangedModule (ref), legacyBubbleChatSettingsChangedModule (ref), getEngineFeatureFlagEnableDisplayBubbleModule (ref), commands (ref), commandAliasChanged (ref), promiseModule (ref), watchPlayersService (ref), UIBloxModule (ref), colorMode (ref), roactModule (ref), appModule (ref), getFFlagExpChatTelemetryEventTriggerModule (ref), clientAppLoaded (ref), starterGuiService (ref), fFlagLuaSupportMicroGamepadPreferredInput (ref), reportVersionLoadedModule (ref), version (ref), chatEnabledSystemMessageModule (ref), isChatRegionLockedModule (ref), canPlatformEnableChatModule (ref), fFlagExpChatRefactorEnabledMessageLogicModule (ref), fStringExpChatChatWithTFAmpFeatureNameModule (ref), fStringExpChatChatWithTFAmpNameSpaceModule (ref), ampApiProvider (ref), accessResponseEnum (ref), canOnlyChatInRegionModule (ref), expChatHiddenMessagesPromptThresholdLowerBound (ref), expChatHiddenMessagesPromptThresholdUpperBound (ref), isUserChatEnabledModule (ref), fFlagExpChatEnableFOMOUpsellModule (ref), shouldShowFOMOUpsellModule (ref), fFlagExpChatEnableCrossAgeChatActivityModule (ref), shouldShowCrossAgeChatActivityModule (ref), fFlagEnableModerateChatRemoteEvent (ref), getExperienceChatVisualConfigModule (ref), getChatModerationStoreModule (ref), signalsModule (ref), notificationModalsManagerModule (ref), fFlagConnectionsToFriendsRename (ref), fFlagExpChatPresetChatEnabled (ref), fFlagExpChatPresetChatLoadTestEnabled (ref), initializePresetChatModule (ref), getPresetChatStoreModule (ref), fFlagExpChatClearHiddenMessagesPostAgeCheckModule (ref)
	var2:trace("mountClientApp started")
	p4 = dictionary.join(t_1, p4)
	local var4 = createStoreModule()
	createDispatchBindableEventModule(var4)
	bindableEventQueueModule:flush()
	watchForErrors(game:GetService("ScriptContext"), p4.script, false)
	context.translator = p4.translator
	context.store = var4
	
	if fFlagExpChatUseAdorneeStore then
		context.adorneeStore = getAdorneeStoreModule(false)
	end
	if fFlagExpChatUseProximityStore then
		context.proximityStore = var1(false)
	end
	local var5 = getMessagesStoreModule(false)
	local var6 = if fFlagExpChatUseChannelTabsStore then getChannelTabsStoreModule(false) else nil
	local var7 = fFlagExpChatVirtualizeSystemMessagesModule and var5 ~= nil
	local t_2 = {
		messagesStore = var5,
		channelTabsStore = var6,
		store = var4,
		suppressWelcomeMessageTabUnread = getFFlagExpChatSuppressWelcomeMessageTabUnread(),
		resetTextTransparency = function(value)
			-- upvalues: expChatOnlyWakeTextForSelectedTab (copy), isMessageForOpenChannelModule (copy), var4 (ref), getTransparencyStoreModule (copy)
			if not expChatOnlyWakeTextForSelectedTab or isMessageForOpenChannelModule(var4:getState(), nil, value) then
				getTransparencyStoreModule(false).resetTextTransparency()
			end
		end
	}
	
	local function showWelcomeSystemMessage(p5, p6)
		-- upvalues: var7 (ref), displaySystemMessageModule (copy), p4 (write), writeVirtualSystemMessageModule (copy), t_2 (ref)
		if not var7 then
			displaySystemMessageModule(p5.key, p5.args, p5.metadata, p4.translator, p6)
			
			return
		elseif not p6 then return end
		local ok, status = pcall(function()
			-- upvalues: p4 (copy), p5 (ref)
			return p4.translator:FormatByKey(p5.key, p5.args)
		end)
		
		if ok and type(status) == "string" and status ~= "" then
			writeVirtualSystemMessageModule(t_2, {
				text = status,
				channelName = p6.Name,
				metadata = p5.metadata,
				textChannel = p6
			})
			
			return
		end
	end
	
	local function showVirtualChatEnabledSystemMessage(p5, p6, p7)
		-- upvalues: p4 (write), writeVirtualSystemMessageModule (copy), t_2 (ref)
		local defaultSystemTextChannel = p4.defaultSystemTextChannel
		
		if not defaultSystemTextChannel then return end
		local ok, status = pcall(function()
			-- upvalues: p4 (copy), p5 (ref), p6 (ref)
			return p4.translator:FormatByKey(p5, p6)
		end)
		
		if not ok or type(status) ~= "string" or status == "" then
			status = p7
		end
		writeVirtualSystemMessageModule(t_2, {
			channelName = "RBXGeneral",
			metadata = "Roblox.ChatEnabled.Info",
			text = status,
			textChannel = defaultSystemTextChannel
		})
	end
	
	local var8 = if fFlagExpChatUseChatConfigStore then getChatConfigurationStoreModule(false) else nil
	local var9 = getChatStatusStoreModule(false)
	context.messagesStore = var5
	context.globalMutedUsersStore = getGlobalMutedUsersStoreModule(false)
	
	if getFFlagUseCharacterStore() then
		context.characterStore = getCharacterStoreModule(false)
	end
	if p4.analytics then
		analytics.with(p4.analytics)
	end
	if not getFFlagUnreduxLastInputTypeChangedModule() then
		userInputService.LastInputTypeChanged:Connect(function(p5)
			-- upvalues: var4 (ref), lastInputTypeChangedModule (copy)
			var4:dispatch(lastInputTypeChangedModule(p5))
		end)
	end
	if p4.defaultSystemTextChannel then
		p4.defaultSystemTextChannel.OnIncomingMessage = var3
	else
		chatService:GetPropertyChangedSignal("IsAutoMigrated"):Once(function()
			-- upvalues: textChatService (copy), p4 (write), var3 (copy)
			local RBXSystem = textChatService:FindFirstChild("RBXSystem", true)
			
			if RBXSystem and RBXSystem:IsA("TextChannel") then
				p4.defaultSystemTextChannel = RBXSystem
				RBXSystem.OnIncomingMessage = var3
			end
		end)
	end
	setUpConfigurationObjectsModule(var4, p4)
	setUpClientSettingsModule(var4)
	
	if fFlagExpChatInitializeWindowFromGameSettings then
		var4:dispatch(chatTopBarButtonActivatedModule(UserSettings().GameSettings.ChatVisible))
	end
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		localPlayer:GetPropertyChangedSignal("Team"):Connect(function()
			-- upvalues: localPlayer (ref), displaySystemMessageModule (copy), p4 (write)
			local team = localPlayer.Team
			
			if team then
				displaySystemMessageModule("InGame.UnknownNamespace.GameChat_TeamChat_NowInTeam", { RBX_NAME = team.Name }, "Roblox.Team.Success.NowInTeam", p4.translator, p4.defaultSystemTextChannel)
			end
		end)
	end
	local t_3 = {
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
	
	local function _processIncomingMessageCore(a, b, p5)
		-- upvalues: shouldSkipHistoricalMessageModule (copy), getFFlagExpChatProtectedChatInternalAPIs (copy), var2 (copy), localPlayer (ref), expChatPerfTracker (copy), fFlagExpChatPerfTrackerTabName (copy), selectSelectedTabNameModule (copy), var4 (ref), reportMessageReceivedModule (copy), handleChannelWelcomeMessageModule (copy), showWelcomeSystemMessage (ref), expChatOnlyWakeTextForSelectedTab (copy), isMessageForOpenChannelModule (copy), var5 (ref), getTransparencyStoreModule (copy), fFlagExpChatUseChannelTabsStore (copy), var6 (ref), fFlagExpChatUnreadTabIndicatorV2WindowModule (copy), markChannelUnreadForIncomingMessageModule (copy), t_3 (ref), p4 (write), getFFlagExpChatSuppressWelcomeMessageTabUnread (copy), shouldSuppressUnreadForTabMetadataModule (copy), markChannelUnreadForSystemMessageModule (copy), textChatService (copy), displaySystemMessageModule (copy), shouldSendHighFrequencyTelemetryModule (copy), expChatMessageResponseUserSamplePermyriad (copy), analytics (copy), t (copy)
		if shouldSkipHistoricalMessageModule(a) then return end
		if getFFlagExpChatProtectedChatInternalAPIs() then
			var2:debug("Incoming MessageReceived Status: {} TextInternal: {}", a.Status.Name, a.TextInternal)
		else
			var2:debug("Incoming MessageReceived Status: {} Text: {}", a.Status.Name, a.Text)
		end
		if (if a.TextSource then a.TextSource.UserId else "UNKNOWN_TEXT_SOURCE_USER_ID") ~= (if localPlayer then localPlayer.UserId else "UNKNOWN_LOCAL_USER_ID") then
			expChatPerfTracker.start(expChatPerfTracker.Events.MessageReceiveToWindowRenderInterval, { messageId = a.MessageId }, if fFlagExpChatPerfTrackerTabName then { tabName = selectSelectedTabNameModule(var4:getState()) } else nil)
		end
		if localPlayer then
			reportMessageReceivedModule(localPlayer.UserId, a)
		end
		if localPlayer and a.TextSource and a.TextSource.UserId ~= localPlayer.UserId then
			local var10 = handleChannelWelcomeMessageModule(a, localPlayer)
			
			if var10 then
				showWelcomeSystemMessage(var10, a.TextChannel)
			end
		end
		local var11 = localPlayer and (a.TextSource and a.TextSource.UserId == localPlayer.UserId)
		local var12 = if expChatOnlyWakeTextForSelectedTab then isMessageForOpenChannelModule(var4:getState(), a, b) else true
		var5.handleIncomingOrOutgoingMessage(a, var11, b, p5)
		
		if var12 then
			getTransparencyStoreModule(false).resetTextTransparency()
		end
		if fFlagExpChatUseChannelTabsStore and var6 then
			var6.handleIncomingOrOutgoingMessage(a, var11, b)
		elseif fFlagExpChatUnreadTabIndicatorV2WindowModule then
			var4:dispatch(markChannelUnreadForIncomingMessageModule(a, var11, b, p5))
		end
		local status = t_3[a.Status]
		
		if status then
			local ok, status_1 = pcall(function()
				-- upvalues: p4 (copy), status (ref)
				return p4.translator:FormatByKey(status.key)
			end)
			
			if b and (ok and (status_1 and status_1 ~= "")) then
				var5.addSystemMessage(status_1, b, if getFFlagExpChatSuppressWelcomeMessageTabUnread() then status.metadata else nil)
				
				if fFlagExpChatUseChannelTabsStore and var6 and (not getFFlagExpChatSuppressWelcomeMessageTabUnread() or not shouldSuppressUnreadForTabMetadataModule(status.metadata)) then
					var6.markChannelUnread(b)
				elseif fFlagExpChatUnreadTabIndicatorV2WindowModule then
					var4:dispatch(markChannelUnreadForSystemMessageModule(status_1, b, if getFFlagExpChatSuppressWelcomeMessageTabUnread() then status.metadata else nil))
				end
			else
				local defaultSystemTextChannel = p4.defaultSystemTextChannel
				
				if b then
					local var13 = textChatService:FindFirstChild(b)
					
					if var13 and var13:IsA("TextChannel") then
						defaultSystemTextChannel = var13
					end
				end
				displaySystemMessageModule(status.key, nil, status.metadata, p4.translator, defaultSystemTextChannel)
			end
		end
		if shouldSendHighFrequencyTelemetryModule(expChatMessageResponseUserSamplePermyriad) then
			analytics:TelemetryLogEvent(t, { messageStatus = a.Status.Name }, {
				"addOsInfo",
				"addSessionId",
				"addUniverseId",
				"addPlaceId"
			})
		end
	end
	
	local function _(a, b)
		-- upvalues: _processIncomingMessageCore (ref)
		_processIncomingMessageCore(a, b, nil)
	end
	
	local _ = function(a, b)
		-- upvalues: _processIncomingMessageCore (ref)
		_processIncomingMessageCore(a, b and b.channelNameOverride, b and b.isUniverseChat)
	end
	
	local function handleMessageReceived(p5)
		-- upvalues: var4 (ref), textChannelCreated (copy), textChatService (copy), getNameColorModule (copy), getFFlagExpChatProtectedChatInternalAPIs (copy), var2 (copy), playersService (copy), expChatRemoveSpaceFromTeamPrefix (copy), localPlayer (ref), getOtherDisplayNameInWhisperChannelModule (copy), p4 (write), shouldSkipHistoricalMessageModule (copy), fFlagExpChatDictationContinuousSafetyReminder (copy), dictationSafetyReminderModule (copy), getFFlagTextChatEnableUniverseChatTabs (copy), _processIncomingMessageCore (ref), expChatPerfTracker (copy), fFlagExpChatPerfTrackerTabName (copy), selectSelectedTabNameModule (copy), reportMessageReceivedModule (copy), handleChannelWelcomeMessageModule (copy), showWelcomeSystemMessage (ref), var5 (ref), getTransparencyStoreModule (copy), fFlagExpChatUseChannelTabsStore (copy), var6 (ref), fFlagExpChatUnreadTabIndicatorV2WindowModule (copy), markChannelUnreadForIncomingMessageModule (copy), displaySystemMessageModule (copy), shouldSendHighFrequencyTelemetryModule (copy), expChatMessageResponseUserSamplePermyriad (copy), analytics (copy), t (copy)
		var4:dispatch(textChannelCreated(p5))
		local enabled = false
		local channelTabsConfiguration = textChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
		
		if channelTabsConfiguration then
			enabled = channelTabsConfiguration.Enabled
		end
		if string.find(p5.Name, "RBXGeneral") then
			function p22.OnIncomingMessage(p6)
				-- upvalues: getNameColorModule (copy), getFFlagExpChatProtectedChatInternalAPIs (copy)
				local textChatMessageProperties = Instance.new("TextChatMessageProperties")
				
				if p6.TextSource then
					local var10 = getNameColorModule(p6.TextSource.UserId)
					
					if not p6.ChatWindowMessageProperties then
						textChatMessageProperties.PrefixText = string.format("<font color=\"#%s\">%s</font>", var10:ToHex(), if getFFlagExpChatProtectedChatInternalAPIs() then p6.PrefixTextInternal else p6.PrefixText)
					end
				end
				return textChatMessageProperties
			end
		elseif string.find(p5.Name, "^RBXTeam") then
			function p22.OnIncomingMessage(p6)
				-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), var2 (copy), playersService (copy), expChatRemoveSpaceFromTeamPrefix (copy), enabled (write)
				local var10 = if getFFlagExpChatProtectedChatInternalAPIs() then p6.PrefixTextInternal else p6.PrefixText
				
				if getFFlagExpChatProtectedChatInternalAPIs() then
					var2:trace("Team OnIncomingMessage started: PrefixTextInternal: {} TextInternal: {}", var10, p6.TextInternal)
				else
					var2:trace("Team OnIncomingMessage started: {} {}", var10, p6.Text)
				end
				local textChatMessageProperties = Instance.new("TextChatMessageProperties")
				
				if playersService.LocalPlayer then
					textChatMessageProperties.PrefixText = string.format("<font color=\"#%s\">%s%s</font>", playersService.LocalPlayer.TeamColor.Color:ToHex(), if expChatRemoveSpaceFromTeamPrefix then if enabled then "" elseif #(var10 or "") > 0 then "[Team] " else "[Team]" elseif enabled then "" else "[Team] ", var10)
				end
				var2:trace("Team OnIncomingMessage finished: {} {}", textChatMessageProperties.PrefixText, textChatMessageProperties.Text)
				
				return textChatMessageProperties
			end
		elseif string.find(p5.Name, "^RBXWhisper") and localPlayer then
			function p22.OnIncomingMessage(p6)
				-- upvalues: getOtherDisplayNameInWhisperChannelModule (copy), p5 (ref), localPlayer (copy), enabled (write), p4 (copy), getNameColorModule (copy), getFFlagExpChatProtectedChatInternalAPIs (copy)
				local textSource = p6.TextSource
				
				if textSource then
					local var10 = getOtherDisplayNameInWhisperChannelModule(p5, localPlayer)
					
					if not var10 then
						return nil
					end
					local var11 = if not enabled then if textSource.UserId == localPlayer.UserId then p4.translator:FormatByKey("CoreScripts.TextChat.WhisperChat.PrefixText.Outgoing", { RBX_NAME = var10 }) else p4.translator:FormatByKey("CoreScripts.TextChat.WhisperChat.PrefixText.Incoming", { RBX_NAME = var10 }) else nil
					local textChatMessageProperties = Instance.new("TextChatMessageProperties")
					textChatMessageProperties.PrefixText = string.format("%s<font color=\"#%s\">%s</font>", if var11 then var11 .. " " else "", getNameColorModule(textSource.UserId):ToHex(), if getFFlagExpChatProtectedChatInternalAPIs() then p6.PrefixTextInternal else p6.PrefixText)
					
					return textChatMessageProperties
				end
			end
		end
		p5.MessageReceived:Connect(function(p6)
			-- upvalues: shouldSkipHistoricalMessageModule (copy), fFlagExpChatDictationContinuousSafetyReminder (copy), dictationSafetyReminderModule (copy), getFFlagTextChatEnableUniverseChatTabs (copy), _processIncomingMessageCore (copy), getFFlagExpChatProtectedChatInternalAPIs (copy), var2 (copy), localPlayer (copy), expChatPerfTracker (copy), fFlagExpChatPerfTrackerTabName (copy), selectSelectedTabNameModule (copy), var4 (copy), reportMessageReceivedModule (copy), handleChannelWelcomeMessageModule (copy), showWelcomeSystemMessage (copy), var5 (copy), getTransparencyStoreModule (copy), fFlagExpChatUseChannelTabsStore (copy), var6 (copy), fFlagExpChatUnreadTabIndicatorV2WindowModule (copy), markChannelUnreadForIncomingMessageModule (copy), displaySystemMessageModule (copy), p4 (copy), shouldSendHighFrequencyTelemetryModule (copy), expChatMessageResponseUserSamplePermyriad (copy), analytics (copy), t (copy)
			if shouldSkipHistoricalMessageModule(p6) then return end
			if fFlagExpChatDictationContinuousSafetyReminder then
				dictationSafetyReminderModule.onIncomingMessage(p6)
			end
			if getFFlagTextChatEnableUniverseChatTabs() then
				_processIncomingMessageCore(p6, nil, nil)
				
				return
			elseif getFFlagExpChatProtectedChatInternalAPIs() then
				var2:debug("Incoming MessageReceived Status: {} TextInternal: {}", p6.Status.Name, p6.TextInternal)
			else
				var2:debug("Incoming MessageReceived Status: {} Text: {}", p6.Status.Name, p6.Text)
			end
			if (if p6.TextSource then p6.TextSource.UserId else "UNKNOWN_TEXT_SOURCE_USER_ID") ~= (if localPlayer then localPlayer.UserId else "UNKNOWN_LOCAL_USER_ID") then
				expChatPerfTracker.start(expChatPerfTracker.Events.MessageReceiveToWindowRenderInterval, { messageId = p6.MessageId }, if fFlagExpChatPerfTrackerTabName then { tabName = selectSelectedTabNameModule(var4:getState()) } else nil)
			end
			if localPlayer then
				reportMessageReceivedModule(localPlayer.UserId, p6)
			end
			if localPlayer and p6.TextSource and p6.TextSource.UserId ~= localPlayer.UserId then
				local var10 = handleChannelWelcomeMessageModule(p6, localPlayer)
				
				if var10 then
					showWelcomeSystemMessage(var10, p6.TextChannel)
				end
			end
			local var11 = localPlayer and (p6.TextSource and p6.TextSource.UserId == localPlayer.UserId)
			var5.handleIncomingOrOutgoingMessage(p6, var11)
			getTransparencyStoreModule(false).resetTextTransparency()
			
			if fFlagExpChatUseChannelTabsStore and var6 then
				var6.handleIncomingOrOutgoingMessage(p6, var11)
			elseif fFlagExpChatUnreadTabIndicatorV2WindowModule then
				var4:dispatch(markChannelUnreadForIncomingMessageModule(p6, var11))
			end
			if p6.Status == Enum.TextChatMessageStatus.Floodchecked then
				displaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.Floodchecked", nil, "Roblox.MessageStatus.Warning.Floodchecked", p4.translator, p4.defaultSystemTextChannel)
			elseif p6.Status == Enum.TextChatMessageStatus.TextFilterFailed then
				displaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.TextFilterFailed", nil, "Roblox.MessageStatus.Warning.TextFilterFailed", p4.translator, p4.defaultSystemTextChannel)
			elseif p6.Status == Enum.TextChatMessageStatus.InvalidPrivacySettings then
				displaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.InvalidPrivacySettings", nil, "Roblox.MessageStatus.Warning.InvalidPrivacySettings", p4.translator, p4.defaultSystemTextChannel)
			elseif p6.Status == Enum.TextChatMessageStatus.MessageTooLong then
				displaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.MessageTooLong", nil, "Roblox.MessageStatus.Warning.MessageTooLong", p4.translator, p4.defaultSystemTextChannel)
			elseif p6.Status == Enum.TextChatMessageStatus.ModerationTimeout then
				displaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.ModerationTimeout", nil, "Roblox.MessageStatus.Warning.ModerationTimeout", p4.translator, p4.defaultSystemTextChannel)
			elseif p6.Status == Enum.TextChatMessageStatus.Unknown then
				displaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.Unknown", nil, "Roblox.MessageStatus.Warning.Unknown", p4.translator, p4.defaultSystemTextChannel)
			end
			if shouldSendHighFrequencyTelemetryModule(expChatMessageResponseUserSamplePermyriad) then
				analytics:TelemetryLogEvent(t, { messageStatus = p6.Status.Name }, {
					"addOsInfo",
					"addSessionId",
					"addUniverseId",
					"addPlaceId"
				})
			end
		end)
	end
	
	local _ = function(p5)
		-- upvalues: analytics (copy)
		p5.Triggered:Connect(function()
			-- upvalues: analytics (copy), p5 (ref)
			analytics.FireClientAnalyticsWithEventName("CommandSent", { commandName = p5.Name })
		end)
	end
	
	for i, v in pairs(textChatService:GetDescendants()) do
		if v:IsA("TextChannel") then
			handleMessageReceived(v)
		elseif v:IsA("TextChatCommand") then
			v.Triggered:Connect(function()
				-- upvalues: analytics (copy), v (ref)
				analytics.FireClientAnalyticsWithEventName("CommandSent", { commandName = v.Name })
			end)
		end
	end
	local var10 = false
	local var11 = false
	local t_4 = {}
	local var12 = false
	
	local _ = function()
		-- upvalues: expChatNewSystemMessagesExperimentation (copy), var12 (write)
		if expChatNewSystemMessagesExperimentation.isExperimentEnabled and not var12 then
			var12 = true
			expChatNewSystemMessagesExperimentation.logExposure()
			
			return
		end
	end
	
	local function postProcessSummarySystemMessage(p5)
		-- upvalues: summaryMessageRichTextModule (copy)
		return summaryMessageRichTextModule.wrapInSummaryMutedStyle(`{summaryMessageRichTextModule.getSummaryIconPrefix()} {p5}`)
	end
	
	local function tryShowSummarySystemMessageOnChannel(p5)
		-- upvalues: var10 (write), t_4 (ref), expChatNewSystemMessagesExperimentation (copy), var12 (write), var7 (ref), p4 (write), writeVirtualSystemMessageModule (copy), t_2 (ref), postProcessSummarySystemMessage (ref), displaySystemMessageModule (copy)
		if not p5 then return end
		if not var10 then return end
		if t_4[p5.Name] then return end
		if p5.Name ~= "RBXGeneral" then return end
		t_4[p5.Name] = true
		
		if expChatNewSystemMessagesExperimentation.isExperimentEnabled and expChatNewSystemMessagesExperimentation.isExperimentEnabled and not var12 then
			var12 = true
			expChatNewSystemMessagesExperimentation.logExposure()
		end
		if not var7 then
			displaySystemMessageModule(if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "CoreScripts.TextChat.Description.RobloxSummarizesMessagesFromAllPlayers" else "CoreScripts.TextChat.ChatWindow.SummarySystemMessage", nil, "Roblox.Summary.Info", p4.translator, p5, if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "Roblox summarizes messages from players of all ages." else "Roblox auto-generates summaries of players' messages.", postProcessSummarySystemMessage)
			
			return
		end
		local newSystemMessagesEnabled = expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled()
		local var13 = if newSystemMessagesEnabled then "CoreScripts.TextChat.Description.RobloxSummarizesMessagesFromAllPlayers" else "CoreScripts.TextChat.ChatWindow.SummarySystemMessage"
		local var14 = if newSystemMessagesEnabled then "Roblox summarizes messages from players of all ages." else "Roblox auto-generates summaries of players' messages."
		local ok, status = pcall(function()
			-- upvalues: p4 (copy), var13 (ref)
			return p4.translator:FormatByKey(var13)
		end)
		
		if not ok or type(status) ~= "string" or status == "" then
			status = var14
		end
		writeVirtualSystemMessageModule(t_2, {
			metadata = "Roblox.Summary.Info",
			text = status,
			channelName = p5.Name,
			postProcessMessage = postProcessSummarySystemMessage,
			textChannel = p5
		})
	end
	
	local function tryAddThirdPartySummaryGlobalSystemMessage()
		-- upvalues: var11 (write), var10 (write), fFlagExpChatEnableGlobalChatSummarySystemMessageModule (copy), getFFlagTextChatEnableUniverseChatTabs (copy), textChatService (copy), p4 (write), expChatSuppressGlobalSummaryTabUnread (copy), var5 (ref), postProcessSummarySystemMessage (ref)
		if var11 or not var10 or (not fFlagExpChatEnableGlobalChatSummarySystemMessageModule or not getFFlagTextChatEnableUniverseChatTabs()) or not textChatService:HasAllocatedUniverseChatContext("global") then
			return
		end
		var11 = true
		var5.addSystemMessage(p4.translator:FormatByKey("CoreScripts.TextChat.ChatWindow.SummarySystemMessage"), "RBXGlobal", if expChatSuppressGlobalSummaryTabUnread then "Roblox.Summary.GlobalChat" else nil, postProcessSummarySystemMessage)
	end
	
	textChatService.DescendantAdded:Connect(function(p5)
		-- upvalues: handleMessageReceived (ref), fFlagEnableInExpChatSummaryOnLuaModule (copy), fFlagEnableClientSummarySystemMessageOnLua (copy), tryShowSummarySystemMessageOnChannel (ref), analytics (copy)
		if p5:IsA("TextChannel") then
			handleMessageReceived(p5)
			
			if fFlagEnableInExpChatSummaryOnLuaModule and fFlagEnableClientSummarySystemMessageOnLua then
				tryShowSummarySystemMessageOnChannel(p5)
				
				return
			end
		elseif p5:IsA("TextChatCommand") then
			p5.Triggered:Connect(function()
				-- upvalues: analytics (copy), p5 (ref)
				analytics.FireClientAnalyticsWithEventName("CommandSent", { commandName = p5.Name })
			end)
		end
	end)
	textChatService.DescendantRemoving:Connect(function(p5)
		-- upvalues: var4 (ref), textChannelRemoved (copy), fFlagExpChatUseChannelTabsStore (copy), var6 (ref)
		if p5:IsA("TextChannel") then
			var4:dispatch(textChannelRemoved(p5))
			
			if fFlagExpChatUseChannelTabsStore and var6 then
				var6.handleChannelRemoved(p5.Name)
			end
		end
	end)
	
	if fFlagEnableInExpChatSummaryOnLuaModule then
		textChatService.ChatActionReceived:Connect(function(p5)
			-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), var2 (copy), textChatMessageChatActionTypeModule (copy), fFlagEnableGlobalChat3pSummaryLuaAppsModule (copy), _processIncomingMessageCore (ref)
			if getFFlagExpChatProtectedChatInternalAPIs() then
				var2:debug("Incoming ChatActionReceived ChatActionType: {}, TextInternal: {}", p5.ChatActionType, p5.TextInternal)
			else
				var2:debug("Incoming ChatActionReceived ChatActionType: {}, Text: {}", p5.ChatActionType, p5.Text)
			end
			if p5.ChatActionType ~= textChatMessageChatActionTypeModule.Summary then
				var2:error("Unknown ChatActionType: {}", p5.ChatActionType)
				
				return
			elseif fFlagEnableGlobalChat3pSummaryLuaAppsModule then
				local var13 = if p5.TextChannel == nil then { channelNameOverride = "RBXGlobal", isUniverseChat = true } else nil
				_processIncomingMessageCore(p5, var13 and var13.channelNameOverride, var13 and var13.isUniverseChat)
				
				return
			end
			_processIncomingMessageCore(p5, nil, nil)
		end)
	end
	if fFlagEnableInExpChatSummaryOnLuaModule or fFlagAIRephraseSettingEnabled or fFlagChatSummariesSettingEnabled then
		coroutine.wrap(function()
			-- upvalues: robloxReplicatedStorageService (copy), var2 (copy), localPlayer (ref), fFlagEnableClientSummarySystemMessageOnLua (copy), fFlagChatSummariesSettingEnabled (copy), var10 (write), textChatService (copy), tryShowSummarySystemMessageOnChannel (ref), tryAddThirdPartySummaryGlobalSystemMessage (ref), fFlagAIRephraseSettingEnabled (copy), getUserChatSettingsStoreModule (copy)
			local expChatFeatureValueChanged = robloxReplicatedStorageService:WaitForChild("ExpChatFeatureValueChanged", 10)
			
			if expChatFeatureValueChanged then
				expChatFeatureValueChanged.OnClientEvent:Connect(function(p5, p6, p7)
					-- upvalues: var2 (copy), localPlayer (copy), fFlagEnableClientSummarySystemMessageOnLua (copy), fFlagChatSummariesSettingEnabled (copy), var10 (copy), textChatService (copy), tryShowSummarySystemMessageOnChannel (copy), tryAddThirdPartySummaryGlobalSystemMessage (copy), fFlagAIRephraseSettingEnabled (copy), getUserChatSettingsStoreModule (copy)
					var2:debug("Incoming ExpChatFeatureValueChanged userId: {}, featureName: {}, featureValue: {}", p5, p6, p7)
					
					if localPlayer and p5 == localPlayer.UserId then
						if fFlagEnableClientSummarySystemMessageOnLua and p6 == "EligibleForThirdPartySummary" and not fFlagChatSummariesSettingEnabled then
							var10 = p7 == "true"
							
							if var10 then
								for i, v in textChatService:GetDescendants() do
									if v:IsA("TextChannel") then
										tryShowSummarySystemMessageOnChannel(v)
									end
								end
								tryAddThirdPartySummaryGlobalSystemMessage()
							end
						end
						if fFlagAIRephraseSettingEnabled and p6 == "AIRephraseSettingStatus" then
							getUserChatSettingsStoreModule.updateExpChatFeatureValue(p6, p7)
						end
						if fFlagChatSummariesSettingEnabled and p6 == "AllowThirdPartySummary" then
							getUserChatSettingsStoreModule.updateExpChatFeatureValue(p6, p7)
							var10 = p7 == "Enabled"
							
							if var10 then
								for i, v in textChatService:GetDescendants() do
									if v:IsA("TextChannel") then
										tryShowSummarySystemMessageOnChannel(v)
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
	textChatService.SendingMessage:Connect(function(p5)
		-- upvalues: fFlagExpChatDictationContinuousSafetyReminder (copy), dictationSafetyReminderModule (copy), expChatPerfTracker (copy), fFlagExpChatPerfTrackerTabName (copy), selectSelectedTabNameModule (copy), var4 (ref), getFFlagExpChatProtectedChatInternalAPIs (copy), var2 (copy), localPlayer (ref), handleChannelWelcomeMessageModule (copy), showWelcomeSystemMessage (ref), var5 (ref), analytics (copy), countParticipantsInTextChannel (copy)
		if fFlagExpChatDictationContinuousSafetyReminder then
			dictationSafetyReminderModule.onOutgoingMessage(p5)
		end
		expChatPerfTracker.start(expChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = p5.MessageId }, if fFlagExpChatPerfTrackerTabName then { tabName = selectSelectedTabNameModule(var4:getState()) } else nil)
		
		if getFFlagExpChatProtectedChatInternalAPIs() then
			var2:debug("Outgoing SendingMessage Status: {} TextInternal: {}", p5.Status.Name, p5.TextInternal)
		else
			var2:debug("Outgoing SendingMessage Status: {} Text: {}", p5.Status.Name, p5.Text)
		end
		if localPlayer then
			local var13 = handleChannelWelcomeMessageModule(p5, localPlayer)
			
			if var13 and var13.key then
				showWelcomeSystemMessage(var13, p5.TextChannel)
			end
		end
		var5.handleIncomingOrOutgoingMessage(p5, true)
		local textChannel = p5.TextChannel
		
		if textChannel then
			analytics.FireClientAnalyticsWithEventName("MessageSent", {
				channelName = textChannel.Name,
				totalParticipants = countParticipantsInTextChannel(textChannel)
			})
		end
	end)
	
	local _ = function()
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), textChatService (copy), fFlagExpChatDictationContinuousSafetyReminder (copy), dictationSafetyReminderModule (copy), expChatPerfTracker (copy), fFlagExpChatPerfTrackerTabName (copy), selectSelectedTabNameModule (copy), var4 (ref), getFFlagExpChatProtectedChatInternalAPIs (copy), var2 (copy), localPlayer (ref), handleChannelWelcomeMessageModule (copy), showWelcomeSystemMessage (ref), fFlagExpChatGlobalTabDefaultModule (copy), var5 (ref), fFlagExpChatFixOutgoingUniverseChatBubbleModule (copy), fFlagExpChatUseChannelTabsStore (copy), var6 (ref), analytics (copy), countParticipantsInTextChannel (copy)
		if getFFlagTextChatEnableUniverseChatTabs() then
			textChatService.SendingUniverseChatMessage:Connect(function(p5)
				-- upvalues: fFlagExpChatDictationContinuousSafetyReminder (copy), dictationSafetyReminderModule (copy), expChatPerfTracker (copy), fFlagExpChatPerfTrackerTabName (copy), selectSelectedTabNameModule (copy), var4 (copy), getFFlagExpChatProtectedChatInternalAPIs (copy), var2 (copy), localPlayer (copy), handleChannelWelcomeMessageModule (copy), showWelcomeSystemMessage (copy), textChatService (copy), fFlagExpChatGlobalTabDefaultModule (copy), var5 (copy), fFlagExpChatFixOutgoingUniverseChatBubbleModule (copy), fFlagExpChatUseChannelTabsStore (copy), var6 (copy), analytics (copy), countParticipantsInTextChannel (copy)
				if fFlagExpChatDictationContinuousSafetyReminder then
					dictationSafetyReminderModule.onOutgoingMessage(p5)
				end
				expChatPerfTracker.start(expChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = p5.MessageId }, if fFlagExpChatPerfTrackerTabName then { tabName = selectSelectedTabNameModule(var4:getState()) } else nil)
				
				if getFFlagExpChatProtectedChatInternalAPIs() then
					var2:debug("Outgoing SendingMessage Status: {} TextInternal: {}", p5.Status.Name, p5.TextInternal)
				else
					var2:debug("Outgoing SendingMessage Status: {} Text: {}", p5.Status.Name, p5.Text)
				end
				if localPlayer then
					local var13 = handleChannelWelcomeMessageModule(p5, localPlayer)
					
					if var13 and var13.key then
						showWelcomeSystemMessage(var13, p5.TextChannel)
					end
				end
				local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
				local var14 = if fFlagExpChatGlobalTabDefaultModule and selectSelectedTabNameModule(var4:getState()) == "RBXGlobal" then "RBXGlobal" elseif not (chatInputBarConfiguration and chatInputBarConfiguration.TargetTextChannel) then "RBXGlobal" else nil
				var5.handleIncomingOrOutgoingMessage(p5, true, var14, if fFlagExpChatFixOutgoingUniverseChatBubbleModule then true else nil)
				
				if fFlagExpChatUseChannelTabsStore and var6 then
					var6.handleIncomingOrOutgoingMessage(p5, true, var14)
				end
				local textChannel = p5.TextChannel
				
				if textChannel then
					analytics.FireClientAnalyticsWithEventName("MessageSent", {
						channelName = textChannel.Name,
						totalParticipants = countParticipantsInTextChannel(textChannel)
					})
				end
			end)
			
			return
		end
	end
	
	if getFFlagTextChatEnableUniverseChatTabs() then
		textChatService.SendingUniverseChatMessage:Connect(function(p5)
			-- upvalues: fFlagExpChatDictationContinuousSafetyReminder (copy), dictationSafetyReminderModule (copy), expChatPerfTracker (copy), fFlagExpChatPerfTrackerTabName (copy), selectSelectedTabNameModule (copy), var4 (ref), getFFlagExpChatProtectedChatInternalAPIs (copy), var2 (copy), localPlayer (ref), handleChannelWelcomeMessageModule (copy), showWelcomeSystemMessage (ref), textChatService (copy), fFlagExpChatGlobalTabDefaultModule (copy), var5 (ref), fFlagExpChatFixOutgoingUniverseChatBubbleModule (copy), fFlagExpChatUseChannelTabsStore (copy), var6 (ref), analytics (copy), countParticipantsInTextChannel (copy)
			if fFlagExpChatDictationContinuousSafetyReminder then
				dictationSafetyReminderModule.onOutgoingMessage(p5)
			end
			expChatPerfTracker.start(expChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = p5.MessageId }, if fFlagExpChatPerfTrackerTabName then { tabName = selectSelectedTabNameModule(var4:getState()) } else nil)
			
			if getFFlagExpChatProtectedChatInternalAPIs() then
				var2:debug("Outgoing SendingMessage Status: {} TextInternal: {}", p5.Status.Name, p5.TextInternal)
			else
				var2:debug("Outgoing SendingMessage Status: {} Text: {}", p5.Status.Name, p5.Text)
			end
			if localPlayer then
				local var13 = handleChannelWelcomeMessageModule(p5, localPlayer)
				
				if var13 and var13.key then
					showWelcomeSystemMessage(var13, p5.TextChannel)
				end
			end
			local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			local var14 = if fFlagExpChatGlobalTabDefaultModule and selectSelectedTabNameModule(var4:getState()) == "RBXGlobal" then "RBXGlobal" elseif not (chatInputBarConfiguration and chatInputBarConfiguration.TargetTextChannel) then "RBXGlobal" else nil
			var5.handleIncomingOrOutgoingMessage(p5, true, var14, if fFlagExpChatFixOutgoingUniverseChatBubbleModule then true else nil)
			
			if fFlagExpChatUseChannelTabsStore and var6 then
				var6.handleIncomingOrOutgoingMessage(p5, true, var14)
			end
			local textChannel = p5.TextChannel
			
			if textChannel then
				analytics.FireClientAnalyticsWithEventName("MessageSent", {
					channelName = textChannel.Name,
					totalParticipants = countParticipantsInTextChannel(textChannel)
				})
			end
		end)
	end
	local _ = function(p5)
		-- upvalues: playersService (copy)
		return p5 and (p5:IsA("TextSource") and (playersService.LocalPlayer and playersService.LocalPlayer.UserId == p5.UserId))
	end
	
	local _ = function(p5)
		return if p5 == "RBXGeneral" then 1 elseif p5 == "RBXGlobal" then 2 else 3
	end
	
	for i_1, v_1 in pairs(textChatService:GetDescendants()) do
		if v_1.Parent and v_1.Parent:IsA("TextChannel") and (v_1 and (v_1:IsA("TextSource") and (playersService.LocalPlayer and playersService.LocalPlayer.UserId == v_1.UserId))) then
			var4:dispatch(localTextChannelParticipantAddedModule(v_1.Parent))
			
			if fFlagExpChatUseChannelTabsStore and var6 then
				var6.handleLocalTextChannelParticipantAdded(v_1.Parent)
			end
		end
		if v_1:IsA("TextChannel") then
			v_1.DescendantRemoving:Connect(function(p5)
				-- upvalues: playersService (copy), var4 (ref), localTextChannelParticipantRemoved (copy), v_1 (ref), fFlagExpChatUseChannelTabsStore (copy), var6 (ref)
				if p5 and (p5:IsA("TextSource") and (playersService.LocalPlayer and playersService.LocalPlayer.UserId == p5.UserId)) then
					var4:dispatch(localTextChannelParticipantRemoved(v_1))
					
					if fFlagExpChatUseChannelTabsStore and var6 then
						var6.handleChannelRemoved(v_1.Name)
					end
				end
			end)
		end
	end
	textChatService.DescendantAdded:Connect(function(p5)
		-- upvalues: playersService (copy), var4 (ref), localTextChannelParticipantAddedModule (copy), fFlagExpChatUseChannelTabsStore (copy), var6 (ref), localTextChannelParticipantRemoved (copy)
		if p5.Parent and p5.Parent:IsA("TextChannel") and (p5 and (p5:IsA("TextSource") and (playersService.LocalPlayer and playersService.LocalPlayer.UserId == p5.UserId))) then
			var4:dispatch(localTextChannelParticipantAddedModule(p5.Parent))
			
			if fFlagExpChatUseChannelTabsStore and var6 then
				var6.handleLocalTextChannelParticipantAdded(p5.Parent)
			end
		end
		if p5:IsA("TextChannel") then
			p5.DescendantRemoving:Connect(function(p6)
				-- upvalues: playersService (copy), var4 (copy), localTextChannelParticipantRemoved (copy), p5 (ref), fFlagExpChatUseChannelTabsStore (copy), var6 (copy)
				if p6 and (p6:IsA("TextSource") and (playersService.LocalPlayer and playersService.LocalPlayer.UserId == p6.UserId)) then
					var4:dispatch(localTextChannelParticipantRemoved(p5))
					
					if fFlagExpChatUseChannelTabsStore and var6 then
						var6.handleChannelRemoved(p5.Name)
					end
				end
			end)
		end
	end)
	
	if getFFlagTextChatEnableUniverseChatTabs() then
		local t_5 = {}
		
		local function handleUniverseChatChannelAllocated(p5)
			-- upvalues: t_5 (ref), textChatService (copy), fFlagExpChatUseUnifiedTooltipStore (copy), getChatTooltipStoreModule (copy), fFlagExpChatGlobalTabDefaultModule (copy), expChatGlobalTabDefaultExperimentation (copy), var4 (ref), universeChatChannelAddedModule (copy), fFlagExpChatUseChannelTabsStore (copy), var6 (ref), isGlobalTabFirstModule (copy), hasUserSelectedTabModule (copy), universeChatChannelSelected (copy), getFFlagEnableExpChatUniverseChatTabNames (copy), p4 (write), getGlobalWelcomeMessageKeyModule (copy), getFFlagExpChatSuppressWelcomeMessageTabUnread (copy), var5 (ref), fFlagExpChatUnreadTabIndicatorV2WindowModule (copy), markChannelUnreadForSystemMessageModule (copy), tryAddThirdPartySummaryGlobalSystemMessage (ref)
			if t_5[p5] then return end
			t_5[p5] = true
			local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
			local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			
			if chatWindowConfiguration and chatWindowConfiguration.Enabled == false or not (not chatInputBarConfiguration or chatInputBarConfiguration.Enabled ~= false) then return end
			local var13 = ""
			
			if p5 == "global" then
				var13 = "RBXGlobal"
				
				if fFlagExpChatUseUnifiedTooltipStore then
					getChatTooltipStoreModule(false).setIsGlobalChatAvailable(true)
				end
				if fFlagExpChatGlobalTabDefaultModule then
					expChatGlobalTabDefaultExperimentation.logExposure()
				end
			end
			local var14 = var13
			var4:dispatch(universeChatChannelAddedModule(var13, if var14 == "RBXGeneral" then 1 elseif var14 == "RBXGlobal" then 2 else 3))
			
			if fFlagExpChatUseChannelTabsStore and var6 then
				var6.addChannelTab({ type = "UniverseChat", name = var13 }, nil)
			end
			if fFlagExpChatGlobalTabDefaultModule and isGlobalTabFirstModule() and (var13 == "RBXGlobal" and not hasUserSelectedTabModule(var4)) then
				var4:dispatch(universeChatChannelSelected(var13))
				
				if fFlagExpChatUseChannelTabsStore and var6 then
					var6.setTargetChannel(var13, false)
				end
			end
			if getFFlagEnableExpChatUniverseChatTabNames() and var13 ~= "" then
				local ok, status = pcall(function()
					-- upvalues: fFlagExpChatGlobalTabDefaultModule (copy), p4 (copy), getGlobalWelcomeMessageKeyModule (copy)
					return if fFlagExpChatGlobalTabDefaultModule then p4.translator:FormatByKey(getGlobalWelcomeMessageKeyModule()) else p4.translator:FormatByKey("CoreScripts.TextChat.ChatWindow.ChatEnabled.Global2")
				end)
				
				if ok and status and status ~= "" then
					if getFFlagExpChatSuppressWelcomeMessageTabUnread() then
						var5.addSystemMessage(status, var13, "Roblox.Welcome.GlobalChat")
					else
						var5.addSystemMessage(status, var13)
					end
					if fFlagExpChatUseChannelTabsStore and var6 and not getFFlagExpChatSuppressWelcomeMessageTabUnread() then
						var6.markChannelUnread(var13)
					elseif fFlagExpChatUnreadTabIndicatorV2WindowModule then
						var4:dispatch(markChannelUnreadForSystemMessageModule(status, var13, if getFFlagExpChatSuppressWelcomeMessageTabUnread() then "Roblox.Welcome.GlobalChat" else nil))
					end
				end
			end
			tryAddThirdPartySummaryGlobalSystemMessage()
		end
		
		if textChatService:HasAllocatedUniverseChatContext("global") then
			handleUniverseChatChannelAllocated("global")
		end
		textChatService.UniverseChatChannelAllocated:Connect(handleUniverseChatChannelAllocated)
		textChatService.UniverseChatMessageReceived:Connect(function(p5)
			-- upvalues: fFlagExpChatDictationContinuousSafetyReminder (copy), dictationSafetyReminderModule (copy), shouldFilterGlobalMessageModule (copy), getGlobalMutedUsersStoreModule (copy), localPlayer (ref), _processIncomingMessageCore (ref)
			if fFlagExpChatDictationContinuousSafetyReminder then
				dictationSafetyReminderModule.onIncomingMessage(p5)
			end
			if shouldFilterGlobalMessageModule(p5, getGlobalMutedUsersStoreModule(false), localPlayer and localPlayer.UserId) then
				return
			end
			local t = { channelNameOverride = "RBXGlobal", isUniverseChat = true }
			_processIncomingMessageCore(p5, t and t.channelNameOverride, t and t.isUniverseChat)
		end)
	end
	local function runOnBubbleDisplayed(p5, p6, p7)
		-- upvalues: playersService (copy), httpService (copy), getFFlagExpChatProtectedChatInternalAPIs (copy), var5 (ref)
		local var13 = if p5:IsA("Model") then playersService:GetPlayerFromCharacter(p5) else nil
		local var14 = httpService:GenerateGUID(false)
		local bubbleChatMessageProperties = nil
		local var15 = nil
		
		if p7 then
			var14 = p7.MessageId
			bubbleChatMessageProperties = p7.BubbleChatMessageProperties
			var15 = if getFFlagExpChatProtectedChatInternalAPIs() then p7.TranslationInternal else p7.Translation
		end
		var5.handleIncomingBubbleChatMessage({
			message = p6,
			translation = var15,
			bubbleChatMessageId = var14,
			bubbleChatMessageUserId = var13 and tostring(var13.UserId) or nil,
			partOrModel = p5,
			timestamp = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000),
			bubbleChatMessageProperties = bubbleChatMessageProperties
		})
	end
	
	chatService.Chatted:Connect(function(p5, p6)
		-- upvalues: textChatService (copy), chatService (copy), runOnBubbleDisplayed (ref)
		if textChatService.ChatVersion ~= Enum.ChatVersion.LegacyChatService or chatService.BubbleChatEnabled then
			runOnBubbleDisplayed(p5, p6)
		end
	end)
	chatService:GetPropertyChangedSignal("BubbleChatEnabled"):Connect(function()
		-- upvalues: chatService (copy), var4 (ref), legacyBubbleChatEnabledChangedModule (copy)
		var4:dispatch(legacyBubbleChatEnabledChangedModule("Enabled", chatService.BubbleChatEnabled))
	end)
	var4:dispatch(legacyBubbleChatEnabledChangedModule("Enabled", chatService.BubbleChatEnabled))
	chatService.BubbleChatSettingsChanged:Connect(function(p5)
		-- upvalues: p4 (write), var8 (ref), var4 (ref), legacyBubbleChatSettingsChangedModule (copy)
		if p4.validateLegacyBubbleChatSettings then
			local var13, var14 = p4.validateLegacyBubbleChatSettings(p5)
			assert(var13, "Bad settings object passed to Chat:SetBubbleChatSettings:\n inside consolidated BubbleChat " .. (var14 or ""))
			
			if var8 then
				var8.setBubbleChatSettings(p5)
				
				return
			end
			var4:dispatch(legacyBubbleChatSettingsChangedModule(p5))
		end
	end)
	
	if getEngineFeatureFlagEnableDisplayBubbleModule() then
		textChatService.BubbleDisplayed:Connect(function(p5, p6)
			-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), runOnBubbleDisplayed (ref)
			runOnBubbleDisplayed(p5, p6 and (if getFFlagExpChatProtectedChatInternalAPIs() then p6.TextInternal else p6.Text), p6)
		end)
	end
	local function findCommandInstance(p5)
		-- upvalues: textChatService (copy)
		for i, v in ipairs(textChatService:GetDescendants()) do
			if v.Name == p5 and v:IsA("TextChatCommand") then
				return v
			end
		end
		return nil
	end
	
	local t_5 = {}
	
	local function setupTextChatCommands()
		-- upvalues: commands (copy), findCommandInstance (ref), t_5 (ref), var4 (ref), context (copy), displaySystemMessageModule (copy), p4 (write), commandAliasChanged (copy)
		for i, v in ipairs(commands.enabledCommands) do
			if v.clientRun then
				local var13 = findCommandInstance(v.name)
				
				if var13 and not t_5[var13] then
					t_5[var13] = true
					var13.Triggered:Connect(function(p6, ...)
						-- upvalues: v (ref), var4 (copy), context (copy), displaySystemMessageModule (copy), p4 (copy)
						local var14 = v.clientRun(var4, p6.UserId, ..., context)
						
						if var14 then
							displaySystemMessageModule(var14.key, var14.args, var14.metadata, p4.translator, p4.defaultSystemTextChannel)
						end
					end)
					
					if string.find(var13.Name, "RBXTeamCommand") or string.find(var13.Name, "RBXWhisperCommand") then
						for i_1, v_1 in { "PrimaryAlias", "SecondaryAlias" } do
							var13:GetPropertyChangedSignal(v_1):Connect(function()
								-- upvalues: var4 (copy), commandAliasChanged (copy), var13 (ref)
								var4:dispatch(commandAliasChanged(var13.Name, var13.PrimaryAlias, var13.SecondaryAlias))
							end)
						end
					end
				end
			end
		end
	end
	
	setupTextChatCommands()
	chatService:GetPropertyChangedSignal("IsAutoMigrated"):Once(setupTextChatCommands)
	
	if p4.canUserChatAsync and playersService.LocalPlayer then
		promiseModule.try(function()
			-- upvalues: p4 (write), playersService (copy)
			return p4.canUserChatAsync(playersService.LocalPlayer.UserId)
		end):andThen(function(p6)
			-- upvalues: var5 (ref)
			var5.setCanLocalUserChat(p6)
		end):catch(function()
			-- upvalues: var5 (ref)
			var5.setCanLocalUserChat(false)
		end)
	end
	watchPlayersService(p4, var4, var5)
	local var14 = roactModule.createElement(UIBloxModule.App.Style.AppStyleProvider, {
		style = ({
			Dark = {
				themeName = colorMode.Dark,
				fontName = UIBloxModule.App.Style.Constants.FontName.Gotham
			}
		}).Dark
	}, {
		app = roactModule.createElement(appModule, {
			isChatWindowVisible = true,
			isChatInputBarVisible = true,
			isChannelBarVisible = false,
			isDefaultChatEnabled = true,
			store = var4,
			translator = p4.translator,
			gameTranslator = p4.gameTranslator,
			getIconVoiceIndicator = p4.getIconVoiceIndicator,
			onClickedVoiceIndicator = p4.onClickedVoiceIndicator,
			onClickedCameraIndicator = p4.onClickedCameraIndicator,
			selfViewListenerChanged = p4.selfViewListenerChanged,
			getPermissions = p4.getPermissions,
			displayCameraDeniedToast = p4.displayCameraDeniedToast,
			isCamEnabledForUserAndPlace = p4.isCamEnabledForUserAndPlace,
			isCameraOnlyUser = p4.isCameraOnlyUser,
			isVoiceServiceInitialized = p4.isVoiceServiceInitialized,
			isSpatialUIEnabled = p4.isSpatialUIEnabled,
			expChatLoadStartTime = if getFFlagExpChatTelemetryEventTriggerModule() then os.clock() else nil
		})
	})
	var4:dispatch(clientAppLoaded({
		team = playersService.LocalPlayer and playersService.LocalPlayer.Team,
		isChatCoreGuiEnabled = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Chat),
		isTouchEnabled = userInputService.TouchEnabled,
		isGamepadEnabled = if userInputService.PreferredInput ~= Enum.PreferredInput.Gamepad then fFlagLuaSupportMicroGamepadPreferredInput and userInputService.PreferredInput == Enum.PreferredInput.MicroGamepad else true
	}))
	reportVersionLoadedModule(analytics, version[1])
	var2:trace("Roact.mount to {}", tostring(p4.parent))
	local experienceChat = roactModule.mount(var14, p4.parent, "ExperienceChat")
	local var15 = chatEnabledSystemMessageModule({
		translator = p4.translator,
		defaultSystemTextChannel = p4.defaultSystemTextChannel,
		localPlayer = localPlayer,
		displayVirtualSystemMessage = if var7 then showVirtualChatEnabledSystemMessage else nil
	})
	
	local function updateChatStatus(p6)
		-- upvalues: var9 (ref), isChatRegionLockedModule (copy), displaySystemMessageModule (copy), p4 (write), expChatNewSystemMessagesExperimentation (copy), var12 (write), canPlatformEnableChatModule (copy), fFlagExpChatRefactorEnabledMessageLogicModule (copy), fStringExpChatChatWithTFAmpFeatureNameModule (copy), fStringExpChatChatWithTFAmpNameSpaceModule (copy), var2 (copy), ampApiProvider (copy), localPlayer (ref), accessResponseEnum (copy), var7 (ref), showVirtualChatEnabledSystemMessage (ref), canOnlyChatInRegionModule (copy), var15 (ref)
		var9.setChatStatus(p6)
		
		if p6 == "GeoBlocked" or p6 ~= "Unknown" and isChatRegionLockedModule() then
			displaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionUnavailable", nil, "Roblox.ChatDisabled.Info", p4.translator, p4.defaultSystemTextChannel, "You can only view system messages here. Chat is not available in your region.")
			
			return
		elseif p6 == "AgeCheckGateExperiment" then
			displaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatDisabled.CheckAgeInAccountInfo", nil, "Roblox.ChatDisabled.Info", p4.translator, p4.defaultSystemTextChannel, "You can only view system messages here. Unlock chat with an age check at Settings > Account info.")
			
			return
		elseif p6 == "SettingsDisabled" then
			if expChatNewSystemMessagesExperimentation.isExperimentEnabled and expChatNewSystemMessagesExperimentation.isExperimentEnabled and not var12 then
				var12 = true
				expChatNewSystemMessagesExperimentation.logExposure()
			end
			displaySystemMessageModule(if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "CoreScripts.TextChat.Description.TurnOnChatInSettings" else "CoreScripts.TextChat.ChatWindow.ChatDisabled.SettingOff", nil, "Roblox.ChatDisabled.Info", p4.translator, p4.defaultSystemTextChannel, if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "Chat with people of similar age groups and trusted friends." else "You can only view system messages here. Update your Communication settings to turn on chat.")
			
			return
		elseif p6 == "SettingsDisabledVpc" then
			if expChatNewSystemMessagesExperimentation.isExperimentEnabled and expChatNewSystemMessagesExperimentation.isExperimentEnabled and not var12 then
				var12 = true
				expChatNewSystemMessagesExperimentation.logExposure()
			end
			displaySystemMessageModule(if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "CoreScripts.TextChat.Description.AskYourParentForPermissionToChat" else "CoreScripts.TextChat.ChatWindow.ChatDisabled.AskForPermission", nil, "Roblox.ChatDisabled.Info", p4.translator, p4.defaultSystemTextChannel, if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "Ask your parent for permission to chat in Privacy>Communication settings." else "You can only view system messages here. Ask your parent for permission to chat in Communication settings.")
			
			return
		elseif p6 == "AgeCheckVpc" then
			if expChatNewSystemMessagesExperimentation.isExperimentEnabled and expChatNewSystemMessagesExperimentation.isExperimentEnabled and not var12 then
				var12 = true
				expChatNewSystemMessagesExperimentation.logExposure()
			end
			displaySystemMessageModule(if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "CoreScripts.TextChat.Description.AskYourParentForPermissionToChat" else "CoreScripts.TextChat.ChatWindow.ChatDisabled.AskForPermissionToAgeCheck", nil, "Roblox.ChatDisabled.Info", p4.translator, p4.defaultSystemTextChannel, if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "Ask your parent for permission to chat in Privacy>Communication settings." else "You can only view system messages here. Ask your parent for permission to age check in Communication settings.")
			
			return
		elseif (canPlatformEnableChatModule() or p6 ~= "AgeVerificationRequired") and p6 ~= "IdVerificationRequired" then
			if p6 == "AgeVerificationRequired" then
				if expChatNewSystemMessagesExperimentation.isExperimentEnabled and expChatNewSystemMessagesExperimentation.isExperimentEnabled and not var12 then
					var12 = true
					expChatNewSystemMessagesExperimentation.logExposure()
				end
				displaySystemMessageModule(if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "CoreScripts.TextChat.Description.UnlockChatWithAnAgeCheck" else "CoreScripts.TextChat.ChatWindow.ChatDisabled.GetAnAgeCheck", nil, "Roblox.ChatDisabled.Info", p4.translator, p4.defaultSystemTextChannel, if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "Unlock chat with an age check." else "You can only view system messages here. Get an age check to chat.")
				
				return
			elseif fFlagExpChatRefactorEnabledMessageLogicModule and p6 == "Enabled" then
				coroutine.wrap(function()
					-- upvalues: fStringExpChatChatWithTFAmpFeatureNameModule (copy), fStringExpChatChatWithTFAmpNameSpaceModule (copy), var2 (copy), ampApiProvider (copy), localPlayer (copy), accessResponseEnum (copy), var7 (copy), showVirtualChatEnabledSystemMessage (copy), displaySystemMessageModule (copy), p4 (copy), canOnlyChatInRegionModule (copy), var15 (copy)
					if fStringExpChatChatWithTFAmpFeatureNameModule == "" or fStringExpChatChatWithTFAmpNameSpaceModule == "" then
						var2:error("AMP feature name or namespace are not set")
						
						return
					end
					local featureAccess = ampApiProvider.getFeatureAccess({ fStringExpChatChatWithTFAmpFeatureNameModule }, fStringExpChatChatWithTFAmpNameSpaceModule)
					
					if localPlayer.ChatAvailabilityStatus ~= "Enabled" then return end
					local var16 = if featureAccess.featureAccessList and #featureAccess.featureAccessList > 0 and featureAccess.featureAccessList[1] then featureAccess.featureAccessList[1].access == accessResponseEnum.Granted else nil
					
					if var16 == nil then
						var2:error("No feature access list found after AMP call")
						
						return
					elseif var16 then
						if var7 then
							showVirtualChatEnabledSystemMessage("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithTF", nil, "Only your trusted friends can chat with you.")
							
							return
						end
						displaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithTF", nil, "Roblox.ChatEnabled.Info", p4.translator, p4.defaultSystemTextChannel, "Only your trusted friends can chat with you.")
						
						return
					elseif not canOnlyChatInRegionModule() then
						var15()
						
						return
					elseif var7 then
						showVirtualChatEnabledSystemMessage("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatInRegion", nil, "You can view system messages and chat with users in your region only.")
						
						return
					end
					displaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatInRegion", nil, "Roblox.ChatEnabled.Info", p4.translator, p4.defaultSystemTextChannel, "You can view system messages and chat with users in your region only.")
				end)()
				
				return
			elseif p6 == "EnabledBubble" or p6 == "Enabled" and canOnlyChatInRegionModule() then
				if var7 then
					showVirtualChatEnabledSystemMessage("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatInRegion", nil, "You can view system messages and chat with users in your region only.")
					
					return
				end
				displaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatInRegion", nil, "Roblox.ChatEnabled.Info", p4.translator, p4.defaultSystemTextChannel, "You can view system messages and chat with users in your region only.")
				
				return
			elseif p6 == "Enabled" then
				var15()
				
				return
			elseif p6 == "AllUsers" or p6 == "NoOne" then
				if getChatTranslationEnabled() then
					displaySystemMessageModule("CoreScripts.TextChat.ChatTranslation.ChatWindow.SystemMessageNew", nil, "Roblox.ChatTranslation.ChatWindow.SystemMessage", p4.translator, p4.defaultSystemTextChannel, "Roblox automatically translates supported languages in chat")
					
					return
				end
			elseif p6 == "Ineligible" or p6 ~= "Unknown" then
				displaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatDisabled.OnlyViewSystemMessages", nil, "Roblox.ChatDisabled.Info", p4.translator, p4.defaultSystemTextChannel, "You can only view system messages here.")
			end
			return
		elseif expChatNewSystemMessagesExperimentation.isExperimentEnabled and expChatNewSystemMessagesExperimentation.isExperimentEnabled and not var12 then
			var12 = true
			expChatNewSystemMessagesExperimentation.logExposure()
		end
		displaySystemMessageModule(if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "CoreScripts.TextChat.Description.UnlockChatPrivacyCommunications" else "CoreScripts.TextChat.ChatWindow.ChatDisabled.CheckAgeInSettings", nil, "Roblox.ChatDisabled.Info", p4.translator, p4.defaultSystemTextChannel, if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "Unlock chat with an age check in Privacy>Communication settings." else "You can only view system messages here. To chat, get an age check in your Communication settings.")
	end
	
	local var16 = 0
	local randomValue = math.random(expChatHiddenMessagesPromptThresholdLowerBound, expChatHiddenMessagesPromptThresholdUpperBound)
	
	local function handleUserMessageIntentSent(p6)
		-- upvalues: var2 (copy), var5 (ref), isUserChatEnabledModule (copy), localPlayer (ref), var16 (write), randomValue (write), expChatHiddenMessagesPromptThresholdLowerBound (copy), expChatHiddenMessagesPromptThresholdUpperBound (copy), displaySystemMessageModule (copy), p4 (write), getTransparencyStoreModule (copy)
		var2:debug("Handling a message from UserMessageIntentSent")
		var5.handleHiddenMessageReceived(p6)
		
		if not isUserChatEnabledModule(localPlayer.ChatAvailabilityStatus) then
			var16 += 1
			
			if var16 == randomValue then
				randomValue += math.random(expChatHiddenMessagesPromptThresholdLowerBound, expChatHiddenMessagesPromptThresholdUpperBound)
				displaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatDisabled.DontMissMessages", nil, "Roblox.ChatDisabled.Info", p4.translator, p4.defaultSystemTextChannel, "Don\226\128\153t miss messages. Unlock chat with an age check.")
			end
		end
		getTransparencyStoreModule(false).resetTextTransparency()
	end
	
	local _ = function()
		-- upvalues: fFlagExpChatEnableFOMOUpsellModule (copy), shouldShowFOMOUpsellModule (copy), fFlagExpChatEnableCrossAgeChatActivityModule (copy), shouldShowCrossAgeChatActivityModule (copy)
		return fFlagExpChatEnableFOMOUpsellModule and shouldShowFOMOUpsellModule() or fFlagExpChatEnableCrossAgeChatActivityModule and shouldShowCrossAgeChatActivityModule()
	end
	
	if localPlayer then
		if fFlagEnableModerateChatRemoteEvent then
			local var17 = getExperienceChatVisualConfigModule()
			local var18 = getChatModerationStoreModule(false)
			local var19 = false
			p4.moderateChatStoreDisposeEffect = signalsModule.createEffect(function(p6)
				-- upvalues: var18 (ref), var19 (write), displaySystemMessageModule (copy), p4 (write), notificationModalsManagerModule (copy), UIBloxModule (copy), var17 (ref), fFlagConnectionsToFriendsRename (copy)
				local isSettingEnabled = var18.getIsSettingEnabled(p6)
				
				if isSettingEnabled ~= var19 then
					if isSettingEnabled then
						displaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.ModerateChatOn", nil, "Roblox.MessageStatus.Warning.ModerateChatOn", p4.translator, p4.defaultSystemTextChannel)
						notificationModalsManagerModule.SetUIBloxToast({
							iconImage = UIBloxModule.App.ImageSet.Images[var17.icon.off],
							toastSubtitle = p4.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOn.Subtitle"),
							toastTitle = p4.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOn.Title")
						})
					else
						displaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.ModerateChatOff", nil, "Roblox.MessageStatus.Warning.ModerateChatOff", p4.translator, p4.defaultSystemTextChannel)
						notificationModalsManagerModule.SetUIBloxToast({
							iconImage = UIBloxModule.App.ImageSet.Images[var17.icon.off],
							toastSubtitle = p4.translator:FormatByKey(if fFlagConnectionsToFriendsRename then "CoreScripts.TextChat.Toast.ModerateChatOff.Subtitle.FriendsRename" else "CoreScripts.TextChat.Toast.ModerateChatOff.Subtitle"),
							toastTitle = p4.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOff.Title")
						})
					end
					var19 = isSettingEnabled
				end
			end)
		end
		local chatAvailabilityStatus = localPlayer.ChatAvailabilityStatus
		var2:debug("Local player's initial ChatAvailabilityStatus is {}", chatAvailabilityStatus)
		updateChatStatus(chatAvailabilityStatus)
		local userMessageIntentSentConnection = nil
		
		if fFlagExpChatEnableFOMOUpsellModule and shouldShowFOMOUpsellModule() or fFlagExpChatEnableCrossAgeChatActivityModule and shouldShowCrossAgeChatActivityModule() then
			var2:debug("Connecting to UserMessageIntentSent")
			userMessageIntentSentConnection = textChatService.UserMessageIntentSent:Connect(handleUserMessageIntentSent)
		end
		localPlayer:GetPropertyChangedSignal("ChatAvailabilityStatus"):Connect(function()
			-- upvalues: chatAvailabilityStatus (write), localPlayer (ref), var2 (copy), updateChatStatus (ref), fFlagExpChatPresetChatEnabled (copy), fFlagExpChatPresetChatLoadTestEnabled (copy), isUserChatEnabledModule (copy), initializePresetChatModule (copy), getPresetChatStoreModule (copy), fFlagExpChatEnableFOMOUpsellModule (copy), shouldShowFOMOUpsellModule (copy), fFlagExpChatEnableCrossAgeChatActivityModule (copy), shouldShowCrossAgeChatActivityModule (copy), userMessageIntentSentConnection (write), textChatService (copy), handleUserMessageIntentSent (ref), fFlagExpChatClearHiddenMessagesPostAgeCheckModule (copy), var5 (ref), getTransparencyStoreModule (copy)
			chatAvailabilityStatus = localPlayer.ChatAvailabilityStatus
			var2:debug("Local player's ChatAvailabilityStatus has changed to {}", chatAvailabilityStatus)
			updateChatStatus(chatAvailabilityStatus)
			
			if (fFlagExpChatPresetChatEnabled or fFlagExpChatPresetChatLoadTestEnabled) and isUserChatEnabledModule(chatAvailabilityStatus) then
				initializePresetChatModule(getPresetChatStoreModule(false), not fFlagExpChatPresetChatEnabled and fFlagExpChatPresetChatLoadTestEnabled)
			end
			if (fFlagExpChatEnableFOMOUpsellModule and shouldShowFOMOUpsellModule() or fFlagExpChatEnableCrossAgeChatActivityModule and shouldShowCrossAgeChatActivityModule()) and not userMessageIntentSentConnection then
				var2:debug("Connecting to UserMessageIntentSent")
				userMessageIntentSentConnection = textChatService.UserMessageIntentSent:Connect(handleUserMessageIntentSent)
			end
			if fFlagExpChatEnableFOMOUpsellModule and isUserChatEnabledModule(chatAvailabilityStatus) and userMessageIntentSentConnection and (not fFlagExpChatEnableCrossAgeChatActivityModule or not shouldShowCrossAgeChatActivityModule()) then
				var2:debug("Disconnecting from UserMessageIntentSent")
				userMessageIntentSentConnection:Disconnect()
				
				if fFlagExpChatClearHiddenMessagesPostAgeCheckModule then
					var5.handleHiddenMessagesCleared()
					getTransparencyStoreModule(false).resetTextTransparency()
				end
			end
			var5.setCanLocalUserChat(isUserChatEnabledModule(chatAvailabilityStatus))
		end)
	elseif isChatRegionLockedModule() then
		displaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionUnavailable", nil, "Roblox.ChatDisabled.Info", p4.translator, p4.defaultSystemTextChannel, "You can only view system messages here. Chat is currently unavailable in your region.")
	end
	if fFlagExpChatPresetChatEnabled or fFlagExpChatPresetChatLoadTestEnabled then
		initializePresetChatModule(getPresetChatStoreModule(false), not fFlagExpChatPresetChatEnabled and fFlagExpChatPresetChatLoadTestEnabled)
	end
	return { roactInstance = experienceChat }
end