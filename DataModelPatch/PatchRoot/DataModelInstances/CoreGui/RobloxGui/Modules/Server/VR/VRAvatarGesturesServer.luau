local CorePackages = game:GetService("CorePackages")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Players = game:GetService("Players")
local VRService = game:GetService("VRService")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local AvatarUtil = require(CorePackages.Workspace.Packages.CoreScriptsCommon).AvatarUtil
local ConnectionUtil = require(CorePackages.Workspace.Packages.CoreScriptsCommon).ConnectionUtil
local VRAvatarGesturesAnalyticsThrottleHundrethsPercent = game:DefineFastInt("VRAvatarGesturesAnalyticsThrottleHundrethsPercent", 0)
local VRAvatarGesturesServerModule = {}
VRAvatarGesturesServerModule.__index = VRAvatarGesturesServerModule

function VRAvatarGesturesServerModule.new()
	-- upvalues: VRAvatarGesturesServerModule (copy), ConnectionUtil (copy), VRService (copy)
	local self = setmetatable({}, VRAvatarGesturesServerModule)
	self.connections = ConnectionUtil.new()
	self.VRPlayers = {}
	self.connections:connect("AvatarGestures", VRService:GetPropertyChangedSignal("AvatarGestures"), function()
		-- upvalues: self (copy)
		self:onAvatarGesturesChanged()
	end)
	
	if VRService.AvatarGestures then
		self:onAvatarGesturesChanged()
	end
	return self
end

function cleanCharacter(Player: Player)
	if Player.Character then
		local Humanoid = Player.Character:FindFirstChild("Humanoid")
		
		if Humanoid then
			for _, ChildName in pairs({
				"TrackedIKLeftHand",
				"TrackedIKRightHand",
				"TrackedIKHead"
			}) do
				local Child = Humanoid:FindFirstChild(ChildName)
				
				if Child then
					Child:Destroy()
				end
			end
		end
		for _, ChildName1 in pairs({ "TrackedLeftHand", "TrackedRightHand", "TrackedHead" }) do
			local Child = Player.Character:FindFirstChild(ChildName1)
			
			if Child then
				Child:Destroy()
			end
		end
	end
end

function VRAvatarGesturesServerModule:onPlayerChanged(p1, p2)
	-- upvalues: AvatarUtil (copy)
	self.VRPlayers[p1] = p2 or nil
	
	if not p2 then
		cleanCharacter(p1)
		
		return
	end
	if not self.avatarUtil then
		self.avatarUtil = AvatarUtil.new()
	end
	self.avatarUtil:connectPlayerCharacterChanges(p1, function(Character)
		-- upvalues: self (copy)
		self:onCharacterChanged(Character)
	end)
end

function VRAvatarGesturesServerModule:onPlayerAdded(Player)
	-- upvalues: RbxAnalyticsService (copy), VRAvatarGesturesAnalyticsThrottleHundrethsPercent (copy)
	if next(self.VRPlayers) ~= nil then
		RbxAnalyticsService:ReportInfluxSeries("VRAvatarGestures", {
			calledFrom = "ServerPlayerAddedWithVRPlayer",
			placeId = game.PlaceId,
			playerUserID = Player.UserId
		}, VRAvatarGesturesAnalyticsThrottleHundrethsPercent)
	end
end

function VRAvatarGesturesServerModule:onAvatarGesturesChanged()
	-- upvalues: VRService (copy), RobloxReplicatedStorage (copy), Players (copy)
	if VRService.AvatarGestures then
		local AvatarGesturesVRPlayer = RobloxReplicatedStorage:FindFirstChild("AvatarGesturesVRPlayer")
		
		if not AvatarGesturesVRPlayer then
			AvatarGesturesVRPlayer = Instance.new("RemoteEvent")
			AvatarGesturesVRPlayer.Name = "AvatarGesturesVRPlayer"
			AvatarGesturesVRPlayer.Parent = RobloxReplicatedStorage
		end
		self.connections:connect("VRPlayerOnServerEvent", AvatarGesturesVRPlayer.OnServerEvent, function(p1, p2)
			-- upvalues: self (copy)
			self:onPlayerChanged(p1, p2)
		end)
		self.connections:connect("PlayerAdded", Players.PlayerAdded, function(Player)
			-- upvalues: self (copy)
			self:onPlayerAdded(Player)
		end)
		self.connections:connect("PlayerRemoving", Players.PlayerRemoving, function(p1)
			-- upvalues: self (copy)
			self:onPlayerChanged(p1, false)
		end)
		
		return
	else
		for vRPlayer in pairs(self.VRPlayers) do
			self:onPlayerChanged(vRPlayer, false)
		end
		self.connections:disconnectAll()
		self.connections:connect("AvatarGestures", VRService:GetPropertyChangedSignal("AvatarGestures"), function()
			-- upvalues: self (copy)
			self:onAvatarGesturesChanged()
		end)
	end
end

function VRAvatarGesturesServerModule:findOrCreateColliders(ChildName, Model: Model)
	-- upvalues: Players (copy)
	local Player = Players:GetPlayerFromCharacter(Model)
	local Text = "Tracked" .. ChildName
	local Text1 = Model:FindFirstChild(Text)
	
	if not Text1 then
		Text1 = Instance.new("Part")
		Text1.Name = Text
		Text1.Transparency = 1
		Text1.CanCollide = false
		Text1.Parent = Model
		Text1:SetNetworkOwner(Player)
	end
	local Child = Text1:FindFirstChild(Text .. "Attachment")
	
	if not Child then
		Child = Instance.new("Attachment")
		Child.Name = Text .. "Attachment"
		Child.Parent = Text1
	end
	local Child1 = Text1:FindFirstChild(Text .. "AlignPosition")
	
	if not Child1 then
		Child1 = Instance.new("AlignPosition")
		Child1.Name = Text .. "AlignPosition"
		Child1.Mode = Enum.PositionAlignmentMode.OneAttachment
		Child1.Attachment0 = Child
		Child1.RigidityEnabled = true
		Child1.Parent = Text1
	end
	local Child2 = Text1:FindFirstChild(Text .. "AlignOrientation")
	
	if not Child2 then
		Child2 = Instance.new("AlignOrientation")
		Child2.Name = Text .. "AlignOrientation"
		Child2.Mode = Enum.OrientationAlignmentMode.OneAttachment
		Child2.Attachment0 = Child
		Child2.RigidityEnabled = true
		Child2.Parent = Text1
	end
	local ChildName1 = Model:FindFirstChild(ChildName)
	
	if ChildName1 then
		Text1.Size = ChildName1.Size
		Text1.CFrame = ChildName1.CFrame
		Child1.Position = ChildName1.Position
		Child2.CFrame = ChildName1.CFrame
	else
		Text1.Size = vector.create(1, 1, 1)
		Text1.CFrame = Model.WorldPivot
		Child1.Position = Model.WorldPivot.Position
		Child2.CFrame = Model.WorldPivot
	end
	local Humanoid = Model:FindFirstChild("Humanoid")
	
	if Humanoid then
		local Text2 = "TrackedIK" .. ChildName
		local Text21 = Humanoid:FindFirstChild(Text2)
		
		if not Text21 then
			Text21 = Instance.new("IKControl")
			Text21.Name = Text2
		end
		Text21.SmoothTime = 0.1
		Text21.Parent = Humanoid
		Text21.Target = Text1
	end
end

function VRAvatarGesturesServerModule:createHandCollider(Text, Character)
	self:findOrCreateColliders(Text .. "Hand", Character)
	local Child = Character:FindFirstChild(Text .. "Hand")
	local Humanoid = Character:FindFirstChild("Humanoid")
	
	if Humanoid then
		local Child1 = Humanoid:FindFirstChild("TrackedIK" .. Text .. "Hand")
		
		if Child1 then
			Child1.Type = Enum.IKControlType.Transform
			local Child2 = Character:FindFirstChild(Text .. "UpperArm")
			
			if Child2 then
				Child1.ChainRoot = Child
				coroutine.wrap(function()
					-- upvalues: Child1 (copy), Child2 (copy)
					task.wait(0.1)
					Child1.ChainRoot = Child2
				end)()
			end
			if Child then
				Child1.EndEffector = Child
			end
			Child1.Priority = 1
		end
	end
	if Child then
		local RagdollBallSocket = Child:FindFirstChild("RagdollBallSocket")
		
		if RagdollBallSocket then
			RagdollBallSocket.LimitsEnabled = false
		end
	end
end

function VRAvatarGesturesServerModule:createHeadCollider(Object)
	self:findOrCreateColliders("Head", Object)
	local Head = Object:FindFirstChild("Head")
	local Humanoid = Object:FindFirstChild("Humanoid")
	
	if Humanoid then
		local TrackedIKHead = Humanoid:FindFirstChild("TrackedIKHead")
		
		if TrackedIKHead then
			TrackedIKHead.Type = Enum.IKControlType.Rotation
			local UpperTorso = Object:FindFirstChild("UpperTorso")
			
			if UpperTorso then
				TrackedIKHead.ChainRoot = UpperTorso
			end
			if Head then
				TrackedIKHead.EndEffector = Head
			end
		end
	end
end

function VRAvatarGesturesServerModule:onCharacterChanged(Character)
	-- upvalues: Players (copy), VRService (copy)
	if self.VRPlayers[Players:GetPlayerFromCharacter(Character)] and VRService.AvatarGestures then
		self:createHandCollider("Left", Character)
		self:createHandCollider("Right", Character)
		self:createHeadCollider(Character)
	end
end

return VRAvatarGesturesServerModule