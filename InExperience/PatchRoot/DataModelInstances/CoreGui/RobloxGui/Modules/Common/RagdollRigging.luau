local RunService = game:GetService("RunService")
local AvatarJointUpgradeFeatureEngineFeature = game:GetEngineFeature("AvatarJointUpgradeFeature")
local config = {
	UpperAngle = 10,
	TwistLowerAngle = -10,
	TwistUpperAngle = 10,
	StrengthTorque = 400,
	ReferenceMass = 0.43671694397926
}
local config1 = {
	UpperAngle = 20,
	TwistLowerAngle = 5,
	TwistUpperAngle = 120,
	StrengthTorque = 1200,
	ReferenceMass = 0.70196455717087
}
local config2 = {
	UpperAngle = 30,
	TwistLowerAngle = -10,
	TwistUpperAngle = 10,
	StrengthTorque = 400,
	ReferenceMass = 0.69132566452026
}
local config3 = {
	UpperAngle = 5,
	TwistLowerAngle = -120,
	TwistUpperAngle = -5,
	StrengthTorque = 2000,
	ReferenceMass = 0.65389388799667
}
local config4 = {
	UpperAngle = 110,
	TwistLowerAngle = -85,
	TwistUpperAngle = 85,
	FrictionTorque = 600,
	StrengthTorque = 4000,
	ReferenceMass = 0.90918225049973
}
local config5 = {
	UpperAngle = 40,
	TwistLowerAngle = -5,
	TwistUpperAngle = 80,
	FrictionTorque = 600,
	StrengthTorque = 4000,
	ReferenceMass = 1.9175016880035
}
local config6 = {
	UpperAngle = 110,
	TwistLowerAngle = -85,
	TwistUpperAngle = 85
}
local config7 = {
	UpperAngle = 40,
	TwistLowerAngle = -5,
	TwistUpperAngle = 80
}
local _Vector3 = Vector3.new()
local list = {
	{
		"UpperTorso",
		"RightShoulderRagdollAttachment",
		CFrame.fromMatrix(_Vector3, vector.create(1, 0, 0), vector.create(0, 1, 0)),
		"RightShoulderRigAttachment"
	},
	{
		"RightUpperArm",
		"RightShoulderRagdollAttachment",
		CFrame.fromMatrix(_Vector3, vector.create(0, -1, 0), vector.create(1, 0, 0)),
		"RightShoulderRigAttachment"
	},
	{
		"UpperTorso",
		"LeftShoulderRagdollAttachment",
		CFrame.fromMatrix(_Vector3, vector.create(-1, 0, 0), vector.create(0, 1, 0)),
		"LeftShoulderRigAttachment"
	},
	{
		"LeftUpperArm",
		"LeftShoulderRagdollAttachment",
		CFrame.fromMatrix(_Vector3, vector.create(0, -1, 0), vector.create(-1, 0, 0)),
		"LeftShoulderRigAttachment"
	}
}
local list1 = {
	{
		"UpperTorso",
		"Head",
		"NeckRigAttachment",
		{
			UpperAngle = 45,
			TwistLowerAngle = -40,
			TwistUpperAngle = 40,
			FrictionTorque = 400,
			StrengthTorque = 400,
			ReferenceMass = 1.0249234437943
		}
	},
	{
		"LowerTorso",
		"UpperTorso",
		"WaistRigAttachment",
		{
			UpperAngle = 20,
			TwistLowerAngle = -40,
			TwistUpperAngle = 20,
			FrictionTorque = 750,
			StrengthTorque = 5000,
			ReferenceMass = 2.861558675766
		}
	},
	{
		"UpperTorso",
		"LeftUpperArm",
		"LeftShoulderRagdollAttachment",
		config4
	},
	{
		"LeftUpperArm",
		"LeftLowerArm",
		"LeftElbowRigAttachment",
		config1
	},
	{
		"LeftLowerArm",
		"LeftHand",
		"LeftWristRigAttachment",
		config2
	},
	{
		"UpperTorso",
		"RightUpperArm",
		"RightShoulderRagdollAttachment",
		config4
	},
	{
		"RightUpperArm",
		"RightLowerArm",
		"RightElbowRigAttachment",
		config1
	},
	{
		"RightLowerArm",
		"RightHand",
		"RightWristRigAttachment",
		config2
	},
	{
		"LowerTorso",
		"LeftUpperLeg",
		"LeftHipRigAttachment",
		config5
	},
	{
		"LeftUpperLeg",
		"LeftLowerLeg",
		"LeftKneeRigAttachment",
		config3
	},
	{
		"LeftLowerLeg",
		"LeftFoot",
		"LeftAnkleRigAttachment",
		config
	},
	{
		"LowerTorso",
		"RightUpperLeg",
		"RightHipRigAttachment",
		config5
	},
	{
		"RightUpperLeg",
		"RightLowerLeg",
		"RightKneeRigAttachment",
		config3
	},
	{
		"RightLowerLeg",
		"RightFoot",
		"RightAnkleRigAttachment",
		config
	}
}
local list2 = {
	{ "LowerTorso", "LeftUpperArm" },
	{ "LeftUpperArm", "LeftHand" },
	{ "LowerTorso", "RightUpperArm" },
	{ "RightUpperArm", "RightHand" },
	{ "LeftUpperLeg", "RightUpperLeg" },
	{ "UpperTorso", "RightUpperLeg" },
	{ "RightUpperLeg", "RightFoot" },
	{ "UpperTorso", "LeftUpperLeg" },
	{ "LeftUpperLeg", "LeftFoot" },
	{ "UpperTorso", "LeftLowerLeg" },
	{ "UpperTorso", "RightLowerLeg" },
	{ "LowerTorso", "LeftLowerLeg" },
	{ "LowerTorso", "RightLowerLeg" },
	{ "UpperTorso", "LeftLowerArm" },
	{ "UpperTorso", "RightLowerArm" },
	{ "Head", "LeftUpperArm" },
	{ "Head", "RightUpperArm" }
}
local list3 = {
	{ "Waist", "UpperTorso" },
	{ "Neck", "Head" },
	{ "LeftShoulder", "LeftUpperArm" },
	{ "LeftElbow", "LeftLowerArm" },
	{ "LeftWrist", "LeftHand" },
	{ "RightShoulder", "RightUpperArm" },
	{ "RightElbow", "RightLowerArm" },
	{ "RightWrist", "RightHand" },
	{ "LeftHip", "LeftUpperLeg" },
	{ "LeftKnee", "LeftLowerLeg" },
	{ "LeftAnkle", "LeftFoot" },
	{ "RightHip", "RightUpperLeg" },
	{ "RightKnee", "RightLowerLeg" },
	{ "RightAnkle", "RightFoot" }
}
local list4 = {
	{ "Head", "NeckAttachment", CFrame.new(0, -0.5, 0) },
	{
		"Torso",
		"RightShoulderRagdollAttachment",
		CFrame.fromMatrix(vector.create(1, 0.5, 0), vector.create(1, 0, 0), vector.create(0, 1, 0))
	},
	{
		"Right Arm",
		"RightShoulderRagdollAttachment",
		CFrame.fromMatrix(vector.create(-0.5, 0.5, 0), vector.create(0, -1, 0), vector.create(1, 0, 0))
	},
	{
		"Torso",
		"LeftShoulderRagdollAttachment",
		CFrame.fromMatrix(vector.create(-1, 0.5, 0), vector.create(-1, 0, 0), vector.create(0, 1, 0))
	},
	{
		"Left Arm",
		"LeftShoulderRagdollAttachment",
		CFrame.fromMatrix(vector.create(0.5, 0.5, 0), vector.create(0, -1, 0), vector.create(-1, 0, 0))
	},
	{ "Torso", "RightHipAttachment", CFrame.new(0.5, -1, 0) },
	{ "Right Leg", "RightHipAttachment", CFrame.new(0, 1, 0) },
	{ "Torso", "LeftHipAttachment", CFrame.new(-0.5, -1, 0) },
	{ "Left Leg", "LeftHipAttachment", CFrame.new(0, 1, 0) }
}
local list5 = {
	{
		"Torso",
		"Head",
		"NeckAttachment",
		{
			UpperAngle = 30,
			TwistLowerAngle = -40,
			TwistUpperAngle = 40
		}
	},
	{ "Torso", "Left Leg", "LeftHipAttachment", config7 },
	{ "Torso", "Right Leg", "RightHipAttachment", config7 },
	{
		"Torso",
		"Left Arm",
		"LeftShoulderRagdollAttachment",
		config6
	},
	{
		"Torso",
		"Right Arm",
		"RightShoulderRagdollAttachment",
		config6
	}
}
local list6 = {
	{ "Left Leg", "Right Leg" },
	{ "Head", "Right Arm" },
	{ "Head", "Left Arm" }
}
local list7 = {
	{ "Neck", "Torso" },
	{ "Left Shoulder", "Torso" },
	{ "Right Shoulder", "Torso" },
	{ "Left Hip", "Torso" },
	{ "Right Hip", "Torso" }
}

local function indexParts(Object) --[[ Line: 238 ]]
	local Parts = {}
	
	for _, Part in ipairs(Object:GetChildren()) do
		if Part:IsA("BasePart") then
			local Name = Part.name
			
			if not Parts[Name] then
				Parts[Name] = Part
			end
		end
	end
	return Parts
end

local function createRigJoints(Character, List, p1) --[[ Line: 252 ]]
	if p1 then
		local Root = Instance.new("AnimationConstraint")
		Root.Name = "Root"
		Root.Attachment0 = Character.HumanoidRootPart.RootRigAttachment
		Root.Attachment1 = Character.LowerTorso.RootRigAttachment
		Root.IsKinematic = true
		Character.LowerTorso.Root:Destroy()
		Root.Parent = Character.LowerTorso
	end
	for _, value in ipairs(List) do
		local Unpacked, Unpacked2, Unpacked3, Unpacked4 = unpack(value)
		local CharacterEntry = Character[Unpacked]
		local CharacterEntry1 = Character[Unpacked2]
		
		if CharacterEntry and CharacterEntry1 then
			local Unpacked1 = CharacterEntry:FindFirstChild(Unpacked3)
			local Unpacked5 = CharacterEntry1:FindFirstChild(Unpacked3)
			
			if Unpacked1 and Unpacked5 and Unpacked1:IsA("Attachment") and Unpacked5:IsA("Attachment") then
				local RagdollBallSocket = CharacterEntry1:FindFirstChild("RagdollBallSocket")
				
				if not RagdollBallSocket then
					RagdollBallSocket = Instance.new("BallSocketConstraint")
					RagdollBallSocket.Name = "RagdollBallSocket"
				end
				RagdollBallSocket.Attachment0 = Unpacked1
				RagdollBallSocket.Attachment1 = Unpacked5
				RagdollBallSocket.LimitsEnabled = true
				RagdollBallSocket.UpperAngle = Unpacked4.UpperAngle
				RagdollBallSocket.TwistLimitsEnabled = true
				RagdollBallSocket.TwistLowerAngle = Unpacked4.TwistLowerAngle
				RagdollBallSocket.TwistUpperAngle = Unpacked4.TwistUpperAngle
				local GravityRatio = workspace.Gravity / 196.2
				
				if p1 then
					GravityRatio = math.max(GravityRatio, 0.2)
				end
				local ReferenceMass = Unpacked4.ReferenceMass
				local MassRatio = ReferenceMass and CharacterEntry1:GetMass() / ReferenceMass or 1
				RagdollBallSocket.MaxFrictionTorque = (Unpacked4.FrictionTorque or 500) * MassRatio * GravityRatio
				
				if p1 then
					RagdollBallSocket.MaxFrictionTorque /= 100
				end
				RagdollBallSocket.Parent = CharacterEntry1
				
				if p1 then
					local Motor6D = CharacterEntry1:FindFirstChildWhichIsA("Motor6D")
					assert(Motor6D)
					local AnimationConstraint = Instance.new("AnimationConstraint")
					AnimationConstraint.Name = Motor6D.Name
					AnimationConstraint.Attachment0 = Motor6D.Part0:FindFirstChild(Motor6D.Name .. "RigAttachment")
					AnimationConstraint.Attachment1 = Motor6D.Part1:FindFirstChild(Motor6D.Name .. "RigAttachment")
					AnimationConstraint.IsKinematic = true
					AnimationConstraint.MaxTorque = (Unpacked4.StrengthTorque or 500) * MassRatio * GravityRatio
					AnimationConstraint.MaxForce = 0
					AnimationConstraint.Parent = Motor6D.parent
					Motor6D:Destroy()
				end
			end
		end
	end
end

local function createAdditionalAttachments(Character, List) --[[ Line: 320 ]]
	for _, value in ipairs(List) do
		local Unpacked, Unpacked2, Unpacked3, Unpacked4 = unpack(value)
		local CharacterEntry = Character[Unpacked]
		
		if CharacterEntry then
			local Unpacked1 = CharacterEntry:FindFirstChild(Unpacked2)
			
			if not Unpacked1 or Unpacked1:IsA("Attachment") then
				if Unpacked4 then
					local Unpacked5 = CharacterEntry:FindFirstChild(Unpacked4)
					
					if Unpacked5 and Unpacked5:IsA("Attachment") then
						Unpacked3 = Unpacked5.CFrame * Unpacked3
					end
				end
				if Unpacked1 then
					Unpacked1.CFrame = Unpacked3
				else
					local Attachment = Instance.new("Attachment")
					Attachment.Name = Unpacked2
					Attachment.CFrame = Unpacked3
					Attachment.Parent = CharacterEntry
				end
			end
		end
	end
end

local function createNoCollides(Character, List1) --[[ Line: 348 ]]
	local t = {}
	
	for _, value in ipairs(List1) do
		local Unpacked, Unpacked2 = unpack(value)
		local CharacterEntry = Character[Unpacked]
		local CharacterEntry1 = Character[Unpacked2]
		
		if CharacterEntry and CharacterEntry1 then
			local Entry = t[CharacterEntry1]
			
			if not Entry then
				Entry = {}
				t[CharacterEntry1] = Entry
			end
			Entry[CharacterEntry] = true
		end
	end
	local t1 = {}
	
	for i, value1 in pairs(t) do
		local List2 = {}
		
		for _, NoCollisionConstraint in ipairs(i:GetChildren()) do
			if NoCollisionConstraint:IsA("NoCollisionConstraint") and NoCollisionConstraint.Name == "RagdollNoCollision" then
				local Part0 = NoCollisionConstraint.Part0
				
				if NoCollisionConstraint.Part1 == i and value1[Part0] then
					value1[Part0] = nil
				else
					table.insert(List2, NoCollisionConstraint)
				end
			end
		end
		t1[i] = List2
	end
	for Parent, value2 in pairs(t) do
		local List = t1[Parent]
		
		for Part0, _ in pairs(value2) do
			local RagdollNoCollision = table.remove(List) or Instance.new("NoCollisionConstraint")
			RagdollNoCollision.Name = "RagdollNoCollision"
			RagdollNoCollision.Part0 = Part0
			RagdollNoCollision.Part1 = Parent
			RagdollNoCollision.Parent = Parent
		end
	end
end

local function _(p2, Parent): boolean --[[ Line: 407 | Named "isAttachmetInPart" ]]
	return if p2 then p2.Parent == Parent else false
end

local _ = function(Parent, Parent1, p2, p3): boolean --[[ Line: 411 | Named "checkValidAttachment" ]]
	if (if p2 then p2.Parent == Parent else false) and (if p3 then p3.Parent == Parent1 else false) then
		return true
	elseif (if p2 then p2.Parent == Parent1 else false) and (if p3 then p3.Parent == Parent else false) then
		return true
	else
		return false
	end
end

local function hasValidConstraint(Parent, Parent1): boolean --[[ Line: 423 ]]
	for _, BallSocketConstraint in ipairs(Parent1:GetChildren()) do
		if BallSocketConstraint:IsA("BallSocketConstraint") then
			local Attachment0 = BallSocketConstraint.Attachment0
			local Attachment1 = BallSocketConstraint.Attachment1
			local Flag = nil
			
			if (if Attachment0 then Attachment0.Parent == Parent else false) and (if Attachment1 then Attachment1.Parent == Parent1 else false) then
				Flag = true
			elseif (if Attachment0 then Attachment0.Parent == Parent1 else false) and (if Attachment1 then Attachment1.Parent == Parent else false) then
				Flag = true
			else
				Flag = false
			end
			if Flag then
				return true
			end
		end
	end
	return false
end

local function hasRagdollJoint(Object): boolean --[[ Line: 438 ]]
	-- upvalues: AvatarJointUpgradeFeatureEngineFeature (copy), hasValidConstraint (copy)
	if AvatarJointUpgradeFeatureEngineFeature and not Object:IsA("Motor6D") and not Object:IsA("AnimationConstraint") then
		return false
	end
	local Parent = nil
	local Parent1 = nil
	
	if Object:IsA("Motor6D") then
		Parent = Object.Part0
		Parent1 = Object.Part1
	elseif AvatarJointUpgradeFeatureEngineFeature and Object:IsA("AnimationConstraint") then
		local Attachment0 = Object.Attachment0
		local Attachment1 = Object.Attachment1
		Parent = Attachment0 and Attachment0.Parent
		Parent1 = Attachment1 and Attachment1.Parent
	end
	return if Parent and Parent1 then if hasValidConstraint(Parent, Parent1) then true elseif hasValidConstraint(Parent1, Parent) then true else false else false
end

local function disableMotorSet(Model, List) --[[ Line: 470 ]]
	-- upvalues: AvatarJointUpgradeFeatureEngineFeature (copy), hasRagdollJoint (copy)
	local List1 = {}
	
	for _, value in ipairs(List) do
		local Child = Model:FindFirstChild(value[2])
		
		if Child then
			local Child1 = Child:FindFirstChild(value[1])
			
			if Child1 and (AvatarJointUpgradeFeatureEngineFeature or Child1:IsA("Motor6D")) and hasRagdollJoint(Child1) then
				table.insert(List1, Child1)
				Child1.Enabled = false
			end
		end
	end
	return List1
end

return {
	createRagdollJoints = function(p2, HumanoidRigType, p3) --[[ Line: 486 ]]
		-- upvalues: indexParts (copy), createAdditionalAttachments (copy), list4 (copy), createRigJoints (copy), list5 (copy), createNoCollides (copy), list6 (copy), list (copy), list1 (copy), list2 (copy)
		local IndexPartsResult = indexParts(p2)
		
		if HumanoidRigType == Enum.HumanoidRigType.R6 then
			createAdditionalAttachments(IndexPartsResult, list4)
			createRigJoints(IndexPartsResult, list5, false)
			createNoCollides(IndexPartsResult, list6)
			
			return
		end
		if HumanoidRigType == Enum.HumanoidRigType.R15 then
			createAdditionalAttachments(IndexPartsResult, list)
			createRigJoints(IndexPartsResult, list1, p3)
			createNoCollides(IndexPartsResult, list2)
			
			return
		else
			error("unknown rig type", 2)
		end
	end,
	disableMotors = function(Model, HumanoidRigType) --[[ Line: 501 ]]
		-- upvalues: disableMotorSet (copy), list7 (copy), list3 (copy)
		local v1 = nil
		
		if HumanoidRigType == Enum.HumanoidRigType.R6 then
			v1 = disableMotorSet(Model, list7)
		elseif HumanoidRigType == Enum.HumanoidRigType.R15 then
			v1 = disableMotorSet(Model, list3)
		else
			error("unknown rig type", 2)
		end
		local PrimaryPart = Model.PrimaryPart or Model:FindFirstChild("HumanoidRootPart")
		
		if PrimaryPart and PrimaryPart:IsA("BasePart") then
			PrimaryPart.CanCollide = false
		end
		local Head = Model:FindFirstChild("Head")
		
		if Head and Head:IsA("BasePart") then
			Head.CanCollide = true
		end
		return v1
	end,
	disableParticleEmittersAndFadeOut = function(Object, p2) --[[ Line: 530 ]]
		-- upvalues: RunService (copy)
		if RunService:IsServer() then
			error("disableParticleEmittersAndFadeOut should not be called on the server.", 2)
		end
		local Transparencies = {}
		
		for _, descendant in pairs((Object:GetDescendants())) do
			if descendant:IsA("BasePart") or descendant:IsA("Decal") then
				Transparencies[descendant] = descendant.Transparency
			elseif descendant:IsA("ParticleEmitter") then
				descendant.Enabled = false
			end
		end
		local NewDeltaTime = 0
		while NewDeltaTime < p2 do
			NewDeltaTime += RunService.Heartbeat:Wait()
			local Smallest = math.min(NewDeltaTime / p2, 1)
			
			for i, transparency in pairs(Transparencies) do
				i.Transparency = (1 - Smallest) * transparency + Smallest
			end
		end
	end,
	easeNongraphicJointFriction = function(Object, p3) --[[ Line: 558 ]]
		-- upvalues: RunService (copy)
		local t = {}
		
		for _, BallSocketConstraint in pairs((Object:GetDescendants())) do
			if BallSocketConstraint:IsA("BallSocketConstraint") and BallSocketConstraint.Name == "RagdollBallSocket" then
				BallSocketConstraint.MaxFrictionTorque *= 100
				local MaxFrictionTorque = BallSocketConstraint.MaxFrictionTorque
				local Name = BallSocketConstraint.Parent.Name
				t[BallSocketConstraint] = {
					BallSocketConstraint,
					MaxFrictionTorque,
					MaxFrictionTorque * (if Name == "UpperTorso" or Name == "Head" then 0.5 else 0.05)
				}
			end
		end
		local Total = 0
		while Total < p3 do
			local _, DeltaTime = RunService.Stepped:Wait()
			Total += DeltaTime
			local Smallest = math.min(Total / p3, 1)
			
			for _, value in pairs(t) do
				local Unpacked, Unpacked2, Unpacked3 = unpack(value)
				Unpacked.MaxFrictionTorque = (1 - Smallest) * Unpacked2 + Smallest * Unpacked3
			end
		end
	end,
	easeJointFriction_OLD = function(Object, p4) --[[ Line: 587 ]]
		-- upvalues: RunService (copy)
		local t = {}
		
		for _, BallSocketConstraint in pairs((Object:GetDescendants())) do
			if BallSocketConstraint:IsA("BallSocketConstraint") and BallSocketConstraint.Name == "RagdollBallSocket" then
				local MaxFrictionTorque = BallSocketConstraint.MaxFrictionTorque
				local Name = BallSocketConstraint.Parent.Name
				t[BallSocketConstraint] = {
					BallSocketConstraint,
					MaxFrictionTorque,
					MaxFrictionTorque * (if Name == "UpperTorso" or Name == "Head" then 0.5 else 0.05)
				}
			end
		end
		local Total = 0
		while Total < p4 do
			local _, DeltaTime = RunService.Stepped:Wait()
			Total += DeltaTime
			local Smallest = math.min(Total / p4, 1)
			
			for _, value in pairs(t) do
				local Unpacked, Unpacked2, Unpacked3 = unpack(value)
				Unpacked.MaxFrictionTorque = (1 - Smallest) * Unpacked2 + Smallest * Unpacked3
			end
		end
	end
}