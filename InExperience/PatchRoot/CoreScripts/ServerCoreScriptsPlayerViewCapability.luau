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
requestDeviceCameraOrientationCapability.OnServerEvent:Connect(function(p0, p1)
	-- upvalues: t (ref), requestDeviceCameraOrientationCapability (ref)
	local processTime = os.clock()
	local userId = t[p0.UserId]
	
	if userId and processTime - userId < 2 then return end
	if typeof(p1) ~= "Instance" or not p1:IsA("Player") then return end
	t[p0.UserId] = processTime
	local osPlatform = p1.OsPlatform
	requestDeviceCameraOrientationCapability:FireClient(p0, p1, if osPlatform ~= "iOS" then osPlatform == "Android" else true)
end)
playersService.PlayerRemoving:Connect(function(p2)
	-- upvalues: t (ref)
	t[p2.UserId] = nil
end)

if getFFlagPlayerViewRemoteEnabledModule() then
	local requestDeviceCameraCFrame = Instance.new("RemoteEvent")
	requestDeviceCameraCFrame.Name = "RequestDeviceCameraCFrame"
	requestDeviceCameraCFrame.Parent = robloxReplicatedStorageService
	local replicateDeviceCameraCFrame = Instance.new("UnreliableRemoteEvent")
	replicateDeviceCameraCFrame.Name = "ReplicateDeviceCameraCFrame"
	replicateDeviceCameraCFrame.Parent = robloxReplicatedStorageService
	local t_1 = {}
	playersService.PlayerRemoving:Connect(function(p3)
		-- upvalues: t_1 (ref)
		t_1[tostring(p3.UserId)] = nil
	end)
	requestDeviceCameraCFrame.OnServerEvent:Connect(function(p4, p5)
		-- upvalues: enablePlayerViewRemoteEventUserIdValidation2 (ref), playersService (ref), t_1 (ref), requestDeviceCameraCFrame (ref)
		if enablePlayerViewRemoteEventUserIdValidation2 then
			if typeof(p5) ~= "number" or p5 <= 0 or (p4.UserId == p5 or math.floor(p5) ~= p5) then return end
		elseif typeof(p5) ~= "number" or p5 <= 0 or p4.UserId == p5 then return end
		local var11 = playersService:GetPlayerByUserId(p5)
		
		if not var11 then return end
		local var12 = tostring(var11.UserId)
		
		if not t_1[var12] then
			t_1[var12] = {}
		end
		t_1[var12][tostring(p4.UserId)] = os.clock()
		requestDeviceCameraCFrame:FireClient(var11)
	end)
	replicateDeviceCameraCFrame.OnServerEvent:Connect(function(p6, p7, p8)
		-- upvalues: t_1 (ref), playersService (ref), replicateDeviceCameraCFrame (ref)
		if typeof(p7) ~= "CFrame" or typeof(p8) ~= "number" or p8 <= 0 then return end
		local var13 = tostring(p6.UserId)
		
		if t_1[var13] then
			local t = {}
			
			for i, v in t_1[var13] do
				if os.clock() - v > 5 then
					table.insert(t, i)
				else
					local var15 = tonumber(i)
					
					if var15 then
						local var16 = playersService:GetPlayerByUserId(var15)
						
						if var16 then
							replicateDeviceCameraCFrame:FireClient(var16, p6, p7, p8)
						end
					end
				end
			end
			for i_1, v_1 in t do
				t_1[var13][v_1] = nil
			end
		end
	end)
end