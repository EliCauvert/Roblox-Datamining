local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local playersService = game:GetService("Players")
local VRService = game:GetService("VRService")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local avatarUtil = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).AvatarUtil
local connectionUtil = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).ConnectionUtil
local VRAvatarGesturesAnalyticsThrottleHundrethsPercent = game:DefineFastInt("VRAvatarGesturesAnalyticsThrottleHundrethsPercent", 0)
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref), connectionUtil (ref), VRService (ref)
	local tbl = setmetatable({}, t)
	tbl.connections = connectionUtil.new()
	tbl.VRPlayers = {}
	tbl.connections:connect("AvatarGestures", VRService:GetPropertyChangedSignal("AvatarGestures"), function()
		-- upvalues: tbl (ref)
		tbl:onAvatarGesturesChanged()
	end)
	
	if VRService.AvatarGestures then
		tbl:onAvatarGesturesChanged()
	end
	return tbl
end

function cleanCharacter(p0)
	if p0.Character then
		local humanoid = p0.Character:FindFirstChild("Humanoid")
		
		if humanoid then
			for i, v in pairs({
				"TrackedIKLeftHand",
				"TrackedIKRightHand",
				"TrackedIKHead"
			}) do
				local var9 = humanoid:FindFirstChild(v)
				
				if var9 then
					var9:Destroy()
				end
			end
		end
		for i, v in pairs({ "TrackedLeftHand", "TrackedRightHand", "TrackedHead" }) do
			local var10 = p0.Character:FindFirstChild(v)
			
			if var10 then
				var10:Destroy()
			end
		end
	end
end

function t:onPlayerChanged(p1, p2)
	-- upvalues: avatarUtil (ref)
	self.VRPlayers[p1] = p2 or nil
	
	if not p2 then
		cleanCharacter(p1)
		
		return
	elseif not self.avatarUtil then
		self.avatarUtil = avatarUtil.new()
	end
	self.avatarUtil:connectPlayerCharacterChanges(p1, function(p3)
		-- upvalues: self (ref)
		self:onCharacterChanged(p3)
	end)
end

function t:onPlayerAdded(p4)
	-- upvalues: rbxAnalyticsService (ref), VRAvatarGesturesAnalyticsThrottleHundrethsPercent (ref)
	if next(self.VRPlayers) ~= nil then
		rbxAnalyticsService:ReportInfluxSeries("VRAvatarGestures", {
			calledFrom = "ServerPlayerAddedWithVRPlayer",
			placeId = game.PlaceId,
			playerUserID = p4.UserId
		}, VRAvatarGesturesAnalyticsThrottleHundrethsPercent)
	end
end

function t:onAvatarGesturesChanged()
	-- upvalues: VRService (ref), robloxReplicatedStorageService (ref), playersService (ref)
	if VRService.AvatarGestures then
		local avatarGesturesVRPlayer_1 = robloxReplicatedStorageService:FindFirstChild("AvatarGesturesVRPlayer")
		
		if not avatarGesturesVRPlayer_1 then
			avatarGesturesVRPlayer_1 = Instance.new("RemoteEvent")
			avatarGesturesVRPlayer_1.Name = "AvatarGesturesVRPlayer"
			avatarGesturesVRPlayer_1.Parent = robloxReplicatedStorageService
		end
		self.connections:connect("VRPlayerOnServerEvent", avatarGesturesVRPlayer_1.OnServerEvent, function(p5, p6)
			-- upvalues: self (ref)
			self:onPlayerChanged(p5, p6)
		end)
		self.connections:connect("PlayerAdded", playersService.PlayerAdded, function(p7)
			-- upvalues: self (ref)
			self:onPlayerAdded(p7)
		end)
		self.connections:connect("PlayerRemoving", playersService.PlayerRemoving, function(p8)
			-- upvalues: self (ref)
			self:onPlayerChanged(p8, false)
		end)
		
		return
	else
		for i in pairs(self.VRPlayers) do
			self:onPlayerChanged(i, false)
		end
		self.connections:disconnectAll()
		self.connections:connect("AvatarGestures", VRService:GetPropertyChangedSignal("AvatarGestures"), function()
			-- upvalues: self (ref)
			self:onAvatarGesturesChanged()
		end)
	end
end

function t.findOrCreateColliders(_, p9, p10)
	-- upvalues: playersService (ref)
	local var12 = playersService:GetPlayerFromCharacter(p10)
	local text = "Tracked" .. p9
	local var14 = p10:FindFirstChild(text)
	
	if not var14 then
		var14 = Instance.new("Part")
		var14.Name = text
		var14.Transparency = 1
		var14.CanCollide = false
		var14.Parent = p10
		var14:SetNetworkOwner(var12)
	end
	local var15 = var14:FindFirstChild(text .. "Attachment")
	
	if not var15 then
		var15 = Instance.new("Attachment")
		var15.Name = text .. "Attachment"
		var15.Parent = var14
	end
	local var16 = var14:FindFirstChild(text .. "AlignPosition")
	
	if not var16 then
		var16 = Instance.new("AlignPosition")
		var16.Name = text .. "AlignPosition"
		var16.Mode = Enum.PositionAlignmentMode.OneAttachment
		var16.Attachment0 = var15
		var16.RigidityEnabled = true
		var16.Parent = var14
	end
	local var17 = var14:FindFirstChild(text .. "AlignOrientation")
	
	if not var17 then
		var17 = Instance.new("AlignOrientation")
		var17.Name = text .. "AlignOrientation"
		var17.Mode = Enum.OrientationAlignmentMode.OneAttachment
		var17.Attachment0 = var15
		var17.RigidityEnabled = true
		var17.Parent = var14
	end
	local var18 = p10:FindFirstChild(p9)
	
	if var18 then
		var14.Size = var18.Size
		var14.CFrame = var18.CFrame
		var16.Position = var18.Position
		var17.CFrame = var18.CFrame
	else
		var14.Size = Vector3.new(1, 1, 1)
		var14.CFrame = p10.WorldPivot
		var16.Position = p10.WorldPivot.Position
		var17.CFrame = p10.WorldPivot
	end
	local humanoid = p10:FindFirstChild("Humanoid")
	
	if humanoid then
		local text_1 = "TrackedIK" .. p9
		local var21 = humanoid:FindFirstChild(text_1)
		
		if not var21 then
			var21 = Instance.new("IKControl")
			var21.Name = text_1
		end
		var21.SmoothTime = 0.1
		var21.Parent = humanoid
		var21.Target = var14
	end
end

function t:createHandCollider(p11, p12)
	self:findOrCreateColliders(p11 .. "Hand", p12)
	local var22 = p12:FindFirstChild(p11 .. "Hand")
	local humanoid = p12:FindFirstChild("Humanoid")
	
	if humanoid then
		local var24 = humanoid:FindFirstChild("TrackedIK" .. p11 .. "Hand")
		
		if var24 then
			var24.Type = Enum.IKControlType.Transform
			local var25 = p12:FindFirstChild(p11 .. "UpperArm")
			
			if var25 then
				var24.ChainRoot = var22
				coroutine.wrap(function()
					-- upvalues: var24 (ref), var25 (ref)
					task.wait(0.1)
					var24.ChainRoot = var25
				end)()
			end
			if var22 then
				var24.EndEffector = var22
			end
			var24.Priority = 1
		end
	end
	if var22 then
		local ragdollBallSocket = var22:FindFirstChild("RagdollBallSocket")
		
		if ragdollBallSocket then
			ragdollBallSocket.LimitsEnabled = false
		end
	end
end

function t:createHeadCollider(p13)
	self:findOrCreateColliders("Head", p13)
	local head = p13:FindFirstChild("Head")
	local humanoid = p13:FindFirstChild("Humanoid")
	
	if humanoid then
		local trackedIKHead = humanoid:FindFirstChild("TrackedIKHead")
		
		if trackedIKHead then
			trackedIKHead.Type = Enum.IKControlType.Rotation
			local upperTorso = p13:FindFirstChild("UpperTorso")
			
			if upperTorso then
				trackedIKHead.ChainRoot = upperTorso
			end
			if head then
				trackedIKHead.EndEffector = head
			end
		end
	end
end

function t:onCharacterChanged(p14)
	-- upvalues: playersService (ref), VRService (ref)
	if self.VRPlayers[playersService:GetPlayerFromCharacter(p14)] and VRService.AvatarGestures then
		self:createHandCollider("Left", p14)
		self:createHandCollider("Right", p14)
		self:createHeadCollider(p14)
	end
end

return t