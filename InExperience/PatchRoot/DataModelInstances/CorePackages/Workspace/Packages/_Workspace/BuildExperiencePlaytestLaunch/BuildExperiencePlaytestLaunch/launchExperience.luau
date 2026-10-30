local Parent = script:FindFirstAncestor("BuildExperiencePlaytestLaunch").Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagBuildExperienceLibrary = SharedFlagsModule.FFlagBuildExperienceLibrary
local FFlagConnectionRelaunchBuildPlaytest = SharedFlagsModule.FFlagConnectionRelaunchBuildPlaytest
local FFlagDeferInExperienceRbxmDownload = SharedFlagsModule.FFlagDeferInExperienceRbxmDownload
local FFlagEnableDeferredAssetManagerService = SharedFlagsModule.FFlagEnableDeferredAssetManagerService
local FFlagLuaAppPrivatePlaytestEarlyTesting = SharedFlagsModule.FFlagLuaAppPrivatePlaytestEarlyTesting
local FFlagLuaAppPrivatePlaytestWithoutBuildMode = SharedFlagsModule.FFlagLuaAppPrivatePlaytestWithoutBuildMode
local ExperienceServiceModule = require(Parent.ExperienceService)
local ExperienceService = ExperienceServiceModule.ExperienceService
local GameParams = ExperienceServiceModule.GameParams
local BuildModeLaunchModule = require(script.Parent.BuildModeLaunch)
local Debug = require(Parent.DataHydration.CreatorAgentChat).debug

return function(JoiningPlaceId, Source, p1, p2, p3)
	-- upvalues: FFlagLuaAppPrivatePlaytestEarlyTesting (copy), FFlagLuaAppPrivatePlaytestWithoutBuildMode (copy), BuildModeLaunchModule (copy), FFlagConnectionRelaunchBuildPlaytest (copy), GameParams (copy), FFlagBuildExperienceLibrary (copy), Parent (copy), FFlagDeferInExperienceRbxmDownload (copy), FFlagEnableDeferredAssetManagerService (copy), Debug (copy), ExperienceService (copy)
	local FFlagLuaAppPrivatePlaytestEarlyTesting1 = p3 and FFlagLuaAppPrivatePlaytestEarlyTesting
	local NoFFlagLuaAppPrivatePlaytestEarlyTesting = p3 and not FFlagLuaAppPrivatePlaytestEarlyTesting or p1
	
	if FFlagLuaAppPrivatePlaytestWithoutBuildMode then
		BuildModeLaunchModule:clear()
	end
	if not p3 or not FFlagLuaAppPrivatePlaytestWithoutBuildMode then
		BuildModeLaunchModule:set(if p2 == nil then nil else p2.sessionId, JoiningPlaceId, if FFlagConnectionRelaunchBuildPlaytest then NoFFlagLuaAppPrivatePlaytestEarlyTesting else nil)
	end
	local FromParamsResult = if FFlagLuaAppPrivatePlaytestEarlyTesting1 then GameParams.fromParams({ isEarlyTesting = true, placeId = JoiningPlaceId }) else GameParams.fromPlaceId(JoiningPlaceId, NoFFlagLuaAppPrivatePlaytestEarlyTesting)
	
	if FFlagBuildExperienceLibrary then
		FromParamsResult.isTeamCreateViewer = p2 ~= nil or nil
		
		if p2 == nil then
			require(Parent.ProgressLoading).PregameOverride.setPregameOverride(nil)
		end
		if FFlagDeferInExperienceRbxmDownload and FFlagEnableDeferredAssetManagerService then
			local DeferredAssetManagerService = game:GetService("DeferredAssetManagerService")
			DeferredAssetManagerService.JoiningPlaceId = JoiningPlaceId
			DeferredAssetManagerService.JoiningUniverseId = 0
		end
	end
	Debug.log("info", "LaunchExperience gameParams", { gameParams = FromParamsResult, source = Source })
	ExperienceService:LaunchExperience(FromParamsResult, Source)
end