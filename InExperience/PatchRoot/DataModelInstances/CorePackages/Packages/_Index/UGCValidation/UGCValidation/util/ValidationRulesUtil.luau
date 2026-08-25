local avatarCreationService = game:GetService("AvatarCreationService")
local t = {
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
	getRules = function(p0)
		-- upvalues: avatarCreationService (ref)
		if not p0.rules then
			p0.rules = avatarCreationService:GetValidationRules()
		end
		return p0.rules
	end,
	getBodyPartMaxTrianglesRule = function(a, b)
		return a:getRules().MeshRules.BodyPartMaxTriangles[b]
	end,
	getMakeupRules = function(p1)
		local makeupRules = p1:getRules().MakeupRules
		local t = {}
		
		for i, v in makeupRules do
			if i ~= "ExcludeUVBounds" and i ~= "IncludeUVBounds" then
				t[i] = v
			end
		end
		local t_1 = {}
		
		for i_1, v_1 in makeupRules.ExcludeUVBounds do
			if not t_1[i_1] then
				t_1[i_1] = {}
			end
			for i_2, v_2 in v_1 do
				table.insert(t_1[i_1], {
					isIncludeBound = false,
					MinBound = v_2.MinBound,
					MaxBound = v_2.MaxBound
				})
			end
		end
		for i_2, v_2 in makeupRules.IncludeUVBounds do
			if not t_1[i_2] then
				t_1[i_2] = {}
			end
			table.insert(t_1[i_2], {
				isIncludeBound = true,
				MinBound = v_2.MinBound,
				MaxBound = v_2.MaxBound
			})
		end
		t.AssetUVBounds = t_1
		
		return t
	end,
	getAccessoryRules = function(p2, p3)
		for i, v in p2:getRules().AccessoryRules do
			local t = {
				rigidAllowed = v.RigidAllowed,
				attachmentNames = {},
				bounds = {}
			}
			
			for i_1, v_1 in v.Attachments do
				table.insert(t.attachmentNames, v_1.Name)
				t.bounds[v_1.Name] = { size = v_1.Size, offset = v_1.Offset }
			end
			p3[i] = t
		end
	end
}

function t.getBodyPartRules(p4, p5)
	-- upvalues: t (ref)
	for i, v in p4:getRules().BodyPartRules do
		local t_1 = { isBodyPart = true, bounds = {}, subParts = {} }
		
		for i_1, v_1 in v.Bounds do
			t_1.bounds[i_1] = { minSize = v_1.MinSize, maxSize = v_1.MaxSize }
		end
		for i_1, v_1 in v.SubParts do
			local t_2 = { rigAttachmentToParent = {}, otherAttachments = {} }
			local var7 = t.rigAttachmentToParentMap[i_1]
			
			for i_3, v_3 in v_1 do
				if var7 == i_3 then
					t_2.rigAttachmentToParent = {
						name = i_3,
						bounds = { min = v_3.LowerBound, max = v_3.UpperBound }
					}
				else
					t_2.otherAttachments[i_3] = { bounds = { min = v_3.LowerBound, max = v_3.UpperBound } }
				end
			end
			t_1.subParts[i_1] = t_2
		end
		p5[i] = t_1
	end
end

function t.getFullBodyRulesBounds(p6)
	local t = {}
	
	for i, v in p6:getRules().FullBodyRules.Bounds do
		t[i] = { minSize = v.MinSize, maxSize = v.MaxSize }
	end
	return t
end

function t.getLCSizeLimit(_, p7, p8)
	-- upvalues: t (ref)
	for i, v in t:getRules().AccessoryRules[p7].Attachments do
		if p8:FindFirstChild(v.Name) then
			return true, v.Size
		end
	end
	return false, nil
end

return t