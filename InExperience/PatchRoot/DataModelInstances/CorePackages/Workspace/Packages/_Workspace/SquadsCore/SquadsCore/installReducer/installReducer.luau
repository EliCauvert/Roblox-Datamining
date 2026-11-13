local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local SquadPromptReducerModule = require(script.Parent.SquadPromptReducer)
local RoduxNetworkingModule = require(SquadsCore.Http.RoduxNetworking)
local RoduxPresenceModule = require(SquadsCore.Http.RoduxPresence)
local RoduxSquadsModule = require(SquadsCore.RoduxSquads)
local SquadLocationModule = require(SquadsCore.Enums.SquadLocation)
local UserBlockingRoduxModule = require(SquadsCore.Http.UserBlockingRodux)
local FFlagSquadsPresenceStoreMigrationModule = require(SquadsCore.Flags.FFlagSquadsPresenceStoreMigration)
local CrossExperienceModule = require(Parent.CrossExperience)
local CrossExperienceVoiceModule = require(Parent.CrossExperienceVoice)
local RoduxModule = require(Parent.Rodux)
local SharedFlagsModule = require(Parent.SharedFlags)
local CreatePersistenceMiddlewareFunction = CrossExperienceModule.Middlewares.createPersistenceMiddleware
local GetFFlagEnableCrossExpVoiceFunction = SharedFlagsModule.GetFFlagEnableCrossExpVoice
local config = {
	NetworkStatus = RoduxNetworkingModule.installReducer(),
	Presence = if FFlagSquadsPresenceStoreMigrationModule then nil else RoduxPresenceModule.installReducer(),
	Squad = RoduxSquadsModule.installReducer(),
	SquadPrompt = SquadPromptReducerModule,
	UserBlocking = UserBlockingRoduxModule.installReducer()
}

if GetFFlagEnableCrossExpVoiceFunction() then
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