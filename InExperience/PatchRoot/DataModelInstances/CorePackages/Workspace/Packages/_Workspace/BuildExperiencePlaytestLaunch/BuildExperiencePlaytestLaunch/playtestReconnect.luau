local buildModeLaunchModule = require(script.Parent.BuildModeLaunch)
local playtestRejoinModule = require(script.Parent.PlaytestRejoin)
local leaveExperienceModule = require(script.Parent.leaveExperience)
local teamCreateUtilsModule = require(script.Parent.teamCreateUtils)

local function _(p1)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref)
		return p1:GetService("RunService"):IsTeamTest()
	end)
	
	return ok and status == true
end

return {
	getRelaunchPlaceId = function(p1)
		-- upvalues: buildModeLaunchModule (ref), teamCreateUtilsModule (ref)
		p1 = p1 or game
		
		if not buildModeLaunchModule:hasBuildMode() or teamCreateUtilsModule.isViewer(p1) then
			return nil
		elseif p1.PlaceId ~= 0 then
			local ok, status = pcall(function()
				-- upvalues: p1 (ref)
				return p1:GetService("RunService"):IsTeamTest()
			end)
			
			return if ok and status == true then p1.PlaceId else buildModeLaunchModule:getTeamTestPlaceId()
		end
	end,
	relaunch = function(p1)
		-- upvalues: playtestRejoinModule (ref), leaveExperienceModule (ref)
		playtestRejoinModule.request(p1, "BuildPlaytestReconnect", true)
		leaveExperienceModule()
	end
}