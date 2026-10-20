local Chat = game:GetService("Chat")
local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local _ = game:GetService("StarterGui")
local TextChatService = game:GetService("TextChatService")
local RobloxGui = CoreGui.RobloxGui
local RoduxModule = require(CorePackages.Packages.Rodux)
local SetMessageTextModule = require(RobloxGui.Modules.InGameChat.BubbleChat.Actions.SetMessageText)
local AddMessageFromEventModule = require(RobloxGui.Modules.InGameChat.BubbleChat.Actions.AddMessageFromEvent)
local AddMessageWithTimeoutModule = require(RobloxGui.Modules.InGameChat.BubbleChat.Actions.AddMessageWithTimeout)
local UpdateChatSettingsModule = require(RobloxGui.Modules.InGameChat.BubbleChat.Actions.UpdateChatSettings)
local BubbleChatEnabledChangedModule = require(RobloxGui.Modules.InGameChat.BubbleChat.Actions.BubbleChatEnabledChanged)
local VoiceEnabledChangedModule = require(RobloxGui.Modules.VoiceChat.Actions.VoiceEnabledChanged)
local ParticipantsChangedModule = require(RobloxGui.Modules.VoiceChat.Actions.ParticipantsChanged)
local VoiceStateChangedModule = require(RobloxGui.Modules.VoiceChat.Actions.VoiceStateChanged)
local ParticipantAddedModule = require(RobloxGui.Modules.VoiceChat.Actions.ParticipantAdded)
local ParticipantRemovedModule = require(RobloxGui.Modules.VoiceChat.Actions.ParticipantRemoved)
local PlayerRemovedModule = require(RobloxGui.Modules.VoiceChat.Actions.PlayerRemoved)
local GetPlayerFromPartModule = require(RobloxGui.Modules.InGameChat.BubbleChat.Helpers.getPlayerFromPart)
local ValidateMessageModule = require(RobloxGui.Modules.InGameChat.BubbleChat.Helpers.validateMessage)
local ConstantsModule = require(RobloxGui.Modules.InGameChat.BubbleChat.Constants)
local TypesModule = require(RobloxGui.Modules.InGameChat.BubbleChat.Types)
local BlockingUtilityModule = require(CorePackages.Workspace.Packages.BlockingUtility)
local GameTranslatorModule = require(RobloxGui.Modules.GameTranslator)
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local InitVoiceChatStoreModule = require(RobloxGui.Modules.VoiceChat.initVoiceChatStore)
local GetFFlagEnableVoiceChatVoiceUISyncModule = require(RobloxGui.Modules.Flags.GetFFlagEnableVoiceChatVoiceUISync)
local GetFFlagLocalMutedNilFix = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLocalMutedNilFix
local GetFFlagBatchVoiceParticipantsUpdatesFunction = require(CorePackages.Workspace.Packages.VoiceChatCore).Flags.GetFFlagBatchVoiceParticipantsUpdates
local GetFFlagExpChatAlwaysRunTCSFunction = require(CorePackages.Workspace.Packages.SharedFlags).getFFlagExpChatAlwaysRunTCS
local GetFFlagExpChatUseVoiceParticipantsStoreFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagExpChatUseVoiceParticipantsStore
local _ = require(CorePackages.Workspace.Packages.SharedFlags).FFlagExpChatUseMessagesStore
local FFlagExpChatUseChatConfigStore = require(CorePackages.Workspace.Packages.SharedFlags).FFlagExpChatUseChatConfigStore
local ExpChatModule = require(CorePackages.Workspace.Packages.ExpChat)
local v1 = require(RobloxGui.Modules.InGameChat.BubbleChat.Logger)(script.Name)
local NewResult = nil
local VoiceStore = if GetFFlagExpChatUseVoiceParticipantsStoreFunction() then ExpChatModule.Stores.GetVoiceStore(false) else nil
local config = {
	[VoiceEnabledChangedModule.name] = function(p1)
		-- upvalues: ExpChatModule (copy)
		ExpChatModule.Events.VoiceEnabledChanged(p1.enabled)
	end,
	[VoiceStateChangedModule.name] = function(p1)
		-- upvalues: GetFFlagExpChatUseVoiceParticipantsStoreFunction (copy), VoiceStore (copy), ExpChatModule (copy)
		if GetFFlagExpChatUseVoiceParticipantsStoreFunction() then
			VoiceStore.handleVoiceStateChanged(p1.userId, p1.newState)
			
			return
		else
			ExpChatModule.Events.VoiceStateChanged(p1.userId, p1.newState)
		end
	end,
	[ParticipantsChangedModule.name] = function(p1)
		-- upvalues: GetFFlagExpChatUseVoiceParticipantsStoreFunction (copy), VoiceStore (copy), ExpChatModule (copy)
		if GetFFlagExpChatUseVoiceParticipantsStoreFunction() then
			VoiceStore.handleVoiceParticipantsChanged(p1.newParticipants)
			
			return
		else
			ExpChatModule.Events.VoiceParticipantsChanged(p1.newParticipants)
		end
	end,
	[ParticipantAddedModule.name] = if GetFFlagExpChatUseVoiceParticipantsStoreFunction() then nil else function(p1)
		-- upvalues: ExpChatModule (copy)
		ExpChatModule.Events.VoiceParticipantAdded(p1.userId)
	end,
	[ParticipantRemovedModule.name] = if GetFFlagExpChatUseVoiceParticipantsStoreFunction() then nil else function(p1)
		-- upvalues: ExpChatModule (copy)
		ExpChatModule.Events.VoiceParticipantRemoved(p1.userId)
	end
}
NewResult = RoduxModule.Store.new(require(RobloxGui.Modules.InGameChat.BubbleChat.Reducers.chatReducer), nil, {
	RoduxModule.thunkMiddleware,
	function(Callback)
		-- upvalues: config (copy)
		return function(p1)
			-- upvalues: config (upval), Callback (copy)
			local Entry: (any) -> () = config[p1.type]
			
			if Entry then
				Entry(p1)
			end
			Callback(p1)
		end
	end
})
local Connection = nil

local function _(): boolean
	-- upvalues: GetFFlagExpChatAlwaysRunTCSFunction (copy), TextChatService (copy)
	return if GetFFlagExpChatAlwaysRunTCSFunction() then true else TextChatService.ChatVersion == Enum.ChatVersion.TextChatService
end

if game:IsLoaded() and (if GetFFlagExpChatAlwaysRunTCSFunction() then true else TextChatService.ChatVersion == Enum.ChatVersion.TextChatService) then return end
Connection = game.Loaded:Connect(function()
	-- upvalues: Connection (ref)
	if game:IsLoaded() then
		Connection:Disconnect()
	end
end)

local function validateMessageWithWarning(p1, Message)
	-- upvalues: ValidateMessageModule (copy), ConstantsModule (copy)
	local ValidateMessageModuleResult, ValidateMessageModuleResult2 = ValidateMessageModule(Message)
	
	if not ValidateMessageModuleResult then
		if ValidateMessageModuleResult2 then
			warn(("Message text %q is too long for chat event %q (expected a message of length %i, got %i)"):format(Message, p1, ConstantsModule.MAX_MESSAGE_LENGTH, ValidateMessageModuleResult2))
			
			return ValidateMessageModuleResult
		end
		warn(("Message text %q sent to chat event %q is not a valid UTF-8 characters sequence"):format(Message, p1))
	end
	return ValidateMessageModuleResult
end

local _ = function(p1, p2)
	-- upvalues: TypesModule (copy)
	local IMessageDataResult, IMessageDataResult2 = TypesModule.IMessageData(p2)
	
	if not IMessageDataResult then
		warn(("Malformed message data sent to chat event %q. If you have modified the chat system, check what you are firing to this event"):format(p1))
		warn(IMessageDataResult2)
	end
	return IMessageDataResult
end

local Connection1 = nil
local Connection2 = nil
local ChattedConnection = nil
local Connection3 = nil
local Connection4 = nil
local Count = 0
local Count1 = 0
local UserIds = {}

local function initBubbleChat()
	-- upvalues: ReplicatedStorage (copy), Connection1 (ref), TypesModule (copy), Players (copy), validateMessageWithWarning (copy), NewResult (ref), AddMessageFromEventModule (copy), Connection2 (ref), SetMessageTextModule (copy), GetPlayerFromPartModule (copy), UserIds (copy), Count (ref), GameTranslatorModule (copy), CoreGui (copy), AddMessageWithTimeoutModule (copy), Count1 (ref), ChattedConnection (ref), Chat (copy)
	coroutine.resume(coroutine.create(function()
		-- upvalues: ReplicatedStorage (upval), Connection1 (upval), TypesModule (upval), Players (upval), validateMessageWithWarning (upval), NewResult (upval), AddMessageFromEventModule (upval), Connection2 (upval), SetMessageTextModule (upval)
		local DefaultChatSystemChatEvents = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents", 1e999)
		Connection1 = DefaultChatSystemChatEvents:WaitForChild("OnNewMessage", 1e999).OnClientEvent:Connect(function(Tbl)
			-- upvalues: TypesModule (upval), Players (upval), validateMessageWithWarning (upval), NewResult (upval), AddMessageFromEventModule (upval)
			local IMessageDataResult, IMessageDataResult2 = TypesModule.IMessageData(Tbl)
			
			if not IMessageDataResult then
				warn(("Malformed message data sent to chat event %q. If you have modified the chat system, check what you are firing to this event"):format("OnNewMessage"))
				warn(IMessageDataResult2)
			end
			if not IMessageDataResult then return end
			if Tbl.FromSpeaker == Players.LocalPlayer.Name then
				if not validateMessageWithWarning("OnNewMessage", Tbl.Message) then return end
				local Copy = table.clone(Tbl)
				Copy.Time = workspace:GetServerTimeNow() * 1000
				NewResult:dispatch(AddMessageFromEventModule(Copy))
			end
		end)
		Connection2 = DefaultChatSystemChatEvents:WaitForChild("OnMessageDoneFiltering", 1e999).OnClientEvent:Connect(function(Tbl)
			-- upvalues: TypesModule (upval), validateMessageWithWarning (upval), NewResult (upval), SetMessageTextModule (upval), AddMessageFromEventModule (upval)
			local IMessageDataResult, IMessageDataResult2 = TypesModule.IMessageData(Tbl)
			
			if not IMessageDataResult then
				warn(("Malformed message data sent to chat event %q. If you have modified the chat system, check what you are firing to this event"):format("OnMessageDoneFiltering"))
				warn(IMessageDataResult2)
			end
			if not IMessageDataResult or not validateMessageWithWarning("OnMessageDoneFiltering", Tbl.Message) then return end
			local Text = tostring(Tbl.ID)
			
			if NewResult:getState().messages[Text] then
				NewResult:dispatch(SetMessageTextModule(Text, Tbl.Message))
				
				return
			else
				local Copy = table.clone(Tbl)
				Copy.Time = workspace:GetServerTimeNow() * 1000
				NewResult:dispatch(AddMessageFromEventModule(Copy))
			end
		end)
	end))
	
	local function addMessageWithId(Model: Model, p1, Count1)
		-- upvalues: GetPlayerFromPartModule (upval), UserIds (upval), Count (upval), GameTranslatorModule (upval), CoreGui (upval), NewResult (upval), AddMessageWithTimeoutModule (upval)
		local PrimaryPart = if Model:IsA("Model") then if Model.PrimaryPart then Model.PrimaryPart else Model:FindFirstChildWhichIsA("BasePart", true) else Model
		local PlayerFromPartModule = if PrimaryPart then GetPlayerFromPartModule(PrimaryPart) else nil
		local Text = nil
		
		if PlayerFromPartModule then
			Text = tostring(PlayerFromPartModule.UserId)
		else
			local UserId = UserIds[Model]
			
			if UserId then
				Text = UserId
			else
				Count += 1
				Text = "adornee_" .. Count
				UserIds[Model] = Text
			end
		end
		NewResult:dispatch(AddMessageWithTimeoutModule({
			id = "chatted_" .. Count1,
			userId = Text,
			name = Model.Name,
			text = GameTranslatorModule:TranslateGameText(CoreGui, p1),
			timestamp = os.time(),
			adornee = Model
		}))
	end
	
	ChattedConnection = Chat.Chatted:Connect(function(Message, Recipient)
		-- upvalues: Count1 (upval), addMessageWithId (copy)
		Count1 += 1
		addMessageWithId(Message, Recipient, Count1)
	end)
end

local function destroyBubbleChat()
	-- upvalues: Connection1 (ref), Connection2 (ref), ChattedConnection (ref), Connection4 (ref), Connection3 (ref)
	if Connection1 then
		Connection1:Disconnect()
		Connection1 = nil
	end
	if Connection2 then
		Connection2:Disconnect()
		Connection2 = nil
	end
	if ChattedConnection then
		ChattedConnection:Disconnect()
		ChattedConnection = nil
	end
	if Connection4 then
		Connection4:Disconnect()
		Connection4 = nil
	end
	if Connection3 then
		Connection3:Disconnect()
		Connection3 = nil
	end
end

local function onBubbleChatEnabledChanged()
	-- upvalues: destroyBubbleChat (copy), Chat (copy), initBubbleChat (copy), NewResult (ref), BubbleChatEnabledChangedModule (copy)
	destroyBubbleChat()
	local Inverted = not game:GetEngineFeature("EnableBubbleChatFromChatService") or Chat.BubbleChatEnabled
	
	if Inverted then
		initBubbleChat()
	end
	NewResult:dispatch(BubbleChatEnabledChangedModule(Inverted))
end

local t = {}

local function setVoiceEnabled(VoiceChatState)
	-- upvalues: Players (copy), NewResult (ref), VoiceEnabledChangedModule (copy), t (ref), v1 (copy), VoiceStateChangedModule (copy), ConstantsModule (copy), GetFFlagLocalMutedNilFix (copy), Default (copy)
	local Text = tostring(Players.LocalPlayer.UserId)
	NewResult:dispatch(VoiceEnabledChangedModule(VoiceChatState ~= Enum.VoiceChatState.Ended))
	
	if t[VoiceChatState] then
		NewResult:dispatch(VoiceStateChangedModule(Text, t[VoiceChatState]))
	else
		v1:warning("LOCAL_STATE_MAP does not exist for {} state", VoiceChatState)
		NewResult:dispatch(VoiceStateChangedModule(Text, ConstantsModule.VOICE_STATE.MUTED))
	end
	if VoiceChatState == Enum.VoiceChatState.Failed then
		for _, player in pairs(Players:GetPlayers()) do
			local Text1 = tostring(player.UserId)
			
			if player ~= Players.LocalPlayer then
				NewResult:dispatch(VoiceStateChangedModule(Text1, ConstantsModule.VOICE_STATE.HIDDEN))
			end
		end
		return
	elseif VoiceChatState == Enum.VoiceChatState.Joined and (if GetFFlagLocalMutedNilFix then Default.localMuted == false else not Default.localMuted) then
		NewResult:dispatch(VoiceStateChangedModule(Text, ConstantsModule.VOICE_STATE.INACTIVE))
	end
end

local _ = function(p1): string
	return "..." .. string.sub(tostring(p1), -4)
end

local function initVoiceChat()
	-- upvalues: GetFFlagEnableVoiceChatVoiceUISyncModule (copy), InitVoiceChatStoreModule (copy), NewResult (ref), v1 (copy), Default (copy), t (ref), ConstantsModule (copy), Players (copy), ParticipantAddedModule (copy), PlayerRemovedModule (copy), ParticipantRemovedModule (copy), VoiceStateChangedModule (copy), GetFFlagBatchVoiceParticipantsUpdatesFunction (copy), ParticipantsChangedModule (copy), BlockingUtilityModule (copy), setVoiceEnabled (copy)
	if GetFFlagEnableVoiceChatVoiceUISyncModule() then
		InitVoiceChatStoreModule(NewResult)
		
		return
	end
	v1:debug("Initializing VoiceChatService connections")
	local Service = Default:getService()
	
	if not Service then
		v1:debug("VoiceChatService is not available")
		
		return
	end
	if not Enum.VoiceChatState then
		v1:error("Enum.VoiceChatState does not exist but voice is enabled")
		
		return
	end
	t = {
		[Enum.VoiceChatState.Idle] = ConstantsModule.VOICE_STATE.HIDDEN,
		[Enum.VoiceChatState.Joining] = ConstantsModule.VOICE_STATE.CONNECTING,
		[Enum.VoiceChatState.JoiningRetry] = ConstantsModule.VOICE_STATE.CONNECTING,
		[Enum.VoiceChatState.Joined] = ConstantsModule.VOICE_STATE.MUTED,
		[Enum.VoiceChatState.Leaving] = ConstantsModule.VOICE_STATE.MUTED,
		[Enum.VoiceChatState.Ended] = ConstantsModule.VOICE_STATE.HIDDEN,
		[Enum.VoiceChatState.Failed] = ConstantsModule.VOICE_STATE.ERROR
	}
	local UserId = Players.LocalPlayer.UserId
	
	for _, player in pairs(Players:GetPlayers()) do
		v1:trace("Adding existing player {}", "..." .. string.sub(tostring(player.UserId), -4))
		NewResult:dispatch(ParticipantAddedModule((tostring(player.UserId))))
	end
	Players.PlayerAdded:Connect(function(Player)
		-- upvalues: v1 (upval), NewResult (upval), ParticipantAddedModule (upval)
		v1:trace("Adding joining player {}", "..." .. string.sub(tostring(Player.UserId), -4))
		NewResult:dispatch(ParticipantAddedModule((tostring(Player.userId))))
	end)
	Players.PlayerRemoving:Connect(function(Player)
		-- upvalues: v1 (upval), NewResult (upval), PlayerRemovedModule (upval), ParticipantRemovedModule (upval)
		v1:trace("Removing player {}", "..." .. string.sub(tostring(Player.UserId), -4))
		NewResult:dispatch(PlayerRemovedModule((tostring(Player.userId))))
		NewResult:dispatch(ParticipantRemovedModule((tostring(Player.userId))))
	end)
	NewResult:dispatch(VoiceStateChangedModule(UserId, ConstantsModule.VOICE_STATE.HIDDEN))
	Default.muteChanged.Event:connect(function(p1)
		-- upvalues: v1 (upval), ConstantsModule (upval), NewResult (upval), VoiceStateChangedModule (upval), UserId (copy)
		v1:debug("Mute changed to {}", p1)
		NewResult:dispatch(VoiceStateChangedModule(UserId, p1 and ConstantsModule.VOICE_STATE.MUTED or ConstantsModule.VOICE_STATE.INACTIVE))
	end)
	Default.participantsUpdate.Event:Connect(function(List)
		-- upvalues: GetFFlagBatchVoiceParticipantsUpdatesFunction (upval), NewResult (upval), ParticipantsChangedModule (upval), ConstantsModule (upval), v1 (upval), VoiceStateChangedModule (upval)
		if GetFFlagBatchVoiceParticipantsUpdatesFunction() then
			NewResult:dispatch(ParticipantsChangedModule(List))
			
			return
		end
		for i, value in pairs(List) do
			local LOCALMUTED = if value.subscriptionCompleted then if value.isMutedLocally then ConstantsModule.VOICE_STATE.LOCAL_MUTED elseif value.isMuted then ConstantsModule.VOICE_STATE.MUTED elseif value.isSignalActive then ConstantsModule.VOICE_STATE.TALKING else ConstantsModule.VOICE_STATE.INACTIVE else ConstantsModule.VOICE_STATE.CONNECTING
			v1:trace("Participant update for {}, voice state {}", "..." .. string.sub(tostring(i), -4), LOCALMUTED)
			NewResult:dispatch(VoiceStateChangedModule(i, LOCALMUTED))
		end
	end)
	Default.talkingChanged.Event:Connect(function(p1)
		-- upvalues: NewResult (upval), VoiceStateChangedModule (upval), UserId (copy), ConstantsModule (upval)
		if p1 then
			NewResult:dispatch(VoiceStateChangedModule(UserId, ConstantsModule.VOICE_STATE.TALKING))
			
			return
		else
			NewResult:dispatch(VoiceStateChangedModule(UserId, ConstantsModule.VOICE_STATE.INACTIVE))
		end
	end)
	BlockingUtilityModule:GetBlockedStatusChangedEvent():Connect(function(p1, p2)
		-- upvalues: NewResult (upval), ParticipantRemovedModule (upval), ParticipantAddedModule (upval)
		if p2 then
			NewResult:dispatch(ParticipantRemovedModule((tostring(p1))))
			
			return
		else
			NewResult:dispatch(ParticipantAddedModule((tostring(p1))))
		end
	end)
	v1:debug("Initial voice state is {}", Service.VoiceChatState)
	setVoiceEnabled(Service.VoiceChatState)
	Service.StateChanged:Connect(function(_, NewState)
		-- upvalues: v1 (upval), setVoiceEnabled (upval)
		v1:debug("Voice state changed to {}", NewState)
		setVoiceEnabled(NewState)
	end)
end

if game:GetEngineFeature("EnableBubbleChatFromChatService") then
	Chat:GetPropertyChangedSignal("BubbleChatEnabled"):Connect(onBubbleChatEnabledChanged)
end
destroyBubbleChat()
local Inverted = not game:GetEngineFeature("EnableBubbleChatFromChatService") or Chat.BubbleChatEnabled

if Inverted then
	initBubbleChat()
end
NewResult:dispatch(BubbleChatEnabledChangedModule(Inverted))

if game:GetEngineFeature("BubbleChatSettingsApi") then
	Chat.BubbleChatSettingsChanged:Connect(function(Settings)
		-- upvalues: TypesModule (copy), FFlagExpChatUseChatConfigStore (copy), ExpChatModule (copy), NewResult (ref), UpdateChatSettingsModule (copy)
		local IChatSettingsResult, IChatSettingsResult2 = TypesModule.IChatSettings(Settings)
		assert(IChatSettingsResult, "Bad settings object passed to Chat:SetBubbleChatSettings:\n" .. (IChatSettingsResult2 or ""))
		
		if FFlagExpChatUseChatConfigStore then
			ExpChatModule.Stores.GetChatConfigurationStore(false).setBubbleChatSettings(Settings)
			
			return
		else
			NewResult:dispatch(UpdateChatSettingsModule(Settings))
		end
	end)
end
Default:asyncInit():andThen(initVoiceChat):catch(function()
	-- upvalues: v1 (copy)
	v1:debug("VoiceChatServiceManager failed to initialize")
end)