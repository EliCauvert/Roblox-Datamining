local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local t = { JointRotationName = "JointRotation" }
local var1 = nil
local flags = parent.flags
local getFFlagUGCValidationAllowHRDUploadModule = require(flags.getFFlagUGCValidationAllowHRDUpload)
local getFFlagDebugAllowHRDUploadOnBundleBackendModule = require(flags.getFFlagDebugAllowHRDUploadOnBundleBackend)
local getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule = require(flags.getFFlagUGCValidationExtendSchemaToIgnoreDescendants)
local list = {
	"Index",
	"Middle",
	"Pinky",
	"Ring",
	"Thumb"
}

local function buildDrdSchema(p1)
	-- upvalues: list (ref)
	local t = {}
	
	for i, v in list do
		local var2 = `{p1}Hand{v}`
		t[`{var2}1`] = {
			ClassName = "Bone",
			_children = {
				[`{var2}2`] = {
					ClassName = "Bone",
					_children = { [`{var2}3`] = { ClassName = "Bone" } }
				}
			}
		}
	end
	return t
end

local t_1 = {
	HeadBase = {
		ClassName = "Bone",
		_children = {
			FaceCenterAttachment = { ClassName = "Attachment" },
			FaceFrontAttachment = { ClassName = "Attachment" },
			HairAttachment = { ClassName = "Attachment" },
			HatAttachment = { ClassName = "Attachment" }
		}
	}
}
local t_2 = {
	Spine = {
		ClassName = "Bone",
		_children = {
			Chest = {
				ClassName = "Bone",
				_children = {
					BodyBackAttachment = { ClassName = "Attachment" },
					BodyFrontAttachment = { ClassName = "Attachment" },
					NeckRigAttachment = { ClassName = "Attachment" },
					NeckAttachment = { ClassName = "Attachment" },
					LeftClavicle = {
						ClassName = "Bone",
						_children = {
							LeftCollarAttachment = { ClassName = "Attachment" },
							LeftShoulderRigAttachment = { ClassName = "Attachment" }
						}
					},
					RightClavicle = {
						ClassName = "Bone",
						_children = {
							RightCollarAttachment = { ClassName = "Attachment" },
							RightShoulderRigAttachment = { ClassName = "Attachment" }
						}
					}
				}
			}
		}
	}
}
local t_3 = { LeftToeBase = { ClassName = "Bone" } }
local t_4 = { RightToeBase = { ClassName = "Bone" } }
local var3 = buildDrdSchema("Left")
local var4 = buildDrdSchema("Right")
local var5 = false

function t.setIsBackendBundleUpload(value)
	-- upvalues: var5 (write)
	var5 = value
end

function t.checkFlagEnabledForAllowHrd()
	-- upvalues: getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule (ref), getFFlagUGCValidationAllowHRDUploadModule (ref), getFFlagDebugAllowHRDUploadOnBundleBackendModule (ref), var5 (write)
	return if getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule() then if getFFlagUGCValidationAllowHRDUploadModule() then true else getFFlagDebugAllowHRDUploadOnBundleBackendModule() and var5 else false
end

local var2 = nil
local var3 = nil

function t.getHrdJointLabels()
	-- upvalues: var2 (write)
	if var2 == nil then
		var2 = Instance.new("HumanoidRigDescription"):GetJointLabels()
	end
	return var2
end

function t.getDrdJointLabels()
	-- upvalues: var3 (write)
	if var3 == nil then
		var3 = Instance.new("DigitsRigDescription"):GetJointLabels()
	end
	return var3
end

function t.getJointNameWhitelist()
	-- upvalues: var2 (write), constantsModule (ref), t (ref)
	if var2 ~= nil then
		return var2
	end
	var2 = {}
	
	for i, v in constantsModule.R15_STANDARD_JOINT_NAMES do
		var2[i] = true
	end
	for i_1, v_1 in t.getHrdJointLabels() do
		var2[v_1.Name] = true
	end
	for i_2, v_2 in t.getDrdJointLabels() do
		var2[`LeftHand{v_2.Name}`] = true
		var2[`RightHand{v_2.Name}`] = true
	end
	return var2
end

function t.getNameWhitelistOfClassInSchema(p2, p3)
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in p2 do
		if v.ClassName == p3 then
			t_1[i] = true
		end
		if v._children ~= nil then
			for i_1, v_1 in t.getNameWhitelistOfClassInSchema(v._children, p3) do
				t_1[i_1] = v_1
			end
		end
	end
	return t_1
end

function t.getSchemaFlatHierarchyList(p4, p5)
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in p4 do
		local cloned = table.clone(p5)
		table.insert(cloned, i)
		t_1[i] = { ClassName = v.ClassName, path = cloned }
		
		if v._children ~= nil then
			for i_1, v_1 in t.getSchemaFlatHierarchyList(v._children, cloned) do
				t_1[i_1] = v_1
			end
		end
	end
	return t_1
end

function t.getFingerFlatSuffixes()
	-- upvalues: list (ref)
	return list
end

function t.getDrdSchema(p6)
	-- upvalues: var3 (ref), var4 (ref)
	if p6 == "Left" then
		return var3
	elseif p6 == "Right" then
		return var4
	end
	error("Invalid side: " .. p5)
end

function t.getAvatarBoneSchema(p6)
	-- upvalues: t_1 (ref), t_2 (ref), t_3 (ref), t_4 (ref), var3 (ref), var4 (ref)
	return if p6 == "Head" then t_1 elseif p6 == "UpperTorso" then t_2 elseif p6 == "LeftFoot" then t_3 elseif p6 == "RightFoot" then t_4 elseif p6 == "LeftHand" then var3 elseif p6 == "RightHand" then var4 else {}
end

return t