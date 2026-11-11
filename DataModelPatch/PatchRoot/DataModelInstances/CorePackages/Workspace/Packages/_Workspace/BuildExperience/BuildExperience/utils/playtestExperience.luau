local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local BuildModeLaunchModule = require(script.Parent.BuildModeLaunch)
local LaunchExperienceModule = require(script.Parent.launchExperience)
local TeleportToPlaceModule = require(script.Parent.teleportToPlace)
local Debug = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat).debug

local function _(p1, p2): boolean
	return p2 ~= 0 and p2 == p1
end

local _ = function(p1)
	-- upvalues: Players (copy), TeleportService (copy)
	local LocalPlayer = Players.LocalPlayer
	local TeleportInitFailedConnection = TeleportService.TeleportInitFailed:Connect(function(Player)
		-- upvalues: LocalPlayer (copy), p1 (copy)
		if Player == LocalPlayer then
			p1()
		end
	end)
	
	return function()
		-- upvalues: TeleportInitFailedConnection (copy)
		TeleportInitFailedConnection:Disconnect()
	end
end

return function(PlaceId, Source, p1): string
	-- upvalues: Debug (copy), Players (copy), TeleportService (copy), BuildModeLaunchModule (copy), TeleportToPlaceModule (copy), LaunchExperienceModule (copy)
	local CurrentPlaceId = if p1 and p1.currentPlaceId ~= nil then p1.currentPlaceId else game.PlaceId
	local IsTeamTest = if p1 then p1.isTeamTest else nil
	Debug.log("info", "playtestExperience", {
		isTeamTest = IsTeamTest,
		placeId = PlaceId,
		currentPlaceId = CurrentPlaceId,
		source = Source
	})
	local Callback1: boolean = CurrentPlaceId ~= 0 and CurrentPlaceId == PlaceId
	
	if not Callback1 then
		Callback1 = LaunchExperienceModule
		Callback1(PlaceId, Source, IsTeamTest)
		Callback1 = "experience_launch"
		
		return Callback1
	end
	Callback1 = nil
	
	if p1 and p1.onTeleportFailed then
		local OnTeleportFailedFunction = p1.onTeleportFailed
		
		local function v12()
			-- upvalues: Callback1 (ref), OnTeleportFailedFunction (copy)
			if Callback1 then
				Callback1()
				Callback1 = nil
			end
			OnTeleportFailedFunction()
		end
		
		local LocalPlayer = Players.LocalPlayer
		local TeleportInitFailedConnection = TeleportService.TeleportInitFailed:Connect(function(Player)
			-- upvalues: LocalPlayer (copy), v12 (copy)
			if Player == LocalPlayer then
				v12()
			end
		end)
		
		Callback1 = function()
			-- upvalues: TeleportInitFailedConnection (copy)
			TeleportInitFailedConnection:Disconnect()
		end
	end
	BuildModeLaunchModule:set()
	TeleportToPlaceModule(PlaceId)
	
	return "teleport_pending"
end