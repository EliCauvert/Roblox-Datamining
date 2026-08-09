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
local getPresetChatStoreModule = require(expChat.Stores.GetPresetChatStore)
local getChatTooltipStoreModule = require(expChat.Stores.GetChatTooltipStore)
local initializePresetChatModule = require(expChat.PresetChat.initializePresetChat)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local fFlagExpChatPresetChatLoadTestEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatLoadTestEnabled
local fFlagExpChatUseUnifiedTooltipStore = expChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore
local getFFlagExpChatProtectedChatInternalAPIs = sharedFlagsModule.getFFlagExpChatProtectedChatInternalAPIs
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local fFlagExpChatUseProximityStore = sharedFlagsModule.FFlagExpChatUseProximityStore
local var29 = if fFlagExpChatUseProximityStore then require(expChat.Stores.GetProximityStore) else nil
local analytics = expChatSharedModule.Analytics
local countParticipantsInTextChannel = expChatSharedModule.countParticipantsInTextChannel
local appModule = require(script.Parent.App)
local var31 = expChatSharedModule.Logger:new("ExpChat/" .. script.Name)
local createDispatchBindableEventModule = require(script.Parent.createDispatchBindableEvent)
local bindableEventQueueModule = require(expChat.Events.bindableEventQueue)
local createStoreModule = require(script.Parent.createStore)
local getNameColorModule = require(script.Parent.GetNameColor)
local reportMessageReceivedModule = require(script.Parent.reportMessageReceived)
local canPlatformEnableChatModule = require(script.Parent.canPlatformEnableChat)
local watchForErrors = expChatSharedModule.watchForErrors
local commands = expChatSharedModule.Commands
local actions = expChat.Actions
local incomingMessageReceivedModule = require(actions.IncomingMessageReceived)
local universeChatSystemMessageAddedModule = require(actions.UniverseChatSystemMessageAdded)
local incomingBubbleChatMessageReceivedModule = require(actions.IncomingBubbleChatMessageReceived)
local outgoingMessageSentModule = require(actions.OutgoingMessageSent)
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
local chatPrivacySettingsReceivedModule = require(actions.ChatPrivacySettingsReceived)
local chatPrivacySettingsFetchFailedModule = require(actions.ChatPrivacySettingsFetchFailed)
local commandAliasChanged = expChatSharedModule.Actions.CommandAliasChanged
local humanoidDiedModule = require(actions.HumanoidDied)
local adorneeAddedModule = require(actions.AdorneeAdded)
local legacyBubbleChatEnabledChangedModule = require(actions.LegacyBubbleChatEnabledChanged)
local legacyBubbleChatSettingsChangedModule = require(actions.LegacyBubbleChatSettingsChanged)
local localTextChannelParticipantAddedModule = require(actions.LocalTextChannelParticipantAdded)
local localTextChannelParticipantRemoved = expChatSharedModule.Actions.LocalTextChannelParticipantRemoved
local hiddenMessageReceivedModule = require(actions.HiddenMessageReceived)
local hiddenMessagesClearedModule = require(actions.HiddenMessagesCleared)
local universeChatChannelAddedModule = require(actions.UniverseChatChannelAdded)
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
local flags = expChat.Flags
local getEngineFeatureFlagEnableDisplayBubbleModule = require(flags.getEngineFeatureFlagEnableDisplayBubble)
local getFFlagUnreduxLastInputTypeChangedModule = require(flags.getFFlagUnreduxLastInputTypeChanged)
local getFFlagExpChatEnableChannelTabsUIModule = require(flags.getFFlagExpChatEnableChannelTabsUI)
local getFFlagUseCharacterStore = expChatSharedModule.Flags.getFFlagUseCharacterStore
local getFFlagExpChatSuppressWelcomeMessageTabUnread = expChatSharedModule.Flags.GetFFlagExpChatSuppressWelcomeMessageTabUnread
local getFFlagExpChatTelemetryEventTriggerModule = require(expChat.Flags.getFFlagExpChatTelemetryEventTrigger)
local fFlagAEGIS2EnableGatesForExpChatModule = require(flags.FFlagAEGIS2EnableGatesForExpChat)
local expChatMessageResponseThrottlePermyriad = game:DefineFastInt("ExpChatMessageResponseThrottlePermyriad", 0)
local expChatMessageResponseUserSamplePermyriad = game:DefineFastInt("ExpChatMessageResponseUserSamplePermyriad", 0)
local expChatHiddenMessagesPromptThresholdLowerBound = game:DefineFastInt("ExpChatHiddenMessagesPromptThresholdLowerBound", 10)
local expChatHiddenMessagesPromptThresholdUpperBound = game:DefineFastInt("ExpChatHiddenMessagesPromptThresholdUpperBound", 45)
local fFlagExpChatEnableFOMOUpsellModule = require(flags.FFlagExpChatEnableFOMOUpsell)
local fFlagExpChatClearHiddenMessagesPostAgeCheckModule = require(flags.FFlagExpChatClearHiddenMessagesPostAgeCheck)
local fFlagEnableInExpChatSummaryOnLuaModule = require(flags.FFlagEnableInExpChatSummaryOnLua)
local fFlagExpChatEnableCrossAgeChatActivityModule = require(flags.FFlagExpChatEnableCrossAgeChatActivity)
local fFlagExpChatUnreadTabIndicatorV2WindowModule = require(flags.FFlagExpChatUnreadTabIndicatorV2Window)
local fFlagExpChatUseAdorneeStore = sharedFlagsModule.FFlagExpChatUseAdorneeStore
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagExpChatUseChannelTabsStore = sharedFlagsModule.FFlagExpChatUseChannelTabsStore
local fFlagExpChatUseChatConfigStore = sharedFlagsModule.FFlagExpChatUseChatConfigStore
local fFlagEnableModerateChatRemoteEvent = sharedFlagsModule.FFlagEnableModerateChatRemoteEvent
local fFlagEnableClientSummarySystemMessageOnLua = sharedFlagsModule.FFlagEnableClientSummarySystemMessageOnLua
local fFlagExpChatPerfTracking = sharedFlagsModule.FFlagExpChatPerfTracking
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local getFFlagEnableExpChatUniverseChatTabNames = expChatSharedModule.Flags.GetFFlagEnableExpChatUniverseChatTabNames
local expChatRemoveSpaceFromTeamPrefix = game:DefineFastFlag("ExpChatRemoveSpaceFromTeamPrefix", false)
local fFlagChatLineReportingGlobalMuteEnabled = sharedFlagsModule.FFlagChatLineReportingGlobalMuteEnabled
local fFlagAIRephraseSettingEnabled = sharedFlagsModule.FFlagAIRephraseSettingEnabled
local fFlagChatSummariesSettingEnabled = sharedFlagsModule.FFlagChatSummariesSettingEnabled
local fFlagEnableGlobalChat3pSummaryLuaAppsModule = require(flags.FFlagEnableGlobalChat3pSummaryLuaApps)
local fFlagExpChatEnableGlobalChatSummarySystemMessageModule = require(flags.FFlagExpChatEnableGlobalChatSummarySystemMessage)
local fFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule = require(flags.FFlagExpChatEnablePostProcessRichSystemMessageTextFormat)
local fFlagFixGlobalChat3pSummarySystemMessageModule = require(flags.FFlagFixGlobalChat3pSummarySystemMessage)
local expChatSuppressGlobalSummaryTabUnread = game:DefineFastFlag("ExpChatSuppressGlobalSummaryTabUnread", false)
local fFlagExpChatRefactorEnabledMessageLogicModule = require(flags.FFlagExpChatRefactorEnabledMessageLogic)
local fStringExpChatChatWithTFAmpFeatureNameModule = require(flags.FStringExpChatChatWithTFAmpFeatureName)
local fStringExpChatChatWithTFAmpNameSpaceModule = require(flags.FStringExpChatChatWithTFAmpNameSpace)
local expChatNewSystemMessagesExperimentation = require(parent.SocialExperiments).ExpChatNewSystemMessagesExperimentation

function getChatTranslationEnabled() --[[ line: 160 ]]
	-- upvalues: textChatService (ref)
	local ok, status = pcall(function() --[[ line: 161 ]]
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
local context = expChatSharedModule.context
local reportVersionLoadedModule = require(script.reportVersionLoaded)
local version = expChatSharedModule.Version
local atomicBindingModule = require(expChat.AtomicBinding)
local chatEnabledSystemMessageModule = require(script.SystemMessages.ChatEnabledSystemMessage)

local function watchPlayersService(p0, p1, p2) --[[ line: 191 ]]
	-- upvalues: var31 (ref), isPlayerVerifiedModule (ref), playerAdded (ref), playersService (ref), localTeamChanged (ref), fFlagExpChatUseAdorneeStore (ref), context (ref), adorneeAddedModule (ref), humanoidDiedModule (ref), atomicBindingModule (ref), waitForFirstModule (ref), localCharacterLoaded (ref), getFFlagUseCharacterStore (ref), characterAdded (ref), promiseModule (ref), displaySystemMessageModule (ref), fFlagConnectionsToFriendsRename (ref), playerRemoved (ref), fFlagExpChatUseMessagesStore (ref)
	var31:trace("Watching Players service")
	local t = {}
	
	local function onPlayerAdded(p3) --[[ line: 195 ]]
		-- upvalues: var31 (copy), isPlayerVerifiedModule (copy), p1 (ref), playerAdded (copy), playersService (copy), localTeamChanged (copy), fFlagExpChatUseAdorneeStore (copy), context (copy), adorneeAddedModule (copy), humanoidDiedModule (copy), atomicBindingModule (copy), waitForFirstModule (copy), localCharacterLoaded (copy), getFFlagUseCharacterStore (copy), characterAdded (copy), t (ref)
		var31:trace("Player added: {} {}", p3.Name, tostring(p3.UserId))
		p1:dispatch(playerAdded(p3.UserId, p3.Name, p3.DisplayName, if isPlayerVerifiedModule(p3) then true else nil))
		
		if p3 == playersService.LocalPlayer then
			var31:trace("Found local player")
			p3:GetPropertyChangedSignal("Team"):Connect(function() --[[ line: 204 ]]
				-- upvalues: p1 (copy), localTeamChanged (copy), p3 (ref)
				p1:dispatch(localTeamChanged(p3.Team))
			end)
		end
		local function _() --[[ line: 209 | named "getHumanoidBinding" ]]
			-- upvalues: p3 (ref), fFlagExpChatUseAdorneeStore (copy), context (copy), p1 (copy), adorneeAddedModule (copy), humanoidDiedModule (copy), atomicBindingModule (copy)
			return atomicBindingModule.new({
				humanoid = "Humanoid",
				humanoidRootPart = "HumanoidRootPart"
			}, function(p4) --[[ line: 212 | named "dispatchBubbleChatAdornee" ]]
				-- upvalues: p3 (copy), fFlagExpChatUseAdorneeStore (copy), context (copy), p1 (copy), adorneeAddedModule (copy), humanoidDiedModule (copy)
				local root = p4.root
				local humanoid = p4.humanoid
				local humanoidRootPart = p4.humanoidRootPart
				
				if not humanoid:IsA("Humanoid") or not humanoidRootPart:IsA("BasePart") then
					return function() --[[ line: 245 ]] end
				elseif root and humanoidRootPart and p3.Character == root then
					if fFlagExpChatUseAdorneeStore then
						context.adorneeStore.handleAdorneeAdded(p3.UserId, root, humanoid)
					else
						p1:dispatch(adorneeAddedModule(p3.UserId, root, humanoid))
					end
				end
				local diedConnection = humanoid.Died:Connect(function() --[[ line: 226 ]]
					-- upvalues: fFlagExpChatUseAdorneeStore (copy), context (copy), p3 (copy), p1 (copy), humanoidDiedModule (copy)
					if fFlagExpChatUseAdorneeStore then
						context.adorneeStore.handleHumanoidDied(p3.UserId)
						
						return
					end
					p1:dispatch(humanoidDiedModule(p3.UserId))
				end)
				
				return function() --[[ line: 234 | named "disconnectHumanoidDied" ]]
					-- upvalues: diedConnection (ref)
					if diedConnection then
						diedConnection:Disconnect()
					end
				end
			end)
		end
		
		local var107 = atomicBindingModule.new({
			humanoid = "Humanoid",
			humanoidRootPart = "HumanoidRootPart"
		}, function(p5) --[[ line: 212 | named "dispatchBubbleChatAdornee" ]]
			-- upvalues: p3 (ref), fFlagExpChatUseAdorneeStore (copy), context (copy), p1 (copy), adorneeAddedModule (copy), humanoidDiedModule (copy)
			local root = p5.root
			local humanoid = p5.humanoid
			local humanoidRootPart = p5.humanoidRootPart
			
			if not humanoid:IsA("Humanoid") or not humanoidRootPart:IsA("BasePart") then
				return function() --[[ line: 245 ]] end
			elseif root and humanoidRootPart and p3.Character == root then
				if fFlagExpChatUseAdorneeStore then
					context.adorneeStore.handleAdorneeAdded(p3.UserId, root, humanoid)
				else
					p1:dispatch(adorneeAddedModule(p3.UserId, root, humanoid))
				end
			end
			local diedConnection = humanoid.Died:Connect(function() --[[ line: 226 ]]
				-- upvalues: fFlagExpChatUseAdorneeStore (copy), context (copy), p3 (copy), p1 (copy), humanoidDiedModule (copy)
				if fFlagExpChatUseAdorneeStore then
					context.adorneeStore.handleHumanoidDied(p3.UserId)
					
					return
				end
				p1:dispatch(humanoidDiedModule(p3.UserId))
			end)
			
			return function() --[[ line: 234 | named "disconnectHumanoidDied" ]]
				-- upvalues: diedConnection (ref)
				if diedConnection then
					diedConnection:Disconnect()
				end
			end
		end)
		
		local function onCharacterAdded(p6) --[[ line: 256 ]]
			-- upvalues: waitForFirstModule (copy), p3 (ref), var31 (copy), playersService (copy), p1 (copy), localCharacterLoaded (copy), getFFlagUseCharacterStore (copy), context (copy), characterAdded (copy), var107 (ref)
			if not p6.Parent then
				waitForFirstModule(p6.AncestryChanged, p3.CharacterAdded)
			end
			if p3.Character ~= p6 or not p6.Parent then
				var31:debug("Mismatched or unparented character in onCharacterAdded for {}", tostring(p3.UserId))
				
				return
			elseif p3 == playersService.LocalPlayer then
				var31:debug("Local character loaded: {}", p6.Name)
				p1:dispatch(localCharacterLoaded(p6))
			end
			if getFFlagUseCharacterStore() then
				context.characterStore.handleCharacterAdded(p3.UserId, p6)
			else
				p1:dispatch(characterAdded(p3.UserId, p6))
			end
			var107:bindRoot(p6)
		end
		
		var107 = function(p7) --[[ line: 280 | named "onCharacterRemoving" ]]
			-- upvalues: var107 (ref)
			var107:unbindRoot(p7)
		end
		
		if p3.Character then
			onCharacterAdded(p3.Character)
		end
		local characterAddedConnection = p3.CharacterAdded:Connect(onCharacterAdded)
		local characterRemovingConnection = p3.CharacterRemoving:Connect(var107)
		
		if not t[p3.UserId] then
			t[p3.UserId] = { characterAddedConnection, characterRemovingConnection }
		end
	end
	
	local function onNewPlayerAdded(p8) --[[ line: 298 ]]
		-- upvalues: onPlayerAdded (ref), playersService (copy), promiseModule (copy), displaySystemMessageModule (copy), fFlagConnectionsToFriendsRename (copy), p0 (ref), var31 (copy)
		onPlayerAdded(p8)
		
		if playersService.LocalPlayer then
			promiseModule.try(function() --[[ line: 302 ]]
				-- upvalues: p8 (ref), playersService (copy)
				return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then p8:IsFriendsWithAsync(playersService.LocalPlayer.UserId) else p8:IsFriendsWith(playersService.LocalPlayer.UserId)
			end):andThen(function(p10) --[[ line: 309 ]]
				-- upvalues: displaySystemMessageModule (copy), fFlagConnectionsToFriendsRename (copy), p8 (ref), p0 (copy)
				if p10 then
					displaySystemMessageModule(if fFlagConnectionsToFriendsRename then "InGame.UnknownNamespace.GameChat.FriendChatNotifier.JoinMessage" else "InGame.UnknownNamespace.GameChat_FriendChatNotifier_JoinMessage", { RBX_NAME = p8.DisplayName }, "Roblox.Notification.Friend.Joined", p0.translator, p0.defaultSystemTextChannel)
				end
			end):catch(function(p9) --[[ line: 322 ]]
				-- upvalues: var31 (copy)
				var31:error("Could not fetch friendship status. Error: {}", tostring(p9))
			end)
		end
	end
	
	for i, v in pairs(playersService:GetPlayers()) do
		if v:IsA("Player") then
			onPlayerAdded(v)
		end
	end
	playersService.PlayerAdded:Connect(onNewPlayerAdded)
	playersService.PlayerRemoving:Connect(function(p11) --[[ line: 337 ]]
		-- upvalues: var31 (copy), p1 (ref), playerRemoved (copy), fFlagExpChatUseMessagesStore (copy), p2 (ref), fFlagExpChatUseAdorneeStore (copy), context (copy), getFFlagUseCharacterStore (copy), t (ref)
		var31:trace("Player removed: {} {}", p11.Name, tostring(p11.UserId))
		p1:dispatch(playerRemoved(p11.UserId))
		
		if fFlagExpChatUseMessagesStore then
			p2.handlePlayerRemoved(p11.UserId)
		end
		if fFlagExpChatUseAdorneeStore then
			context.adorneeStore.handlePlayerRemoved(p11.UserId)
		end
		if getFFlagUseCharacterStore() then
			context.characterStore.handlePlayerRemoved(p11.UserId)
		end
		local userId = t[p11.UserId]
		
		if userId then
			for i, v in ipairs(userId) do
				v:Disconnect()
			end
			t[p11.UserId] = nil
		end
	end)
end

local t_1 = {
	canUserChatAsync = function(p12) --[[ line: 389 ]]
		-- upvalues: chatService (ref)
		return chatService:CanUserChatAsync(p12)
	end
}

local var103 = function(p13) --[[ line: 394 ]]
	-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (ref), var31 (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), generateRichSystemMessageTextFormatModule (ref), UIBloxModule (ref)
	if getFFlagExpChatProtectedChatInternalAPIs() then
		var31:trace("System OnIncomingMessage started: PrefixTextInternal: {} TextInternal: {}", p13.PrefixTextInternal, p13.TextInternal)
	else
		var31:trace("System OnIncomingMessage started: {} {}", p13.PrefixText, p13.Text)
	end
	local textChatMessageProperties = Instance.new("TextChatMessageProperties")
	textChatMessageProperties.Text = if fFlagEnableInExpChatSummaryOnLuaModule then generateRichSystemMessageTextFormatModule(if getFFlagExpChatProtectedChatInternalAPIs() then p13.TextInternal else p13.Text, not not string.find(p13.Metadata, "Error")) else string.format("<font color=\"#%s\">%s</font>", if string.find(p13.Metadata, "Error") then UIBloxModule.App.Style.Colors.Red:ToHex() else UIBloxModule.App.Style.Colors.LightGrey:ToHex(), if getFFlagExpChatProtectedChatInternalAPIs() then p13.TextInternal else p13.Text)
	var31:trace("System OnIncomingMessage finished: {} {}", textChatMessageProperties.PrefixText, textChatMessageProperties.Text)
	
	return textChatMessageProperties
end

return function(p14) --[[ line: 423 ]]
	-- upvalues: var31 (ref), dictionary (ref), t_1 (ref), createStoreModule (ref), createDispatchBindableEventModule (ref), bindableEventQueueModule (ref), watchForErrors (ref), context (ref), fFlagExpChatUseAdorneeStore (ref), getAdorneeStoreModule (ref), fFlagExpChatUseProximityStore (ref), var29 (ref), fFlagExpChatUseMessagesStore (ref), getMessagesStoreModule (ref), fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref), fFlagExpChatUseChatConfigStore (ref), getChatConfigurationStoreModule (ref), fFlagAEGIS2EnableGatesForExpChatModule (ref), getChatStatusStoreModule (ref), getGlobalMutedUsersStoreModule (ref), getFFlagUseCharacterStore (ref), getCharacterStoreModule (ref), analytics (ref), getFFlagUnreduxLastInputTypeChangedModule (ref), userInputService (ref), lastInputTypeChangedModule (ref), var103 (ref), chatService (ref), textChatService (ref), setUpConfigurationObjectsModule (ref), setUpClientSettingsModule (ref), playersService (ref), displaySystemMessageModule (ref), getFFlagExpChatProtectedChatInternalAPIs (ref), fFlagExpChatPerfTracking (ref), expChatPerfTracker (ref), reportMessageReceivedModule (ref), handleChannelWelcomeMessageModule (ref), getTransparencyStoreModule (ref), fFlagExpChatUnreadTabIndicatorV2WindowModule (ref), markChannelUnreadForIncomingMessageModule (ref), incomingMessageReceivedModule (ref), getFFlagExpChatSuppressWelcomeMessageTabUnread (ref), shouldSuppressUnreadForTabMetadataModule (ref), markChannelUnreadForSystemMessageModule (ref), universeChatSystemMessageAddedModule (ref), shouldSendHighFrequencyTelemetryModule (ref), expChatMessageResponseUserSamplePermyriad (ref), t (ref), textChannelCreated (ref), getFFlagExpChatEnableChannelTabsUIModule (ref), getNameColorModule (ref), expChatRemoveSpaceFromTeamPrefix (ref), getOtherDisplayNameInWhisperChannelModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), expChatNewSystemMessagesExperimentation (ref), summaryMessageRichTextModule (ref), fFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule (ref), fFlagExpChatEnableGlobalChatSummarySystemMessageModule (ref), expChatSuppressGlobalSummaryTabUnread (ref), fFlagFixGlobalChat3pSummarySystemMessageModule (ref), fFlagEnableInExpChatSummaryOnLuaModule (ref), fFlagEnableClientSummarySystemMessageOnLua (ref), textChannelRemoved (ref), textChatMessageChatActionTypeModule (ref), fFlagEnableGlobalChat3pSummaryLuaAppsModule (ref), fFlagAIRephraseSettingEnabled (ref), fFlagChatSummariesSettingEnabled (ref), robloxReplicatedStorageService (ref), getUserChatSettingsStoreModule (ref), outgoingMessageSentModule (ref), countParticipantsInTextChannel (ref), localTextChannelParticipantAddedModule (ref), localTextChannelParticipantRemoved (ref), fFlagExpChatUseUnifiedTooltipStore (ref), getChatTooltipStoreModule (ref), universeChatChannelAddedModule (ref), getFFlagEnableExpChatUniverseChatTabNames (ref), shouldFilterGlobalMessageModule (ref), fFlagChatLineReportingGlobalMuteEnabled (ref), httpService (ref), incomingBubbleChatMessageReceivedModule (ref), legacyBubbleChatEnabledChangedModule (ref), legacyBubbleChatSettingsChangedModule (ref), getEngineFeatureFlagEnableDisplayBubbleModule (ref), commands (ref), commandAliasChanged (ref), promiseModule (ref), chatPrivacySettingsReceivedModule (ref), chatPrivacySettingsFetchFailedModule (ref), watchPlayersService (ref), UIBloxModule (ref), roactModule (ref), appModule (ref), getFFlagExpChatTelemetryEventTriggerModule (ref), clientAppLoaded (ref), starterGuiService (ref), reportVersionLoadedModule (ref), version (ref), chatEnabledSystemMessageModule (ref), isChatRegionLockedModule (ref), canPlatformEnableChatModule (ref), fFlagExpChatRefactorEnabledMessageLogicModule (ref), fStringExpChatChatWithTFAmpFeatureNameModule (ref), fStringExpChatChatWithTFAmpNameSpaceModule (ref), ampApiProvider (ref), accessResponseEnum (ref), canOnlyChatInRegionModule (ref), expChatHiddenMessagesPromptThresholdLowerBound (ref), expChatHiddenMessagesPromptThresholdUpperBound (ref), hiddenMessageReceivedModule (ref), isUserChatEnabledModule (ref), fFlagExpChatEnableFOMOUpsellModule (ref), shouldShowFOMOUpsellModule (ref), fFlagExpChatEnableCrossAgeChatActivityModule (ref), shouldShowCrossAgeChatActivityModule (ref), fFlagEnableModerateChatRemoteEvent (ref), getExperienceChatVisualConfigModule (ref), getChatModerationStoreModule (ref), signalsModule (ref), notificationModalsManagerModule (ref), fFlagConnectionsToFriendsRename (ref), fFlagExpChatPresetChatEnabled (ref), fFlagExpChatPresetChatLoadTestEnabled (ref), initializePresetChatModule (ref), getPresetChatStoreModule (ref), fFlagExpChatClearHiddenMessagesPostAgeCheckModule (ref), hiddenMessagesClearedModule (ref)
	var31:trace("mountClientApp started")
	p14 = dictionary.join(t_1, p14)
	local var113 = createStoreModule()
	createDispatchBindableEventModule(var113)
	bindableEventQueueModule:flush()
	watchForErrors(game:GetService("ScriptContext"), p14.script, false)
	context.translator = p14.translator
	context.store = var113
	
	if fFlagExpChatUseAdorneeStore then
		context.adorneeStore = getAdorneeStoreModule(false)
	end
	if fFlagExpChatUseProximityStore then
		context.proximityStore = var29(false)
	end
	local var114 = if fFlagExpChatUseMessagesStore then getMessagesStoreModule(false) else nil
	local var115 = if fFlagExpChatUseChannelTabsStore then getChannelTabsStoreModule(false) else nil
	local var116 = if fFlagExpChatUseChatConfigStore then getChatConfigurationStoreModule(false) else nil
	local var117 = if fFlagAEGIS2EnableGatesForExpChatModule then getChatStatusStoreModule(false) else nil
	
	if fFlagExpChatUseMessagesStore then
		context.messagesStore = var114
	end
	context.globalMutedUsersStore = getGlobalMutedUsersStoreModule(false)
	
	if getFFlagUseCharacterStore() then
		context.characterStore = getCharacterStoreModule(false)
	end
	if p14.analytics then
		analytics.with(p14.analytics)
	end
	if not getFFlagUnreduxLastInputTypeChangedModule() then
		userInputService.LastInputTypeChanged:Connect(function(p15) --[[ line: 468 ]]
			-- upvalues: var113 (ref), lastInputTypeChangedModule (copy)
			var113:dispatch(lastInputTypeChangedModule(p15))
		end)
	end
	if p14.defaultSystemTextChannel then
		p14.defaultSystemTextChannel.OnIncomingMessage = var103
	else
		chatService:GetPropertyChangedSignal("IsAutoMigrated"):Once(function() --[[ line: 476 ]]
			-- upvalues: textChatService (copy), p14 (write), var103 (copy)
			local RBXSystem = textChatService:FindFirstChild("RBXSystem", true)
			
			if RBXSystem and RBXSystem:IsA("TextChannel") then
				p14.defaultSystemTextChannel = RBXSystem
				RBXSystem.OnIncomingMessage = var103
			end
		end)
	end
	setUpConfigurationObjectsModule(var113, p14)
	setUpClientSettingsModule(var113)
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		localPlayer:GetPropertyChangedSignal("Team"):Connect(function() --[[ line: 490 ]]
			-- upvalues: localPlayer (ref), displaySystemMessageModule (copy), p14 (write)
			local team = localPlayer.Team
			
			if team then
				displaySystemMessageModule("InGame.UnknownNamespace.GameChat_TeamChat_NowInTeam", { RBX_NAME = team.Name }, "Roblox.Team.Success.NowInTeam", p14.translator, p14.defaultSystemTextChannel)
			end
		end)
	end
	local t_2 = {
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
	
	local function _processIncomingMessageCore(a, b, p16) --[[ line: 536 ]]
		-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), var31 (copy), fFlagExpChatPerfTracking (copy), localPlayer (ref), expChatPerfTracker (copy), reportMessageReceivedModule (copy), handleChannelWelcomeMessageModule (copy), displaySystemMessageModule (copy), p14 (write), fFlagExpChatUseMessagesStore (copy), var114 (ref), getTransparencyStoreModule (copy), fFlagExpChatUseChannelTabsStore (copy), var115 (ref), fFlagExpChatUnreadTabIndicatorV2WindowModule (copy), var113 (ref), markChannelUnreadForIncomingMessageModule (copy), incomingMessageReceivedModule (copy), t_2 (ref), getFFlagExpChatSuppressWelcomeMessageTabUnread (copy), shouldSuppressUnreadForTabMetadataModule (copy), markChannelUnreadForSystemMessageModule (copy), universeChatSystemMessageAddedModule (copy), textChatService (copy), shouldSendHighFrequencyTelemetryModule (copy), expChatMessageResponseUserSamplePermyriad (copy), analytics (copy), t (copy)
		if getFFlagExpChatProtectedChatInternalAPIs() then
			var31:debug("Incoming MessageReceived Status: {} TextInternal: {}", a.Status.Name, a.TextInternal)
		else
			var31:debug("Incoming MessageReceived Status: {} Text: {}", a.Status.Name, a.Text)
		end
		if fFlagExpChatPerfTracking and (if a.TextSource then a.TextSource.UserId else "UNKNOWN_TEXT_SOURCE_USER_ID") ~= (if localPlayer then localPlayer.UserId else "UNKNOWN_LOCAL_USER_ID") then
			expChatPerfTracker.start(expChatPerfTracker.Events.MessageReceiveToWindowRenderInterval, { messageId = a.MessageId })
		end
		if localPlayer then
			reportMessageReceivedModule(localPlayer.UserId, a)
		end
		if localPlayer and a.TextSource and a.TextSource.UserId ~= localPlayer.UserId then
			local var147 = handleChannelWelcomeMessageModule(a, localPlayer)
			
			if var147 then
				displaySystemMessageModule(var147.key, var147.args, var147.metadata, p14.translator, a.TextChannel)
			end
		end
		local var148 = localPlayer and (a.TextSource and a.TextSource.UserId == localPlayer.UserId)
		
		if fFlagExpChatUseMessagesStore then
			var114.handleIncomingOrOutgoingMessage(a, var148, b, p16)
			getTransparencyStoreModule(false).resetTextTransparency()
			
			if fFlagExpChatUseChannelTabsStore and var115 then
				var115.handleIncomingOrOutgoingMessage(a, var148, b)
			elseif fFlagExpChatUnreadTabIndicatorV2WindowModule then
				var113:dispatch(markChannelUnreadForIncomingMessageModule(a, var148, b, p16))
			end
		else
			var113:dispatch(incomingMessageReceivedModule(a, var148, b, p16))
			getTransparencyStoreModule(false).resetTextTransparency()
		end
		local status = t_2[a.Status]
		
		if status then
			local ok, status_1 = pcall(function() --[[ line: 620 ]]
				-- upvalues: p14 (copy), status (ref)
				return p14.translator:FormatByKey(status.key)
			end)
			
			if not b or not (ok and (status_1 and status_1 ~= "")) then
				local defaultSystemTextChannel = p14.defaultSystemTextChannel
				
				if b then
					local var149 = textChatService:FindFirstChild(b)
					
					if var149 and var149:IsA("TextChannel") then
						defaultSystemTextChannel = var149
					end
				end
				displaySystemMessageModule(status.key, nil, status.metadata, p14.translator, defaultSystemTextChannel)
			elseif fFlagExpChatUseMessagesStore and var114 then
				var114.addSystemMessage(status_1, b, if getFFlagExpChatSuppressWelcomeMessageTabUnread() then status.metadata else nil)
				
				if fFlagExpChatUseChannelTabsStore and var115 and (not getFFlagExpChatSuppressWelcomeMessageTabUnread() or not shouldSuppressUnreadForTabMetadataModule(status.metadata)) then
					var115.markChannelUnread(b)
				elseif fFlagExpChatUnreadTabIndicatorV2WindowModule then
					var113:dispatch(markChannelUnreadForSystemMessageModule(status_1, b, if getFFlagExpChatSuppressWelcomeMessageTabUnread() then status.metadata else nil))
				end
			else
				var113:dispatch(universeChatSystemMessageAddedModule(status_1, b, if getFFlagExpChatSuppressWelcomeMessageTabUnread() then status.metadata else nil))
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
	
	local function _(a, b) --[[ line: 681 | named "processIncomingMessage" ]]
		-- upvalues: _processIncomingMessageCore (ref)
		_processIncomingMessageCore(a, b, nil)
	end
	
	local _ = function(a, b) --[[ line: 687 | named "processIncomingMessageWithOptions" ]]
		-- upvalues: _processIncomingMessageCore (ref)
		_processIncomingMessageCore(a, b and b.channelNameOverride, b and b.isUniverseChat)
	end
	
	local function handleMessageReceived(p17) --[[ line: 695 ]]
		-- upvalues: var113 (ref), textChannelCreated (copy), getFFlagExpChatEnableChannelTabsUIModule (copy), textChatService (copy), getNameColorModule (copy), getFFlagExpChatProtectedChatInternalAPIs (copy), var31 (copy), playersService (copy), expChatRemoveSpaceFromTeamPrefix (copy), localPlayer (ref), getOtherDisplayNameInWhisperChannelModule (copy), p14 (write), getFFlagTextChatEnableUniverseChatTabs (copy), _processIncomingMessageCore (ref), fFlagExpChatPerfTracking (copy), expChatPerfTracker (copy), reportMessageReceivedModule (copy), handleChannelWelcomeMessageModule (copy), displaySystemMessageModule (copy), fFlagExpChatUseMessagesStore (copy), var114 (ref), getTransparencyStoreModule (copy), fFlagExpChatUseChannelTabsStore (copy), var115 (ref), fFlagExpChatUnreadTabIndicatorV2WindowModule (copy), markChannelUnreadForIncomingMessageModule (copy), incomingMessageReceivedModule (copy), shouldSendHighFrequencyTelemetryModule (copy), expChatMessageResponseUserSamplePermyriad (copy), analytics (copy), t (copy)
		var113:dispatch(textChannelCreated(p17))
		local enabled = false
		
		if getFFlagExpChatEnableChannelTabsUIModule() then
			local channelTabsConfiguration = textChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
			
			if channelTabsConfiguration then
				enabled = channelTabsConfiguration.Enabled
			end
		end
		if string.find(p17.Name, "RBXGeneral") then
			function p17.OnIncomingMessage(p18) --[[ line: 707 ]]
				-- upvalues: getNameColorModule (copy), getFFlagExpChatProtectedChatInternalAPIs (copy)
				local textChatMessageProperties = Instance.new("TextChatMessageProperties")
				
				if p18.TextSource then
					local var152 = getNameColorModule(p18.TextSource.UserId)
					
					if not p18.ChatWindowMessageProperties then
						textChatMessageProperties.PrefixText = string.format("<font color=\"#%s\">%s</font>", var152:ToHex(), if getFFlagExpChatProtectedChatInternalAPIs() then p18.PrefixTextInternal else p18.PrefixText)
					end
				end
				return textChatMessageProperties
			end
		elseif string.find(p17.Name, "^RBXTeam") then
			function p17.OnIncomingMessage(p19) --[[ line: 724 ]]
				-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), var31 (copy), playersService (copy), expChatRemoveSpaceFromTeamPrefix (copy), enabled (write)
				local var153 = if getFFlagExpChatProtectedChatInternalAPIs() then p19.PrefixTextInternal else p19.PrefixText
				
				if getFFlagExpChatProtectedChatInternalAPIs() then
					var31:trace("Team OnIncomingMessage started: PrefixTextInternal: {} TextInternal: {}", var153, p19.TextInternal)
				else
					var31:trace("Team OnIncomingMessage started: {} {}", var153, p19.Text)
				end
				local textChatMessageProperties = Instance.new("TextChatMessageProperties")
				
				if playersService.LocalPlayer then
					textChatMessageProperties.PrefixText = string.format("<font color=\"#%s\">%s%s</font>", playersService.LocalPlayer.TeamColor.Color:ToHex(), if expChatRemoveSpaceFromTeamPrefix then if enabled then "" elseif #(var153 or "") > 0 then "[Team] " else "[Team]" elseif enabled then "" else "[Team] ", var153)
				end
				var31:trace("Team OnIncomingMessage finished: {} {}", textChatMessageProperties.PrefixText, textChatMessageProperties.Text)
				
				return textChatMessageProperties
			end
		elseif string.find(p17.Name, "^RBXWhisper") and localPlayer then
			function p17.OnIncomingMessage(p20) --[[ line: 761 ]]
				-- upvalues: getOtherDisplayNameInWhisperChannelModule (copy), p17 (ref), localPlayer (copy), enabled (write), p14 (copy), getNameColorModule (copy), getFFlagExpChatProtectedChatInternalAPIs (copy)
				local textSource = p20.TextSource
				
				if textSource then
					local var155 = getOtherDisplayNameInWhisperChannelModule(p17, localPlayer)
					
					if not var155 then
						return nil
					end
					local var156 = if not enabled then if textSource.UserId == localPlayer.UserId then p14.translator:FormatByKey("CoreScripts.TextChat.WhisperChat.PrefixText.Outgoing", { RBX_NAME = var155 }) else p14.translator:FormatByKey("CoreScripts.TextChat.WhisperChat.PrefixText.Incoming", { RBX_NAME = var155 }) else nil
					local textChatMessageProperties = Instance.new("TextChatMessageProperties")
					textChatMessageProperties.PrefixText = string.format("%s<font color=\"#%s\">%s</font>", if var156 then var156 .. " " else "", getNameColorModule(textSource.UserId):ToHex(), if getFFlagExpChatProtectedChatInternalAPIs() then p20.PrefixTextInternal else p20.PrefixText)
					
					return textChatMessageProperties
				end
			end
		end
		p17.MessageReceived:Connect(function(p21) --[[ line: 800 ]]
			-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), _processIncomingMessageCore (copy), getFFlagExpChatProtectedChatInternalAPIs (copy), var31 (copy), fFlagExpChatPerfTracking (copy), localPlayer (copy), expChatPerfTracker (copy), reportMessageReceivedModule (copy), handleChannelWelcomeMessageModule (copy), displaySystemMessageModule (copy), p14 (copy), fFlagExpChatUseMessagesStore (copy), var114 (copy), getTransparencyStoreModule (copy), fFlagExpChatUseChannelTabsStore (copy), var115 (copy), fFlagExpChatUnreadTabIndicatorV2WindowModule (copy), var113 (copy), markChannelUnreadForIncomingMessageModule (copy), incomingMessageReceivedModule (copy), shouldSendHighFrequencyTelemetryModule (copy), expChatMessageResponseUserSamplePermyriad (copy), analytics (copy), t (copy)
			if getFFlagTextChatEnableUniverseChatTabs() then
				_processIncomingMessageCore(p21, nil, nil)
				
				return
			elseif getFFlagExpChatProtectedChatInternalAPIs() then
				var31:debug("Incoming MessageReceived Status: {} TextInternal: {}", p21.Status.Name, p21.TextInternal)
			else
				var31:debug("Incoming MessageReceived Status: {} Text: {}", p21.Status.Name, p21.Text)
			end
			if fFlagExpChatPerfTracking and (if p21.TextSource then p21.TextSource.UserId else "UNKNOWN_TEXT_SOURCE_USER_ID") ~= (if localPlayer then localPlayer.UserId else "UNKNOWN_LOCAL_USER_ID") then
				expChatPerfTracker.start(expChatPerfTracker.Events.MessageReceiveToWindowRenderInterval, { messageId = p21.MessageId })
			end
			if localPlayer then
				reportMessageReceivedModule(localPlayer.UserId, p21)
			end
			if localPlayer and p21.TextSource and p21.TextSource.UserId ~= localPlayer.UserId then
				local var158 = handleChannelWelcomeMessageModule(p21, localPlayer)
				
				if var158 then
					displaySystemMessageModule(var158.key, var158.args, var158.metadata, p14.translator, p21.TextChannel)
				end
			end
			local var159 = localPlayer and (p21.TextSource and p21.TextSource.UserId == localPlayer.UserId)
			
			if fFlagExpChatUseMessagesStore then
				var114.handleIncomingOrOutgoingMessage(p21, var159)
				getTransparencyStoreModule(false).resetTextTransparency()
				
				if fFlagExpChatUseChannelTabsStore and var115 then
					var115.handleIncomingOrOutgoingMessage(p21, var159)
				elseif fFlagExpChatUnreadTabIndicatorV2WindowModule then
					var113:dispatch(markChannelUnreadForIncomingMessageModule(p21, var159))
				end
			else
				var113:dispatch(incomingMessageReceivedModule(p21, var159))
				getTransparencyStoreModule(false).resetTextTransparency()
			end
			if p21.Status == Enum.TextChatMessageStatus.Floodchecked then
				displaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.Floodchecked", nil, "Roblox.MessageStatus.Warning.Floodchecked", p14.translator, p14.defaultSystemTextChannel)
			elseif p21.Status == Enum.TextChatMessageStatus.TextFilterFailed then
				displaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.TextFilterFailed", nil, "Roblox.MessageStatus.Warning.TextFilterFailed", p14.translator, p14.defaultSystemTextChannel)
			elseif p21.Status == Enum.TextChatMessageStatus.InvalidPrivacySettings then
				displaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.InvalidPrivacySettings", nil, "Roblox.MessageStatus.Warning.InvalidPrivacySettings", p14.translator, p14.defaultSystemTextChannel)
			elseif p21.Status == Enum.TextChatMessageStatus.MessageTooLong then
				displaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.MessageTooLong", nil, "Roblox.MessageStatus.Warning.MessageTooLong", p14.translator, p14.defaultSystemTextChannel)
			elseif p21.Status == Enum.TextChatMessageStatus.ModerationTimeout then
				displaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.ModerationTimeout", nil, "Roblox.MessageStatus.Warning.ModerationTimeout", p14.translator, p14.defaultSystemTextChannel)
			elseif p21.Status == Enum.TextChatMessageStatus.Unknown then
				displaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.Unknown", nil, "Roblox.MessageStatus.Warning.Unknown", p14.translator, p14.defaultSystemTextChannel)
			end
			if shouldSendHighFrequencyTelemetryModule(expChatMessageResponseUserSamplePermyriad) then
				analytics:TelemetryLogEvent(t, { messageStatus = p21.Status.Name }, {
					"addOsInfo",
					"addSessionId",
					"addUniverseId",
					"addPlaceId"
				})
			end
		end)
	end
	
	local _ = function(p22) --[[ line: 930 | named "watchTextChatCommand" ]]
		-- upvalues: analytics (copy)
		p22.Triggered:Connect(function() --[[ line: 931 ]]
			-- upvalues: analytics (copy), p22 (ref)
			analytics.FireClientAnalyticsWithEventName("CommandSent", { commandName = p22.Name })
		end)
	end
	
	for i, v in pairs(textChatService:GetDescendants()) do
		if v:IsA("TextChannel") then
			handleMessageReceived(v)
		elseif v:IsA("TextChatCommand") then
			v.Triggered:Connect(function() --[[ line: 931 ]]
				-- upvalues: analytics (copy), v (ref)
				analytics.FireClientAnalyticsWithEventName("CommandSent", { commandName = v.Name })
			end)
		end
	end
	local var121 = false
	local var122 = false
	local t_3 = {}
	local var124 = false
	
	local _ = function() --[[ line: 951 | named "tryLogExposureNewSystemMessages" ]]
		-- upvalues: expChatNewSystemMessagesExperimentation (copy), var124 (write)
		if expChatNewSystemMessagesExperimentation.isExperimentEnabled and not var124 then
			var124 = true
			expChatNewSystemMessagesExperimentation.logExposure()
			
			return
		end
	end
	
	local function postProcessSummarySystemMessage(p23) --[[ line: 960 ]]
		-- upvalues: summaryMessageRichTextModule (copy)
		return summaryMessageRichTextModule.wrapInSummaryMutedStyle(`{summaryMessageRichTextModule.getSummaryIconPrefix()} {p23}`)
	end
	
	local function tryShowSummarySystemMessageOnChannel(p24) --[[ line: 966 ]]
		-- upvalues: var121 (write), t_3 (ref), expChatNewSystemMessagesExperimentation (copy), var124 (write), displaySystemMessageModule (copy), p14 (write), fFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule (copy), postProcessSummarySystemMessage (ref), summaryMessageRichTextModule (copy)
		if not p24 then return end
		if not var121 then return end
		if t_3[p24.Name] then return end
		if p24.Name ~= "RBXGeneral" then return end
		t_3[p24.Name] = true
		
		if expChatNewSystemMessagesExperimentation.isExperimentEnabled and expChatNewSystemMessagesExperimentation.isExperimentEnabled and not var124 then
			var124 = true
			expChatNewSystemMessagesExperimentation.logExposure()
		end
		displaySystemMessageModule(if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "CoreScripts.TextChat.Description.RobloxSummarizesMessagesFromAllPlayers" else "CoreScripts.TextChat.ChatWindow.SummarySystemMessage", nil, "Roblox.Summary.Info", p14.translator, p24, if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "Roblox summarizes messages from players of all ages." else "Roblox auto-generates summaries of players' messages.", if fFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule then postProcessSummarySystemMessage else function(p25) --[[ line: 1001 ]]
			-- upvalues: summaryMessageRichTextModule (copy)
			return summaryMessageRichTextModule.wrapInSummaryMutedStyle(`{summaryMessageRichTextModule.getSummaryIconPrefix()} {p25}`)
		end)
	end
	
	local function tryAddThirdPartySummaryGlobalSystemMessage() --[[ line: 1009 ]]
		-- upvalues: var122 (write), var121 (write), fFlagExpChatEnableGlobalChatSummarySystemMessageModule (copy), getFFlagTextChatEnableUniverseChatTabs (copy), textChatService (copy), p14 (write), expChatSuppressGlobalSummaryTabUnread (copy), fFlagExpChatUseMessagesStore (copy), var114 (ref), fFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule (copy), postProcessSummarySystemMessage (ref), var113 (ref), universeChatSystemMessageAddedModule (copy), fFlagFixGlobalChat3pSummarySystemMessageModule (copy)
		if var122 or not var121 or (not fFlagExpChatEnableGlobalChatSummarySystemMessageModule or not getFFlagTextChatEnableUniverseChatTabs()) or not textChatService:HasAllocatedUniverseChatContext("global") then return end
		local var160 = p14.translator:FormatByKey("CoreScripts.TextChat.ChatWindow.SummarySystemMessage")
		local var161 = if expChatSuppressGlobalSummaryTabUnread then "Roblox.Summary.GlobalChat" else nil
		var122 = true
		
		if fFlagExpChatUseMessagesStore and var114 then
			var114.addSystemMessage(var160, "RBXGlobal", var161, if fFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule then postProcessSummarySystemMessage else nil)
			
			return
		end
		var113:dispatch(universeChatSystemMessageAddedModule(var160, "RBXGlobal", var161, nil, if fFlagFixGlobalChat3pSummarySystemMessageModule and fFlagExpChatEnablePostProcessRichSystemMessageTextFormatModule then postProcessSummarySystemMessage else nil))
	end
	
	textChatService.DescendantAdded:Connect(function(p26) --[[ line: 1057 ]]
		-- upvalues: handleMessageReceived (ref), fFlagEnableInExpChatSummaryOnLuaModule (copy), fFlagEnableClientSummarySystemMessageOnLua (copy), tryShowSummarySystemMessageOnChannel (ref), analytics (copy)
		if p26:IsA("TextChannel") then
			handleMessageReceived(p26)
			
			if fFlagEnableInExpChatSummaryOnLuaModule and fFlagEnableClientSummarySystemMessageOnLua then
				tryShowSummarySystemMessageOnChannel(p26)
				
				return
			end
		elseif p26:IsA("TextChatCommand") then
			p26.Triggered:Connect(function() --[[ line: 931 ]]
				-- upvalues: analytics (copy), p26 (ref)
				analytics.FireClientAnalyticsWithEventName("CommandSent", { commandName = p26.Name })
			end)
		end
	end)
	textChatService.DescendantRemoving:Connect(function(p27) --[[ line: 1068 ]]
		-- upvalues: var113 (ref), textChannelRemoved (copy), fFlagExpChatUseChannelTabsStore (copy), var115 (ref)
		if p27:IsA("TextChannel") then
			var113:dispatch(textChannelRemoved(p27))
			
			if fFlagExpChatUseChannelTabsStore and var115 then
				var115.handleChannelRemoved(p27.Name)
			end
		end
	end)
	
	if fFlagEnableInExpChatSummaryOnLuaModule then
		textChatService.ChatActionReceived:Connect(function(p28) --[[ line: 1079 ]]
			-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), var31 (copy), textChatMessageChatActionTypeModule (copy), fFlagEnableGlobalChat3pSummaryLuaAppsModule (copy), _processIncomingMessageCore (ref)
			if getFFlagExpChatProtectedChatInternalAPIs() then
				var31:debug("Incoming ChatActionReceived ChatActionType: {}, TextInternal: {}", p28.ChatActionType, p28.TextInternal)
			else
				var31:debug("Incoming ChatActionReceived ChatActionType: {}, Text: {}", p28.ChatActionType, p28.Text)
			end
			if p28.ChatActionType ~= textChatMessageChatActionTypeModule.Summary then
				var31:error("Unknown ChatActionType: {}", p28.ChatActionType)
				
				return
			elseif fFlagEnableGlobalChat3pSummaryLuaAppsModule then
				local var162 = if p28.TextChannel == nil then { channelNameOverride = "RBXGlobal", isUniverseChat = true } else nil
				_processIncomingMessageCore(p28, var162 and var162.channelNameOverride, var162 and var162.isUniverseChat)
				
				return
			end
			_processIncomingMessageCore(p28, nil, nil)
		end)
	end
	if fFlagEnableInExpChatSummaryOnLuaModule or fFlagAIRephraseSettingEnabled or fFlagChatSummariesSettingEnabled then
		coroutine.wrap(function() --[[ line: 1114 ]]
			-- upvalues: robloxReplicatedStorageService (copy), var31 (copy), localPlayer (ref), fFlagEnableClientSummarySystemMessageOnLua (copy), fFlagChatSummariesSettingEnabled (copy), var121 (write), textChatService (copy), tryShowSummarySystemMessageOnChannel (ref), tryAddThirdPartySummaryGlobalSystemMessage (ref), fFlagAIRephraseSettingEnabled (copy), getUserChatSettingsStoreModule (copy)
			local expChatFeatureValueChanged = robloxReplicatedStorageService:WaitForChild("ExpChatFeatureValueChanged", 10)
			
			if expChatFeatureValueChanged then
				expChatFeatureValueChanged.OnClientEvent:Connect(function(p29, p30, p31) --[[ line: 1117 ]]
					-- upvalues: var31 (copy), localPlayer (copy), fFlagEnableClientSummarySystemMessageOnLua (copy), fFlagChatSummariesSettingEnabled (copy), var121 (copy), textChatService (copy), tryShowSummarySystemMessageOnChannel (copy), tryAddThirdPartySummaryGlobalSystemMessage (copy), fFlagAIRephraseSettingEnabled (copy), getUserChatSettingsStoreModule (copy)
					var31:debug("Incoming ExpChatFeatureValueChanged userId: {}, featureName: {}, featureValue: {}", p29, p30, p31)
					
					if localPlayer and p29 == localPlayer.UserId then
						if fFlagEnableClientSummarySystemMessageOnLua and p30 == "EligibleForThirdPartySummary" and not fFlagChatSummariesSettingEnabled then
							var121 = p31 == "true"
							
							if var121 then
								for i, v in textChatService:GetDescendants() do
									if v:IsA("TextChannel") then
										tryShowSummarySystemMessageOnChannel(v)
									end
								end
								tryAddThirdPartySummaryGlobalSystemMessage()
							end
						end
						if fFlagAIRephraseSettingEnabled and p30 == "AIRephraseSettingStatus" then
							getUserChatSettingsStoreModule.updateExpChatFeatureValue(p30, p31)
						end
						if fFlagChatSummariesSettingEnabled and p30 == "AllowThirdPartySummary" then
							getUserChatSettingsStoreModule.updateExpChatFeatureValue(p30, p31)
							var121 = p31 == "Enabled"
							
							if var121 then
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
	textChatService.SendingMessage:Connect(function(p32) --[[ line: 1162 ]]
		-- upvalues: fFlagExpChatPerfTracking (copy), expChatPerfTracker (copy), getFFlagExpChatProtectedChatInternalAPIs (copy), var31 (copy), localPlayer (ref), handleChannelWelcomeMessageModule (copy), displaySystemMessageModule (copy), p14 (write), fFlagExpChatUseMessagesStore (copy), var114 (ref), var113 (ref), outgoingMessageSentModule (copy), analytics (copy), countParticipantsInTextChannel (copy)
		if fFlagExpChatPerfTracking then
			expChatPerfTracker.start(expChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = p32.MessageId })
		end
		if getFFlagExpChatProtectedChatInternalAPIs() then
			var31:debug("Outgoing SendingMessage Status: {} TextInternal: {}", p32.Status.Name, p32.TextInternal)
		else
			var31:debug("Outgoing SendingMessage Status: {} Text: {}", p32.Status.Name, p32.Text)
		end
		if localPlayer then
			local var164 = handleChannelWelcomeMessageModule(p32, localPlayer)
			
			if var164 and var164.key then
				displaySystemMessageModule(var164.key, var164.args, var164.metadata, p14.translator, p32.TextChannel)
			end
		end
		if fFlagExpChatUseMessagesStore then
			var114.handleIncomingOrOutgoingMessage(p32, true)
		else
			var113:dispatch(outgoingMessageSentModule(p32))
		end
		local textChannel = p32.TextChannel
		
		if textChannel then
			analytics.FireClientAnalyticsWithEventName("MessageSent", {
				channelName = textChannel.Name,
				totalParticipants = countParticipantsInTextChannel(textChannel)
			})
		end
	end)
	
	local _ = function() --[[ line: 1210 | named "connectSendingUniverseChatMessage" ]]
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), textChatService (copy), fFlagExpChatPerfTracking (copy), expChatPerfTracker (copy), getFFlagExpChatProtectedChatInternalAPIs (copy), var31 (copy), localPlayer (ref), handleChannelWelcomeMessageModule (copy), displaySystemMessageModule (copy), p14 (write), fFlagExpChatUseMessagesStore (copy), var114 (ref), var113 (ref), outgoingMessageSentModule (copy), fFlagExpChatUseChannelTabsStore (copy), var115 (ref), analytics (copy), countParticipantsInTextChannel (copy)
		if getFFlagTextChatEnableUniverseChatTabs() then
			textChatService.SendingUniverseChatMessage:Connect(function(p33) --[[ line: 1214 ]]
				-- upvalues: fFlagExpChatPerfTracking (copy), expChatPerfTracker (copy), getFFlagExpChatProtectedChatInternalAPIs (copy), var31 (copy), localPlayer (copy), handleChannelWelcomeMessageModule (copy), displaySystemMessageModule (copy), p14 (copy), textChatService (copy), fFlagExpChatUseMessagesStore (copy), var114 (copy), var113 (copy), outgoingMessageSentModule (copy), fFlagExpChatUseChannelTabsStore (copy), var115 (copy), analytics (copy), countParticipantsInTextChannel (copy)
				if fFlagExpChatPerfTracking then
					expChatPerfTracker.start(expChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = p33.MessageId })
				end
				if getFFlagExpChatProtectedChatInternalAPIs() then
					var31:debug("Outgoing SendingMessage Status: {} TextInternal: {}", p33.Status.Name, p33.TextInternal)
				else
					var31:debug("Outgoing SendingMessage Status: {} Text: {}", p33.Status.Name, p33.Text)
				end
				if localPlayer then
					local var165 = handleChannelWelcomeMessageModule(p33, localPlayer)
					
					if var165 and var165.key then
						displaySystemMessageModule(var165.key, var165.args, var165.metadata, p14.translator, p33.TextChannel)
					end
				end
				local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
				local var167 = if not (chatInputBarConfiguration and chatInputBarConfiguration.TargetTextChannel) then "RBXGlobal" else nil
				
				if fFlagExpChatUseMessagesStore then
					var114.handleIncomingOrOutgoingMessage(p33, true, var167)
				else
					var113:dispatch(outgoingMessageSentModule(p33, var167))
				end
				if fFlagExpChatUseChannelTabsStore and var115 then
					var115.handleIncomingOrOutgoingMessage(p33, true, var167)
				end
				local textChannel = p33.TextChannel
				
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
		textChatService.SendingUniverseChatMessage:Connect(function(p34) --[[ line: 1214 ]]
			-- upvalues: fFlagExpChatPerfTracking (copy), expChatPerfTracker (copy), getFFlagExpChatProtectedChatInternalAPIs (copy), var31 (copy), localPlayer (ref), handleChannelWelcomeMessageModule (copy), displaySystemMessageModule (copy), p14 (write), textChatService (copy), fFlagExpChatUseMessagesStore (copy), var114 (ref), var113 (ref), outgoingMessageSentModule (copy), fFlagExpChatUseChannelTabsStore (copy), var115 (ref), analytics (copy), countParticipantsInTextChannel (copy)
			if fFlagExpChatPerfTracking then
				expChatPerfTracker.start(expChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = p34.MessageId })
			end
			if getFFlagExpChatProtectedChatInternalAPIs() then
				var31:debug("Outgoing SendingMessage Status: {} TextInternal: {}", p34.Status.Name, p34.TextInternal)
			else
				var31:debug("Outgoing SendingMessage Status: {} Text: {}", p34.Status.Name, p34.Text)
			end
			if localPlayer then
				local var165 = handleChannelWelcomeMessageModule(p34, localPlayer)
				
				if var165 and var165.key then
					displaySystemMessageModule(var165.key, var165.args, var165.metadata, p14.translator, p34.TextChannel)
				end
			end
			local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			local var167 = if not (chatInputBarConfiguration and chatInputBarConfiguration.TargetTextChannel) then "RBXGlobal" else nil
			
			if fFlagExpChatUseMessagesStore then
				var114.handleIncomingOrOutgoingMessage(p34, true, var167)
			else
				var113:dispatch(outgoingMessageSentModule(p34, var167))
			end
			if fFlagExpChatUseChannelTabsStore and var115 then
				var115.handleIncomingOrOutgoingMessage(p34, true, var167)
			end
			local textChannel = p34.TextChannel
			
			if textChannel then
				analytics.FireClientAnalyticsWithEventName("MessageSent", {
					channelName = textChannel.Name,
					totalParticipants = countParticipantsInTextChannel(textChannel)
				})
			end
		end)
	end
	local _ = function(p35) --[[ line: 1272 | named "isInstanceALocalTextChannelParticipant" ]]
		-- upvalues: playersService (copy)
		return p35 and (p35:IsA("TextSource") and (playersService.LocalPlayer and playersService.LocalPlayer.UserId == p35.UserId))
	end
	
	local _ = function(p36) --[[ line: 1279 | named "getChannelTabIndex" ]]
		return if p36 == "RBXGeneral" then 1 elseif p36 == "RBXGlobal" then 2 else 3
	end
	
	if getFFlagExpChatEnableChannelTabsUIModule() then
		local channelTabsConfiguration = textChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
		local var129 = getFFlagTextChatEnableUniverseChatTabs() and not (if channelTabsConfiguration then channelTabsConfiguration.Enabled else false)
		
		for i_1, v_1 in pairs(textChatService:GetDescendants()) do
			if v_1.Parent and v_1.Parent:IsA("TextChannel") and (v_1 and (v_1:IsA("TextSource") and (playersService.LocalPlayer and playersService.LocalPlayer.UserId == v_1.UserId))) then
				var113:dispatch(localTextChannelParticipantAddedModule(v_1.Parent))
				
				if fFlagExpChatUseChannelTabsStore and var115 then
					local name = v_1.Parent.Name
					
					if name ~= "RBXSystem" and (not var129 or name == "RBXGeneral") then
						var115.addChannelTab({ type = "TextChat", name = name }, if getFFlagTextChatEnableUniverseChatTabs() then if name == "RBXGeneral" then 1 elseif name == "RBXGlobal" then 2 else 3 elseif name == "RBXGeneral" then 1 else 2)
					end
				end
			end
			if v_1:IsA("TextChannel") then
				v_1.DescendantRemoving:Connect(function(p37) --[[ line: 1319 ]]
					-- upvalues: playersService (copy), var113 (ref), localTextChannelParticipantRemoved (copy), v_1 (ref), fFlagExpChatUseChannelTabsStore (copy), var115 (ref)
					if p37 and (p37:IsA("TextSource") and (playersService.LocalPlayer and playersService.LocalPlayer.UserId == p37.UserId)) then
						var113:dispatch(localTextChannelParticipantRemoved(v_1))
						
						if fFlagExpChatUseChannelTabsStore and var115 then
							var115.removeChannelTab(v_1.Name)
						end
					end
				end)
			end
		end
		textChatService.DescendantAdded:Connect(function(p38) --[[ line: 1333 ]]
			-- upvalues: playersService (copy), var113 (ref), localTextChannelParticipantAddedModule (copy), fFlagExpChatUseChannelTabsStore (copy), var115 (ref), var129 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), localTextChannelParticipantRemoved (copy)
			if p38.Parent and p38.Parent:IsA("TextChannel") and (p38 and (p38:IsA("TextSource") and (playersService.LocalPlayer and playersService.LocalPlayer.UserId == p38.UserId))) then
				var113:dispatch(localTextChannelParticipantAddedModule(p38.Parent))
				
				if fFlagExpChatUseChannelTabsStore and var115 then
					local name = p38.Parent.Name
					
					if name ~= "RBXSystem" and (not var129 or name == "RBXGeneral") then
						var115.addChannelTab({ type = "TextChat", name = name }, if getFFlagTextChatEnableUniverseChatTabs() then if name == "RBXGeneral" then 1 elseif name == "RBXGlobal" then 2 else 3 elseif name == "RBXGeneral" then 1 else 2)
					end
				end
			end
			if p38:IsA("TextChannel") then
				p38.DescendantRemoving:Connect(function(p39) --[[ line: 1358 ]]
					-- upvalues: playersService (copy), var113 (copy), localTextChannelParticipantRemoved (copy), p38 (ref), fFlagExpChatUseChannelTabsStore (copy), var115 (copy)
					if p39 and (p39:IsA("TextSource") and (playersService.LocalPlayer and playersService.LocalPlayer.UserId == p39.UserId)) then
						var113:dispatch(localTextChannelParticipantRemoved(p38))
						
						if fFlagExpChatUseChannelTabsStore and var115 then
							var115.removeChannelTab(p38.Name)
						end
					end
				end)
			end
		end)
	end
	if getFFlagTextChatEnableUniverseChatTabs() then
		local t_4 = {}
		
		local function handleUniverseChatChannelAllocated(p40) --[[ line: 1377 ]]
			-- upvalues: t_4 (ref), textChatService (copy), fFlagExpChatUseUnifiedTooltipStore (copy), getChatTooltipStoreModule (copy), var113 (ref), universeChatChannelAddedModule (copy), fFlagExpChatUseChannelTabsStore (copy), var115 (ref), getFFlagEnableExpChatUniverseChatTabNames (copy), p14 (write), fFlagExpChatUseMessagesStore (copy), var114 (ref), getFFlagExpChatSuppressWelcomeMessageTabUnread (copy), fFlagExpChatUnreadTabIndicatorV2WindowModule (copy), markChannelUnreadForSystemMessageModule (copy), universeChatSystemMessageAddedModule (copy), tryAddThirdPartySummaryGlobalSystemMessage (ref)
			if t_4[p40] then return end
			t_4[p40] = true
			local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
			local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
			
			if chatWindowConfiguration and chatWindowConfiguration.Enabled == false or not (not chatInputBarConfiguration or chatInputBarConfiguration.Enabled ~= false) then return end
			local var170 = ""
			
			if p40 == "global" then
				var170 = "RBXGlobal"
				
				if fFlagExpChatUseUnifiedTooltipStore then
					getChatTooltipStoreModule(false).setIsGlobalChatAvailable(true)
				end
			end
			local var171 = var170
			var113:dispatch(universeChatChannelAddedModule(var170, if var171 == "RBXGeneral" then 1 elseif var171 == "RBXGlobal" then 2 else 3))
			
			if fFlagExpChatUseChannelTabsStore and var115 then
				local var172 = var170
				var115.addChannelTab({ type = "UniverseChat", name = var170 }, if var172 == "RBXGeneral" then 1 elseif var172 == "RBXGlobal" then 2 else 3)
			end
			if getFFlagEnableExpChatUniverseChatTabNames() and var170 ~= "" then
				local ok, status = pcall(function() --[[ line: 1410 ]]
					-- upvalues: p14 (copy)
					return p14.translator:FormatByKey("CoreScripts.TextChat.ChatWindow.ChatEnabled.Global2")
				end)
				
				if ok and status and status ~= "" then
					if fFlagExpChatUseMessagesStore and var114 then
						if getFFlagExpChatSuppressWelcomeMessageTabUnread() then
							var114.addSystemMessage(status, var170, "Roblox.Welcome.GlobalChat")
						else
							var114.addSystemMessage(status, var170)
						end
						if fFlagExpChatUseChannelTabsStore and var115 and not getFFlagExpChatSuppressWelcomeMessageTabUnread() then
							var115.markChannelUnread(var170)
						elseif fFlagExpChatUnreadTabIndicatorV2WindowModule then
							var113:dispatch(markChannelUnreadForSystemMessageModule(status, var170, if getFFlagExpChatSuppressWelcomeMessageTabUnread() then "Roblox.Welcome.GlobalChat" else nil))
						end
					elseif getFFlagExpChatSuppressWelcomeMessageTabUnread() then
						var113:dispatch(universeChatSystemMessageAddedModule(status, var170, "Roblox.Welcome.GlobalChat"))
					else
						var113:dispatch(universeChatSystemMessageAddedModule(status, var170))
					end
				end
			end
			tryAddThirdPartySummaryGlobalSystemMessage()
		end
		
		if textChatService:HasAllocatedUniverseChatContext("global") then
			handleUniverseChatChannelAllocated("global")
		end
		textChatService.UniverseChatChannelAllocated:Connect(handleUniverseChatChannelAllocated)
		textChatService.UniverseChatMessageReceived:Connect(function(p41) --[[ line: 1474 ]]
			-- upvalues: shouldFilterGlobalMessageModule (copy), getGlobalMutedUsersStoreModule (copy), localPlayer (ref), fFlagChatLineReportingGlobalMuteEnabled (copy), _processIncomingMessageCore (ref)
			if shouldFilterGlobalMessageModule(p41, getGlobalMutedUsersStoreModule(false), localPlayer and localPlayer.UserId) then return end
			if fFlagChatLineReportingGlobalMuteEnabled then
				local t = { channelNameOverride = "RBXGlobal", isUniverseChat = true }
				_processIncomingMessageCore(p41, t and t.channelNameOverride, t and t.isUniverseChat)
				
				return
			end
			_processIncomingMessageCore(p41, "RBXGlobal", nil)
		end)
	end
	local function runOnBubbleDisplayed(p42, p43, p44) --[[ line: 1496 ]]
		-- upvalues: playersService (copy), httpService (copy), getFFlagExpChatProtectedChatInternalAPIs (copy), fFlagExpChatUseMessagesStore (copy), var114 (ref), var113 (ref), incomingBubbleChatMessageReceivedModule (copy)
		local var174 = if p42:IsA("Model") then playersService:GetPlayerFromCharacter(p42) else nil
		local var175 = httpService:GenerateGUID(false)
		local bubbleChatMessageProperties = nil
		local var176 = nil
		
		if p44 then
			var175 = p44.MessageId
			bubbleChatMessageProperties = p44.BubbleChatMessageProperties
			var176 = if getFFlagExpChatProtectedChatInternalAPIs() then p44.TranslationInternal else p44.Translation
		end
		local t = {
			message = p43,
			translation = var176,
			bubbleChatMessageId = var175,
			bubbleChatMessageUserId = var174 and tostring(var174.UserId) or nil,
			partOrModel = p42,
			timestamp = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000),
			bubbleChatMessageProperties = bubbleChatMessageProperties
		}
		
		if fFlagExpChatUseMessagesStore then
			var114.handleIncomingBubbleChatMessage(t)
			
			return
		end
		var113:dispatch(incomingBubbleChatMessageReceivedModule(t))
	end
	
	chatService.Chatted:Connect(function(p45, p46) --[[ line: 1531 ]]
		-- upvalues: textChatService (copy), chatService (copy), runOnBubbleDisplayed (ref)
		if textChatService.ChatVersion ~= Enum.ChatVersion.LegacyChatService or chatService.BubbleChatEnabled then
			runOnBubbleDisplayed(p45, p46)
		end
	end)
	chatService:GetPropertyChangedSignal("BubbleChatEnabled"):Connect(function() --[[ line: 1538 ]]
		-- upvalues: chatService (copy), var113 (ref), legacyBubbleChatEnabledChangedModule (copy)
		var113:dispatch(legacyBubbleChatEnabledChangedModule("Enabled", chatService.BubbleChatEnabled))
	end)
	var113:dispatch(legacyBubbleChatEnabledChangedModule("Enabled", chatService.BubbleChatEnabled))
	chatService.BubbleChatSettingsChanged:Connect(function(p47) --[[ line: 1547 ]]
		-- upvalues: p14 (write), fFlagExpChatUseMessagesStore (copy), var116 (ref), var113 (ref), legacyBubbleChatSettingsChangedModule (copy)
		if p14.validateLegacyBubbleChatSettings then
			local var178, var179 = p14.validateLegacyBubbleChatSettings(p47)
			assert(var178, "Bad settings object passed to Chat:SetBubbleChatSettings:\n inside consolidated BubbleChat " .. (var179 or ""))
			
			if fFlagExpChatUseMessagesStore and var116 then
				var116.setBubbleChatSettings(p47)
				
				return
			end
			var113:dispatch(legacyBubbleChatSettingsChangedModule(p47))
		end
	end)
	
	if getEngineFeatureFlagEnableDisplayBubbleModule() then
		textChatService.BubbleDisplayed:Connect(function(p48, p49) --[[ line: 1565 ]]
			-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), runOnBubbleDisplayed (ref)
			runOnBubbleDisplayed(p48, p49 and (if getFFlagExpChatProtectedChatInternalAPIs() then p49.TextInternal else p49.Text), p49)
		end)
	end
	local function var129(p50) --[[ line: 1576 | named "findCommandInstance" ]]
		-- upvalues: textChatService (copy)
		for i, v in ipairs(textChatService:GetDescendants()) do
			if v.Name == p50 and v:IsA("TextChatCommand") then
				return v
			end
		end
		return nil
	end
	
	local t_4 = {}
	
	local function setupTextChatCommands() --[[ line: 1587 ]]
		-- upvalues: commands (copy), var129 (ref), t_4 (ref), fFlagExpChatUseMessagesStore (copy), var113 (ref), context (copy), displaySystemMessageModule (copy), p14 (write), commandAliasChanged (copy)
		for i, v in ipairs(commands.enabledCommands) do
			if v.clientRun then
				local var180 = var129(v.name)
				
				if var180 and not t_4[var180] then
					t_4[var180] = true
					var180.Triggered:Connect(function(p51, ...) --[[ line: 1598 ]]
						-- upvalues: fFlagExpChatUseMessagesStore (copy), v (ref), var113 (copy), context (copy), displaySystemMessageModule (copy), p14 (copy)
						local var181 = if fFlagExpChatUseMessagesStore then v.clientRun(var113, p51.UserId, ..., context) else v.clientRun(var113, p51.UserId, ...)
						
						if var181 then
							displaySystemMessageModule(var181.key, var181.args, var181.metadata, p14.translator, p14.defaultSystemTextChannel)
						end
					end)
					
					if string.find(var180.Name, "RBXTeamCommand") or string.find(var180.Name, "RBXWhisperCommand") then
						for i_1, v_1 in { "PrimaryAlias", "SecondaryAlias" } do
							var180:GetPropertyChangedSignal(v_1):Connect(function() --[[ line: 1621 ]]
								-- upvalues: var113 (copy), commandAliasChanged (copy), var180 (ref)
								var113:dispatch(commandAliasChanged(var180.Name, var180.PrimaryAlias, var180.SecondaryAlias))
							end)
						end
					end
				end
			end
		end
	end
	
	setupTextChatCommands()
	chatService:GetPropertyChangedSignal("IsAutoMigrated"):Once(setupTextChatCommands)
	
	if p14.canUserChatAsync and playersService.LocalPlayer then
		promiseModule.try(function() --[[ line: 1641 ]]
			-- upvalues: p14 (write), playersService (copy)
			return p14.canUserChatAsync(playersService.LocalPlayer.UserId)
		end):andThen(function(p52) --[[ line: 1644 ]]
			-- upvalues: fFlagExpChatUseMessagesStore (copy), var114 (ref), var113 (ref), chatPrivacySettingsReceivedModule (copy)
			if fFlagExpChatUseMessagesStore then
				var114.setCanLocalUserChat(p52)
				
				return
			end
			var113:dispatch(chatPrivacySettingsReceivedModule(p52))
		end):catch(function() --[[ line: 1651 ]]
			-- upvalues: fFlagExpChatUseMessagesStore (copy), var114 (ref), var113 (ref), chatPrivacySettingsFetchFailedModule (copy)
			if fFlagExpChatUseMessagesStore then
				var114.setCanLocalUserChat(false)
				
				return
			end
			var113:dispatch(chatPrivacySettingsFetchFailedModule())
		end)
	end
	watchPlayersService(p14, var113, var114)
	local constants = UIBloxModule.App.Style.Constants
	local var135 = roactModule.createElement(UIBloxModule.App.Style.AppStyleProvider, {
		style = ({
			Dark = {
				themeName = constants.ThemeName.Dark,
				fontName = constants.FontName.Gotham
			}
		}).Dark
	}, {
		app = roactModule.createElement(appModule, {
			isChatWindowVisible = true,
			isChatInputBarVisible = true,
			isChannelBarVisible = false,
			isDefaultChatEnabled = true,
			store = var113,
			translator = p14.translator,
			gameTranslator = if getFFlagExpChatEnableChannelTabsUIModule() then p14.gameTranslator else nil,
			getIconVoiceIndicator = p14.getIconVoiceIndicator,
			onClickedVoiceIndicator = p14.onClickedVoiceIndicator,
			onClickedCameraIndicator = p14.onClickedCameraIndicator,
			selfViewListenerChanged = p14.selfViewListenerChanged,
			getPermissions = p14.getPermissions,
			displayCameraDeniedToast = p14.displayCameraDeniedToast,
			isCamEnabledForUserAndPlace = p14.isCamEnabledForUserAndPlace,
			isCameraOnlyUser = p14.isCameraOnlyUser,
			isVoiceServiceInitialized = p14.isVoiceServiceInitialized,
			isSpatialUIEnabled = p14.isSpatialUIEnabled,
			expChatLoadStartTime = if getFFlagExpChatTelemetryEventTriggerModule() then os.clock() else nil
		})
	})
	var113:dispatch(clientAppLoaded({
		team = playersService.LocalPlayer and playersService.LocalPlayer.Team,
		isChatCoreGuiEnabled = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Chat),
		isTouchEnabled = userInputService.TouchEnabled,
		isGamepadEnabled = userInputService.PreferredInput == Enum.PreferredInput.Gamepad
	}))
	reportVersionLoadedModule(analytics, version[1])
	var31:trace("Roact.mount to {}", tostring(p14.parent))
	local experienceChat = roactModule.mount(var135, p14.parent, "ExperienceChat")
	local var137 = chatEnabledSystemMessageModule({
		translator = p14.translator,
		defaultSystemTextChannel = p14.defaultSystemTextChannel,
		localPlayer = localPlayer
	})
	
	local function updateChatStatus(p53) --[[ line: 1716 ]]
		-- upvalues: var117 (ref), isChatRegionLockedModule (copy), displaySystemMessageModule (copy), p14 (write), expChatNewSystemMessagesExperimentation (copy), var124 (write), canPlatformEnableChatModule (copy), fFlagExpChatRefactorEnabledMessageLogicModule (copy), fStringExpChatChatWithTFAmpFeatureNameModule (copy), fStringExpChatChatWithTFAmpNameSpaceModule (copy), var31 (copy), ampApiProvider (copy), localPlayer (ref), accessResponseEnum (copy), canOnlyChatInRegionModule (copy), var137 (ref)
		var117.setChatStatus(p53)
		
		if p53 == "GeoBlocked" or p53 ~= "Unknown" and isChatRegionLockedModule() then
			displaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionUnavailable", nil, "Roblox.ChatDisabled.Info", p14.translator, p14.defaultSystemTextChannel, "You can only view system messages here. Chat is not available in your region.")
			
			return
		elseif p53 == "AgeCheckGateExperiment" then
			displaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatDisabled.CheckAgeInAccountInfo", nil, "Roblox.ChatDisabled.Info", p14.translator, p14.defaultSystemTextChannel, "You can only view system messages here. Unlock chat with an age check at Settings > Account info.")
			
			return
		elseif p53 == "SettingsDisabled" then
			if expChatNewSystemMessagesExperimentation.isExperimentEnabled and expChatNewSystemMessagesExperimentation.isExperimentEnabled and not var124 then
				var124 = true
				expChatNewSystemMessagesExperimentation.logExposure()
			end
			displaySystemMessageModule(if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "CoreScripts.TextChat.Description.TurnOnChatInSettings" else "CoreScripts.TextChat.ChatWindow.ChatDisabled.SettingOff", nil, "Roblox.ChatDisabled.Info", p14.translator, p14.defaultSystemTextChannel, if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "Chat with people of similar age groups and trusted friends." else "You can only view system messages here. Update your Communication settings to turn on chat.")
			
			return
		elseif p53 == "SettingsDisabledVpc" then
			if expChatNewSystemMessagesExperimentation.isExperimentEnabled and expChatNewSystemMessagesExperimentation.isExperimentEnabled and not var124 then
				var124 = true
				expChatNewSystemMessagesExperimentation.logExposure()
			end
			displaySystemMessageModule(if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "CoreScripts.TextChat.Description.AskYourParentForPermissionToChat" else "CoreScripts.TextChat.ChatWindow.ChatDisabled.AskForPermission", nil, "Roblox.ChatDisabled.Info", p14.translator, p14.defaultSystemTextChannel, if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "Ask your parent for permission to chat in Privacy>Communication settings." else "You can only view system messages here. Ask your parent for permission to chat in Communication settings.")
			
			return
		elseif p53 == "AgeCheckVpc" then
			if expChatNewSystemMessagesExperimentation.isExperimentEnabled and expChatNewSystemMessagesExperimentation.isExperimentEnabled and not var124 then
				var124 = true
				expChatNewSystemMessagesExperimentation.logExposure()
			end
			displaySystemMessageModule(if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "CoreScripts.TextChat.Description.AskYourParentForPermissionToChat" else "CoreScripts.TextChat.ChatWindow.ChatDisabled.AskForPermissionToAgeCheck", nil, "Roblox.ChatDisabled.Info", p14.translator, p14.defaultSystemTextChannel, if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "Ask your parent for permission to chat in Privacy>Communication settings." else "You can only view system messages here. Ask your parent for permission to age check in Communication settings.")
			
			return
		elseif (canPlatformEnableChatModule() or p53 ~= "AgeVerificationRequired") and p53 ~= "IdVerificationRequired" then
			if p53 == "AgeVerificationRequired" then
				if expChatNewSystemMessagesExperimentation.isExperimentEnabled and expChatNewSystemMessagesExperimentation.isExperimentEnabled and not var124 then
					var124 = true
					expChatNewSystemMessagesExperimentation.logExposure()
				end
				displaySystemMessageModule(if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "CoreScripts.TextChat.Description.UnlockChatWithAnAgeCheck" else "CoreScripts.TextChat.ChatWindow.ChatDisabled.GetAnAgeCheck", nil, "Roblox.ChatDisabled.Info", p14.translator, p14.defaultSystemTextChannel, if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "Unlock chat with an age check." else "You can only view system messages here. Get an age check to chat.")
				
				return
			elseif fFlagExpChatRefactorEnabledMessageLogicModule and p53 == "Enabled" then
				coroutine.wrap(function() --[[ line: 1836 ]]
					-- upvalues: fStringExpChatChatWithTFAmpFeatureNameModule (copy), fStringExpChatChatWithTFAmpNameSpaceModule (copy), var31 (copy), ampApiProvider (copy), localPlayer (copy), accessResponseEnum (copy), displaySystemMessageModule (copy), p14 (copy), canOnlyChatInRegionModule (copy), var137 (copy)
					if fStringExpChatChatWithTFAmpFeatureNameModule == "" or fStringExpChatChatWithTFAmpNameSpaceModule == "" then
						var31:error("AMP feature name or namespace are not set")
						
						return
					end
					local featureAccess = ampApiProvider.getFeatureAccess({ fStringExpChatChatWithTFAmpFeatureNameModule }, fStringExpChatChatWithTFAmpNameSpaceModule)
					
					if localPlayer.ChatAvailabilityStatus ~= "Enabled" then return end
					local var183 = if featureAccess.featureAccessList and #featureAccess.featureAccessList > 0 and featureAccess.featureAccessList[1] then featureAccess.featureAccessList[1].access == accessResponseEnum.Granted else nil
					
					if var183 == nil then
						var31:error("No feature access list found after AMP call")
						
						return
					elseif var183 then
						displaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithTF", nil, "Roblox.ChatEnabled.Info", p14.translator, p14.defaultSystemTextChannel, "Only your trusted friends can chat with you.")
						
						return
					elseif canOnlyChatInRegionModule() then
						displaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatInRegion", nil, "Roblox.ChatEnabled.Info", p14.translator, p14.defaultSystemTextChannel, "You can view system messages and chat with users in your region only.")
						
						return
					end
					var137()
				end)()
				
				return
			elseif p53 == "EnabledBubble" or p53 == "Enabled" and canOnlyChatInRegionModule() then
				displaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatInRegion", nil, "Roblox.ChatEnabled.Info", p14.translator, p14.defaultSystemTextChannel, "You can view system messages and chat with users in your region only.")
				
				return
			elseif p53 == "Enabled" then
				var137()
				
				return
			elseif p53 == "AllUsers" or p53 == "NoOne" then
				if getChatTranslationEnabled() then
					displaySystemMessageModule("CoreScripts.TextChat.ChatTranslation.ChatWindow.SystemMessageNew", nil, "Roblox.ChatTranslation.ChatWindow.SystemMessage", p14.translator, p14.defaultSystemTextChannel, "Roblox automatically translates supported languages in chat")
					
					return
				end
			elseif p53 == "Ineligible" or p53 ~= "Unknown" then
				displaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatDisabled.OnlyViewSystemMessages", nil, "Roblox.ChatDisabled.Info", p14.translator, p14.defaultSystemTextChannel, "You can only view system messages here.")
			end
			return
		elseif expChatNewSystemMessagesExperimentation.isExperimentEnabled and expChatNewSystemMessagesExperimentation.isExperimentEnabled and not var124 then
			var124 = true
			expChatNewSystemMessagesExperimentation.logExposure()
		end
		displaySystemMessageModule(if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "CoreScripts.TextChat.Description.UnlockChatPrivacyCommunications" else "CoreScripts.TextChat.ChatWindow.ChatDisabled.CheckAgeInSettings", nil, "Roblox.ChatDisabled.Info", p14.translator, p14.defaultSystemTextChannel, if expChatNewSystemMessagesExperimentation.getNewSystemMessagesEnabled() then "Unlock chat with an age check in Privacy>Communication settings." else "You can only view system messages here. To chat, get an age check in your Communication settings.")
	end
	
	local var139 = 0
	local randomValue = math.random(expChatHiddenMessagesPromptThresholdLowerBound, expChatHiddenMessagesPromptThresholdUpperBound)
	
	local function handleUserMessageIntentSent(p54) --[[ line: 1938 ]]
		-- upvalues: var31 (copy), fFlagExpChatUseMessagesStore (copy), var114 (ref), var113 (ref), hiddenMessageReceivedModule (copy), isUserChatEnabledModule (copy), localPlayer (ref), var139 (write), randomValue (write), expChatHiddenMessagesPromptThresholdLowerBound (copy), expChatHiddenMessagesPromptThresholdUpperBound (copy), displaySystemMessageModule (copy), p14 (write), getTransparencyStoreModule (copy)
		var31:debug("Handling a message from UserMessageIntentSent")
		
		if fFlagExpChatUseMessagesStore then
			var114.handleHiddenMessageReceived(p54)
		else
			var113:dispatch(hiddenMessageReceivedModule(p54))
		end
		if not isUserChatEnabledModule(localPlayer.ChatAvailabilityStatus) then
			var139 += 1
			
			if var139 == randomValue then
				randomValue += math.random(expChatHiddenMessagesPromptThresholdLowerBound, expChatHiddenMessagesPromptThresholdUpperBound)
				displaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatDisabled.DontMissMessages", nil, "Roblox.ChatDisabled.Info", p14.translator, p14.defaultSystemTextChannel, "Don\226\128\153t miss messages. Unlock chat with an age check.")
			end
		end
		getTransparencyStoreModule(false).resetTextTransparency()
	end
	
	local _ = function() --[[ line: 1969 | named "shouldConnectToUserMessageIntentSent" ]]
		-- upvalues: fFlagExpChatEnableFOMOUpsellModule (copy), shouldShowFOMOUpsellModule (copy), fFlagExpChatEnableCrossAgeChatActivityModule (copy), shouldShowCrossAgeChatActivityModule (copy)
		return fFlagExpChatEnableFOMOUpsellModule and shouldShowFOMOUpsellModule() or fFlagExpChatEnableCrossAgeChatActivityModule and shouldShowCrossAgeChatActivityModule()
	end
	
	if fFlagAEGIS2EnableGatesForExpChatModule and localPlayer then
		if fFlagEnableModerateChatRemoteEvent then
			local var142 = getExperienceChatVisualConfigModule()
			local var143 = getChatModerationStoreModule(false)
			local var144 = false
			p14.moderateChatStoreDisposeEffect = signalsModule.createEffect(function(p55) --[[ line: 1983 ]]
				-- upvalues: var143 (ref), var144 (write), displaySystemMessageModule (copy), p14 (write), notificationModalsManagerModule (copy), UIBloxModule (copy), var142 (ref), fFlagConnectionsToFriendsRename (copy)
				local isSettingEnabled = var143.getIsSettingEnabled(p55)
				
				if isSettingEnabled ~= var144 then
					if isSettingEnabled then
						displaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.ModerateChatOn", nil, "Roblox.MessageStatus.Warning.ModerateChatOn", p14.translator, p14.defaultSystemTextChannel)
						notificationModalsManagerModule.SetUIBloxToast({
							iconImage = UIBloxModule.App.ImageSet.Images[var142.icon.off],
							toastSubtitle = p14.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOn.Subtitle"),
							toastTitle = p14.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOn.Title")
						})
					else
						displaySystemMessageModule("CoreScripts.TextChat.MessageStatus.Warning.ModerateChatOff", nil, "Roblox.MessageStatus.Warning.ModerateChatOff", p14.translator, p14.defaultSystemTextChannel)
						notificationModalsManagerModule.SetUIBloxToast({
							iconImage = UIBloxModule.App.ImageSet.Images[var142.icon.off],
							toastSubtitle = p14.translator:FormatByKey(if fFlagConnectionsToFriendsRename then "CoreScripts.TextChat.Toast.ModerateChatOff.Subtitle.FriendsRename" else "CoreScripts.TextChat.Toast.ModerateChatOff.Subtitle"),
							toastTitle = p14.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOff.Title")
						})
					end
					var144 = isSettingEnabled
				end
			end)
		end
		local chatAvailabilityStatus = localPlayer.ChatAvailabilityStatus
		var31:debug("Local player's initial ChatAvailabilityStatus is {}", chatAvailabilityStatus)
		updateChatStatus(chatAvailabilityStatus)
		local userMessageIntentSentConnection = nil
		
		if fFlagExpChatEnableFOMOUpsellModule and shouldShowFOMOUpsellModule() or fFlagExpChatEnableCrossAgeChatActivityModule and shouldShowCrossAgeChatActivityModule() then
			var31:debug("Connecting to UserMessageIntentSent")
			userMessageIntentSentConnection = textChatService.UserMessageIntentSent:Connect(handleUserMessageIntentSent)
		end
		localPlayer:GetPropertyChangedSignal("ChatAvailabilityStatus"):Connect(function() --[[ line: 2046 ]]
			-- upvalues: chatAvailabilityStatus (write), localPlayer (ref), var31 (copy), updateChatStatus (ref), fFlagExpChatPresetChatEnabled (copy), fFlagExpChatPresetChatLoadTestEnabled (copy), isUserChatEnabledModule (copy), initializePresetChatModule (copy), getPresetChatStoreModule (copy), fFlagExpChatEnableFOMOUpsellModule (copy), shouldShowFOMOUpsellModule (copy), fFlagExpChatEnableCrossAgeChatActivityModule (copy), shouldShowCrossAgeChatActivityModule (copy), userMessageIntentSentConnection (write), textChatService (copy), handleUserMessageIntentSent (ref), fFlagExpChatClearHiddenMessagesPostAgeCheckModule (copy), fFlagExpChatUseMessagesStore (copy), var114 (ref), var113 (ref), hiddenMessagesClearedModule (copy), getTransparencyStoreModule (copy), chatPrivacySettingsReceivedModule (copy)
			chatAvailabilityStatus = localPlayer.ChatAvailabilityStatus
			var31:debug("Local player's ChatAvailabilityStatus has changed to {}", chatAvailabilityStatus)
			updateChatStatus(chatAvailabilityStatus)
			
			if (fFlagExpChatPresetChatEnabled or fFlagExpChatPresetChatLoadTestEnabled) and isUserChatEnabledModule(chatAvailabilityStatus) then
				initializePresetChatModule(getPresetChatStoreModule(false), not fFlagExpChatPresetChatEnabled and fFlagExpChatPresetChatLoadTestEnabled)
			end
			if (fFlagExpChatEnableFOMOUpsellModule and shouldShowFOMOUpsellModule() or fFlagExpChatEnableCrossAgeChatActivityModule and shouldShowCrossAgeChatActivityModule()) and not userMessageIntentSentConnection then
				var31:debug("Connecting to UserMessageIntentSent")
				userMessageIntentSentConnection = textChatService.UserMessageIntentSent:Connect(handleUserMessageIntentSent)
			end
			if fFlagExpChatEnableFOMOUpsellModule and isUserChatEnabledModule(chatAvailabilityStatus) and userMessageIntentSentConnection and (not fFlagExpChatEnableCrossAgeChatActivityModule or not shouldShowCrossAgeChatActivityModule()) then
				var31:debug("Disconnecting from UserMessageIntentSent")
				userMessageIntentSentConnection:Disconnect()
				
				if fFlagExpChatClearHiddenMessagesPostAgeCheckModule then
					if fFlagExpChatUseMessagesStore then
						var114.handleHiddenMessagesCleared()
					else
						var113:dispatch(hiddenMessagesClearedModule())
					end
					getTransparencyStoreModule(false).resetTextTransparency()
				end
			end
			if fFlagExpChatUseMessagesStore then
				var114.setCanLocalUserChat(isUserChatEnabledModule(chatAvailabilityStatus))
				
				return
			end
			var113:dispatch(chatPrivacySettingsReceivedModule(isUserChatEnabledModule(chatAvailabilityStatus)))
		end)
	elseif isChatRegionLockedModule() then
		displaySystemMessageModule("CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionUnavailable", nil, "Roblox.ChatDisabled.Info", p14.translator, p14.defaultSystemTextChannel, if fFlagAEGIS2EnableGatesForExpChatModule then "You can only view system messages here. Chat is currently unavailable in your region." else "Chat is unavailable in your region. You can still receive system messages.")
	elseif not fFlagAEGIS2EnableGatesForExpChatModule and getChatTranslationEnabled() then
		displaySystemMessageModule("CoreScripts.TextChat.ChatTranslation.ChatWindow.SystemMessageNew", nil, "Roblox.ChatTranslation.ChatWindow.SystemMessage", p14.translator, p14.defaultSystemTextChannel, "Roblox automatically translates supported languages in chat")
	end
	if fFlagExpChatPresetChatEnabled or fFlagExpChatPresetChatLoadTestEnabled then
		initializePresetChatModule(getPresetChatStoreModule(false), not fFlagExpChatPresetChatEnabled and fFlagExpChatPresetChatLoadTestEnabled)
	end
	return { roactInstance = experienceChat }
end