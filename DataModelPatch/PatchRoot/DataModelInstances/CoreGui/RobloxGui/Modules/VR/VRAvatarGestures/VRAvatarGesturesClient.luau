local VRService = game:GetService("VRService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local CoreScriptsCommonModule = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsCommon)
local ConnectionUtil = CoreScriptsCommonModule.ConnectionUtil
local AvatarUtil = CoreScriptsCommonModule.AvatarUtil
local DebugImmersionModeNonVR = game:DefineFastFlag("DebugImmersionModeNonVR", false)
local VRAvatarGesturesAnalyticsThrottleHundrethsPercent = game:DefineFastInt("VRAvatarGesturesAnalyticsThrottleHundrethsPercent", 0)
local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy), ConnectionUtil (copy), VRService (copy)
	local self = setmetatable({}, Module)
	self.partCFrameMap = {}
	self.connections = ConnectionUtil.new()
	self.analyticsSendEnabled = true
	self.connections:connect("AvatarGestures", VRService:GetPropertyChangedSignal("AvatarGestures"), function()
		-- upvalues: self (copy)
		self:onAvatarGesturesChanged()
	end)
	
	if VRService.AvatarGestures then
		self:onAvatarGesturesChanged()
	end
	return self
end

function Module:onCharacterChanged(Character)
	-- upvalues: VRService (copy)
	local Humanoid = Character:FindFirstChild("Humanoid")
	
	if not Humanoid then return end
	for _, ChildName in pairs({
		"TrackedIKLeftHand",
		"TrackedIKRightHand",
		"TrackedIKHead"
	}) do
		local Child = Humanoid:FindFirstChild(ChildName)
		
		if Child then
			Child.SmoothTime = 0
		end
	end
	local CurrentCamera = workspace.CurrentCamera
	
	if CurrentCamera then
		local function updateSeated(Sit)
			-- upvalues: CurrentCamera (copy), Humanoid (copy)
			local IsVehicleSeat = CurrentCamera.CameraSubject and CurrentCamera.CameraSubject:IsA("VehicleSeat")
			local IsMagnitudeBelow = (CurrentCamera.CFrame.Position - CurrentCamera.Focus.Position).Magnitude <= 5
			local TrackedIKHead = Humanoid:FindFirstChild("TrackedIKHead")
			
			if TrackedIKHead then
				if Sit and not IsVehicleSeat and IsMagnitudeBelow then
					TrackedIKHead.Type = Enum.IKControlType.Transform
					
					return
				end
				TrackedIKHead.Type = Enum.IKControlType.Rotation
			end
		end
		
		updateSeated(Humanoid.Sit)
		self.connections:connect("Seated", Humanoid.Seated, function(p1)
			-- upvalues: updateSeated (copy), CurrentCamera (copy), VRService (upval)
			updateSeated(p1)
			
			if p1 and (CurrentCamera.CFrame.Position - CurrentCamera.Focus.Position).Magnitude <= 5 then
				VRService:RecenterUserHeadCFrame()
			end
		end)
		
		return
	end
end

function Module:onAvatarGesturesChanged()
	-- upvalues: VRService (copy), DebugImmersionModeNonVR (copy), RobloxReplicatedStorage (copy), AvatarUtil (copy), Players (copy), RbxAnalyticsService (copy), VRAvatarGesturesAnalyticsThrottleHundrethsPercent (copy)
	if VRService.AvatarGestures then
		if VRService.VREnabled or DebugImmersionModeNonVR then
			local AvatarGesturesVRPlayer = RobloxReplicatedStorage:WaitForChild("AvatarGesturesVRPlayer", 5)
			
			if not AvatarGesturesVRPlayer then
				warn("VRService.AvatarGestures failed to connect to server")
				
				return
			end
			AvatarGesturesVRPlayer:FireServer(true)
			self:connectInputCFrames()
			
			if self.avatarUtil then
				if Players.LocalPlayer and Players.LocalPlayer.Character then
					self:onCharacterChanged(Players.LocalPlayer.Character)
				end
			else
				self.avatarUtil = AvatarUtil.new()
				self.avatarUtil:connectLocalCharacterChanges(function(p1)
					-- upvalues: self (copy)
					self:onCharacterChanged(p1)
				end)
			end
			if self.analyticsSendEnabled then
				self.analyticsSendEnabled = nil
				RbxAnalyticsService:ReportInfluxSeries("VRAvatarGestures", { calledFrom = "ClientJoined", placeId = game.PlaceId }, VRAvatarGesturesAnalyticsThrottleHundrethsPercent)
				
				return
			end
		end
	else
		if VRService.VREnabled or DebugImmersionModeNonVR then
			local AvatarGesturesVRPlayer = RobloxReplicatedStorage:FindFirstChild("AvatarGesturesVRPlayer")
			
			if AvatarGesturesVRPlayer then
				AvatarGesturesVRPlayer:FireServer(false)
			end
		end
		self.connections:disconnectAll()
		self.connections:connect("AvatarGestures", VRService:GetPropertyChangedSignal("AvatarGestures"), function()
			-- upvalues: self (copy)
			self:onAvatarGesturesChanged()
		end)
	end
end

function Module:updateCFrames(Text, p1)
	-- upvalues: Players (copy), VRService (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if not Players.LocalPlayer then return end
	local Character = LocalPlayer.Character
	
	if not LocalPlayer.Character then return end
	local Text1 = Character:FindFirstChild(Text)
	
	if not Text1 then return end
	local CurrentCamera = workspace.CurrentCamera
	
	if not CurrentCamera then return end
	if not Text1:FindFirstChild(Text .. "Attachment") then return end
	local Child = Text1:FindFirstChild(Text .. "AlignPosition")
	
	if not Child then return end
	local Child1 = Text1:FindFirstChild(Text .. "AlignOrientation")
	
	if not Child1 then return end
	if VRService.VREnabled then
		local NewRotation = p1.Rotation + p1.Position * CurrentCamera.HeadScale
		local ScaledNewRotation = CurrentCamera.CFrame * NewRotation
		local Head = Character:FindFirstChild("Head")
		
		if (CurrentCamera.CFrame.Position - CurrentCamera.Focus.Position).Magnitude > 5 and Head then
			local UserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.Head)
			local ScaledRotation = CurrentCamera.CFrame * (UserCFrame.Rotation + UserCFrame.Position * CurrentCamera.HeadScale) * CFrame.new(0, 0, 0.5)
			
			if Text == "TrackedHead" then
				local PrimaryPartCFrame = Character.PrimaryPart.CFrame
				Child.Position = (PrimaryPartCFrame * CFrame.new(0, PrimaryPartCFrame.Position.Y * 0.25, -PrimaryPartCFrame.Position.Y * 0.125)).Position
				Child1.CFrame = PrimaryPartCFrame * NewRotation
			else
				local WorldPoint = Head.CFrame:ToWorldSpace(ScaledRotation:ToObjectSpace(ScaledNewRotation))
				Child.Position = WorldPoint.Position
				Child1.CFrame = WorldPoint * CFrame.Angles(1.5707963267948966, 0, 0)
			end
		else
			Child.Position = ScaledNewRotation.Position
			
			if Text == "TrackedHead" then
				Child1.CFrame = ScaledNewRotation
			else
				Child1.CFrame = ScaledNewRotation * CFrame.Angles(1.5707963267948966, 0, 0)
			end
		end
	else
		local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
		local v1 = if Text == "TrackedHead" then HumanoidRootPart.CFrame * p1 else HumanoidRootPart.CFrame * p1 * CFrame.Angles(0, 0, (math.rad(time() * 30))) * CFrame.new(1, 0, -0.5)
		
		if HumanoidRootPart then
			Child.Position = v1.Position
			Child1.CFrame = v1
		end
	end
	Text1.CFrame = CFrame.new(Child.Position) * Child1.CFrame.Rotation
end

function Module:steppedCframes()
	for i, value in pairs(self.partCFrameMap) do
		self:updateCFrames(i, value)
	end
end

function Module:connectInputCFrames()
	-- upvalues: VRService (copy), DebugImmersionModeNonVR (copy), RunService (copy)
	if VRService.VREnabled then
		self.connections:connect("UserCFrameChanged", VRService.UserCFrameChanged, function(UserCFrame, TrackedHead)
			-- upvalues: self (copy)
			if UserCFrame == Enum.UserCFrame.LeftHand then
				self.partCFrameMap.TrackedLeftHand = TrackedHead
				
				return
			end
			if UserCFrame == Enum.UserCFrame.RightHand then
				self.partCFrameMap.TrackedRightHand = TrackedHead
				
				return
			end
			if UserCFrame == Enum.UserCFrame.Head then
				self.partCFrameMap.TrackedHead = TrackedHead
			end
		end)
	elseif DebugImmersionModeNonVR then
		self.connections:connect("NonVRSimulateInput", RunService.RenderStepped, function(_)
			-- upvalues: self (copy)
			self.partCFrameMap.TrackedLeftHand = CFrame.new(-0.5, 0, -0.5)
			self.partCFrameMap.TrackedRightHand = CFrame.new(0.5, 0, -0.5)
			self.partCFrameMap.TrackedHead = CFrame.new(0, 1, 0)
		end)
	end
	if VRService.VREnabled or DebugImmersionModeNonVR then
		self.connections:connect("RenderStepped", RunService.RenderStepped, function(_)
			-- upvalues: self (copy)
			self:steppedCframes()
		end)
	end
end

return Module.new()