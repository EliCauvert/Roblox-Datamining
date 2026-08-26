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

local function indexParts(p1)
	local t = {}
	
	for i, v in ipairs(p1:GetChildren()) do
		if v:IsA("BasePart") then
			local name = v.name
			
			if not t[name] then
				t[name] = v
			end
		end
	end
	return t
end

local function createRigJoints(p2, p3, p4)
	if p4 then
		local root = Instance.new("AnimationConstraint")
		root.Name = "Root"
		root.Attachment0 = p2.HumanoidRootPart.RootRigAttachment
		root.Attachment1 = p2.LowerTorso.RootRigAttachment
		root.IsKinematic = true
		p2.LowerTorso.Root:Destroy()
		root.Parent = p2.LowerTorso
	end
	for i, v in ipairs(p3) do
		local var1, var2, var3, var4 = unpack(v)
		local var5 = p2[var1]
		local var6 = p2[var2]
		
		if var5 and var6 then
			local var7 = var5:FindFirstChild(var3)
			local var8 = var6:FindFirstChild(var3)
			
			if var7 and var8 and (var7:IsA("Attachment") and var8:IsA("Attachment")) then
				local ragdollBallSocket_1 = var6:FindFirstChild("RagdollBallSocket")
				
				if not ragdollBallSocket_1 then
					ragdollBallSocket_1 = Instance.new("BallSocketConstraint")
					ragdollBallSocket_1.Name = "RagdollBallSocket"
				end
				ragdollBallSocket_1.Attachment0 = var7
				ragdollBallSocket_1.Attachment1 = var8
				ragdollBallSocket_1.LimitsEnabled = true
				ragdollBallSocket_1.UpperAngle = var4.UpperAngle
				ragdollBallSocket_1.TwistLimitsEnabled = true
				ragdollBallSocket_1.TwistLowerAngle = var4.TwistLowerAngle
				ragdollBallSocket_1.TwistUpperAngle = var4.TwistUpperAngle
				local var9 = workspace.Gravity / 196.2
				
				if p4 then
					var9 = math.max(var9, 0.2)
				end
				local referenceMass = var4.ReferenceMass
				local var10 = if referenceMass then var6:GetMass() / referenceMass else 1
				ragdollBallSocket_1.MaxFrictionTorque = (var4.FrictionTorque or 500) * var10 * var9
				
				if p4 then
					ragdollBallSocket_1.MaxFrictionTorque /= 100
				end
				ragdollBallSocket_1.Parent = var6
				
				if p4 then
					local motor6D = var6:FindFirstChildWhichIsA("Motor6D")
					assert(motor6D)
					local animationConstraint = Instance.new("AnimationConstraint")
					animationConstraint.Name = motor6D.Name
					animationConstraint.Attachment0 = motor6D.Part0:FindFirstChild(motor6D.Name .. "RigAttachment")
					animationConstraint.Attachment1 = motor6D.Part1:FindFirstChild(motor6D.Name .. "RigAttachment")
					animationConstraint.IsKinematic = true
					animationConstraint.MaxTorque = (var4.StrengthTorque or 500) * var10 * var9
					animationConstraint.MaxForce = 0
					animationConstraint.Parent = motor6D.parent
					motor6D:Destroy()
				end
			end
		end
	end
end

local function createAdditionalAttachments(p5, p6)
	for i, v in ipairs(p6) do
		local var11, var12, var13, var14 = unpack(v)
		local var15 = p5[var11]
		
		if var15 then
			local var16 = var15:FindFirstChild(var12)
			
			if not var16 or var16:IsA("Attachment") then
				if var14 then
					local var17 = var15:FindFirstChild(var14)
					
					if var17 and var17:IsA("Attachment") then
						var13 = var17.CFrame * var13
					end
				end
				if var16 then
					var16.CFrame = var13
				else
					var16 = Instance.new("Attachment")
					var16.Name = var12
					var16.CFrame = var13
					var16.Parent = var15
				end
			end
		end
	end
end

local function createNoCollides(p7, p8)
	local t = {}
	
	for i, v in ipairs(p8) do
		local var18, var19 = unpack(v)
		local var20 = p7[var18]
		local var21 = p7[var19]
		
		if var20 and var21 then
			local var22 = t[var21]
			
			if not var22 then
				var22 = {}
				t[var21] = var22
			end
			var22[var20] = true
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
		local var23 = t_1[i_1]
		
		for i_3, v_3 in pairs(v_2) do
			local ragdollNoCollision = table.remove(var23) or Instance.new("NoCollisionConstraint")
			ragdollNoCollision.Name = "RagdollNoCollision"
			ragdollNoCollision.Part0 = i_3
			ragdollNoCollision.Part1 = i_1
			ragdollNoCollision.Parent = i_1
		end
	end
end

local function _(p9, _)
	return if p9 then true else false
end

local _ = function(_, _, p9, p10)
	return if (if p9 then true else false) and (if p10 then true else false) then true else (if p9 then true else false) and (if p10 then true else false)
end

local function hasValidConstraint(_, p9)
	for i, v in ipairs(p9:GetChildren()) do
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

local function hasRagdollJoint(p10)
	-- upvalues: avatarJointUpgradeFeatureEngineFeature (ref), hasValidConstraint (ref)
	if avatarJointUpgradeFeatureEngineFeature and not p10:IsA("Motor6D") and not p10:IsA("AnimationConstraint") then
		return false
	end
	local parent = nil
	local var24 = nil
	
	if p10:IsA("Motor6D") then
		parent = p10.Part0
		var24 = p10.Part1
	elseif avatarJointUpgradeFeatureEngineFeature and p10:IsA("AnimationConstraint") then
		local attachment0 = p10.Attachment0
		local attachment1 = p10.Attachment1
		parent = attachment0 and attachment0.Parent
		var24 = attachment1 and attachment1.Parent
	end
	return not (not parent or not var24) and (if hasValidConstraint(parent, var24) then true else hasValidConstraint(var24, parent))
end

local function disableMotorSet(value, p10)
	-- upvalues: avatarJointUpgradeFeatureEngineFeature (ref), hasRagdollJoint (ref)
	local t = {}
	
	for i, v in ipairs(p10) do
		local var24 = value:FindFirstChild(v[2])
		
		if var24 then
			local var25 = var24:FindFirstChild(v[1])
			
			if var25 and (avatarJointUpgradeFeatureEngineFeature or var25:IsA("Motor6D")) and hasRagdollJoint(var25) then
				table.insert(t, var25)
				var25.Enabled = false
			end
		end
	end
	return t
end

function t.createRagdollJoints(p11, p12, p13)
	-- upvalues: indexParts (ref), createAdditionalAttachments (ref), list_4 (ref), createRigJoints (ref), list_5 (ref), createNoCollides (ref), list_6 (ref), list (ref), list_1 (ref), list_2 (ref)
	local var26 = indexParts(p11)
	
	if p12 == Enum.HumanoidRigType.R6 then
		createAdditionalAttachments(var26, list_4)
		createRigJoints(var26, list_5, false)
		createNoCollides(var26, list_6)
		
		return
	elseif p12 == Enum.HumanoidRigType.R15 then
		createAdditionalAttachments(var26, list)
		createRigJoints(var26, list_1, p13)
		createNoCollides(var26, list_2)
		
		return
	end
	error("unknown rig type", 2)
end

function t.disableMotors(p11, p12)
	-- upvalues: disableMotorSet (ref), list_7 (ref), list_3 (ref)
	local var26 = nil
	
	if p12 == Enum.HumanoidRigType.R6 then
		var26 = disableMotorSet(p11, list_7)
	elseif p12 == Enum.HumanoidRigType.R15 then
		var26 = disableMotorSet(p11, list_3)
	else
		error("unknown rig type", 2)
	end
	local primaryPart = p11.PrimaryPart or p11:FindFirstChild("HumanoidRootPart")
	
	if primaryPart and primaryPart:IsA("BasePart") then
		primaryPart.CanCollide = false
	end
	local head = p11:FindFirstChild("Head")
	
	if head and head:IsA("BasePart") then
		head.CanCollide = true
	end
	return var26
end

function t.disableParticleEmittersAndFadeOut(p11, p12)
	-- upvalues: runService (ref)
	if runService:IsServer() then
		error("disableParticleEmittersAndFadeOut should not be called on the server.", 2)
	end
	local t = {}
	
	for i, v in pairs(p11:GetDescendants()) do
		if v:IsA("BasePart") or v:IsA("Decal") then
			t[v] = v.Transparency
		elseif v:IsA("ParticleEmitter") then
			v.Enabled = false
		end
	end
	local var26 = 0
	while var26 < p12 do
		var26 += runService.Heartbeat:Wait()
		local minValue = math.min(var26 / p12, 1)
		
		for i_1, v_1 in pairs(t) do
			i_1.Transparency = (1 - minValue) * v_1 + minValue
		end
	end
end

function t.easeNongraphicJointFriction(p13, p14)
	-- upvalues: runService (ref)
	local t = {}
	
	for i, v in pairs(p13:GetDescendants()) do
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
	local var27 = 0
	while var27 < p14 do
		local _, var28 = runService.Stepped:Wait()
		var27 += var28
		local minValue = math.min(var27 / p14, 1)
		
		for i_1, v_1 in pairs(t) do
			local var29, var30, var31 = unpack(v_1)
			var29.MaxFrictionTorque = (1 - minValue) * var30 + minValue * var31
		end
	end
end

function t.easeJointFriction_OLD(p15, p16)
	-- upvalues: runService (ref)
	local t = {}
	
	for i, v in pairs(p15:GetDescendants()) do
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
	local var32 = 0
	while var32 < p16 do
		local _, var33 = runService.Stepped:Wait()
		var32 += var33
		local minValue = math.min(var32 / p16, 1)
		
		for i_1, v_1 in pairs(t) do
			local var34, var35, var36 = unpack(v_1)
			var34.MaxFrictionTorque = (1 - minValue) * var35 + minValue * var36
		end
	end
end

return t