local parent = script:FindFirstAncestor("GameLaunch").Parent
local default = require(parent.LoggingProtocol).default
local cryoModule = require(parent.Cryo)
local _ = require(parent.ExperienceService)
local experienceService = require(parent.ExperienceService).ExperienceService
local getFFlagMoveLuaExpLaunchBegin = require(parent.ExperienceService).Flags.GetFFlagMoveLuaExpLaunchBegin
local fFlagDeferInExperienceRbxmDownload = require(parent.SharedFlags).FFlagDeferInExperienceRbxmDownload
local fFlagEnableDeferredAssetManagerService = require(parent.SharedFlags).FFlagEnableDeferredAssetManagerService
local var1 = if fFlagDeferInExperienceRbxmDownload and fFlagEnableDeferredAssetManagerService then game:GetService("DeferredAssetManagerService") else nil

return function(p1, p2, p3, _, p4, p5)
	-- upvalues: getFFlagMoveLuaExpLaunchBegin (ref), default (ref), cryoModule (ref), fFlagDeferInExperienceRbxmDownload (ref), fFlagEnableDeferredAssetManagerService (ref), var1 (ref), experienceService (ref)
	if not getFFlagMoveLuaExpLaunchBegin() then
		default:logEvent("experience_launch_begin")
	end
	local t = { placeId = tonumber(p1), referralPage = p2 }
	
	if p3 then
		t = cryoModule.Dictionary.join(t, p3)
	end
	if fFlagDeferInExperienceRbxmDownload and fFlagEnableDeferredAssetManagerService then
		local var2 = var1
		var2.JoiningPlaceId = t.placeId or 0
		var2.JoiningUniverseId = tonumber(t.universeId) or 0
	end
	experienceService:LaunchExperience(t, p4, p5)
end