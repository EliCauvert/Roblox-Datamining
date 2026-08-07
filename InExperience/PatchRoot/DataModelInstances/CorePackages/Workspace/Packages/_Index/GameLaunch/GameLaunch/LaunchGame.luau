local parent = script:FindFirstAncestor("GameLaunch").Parent
local default = require(parent.LoggingProtocol).default
local cryoModule = require(parent.Cryo)
local _ = require(parent.ExperienceService)
local experienceService = require(parent.ExperienceService).ExperienceService
local getFFlagMoveLuaExpLaunchBegin = require(parent.ExperienceService).Flags.GetFFlagMoveLuaExpLaunchBegin

return function(p0, p1, p2, _, p3, p4) --[[ line: 10 | named "LaunchGame" ]]
	-- upvalues: getFFlagMoveLuaExpLaunchBegin (ref), default (ref), cryoModule (ref), experienceService (ref)
	if not getFFlagMoveLuaExpLaunchBegin() then
		default:logEvent("experience_launch_begin")
	end
	local t = { placeId = tonumber(p0), referralPage = p1 }
	
	if p2 then
		t = cryoModule.Dictionary.join(t, p2)
	end
	experienceService:LaunchExperience(t, p3, p4)
end