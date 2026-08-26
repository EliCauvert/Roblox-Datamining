local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local playersService = game:GetService("Players")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui", 1e999)
assert(robloxGui ~= nil, "RobloxGui should exist")
local getFFlagPlayerViewRemoteEnabledModule = require(robloxGui.Modules.Common.Flags.GetFFlagPlayerViewRemoteEnabled)
local enablePlayerViewRemoteEventUserIdValidation2 = game:DefineFastFlag("EnablePlayerViewRemoteEventUserIdValidation2", false)
local requestDeviceCameraOrientationCapability = Instance.new("RemoteEvent")
requestDeviceCameraOrientationCapability.Name = "RequestDeviceCameraOrientationCapability"
requestDeviceCameraOrientationCapability.Parent = robloxReplicatedStorageService
local t = {}
requestDeviceCameraOrientationCapability.OnServerEvent:Connect(function(p1, p2)
	-- upvalues: t (ref), requestDeviceCameraOrientationCapability (ref)
	local processTime = os.clock()
	local userId = t[p1.UserId]
	
	if userId and processTime - userId < 2 then return end
	if typeof(p2) ~= "Instance" or not p2:IsA("Player") then return end
	t[p1.UserId] = processTime
	local osPlatform = p2.OsPlatform
	requestDeviceCameraOrientationCapability:FireClient(p1, p2, if osPlatform ~= "iOS" then osPlatform == "Android" else true)
end)
playersService.PlayerRemoving:Connect(function(p1)
	-- upvalues: t (ref)
	t[p1.UserId] = nil
end)

if getFFlagPlayerViewRemoteEnabledModule() then
	local requestDeviceCameraCFrame = Instance.new("RemoteEvent")
	requestDeviceCameraCFrame.Name = "RequestDeviceCameraCFrame"
	requestDeviceCameraCFrame.Parent = robloxReplicatedStorageService
	local replicateDeviceCameraCFrame = Instance.new("UnreliableRemoteEvent")
	replicateDeviceCameraCFrame.Name = "ReplicateDeviceCameraCFrame"
	replicateDeviceCameraCFrame.Parent = robloxReplicatedStorageService
	local t_1 = {}
	playersService.PlayerRemoving:Connect(function(p1)
		-- upvalues: t_1 (ref)
		t_1[tostring(p1.UserId)] = nil
	end)
	requestDeviceCameraCFrame.OnServerEvent:Connect(function(p1, p2)
		-- upvalues: enablePlayerViewRemoteEventUserIdValidation2 (ref), playersService (ref), t_1 (ref), requestDeviceCameraCFrame (ref)
		if enablePlayerViewRemoteEventUserIdValidation2 then
			if typeof(p2) ~= "number" or p2 <= 0 or (p1.UserId == p2 or math.floor(p2) ~= p2) then return end
		elseif typeof(p2) ~= "number" or p2 <= 0 or p1.UserId == p2 then return end
		local var1 = playersService:GetPlayerByUserId(p2)
		
		if not var1 then return end
		local var2 = tostring(var1.UserId)
		
		if not t_1[var2] then
			t_1[var2] = {}
		end
		t_1[var2][tostring(p1.UserId)] = os.clock()
		requestDeviceCameraCFrame:FireClient(var1)
	end)
	replicateDeviceCameraCFrame.OnServerEvent:Connect(function(p1, p2, p3)
		-- upvalues: t_1 (ref), playersService (ref), replicateDeviceCameraCFrame (ref)
		if typeof(p2) ~= "CFrame" or typeof(p3) ~= "number" or p3 <= 0 then return end
		local var1 = tostring(p1.UserId)
		
		if t_1[var1] then
			local t = {}
			
			for i, v in t_1[var1] do
				if os.clock() - v > 5 then
					table.insert(t, i)
				else
					local var2 = tonumber(i)
					
					if var2 then
						local var3 = playersService:GetPlayerByUserId(var2)
						
						if var3 then
							replicateDeviceCameraCFrame:FireClient(var3, p1, p2, p3)
						end
					end
				end
			end
			for i_1, v_1 in t do
				t_1[var1][v_1] = nil
			end
		end
	end)
end