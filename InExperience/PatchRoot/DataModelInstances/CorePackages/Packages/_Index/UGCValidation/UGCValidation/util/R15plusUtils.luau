local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local t = { JointRotationName = "JointRotation" }
local var2 = nil
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

local function buildDrdSchema(p0) --[[ line: 16 ]]
	-- upvalues: list (ref)
	local t = {}
	
	for i, v in list do
		local var18 = `{p0}Hand{v}`
		t[`{var18}1`] = {
			ClassName = "Bone",
			_children = {
				[`{var18}2`] = {
					ClassName = "Bone",
					_children = { [`{var18}3`] = { ClassName = "Bone" } }
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
local var12 = buildDrdSchema("Left")
local var13 = buildDrdSchema("Right")
local var14 = false

function t.setIsBackendBundleUpload(value) --[[ line: 128 ]]
	-- upvalues: var14 (write)
	var14 = value
end

function t.checkFlagEnabledForAllowHrd() --[[ line: 132 ]]
	-- upvalues: getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule (ref), getFFlagUGCValidationAllowHRDUploadModule (ref), getFFlagDebugAllowHRDUploadOnBundleBackendModule (ref), var14 (write)
	return if getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule() then if getFFlagUGCValidationAllowHRDUploadModule() then true else getFFlagDebugAllowHRDUploadOnBundleBackendModule() and var14 else false
end

local var15 = nil
local var16 = nil

function t.getHrdJointLabels() --[[ line: 155 ]]
	-- upvalues: var15 (write)
	if var15 == nil then
		var15 = Instance.new("HumanoidRigDescription"):GetJointLabels()
	end
	return var15
end

function t.getDrdJointLabels() --[[ line: 162 ]]
	-- upvalues: var16 (write)
	if var16 == nil then
		var16 = Instance.new("DigitsRigDescription"):GetJointLabels()
	end
	return var16
end

function t.getJointNameWhitelist() --[[ line: 169 ]]
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

function t.getNameWhitelistOfClassInSchema(p1, p2) --[[ line: 191 ]]
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

function t.getSchemaFlatHierarchyList(p3, p4) --[[ line: 211 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in p3 do
		local cloned = table.clone(p4)
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

function t.getFingerFlatSuffixes() --[[ line: 235 ]]
	-- upvalues: list (ref)
	return list
end

function t.getDrdSchema(p5) --[[ line: 239 ]]
	-- upvalues: var12 (ref), var13 (ref)
	if p5 == "Left" then
		return var12
	elseif p5 == "Right" then
		return var13
	end
	error("Invalid side: " .. p5)
end

function t.getAvatarBoneSchema(p6) --[[ line: 249 ]]
	-- upvalues: t_1 (ref), t_2 (ref), t_3 (ref), t_4 (ref), var12 (ref), var13 (ref)
	return if p6 == "Head" then t_1 elseif p6 == "UpperTorso" then t_2 elseif p6 == "LeftFoot" then t_3 elseif p6 == "RightFoot" then t_4 elseif p6 == "LeftHand" then var12 elseif p6 == "RightHand" then var13 else {}
end

return t