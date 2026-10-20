local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local SquadPromptReducerModule = require(script.Parent.SquadPromptReducer)
local RoduxPresenceModule = require(SquadsCore.Http.RoduxPresence)
local SquadLocationModule = require(SquadsCore.Enums.SquadLocation)
local CrossExperienceModule = require(Parent.CrossExperience)
local CrossExperienceVoiceModule = require(Parent.CrossExperienceVoice)
local RoduxModule = require(Parent.Rodux)
local CreatePersistenceMiddlewareFunction = CrossExperienceModule.Middlewares.createPersistenceMiddleware
local config = {
	NetworkStatus = require(SquadsCore.Http.RoduxNetworking).installReducer(),
	Presence = if require(SquadsCore.Flags.FFlagSquadsPresenceStoreMigration) then nil else RoduxPresenceModule.installReducer(),
	Squad = require(SquadsCore.RoduxSquads).installReducer(),
	SquadPrompt = SquadPromptReducerModule,
	UserBlocking = require(SquadsCore.Http.UserBlockingRodux).installReducer()
}

if require(Parent.SharedFlags).GetFFlagEnableCrossExpVoice() then
	local CrossExperienceVoice = nil
	local RestoreResult = CreatePersistenceMiddlewareFunction({
		storeKey = CrossExperienceModule.Constants.STORAGE_CEV_STORE_KEY
	}).restore()
	
	if RestoreResult and RestoreResult.Squad and RestoreResult.Squad.CrossExperienceVoice then
		CrossExperienceVoice = RestoreResult.Squad.CrossExperienceVoice
	end
	config.CrossExperienceVoice = CrossExperienceVoiceModule.installReducer(CrossExperienceVoice)
end
return function(InExperience)
	-- upvalues: config (copy), SquadLocationModule (copy), SquadPromptReducerModule (copy), RoduxModule (copy)
	config.SquadPrompt = if InExperience == SquadLocationModule.InExperience then SquadPromptReducerModule else nil
	
	return RoduxModule.combineReducers(config)
end