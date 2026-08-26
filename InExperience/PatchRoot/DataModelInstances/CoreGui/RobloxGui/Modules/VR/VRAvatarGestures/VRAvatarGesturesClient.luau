local VRService = game:GetService("VRService")
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local coreScriptsCommonModule = require(corePackagesService.Workspace.Packages.CoreScriptsCommon)
local connectionUtil = coreScriptsCommonModule.ConnectionUtil
local avatarUtil = coreScriptsCommonModule.AvatarUtil
local debugImmersionModeNonVR = game:DefineFastFlag("DebugImmersionModeNonVR", false)
local VRAvatarGesturesAnalyticsThrottleHundrethsPercent = game:DefineFastInt("VRAvatarGesturesAnalyticsThrottleHundrethsPercent", 0)
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref), connectionUtil (ref), VRService (ref)
	local tbl = setmetatable({}, t)
	tbl.partCFrameMap = {}
	tbl.connections = connectionUtil.new()
	tbl.analyticsSendEnabled = true
	tbl.connections:connect("AvatarGestures", VRService:GetPropertyChangedSignal("AvatarGestures"), function()
		-- upvalues: tbl (ref)
		tbl:onAvatarGesturesChanged()
	end)
	
	if VRService.AvatarGestures then
		tbl:onAvatarGesturesChanged()
	end
	return tbl
end

function t:onCharacterChanged(p1)
	-- upvalues: VRService (ref)
	local humanoid = p1:FindFirstChild("Humanoid")
	
	if not humanoid then return end
	for i, v in pairs({
		"TrackedIKLeftHand",
		"TrackedIKRightHand",
		"TrackedIKHead"
	}) do
		local var1 = humanoid:FindFirstChild(v)
		
		if var1 then
			var1.SmoothTime = 0
		end
	end
	local currentCamera = workspace.CurrentCamera
	
	if currentCamera then
		local function updateSeated(p2)
			-- upvalues: currentCamera (ref), humanoid (ref)
			local vehicleSeat = currentCamera.CameraSubject and currentCamera.CameraSubject:IsA("VehicleSeat")
			local var2 = (currentCamera.CFrame.Position - currentCamera.Focus.Position).Magnitude <= 5
			local trackedIKHead = humanoid:FindFirstChild("TrackedIKHead")
			
			if trackedIKHead then
				if p2 and not vehicleSeat and var2 then
					trackedIKHead.Type = Enum.IKControlType.Transform
					
					return
				end
				trackedIKHead.Type = Enum.IKControlType.Rotation
			end
		end
		
		updateSeated(humanoid.Sit)
		self.connections:connect("Seated", humanoid.Seated, function(p2)
			-- upvalues: updateSeated (ref), currentCamera (ref), VRService (copy)
			updateSeated(p2)
			
			if p2 and (currentCamera.CFrame.Position - currentCamera.Focus.Position).Magnitude <= 5 then
				VRService:RecenterUserHeadCFrame()
			end
		end)
		
		return
	end
end

function t:onAvatarGesturesChanged()
	-- upvalues: VRService (ref), debugImmersionModeNonVR (ref), robloxReplicatedStorageService (ref), avatarUtil (ref), playersService (ref), rbxAnalyticsService (ref), VRAvatarGesturesAnalyticsThrottleHundrethsPercent (ref)
	if not VRService.AvatarGestures then
		if VRService.VREnabled or debugImmersionModeNonVR then
			local avatarGesturesVRPlayer = robloxReplicatedStorageService:FindFirstChild("AvatarGesturesVRPlayer")
			
			if avatarGesturesVRPlayer then
				avatarGesturesVRPlayer:FireServer(false)
			end
		end
		self.connections:disconnectAll()
		self.connections:connect("AvatarGestures", VRService:GetPropertyChangedSignal("AvatarGestures"), function()
			-- upvalues: self (ref)
			self:onAvatarGesturesChanged()
		end)
	elseif VRService.VREnabled or debugImmersionModeNonVR then
		local avatarGesturesVRPlayer = robloxReplicatedStorageService:WaitForChild("AvatarGesturesVRPlayer", 5)
		
		if not avatarGesturesVRPlayer then
			warn("VRService.AvatarGestures failed to connect to server")
			
			return
		end
		avatarGesturesVRPlayer:FireServer(true)
		self:connectInputCFrames()
		
		if not self.avatarUtil then
			self.avatarUtil = avatarUtil.new()
			self.avatarUtil:connectLocalCharacterChanges(function(p2)
				-- upvalues: self (ref)
				self:onCharacterChanged(p2)
			end)
		elseif playersService.LocalPlayer and playersService.LocalPlayer.Character then
			self:onCharacterChanged(playersService.LocalPlayer.Character)
		end
		if self.analyticsSendEnabled then
			self.analyticsSendEnabled = nil
			rbxAnalyticsService:ReportInfluxSeries("VRAvatarGestures", { calledFrom = "ClientJoined", placeId = game.PlaceId }, VRAvatarGesturesAnalyticsThrottleHundrethsPercent)
			
			return
		end
	end
end

function t.updateCFrames(_, p2, p3)
	-- upvalues: playersService (ref), VRService (ref)
	local localPlayer = playersService.LocalPlayer
	
	if not playersService.LocalPlayer then return end
	local character = localPlayer.Character
	
	if not localPlayer.Character then return end
	local var2 = character:FindFirstChild(p2)
	
	if not var2 then return end
	local currentCamera = workspace.CurrentCamera
	
	if not currentCamera then return end
	if not var2:FindFirstChild(p2 .. "Attachment") then return end
	local var3 = var2:FindFirstChild(p2 .. "AlignPosition")
	
	if not var3 then return end
	local var4 = var2:FindFirstChild(p2 .. "AlignOrientation")
	
	if not var4 then return end
	if VRService.VREnabled then
		p3 = p3.Rotation + p3.Position * currentCamera.HeadScale
		local var5 = currentCamera.CFrame * p3
		local head = character:FindFirstChild("Head")
		
		if (currentCamera.CFrame.Position - currentCamera.Focus.Position).Magnitude > 5 and head then
			local headUserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.Head)
			local var6 = currentCamera.CFrame * (headUserCFrame.Rotation + headUserCFrame.Position * currentCamera.HeadScale) * CFrame.new(0, 0, 0.5)
			
			if p2 == "TrackedHead" then
				local cFrame = character.PrimaryPart.CFrame
				var3.Position = (cFrame * CFrame.new(0, cFrame.Position.Y * 0.25, -cFrame.Position.Y * 0.125)).Position
				var4.CFrame = cFrame * p3
			else
				local var7 = head.CFrame:ToWorldSpace(var6:ToObjectSpace(var5))
				var3.Position = var7.Position
				var4.CFrame = var7 * CFrame.Angles(1.570796326795, 0, 0)
			end
		else
			var3.Position = var5.Position
			
			if p2 == "TrackedHead" then
				var4.CFrame = var5
			else
				var4.CFrame = var5 * CFrame.Angles(1.570796326795, 0, 0)
			end
		end
	else
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		local var8 = if p2 ~= "TrackedHead" then humanoidRootPart.CFrame * p3 else humanoidRootPart.CFrame * p3 * CFrame.Angles(0, 0, math.rad(time() * 30)) * CFrame.new(1, 0, -0.5)
		
		if humanoidRootPart then
			var3.Position = var8.Position
			var4.CFrame = var8
		end
	end
	var2.CFrame = CFrame.new(var3.Position) * var4.CFrame.Rotation
end

function t:steppedCframes()
	for i, v in pairs(self.partCFrameMap) do
		self:updateCFrames(i, v)
	end
end

function t:connectInputCFrames()
	-- upvalues: VRService (ref), debugImmersionModeNonVR (ref), runService (ref)
	if VRService.VREnabled then
		self.connections:connect("UserCFrameChanged", VRService.UserCFrameChanged, function(p2, p3)
			-- upvalues: self (ref)
			if p2 == Enum.UserCFrame.LeftHand then
				self.partCFrameMap.TrackedLeftHand = p3
				
				return
			elseif p2 == Enum.UserCFrame.RightHand then
				self.partCFrameMap.TrackedRightHand = p3
				
				return
			elseif p2 == Enum.UserCFrame.Head then
				self.partCFrameMap.TrackedHead = p3
			end
		end)
	elseif debugImmersionModeNonVR then
		self.connections:connect("NonVRSimulateInput", runService.RenderStepped, function(_)
			-- upvalues: self (ref)
			self.partCFrameMap.TrackedLeftHand = CFrame.new(-0.5, 0, -0.5)
			self.partCFrameMap.TrackedRightHand = CFrame.new(0.5, 0, -0.5)
			self.partCFrameMap.TrackedHead = CFrame.new(0, 1, 0)
		end)
	end
	if VRService.VREnabled or debugImmersionModeNonVR then
		self.connections:connect("RenderStepped", runService.RenderStepped, function(_)
			-- upvalues: self (ref)
			self:steppedCframes()
		end)
	end
end

return t.new()