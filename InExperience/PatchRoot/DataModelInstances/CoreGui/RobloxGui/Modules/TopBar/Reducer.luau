local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local crossExperienceVoiceModule = require(corePackagesService.Workspace.Packages.CrossExperienceVoice)
local crossExperienceModule = require(corePackagesService.Workspace.Packages.CrossExperience)
local createPersistenceMiddleware = crossExperienceModule.Middlewares.createPersistenceMiddleware
local fFlagTopBarSignalizeHealthBar = require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar
local getFFlagEnableCrossExpVoice = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExpVoice
local parent = script.Parent
local t = {
	displayOptions = require(script.DisplayOptions),
	coreGuiEnabled = if require(parent.Flags.FFlagTopBarDeprecateCoreGuiRodux) then nil else require(script.CoreGuiEnabled),
	health = if fFlagTopBarSignalizeHealthBar then nil else require(script.Health),
	moreMenu = require(script.MoreMenu),
	chat = if require(parent.Flags.FFlagTopBarDeprecateChatRodux) then nil else require(script.Chat),
	respawn = require(script.Respawn),
	gameInfo = require(script.GameInfo)
}

if getFFlagEnableCrossExpVoice() then
	local crossExperienceVoice = nil
	local var1 = createPersistenceMiddleware({
		storeKey = crossExperienceModule.Constants.STORAGE_CEV_STORE_KEY
	}).restore()
	
	if var1 and var1.Squad and var1.Squad.CrossExperienceVoice then
		crossExperienceVoice = var1.Squad.CrossExperienceVoice
	end
	t.Squad = roduxModule.combineReducers({
		CrossExperienceVoice = crossExperienceVoiceModule.installReducer(crossExperienceVoice)
	})
end
return roduxModule.combineReducers(t)