local HttpService = game:GetService("HttpService")
local CrossExperience = script:FindFirstAncestor("CrossExperience")
local DependenciesModule = require(CrossExperience.dependencies)
local _ = require(CrossExperience.Types)
local CommunicationModule = require(CrossExperience.Communication)
local ConstantsModule = require(CrossExperience.Constants)
local ActionsModule = require(CrossExperience.Actions)
local ModelsModule = require(CrossExperience.Models)
local UtilsModule = require(CrossExperience.Utils)
local EventQueueModule = require(CrossExperience.Utils.EventQueue)
local CreatePersistenceMiddlewareModule = require(CrossExperience.Middlewares.createPersistenceMiddleware)
local EnableCrossExpEventLogging = game:DefineFastFlag("EnableCrossExpEventLogging", false)
local SharedFlags = DependenciesModule.SharedFlags
local FFlagPartyVoiceBlockSync = SharedFlags.FFlagPartyVoiceBlockSync
local FFlagEnablePartyVoiceChangersInLua = SharedFlags.FFlagEnablePartyVoiceChangersInLua
local Cryo = DependenciesModule.Cryo
local _seq = 0
local Guid = HttpService:GenerateGUID(false)
local EventManager = {}
EventManager.__index = EventManager

function EventManager.new(ExperienceType, ExperienceType1)
	-- upvalues: EventQueueModule (copy), EventManager (copy)
	local config = {
		isSubscribed = false,
		observers = {},
		experienceType = ExperienceType,
		eventQueue = EventQueueModule.new(ExperienceType1)
	}
	setmetatable(config, EventManager)
	
	return config
end

local function _(p1)
	return {
		userId = tonumber(p1.userId) or -1,
		isLocalUser = p1.isLocalUser
	}
end

function EventManager:notify(p1, p2)
	-- upvalues: _seq (ref), Guid (copy), CommunicationModule (copy)
	if not p2 then
		p2 = {}
	end
	_seq += 1
	p2._seq = _seq
	p2._origin = Guid
	CommunicationModule.notify(p1, p2)
end

function EventManager:removeObserver(Id, Event)
	-- upvalues: CommunicationModule (copy)
	CommunicationModule.removeObserver(self.experienceType, Event, Id)
end

function EventManager:addObserver(Event, p1)
	-- upvalues: CommunicationModule (copy)
	table.insert(self.observers, {
		id = CommunicationModule.addObserver(self.experienceType, Event, function(p2)
			-- upvalues: self (copy), Event (copy), p1 (copy)
			self.eventQueue:process(Event, p2, p1)
		end),
		event = Event
	})
end

local PersistenceMiddlewareModule = CreatePersistenceMiddlewareModule({ storeKey = ConstantsModule.STORAGE_CEV_STORE_KEY })

function EventManager:subscribe(p1, p2)
	-- upvalues: EnableCrossExpEventLogging (copy), ConstantsModule (copy), ActionsModule (copy), Cryo (copy), ModelsModule (copy), FFlagEnablePartyVoiceChangersInLua (copy), FFlagPartyVoiceBlockSync (copy)
	if self.isSubscribed then return end
	self.isSubscribed = true
	
	if p2 and EnableCrossExpEventLogging then
		p2:info("{}: Subscribing to the CEV Store", self.experienceType)
	end
	self:addObserver(ConstantsModule.EVENTS.PARTY_VOICE_GAME_JOIN_FAILED, function(p3)
		-- upvalues: p2 (copy), EnableCrossExpEventLogging (upval), self (copy), p1 (copy), ActionsModule (upval), ConstantsModule (upval)
		if p2 and EnableCrossExpEventLogging then
			p2:info("{}: Experience Party Voice Game Join Failed: {}", self.experienceType, p3.state)
		end
		p1:dispatch(ActionsModule.VoiceStatusChanged({
			status = ConstantsModule.VOICE_STATUS.ERROR_RCC_CONNECTING
		}))
	end)
	self:addObserver(ConstantsModule.EVENTS.PARTY_VOICE_STATUS_CHANGED, function(p3)
		-- upvalues: p2 (copy), EnableCrossExpEventLogging (upval), self (copy), ConstantsModule (upval), p1 (copy), ActionsModule (upval)
		if p2 and EnableCrossExpEventLogging then
			p2:info("{}: Experience Voice Status Changed: {}, {}, {}, {}", self.experienceType, p3.status, p3.detail, p3.voiceChannelId, p3.voiceSessionId)
		end
		if p3.status == ConstantsModule.VOICE_STATUS.VOICE_CONNECTED then
			if not p3.voiceChannelId and p2 then
				p2:warning("Voice channel id is expected")
			end
			if not p3.voiceSessionId then
				p2:warning("Voice session id is expected")
			end
		end
		p1:dispatch(ActionsModule.VoiceStatusChanged({
			status = p3.status,
			voiceChannelId = p3.voiceChannelId,
			voiceSessionId = p3.voiceSessionId
		}))
	end)
	self:addObserver(ConstantsModule.EVENTS.PARTY_VOICE_EXPERIENCE_JOINED, function(JoinResult)
		-- upvalues: p2 (copy), EnableCrossExpEventLogging (upval), self (copy), Cryo (upval), p1 (copy), ActionsModule (upval)
		if p2 and EnableCrossExpEventLogging then
			p2:info("{}: Experience joined JobID: {}, GameID: {}, PlaceId: {}", self.experienceType, JoinResult.jobId, JoinResult.gameId, JoinResult.placeId)
		end
		local BackgroundStateSnapshot = self:getBackgroundStateSnapshot()
		local JoinResult1 = JoinResult
		
		if BackgroundStateSnapshot and BackgroundStateSnapshot.Participants then
			JoinResult1 = Cryo.Dictionary.join(JoinResult1, BackgroundStateSnapshot.Participants)
		end
		p1:dispatch(ActionsModule.ExperienceJoined(JoinResult1))
	end)
	self:addObserver(ConstantsModule.EVENTS.PARTY_VOICE_PARTICIPANT_AUDIO_FOCUS_CHANGED, function(p3)
		-- upvalues: p2 (copy), EnableCrossExpEventLogging (upval), self (copy), p1 (copy), ActionsModule (upval)
		if p2 and EnableCrossExpEventLogging then
			p2:info("{}: Participant Audio Focus Changed {} = {}", self.experienceType, p3.userId, p3.contextId)
		end
		p1:dispatch(ActionsModule.ParticipantAudioFocusChanged({
			userId = p3.userId,
			contextId = p3.contextId,
			contextIds = p3.contextIds
		}))
	end)
	self:addObserver(ConstantsModule.EVENTS.PARTY_VOICE_PARTICIPANT_ADDED, function(p3)
		-- upvalues: p2 (copy), EnableCrossExpEventLogging (upval), self (copy), ModelsModule (upval), FFlagEnablePartyVoiceChangersInLua (upval), p1 (copy), ActionsModule (upval)
		if p2 and EnableCrossExpEventLogging then
			p2:info("{}: Participant added {}", self.experienceType, p3.userId)
		end
		p1:dispatch(ActionsModule.ParticipantAdded((ModelsModule.ParticipantModel.format({
			isActive = false,
			isMuted = false,
			isMutedLocally = false,
			userId = p3.userId,
			isLocalUser = p3.isLocalUser,
			username = p3.username,
			displayname = p3.displayname,
			isVoiceChangerActive = not FFlagEnablePartyVoiceChangersInLua and nil,
			isVoiceChangerHearMyselfActive = not FFlagEnablePartyVoiceChangersInLua and nil,
			selectedVoicePack = if FFlagEnablePartyVoiceChangersInLua then p3.selectedVoicePack else nil
		}))))
	end)
	self:addObserver(ConstantsModule.EVENTS.PARTY_VOICE_PARTICIPANT_REMOVED, function(p3)
		-- upvalues: p2 (copy), EnableCrossExpEventLogging (upval), self (copy), p1 (copy), ActionsModule (upval)
		if p2 and EnableCrossExpEventLogging then
			p2:info("{}: Participant removed {}", self.experienceType, p3.userId)
		end
		p1:dispatch(ActionsModule.ParticipantRemoved({
			userId = tonumber(p3.userId) or -1,
			isLocalUser = p3.isLocalUser
		}))
	end)
	self:addObserver(ConstantsModule.EVENTS.PARTY_VOICE_PARTICIPANT_IS_ACTIVE, function(p3)
		-- upvalues: p2 (copy), EnableCrossExpEventLogging (upval), self (copy), p1 (copy), ActionsModule (upval)
		if p2 and EnableCrossExpEventLogging then
			p2:info("{}: Participant is active {}", self.experienceType, p3.userId)
		end
		p1:dispatch(ActionsModule.ParticipantIsActive({
			userId = tonumber(p3.userId) or -1,
			isLocalUser = p3.isLocalUser
		}))
	end)
	self:addObserver(ConstantsModule.EVENTS.PARTY_VOICE_PARTICIPANT_IS_INACTIVE, function(p3)
		-- upvalues: p2 (copy), EnableCrossExpEventLogging (upval), self (copy), p1 (copy), ActionsModule (upval)
		if p2 and EnableCrossExpEventLogging then
			p2:info("{}: Participant is inactive {}", self.experienceType, p3.userId)
		end
		p1:dispatch(ActionsModule.ParticipantIsInactive({
			userId = tonumber(p3.userId) or -1,
			isLocalUser = p3.isLocalUser
		}))
	end)
	self:addObserver(ConstantsModule.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_MUTED, function(p3)
		-- upvalues: p2 (copy), EnableCrossExpEventLogging (upval), self (copy), p1 (copy), ActionsModule (upval)
		if p2 and EnableCrossExpEventLogging then
			p2:info("{}: Participant is was muted {}", self.experienceType, p3.userId)
		end
		p1:dispatch(ActionsModule.ParticipantWasMuted({
			userId = tonumber(p3.userId) or -1,
			isLocalUser = p3.isLocalUser
		}))
	end)
	self:addObserver(ConstantsModule.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_UNMUTED, function(p3)
		-- upvalues: p2 (copy), EnableCrossExpEventLogging (upval), self (copy), p1 (copy), ActionsModule (upval)
		if p2 and EnableCrossExpEventLogging then
			p2:info("{}: Participant is was unmuted {}", self.experienceType, p3.userId)
		end
		p1:dispatch(ActionsModule.ParticipantWasUnmuted({
			userId = tonumber(p3.userId) or -1,
			isLocalUser = p3.isLocalUser
		}))
	end)
	
	if FFlagEnablePartyVoiceChangersInLua then
		self:addObserver(ConstantsModule.EVENTS.PARTY_VOICE_CHANGER_WAS_ENABLED, function(p3)
			-- upvalues: p2 (copy), EnableCrossExpEventLogging (upval), self (copy), p1 (copy), ActionsModule (upval)
			if p2 and EnableCrossExpEventLogging then
				p2:info("{}: Participant voice changer was enabled {}", self.experienceType, p3.userId)
			end
			p1:dispatch(ActionsModule.VoiceChangerWasEnabled({
				userId = tonumber(p3.userId) or -1,
				isLocalUser = p3.isLocalUser
			}))
		end)
		self:addObserver(ConstantsModule.EVENTS.PARTY_VOICE_CHANGER_WAS_DISABLED, function(p3)
			-- upvalues: p2 (copy), EnableCrossExpEventLogging (upval), self (copy), p1 (copy), ActionsModule (upval)
			if p2 and EnableCrossExpEventLogging then
				p2:info("{}: Participant voice changer was disabled {}", self.experienceType, p3.userId)
			end
			p1:dispatch(ActionsModule.VoiceChangerWasDisabled({
				userId = tonumber(p3.userId) or -1,
				isLocalUser = p3.isLocalUser
			}))
		end)
		self:addObserver(ConstantsModule.EVENTS.PARTY_VOICE_PACK_WAS_SET, function(p3)
			-- upvalues: p2 (copy), EnableCrossExpEventLogging (upval), self (copy), p1 (copy), ActionsModule (upval)
			if p2 and EnableCrossExpEventLogging then
				p2:info("{}: Participant {} voice pack was set to {}", self.experienceType, p3.userId, p3.voicePackName)
			end
			p1:dispatch(ActionsModule.VoicePackWasSet({
				userId = tonumber(p3.userId) or -1,
				isLocalUser = p3.isLocalUser,
				voicePackName = p3.voicePackName
			}))
		end)
		self:addObserver(ConstantsModule.EVENTS.PARTY_VOICE_CHANGER_FEEDBACK_WAS_ENABLED, function(p3)
			-- upvalues: p2 (copy), EnableCrossExpEventLogging (upval), self (copy), p1 (copy), ActionsModule (upval)
			if p2 and EnableCrossExpEventLogging then
				p2:info("{}: Participant voice changer feedback was enabled {}", self.experienceType, p3.userId)
			end
			p1:dispatch(ActionsModule.VoiceChangerFeedbackWasEnabled({
				userId = tonumber(p3.userId) or -1,
				isLocalUser = p3.isLocalUser
			}))
		end)
		self:addObserver(ConstantsModule.EVENTS.PARTY_VOICE_CHANGER_FEEDBACK_WAS_DISABLED, function(p3)
			-- upvalues: p2 (copy), EnableCrossExpEventLogging (upval), self (copy), p1 (copy), ActionsModule (upval)
			if p2 and EnableCrossExpEventLogging then
				p2:info("{}: Participant voice changer feedback was disabled {}", self.experienceType, p3.userId)
			end
			p1:dispatch(ActionsModule.VoiceChangerFeedbackWasDisabled({
				userId = tonumber(p3.userId) or -1,
				isLocalUser = p3.isLocalUser
			}))
		end)
	end
	self:addObserver(ConstantsModule.EVENTS.MUTE_PARTY_VOICE_PARTICIPANT, function(p3)
		-- upvalues: p2 (copy), EnableCrossExpEventLogging (upval), self (copy), p1 (copy), ActionsModule (upval)
		if p2 and EnableCrossExpEventLogging then
			p2:info("{}: Participant is muted locally {}", self.experienceType, p3.userId)
		end
		p1:dispatch(ActionsModule.MuteParticipant({
			userId = tonumber(p3.userId) or -1,
			isLocalUser = p3.isLocalUser
		}))
	end)
	self:addObserver(ConstantsModule.EVENTS.UNMUTE_PARTY_VOICE_PARTICIPANT, function(p3)
		-- upvalues: p2 (copy), EnableCrossExpEventLogging (upval), self (copy), p1 (copy), ActionsModule (upval)
		if p2 and EnableCrossExpEventLogging then
			p2:info("{}: Participant is unmuted locally {}", self.experienceType, p3.userId)
		end
		p1:dispatch(ActionsModule.UnmuteParticipant({
			userId = tonumber(p3.userId) or -1,
			isLocalUser = p3.isLocalUser
		}))
	end)
	
	if FFlagPartyVoiceBlockSync then
		self:addObserver(ConstantsModule.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, function(p3)
			-- upvalues: p2 (copy), EnableCrossExpEventLogging (upval), self (copy)
			if p2 and EnableCrossExpEventLogging then
				p2:info("{}: Participant was blocked {} from party voice", self.experienceType, p3.userId)
			end
		end)
		self:addObserver(ConstantsModule.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, function(p3)
			-- upvalues: p2 (copy), EnableCrossExpEventLogging (upval), self (copy)
			if p2 and EnableCrossExpEventLogging then
				p2:info("{}: Participant was unblocked {} from party voice", self.experienceType, p3.userId)
			end
		end)
	end
end

function EventManager:getBackgroundStateSnapshot()
	-- upvalues: PersistenceMiddlewareModule (copy), UtilsModule (copy)
	local RestoreResult = PersistenceMiddlewareModule.restore()
	
	return if RestoreResult and RestoreResult.Squad and RestoreResult.Squad.CrossExperienceVoice then {
		Experience = RestoreResult.Squad.CrossExperienceVoice.Experience,
		Participants = {
			participants = UtilsModule.stringMapToNumberMap(RestoreResult.Squad.CrossExperienceVoice.Participants.participants),
			activeUserIds = RestoreResult.Squad.CrossExperienceVoice.Participants.activeUserIds,
			publicVoiceFocusedUserIds = UtilsModule.stringMapToNumberMap(RestoreResult.Squad.CrossExperienceVoice.Participants.publicVoiceFocusedUserIds)
		}
	} else nil
end

function EventManager:restoreStateFromBackground(p1, p2)
	-- upvalues: EnableCrossExpEventLogging (copy), HttpService (copy), ActionsModule (copy)
	local BackgroundStateSnapshot = self:getBackgroundStateSnapshot()
	
	if BackgroundStateSnapshot then
		if p2 and EnableCrossExpEventLogging then
			p2:info("{}: Restoring state from background {}", self.experienceType, HttpService:JSONEncode(BackgroundStateSnapshot))
		end
		p1:dispatch(ActionsModule.RestoreState(BackgroundStateSnapshot))
	end
end

function EventManager:unsubscribe(p1, p2)
	-- upvalues: EnableCrossExpEventLogging (copy), ActionsModule (copy)
	if p2 and EnableCrossExpEventLogging then
		p2:info("{}: Unsubscribing from the CEV Store", self.experienceType)
	end
	p1:dispatch(ActionsModule.ExperienceLeft())
	
	for _, observer in ipairs(self.observers) do
		self:removeObserver(observer.id, observer.event)
	end
	self.isSubscribed = false
	self.observers = {}
	self.eventQueue:reset()
end

return EventManager