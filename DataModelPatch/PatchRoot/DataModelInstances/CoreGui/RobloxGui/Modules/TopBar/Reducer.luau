local CorePackages = game:GetService("CorePackages")
local RoduxModule = require(CorePackages.Packages.Rodux)
local CrossExperienceVoiceModule = require(CorePackages.Workspace.Packages.CrossExperienceVoice)
local CrossExperienceModule = require(CorePackages.Workspace.Packages.CrossExperience)
local CreatePersistenceMiddlewareFunction = CrossExperienceModule.Middlewares.createPersistenceMiddleware
local FFlagTopBarSignalizeHealthBar = require(CorePackages.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar
local Parent = script.Parent
local FFlagTopBarDeprecateChatRoduxModule = require(Parent.Flags.FFlagTopBarDeprecateChatRodux)
local CoreGuiEnabledModule = require(script.CoreGuiEnabled)
local HealthModule = require(script.Health)
local ChatModule = require(script.Chat)
local config = {
	displayOptions = require(script.DisplayOptions),
	coreGuiEnabled = if require(Parent.Flags.FFlagTopBarDeprecateCoreGuiRodux) then nil else CoreGuiEnabledModule,
	health = if FFlagTopBarSignalizeHealthBar then nil else HealthModule,
	moreMenu = require(script.MoreMenu),
	chat = if FFlagTopBarDeprecateChatRoduxModule then nil else ChatModule,
	respawn = require(script.Respawn),
	gameInfo = require(script.GameInfo)
}

if require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExpVoice() then
	local CrossExperienceVoice = nil
	local RestoreResult = CreatePersistenceMiddlewareFunction({
		storeKey = CrossExperienceModule.Constants.STORAGE_CEV_STORE_KEY
	}).restore()
	
	if RestoreResult and RestoreResult.Squad and RestoreResult.Squad.CrossExperienceVoice then
		CrossExperienceVoice = RestoreResult.Squad.CrossExperienceVoice
	end
	config.Squad = RoduxModule.combineReducers({
		CrossExperienceVoice = CrossExperienceVoiceModule.installReducer(CrossExperienceVoice)
	})
end
return (RoduxModule.combineReducers(config))