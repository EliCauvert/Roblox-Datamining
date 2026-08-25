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
		local var1 = `{p1}Hand{v}`
		t[`{var1}1`] = {
			ClassName = "Bone",
			_children = {
				[`{var1}2`] = {
					ClassName = "Bone",
					_children = { [`{var1}3`] = { ClassName = "Bone" } }
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
local var2 = buildDrdSchema("Left")
local var3 = buildDrdSchema("Right")
local var4 = false

function t.setIsBackendBundleUpload(value)
	-- upvalues: var4 (write)
	var4 = value
end

function t.checkFlagEnabledForAllowHrd()
	-- upvalues: getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule (ref), getFFlagUGCValidationAllowHRDUploadModule (ref), getFFlagDebugAllowHRDUploadOnBundleBackendModule (ref), var4 (write)
	return if getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule() then if getFFlagUGCValidationAllowHRDUploadModule() then true else getFFlagDebugAllowHRDUploadOnBundleBackendModule() and var4 else false
end

local var1 = nil
local var2 = nil

function t.getHrdJointLabels()
	-- upvalues: var1 (write)
	if var1 == nil then
		var1 = Instance.new("HumanoidRigDescription"):GetJointLabels()
	end
	return var1
end

function t.getDrdJointLabels()
	-- upvalues: var2 (write)
	if var2 == nil then
		var2 = Instance.new("DigitsRigDescription"):GetJointLabels()
	end
	return var2
end

function t.getJointNameWhitelist()
	-- upvalues: var1 (write), constantsModule (ref), t (ref)
	if var1 ~= nil then
		return var1
	end
	var1 = {}
	
	for i, v in constantsModule.R15_STANDARD_JOINT_NAMES do
		var1[i] = true
	end
	for i_1, v_1 in t.getHrdJointLabels() do
		var1[v_1.Name] = true
	end
	for i_2, v_2 in t.getDrdJointLabels() do
		var1[`LeftHand{v_2.Name}`] = true
		var1[`RightHand{v_2.Name}`] = true
	end
	return var1
end

function t.getNameWhitelistOfClassInSchema(p1, p2)
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in p1 do
		if v.ClassName == p2 then
			t_1[i] = true
		end
		if v._children ~= nil then
			for i_1, v_1 in t.getNameWhitelistOfClassInSchema(v._children, p2) do
				t_1[i_1] = v_1
			end
		end
	end
	return t_1
end

function t.getSchemaFlatHierarchyList(p1, p2)
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in p1 do
		local cloned = table.clone(p2)
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

function t.getDrdSchema(p1)
	-- upvalues: var2 (ref), var3 (ref)
	if p1 == "Left" then
		return var2
	elseif p1 == "Right" then
		return var3
	end
	error("Invalid side: " .. p5)
end

function t.getAvatarBoneSchema(p1)
	-- upvalues: t_1 (ref), t_2 (ref), t_3 (ref), t_4 (ref), var2 (ref), var3 (ref)
	return if p1 == "Head" then t_1 elseif p1 == "UpperTorso" then t_2 elseif p1 == "LeftFoot" then t_3 elseif p1 == "RightFoot" then t_4 elseif p1 == "LeftHand" then var2 elseif p1 == "RightHand" then var3 else {}
end

return t