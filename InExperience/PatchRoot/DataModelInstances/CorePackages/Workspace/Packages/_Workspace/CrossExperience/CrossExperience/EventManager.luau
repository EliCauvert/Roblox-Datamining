local httpService = game:GetService("HttpService")
local crossExperience = script:FindFirstAncestor("CrossExperience")
local dependenciesModule = require(crossExperience.dependencies)
local _ = require(crossExperience.Types)
local communicationModule = require(crossExperience.Communication)
local constantsModule = require(crossExperience.Constants)
local actionsModule = require(crossExperience.Actions)
local modelsModule = require(crossExperience.Models)
local utilsModule = require(crossExperience.Utils)
local eventQueueModule = require(crossExperience.Utils.EventQueue)
local createPersistenceMiddlewareModule = require(crossExperience.Middlewares.createPersistenceMiddleware)
local enableCrossExpEventLogging = game:DefineFastFlag("EnableCrossExpEventLogging", false)
local sharedFlags = dependenciesModule.SharedFlags
local fFlagPartyVoiceBlockSync = sharedFlags.FFlagPartyVoiceBlockSync
local fFlagEnablePartyVoiceChangersInLua = sharedFlags.FFlagEnablePartyVoiceChangersInLua
local cryo = dependenciesModule.Cryo
local var1 = 0
local var2 = httpService:GenerateGUID(false)
local t = {}
t.__index = t

function t.new(p1, p2)
	-- upvalues: eventQueueModule (ref), t (ref)
	local t_1 = {
		isSubscribed = false,
		observers = {},
		experienceType = p1,
		eventQueue = eventQueueModule.new(p2)
	}
	setmetatable(t_1, t)
	
	return t_1
end

local _ = function(p1)
	return {
		userId = tonumber(p1.userId) or -1,
		isLocalUser = p1.isLocalUser
	}
end

function t.notify(_, p1, p2)
	-- upvalues: var1 (write), var2 (ref), communicationModule (ref)
	if not p2 then
		p2 = {}
	end
	var1 += 1
	p2._seq = var1
	p2._origin = var2
	communicationModule.notify(p1, p2)
end

function t:removeObserver(p1, p2)
	-- upvalues: communicationModule (ref)
	communicationModule.removeObserver(self.experienceType, p2, p1)
end

function t:addObserver(p1, p2)
	-- upvalues: communicationModule (ref)
	table.insert(self.observers, {
		id = communicationModule.addObserver(self.experienceType, p1, function(p3)
			-- upvalues: self (ref), p1 (ref), p2 (ref)
			self.eventQueue:process(p1, p3, p2)
		end),
		event = p1
	})
end

local var3 = createPersistenceMiddlewareModule({ storeKey = constantsModule.STORAGE_CEV_STORE_KEY })

function t:subscribe(p1, p2)
	-- upvalues: enableCrossExpEventLogging (ref), constantsModule (ref), actionsModule (ref), cryo (ref), modelsModule (ref), fFlagEnablePartyVoiceChangersInLua (ref), fFlagPartyVoiceBlockSync (ref)
	if self.isSubscribed then return end
	self.isSubscribed = true
	
	if p2 and enableCrossExpEventLogging then
		p2:info("{}: Subscribing to the CEV Store", self.experienceType)
	end
	self:addObserver(constantsModule.EVENTS.PARTY_VOICE_GAME_JOIN_FAILED, function(p3)
		-- upvalues: p2 (ref), enableCrossExpEventLogging (copy), self (ref), p1 (ref), actionsModule (copy), constantsModule (copy)
		if p2 and enableCrossExpEventLogging then
			p2:info("{}: Experience Party Voice Game Join Failed: {}", self.experienceType, p3.state)
		end
		p1:dispatch(actionsModule.VoiceStatusChanged({
			status = constantsModule.VOICE_STATUS.ERROR_RCC_CONNECTING
		}))
	end)
	self:addObserver(constantsModule.EVENTS.PARTY_VOICE_STATUS_CHANGED, function(p3)
		-- upvalues: p2 (ref), enableCrossExpEventLogging (copy), self (ref), constantsModule (copy), p1 (ref), actionsModule (copy)
		if p2 and enableCrossExpEventLogging then
			p2:info("{}: Experience Voice Status Changed: {}, {}, {}, {}", self.experienceType, p3.status, p3.detail, p3.voiceChannelId, p3.voiceSessionId)
		end
		if p3.status == constantsModule.VOICE_STATUS.VOICE_CONNECTED then
			if not p3.voiceChannelId and p2 then
				p2:warning("Voice channel id is expected")
			end
			if not p3.voiceSessionId then
				p2:warning("Voice session id is expected")
			end
		end
		p1:dispatch(actionsModule.VoiceStatusChanged({
			status = p3.status,
			voiceChannelId = p3.voiceChannelId,
			voiceSessionId = p3.voiceSessionId
		}))
	end)
	self:addObserver(constantsModule.EVENTS.PARTY_VOICE_EXPERIENCE_JOINED, function(p3)
		-- upvalues: p2 (ref), enableCrossExpEventLogging (copy), self (ref), cryo (copy), p1 (ref), actionsModule (copy)
		if p2 and enableCrossExpEventLogging then
			p2:info("{}: Experience joined JobID: {}, GameID: {}, PlaceId: {}", self.experienceType, p3.jobId, p3.gameId, p3.placeId)
		end
		local backgroundStateSnapshot = self:getBackgroundStateSnapshot()
		local var4 = p3
		
		if backgroundStateSnapshot and backgroundStateSnapshot.Participants then
			var4 = cryo.Dictionary.join(var4, backgroundStateSnapshot.Participants)
		end
		p1:dispatch(actionsModule.ExperienceJoined(var4))
	end)
	self:addObserver(constantsModule.EVENTS.PARTY_VOICE_PARTICIPANT_AUDIO_FOCUS_CHANGED, function(p3)
		-- upvalues: p2 (ref), enableCrossExpEventLogging (copy), self (ref), p1 (ref), actionsModule (copy)
		if p2 and enableCrossExpEventLogging then
			p2:info("{}: Participant Audio Focus Changed {} = {}", self.experienceType, p3.userId, p3.contextId)
		end
		p1:dispatch(actionsModule.ParticipantAudioFocusChanged({
			userId = p3.userId,
			contextId = p3.contextId,
			contextIds = p3.contextIds
		}))
	end)
	self:addObserver(constantsModule.EVENTS.PARTY_VOICE_PARTICIPANT_ADDED, function(p3)
		-- upvalues: p2 (ref), enableCrossExpEventLogging (copy), self (ref), modelsModule (copy), fFlagEnablePartyVoiceChangersInLua (copy), p1 (ref), actionsModule (copy)
		if p2 and enableCrossExpEventLogging then
			p2:info("{}: Participant added {}", self.experienceType, p3.userId)
		end
		p1:dispatch(actionsModule.ParticipantAdded(modelsModule.ParticipantModel.format({
			isActive = false,
			isMuted = false,
			isMutedLocally = false,
			userId = p3.userId,
			isLocalUser = p3.isLocalUser,
			username = p3.username,
			displayname = p3.displayname,
			isVoiceChangerActive = if fFlagEnablePartyVoiceChangersInLua then false else nil,
			isVoiceChangerHearMyselfActive = if fFlagEnablePartyVoiceChangersInLua then false else nil,
			selectedVoicePack = if fFlagEnablePartyVoiceChangersInLua then p3.selectedVoicePack else nil
		})))
	end)
	self:addObserver(constantsModule.EVENTS.PARTY_VOICE_PARTICIPANT_REMOVED, function(p3)
		-- upvalues: p2 (ref), enableCrossExpEventLogging (copy), self (ref), p1 (ref), actionsModule (copy)
		if p2 and enableCrossExpEventLogging then
			p2:info("{}: Participant removed {}", self.experienceType, p3.userId)
		end
		p1:dispatch(actionsModule.ParticipantRemoved({
			userId = tonumber(p3.userId) or -1,
			isLocalUser = p3.isLocalUser
		}))
	end)
	self:addObserver(constantsModule.EVENTS.PARTY_VOICE_PARTICIPANT_IS_ACTIVE, function(p3)
		-- upvalues: p2 (ref), enableCrossExpEventLogging (copy), self (ref), p1 (ref), actionsModule (copy)
		if p2 and enableCrossExpEventLogging then
			p2:info("{}: Participant is active {}", self.experienceType, p3.userId)
		end
		p1:dispatch(actionsModule.ParticipantIsActive({
			userId = tonumber(p3.userId) or -1,
			isLocalUser = p3.isLocalUser
		}))
	end)
	self:addObserver(constantsModule.EVENTS.PARTY_VOICE_PARTICIPANT_IS_INACTIVE, function(p3)
		-- upvalues: p2 (ref), enableCrossExpEventLogging (copy), self (ref), p1 (ref), actionsModule (copy)
		if p2 and enableCrossExpEventLogging then
			p2:info("{}: Participant is inactive {}", self.experienceType, p3.userId)
		end
		p1:dispatch(actionsModule.ParticipantIsInactive({
			userId = tonumber(p3.userId) or -1,
			isLocalUser = p3.isLocalUser
		}))
	end)
	self:addObserver(constantsModule.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_MUTED, function(p3)
		-- upvalues: p2 (ref), enableCrossExpEventLogging (copy), self (ref), p1 (ref), actionsModule (copy)
		if p2 and enableCrossExpEventLogging then
			p2:info("{}: Participant is was muted {}", self.experienceType, p3.userId)
		end
		p1:dispatch(actionsModule.ParticipantWasMuted({
			userId = tonumber(p3.userId) or -1,
			isLocalUser = p3.isLocalUser
		}))
	end)
	self:addObserver(constantsModule.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_UNMUTED, function(p3)
		-- upvalues: p2 (ref), enableCrossExpEventLogging (copy), self (ref), p1 (ref), actionsModule (copy)
		if p2 and enableCrossExpEventLogging then
			p2:info("{}: Participant is was unmuted {}", self.experienceType, p3.userId)
		end
		p1:dispatch(actionsModule.ParticipantWasUnmuted({
			userId = tonumber(p3.userId) or -1,
			isLocalUser = p3.isLocalUser
		}))
	end)
	
	if fFlagEnablePartyVoiceChangersInLua then
		self:addObserver(constantsModule.EVENTS.PARTY_VOICE_CHANGER_WAS_ENABLED, function(p3)
			-- upvalues: p2 (ref), enableCrossExpEventLogging (copy), self (ref), p1 (ref), actionsModule (copy)
			if p2 and enableCrossExpEventLogging then
				p2:info("{}: Participant voice changer was enabled {}", self.experienceType, p3.userId)
			end
			p1:dispatch(actionsModule.VoiceChangerWasEnabled({
				userId = tonumber(p3.userId) or -1,
				isLocalUser = p3.isLocalUser
			}))
		end)
		self:addObserver(constantsModule.EVENTS.PARTY_VOICE_CHANGER_WAS_DISABLED, function(p3)
			-- upvalues: p2 (ref), enableCrossExpEventLogging (copy), self (ref), p1 (ref), actionsModule (copy)
			if p2 and enableCrossExpEventLogging then
				p2:info("{}: Participant voice changer was disabled {}", self.experienceType, p3.userId)
			end
			p1:dispatch(actionsModule.VoiceChangerWasDisabled({
				userId = tonumber(p3.userId) or -1,
				isLocalUser = p3.isLocalUser
			}))
		end)
		self:addObserver(constantsModule.EVENTS.PARTY_VOICE_PACK_WAS_SET, function(p3)
			-- upvalues: p2 (ref), enableCrossExpEventLogging (copy), self (ref), p1 (ref), actionsModule (copy)
			if p2 and enableCrossExpEventLogging then
				p2:info("{}: Participant {} voice pack was set to {}", self.experienceType, p3.userId, p3.voicePackName)
			end
			p1:dispatch(actionsModule.VoicePackWasSet({
				userId = tonumber(p3.userId) or -1,
				isLocalUser = p3.isLocalUser,
				voicePackName = p3.voicePackName
			}))
		end)
		self:addObserver(constantsModule.EVENTS.PARTY_VOICE_CHANGER_FEEDBACK_WAS_ENABLED, function(p3)
			-- upvalues: p2 (ref), enableCrossExpEventLogging (copy), self (ref), p1 (ref), actionsModule (copy)
			if p2 and enableCrossExpEventLogging then
				p2:info("{}: Participant voice changer feedback was enabled {}", self.experienceType, p3.userId)
			end
			p1:dispatch(actionsModule.VoiceChangerFeedbackWasEnabled({
				userId = tonumber(p3.userId) or -1,
				isLocalUser = p3.isLocalUser
			}))
		end)
		self:addObserver(constantsModule.EVENTS.PARTY_VOICE_CHANGER_FEEDBACK_WAS_DISABLED, function(p3)
			-- upvalues: p2 (ref), enableCrossExpEventLogging (copy), self (ref), p1 (ref), actionsModule (copy)
			if p2 and enableCrossExpEventLogging then
				p2:info("{}: Participant voice changer feedback was disabled {}", self.experienceType, p3.userId)
			end
			p1:dispatch(actionsModule.VoiceChangerFeedbackWasDisabled({
				userId = tonumber(p3.userId) or -1,
				isLocalUser = p3.isLocalUser
			}))
		end)
	end
	self:addObserver(constantsModule.EVENTS.MUTE_PARTY_VOICE_PARTICIPANT, function(p3)
		-- upvalues: p2 (ref), enableCrossExpEventLogging (copy), self (ref), p1 (ref), actionsModule (copy)
		if p2 and enableCrossExpEventLogging then
			p2:info("{}: Participant is muted locally {}", self.experienceType, p3.userId)
		end
		p1:dispatch(actionsModule.MuteParticipant({
			userId = tonumber(p3.userId) or -1,
			isLocalUser = p3.isLocalUser
		}))
	end)
	self:addObserver(constantsModule.EVENTS.UNMUTE_PARTY_VOICE_PARTICIPANT, function(p3)
		-- upvalues: p2 (ref), enableCrossExpEventLogging (copy), self (ref), p1 (ref), actionsModule (copy)
		if p2 and enableCrossExpEventLogging then
			p2:info("{}: Participant is unmuted locally {}", self.experienceType, p3.userId)
		end
		p1:dispatch(actionsModule.UnmuteParticipant({
			userId = tonumber(p3.userId) or -1,
			isLocalUser = p3.isLocalUser
		}))
	end)
	
	if fFlagPartyVoiceBlockSync then
		self:addObserver(constantsModule.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, function(p3)
			-- upvalues: p2 (ref), enableCrossExpEventLogging (copy), self (ref)
			if p2 and enableCrossExpEventLogging then
				p2:info("{}: Participant was blocked {} from party voice", self.experienceType, p3.userId)
			end
		end)
		self:addObserver(constantsModule.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, function(p3)
			-- upvalues: p2 (ref), enableCrossExpEventLogging (copy), self (ref)
			if p2 and enableCrossExpEventLogging then
				p2:info("{}: Participant was unblocked {} from party voice", self.experienceType, p3.userId)
			end
		end)
	end
end

function t.getBackgroundStateSnapshot(_)
	-- upvalues: var3 (ref), utilsModule (ref)
	local var4 = var3.restore()
	
	return if var4 and var4.Squad and var4.Squad.CrossExperienceVoice then {
		Experience = var4.Squad.CrossExperienceVoice.Experience,
		Participants = {
			participants = utilsModule.stringMapToNumberMap(var4.Squad.CrossExperienceVoice.Participants.participants),
			activeUserIds = var4.Squad.CrossExperienceVoice.Participants.activeUserIds,
			publicVoiceFocusedUserIds = utilsModule.stringMapToNumberMap(var4.Squad.CrossExperienceVoice.Participants.publicVoiceFocusedUserIds)
		}
	} else nil
end

function t:restoreStateFromBackground(p1, p2)
	-- upvalues: enableCrossExpEventLogging (ref), httpService (ref), actionsModule (ref)
	local backgroundStateSnapshot = self:getBackgroundStateSnapshot()
	
	if backgroundStateSnapshot then
		if p2 and enableCrossExpEventLogging then
			p2:info("{}: Restoring state from background {}", self.experienceType, httpService:JSONEncode(backgroundStateSnapshot))
		end
		p1:dispatch(actionsModule.RestoreState(backgroundStateSnapshot))
	end
end

function t:unsubscribe(p1, p2)
	-- upvalues: enableCrossExpEventLogging (ref), actionsModule (ref)
	if p2 and enableCrossExpEventLogging then
		p2:info("{}: Unsubscribing from the CEV Store", self.experienceType)
	end
	p1:dispatch(actionsModule.ExperienceLeft())
	
	for i, v in ipairs(self.observers) do
		self:removeObserver(v.id, v.event)
	end
	self.isSubscribed = false
	self.observers = {}
	self.eventQueue:reset()
end

return t