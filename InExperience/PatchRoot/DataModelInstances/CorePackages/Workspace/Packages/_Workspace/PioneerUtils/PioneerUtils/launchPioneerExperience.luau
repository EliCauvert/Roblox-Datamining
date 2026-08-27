local parent = script:FindFirstAncestor("PioneerUtils").Parent
local logger = require(parent.Loggers).Logger
local experienceService = require(parent.ExperienceService).ExperienceService
local gameParams = require(parent.ExperienceService).GameParams
local pioneerInfoModule = require(script.Parent.PioneerInfo)

local function _(p1)
	-- upvalues: experienceService (ref)
	local ok, status = pcall(function()
		-- upvalues: experienceService (copy)
		return experienceService:GetPendingJoinAttempt()
	end)
	
	if not ok or type(status) ~= "table" then
		return false
	end
	local var1 = tonumber(status.placeId)
	
	return var1 ~= nil and var1 == p1
end

return function()
	-- upvalues: pioneerInfoModule (ref), logger (ref), experienceService (ref), gameParams (ref)
	local pioneerRootPlaceId = pioneerInfoModule.getPioneerRootPlaceId()
	
	if not pioneerRootPlaceId then
		logger:warning("launchPioneerExperience: could not resolve a valid Pioneer root place id")
		
		return
	end
	local var1
	local ok, status = pcall(function()
		-- upvalues: experienceService (copy)
		return experienceService:GetPendingJoinAttempt()
	end)
	
	if ok and type(status) == "table" then
		local var2 = tonumber(status.placeId)
		var1 = var2 ~= nil and var2 == pioneerRootPlaceId
	else
		var1 = false
	end
	if var1 then
		return
	end
	experienceService:LaunchExperience(gameParams.fromPlaceId(pioneerRootPlaceId), "PioneerLaunch")
end