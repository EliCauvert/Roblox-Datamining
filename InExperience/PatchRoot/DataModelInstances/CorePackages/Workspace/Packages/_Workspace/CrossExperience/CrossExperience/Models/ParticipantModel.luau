local DependenciesModule = require(script:FindFirstAncestor("CrossExperience").dependencies)
local FFlagEnablePartyVoiceChangersInLua = DependenciesModule.SharedFlags.FFlagEnablePartyVoiceChangersInLua
local T = DependenciesModule.t
local ParticipantModelModule = {}

function ParticipantModelModule.new(p1) --[[ Line: 10 ]]
	-- upvalues: ParticipantModelModule (copy)
	assert(ParticipantModelModule.isValid(p1))
	ParticipantModelModule.__index = ParticipantModelModule
	setmetatable(p1, ParticipantModelModule)
	
	return p1
end

function ParticipantModelModule.format(p1) --[[ Line: 22 ]]
	-- upvalues: ParticipantModelModule (copy), FFlagEnablePartyVoiceChangersInLua (copy)
	return (ParticipantModelModule.new({
		userId = p1.userId,
		isLocalUser = p1.isLocalUser,
		username = p1.username,
		displayname = p1.displayname,
		isMuted = p1.isMuted,
		isMutedLocally = p1.isMutedLocally,
		isVoiceChangerActive = if FFlagEnablePartyVoiceChangersInLua then p1.isVoiceChangerActive else nil,
		isVoiceChangerHearMyselfActive = if FFlagEnablePartyVoiceChangersInLua then p1.isVoiceChangerHearMyselfActive else nil,
		selectedVoicePack = if FFlagEnablePartyVoiceChangersInLua then p1.selectedVoicePack else nil
	}))
end

ParticipantModelModule.isValid = if FFlagEnablePartyVoiceChangersInLua then T.strictInterface({
	userId = T.number,
	isLocalUser = T.boolean,
	username = T.string,
	displayname = T.string,
	isMuted = T.boolean,
	isMutedLocally = T.boolean,
	isVoiceChangerActive = T.boolean,
	isVoiceChangerHearMyselfActive = T.boolean,
	selectedVoicePack = T.string
}) else T.strictInterface({
	userId = T.number,
	isLocalUser = T.boolean,
	username = T.string,
	displayname = T.string,
	isMuted = T.boolean,
	isMutedLocally = T.boolean
})

return ParticipantModelModule