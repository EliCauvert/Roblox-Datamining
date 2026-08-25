local runService = game:GetService("RunService")
local avatarJointUpgradeFeatureEngineFeature = game:GetEngineFeature("AvatarJointUpgradeFeature")
local t = {}
local t_1 = {
	UpperAngle = 45,
	TwistLowerAngle = -40,
	TwistUpperAngle = 40,
	FrictionTorque = 400,
	StrengthTorque = 400,
	ReferenceMass = 1.024923443794
}
local t_2 = {
	UpperAngle = 20,
	TwistLowerAngle = -40,
	TwistUpperAngle = 20,
	FrictionTorque = 750,
	StrengthTorque = 5000,
	ReferenceMass = 2.861558675766
}
local t_3 = {
	UpperAngle = 10,
	TwistLowerAngle = -10,
	TwistUpperAngle = 10,
	StrengthTorque = 400,
	ReferenceMass = 0.436716943979
}
local t_4 = {
	UpperAngle = 20,
	TwistLowerAngle = 5,
	TwistUpperAngle = 120,
	StrengthTorque = 1200,
	ReferenceMass = 0.701964557171
}
local t_5 = {
	UpperAngle = 30,
	TwistLowerAngle = -10,
	TwistUpperAngle = 10,
	StrengthTorque = 400,
	ReferenceMass = 0.69132566452
}
local t_6 = {
	UpperAngle = 5,
	TwistLowerAngle = -120,
	TwistUpperAngle = -5,
	StrengthTorque = 2000,
	ReferenceMass = 0.653893887997
}
local t_7 = {
	UpperAngle = 110,
	TwistLowerAngle = -85,
	TwistUpperAngle = 85,
	FrictionTorque = 600,
	StrengthTorque = 4000,
	ReferenceMass = 0.9091822505
}
local t_8 = {
	UpperAngle = 40,
	TwistLowerAngle = -5,
	TwistUpperAngle = 80,
	FrictionTorque = 600,
	StrengthTorque = 4000,
	ReferenceMass = 1.917501688004
}
local t_9 = {
	UpperAngle = 30,
	TwistLowerAngle = -40,
	TwistUpperAngle = 40
}
local t_10 = {
	UpperAngle = 110,
	TwistLowerAngle = -85,
	TwistUpperAngle = 85
}
local t_11 = {
	UpperAngle = 40,
	TwistLowerAngle = -5,
	TwistUpperAngle = 80
}
local vector3 = Vector3.new()
local list = {
	{
		"UpperTorso",
		"RightShoulderRagdollAttachment",
		CFrame.fromMatrix(vector3, Vector3.new(1, 0, 0), Vector3.new(0, 1, 0)),
		"RightShoulderRigAttachment"
	},
	{
		"RightUpperArm",
		"RightShoulderRagdollAttachment",
		CFrame.fromMatrix(vector3, Vector3.new(0, -1, 0), Vector3.new(1, 0, 0)),
		"RightShoulderRigAttachment"
	},
	{
		"UpperTorso",
		"LeftShoulderRagdollAttachment",
		CFrame.fromMatrix(vector3, Vector3.new(-1, 0, 0), Vector3.new(0, 1, 0)),
		"LeftShoulderRigAttachment"
	},
	{
		"LeftUpperArm",
		"LeftShoulderRagdollAttachment",
		CFrame.fromMatrix(vector3, Vector3.new(0, -1, 0), Vector3.new(-1, 0, 0)),
		"LeftShoulderRigAttachment"
	}
}
local list_1 = {
	{ "UpperTorso", "Head", "NeckRigAttachment", t_1 },
	{ "LowerTorso", "UpperTorso", "WaistRigAttachment", t_2 },
	{
		"UpperTorso",
		"LeftUpperArm",
		"LeftShoulderRagdollAttachment",
		t_7
	},
	{
		"LeftUpperArm",
		"LeftLowerArm",
		"LeftElbowRigAttachment",
		t_4
	},
	{
		"LeftLowerArm",
		"LeftHand",
		"LeftWristRigAttachment",
		t_5
	},
	{
		"UpperTorso",
		"RightUpperArm",
		"RightShoulderRagdollAttachment",
		t_7
	},
	{
		"RightUpperArm",
		"RightLowerArm",
		"RightElbowRigAttachment",
		t_4
	},
	{
		"RightLowerArm",
		"RightHand",
		"RightWristRigAttachment",
		t_5
	},
	{
		"LowerTorso",
		"LeftUpperLeg",
		"LeftHipRigAttachment",
		t_8
	},
	{
		"LeftUpperLeg",
		"LeftLowerLeg",
		"LeftKneeRigAttachment",
		t_6
	},
	{
		"LeftLowerLeg",
		"LeftFoot",
		"LeftAnkleRigAttachment",
		t_3
	},
	{
		"LowerTorso",
		"RightUpperLeg",
		"RightHipRigAttachment",
		t_8
	},
	{
		"RightUpperLeg",
		"RightLowerLeg",
		"RightKneeRigAttachment",
		t_6
	},
	{
		"RightLowerLeg",
		"RightFoot",
		"RightAnkleRigAttachment",
		t_3
	}
}
local list_2 = {
	{ "LowerTorso", "LeftUpperArm" }, { "LeftUpperArm", "LeftHand" },
	{ "LowerTorso", "RightUpperArm" }, { "RightUpperArm", "RightHand" },
	{ "LeftUpperLeg", "RightUpperLeg" }, { "UpperTorso", "RightUpperLeg" },
	{ "RightUpperLeg", "RightFoot" }, { "UpperTorso", "LeftUpperLeg" },
	{ "LeftUpperLeg", "LeftFoot" }, { "UpperTorso", "LeftLowerLeg" },
	{ "UpperTorso", "RightLowerLeg" }, { "LowerTorso", "LeftLowerLeg" },
	{ "LowerTorso", "RightLowerLeg" }, { "UpperTorso", "LeftLowerArm" },
	{ "UpperTorso", "RightLowerArm" }, { "Head", "LeftUpperArm" },
	{ "Head", "RightUpperArm" }
}
local list_3 = {
	{ "Waist", "UpperTorso" }, { "Neck", "Head" },
	{ "LeftShoulder", "LeftUpperArm" }, { "LeftElbow", "LeftLowerArm" },
	{ "LeftWrist", "LeftHand" }, { "RightShoulder", "RightUpperArm" },
	{ "RightElbow", "RightLowerArm" }, { "RightWrist", "RightHand" },
	{ "LeftHip", "LeftUpperLeg" }, { "LeftKnee", "LeftLowerLeg" },
	{ "LeftAnkle", "LeftFoot" }, { "RightHip", "RightUpperLeg" },
	{ "RightKnee", "RightLowerLeg" }, { "RightAnkle", "RightFoot" }
}
local list_4 = {
	{ "Head", "NeckAttachment", CFrame.new(0, -0.5, 0) },
	{
		"Torso",
		"RightShoulderRagdollAttachment",
		CFrame.fromMatrix(Vector3.new(1, 0.5, 0), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0))
	},
	{
		"Right Arm",
		"RightShoulderRagdollAttachment",
		CFrame.fromMatrix(Vector3.new(-0.5, 0.5, 0), Vector3.new(0, -1, 0), Vector3.new(1, 0, 0))
	},
	{
		"Torso",
		"LeftShoulderRagdollAttachment",
		CFrame.fromMatrix(Vector3.new(-1, 0.5, 0), Vector3.new(-1, 0, 0), Vector3.new(0, 1, 0))
	},
	{
		"Left Arm",
		"LeftShoulderRagdollAttachment",
		CFrame.fromMatrix(Vector3.new(0.5, 0.5, 0), Vector3.new(0, -1, 0), Vector3.new(-1, 0, 0))
	},
	{ "Torso", "RightHipAttachment", CFrame.new(0.5, -1, 0) },
	{ "Right Leg", "RightHipAttachment", CFrame.new(0, 1, 0) },
	{ "Torso", "LeftHipAttachment", CFrame.new(-0.5, -1, 0) },
	{ "Left Leg", "LeftHipAttachment", CFrame.new(0, 1, 0) }
}
local list_5 = {
	{ "Torso", "Head", "NeckAttachment", t_9 },
	{ "Torso", "Left Leg", "LeftHipAttachment", t_11 },
	{ "Torso", "Right Leg", "RightHipAttachment", t_11 },
	{
		"Torso",
		"Left Arm",
		"LeftShoulderRagdollAttachment",
		t_10
	},
	{
		"Torso",
		"Right Arm",
		"RightShoulderRagdollAttachment",
		t_10
	}
}
local list_6 = {
	{ "Left Leg", "Right Leg" },
	{ "Head", "Right Arm" },
	{ "Head", "Left Arm" }
}
local list_7 = {
	{ "Neck", "Torso" },
	{ "Left Shoulder", "Torso" },
	{ "Right Shoulder", "Torso" },
	{ "Left Hip", "Torso" },
	{ "Right Hip", "Torso" }
}

local function indexParts(p0)
	local t = {}
	
	for i, v in ipairs(p0:GetChildren()) do
		if v:IsA("BasePart") then
			local name = v.name
			
			if not t[name] then
				t[name] = v
			end
		end
	end
	return t
end

local function createRigJoints(p1, p2, p3)
	if p3 then
		local root = Instance.new("AnimationConstraint")
		root.Name = "Root"
		root.Attachment0 = p1.HumanoidRootPart.RootRigAttachment
		root.Attachment1 = p1.LowerTorso.RootRigAttachment
		root.IsKinematic = true
		p1.LowerTorso.Root:Destroy()
		root.Parent = p1.LowerTorso
	end
	for i, v in ipairs(p2) do
		local var32, var33, var34, var35 = unpack(v)
		local var36 = p1[var32]
		local var37 = p1[var33]
		
		if var36 and var37 then
			local var38 = var36:FindFirstChild(var34)
			local var39 = var37:FindFirstChild(var34)
			
			if var38 and var39 and (var38:IsA("Attachment") and var39:IsA("Attachment")) then
				local ragdollBallSocket_1 = var37:FindFirstChild("RagdollBallSocket")
				
				if not ragdollBallSocket_1 then
					ragdollBallSocket_1 = Instance.new("BallSocketConstraint")
					ragdollBallSocket_1.Name = "RagdollBallSocket"
				end
				ragdollBallSocket_1.Attachment0 = var38
				ragdollBallSocket_1.Attachment1 = var39
				ragdollBallSocket_1.LimitsEnabled = true
				ragdollBallSocket_1.UpperAngle = var35.UpperAngle
				ragdollBallSocket_1.TwistLimitsEnabled = true
				ragdollBallSocket_1.TwistLowerAngle = var35.TwistLowerAngle
				ragdollBallSocket_1.TwistUpperAngle = var35.TwistUpperAngle
				local var41 = workspace.Gravity / 196.2
				
				if p3 then
					var41 = math.max(var41, 0.2)
				end
				local referenceMass = var35.ReferenceMass
				local var42 = if referenceMass then var37:GetMass() / referenceMass else 1
				ragdollBallSocket_1.MaxFrictionTorque = (var35.FrictionTorque or 500) * var42 * var41
				
				if p3 then
					ragdollBallSocket_1.MaxFrictionTorque /= 100
				end
				ragdollBallSocket_1.Parent = var37
				
				if p3 then
					local motor6D = var37:FindFirstChildWhichIsA("Motor6D")
					assert(motor6D)
					local animationConstraint = Instance.new("AnimationConstraint")
					animationConstraint.Name = motor6D.Name
					animationConstraint.Attachment0 = motor6D.Part0:FindFirstChild(motor6D.Name .. "RigAttachment")
					animationConstraint.Attachment1 = motor6D.Part1:FindFirstChild(motor6D.Name .. "RigAttachment")
					animationConstraint.IsKinematic = true
					animationConstraint.MaxTorque = (var35.StrengthTorque or 500) * var42 * var41
					animationConstraint.MaxForce = 0
					animationConstraint.Parent = motor6D.parent
					motor6D:Destroy()
				end
			end
		end
	end
end

local function createAdditionalAttachments(p4, p5)
	for i, v in ipairs(p5) do
		local var45, var46, var47, var48 = unpack(v)
		local var49 = p4[var45]
		
		if var49 then
			local var50 = var49:FindFirstChild(var46)
			
			if not var50 or var50:IsA("Attachment") then
				if var48 then
					local var51 = var49:FindFirstChild(var48)
					
					if var51 and var51:IsA("Attachment") then
						var47 = var51.CFrame * var47
					end
				end
				if var50 then
					var50.CFrame = var47
				else
					var50 = Instance.new("Attachment")
					var50.Name = var46
					var50.CFrame = var47
					var50.Parent = var49
				end
			end
		end
	end
end

local function createNoCollides(p6, p7)
	local t = {}
	
	for i, v in ipairs(p7) do
		local var57, var58 = unpack(v)
		local var59 = p6[var57]
		local var60 = p6[var58]
		
		if var59 and var60 then
			local var61 = t[var60]
			
			if not var61 then
				var61 = {}
				t[var60] = var61
			end
			var61[var59] = true
		end
	end
	local t_1 = {}
	
	for i_1, v_1 in pairs(t) do
		local t_2 = {}
		
		for i_3, v_3 in ipairs(i_1:GetChildren()) do
			if v_3:IsA("NoCollisionConstraint") and v_3.Name == "RagdollNoCollision" then
				local part0 = v_3.Part0
				
				if v_3.Part1 == i_1 and v_1[part0] then
					v_1[part0] = nil
				else
					table.insert(t_2, v_3)
				end
			end
		end
		t_1[i_1] = t_2
	end
	for i_1, v_2 in pairs(t) do
		local var54 = t_1[i_1]
		
		for i_3, v_3 in pairs(v_2) do
			local ragdollNoCollision = table.remove(var54) or Instance.new("NoCollisionConstraint")
			ragdollNoCollision.Name = "RagdollNoCollision"
			ragdollNoCollision.Part0 = i_3
			ragdollNoCollision.Part1 = i_1
			ragdollNoCollision.Parent = i_1
		end
	end
end

local function _(p8, _)
	return if p8 then true else false
end

local _ = function(_, _, p9, p10)
	return if (if p9 then true else false) and (if p10 then true else false) then true else (if p9 then true else false) and (if p10 then true else false)
end

local function hasValidConstraint(_, p11)
	for i, v in ipairs(p11:GetChildren()) do
		if v:IsA("BallSocketConstraint") then
			local attachment0 = v.Attachment0
			local attachment1 = v.Attachment1
			
			if if (if attachment0 then true else false) and (if attachment1 then true else false) then true elseif (if attachment0 then true else false) and (if attachment1 then true else false) then true else false then
				return true
			end
		end
	end
	return false
end

local function hasRagdollJoint(p12)
	-- upvalues: avatarJointUpgradeFeatureEngineFeature (ref), hasValidConstraint (ref)
	if avatarJointUpgradeFeatureEngineFeature and not p12:IsA("Motor6D") and not p12:IsA("AnimationConstraint") then
		return false
	end
	local parent = nil
	local var63 = nil
	
	if p12:IsA("Motor6D") then
		parent = p12.Part0
		var63 = p12.Part1
	elseif avatarJointUpgradeFeatureEngineFeature and p12:IsA("AnimationConstraint") then
		local attachment0 = p12.Attachment0
		local attachment1 = p12.Attachment1
		parent = attachment0 and attachment0.Parent
		var63 = attachment1 and attachment1.Parent
	end
	return not (not parent or not var63) and (if hasValidConstraint(parent, var63) then true else hasValidConstraint(var63, parent))
end

local function disableMotorSet(value, p13)
	-- upvalues: avatarJointUpgradeFeatureEngineFeature (ref), hasRagdollJoint (ref)
	local t = {}
	
	for i, v in ipairs(p13) do
		local var65 = value:FindFirstChild(v[2])
		
		if var65 then
			local var66 = var65:FindFirstChild(v[1])
			
			if var66 and (avatarJointUpgradeFeatureEngineFeature or var66:IsA("Motor6D")) and hasRagdollJoint(var66) then
				table.insert(t, var66)
				var66.Enabled = false
			end
		end
	end
	return t
end

function t.createRagdollJoints(p14, p15, p16)
	-- upvalues: indexParts (ref), createAdditionalAttachments (ref), list_4 (ref), createRigJoints (ref), list_5 (ref), createNoCollides (ref), list_6 (ref), list (ref), list_1 (ref), list_2 (ref)
	local var67 = indexParts(p14)
	
	if p15 == Enum.HumanoidRigType.R6 then
		createAdditionalAttachments(var67, list_4)
		createRigJoints(var67, list_5, false)
		createNoCollides(var67, list_6)
		
		return
	elseif p15 == Enum.HumanoidRigType.R15 then
		createAdditionalAttachments(var67, list)
		createRigJoints(var67, list_1, p16)
		createNoCollides(var67, list_2)
		
		return
	end
	error("unknown rig type", 2)
end

function t.disableMotors(p17, p18)
	-- upvalues: disableMotorSet (ref), list_7 (ref), list_3 (ref)
	local var68 = nil
	
	if p18 == Enum.HumanoidRigType.R6 then
		var68 = disableMotorSet(p17, list_7)
	elseif p18 == Enum.HumanoidRigType.R15 then
		var68 = disableMotorSet(p17, list_3)
	else
		error("unknown rig type", 2)
	end
	local primaryPart = p17.PrimaryPart or p17:FindFirstChild("HumanoidRootPart")
	
	if primaryPart and primaryPart:IsA("BasePart") then
		primaryPart.CanCollide = false
	end
	local head = p17:FindFirstChild("Head")
	
	if head and head:IsA("BasePart") then
		head.CanCollide = true
	end
	return var68
end

function t.disableParticleEmittersAndFadeOut(p19, p20)
	-- upvalues: runService (ref)
	if runService:IsServer() then
		error("disableParticleEmittersAndFadeOut should not be called on the server.", 2)
	end
	local t = {}
	
	for i, v in pairs(p19:GetDescendants()) do
		if v:IsA("BasePart") or v:IsA("Decal") then
			t[v] = v.Transparency
		elseif v:IsA("ParticleEmitter") then
			v.Enabled = false
		end
	end
	local var72 = 0
	while var72 < p20 do
		var72 += runService.Heartbeat:Wait()
		local minValue = math.min(var72 / p20, 1)
		
		for i_1, v_1 in pairs(t) do
			i_1.Transparency = (1 - minValue) * v_1 + minValue
		end
	end
end

function t.easeNongraphicJointFriction(p21, p22)
	-- upvalues: runService (ref)
	local t = {}
	
	for i, v in pairs(p21:GetDescendants()) do
		if v:IsA("BallSocketConstraint") and v.Name == "RagdollBallSocket" then
			v.MaxFrictionTorque *= 100
			local maxFrictionTorque = v.MaxFrictionTorque
			local name = v.Parent.Name
			t[v] = {
				v,
				maxFrictionTorque,
				maxFrictionTorque * (if name == "UpperTorso" or name == "Head" then 0.5 else 0.05)
			}
		end
	end
	local var75 = 0
	while var75 < p22 do
		local _, var76 = runService.Stepped:Wait()
		var75 += var76
		local minValue = math.min(var75 / p22, 1)
		
		for i_1, v_1 in pairs(t) do
			local var78, var79, var80 = unpack(v_1)
			var78.MaxFrictionTorque = (1 - minValue) * var79 + minValue * var80
		end
	end
end

function t.easeJointFriction_OLD(p23, p24)
	-- upvalues: runService (ref)
	local t = {}
	
	for i, v in pairs(p23:GetDescendants()) do
		if v:IsA("BallSocketConstraint") and v.Name == "RagdollBallSocket" then
			local maxFrictionTorque = v.MaxFrictionTorque
			local name = v.Parent.Name
			t[v] = {
				v,
				maxFrictionTorque,
				maxFrictionTorque * (if name == "UpperTorso" or name == "Head" then 0.5 else 0.05)
			}
		end
	end
	local var82 = 0
	while var82 < p24 do
		local _, var83 = runService.Stepped:Wait()
		var82 += var83
		local minValue = math.min(var82 / p24, 1)
		
		for i_1, v_1 in pairs(t) do
			local var85, var86, var87 = unpack(v_1)
			var85.MaxFrictionTorque = (1 - minValue) * var86 + minValue * var87
		end
	end
end

return t