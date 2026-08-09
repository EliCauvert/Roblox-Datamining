local playersService = game:GetService("Players")
local teleportService = game:GetService("TeleportService")
local creatorAgentChatModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)
local buildModeLaunchModule = require(script.Parent.BuildModeLaunch)
local launchExperienceModule = require(script.Parent.launchExperience)
local leaveExperienceModule = require(script.Parent.leaveExperience)
local teleportToPlaceModule = require(script.Parent.teleportToPlace)
local debug = creatorAgentChatModule.debug

local function _(p0, p1) --[[ line: 27 | named "isAlreadyInPlace" ]]
	return p1 ~= 0 and p1 == p0
end

local _ = function(p2) --[[ line: 31 | named "listenForTeleportFailure" ]]
	-- upvalues: playersService (ref), teleportService (ref)
	local localPlayer = playersService.LocalPlayer
	local teleportInitFailedConnection = teleportService.TeleportInitFailed:Connect(function(p3) --[[ line: 35 ]]
		-- upvalues: localPlayer (ref), p2 (ref)
		if p3 == localPlayer then
			p2()
		end
	end)
	
	return function() --[[ line: 41 ]]
		-- upvalues: teleportInitFailedConnection (ref)
		teleportInitFailedConnection:Disconnect()
	end
end

return function(p4, p5, p6) --[[ line: 46 | named "playtestExperience" ]]
	-- upvalues: debug (ref), leaveExperienceModule (ref), launchExperienceModule (ref), playersService (ref), teleportService (ref), buildModeLaunchModule (ref), teleportToPlaceModule (ref)
	local var8 = if p6 and p6.currentPlaceId ~= nil then p6.currentPlaceId else game.PlaceId
	local var9 = if p6 then p6.isTeamTest else nil
	debug.log("info", "playtestExperience", {
		isTeamTest = var9,
		placeId = p4,
		currentPlaceId = var8,
		source = p5
	})
	
	if not (var8 ~= 0 and var8 == p4) then
		launchExperienceModule(p4, p5, var9)
		
		return "experience_launch"
	elseif var9 then
		leaveExperienceModule(function() --[[ line: 59 ]]
			-- upvalues: debug (copy), var9 (ref), p4 (ref), p5 (ref), launchExperienceModule (copy)
			debug.log("info", "playtestExperience team test rejoin queued", { isTeamTest = var9, placeId = p4, source = p5 })
			launchExperienceModule(p4, p5, var9)
		end)
		
		return "leave_and_launch_pending"
	end
	local var10 = nil
	
	if p6 and p6.onTeleportFailed then
		local onTeleportFailed = p6.onTeleportFailed
		
		local var11 = function() --[[ line: 73 ]]
			-- upvalues: var10 (write), onTeleportFailed (ref)
			if var10 then
				var10()
				var10 = nil
			end
			onTeleportFailed()
		end
		
		local localPlayer = playersService.LocalPlayer
		local teleportInitFailedConnection = teleportService.TeleportInitFailed:Connect(function(p7) --[[ line: 35 ]]
			-- upvalues: localPlayer (ref), var11 (ref)
			if p7 == localPlayer then
				var11()
			end
		end)
		
		var10 = function() --[[ line: 41 ]]
			-- upvalues: teleportInitFailedConnection (ref)
			teleportInitFailedConnection:Disconnect()
		end
	end
	buildModeLaunchModule:set()
	teleportToPlaceModule(p4)
	
	return "teleport_pending"
end