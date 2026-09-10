local playersService = game:GetService("Players")
local teleportService = game:GetService("TeleportService")
local creatorAgentChatModule = require(script:FindFirstAncestor("BuildExperiencePlaytestLaunch").Parent.DataHydration.CreatorAgentChat)
local buildModeLaunchModule = require(script.Parent.BuildModeLaunch)
local launchExperienceModule = require(script.Parent.launchExperience)
local teleportToPlaceModule = require(script.Parent.teleportToPlace)
local debug = creatorAgentChatModule.debug

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
	-- upvalues: debug (ref), playersService (ref), teleportService (ref), buildModeLaunchModule (ref), teleportToPlaceModule (ref), launchExperienceModule (ref)
	local var1 = if p3 and p3.currentPlaceId ~= nil then p3.currentPlaceId else game.PlaceId
	local var2 = if p3 then p3.isTeamTest else nil
	local var3 = if p3 then p3.tcViewer else nil
	debug.log("info", "playtestExperience", {
		isTeamTest = var2,
		tcViewer = var3,
		placeId = p1,
		currentPlaceId = var1,
		source = p2
	})
	local isViewingCloudEditEngineFeature = game:GetEngineFeature("IsViewingCloudEdit")
	
	if var3 and isViewingCloudEditEngineFeature then
		if var1 ~= 0 and var1 == p1 then
			debug.log("info", "playtestExperience: already in TC viewer for this place", { placeId = p1 })
			
			return "experience_launch"
		end
	end
	local var4 = var1 ~= 0 and var1 == p1
	
	if not var4 or isViewingCloudEditEngineFeature or var3 then
		launchExperienceModule(p1, p2, var2, var3, if p3 then p3.launchData else nil)
		
		return "experience_launch"
	end
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
end