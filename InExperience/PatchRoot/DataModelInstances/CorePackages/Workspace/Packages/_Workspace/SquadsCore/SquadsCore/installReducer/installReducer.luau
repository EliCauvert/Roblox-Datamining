local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local squadPromptReducerModule = require(script.Parent.SquadPromptReducer)
local roduxNetworkingModule = require(squadsCore.Http.RoduxNetworking)
local roduxPresenceModule = require(squadsCore.Http.RoduxPresence)
local roduxSquadsModule = require(squadsCore.RoduxSquads)
local squadLocationModule = require(squadsCore.Enums.SquadLocation)
local userBlockingRoduxModule = require(squadsCore.Http.UserBlockingRodux)
local fFlagSquadsPresenceStoreMigrationModule = require(squadsCore.Flags.FFlagSquadsPresenceStoreMigration)
local crossExperienceModule = require(parent.CrossExperience)
local crossExperienceVoiceModule = require(parent.CrossExperienceVoice)
local roduxModule = require(parent.Rodux)
local createPersistenceMiddleware = crossExperienceModule.Middlewares.createPersistenceMiddleware
local t = {
	NetworkStatus = roduxNetworkingModule.installReducer(),
	Presence = if fFlagSquadsPresenceStoreMigrationModule then nil else roduxPresenceModule.installReducer(),
	Squad = roduxSquadsModule.installReducer(),
	SquadPrompt = squadPromptReducerModule,
	UserBlocking = userBlockingRoduxModule.installReducer()
}

if require(parent.SharedFlags).GetFFlagEnableCrossExpVoice() then
	local crossExperienceVoice = nil
	local var1 = createPersistenceMiddleware({
		storeKey = crossExperienceModule.Constants.STORAGE_CEV_STORE_KEY
	}).restore()
	
	if var1 and var1.Squad and var1.Squad.CrossExperienceVoice then
		crossExperienceVoice = var1.Squad.CrossExperienceVoice
	end
	t.CrossExperienceVoice = crossExperienceVoiceModule.installReducer(crossExperienceVoice)
end
return function(p1)
	-- upvalues: t (ref), squadLocationModule (ref), squadPromptReducerModule (ref), roduxModule (ref)
	t.SquadPrompt = if p1 == squadLocationModule.InExperience then squadPromptReducerModule else nil
	
	return roduxModule.combineReducers(t)
end