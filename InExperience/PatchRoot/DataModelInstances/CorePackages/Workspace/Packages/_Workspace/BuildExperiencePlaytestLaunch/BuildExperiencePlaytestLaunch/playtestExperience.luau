local playersService = game:GetService("Players")
local teleportService = game:GetService("TeleportService")
local parent = script:FindFirstAncestor("BuildExperiencePlaytestLaunch").Parent
local sharedFlagsModule = require(parent.SharedFlags)
local teamCreateUtilsModule = require(script.Parent.teamCreateUtils)
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local buildModeLaunchModule = require(script.Parent.BuildModeLaunch)
local playtestRejoinModule = require(script.Parent.PlaytestRejoin)
local launchExperienceModule = require(script.Parent.launchExperience)
local leaveExperienceModule = require(script.Parent.leaveExperience)
local teleportToPlaceModule = require(script.Parent.teleportToPlace)
local debug = creatorAgentChatModule.debug
local fFlagBuildExperienceLibrary = sharedFlagsModule.FFlagBuildExperienceLibrary

local function _(p1, p2)
	return p2 ~= 0 and p2 == p1
end

local _ = function(p1)
	-- upvalues: playersService (ref), teleportService (ref)
	local localPlayer = playersService.LocalPlayer
	local teleportInitFailedConnection = teleportService.TeleportInitFailed:Connect(function(p2)
		-- upvalues: localPlayer (ref), p1 (ref)
		if p2 == localPlayer then
			p1()
		end
	end)
	
	return function()
		-- upvalues: teleportInitFailedConnection (ref)
		teleportInitFailedConnection:Disconnect()
	end
end

return function(p1, p2, p3)
	-- upvalues: debug (ref), teamCreateUtilsModule (ref), playersService (ref), teleportService (ref), buildModeLaunchModule (ref), teleportToPlaceModule (ref), fFlagBuildExperienceLibrary (ref), playtestRejoinModule (ref), leaveExperienceModule (ref), launchExperienceModule (ref)
	local var1 = if p3 and p3.currentPlaceId ~= nil then p3.currentPlaceId else game.PlaceId
	local var2 = if p3 then p3.isTeamTest else nil
	debug.log("info", "playtestExperience", {
		isTeamTest = var2,
		placeId = p1,
		currentPlaceId = var1,
		source = p2
	})
	local var3 = teamCreateUtilsModule.isViewer()
	local var4 = var1 ~= 0 and var1 == p1
	
	if var4 and not var3 then
		var4 = nil
		
		if p3 and p3.onTeleportFailed then
			local onTeleportFailed = p3.onTeleportFailed
			
			local var5 = function()
				-- upvalues: var4 (write), onTeleportFailed (ref)
				if var4 then
					var4()
					var4 = nil
				end
				onTeleportFailed()
			end
			
			local localPlayer = playersService.LocalPlayer
			local teleportInitFailedConnection = teleportService.TeleportInitFailed:Connect(function(p4)
				-- upvalues: localPlayer (ref), var5 (ref)
				if p4 == localPlayer then
					var5()
				end
			end)
			
			var4 = function()
				-- upvalues: teleportInitFailedConnection (ref)
				teleportInitFailedConnection:Disconnect()
			end
		end
		buildModeLaunchModule:set()
		teleportToPlaceModule(p1)
		
		return "teleport_pending"
	elseif var3 and fFlagBuildExperienceLibrary then
		playtestRejoinModule.request(p1, p2, var2)
		leaveExperienceModule()
	elseif var3 then
		leaveExperienceModule(function()
			-- upvalues: launchExperienceModule (copy), p1 (ref), p2 (ref), var2 (ref)
			launchExperienceModule(p1, p2, var2)
		end)
	else
		launchExperienceModule(p1, p2, var2)
	end
	return "experience_launch"
end