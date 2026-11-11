local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local Players = game:GetService("Players")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui", 1e999)
assert(RobloxGui ~= nil, "RobloxGui should exist")
local GetFFlagPlayerViewRemoteEnabledModule = require(RobloxGui.Modules.Common.Flags.GetFFlagPlayerViewRemoteEnabled)
local EnablePlayerViewRemoteEventUserIdValidation2 = game:DefineFastFlag("EnablePlayerViewRemoteEventUserIdValidation2", false)
local RequestDeviceCameraOrientationCapability = Instance.new("RemoteEvent")
RequestDeviceCameraOrientationCapability.Name = "RequestDeviceCameraOrientationCapability"
RequestDeviceCameraOrientationCapability.Parent = RobloxReplicatedStorage
local ClockTimes = {}
RequestDeviceCameraOrientationCapability.OnServerEvent:Connect(function(Player: Player, Player1: Player)
	-- upvalues: ClockTimes (copy), RequestDeviceCameraOrientationCapability (copy)
	local ClockTime = os.clock()
	local ClockTime1: number = ClockTimes[Player.UserId]
	
	if ClockTime1 and ClockTime - ClockTime1 < 2 then return end
	if typeof(Player1) == "Instance" and Player1:IsA("Player") then
		ClockTimes[Player.UserId] = ClockTime
		local OsPlatform = Player1.OsPlatform
		RequestDeviceCameraOrientationCapability:FireClient(Player, Player1, OsPlatform == "iOS" or OsPlatform == "Android")
		
		return
	end
end)
Players.PlayerRemoving:Connect(function(Player)
	-- upvalues: ClockTimes (copy)
	ClockTimes[Player.UserId] = nil
end)

if GetFFlagPlayerViewRemoteEnabledModule() then
	local RequestDeviceCameraCFrame = Instance.new("RemoteEvent")
	RequestDeviceCameraCFrame.Name = "RequestDeviceCameraCFrame"
	RequestDeviceCameraCFrame.Parent = RobloxReplicatedStorage
	local ReplicateDeviceCameraCFrame = Instance.new("UnreliableRemoteEvent")
	ReplicateDeviceCameraCFrame.Name = "ReplicateDeviceCameraCFrame"
	ReplicateDeviceCameraCFrame.Parent = RobloxReplicatedStorage
	local t = {}
	Players.PlayerRemoving:Connect(function(Player)
		-- upvalues: t (copy)
		t[tostring(Player.UserId)] = nil
	end)
	RequestDeviceCameraCFrame.OnServerEvent:Connect(function(Player: Player, Value: number)
		-- upvalues: EnablePlayerViewRemoteEventUserIdValidation2 (copy), Players (copy), t (copy), RequestDeviceCameraCFrame (copy)
		if EnablePlayerViewRemoteEventUserIdValidation2 then
			if typeof(Value) ~= "number" or Value <= 0 or Player.UserId == Value or math.floor(Value) ~= Value then return end
		elseif typeof(Value) ~= "number" or Value <= 0 or Player.UserId == Value then return end
		local Player1 = Players:GetPlayerByUserId(Value)
		
		if not Player1 then return end
		local Text = tostring(Player1.UserId)
		
		if not t[Text] then
			t[Text] = {}
		end
		t[Text][tostring(Player.UserId)] = os.clock()
		RequestDeviceCameraCFrame:FireClient(Player1)
	end)
	ReplicateDeviceCameraCFrame.OnServerEvent:Connect(function(Player, Player1, Player2: number)
		-- upvalues: t (copy), Players (copy), ReplicateDeviceCameraCFrame (copy)
		if typeof(Player1) ~= "CFrame" or typeof(Player2) ~= "number" or Player2 <= 0 then return end
		local Text = tostring(Player.UserId)
		
		if t[Text] then
			local List = {}
			
			for i, value in t[Text] do
				if os.clock() - value > 5 then
					table.insert(List, i)
				else
					local Number: number? = tonumber(i)
					
					if Number then
						local Player3 = Players:GetPlayerByUserId(Number)
						
						if Player3 then
							ReplicateDeviceCameraCFrame:FireClient(Player3, Player, Player1, Player2)
						end
					end
				end
			end
			for _, value1 in List do
				t[Text][value1] = nil
			end
		end
	end)
end