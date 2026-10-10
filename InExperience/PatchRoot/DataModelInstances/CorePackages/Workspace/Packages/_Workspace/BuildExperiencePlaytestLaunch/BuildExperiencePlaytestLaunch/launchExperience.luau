local parent = script:FindFirstAncestor("BuildExperiencePlaytestLaunch").Parent
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagBuildExperienceLibrary = sharedFlagsModule.FFlagBuildExperienceLibrary
local fFlagConnectionRelaunchBuildPlaytest = sharedFlagsModule.FFlagConnectionRelaunchBuildPlaytest
local fFlagDeferInExperienceRbxmDownload = sharedFlagsModule.FFlagDeferInExperienceRbxmDownload
local fFlagEnableDeferredAssetManagerService = sharedFlagsModule.FFlagEnableDeferredAssetManagerService
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local experienceServiceModule = require(parent.ExperienceService)
local experienceService = experienceServiceModule.ExperienceService
local gameParams = experienceServiceModule.GameParams
local buildModeLaunchModule = require(script.Parent.BuildModeLaunch)
local debug = creatorAgentChatModule.debug

return function(p1, p2, p3, p4)
	-- upvalues: buildModeLaunchModule (ref), fFlagConnectionRelaunchBuildPlaytest (ref), gameParams (ref), fFlagBuildExperienceLibrary (ref), parent (ref), fFlagDeferInExperienceRbxmDownload (ref), fFlagEnableDeferredAssetManagerService (ref), debug (ref), experienceService (ref)
	buildModeLaunchModule:set(if p4 ~= nil then nil else p4.sessionId, p1, if fFlagConnectionRelaunchBuildPlaytest then p3 else nil)
	local var1 = gameParams.fromPlaceId(p1, p3)
	
	if fFlagBuildExperienceLibrary then
		var1.isTeamCreateViewer = if p4 ~= nil then nil else true
		
		if p4 == nil then
			require(parent.ProgressLoading).PregameOverride.setPregameOverride(nil)
		end
		if fFlagDeferInExperienceRbxmDownload and fFlagEnableDeferredAssetManagerService then
			local deferredAssetManagerService = game:GetService("DeferredAssetManagerService")
			deferredAssetManagerService.JoiningPlaceId = p1
			deferredAssetManagerService.JoiningUniverseId = 0
		end
	end
	debug.log("info", "LaunchExperience gameParams", { gameParams = var1, source = p2 })
	experienceService:LaunchExperience(var1, p2)
end