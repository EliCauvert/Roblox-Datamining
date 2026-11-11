local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local T = nil
local Flags = Parent.flags
local GetFFlagUGCValidationAllowHRDUploadModule = require(Flags.getFFlagUGCValidationAllowHRDUpload)
local GetFFlagDebugAllowHRDUploadOnBundleBackendModule = require(Flags.getFFlagDebugAllowHRDUploadOnBundleBackend)
local GetFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule = require(Flags.getFFlagUGCValidationExtendSchemaToIgnoreDescendants)
local list = {
	"Index",
	"Middle",
	"Pinky",
	"Ring",
	"Thumb"
}

local function buildDrdSchema(p1)
	-- upvalues: list (copy)
	local t = {}
	
	for _, value in list do
		local HandName: string = `{p1}Hand{value}`
		t[`{HandName}1`] = {
			ClassName = "Bone",
			_children = {
				[`{HandName}2`] = {
					ClassName = "Bone",
					_children = { [`{HandName}3`] = { ClassName = "Bone" } }
				}
			}
		}
	end
	return t
end

local config = {
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
local config1 = {
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
local config2 = { LeftToeBase = { ClassName = "Bone" } }
local config3 = { RightToeBase = { ClassName = "Bone" } }
local Left = buildDrdSchema("Left")
local Right = buildDrdSchema("Right")
local IsBackendBundleUpload = false
local JointLabels = nil
local JointLabels1 = nil
local R15plusUtils = {
	JointRotationName = "JointRotation",
	setIsBackendBundleUpload = function(Value)
		-- upvalues: IsBackendBundleUpload (ref)
		IsBackendBundleUpload = Value
	end,
	checkFlagEnabledForAllowHrd = function(): boolean
		-- upvalues: GetFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule (copy), GetFFlagUGCValidationAllowHRDUploadModule (copy), GetFFlagDebugAllowHRDUploadOnBundleBackendModule (copy), IsBackendBundleUpload (ref)
		return if GetFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule() then if GetFFlagUGCValidationAllowHRDUploadModule() then true elseif GetFFlagDebugAllowHRDUploadOnBundleBackendModule() and IsBackendBundleUpload then true else false else false
	end,
	getHrdJointLabels = function()
		-- upvalues: JointLabels (ref)
		if JointLabels == nil then
			JointLabels = Instance.new("HumanoidRigDescription"):GetJointLabels()
		end
		return JointLabels
	end,
	getDrdJointLabels = function()
		-- upvalues: JointLabels1 (ref)
		if JointLabels1 == nil then
			JointLabels1 = Instance.new("DigitsRigDescription"):GetJointLabels()
		end
		return JointLabels1
	end
}

function R15plusUtils.getJointNameWhitelist()
	-- upvalues: T (ref), ConstantsModule (copy), R15plusUtils (copy)
	if T ~= nil then
		return T
	end
	T = {}
	
	for i, _ in ConstantsModule.R15_STANDARD_JOINT_NAMES do
		T[i] = true
	end
	for _, value in R15plusUtils.getHrdJointLabels() do
		T[value.Name] = true
	end
	for _, value1 in R15plusUtils.getDrdJointLabels() do
		T[`LeftHand{value1.Name}`] = true
		T[`RightHand{value1.Name}`] = true
	end
	return T
end

function R15plusUtils.getNameWhitelistOfClassInSchema(Children, ClassName)
	-- upvalues: R15plusUtils (copy)
	local t = {}
	
	for i, child in Children do
		if child.ClassName == ClassName then
			t[i] = true
		end
		if child._children ~= nil then
			for i1, value in R15plusUtils.getNameWhitelistOfClassInSchema(child._children, ClassName) do
				t[i1] = value
			end
		end
	end
	return t
end

function R15plusUtils.getSchemaFlatHierarchyList(Children, Tbl)
	-- upvalues: R15plusUtils (copy)
	local t = {}
	
	for i, child in Children do
		local Copy = table.clone(Tbl)
		table.insert(Copy, i)
		t[i] = { ClassName = child.ClassName, path = Copy }
		
		if child._children ~= nil then
			for i1, value in R15plusUtils.getSchemaFlatHierarchyList(child._children, Copy) do
				t[i1] = value
			end
		end
	end
	return t
end

function R15plusUtils.getFingerFlatSuffixes()
	-- upvalues: list (copy)
	return list
end

function R15plusUtils.getDrdSchema(Text)
	-- upvalues: Left (copy), Right (copy)
	if Text == "Left" then
		return Left
	elseif Text == "Right" then
		return Right
	else
		error("Invalid side: " .. Text)
	end
end

function R15plusUtils.getAvatarBoneSchema(p2)
	-- upvalues: config (copy), config1 (copy), config2 (copy), config3 (copy), Left (copy), Right (copy)
	return if p2 == "Head" then config elseif p2 == "UpperTorso" then config1 elseif p2 == "LeftFoot" then config2 elseif p2 == "RightFoot" then config3 elseif p2 == "LeftHand" then Left elseif p2 == "RightHand" then Right else {}
end

return R15plusUtils