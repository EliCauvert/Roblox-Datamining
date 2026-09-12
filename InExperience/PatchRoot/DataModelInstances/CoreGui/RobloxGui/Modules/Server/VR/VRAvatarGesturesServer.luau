local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local playersService = game:GetService("Players")
local VRService = game:GetService("VRService")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local avatarUtil = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).AvatarUtil
local connectionUtil = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).ConnectionUtil
local VRAvatarGesturesAnalyticsThrottleHundrethsPercent = game:DefineFastInt("VRAvatarGesturesAnalyticsThrottleHundrethsPercent", 0)
local VRAvatarGesturesUseNilForHandChainRootRebuild = game:DefineFastFlag("VRAvatarGesturesUseNilForHandChainRootRebuild", false)
local VRAvatarGesturesFixJointLimits = game:DefineFastFlag("VRAvatarGesturesFixJointLimits", false)
local list = { "UpperArm", "LowerArm", "Hand" }
local list_1 = { "Left", "Right" }
local t = {}
t.__index = t

local function _(p1)
	return p1:IsA("BallSocketConstraint") and string.sub(p1.Name, -10) == "BallSocket"
end

local function forEachArmRagdollBallSocket(p1, p2, p3)
	-- upvalues: list (ref)
	for i, v in ipairs(list) do
		local var1 = p1:FindFirstChild(p2 .. v)
		
		if var1 then
			for i_1, v_1 in ipairs(var1:GetChildren()) do
				if v_1:IsA("BallSocketConstraint") and string.sub(v_1.Name, -10) == "BallSocket" then
					p3(v_1)
				end
			end
		end
	end
end

local function suppressArmRagdollLimits(p4, p5)
	-- upvalues: forEachArmRagdollBallSocket (ref)
	forEachArmRagdollBallSocket(p4, p5, function(p6)
		if p6:GetAttribute("VRAvatarGesturesPriorLimitsEnabled") == nil then
			p6:SetAttribute("VRAvatarGesturesPriorLimitsEnabled", p6.LimitsEnabled)
			p6:SetAttribute("VRAvatarGesturesPriorTwistLimitsEnabled", p6.TwistLimitsEnabled)
		end
		p6.LimitsEnabled = false
		p6.TwistLimitsEnabled = false
	end)
end

local function restoreArmRagdollLimits(p4, p5)
	-- upvalues: forEachArmRagdollBallSocket (ref)
	forEachArmRagdollBallSocket(p4, p5, function(p6)
		local VRAvatarGesturesPriorLimitsEnabledAttribute = p6:GetAttribute("VRAvatarGesturesPriorLimitsEnabled")
		
		if VRAvatarGesturesPriorLimitsEnabledAttribute ~= nil then
			p6.LimitsEnabled = VRAvatarGesturesPriorLimitsEnabledAttribute
			p6.TwistLimitsEnabled = p6:GetAttribute("VRAvatarGesturesPriorTwistLimitsEnabled")
			p6:SetAttribute("VRAvatarGesturesPriorLimitsEnabled", nil)
			p6:SetAttribute("VRAvatarGesturesPriorTwistLimitsEnabled", nil)
		end
	end)
end

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

function cleanCharacter(p4)
	-- upvalues: VRAvatarGesturesFixJointLimits (ref), list_1 (ref), forEachArmRagdollBallSocket (ref)
	if p4.Character then
		if VRAvatarGesturesFixJointLimits then
			for i, v in ipairs(list_1) do
				forEachArmRagdollBallSocket(p4.Character, v, function(p5)
					local VRAvatarGesturesPriorLimitsEnabledAttribute = p5:GetAttribute("VRAvatarGesturesPriorLimitsEnabled")
					
					if VRAvatarGesturesPriorLimitsEnabledAttribute ~= nil then
						p5.LimitsEnabled = VRAvatarGesturesPriorLimitsEnabledAttribute
						p5.TwistLimitsEnabled = p5:GetAttribute("VRAvatarGesturesPriorTwistLimitsEnabled")
						p5:SetAttribute("VRAvatarGesturesPriorLimitsEnabled", nil)
						p5:SetAttribute("VRAvatarGesturesPriorTwistLimitsEnabled", nil)
					end
				end)
			end
		end
		local humanoid = p4.Character:FindFirstChild("Humanoid")
		
		if humanoid then
			for i, v in pairs({
				"TrackedIKLeftHand",
				"TrackedIKRightHand",
				"TrackedIKHead"
			}) do
				local var2 = humanoid:FindFirstChild(v)
				
				if var2 then
					var2:Destroy()
				end
			end
		end
		for i, v in pairs({ "TrackedLeftHand", "TrackedRightHand", "TrackedHead" }) do
			local var3 = p4.Character:FindFirstChild(v)
			
			if var3 then
				var3:Destroy()
			end
		end
	end
end

function t:onPlayerChanged(p5, p6)
	-- upvalues: avatarUtil (ref)
	self.VRPlayers[p5] = p6 or nil
	
	if not p6 then
		cleanCharacter(p5)
		
		return
	elseif not self.avatarUtil then
		self.avatarUtil = avatarUtil.new()
	end
	self.avatarUtil:connectPlayerCharacterChanges(p5, function(p7)
		-- upvalues: self (ref)
		self:onCharacterChanged(p7)
	end)
end

function t:onPlayerAdded(p5)
	-- upvalues: rbxAnalyticsService (ref), VRAvatarGesturesAnalyticsThrottleHundrethsPercent (ref)
	if next(self.VRPlayers) ~= nil then
		rbxAnalyticsService:ReportInfluxSeries("VRAvatarGestures", {
			calledFrom = "ServerPlayerAddedWithVRPlayer",
			placeId = game.PlaceId,
			playerUserID = p5.UserId
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
		self.connections:connect("PlayerAdded", playersService.PlayerAdded, function(p5)
			-- upvalues: self (ref)
			self:onPlayerAdded(p5)
		end)
		self.connections:connect("PlayerRemoving", playersService.PlayerRemoving, function(p5)
			-- upvalues: self (ref)
			self:onPlayerChanged(p5, false)
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

function t.findOrCreateColliders(_, p5, p6)
	-- upvalues: playersService (ref)
	local var4 = playersService:GetPlayerFromCharacter(p6)
	local text = "Tracked" .. p20
	local var5 = p6:FindFirstChild(text)
	
	if not var5 then
		var5 = Instance.new("Part")
		var5.Name = text
		var5.Transparency = 1
		var5.CanCollide = false
		var5.Parent = p6
		var5:SetNetworkOwner(var4)
	end
	local var6 = var5:FindFirstChild(text .. "Attachment")
	
	if not var6 then
		var6 = Instance.new("Attachment")
		var6.Name = text .. "Attachment"
		var6.Parent = var5
	end
	local var7 = var5:FindFirstChild(text .. "AlignPosition")
	
	if not var7 then
		var7 = Instance.new("AlignPosition")
		var7.Name = text .. "AlignPosition"
		var7.Mode = Enum.PositionAlignmentMode.OneAttachment
		var7.Attachment0 = var6
		var7.RigidityEnabled = true
		var7.Parent = var5
	end
	local var8 = var5:FindFirstChild(text .. "AlignOrientation")
	
	if not var8 then
		var8 = Instance.new("AlignOrientation")
		var8.Name = text .. "AlignOrientation"
		var8.Mode = Enum.OrientationAlignmentMode.OneAttachment
		var8.Attachment0 = var6
		var8.RigidityEnabled = true
		var8.Parent = var5
	end
	local var9 = p6:FindFirstChild(p5)
	
	if var9 then
		var5.Size = var9.Size
		var5.CFrame = var9.CFrame
		var7.Position = var9.Position
		var8.CFrame = var9.CFrame
	else
		var5.Size = Vector3.new(1, 1, 1)
		var5.CFrame = p6.WorldPivot
		var7.Position = p6.WorldPivot.Position
		var8.CFrame = p6.WorldPivot
	end
	local humanoid = p6:FindFirstChild("Humanoid")
	
	if humanoid then
		local text_1 = "TrackedIK" .. p20
		local var10 = humanoid:FindFirstChild(text_1)
		
		if not var10 then
			var10 = Instance.new("IKControl")
			var10.Name = text_1
		end
		var10.SmoothTime = 0.1
		var10.Parent = humanoid
		var10.Target = var5
	end
end

function t:createHandCollider(p5, p6)
	-- upvalues: VRAvatarGesturesUseNilForHandChainRootRebuild (ref), VRAvatarGesturesFixJointLimits (ref), forEachArmRagdollBallSocket (ref)
	self:findOrCreateColliders(p5 .. "Hand", p6)
	local var4 = p6:FindFirstChild(p5 .. "Hand")
	local humanoid = p6:FindFirstChild("Humanoid")
	
	if humanoid then
		local var5 = humanoid:FindFirstChild("TrackedIK" .. p22 .. "Hand")
		
		if var5 then
			var5.Type = Enum.IKControlType.Transform
			local var6 = p6:FindFirstChild(p5 .. "UpperArm")
			
			if var6 then
				if VRAvatarGesturesUseNilForHandChainRootRebuild then
					var5.ChainRoot = nil
				else
					var5.ChainRoot = var4
				end
				coroutine.wrap(function()
					-- upvalues: var5 (ref), var6 (ref)
					task.wait(0.1)
					var5.ChainRoot = var6
				end)()
			end
			if var4 then
				var5.EndEffector = var4
			end
			var5.Priority = 1
		end
	end
	if VRAvatarGesturesFixJointLimits then
		forEachArmRagdollBallSocket(p6, p5, function(p7)
			if p7:GetAttribute("VRAvatarGesturesPriorLimitsEnabled") == nil then
				p7:SetAttribute("VRAvatarGesturesPriorLimitsEnabled", p7.LimitsEnabled)
				p7:SetAttribute("VRAvatarGesturesPriorTwistLimitsEnabled", p7.TwistLimitsEnabled)
			end
			p7.LimitsEnabled = false
			p7.TwistLimitsEnabled = false
		end)
		
		return
	elseif var4 then
		local ragdollBallSocket = var4:FindFirstChild("RagdollBallSocket")
		
		if ragdollBallSocket then
			ragdollBallSocket.LimitsEnabled = false
		end
	end
end

function t:createHeadCollider(p5)
	self:findOrCreateColliders("Head", p5)
	local head = p5:FindFirstChild("Head")
	local humanoid = p5:FindFirstChild("Humanoid")
	
	if humanoid then
		local trackedIKHead = humanoid:FindFirstChild("TrackedIKHead")
		
		if trackedIKHead then
			trackedIKHead.Type = Enum.IKControlType.Rotation
			local upperTorso = p5:FindFirstChild("UpperTorso")
			
			if upperTorso then
				trackedIKHead.ChainRoot = upperTorso
			end
			if head then
				trackedIKHead.EndEffector = head
			end
		end
	end
end

function t:onCharacterChanged(p5)
	-- upvalues: playersService (ref), VRService (ref)
	if self.VRPlayers[playersService:GetPlayerFromCharacter(p5)] and VRService.AvatarGestures then
		self:createHandCollider("Left", p5)
		self:createHandCollider("Right", p5)
		self:createHeadCollider(p5)
	end
end

t._suppressArmRagdollLimits = suppressArmRagdollLimits
t._restoreArmRagdollLimits = restoreArmRagdollLimits

return t