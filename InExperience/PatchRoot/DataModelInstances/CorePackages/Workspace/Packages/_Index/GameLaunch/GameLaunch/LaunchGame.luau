local Parent = script:FindFirstAncestor("GameLaunch").Parent
local Default = require(Parent.LoggingProtocol).default
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.ExperienceService)
local ExperienceService = require(Parent.ExperienceService).ExperienceService
local GetFFlagMoveLuaExpLaunchBeginFunction = require(Parent.ExperienceService).Flags.GetFFlagMoveLuaExpLaunchBegin
local FFlagDeferInExperienceRbxmDownload = require(Parent.SharedFlags).FFlagDeferInExperienceRbxmDownload
local FFlagEnableDeferredAssetManagerService = require(Parent.SharedFlags).FFlagEnableDeferredAssetManagerService
local DeferredAssetManagerService = if FFlagDeferInExperienceRbxmDownload and FFlagEnableDeferredAssetManagerService then game:GetService("DeferredAssetManagerService") else nil

return function(p1, ReferralPage, p2, _, p3, p4)
	-- upvalues: GetFFlagMoveLuaExpLaunchBeginFunction (copy), Default (copy), CryoModule (copy), FFlagDeferInExperienceRbxmDownload (copy), FFlagEnableDeferredAssetManagerService (copy), DeferredAssetManagerService (copy), ExperienceService (copy)
	if not GetFFlagMoveLuaExpLaunchBeginFunction() then
		Default:logEvent("experience_launch_begin")
	end
	local JoinResult = { placeId = tonumber(p1), referralPage = ReferralPage }
	
	if p2 then
		JoinResult = CryoModule.Dictionary.join(JoinResult, p2)
	end
	if FFlagDeferInExperienceRbxmDownload and FFlagEnableDeferredAssetManagerService then
		DeferredAssetManagerService.JoiningPlaceId = JoinResult.placeId or 0
		DeferredAssetManagerService.JoiningUniverseId = tonumber(JoinResult.universeId) or 0
	end
	ExperienceService:LaunchExperience(JoinResult, p3, p4)
end