local parent = script:FindFirstAncestor("GameLaunch").Parent
local default = require(parent.LoggingProtocol).default
local cryoModule = require(parent.Cryo)
local _ = require(parent.ExperienceService)
local experienceService = require(parent.ExperienceService).ExperienceService
local getFFlagMoveLuaExpLaunchBegin = require(parent.ExperienceService).Flags.GetFFlagMoveLuaExpLaunchBegin
local fFlagDeferInExperienceRbxmDownload = require(parent.SharedFlags).FFlagDeferInExperienceRbxmDownload
local fFlagEnableDeferredAssetManagerService = require(parent.SharedFlags).FFlagEnableDeferredAssetManagerService
local var1 = if fFlagDeferInExperienceRbxmDownload and fFlagEnableDeferredAssetManagerService then game:GetService("DeferredAssetManagerService") else nil

return function(p0, p1, p2, _, p3, p4) --[[ line: 19 | named "LaunchGame" ]]
	-- upvalues: getFFlagMoveLuaExpLaunchBegin (ref), default (ref), cryoModule (ref), fFlagDeferInExperienceRbxmDownload (ref), fFlagEnableDeferredAssetManagerService (ref), var1 (ref), experienceService (ref)
	if not getFFlagMoveLuaExpLaunchBegin() then
		default:logEvent("experience_launch_begin")
	end
	local t = { placeId = tonumber(p0), referralPage = p1 }
	
	if p2 then
		t = cryoModule.Dictionary.join(t, p2)
	end
	if fFlagDeferInExperienceRbxmDownload and fFlagEnableDeferredAssetManagerService then
		local var3 = var1
		var3.JoiningPlaceId = t.placeId or 0
		var3.JoiningUniverseId = tonumber(t.universeId) or 0
	end
	experienceService:LaunchExperience(t, p3, p4)
end