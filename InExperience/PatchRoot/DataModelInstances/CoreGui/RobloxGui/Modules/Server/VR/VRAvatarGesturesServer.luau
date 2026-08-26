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

function cleanCharacter(p1)
	if p1.Character then
		local humanoid = p1.Character:FindFirstChild("Humanoid")
		
		if humanoid then
			for i, v in pairs({
				"TrackedIKLeftHand",
				"TrackedIKRightHand",
				"TrackedIKHead"
			}) do
				local var1 = humanoid:FindFirstChild(v)
				
				if var1 then
					var1:Destroy()
				end
			end
		end
		for i, v in pairs({ "TrackedLeftHand", "TrackedRightHand", "TrackedHead" }) do
			local var2 = p1.Character:FindFirstChild(v)
			
			if var2 then
				var2:Destroy()
			end
		end
	end
end

function t:onPlayerChanged(p2, p3)
	-- upvalues: avatarUtil (ref)
	self.VRPlayers[p2] = p3 or nil
	
	if not p3 then
		cleanCharacter(p2)
		
		return
	elseif not self.avatarUtil then
		self.avatarUtil = avatarUtil.new()
	end
	self.avatarUtil:connectPlayerCharacterChanges(p2, function(p4)
		-- upvalues: self (ref)
		self:onCharacterChanged(p4)
	end)
end

function t:onPlayerAdded(p2)
	-- upvalues: rbxAnalyticsService (ref), VRAvatarGesturesAnalyticsThrottleHundrethsPercent (ref)
	if next(self.VRPlayers) ~= nil then
		rbxAnalyticsService:ReportInfluxSeries("VRAvatarGestures", {
			calledFrom = "ServerPlayerAddedWithVRPlayer",
			placeId = game.PlaceId,
			playerUserID = p2.UserId
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
		self.connections:connect("VRPlayerOnServerEvent", avatarGesturesVRPlayer_1.OnServerEvent, function(p2, p3)
			-- upvalues: self (ref)
			self:onPlayerChanged(p2, p3)
		end)
		self.connections:connect("PlayerAdded", playersService.PlayerAdded, function(p2)
			-- upvalues: self (ref)
			self:onPlayerAdded(p2)
		end)
		self.connections:connect("PlayerRemoving", playersService.PlayerRemoving, function(p2)
			-- upvalues: self (ref)
			self:onPlayerChanged(p2, false)
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

function t.findOrCreateColliders(_, p2, p3)
	-- upvalues: playersService (ref)
	local var3 = playersService:GetPlayerFromCharacter(p3)
	local text = "Tracked" .. p9
	local var4 = p3:FindFirstChild(text)
	
	if not var4 then
		var4 = Instance.new("Part")
		var4.Name = text
		var4.Transparency = 1
		var4.CanCollide = false
		var4.Parent = p3
		var4:SetNetworkOwner(var3)
	end
	local var5 = var4:FindFirstChild(text .. "Attachment")
	
	if not var5 then
		var5 = Instance.new("Attachment")
		var5.Name = text .. "Attachment"
		var5.Parent = var4
	end
	local var6 = var4:FindFirstChild(text .. "AlignPosition")
	
	if not var6 then
		var6 = Instance.new("AlignPosition")
		var6.Name = text .. "AlignPosition"
		var6.Mode = Enum.PositionAlignmentMode.OneAttachment
		var6.Attachment0 = var5
		var6.RigidityEnabled = true
		var6.Parent = var4
	end
	local var7 = var4:FindFirstChild(text .. "AlignOrientation")
	
	if not var7 then
		var7 = Instance.new("AlignOrientation")
		var7.Name = text .. "AlignOrientation"
		var7.Mode = Enum.OrientationAlignmentMode.OneAttachment
		var7.Attachment0 = var5
		var7.RigidityEnabled = true
		var7.Parent = var4
	end
	local var8 = p3:FindFirstChild(p2)
	
	if var8 then
		var4.Size = var8.Size
		var4.CFrame = var8.CFrame
		var6.Position = var8.Position
		var7.CFrame = var8.CFrame
	else
		var4.Size = Vector3.new(1, 1, 1)
		var4.CFrame = p3.WorldPivot
		var6.Position = p3.WorldPivot.Position
		var7.CFrame = p3.WorldPivot
	end
	local humanoid = p3:FindFirstChild("Humanoid")
	
	if humanoid then
		local text_1 = "TrackedIK" .. p9
		local var9 = humanoid:FindFirstChild(text_1)
		
		if not var9 then
			var9 = Instance.new("IKControl")
			var9.Name = text_1
		end
		var9.SmoothTime = 0.1
		var9.Parent = humanoid
		var9.Target = var4
	end
end

function t:createHandCollider(p2, p3)
	self:findOrCreateColliders(p2 .. "Hand", p3)
	local var3 = p3:FindFirstChild(p2 .. "Hand")
	local humanoid = p3:FindFirstChild("Humanoid")
	
	if humanoid then
		local var4 = humanoid:FindFirstChild("TrackedIK" .. p11 .. "Hand")
		
		if var4 then
			var4.Type = Enum.IKControlType.Transform
			local var5 = p3:FindFirstChild(p2 .. "UpperArm")
			
			if var5 then
				var4.ChainRoot = var3
				coroutine.wrap(function()
					-- upvalues: var4 (ref), var5 (ref)
					task.wait(0.1)
					var4.ChainRoot = var5
				end)()
			end
			if var3 then
				var4.EndEffector = var3
			end
			var4.Priority = 1
		end
	end
	if var3 then
		local ragdollBallSocket = var3:FindFirstChild("RagdollBallSocket")
		
		if ragdollBallSocket then
			ragdollBallSocket.LimitsEnabled = false
		end
	end
end

function t:createHeadCollider(p2)
	self:findOrCreateColliders("Head", p2)
	local head = p2:FindFirstChild("Head")
	local humanoid = p2:FindFirstChild("Humanoid")
	
	if humanoid then
		local trackedIKHead = humanoid:FindFirstChild("TrackedIKHead")
		
		if trackedIKHead then
			trackedIKHead.Type = Enum.IKControlType.Rotation
			local upperTorso = p2:FindFirstChild("UpperTorso")
			
			if upperTorso then
				trackedIKHead.ChainRoot = upperTorso
			end
			if head then
				trackedIKHead.EndEffector = head
			end
		end
	end
end

function t:onCharacterChanged(p2)
	-- upvalues: playersService (ref), VRService (ref)
	if self.VRPlayers[playersService:GetPlayerFromCharacter(p2)] and VRService.AvatarGestures then
		self:createHandCollider("Left", p2)
		self:createHandCollider("Right", p2)
		self:createHeadCollider(p2)
	end
end

return t