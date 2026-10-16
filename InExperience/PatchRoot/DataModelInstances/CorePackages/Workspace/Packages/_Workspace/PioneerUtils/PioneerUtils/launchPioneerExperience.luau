local Parent = script:FindFirstAncestor("PioneerUtils").Parent
local Logger = require(Parent.Loggers).Logger
local ExperienceService = require(Parent.ExperienceService).ExperienceService
local GameParams = require(Parent.ExperienceService).GameParams
local PioneerInfoModule = require(script.Parent.PioneerInfo)

local function _(Number): boolean --[[ Line: 11 | Named "pendingJoinTargetsPlace" ]]
	-- upvalues: ExperienceService (copy)
	local Success, Result = pcall(function() --[[ Line: 12 ]]
		-- upvalues: ExperienceService (upval)
		return ExperienceService:GetPendingJoinAttempt()
	end)
	
	if Success and type(Result) == "table" then
		local Number1: number? = tonumber(Result.placeId)
		
		return Number1 ~= nil and Number1 == Number
	else
		return false
	end
end

return function() --[[ Line: 22 | Named "launchPioneerExperience" ]]
	-- upvalues: PioneerInfoModule (copy), Logger (copy), ExperienceService (copy), GameParams (copy)
	local PioneerRootPlaceId = PioneerInfoModule.getPioneerRootPlaceId()
	
	if not PioneerRootPlaceId then
		Logger:warning("launchPioneerExperience: could not resolve a valid Pioneer root place id")
		
		return
	end
	local Success, Result = pcall(function() --[[ Line: 12 ]]
		-- upvalues: ExperienceService (upval)
		return ExperienceService:GetPendingJoinAttempt()
	end)
	local v1 = nil
	
	if Success and type(Result) == "table" then
		local Number: number? = tonumber(Result.placeId)
		v1 = Number ~= nil and Number == PioneerRootPlaceId
	else
		v1 = false
	end
	if not v1 then
		ExperienceService:LaunchExperience(GameParams.fromPlaceId(PioneerRootPlaceId), "PioneerLaunch")
		
		return
	end
end