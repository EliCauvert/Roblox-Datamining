local dependenciesModule = require(script:FindFirstAncestor("CrossExperience").dependencies)
local fFlagEnablePartyVoiceChangersInLua = dependenciesModule.SharedFlags.FFlagEnablePartyVoiceChangersInLua
local t = dependenciesModule.t
local t_1 = {}

function t_1.new(p0)
	-- upvalues: t_1 (ref)
	assert(t_1.isValid(p0))
	t_1.__index = t_1
	setmetatable(p0, t_1)
	
	return p0
end

function t_1.format(p1)
	-- upvalues: t_1 (ref), fFlagEnablePartyVoiceChangersInLua (ref)
	return t_1.new({
		userId = p1.userId,
		isLocalUser = p1.isLocalUser,
		username = p1.username,
		displayname = p1.displayname,
		isMuted = p1.isMuted,
		isMutedLocally = p1.isMutedLocally,
		isVoiceChangerActive = if fFlagEnablePartyVoiceChangersInLua then p1.isVoiceChangerActive else nil,
		isVoiceChangerHearMyselfActive = if fFlagEnablePartyVoiceChangersInLua then p1.isVoiceChangerHearMyselfActive else nil,
		selectedVoicePack = if fFlagEnablePartyVoiceChangersInLua then p1.selectedVoicePack else nil
	})
end

t_1.isValid = if fFlagEnablePartyVoiceChangersInLua then t.strictInterface({
	userId = t.number,
	isLocalUser = t.boolean,
	username = t.string,
	displayname = t.string,
	isMuted = t.boolean,
	isMutedLocally = t.boolean,
	isVoiceChangerActive = t.boolean,
	isVoiceChangerHearMyselfActive = t.boolean,
	selectedVoicePack = t.string
}) else t.strictInterface({
	userId = t.number,
	isLocalUser = t.boolean,
	username = t.string,
	displayname = t.string,
	isMuted = t.boolean,
	isMutedLocally = t.boolean
})

return t_1