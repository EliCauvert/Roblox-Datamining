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

function t.new() --[[ line: 55 ]]
	-- upvalues: t (ref), connectionUtil (ref), VRService (ref)
	local tbl = setmetatable({}, t)
	tbl.partCFrameMap = {}
	tbl.connections = connectionUtil.new()
	tbl.analyticsSendEnabled = true
	tbl.connections:connect("AvatarGestures", VRService:GetPropertyChangedSignal("AvatarGestures"), function() --[[ line: 60 ]]
		-- upvalues: tbl (ref)
		tbl:onAvatarGesturesChanged()
	end)
	
	if VRService.AvatarGestures then
		tbl:onAvatarGesturesChanged()
	end
	return tbl
end

function t:onCharacterChanged(p0) --[[ line: 65 ]]
	-- upvalues: VRService (ref)
	local humanoid = p0:FindFirstChild("Humanoid")
	
	if not humanoid then return end
	for i, v in pairs({
		"TrackedIKLeftHand",
		"TrackedIKRightHand",
		"TrackedIKHead"
	}) do
		local var13 = humanoid:FindFirstChild(v)
		
		if var13 then
			var13.SmoothTime = 0
		end
	end
	local currentCamera = workspace.CurrentCamera
	
	if currentCamera then
		local function updateSeated(p1) --[[ line: 86 ]]
			-- upvalues: currentCamera (ref), humanoid (ref)
			local vehicleSeat = currentCamera.CameraSubject and currentCamera.CameraSubject:IsA("VehicleSeat")
			local var15 = (currentCamera.CFrame.Position - currentCamera.Focus.Position).Magnitude <= 5
			local trackedIKHead = humanoid:FindFirstChild("TrackedIKHead")
			
			if trackedIKHead then
				if p1 and not vehicleSeat and var15 then
					trackedIKHead.Type = Enum.IKControlType.Transform
					
					return
				end
				trackedIKHead.Type = Enum.IKControlType.Rotation
			end
		end
		
		updateSeated(humanoid.Sit)
		self.connections:connect("Seated", humanoid.Seated, function(p2) --[[ line: 102 ]]
			-- upvalues: updateSeated (ref), currentCamera (ref), VRService (copy)
			updateSeated(p2)
			
			if p2 and (currentCamera.CFrame.Position - currentCamera.Focus.Position).Magnitude <= 5 then
				VRService:RecenterUserHeadCFrame()
			end
		end)
		
		return
	end
end

function t:onAvatarGesturesChanged() --[[ line: 111 ]]
	-- upvalues: VRService (ref), debugImmersionModeNonVR (ref), robloxReplicatedStorageService (ref), avatarUtil (ref), playersService (ref), rbxAnalyticsService (ref), VRAvatarGesturesAnalyticsThrottleHundrethsPercent (ref)
	if not VRService.AvatarGestures then
		if VRService.VREnabled or debugImmersionModeNonVR then
			local avatarGesturesVRPlayer = robloxReplicatedStorageService:FindFirstChild("AvatarGesturesVRPlayer")
			
			if avatarGesturesVRPlayer then
				avatarGesturesVRPlayer:FireServer(false)
			end
		end
		self.connections:disconnectAll()
		self.connections:connect("AvatarGestures", VRService:GetPropertyChangedSignal("AvatarGestures"), function() --[[ line: 157 ]]
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
			self.avatarUtil:connectLocalCharacterChanges(function(p3) --[[ line: 128 ]]
				-- upvalues: self (ref)
				self:onCharacterChanged(p3)
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

function t.updateCFrames(_, p4, p5) --[[ line: 161 ]]
	-- upvalues: playersService (ref), VRService (ref)
	local localPlayer = playersService.LocalPlayer
	
	if not playersService.LocalPlayer then return end
	local character = localPlayer.Character
	
	if not localPlayer.Character then return end
	local var19 = character:FindFirstChild(p4)
	
	if not var19 then return end
	local currentCamera = workspace.CurrentCamera
	
	if not currentCamera then return end
	if not var19:FindFirstChild(p4 .. "Attachment") then return end
	local var20 = var19:FindFirstChild(p4 .. "AlignPosition")
	
	if not var20 then return end
	local var21 = var19:FindFirstChild(p4 .. "AlignOrientation")
	
	if not var21 then return end
	if VRService.VREnabled then
		p5 = p5.Rotation + p5.Position * currentCamera.HeadScale
		local var22 = currentCamera.CFrame * p5
		local head = character:FindFirstChild("Head")
		
		if (currentCamera.CFrame.Position - currentCamera.Focus.Position).Magnitude > 5 and head then
			local headUserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.Head)
			local var25 = currentCamera.CFrame * (headUserCFrame.Rotation + headUserCFrame.Position * currentCamera.HeadScale) * CFrame.new(0, 0, 0.5)
			
			if p4 == "TrackedHead" then
				local cFrame = character.PrimaryPart.CFrame
				var20.Position = (cFrame * CFrame.new(0, cFrame.Position.Y * 0.25, -cFrame.Position.Y * 0.125)).Position
				var21.CFrame = cFrame * p5
			else
				local var26 = head.CFrame:ToWorldSpace(var25:ToObjectSpace(var22))
				var20.Position = var26.Position
				var21.CFrame = var26 * CFrame.Angles(1.570796326795, 0, 0)
			end
		else
			var20.Position = var22.Position
			
			if p4 == "TrackedHead" then
				var21.CFrame = var22
			else
				var21.CFrame = var22 * CFrame.Angles(1.570796326795, 0, 0)
			end
		end
	else
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		local var28 = if p4 ~= "TrackedHead" then humanoidRootPart.CFrame * p5 else humanoidRootPart.CFrame * p5 * CFrame.Angles(0, 0, math.rad(time() * 30)) * CFrame.new(1, 0, -0.5)
		
		if humanoidRootPart then
			var20.Position = var28.Position
			var21.CFrame = var28
		end
	end
	var19.CFrame = CFrame.new(var20.Position) * var21.CFrame.Rotation
end

function t:steppedCframes() --[[ line: 253 ]]
	for i, v in pairs(self.partCFrameMap) do
		self:updateCFrames(i, v)
	end
end

function t:connectInputCFrames() --[[ line: 259 ]]
	-- upvalues: VRService (ref), debugImmersionModeNonVR (ref), runService (ref)
	if VRService.VREnabled then
		self.connections:connect("UserCFrameChanged", VRService.UserCFrameChanged, function(p6, p7) --[[ line: 261 ]]
			-- upvalues: self (ref)
			if p6 == Enum.UserCFrame.LeftHand then
				self.partCFrameMap.TrackedLeftHand = p7
				
				return
			elseif p6 == Enum.UserCFrame.RightHand then
				self.partCFrameMap.TrackedRightHand = p7
				
				return
			elseif p6 == Enum.UserCFrame.Head then
				self.partCFrameMap.TrackedHead = p7
			end
		end)
	elseif debugImmersionModeNonVR then
		self.connections:connect("NonVRSimulateInput", runService.RenderStepped, function(_) --[[ line: 271 ]]
			-- upvalues: self (ref)
			self.partCFrameMap.TrackedLeftHand = CFrame.new(-0.5, 0, -0.5)
			self.partCFrameMap.TrackedRightHand = CFrame.new(0.5, 0, -0.5)
			self.partCFrameMap.TrackedHead = CFrame.new(0, 1, 0)
		end)
	end
	if VRService.VREnabled or debugImmersionModeNonVR then
		self.connections:connect("RenderStepped", runService.RenderStepped, function(_) --[[ line: 279 ]]
			-- upvalues: self (ref)
			self:steppedCframes()
		end)
	end
end

return t.new()