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
local var29 = require(robloxGui.Modules.InGameChat.BubbleChat.Logger)(script.Name)
local _ = nil
local var30 = if getFFlagExpChatUseVoiceParticipantsStore() then expChatModule.Stores.GetVoiceStore(false) else nil
local t = {
	[voiceEnabledChangedModule.name] = function(p0) --[[ line: 68 ]]
		-- upvalues: expChatModule (ref)
		expChatModule.Events.VoiceEnabledChanged(p0.enabled)
	end,
	[voiceStateChangedModule.name] = function(p1) --[[ line: 72 ]]
		-- upvalues: getFFlagExpChatUseVoiceParticipantsStore (ref), var30 (ref), expChatModule (ref)
		if getFFlagExpChatUseVoiceParticipantsStore() then
			var30.handleVoiceStateChanged(p1.userId, p1.newState)
			
			return
		end
		expChatModule.Events.VoiceStateChanged(p1.userId, p1.newState)
	end,
	[participantsChangedModule.name] = function(p2) --[[ line: 80 ]]
		-- upvalues: getFFlagExpChatUseVoiceParticipantsStore (ref), var30 (ref), expChatModule (ref)
		if getFFlagExpChatUseVoiceParticipantsStore() then
			var30.handleVoiceParticipantsChanged(p2.newParticipants)
			
			return
		end
		expChatModule.Events.VoiceParticipantsChanged(p2.newParticipants)
	end,
	[participantAddedModule.name] = if getFFlagExpChatUseVoiceParticipantsStore() then nil else function(p3) --[[ line: 91 ]]
		-- upvalues: expChatModule (ref)
		expChatModule.Events.VoiceParticipantAdded(p3.userId)
	end,
	[participantRemovedModule.name] = if getFFlagExpChatUseVoiceParticipantsStore() then nil else function(p4) --[[ line: 98 ]]
		-- upvalues: expChatModule (ref)
		expChatModule.Events.VoiceParticipantRemoved(p4.userId)
	end
}
local var32 = roduxModule.Store.new(chatReducerModule, nil, {
	roduxModule.thunkMiddleware,
	function(p5) --[[ line: 103 ]]
		-- upvalues: t (ref)
		return function(p6) --[[ line: 104 ]]
			-- upvalues: t (copy), p5 (ref)
			local type = t[p6.type]
			
			if type then
				type(p6)
			end
			p5(p6)
		end
	end
})
local loadedConnection = nil

local function _() --[[ line: 120 | named "isTextChatServiceOn" ]]
	-- upvalues: getFFlagExpChatAlwaysRunTCS (ref), textChatService (ref)
	return if getFFlagExpChatAlwaysRunTCS() then true else textChatService.ChatVersion == Enum.ChatVersion.TextChatService
end

if game:IsLoaded() and (if getFFlagExpChatAlwaysRunTCS() then true else textChatService.ChatVersion == Enum.ChatVersion.TextChatService) then return end
loadedConnection = game.Loaded:Connect(function() --[[ line: 131 ]]
	-- upvalues: loadedConnection (write)
	if game:IsLoaded() then
		loadedConnection:Disconnect()
	end
end)

local function validateMessageWithWarning(p7, p8) --[[ line: 138 ]]
	-- upvalues: validateMessageModule (ref), constantsModule (ref)
	local var50, var51 = validateMessageModule(p8)
	
	if not var50 then
		if var51 then
			warn(("Message text %q is too long for chat event %q (expected a message of length %i, got %i)"):format(p8, p7, constantsModule.MAX_MESSAGE_LENGTH, var51))
			
			return var50
		end
		warn(("Message text %q sent to chat event %q is not a valid UTF-8 characters sequence"):format(p8, p7))
	end
	return var50
end

local _ = function(p9, p10) --[[ line: 152 | named "validateMessageData" ]]
	-- upvalues: typesModule (ref)
	local var52, var53 = typesModule.IMessageData(p10)
	
	if not var52 then
		warn(("Malformed message data sent to chat event %q. If you have modified the chat system, check what you are firing to this event"):format(p9))
		warn(var53)
	end
	return var52
end

local _ = nil
local var35 = nil
local var36 = nil
local var37 = nil
local var38 = nil
local var39 = nil
local var40 = 0
local var41 = 0
local t_1 = {}

local function initBubbleChat() --[[ line: 167 ]]
	-- upvalues: replicatedStorageService (ref), var35 (write), typesModule (ref), playersService (ref), validateMessageWithWarning (ref), var32 (write), addMessageFromEventModule (ref), var36 (write), setMessageTextModule (ref), getPlayerFromPartModule (ref), t_1 (ref), var40 (write), gameTranslatorModule (ref), coreGuiService (ref), addMessageWithTimeoutModule (ref), var41 (write), var37 (write), chatService (ref)
	coroutine.resume(coroutine.create(function() --[[ line: 168 ]]
		-- upvalues: replicatedStorageService (copy), var35 (copy), typesModule (copy), playersService (copy), validateMessageWithWarning (copy), var32 (copy), addMessageFromEventModule (copy), var36 (copy), setMessageTextModule (copy)
		local defaultChatSystemChatEvents = replicatedStorageService:WaitForChild("DefaultChatSystemChatEvents", 1e999)
		var35 = defaultChatSystemChatEvents:WaitForChild("OnNewMessage", 1e999).OnClientEvent:Connect(function(p11) --[[ line: 176 ]]
			-- upvalues: typesModule (copy), playersService (copy), validateMessageWithWarning (copy), var32 (copy), addMessageFromEventModule (copy)
			local var56, var57 = typesModule.IMessageData(p11)
			
			if not var56 then
				warn(("Malformed message data sent to chat event %q. If you have modified the chat system, check what you are firing to this event"):format("OnNewMessage"))
				warn(var57)
			end
			if not var56 then return end
			if p11.FromSpeaker == playersService.LocalPlayer.Name then
				if not validateMessageWithWarning("OnNewMessage", p11.Message) then return end
				local cloned = table.clone(p11)
				cloned.Time = workspace:GetServerTimeNow() * 1000
				var32:dispatch(addMessageFromEventModule(cloned))
			end
		end)
		var36 = defaultChatSystemChatEvents:WaitForChild("OnMessageDoneFiltering", 1e999).OnClientEvent:Connect(function(p12) --[[ line: 194 ]]
			-- upvalues: typesModule (copy), validateMessageWithWarning (copy), var32 (copy), setMessageTextModule (copy), addMessageFromEventModule (copy)
			local var59, var60 = typesModule.IMessageData(p12)
			
			if not var59 then
				warn(("Malformed message data sent to chat event %q. If you have modified the chat system, check what you are firing to this event"):format("OnMessageDoneFiltering"))
				warn(var60)
			end
			if not var59 or not validateMessageWithWarning("OnMessageDoneFiltering", p12.Message) then return end
			local var61 = tostring(p12.ID)
			
			if var32:getState().messages[var61] then
				var32:dispatch(setMessageTextModule(var61, p12.Message))
				
				return
			end
			var59 = table.clone(p12)
			var59.Time = workspace:GetServerTimeNow() * 1000
			var32:dispatch(addMessageFromEventModule(var59))
		end)
	end))
	
	local function addMessageWithId(p13, p14, p15) --[[ line: 213 ]]
		-- upvalues: getPlayerFromPartModule (copy), t_1 (copy), var40 (copy), gameTranslatorModule (copy), coreGuiService (copy), var32 (copy), addMessageWithTimeoutModule (copy)
		local var65
		local var62 = if p13:IsA("Model") then if p13.PrimaryPart then p13.PrimaryPart else p13:FindFirstChildWhichIsA("BasePart", true) else p13
		local var63 = if var62 then getPlayerFromPartModule(var62) else nil
		local _ = nil
		
		if var63 then
			var65 = tostring(var63.UserId)
		else
			local var64 = t_1[p13]
			
			if var64 then
				var65 = var64
			else
				var40 += 1
				var65 = "adornee_" .. var40
				t_1[p13] = var65
			end
		end
		var32:dispatch(addMessageWithTimeoutModule({
			id = "chatted_" .. p15,
			userId = var65,
			name = p13.Name,
			text = gameTranslatorModule:TranslateGameText(coreGuiService, p14),
			timestamp = os.time(),
			adornee = p13
		}))
	end
	
	var37 = chatService.Chatted:Connect(function(p16, p17) --[[ line: 256 | named "addMessage" ]]
		-- upvalues: var41 (copy), addMessageWithId (ref)
		var41 += 1
		addMessageWithId(p16, p17, var41)
	end)
end

local function destroyBubbleChat() --[[ line: 264 ]]
	-- upvalues: var35 (write), var36 (write), var37 (write), var39 (write), var38 (write)
	if var35 then
		var35:Disconnect()
		var35 = nil
	end
	if var36 then
		var36:Disconnect()
		var36 = nil
	end
	if var37 then
		var37:Disconnect()
		var37 = nil
	end
	if var39 then
		var39:Disconnect()
		var39 = nil
	end
	if var38 then
		var38:Disconnect()
		var38 = nil
	end
end

local function onBubbleChatEnabledChanged() --[[ line: 288 ]]
	-- upvalues: destroyBubbleChat (ref), chatService (ref), initBubbleChat (ref), var32 (write), bubbleChatEnabledChangedModule (ref)
	destroyBubbleChat()
	local var66 = not game:GetEngineFeature("EnableBubbleChatFromChatService") or chatService.BubbleChatEnabled
	
	if var66 then
		initBubbleChat()
	end
	var32:dispatch(bubbleChatEnabledChangedModule(var66))
end

local t_2 = {}

local function setVoiceEnabled(value) --[[ line: 300 ]]
	-- upvalues: playersService (ref), var32 (write), voiceEnabledChangedModule (ref), t_2 (write), var29 (ref), voiceStateChangedModule (ref), constantsModule (ref), getFFlagLocalMutedNilFix (ref), default (ref)
	local var67 = tostring(playersService.LocalPlayer.UserId)
	var32:dispatch(voiceEnabledChangedModule(value ~= Enum.VoiceChatState.Ended))
	
	if t_2[value] then
		var32:dispatch(voiceStateChangedModule(var67, t_2[value]))
	else
		var29:warning("LOCAL_STATE_MAP does not exist for {} state", value)
		var32:dispatch(voiceStateChangedModule(var67, constantsModule.VOICE_STATE.MUTED))
	end
	if value == Enum.VoiceChatState.Failed then
		for i, v in pairs(playersService:GetPlayers()) do
			local var68 = tostring(v.UserId)
			
			if v ~= playersService.LocalPlayer then
				var32:dispatch(voiceStateChangedModule(var68, constantsModule.VOICE_STATE.HIDDEN))
			end
		end
		return
	elseif value == Enum.VoiceChatState.Joined then
		local var69
		if getFFlagLocalMutedNilFix then
			var69 = default.localMuted == false
			var69 = nil
		else
			var69 = not default.localMuted
		end
		if var69 then
			var32:dispatch(voiceStateChangedModule(var67, constantsModule.VOICE_STATE.INACTIVE))
		end
	end
end

local _ = function(p18) --[[ line: 331 | named "shorten" ]]
	return "..." .. string.sub(tostring(p18), -4)
end

local function initVoiceChat() --[[ line: 335 ]]
	-- upvalues: getFFlagEnableVoiceChatVoiceUISyncModule (ref), initVoiceChatStoreModule (ref), var32 (write), var29 (ref), default (ref), t_2 (write), constantsModule (ref), playersService (ref), participantAddedModule (ref), playerRemovedModule (ref), participantRemovedModule (ref), voiceStateChangedModule (ref), getFFlagBatchVoiceParticipantsUpdates (ref), participantsChangedModule (ref), blockingUtilityModule (ref), setVoiceEnabled (ref)
	if getFFlagEnableVoiceChatVoiceUISyncModule() then
		initVoiceChatStoreModule(var32)
		
		return
	end
	var29:debug("Initializing VoiceChatService connections")
	local service = default:getService()
	
	if not service then
		var29:debug("VoiceChatService is not available")
		
		return
	elseif not Enum.VoiceChatState then
		var29:error("Enum.VoiceChatState does not exist but voice is enabled")
		
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
		var29:trace("Adding existing player {}", "..." .. string.sub(tostring(v.UserId), -4))
		var32:dispatch(participantAddedModule(tostring(v.UserId)))
	end
	playersService.PlayerAdded:Connect(function(p19) --[[ line: 371 ]]
		-- upvalues: var29 (copy), var32 (copy), participantAddedModule (copy)
		var29:trace("Adding joining player {}", "..." .. string.sub(tostring(p19.UserId), -4))
		var32:dispatch(participantAddedModule(tostring(p19.userId)))
	end)
	playersService.PlayerRemoving:Connect(function(p20) --[[ line: 376 ]]
		-- upvalues: var29 (copy), var32 (copy), playerRemovedModule (copy), participantRemovedModule (copy)
		var29:trace("Removing player {}", "..." .. string.sub(tostring(p20.UserId), -4))
		var32:dispatch(playerRemovedModule(tostring(p20.userId)))
		var32:dispatch(participantRemovedModule(tostring(p20.userId)))
	end)
	var32:dispatch(voiceStateChangedModule(userId, constantsModule.VOICE_STATE.HIDDEN))
	default.muteChanged.Event:connect(function(p21) --[[ line: 385 ]]
		-- upvalues: var29 (copy), constantsModule (copy), var32 (copy), voiceStateChangedModule (copy), userId (ref)
		var29:debug("Mute changed to {}", p21)
		var32:dispatch(voiceStateChangedModule(userId, if p21 then constantsModule.VOICE_STATE.MUTED else constantsModule.VOICE_STATE.INACTIVE))
	end)
	default.participantsUpdate.Event:Connect(function(p22) --[[ line: 391 ]]
		-- upvalues: getFFlagBatchVoiceParticipantsUpdates (copy), var32 (copy), participantsChangedModule (copy), constantsModule (copy), var29 (copy), voiceStateChangedModule (copy)
		if getFFlagBatchVoiceParticipantsUpdates() then
			var32:dispatch(participantsChangedModule(p22))
			
			return
		end
		for i, v in pairs(p22) do
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
			var29:trace("Participant update for {}, voice state {}", "..." .. string.sub(tostring(i), -4), INACTIVE)
			var32:dispatch(voiceStateChangedModule(i, INACTIVE))
		end
	end)
	default.talkingChanged.Event:Connect(function(p23) --[[ line: 413 ]]
		-- upvalues: var32 (copy), voiceStateChangedModule (copy), userId (ref), constantsModule (copy)
		if p23 then
			var32:dispatch(voiceStateChangedModule(userId, constantsModule.VOICE_STATE.TALKING))
			
			return
		end
		var32:dispatch(voiceStateChangedModule(userId, constantsModule.VOICE_STATE.INACTIVE))
	end)
	blockingUtilityModule:GetBlockedStatusChangedEvent():Connect(function(p24, p25) --[[ line: 422 ]]
		-- upvalues: var32 (copy), participantRemovedModule (copy), participantAddedModule (copy)
		if p25 then
			var32:dispatch(participantRemovedModule(tostring(p24)))
			
			return
		end
		var32:dispatch(participantAddedModule(tostring(p24)))
	end)
	var29:debug("Initial voice state is {}", service.VoiceChatState)
	setVoiceEnabled(service.VoiceChatState)
	service.StateChanged:Connect(function(_, p26) --[[ line: 432 ]]
		-- upvalues: var29 (copy), setVoiceEnabled (copy)
		var29:debug("Voice state changed to {}", p26)
		setVoiceEnabled(p26)
	end)
end

if game:GetEngineFeature("EnableBubbleChatFromChatService") then
	chatService:GetPropertyChangedSignal("BubbleChatEnabled"):Connect(onBubbleChatEnabledChanged)
end
destroyBubbleChat()
local var49 = not game:GetEngineFeature("EnableBubbleChatFromChatService") or chatService.BubbleChatEnabled

if var49 then
	initBubbleChat()
end
var32:dispatch(bubbleChatEnabledChangedModule(var49))

if game:GetEngineFeature("BubbleChatSettingsApi") then
	chatService.BubbleChatSettingsChanged:Connect(function(p27) --[[ line: 444 ]]
		-- upvalues: typesModule (ref), fFlagExpChatUseChatConfigStore (ref), expChatModule (ref), var32 (write), updateChatSettingsModule (ref)
		local var71, var72 = typesModule.IChatSettings(p27)
		assert(var71, "Bad settings object passed to Chat:SetBubbleChatSettings:\n" .. (var72 or ""))
		
		if fFlagExpChatUseChatConfigStore then
			expChatModule.Stores.GetChatConfigurationStore(false).setBubbleChatSettings(p27)
			
			return
		end
		var32:dispatch(updateChatSettingsModule(p27))
	end)
end
default:asyncInit():andThen(initVoiceChat):catch(function() --[[ line: 459 ]]
	-- upvalues: var29 (ref)
	var29:debug("VoiceChatServiceManager failed to initialize")
end)