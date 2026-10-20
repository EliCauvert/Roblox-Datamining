local Parent = script:FindFirstAncestor("BuildExperiencePlaytestLaunch").Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagBuildExperienceLibrary = SharedFlagsModule.FFlagBuildExperienceLibrary
local FFlagConnectionRelaunchBuildPlaytest = SharedFlagsModule.FFlagConnectionRelaunchBuildPlaytest
local FFlagDeferInExperienceRbxmDownload = SharedFlagsModule.FFlagDeferInExperienceRbxmDownload
local FFlagEnableDeferredAssetManagerService = SharedFlagsModule.FFlagEnableDeferredAssetManagerService
local ExperienceServiceModule = require(Parent.ExperienceService)
local ExperienceService = ExperienceServiceModule.ExperienceService
local GameParams = ExperienceServiceModule.GameParams
local BuildModeLaunchModule = require(script.Parent.BuildModeLaunch)
local Debug = require(Parent.DataHydration.CreatorAgentChat).debug

return function(JoiningPlaceId, Source, p1, p2)
	-- upvalues: BuildModeLaunchModule (copy), FFlagConnectionRelaunchBuildPlaytest (copy), GameParams (copy), FFlagBuildExperienceLibrary (copy), Parent (copy), FFlagDeferInExperienceRbxmDownload (copy), FFlagEnableDeferredAssetManagerService (copy), Debug (copy), ExperienceService (copy)
	BuildModeLaunchModule:set(if p2 == nil then nil else p2.sessionId, JoiningPlaceId, if FFlagConnectionRelaunchBuildPlaytest then p1 else nil)
	local FromPlaceIdResult = GameParams.fromPlaceId(JoiningPlaceId, p1)
	
	if FFlagBuildExperienceLibrary then
		FromPlaceIdResult.isTeamCreateViewer = p2 ~= nil or nil
		
		if p2 == nil then
			require(Parent.ProgressLoading).PregameOverride.setPregameOverride(nil)
		end
		if FFlagDeferInExperienceRbxmDownload and FFlagEnableDeferredAssetManagerService then
			local DeferredAssetManagerService = game:GetService("DeferredAssetManagerService")
			DeferredAssetManagerService.JoiningPlaceId = JoiningPlaceId
			DeferredAssetManagerService.JoiningUniverseId = 0
		end
	end
	Debug.log("info", "LaunchExperience gameParams", { gameParams = FromPlaceIdResult, source = Source })
	ExperienceService:LaunchExperience(FromPlaceIdResult, Source)
end