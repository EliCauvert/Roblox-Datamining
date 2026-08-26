local chatService = game:GetService("Chat")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local replicatedStorageService = game:GetService("ReplicatedStorage")
local _ = game:GetService("StarterGui")
local textChatService = game:GetService("TextChatService")
local robloxGui = coreGuiService.RobloxGui
local voiceChatCoreModule = require(corePackagesService.Workspace.Packages.VoiceChatCore)
local roduxModule = require(corePackagesService.Packages.Rodux)
local chatReducerModule = require(robloxGui.Modules.InGameChat.BubbleChat.Reducers.chatReducer)
local setMessageTextModule = require(robloxGui.Modules.InGameChat.BubbleChat.Actions.SetMessageText)
local addMessageFromEventModule = require(robloxGui.Modules.InGameChat.BubbleChat.Actions.AddMessageFromEvent)
local addMessageWithTimeoutModule = require(robloxGui.Modules.InGameChat.BubbleChat.Actions.AddMessageWithTimeout)
local updateChatSettingsModule = require(robloxGui.Modules.InGameChat.BubbleChat.Actions.UpdateChatSettings)
local bubbleChatEnabledChangedModule = require(robloxGui.Modules.InGameChat.BubbleChat.Actions.BubbleChatEnabledChanged)
local voiceEnabledChangedModule = require(robloxGui.Modules.VoiceChat.Actions.VoiceEnabledChanged)
local participantsChangedModule = require(robloxGui.Modules.VoiceChat.Actions.ParticipantsChanged)
local voiceStateChangedModule = require(robloxGui.Modules.VoiceChat.Actions.VoiceStateChanged)
local participantAddedModule = require(robloxGui.Modules.VoiceChat.Actions.ParticipantAdded)
local participantRemovedModule = require(robloxGui.Modules.VoiceChat.Actions.ParticipantRemoved)
local playerRemovedModule = require(robloxGui.Modules.VoiceChat.Actions.PlayerRemoved)
local getPlayerFromPartModule = require(robloxGui.Modules.InGameChat.BubbleChat.Helpers.getPlayerFromPart)
local validateMessageModule = require(robloxGui.Modules.InGameChat.BubbleChat.Helpers.validateMessage)
local constantsModule = require(robloxGui.Modules.InGameChat.BubbleChat.Constants)
local typesModule = require(robloxGui.Modules.InGameChat.BubbleChat.Types)
local blockingUtilityModule = require(corePackagesService.Workspace.Packages.BlockingUtility)
local gameTranslatorModule = require(robloxGui.Modules.GameTranslator)
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local initVoiceChatStoreModule = require(robloxGui.Modules.VoiceChat.initVoiceChatStore)
local getFFlagEnableVoiceChatVoiceUISyncModule = require(robloxGui.Modules.Flags.GetFFlagEnableVoiceChatVoiceUISync)
local getFFlagLocalMutedNilFix = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagLocalMutedNilFix
local getFFlagBatchVoiceParticipantsUpdates = voiceChatCoreModule.Flags.GetFFlagBatchVoiceParticipantsUpdates
local getFFlagExpChatAlwaysRunTCS = require(corePackagesService.Workspace.Packages.SharedFlags).getFFlagExpChatAlwaysRunTCS
local getFFlagExpChatUseVoiceParticipantsStore = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagExpChatUseVoiceParticipantsStore
local _ = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagExpChatUseMessagesStore
local fFlagExpChatUseChatConfigStore = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagExpChatUseChatConfigStore
local expChatModule = require(corePackagesService.Workspace.Packages.ExpChat)
local var1 = require(robloxGui.Modules.InGameChat.BubbleChat.Logger)(script.Name)
local _ = nil
local var2 = if getFFlagExpChatUseVoiceParticipantsStore() then expChatModule.Stores.GetVoiceStore(false) else nil
local t = {
	[voiceEnabledChangedModule.name] = function(p1)
		-- upvalues: expChatModule (ref)
		expChatModule.Events.VoiceEnabledChanged(p1.enabled)
	end,
	[voiceStateChangedModule.name] = function(p1)
		-- upvalues: getFFlagExpChatUseVoiceParticipantsStore (ref), var2 (ref), expChatModule (ref)
		if getFFlagExpChatUseVoiceParticipantsStore() then
			var2.handleVoiceStateChanged(p1.userId, p1.newState)
			
			return
		end
		expChatModule.Events.VoiceStateChanged(p1.userId, p1.newState)
	end,
	[participantsChangedModule.name] = function(p1)
		-- upvalues: getFFlagExpChatUseVoiceParticipantsStore (ref), var2 (ref), expChatModule (ref)
		if getFFlagExpChatUseVoiceParticipantsStore() then
			var2.handleVoiceParticipantsChanged(p1.newParticipants)
			
			return
		end
		expChatModule.Events.VoiceParticipantsChanged(p1.newParticipants)
	end,
	[participantAddedModule.name] = if getFFlagExpChatUseVoiceParticipantsStore() then nil else function(p1)
		-- upvalues: expChatModule (ref)
		expChatModule.Events.VoiceParticipantAdded(p1.userId)
	end,
	[participantRemovedModule.name] = if getFFlagExpChatUseVoiceParticipantsStore() then nil else function(p1)
		-- upvalues: expChatModule (ref)
		expChatModule.Events.VoiceParticipantRemoved(p1.userId)
	end
}
local var3 = roduxModule.Store.new(chatReducerModule, nil, {
	roduxModule.thunkMiddleware,
	function(p1)
		-- upvalues: t (ref)
		return function(p2)
			-- upvalues: t (copy), p1 (ref)
			local type = t[p2.type]
			
			if type then
				type(p2)
			end
			p1(p2)
		end
	end
})
local loadedConnection = nil

local function _()
	-- upvalues: getFFlagExpChatAlwaysRunTCS (ref), textChatService (ref)
	return if getFFlagExpChatAlwaysRunTCS() then true else textChatService.ChatVersion == Enum.ChatVersion.TextChatService
end

if game:IsLoaded() and (if getFFlagExpChatAlwaysRunTCS() then true else textChatService.ChatVersion == Enum.ChatVersion.TextChatService) then return end
loadedConnection = game.Loaded:Connect(function()
	-- upvalues: loadedConnection (write)
	if game:IsLoaded() then
		loadedConnection:Disconnect()
	end
end)

local function validateMessageWithWarning(p1, p2)
	-- upvalues: validateMessageModule (ref), constantsModule (ref)
	local var4, var5 = validateMessageModule(p2)
	
	if not var4 then
		if var5 then
			warn(("Message text %q is too long for chat event %q (expected a message of length %i, got %i)"):format(p2, p1, constantsModule.MAX_MESSAGE_LENGTH, var5))
			
			return var4
		end
		warn(("Message text %q sent to chat event %q is not a valid UTF-8 characters sequence"):format(p2, p1))
	end
	return var4
end

local _ = function(p1, p2)
	-- upvalues: typesModule (ref)
	local var4, var5 = typesModule.IMessageData(p2)
	
	if not var4 then
		warn(("Malformed message data sent to chat event %q. If you have modified the chat system, check what you are firing to this event"):format(p1))
		warn(var5)
	end
	return var4
end

local _ = nil
local var4 = nil
local var5 = nil
local var6 = nil
local var7 = nil
local var8 = nil
local var9 = 0
local var10 = 0
local t_1 = {}

local function initBubbleChat()
	-- upvalues: replicatedStorageService (ref), var4 (write), typesModule (ref), playersService (ref), validateMessageWithWarning (ref), var3 (write), addMessageFromEventModule (ref), var5 (write), setMessageTextModule (ref), getPlayerFromPartModule (ref), t_1 (ref), var9 (write), gameTranslatorModule (ref), coreGuiService (ref), addMessageWithTimeoutModule (ref), var10 (write), var6 (write), chatService (ref)
	coroutine.resume(coroutine.create(function()
		-- upvalues: replicatedStorageService (copy), var4 (copy), typesModule (copy), playersService (copy), validateMessageWithWarning (copy), var3 (copy), addMessageFromEventModule (copy), var5 (copy), setMessageTextModule (copy)
		local defaultChatSystemChatEvents = replicatedStorageService:WaitForChild("DefaultChatSystemChatEvents", 1e999)
		var4 = defaultChatSystemChatEvents:WaitForChild("OnNewMessage", 1e999).OnClientEvent:Connect(function(p1)
			-- upvalues: typesModule (copy), playersService (copy), validateMessageWithWarning (copy), var3 (copy), addMessageFromEventModule (copy)
			local var11, var12 = typesModule.IMessageData(p1)
			
			if not var11 then
				warn(("Malformed message data sent to chat event %q. If you have modified the chat system, check what you are firing to this event"):format("OnNewMessage"))
				warn(var12)
			end
			if not var11 then return end
			if p1.FromSpeaker == playersService.LocalPlayer.Name then
				if not validateMessageWithWarning("OnNewMessage", p1.Message) then return end
				local cloned = table.clone(p1)
				cloned.Time = workspace:GetServerTimeNow() * 1000
				var3:dispatch(addMessageFromEventModule(cloned))
			end
		end)
		var5 = defaultChatSystemChatEvents:WaitForChild("OnMessageDoneFiltering", 1e999).OnClientEvent:Connect(function(p1)
			-- upvalues: typesModule (copy), validateMessageWithWarning (copy), var3 (copy), setMessageTextModule (copy), addMessageFromEventModule (copy)
			local var11, var12 = typesModule.IMessageData(p1)
			
			if not var11 then
				warn(("Malformed message data sent to chat event %q. If you have modified the chat system, check what you are firing to this event"):format("OnMessageDoneFiltering"))
				warn(var12)
			end
			if not var11 or not validateMessageWithWarning("OnMessageDoneFiltering", p1.Message) then return end
			local var13 = tostring(p1.ID)
			
			if var3:getState().messages[var13] then
				var3:dispatch(setMessageTextModule(var13, p1.Message))
				
				return
			end
			var11 = table.clone(p1)
			var11.Time = workspace:GetServerTimeNow() * 1000
			var3:dispatch(addMessageFromEventModule(var11))
		end)
	end))
	
	local function addMessageWithId(p1, p2, p3)
		-- upvalues: getPlayerFromPartModule (copy), t_1 (copy), var9 (copy), gameTranslatorModule (copy), coreGuiService (copy), var3 (copy), addMessageWithTimeoutModule (copy)
		local var11
		local var12 = if p1:IsA("Model") then if p1.PrimaryPart then p1.PrimaryPart else p1:FindFirstChildWhichIsA("BasePart", true) else p1
		local var13 = if var12 then getPlayerFromPartModule(var12) else nil
		local _ = nil
		
		if var13 then
			var11 = tostring(var13.UserId)
		else
			local var14 = t_1[p1]
			
			if var14 then
				var11 = var14
			else
				var9 += 1
				var11 = "adornee_" .. var40
				t_1[p1] = var11
			end
		end
		var3:dispatch(addMessageWithTimeoutModule({
			id = "chatted_" .. p15,
			userId = var11,
			name = p1.Name,
			text = gameTranslatorModule:TranslateGameText(coreGuiService, p2),
			timestamp = os.time(),
			adornee = p1
		}))
	end
	
	var6 = chatService.Chatted:Connect(function(p1, p2)
		-- upvalues: var10 (copy), addMessageWithId (ref)
		var10 += 1
		addMessageWithId(p1, p2, var10)
	end)
end

local function destroyBubbleChat()
	-- upvalues: var4 (write), var5 (write), var6 (write), var8 (write), var7 (write)
	if var4 then
		var4:Disconnect()
		var4 = nil
	end
	if var5 then
		var5:Disconnect()
		var5 = nil
	end
	if var6 then
		var6:Disconnect()
		var6 = nil
	end
	if var8 then
		var8:Disconnect()
		var8 = nil
	end
	if var7 then
		var7:Disconnect()
		var7 = nil
	end
end

local function onBubbleChatEnabledChanged()
	-- upvalues: destroyBubbleChat (ref), chatService (ref), initBubbleChat (ref), var3 (write), bubbleChatEnabledChangedModule (ref)
	destroyBubbleChat()
	local var11 = not game:GetEngineFeature("EnableBubbleChatFromChatService") or chatService.BubbleChatEnabled
	
	if var11 then
		initBubbleChat()
	end
	var3:dispatch(bubbleChatEnabledChangedModule(var11))
end

local t_2 = {}

local function setVoiceEnabled(value)
	-- upvalues: playersService (ref), var3 (write), voiceEnabledChangedModule (ref), t_2 (write), var1 (ref), voiceStateChangedModule (ref), constantsModule (ref), getFFlagLocalMutedNilFix (ref), default (ref)
	local var11 = tostring(playersService.LocalPlayer.UserId)
	var3:dispatch(voiceEnabledChangedModule(value ~= Enum.VoiceChatState.Ended))
	
	if t_2[value] then
		var3:dispatch(voiceStateChangedModule(var11, t_2[value]))
	else
		var1:warning("LOCAL_STATE_MAP does not exist for {} state", value)
		var3:dispatch(voiceStateChangedModule(var11, constantsModule.VOICE_STATE.MUTED))
	end
	if value == Enum.VoiceChatState.Failed then
		for i, v in pairs(playersService:GetPlayers()) do
			local var12 = tostring(v.UserId)
			
			if v ~= playersService.LocalPlayer then
				var3:dispatch(voiceStateChangedModule(var12, constantsModule.VOICE_STATE.HIDDEN))
			end
		end
		return
	elseif value == Enum.VoiceChatState.Joined then
		local var13
		if getFFlagLocalMutedNilFix then
			var13 = default.localMuted == false
			var13 = nil
		else
			var13 = not default.localMuted
		end
		if var13 then
			var3:dispatch(voiceStateChangedModule(var11, constantsModule.VOICE_STATE.INACTIVE))
		end
	end
end

local _ = function(p1)
	return "..." .. string.sub(tostring(p1), -4)
end

local function initVoiceChat()
	-- upvalues: getFFlagEnableVoiceChatVoiceUISyncModule (ref), initVoiceChatStoreModule (ref), var3 (write), var1 (ref), default (ref), t_2 (write), constantsModule (ref), playersService (ref), participantAddedModule (ref), playerRemovedModule (ref), participantRemovedModule (ref), voiceStateChangedModule (ref), getFFlagBatchVoiceParticipantsUpdates (ref), participantsChangedModule (ref), blockingUtilityModule (ref), setVoiceEnabled (ref)
	if getFFlagEnableVoiceChatVoiceUISyncModule() then
		initVoiceChatStoreModule(var3)
		
		return
	end
	var1:debug("Initializing VoiceChatService connections")
	local service = default:getService()
	
	if not service then
		var1:debug("VoiceChatService is not available")
		
		return
	elseif not Enum.VoiceChatState then
		var1:error("Enum.VoiceChatState does not exist but voice is enabled")
		
		return
	end
	t_2 = {
		[Enum.VoiceChatState.Idle] = constantsModule.VOICE_STATE.HIDDEN,
		[Enum.VoiceChatState.Joining] = constantsModule.VOICE_STATE.CONNECTING,
		[Enum.VoiceChatState.JoiningRetry] = constantsModule.VOICE_STATE.CONNECTING,
		[Enum.VoiceChatState.Joined] = constantsModule.VOICE_STATE.MUTED,
		[Enum.VoiceChatState.Leaving] = constantsModule.VOICE_STATE.MUTED,
		[Enum.VoiceChatState.Ended] = constantsModule.VOICE_STATE.HIDDEN,
		[Enum.VoiceChatState.Failed] = constantsModule.VOICE_STATE.ERROR
	}
	local userId = playersService.LocalPlayer.UserId
	
	for i, v in pairs(playersService:GetPlayers()) do
		var1:trace("Adding existing player {}", "..." .. string.sub(tostring(v.UserId), -4))
		var3:dispatch(participantAddedModule(tostring(v.UserId)))
	end
	playersService.PlayerAdded:Connect(function(p1)
		-- upvalues: var1 (copy), var3 (copy), participantAddedModule (copy)
		var1:trace("Adding joining player {}", "..." .. string.sub(tostring(p1.UserId), -4))
		var3:dispatch(participantAddedModule(tostring(p1.userId)))
	end)
	playersService.PlayerRemoving:Connect(function(p1)
		-- upvalues: var1 (copy), var3 (copy), playerRemovedModule (copy), participantRemovedModule (copy)
		var1:trace("Removing player {}", "..." .. string.sub(tostring(p1.UserId), -4))
		var3:dispatch(playerRemovedModule(tostring(p1.userId)))
		var3:dispatch(participantRemovedModule(tostring(p1.userId)))
	end)
	var3:dispatch(voiceStateChangedModule(userId, constantsModule.VOICE_STATE.HIDDEN))
	default.muteChanged.Event:connect(function(p1)
		-- upvalues: var1 (copy), constantsModule (copy), var3 (copy), voiceStateChangedModule (copy), userId (ref)
		var1:debug("Mute changed to {}", p1)
		var3:dispatch(voiceStateChangedModule(userId, if p1 then constantsModule.VOICE_STATE.MUTED else constantsModule.VOICE_STATE.INACTIVE))
	end)
	default.participantsUpdate.Event:Connect(function(p1)
		-- upvalues: getFFlagBatchVoiceParticipantsUpdates (copy), var3 (copy), participantsChangedModule (copy), constantsModule (copy), var1 (copy), voiceStateChangedModule (copy)
		if getFFlagBatchVoiceParticipantsUpdates() then
			var3:dispatch(participantsChangedModule(p1))
			
			return
		end
		for i, v in pairs(p1) do
			local INACTIVE = constantsModule.VOICE_STATE.INACTIVE
			
			if not v.subscriptionCompleted then
				INACTIVE = constantsModule.VOICE_STATE.CONNECTING
			elseif v.isMutedLocally then
				INACTIVE = constantsModule.VOICE_STATE.LOCAL_MUTED
			elseif v.isMuted then
				INACTIVE = constantsModule.VOICE_STATE.MUTED
			elseif v.isSignalActive then
				INACTIVE = constantsModule.VOICE_STATE.TALKING
			end
			var1:trace("Participant update for {}, voice state {}", "..." .. string.sub(tostring(i), -4), INACTIVE)
			var3:dispatch(voiceStateChangedModule(i, INACTIVE))
		end
	end)
	default.talkingChanged.Event:Connect(function(p2)
		-- upvalues: var3 (copy), voiceStateChangedModule (copy), userId (ref), constantsModule (copy)
		if p2 then
			var3:dispatch(voiceStateChangedModule(userId, constantsModule.VOICE_STATE.TALKING))
			
			return
		end
		var3:dispatch(voiceStateChangedModule(userId, constantsModule.VOICE_STATE.INACTIVE))
	end)
	blockingUtilityModule:GetBlockedStatusChangedEvent():Connect(function(p2, p3)
		-- upvalues: var3 (copy), participantRemovedModule (copy), participantAddedModule (copy)
		if p3 then
			var3:dispatch(participantRemovedModule(tostring(p2)))
			
			return
		end
		var3:dispatch(participantAddedModule(tostring(p2)))
	end)
	var1:debug("Initial voice state is {}", service.VoiceChatState)
	setVoiceEnabled(service.VoiceChatState)
	service.StateChanged:Connect(function(_, p2)
		-- upvalues: var1 (copy), setVoiceEnabled (copy)
		var1:debug("Voice state changed to {}", p2)
		setVoiceEnabled(p2)
	end)
end

if game:GetEngineFeature("EnableBubbleChatFromChatService") then
	chatService:GetPropertyChangedSignal("BubbleChatEnabled"):Connect(onBubbleChatEnabledChanged)
end
destroyBubbleChat()
local var14 = not game:GetEngineFeature("EnableBubbleChatFromChatService") or chatService.BubbleChatEnabled

if var14 then
	initBubbleChat()
end
var3:dispatch(bubbleChatEnabledChangedModule(var14))

if game:GetEngineFeature("BubbleChatSettingsApi") then
	chatService.BubbleChatSettingsChanged:Connect(function(p1)
		-- upvalues: typesModule (ref), fFlagExpChatUseChatConfigStore (ref), expChatModule (ref), var3 (write), updateChatSettingsModule (ref)
		local var15, var16 = typesModule.IChatSettings(p1)
		assert(var15, "Bad settings object passed to Chat:SetBubbleChatSettings:\n" .. (var16 or ""))
		
		if fFlagExpChatUseChatConfigStore then
			expChatModule.Stores.GetChatConfigurationStore(false).setBubbleChatSettings(p1)
			
			return
		end
		var3:dispatch(updateChatSettingsModule(p1))
	end)
end
default:asyncInit():andThen(initVoiceChat):catch(function()
	-- upvalues: var1 (ref)
	var1:debug("VoiceChatServiceManager failed to initialize")
end)