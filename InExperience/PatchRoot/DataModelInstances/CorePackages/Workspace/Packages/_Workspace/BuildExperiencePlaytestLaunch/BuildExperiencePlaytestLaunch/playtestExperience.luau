local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local Parent = script:FindFirstAncestor("BuildExperiencePlaytestLaunch").Parent
local TeamCreateUtilsModule = require(script.Parent.teamCreateUtils)
local BuildModeLaunchModule = require(script.Parent.BuildModeLaunch)
local PlaytestRejoinModule = require(script.Parent.PlaytestRejoin)
local LaunchExperienceModule = require(script.Parent.launchExperience)
local LeaveExperienceModule = require(script.Parent.leaveExperience)
local TeleportToPlaceModule = require(script.Parent.teleportToPlace)
local Debug = require(Parent.DataHydration.CreatorAgentChat).debug
local FFlagBuildExperienceLibrary = require(Parent.SharedFlags).FFlagBuildExperienceLibrary

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
	-- upvalues: Debug (copy), TeamCreateUtilsModule (copy), Players (copy), TeleportService (copy), BuildModeLaunchModule (copy), TeleportToPlaceModule (copy), FFlagBuildExperienceLibrary (copy), PlaytestRejoinModule (copy), LeaveExperienceModule (copy), LaunchExperienceModule (copy)
	local CurrentPlaceId = if p1 and p1.currentPlaceId ~= nil then p1.currentPlaceId else game.PlaceId
	local IsTeamTest = if p1 then p1.isTeamTest else nil
	local IsEarlyTesting = if p1 then p1.isEarlyTesting else nil
	Debug.log("info", "playtestExperience", {
		isTeamTest = IsTeamTest,
		isEarlyTesting = IsEarlyTesting,
		placeId = PlaceId,
		currentPlaceId = CurrentPlaceId,
		source = Source
	})
	local IsViewer = TeamCreateUtilsModule.isViewer()
	local Callback3: boolean = CurrentPlaceId ~= 0 and CurrentPlaceId == PlaceId
	
	if Callback3 and not IsViewer and not IsEarlyTesting then
		Callback3 = nil
		
		if p1 and p1.onTeleportFailed then
			local OnTeleportFailedFunction = p1.onTeleportFailed
			
			local function v19()
				-- upvalues: Callback3 (ref), OnTeleportFailedFunction (copy)
				if Callback3 then
					Callback3()
					Callback3 = nil
				end
				OnTeleportFailedFunction()
			end
			
			local LocalPlayer = Players.LocalPlayer
			local TeleportInitFailedConnection = TeleportService.TeleportInitFailed:Connect(function(Player)
				-- upvalues: LocalPlayer (copy), v19 (copy)
				if Player == LocalPlayer then
					v19()
				end
			end)
			
			Callback3 = function()
				-- upvalues: TeleportInitFailedConnection (copy)
				TeleportInitFailedConnection:Disconnect()
			end
		end
		BuildModeLaunchModule:set()
		TeleportToPlaceModule(PlaceId)
		
		return "teleport_pending"
	else
		repeat
			if IsViewer then
				Callback3 = FFlagBuildExperienceLibrary
				
				if Callback3 then
					Callback3 = PlaytestRejoinModule
					Callback3 = Callback3.request
					Callback3(PlaceId, Source, IsTeamTest, IsEarlyTesting)
					Callback3 = LeaveExperienceModule
					Callback3()
					break
				end
			end
			if IsViewer then
				Callback3 = LeaveExperienceModule
				Callback3(function()
					-- upvalues: LaunchExperienceModule (upval), PlaceId (copy), Source (copy), IsTeamTest (copy), IsEarlyTesting (copy)
					LaunchExperienceModule(PlaceId, Source, IsTeamTest, nil, IsEarlyTesting)
				end)
				break
			end
			Callback3 = LaunchExperienceModule
			Callback3(PlaceId, Source, IsTeamTest, nil, IsEarlyTesting)
		until true
		Callback3 = "experience_launch"
		
		return Callback3
	end
end