local playersService = game:GetService("Players")
local teleportService = game:GetService("TeleportService")
local creatorAgentChatModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)
local buildModeLaunchModule = require(script.Parent.BuildModeLaunch)
local launchExperienceModule = require(script.Parent.launchExperience)
local teleportToPlaceModule = require(script.Parent.teleportToPlace)
local debug = creatorAgentChatModule.debug

local function _(p0, p1) --[[ line: 24 | named "isAlreadyInPlace" ]]
	return p1 ~= 0 and p1 == p0
end

local _ = function(p2) --[[ line: 28 | named "listenForTeleportFailure" ]]
	-- upvalues: playersService (ref), teleportService (ref)
	local localPlayer = playersService.LocalPlayer
	local teleportInitFailedConnection = teleportService.TeleportInitFailed:Connect(function(p3) --[[ line: 32 ]]
		-- upvalues: localPlayer (ref), p2 (ref)
		if p3 == localPlayer then
			p2()
		end
	end)
	
	return function() --[[ line: 38 ]]
		-- upvalues: teleportInitFailedConnection (ref)
		teleportInitFailedConnection:Disconnect()
	end
end

return function(p4, p5, p6) --[[ line: 43 | named "playtestExperience" ]]
	-- upvalues: debug (ref), playersService (ref), teleportService (ref), buildModeLaunchModule (ref), teleportToPlaceModule (ref), launchExperienceModule (ref)
	local var7 = if p6 and p6.currentPlaceId ~= nil then p6.currentPlaceId else game.PlaceId
	local var8 = if p6 then p6.isTeamTest else nil
	debug.log("info", "playtestExperience", {
		isTeamTest = var8,
		placeId = p4,
		currentPlaceId = var7,
		source = p5
	})
	
	if not (var7 ~= 0 and var7 == p4) then
		launchExperienceModule(p4, p5, var8)
		
		return "experience_launch"
	end
	local var9 = nil
	
	if p6 and p6.onTeleportFailed then
		local onTeleportFailed = p6.onTeleportFailed
		
		local var10 = function() --[[ line: 58 ]]
			-- upvalues: var9 (write), onTeleportFailed (ref)
			if var9 then
				var9()
				var9 = nil
			end
			onTeleportFailed()
		end
		
		local localPlayer = playersService.LocalPlayer
		local teleportInitFailedConnection = teleportService.TeleportInitFailed:Connect(function(p7) --[[ line: 32 ]]
			-- upvalues: localPlayer (ref), var10 (ref)
			if p7 == localPlayer then
				var10()
			end
		end)
		
		var9 = function() --[[ line: 38 ]]
			-- upvalues: teleportInitFailedConnection (ref)
			teleportInitFailedConnection:Disconnect()
		end
	end
	buildModeLaunchModule:set()
	teleportToPlaceModule(p4)
	
	return "teleport_pending"
end