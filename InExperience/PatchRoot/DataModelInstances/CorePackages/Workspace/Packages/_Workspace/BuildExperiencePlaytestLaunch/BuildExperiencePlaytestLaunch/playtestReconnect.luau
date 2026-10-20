local BuildModeLaunchModule = require(script.Parent.BuildModeLaunch)
local PlaytestRejoinModule = require(script.Parent.PlaytestRejoin)
local LeaveExperienceModule = require(script.Parent.leaveExperience)
local TeamCreateUtilsModule = require(script.Parent.teamCreateUtils)

local function _(p1): boolean
	local Success, Result = pcall(function()
		-- upvalues: p1 (copy)
		return p1:GetService("RunService"):IsTeamTest()
	end)
	
	return Success and Result == true
end

return {
	getRelaunchPlaceId = function(p1)
		-- upvalues: BuildModeLaunchModule (copy), TeamCreateUtilsModule (copy)
		local P1 = p1 or game
		
		if not BuildModeLaunchModule:hasBuildMode() or TeamCreateUtilsModule.isViewer(P1) then
			return nil
		end
		if P1.PlaceId ~= 0 then
			local Success, Result = pcall(function()
				-- upvalues: P1 (copy)
				return P1:GetService("RunService"):IsTeamTest()
			end)
			
			if Success then
				Success = Result == true
			end
			if Success then
				return P1.PlaceId
			end
		end
		return BuildModeLaunchModule:getTeamTestPlaceId()
	end,
	relaunch = function(p1)
		-- upvalues: PlaytestRejoinModule (copy), LeaveExperienceModule (copy)
		PlaytestRejoinModule.request(p1, "BuildPlaytestReconnect", true)
		LeaveExperienceModule()
	end
}