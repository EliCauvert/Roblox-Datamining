local AvatarCreationService = game:GetService("AvatarCreationService")
local ValidationRulesUtil = {
	rigAttachmentToParentMap = {
		Head = "NeckRigAttachment",
		UpperTorso = "WaistRigAttachment",
		LowerTorso = "RootRigAttachment",
		RightHand = "RightWristRigAttachment",
		RightLowerArm = "RightElbowRigAttachment",
		RightUpperArm = "RightShoulderRigAttachment",
		LeftHand = "LeftWristRigAttachment",
		LeftLowerArm = "LeftElbowRigAttachment",
		LeftUpperArm = "LeftShoulderRigAttachment",
		RightFoot = "RightAnkleRigAttachment",
		RightLowerLeg = "RightKneeRigAttachment",
		RightUpperLeg = "RightHipRigAttachment",
		LeftFoot = "LeftAnkleRigAttachment",
		LeftLowerLeg = "LeftKneeRigAttachment",
		LeftUpperLeg = "LeftHipRigAttachment"
	},
	getRules = function(p1)
		-- upvalues: AvatarCreationService (copy)
		if not p1.rules then
			p1.rules = AvatarCreationService:GetValidationRules()
		end
		return p1.rules
	end,
	getBodyPartMaxTrianglesRule = function(p1, p2)
		return p1:getRules().MeshRules.BodyPartMaxTriangles[p2]
	end,
	getMakeupRules = function(p1)
		local MakeupRules = p1:getRules().MakeupRules
		local t = {}
		
		for i, makeupRule in MakeupRules do
			if i ~= "ExcludeUVBounds" and i ~= "IncludeUVBounds" then
				t[i] = makeupRule
			end
		end
		local AssetUVBounds = {}
		
		for i1, excludeUVBound in MakeupRules.ExcludeUVBounds do
			if not AssetUVBounds[i1] then
				AssetUVBounds[i1] = {}
			end
			for _, value in excludeUVBound do
				table.insert(AssetUVBounds[i1], {
					isIncludeBound = false,
					MinBound = value.MinBound,
					MaxBound = value.MaxBound
				})
			end
		end
		for i2, includeUVBound in MakeupRules.IncludeUVBounds do
			if not AssetUVBounds[i2] then
				AssetUVBounds[i2] = {}
			end
			table.insert(AssetUVBounds[i2], {
				isIncludeBound = true,
				MinBound = includeUVBound.MinBound,
				MaxBound = includeUVBound.MaxBound
			})
		end
		t.AssetUVBounds = AssetUVBounds
		
		return t
	end,
	getAccessoryRules = function(p2, p3)
		for i, accessoryRule in p2:getRules().AccessoryRules do
			local config = {
				rigidAllowed = accessoryRule.RigidAllowed,
				attachmentNames = {},
				bounds = {}
			}
			
			for _, attachment in accessoryRule.Attachments do
				table.insert(config.attachmentNames, attachment.Name)
				config.bounds[attachment.Name] = { size = attachment.Size, offset = attachment.Offset }
			end
			p3[i] = config
		end
	end
}

function ValidationRulesUtil.getBodyPartRules(p4, p5)
	-- upvalues: ValidationRulesUtil (copy)
	for i, bodyPartRule in p4:getRules().BodyPartRules do
		local config = { isBodyPart = true, bounds = {}, subParts = {} }
		
		for i1, bound in bodyPartRule.Bounds do
			config.bounds[i1] = { minSize = bound.MinSize, maxSize = bound.MaxSize }
		end
		for i2, subPart in bodyPartRule.SubParts do
			local config1 = { rigAttachmentToParent = {}, otherAttachments = {} }
			local RigAttachmentToParent = ValidationRulesUtil.rigAttachmentToParentMap[i2]
			
			for Name, value in subPart do
				if RigAttachmentToParent == Name then
					config1.rigAttachmentToParent = {
						name = Name,
						bounds = { min = value.LowerBound, max = value.UpperBound }
					}
				else
					config1.otherAttachments[Name] = {
						bounds = { min = value.LowerBound, max = value.UpperBound }
					}
				end
			end
			config.subParts[i2] = config1
		end
		p5[i] = config
	end
end

function ValidationRulesUtil.getFullBodyRulesBounds(p6)
	local t = {}
	
	for i, bound in p6:getRules().FullBodyRules.Bounds do
		t[i] = { minSize = bound.MinSize, maxSize = bound.MaxSize }
	end
	return t
end

function ValidationRulesUtil:getLCSizeLimit(p7, Object)
	-- upvalues: ValidationRulesUtil (copy)
	for _, attachment in ValidationRulesUtil:getRules().AccessoryRules[p7].Attachments do
		if Object:FindFirstChild(attachment.Name) then
			return true, attachment.Size
		end
	end
	return false, nil
end

return ValidationRulesUtil