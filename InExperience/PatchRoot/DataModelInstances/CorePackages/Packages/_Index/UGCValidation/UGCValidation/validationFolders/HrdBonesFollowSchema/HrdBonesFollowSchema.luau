local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getAllInstancesIsAModule = require(parent.util.getAllInstancesIsA)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { validationEnumsModule.SharedDataMember.rootInstance },
	fflag = r15plusUtilsModule.checkFlagEnabledForAllowHrd
}
local UGCValidationRemoveHRDBlocker = game:DefineFastFlag("UGCValidationRemoveHRDBlocker", false)

local function fillBoneTreeFlatList(p0, p1, p2)
	-- upvalues: fillBoneTreeFlatList (ref)
	for i, v in p0:GetChildren() do
		local var8 = if v:IsA("Bone") then true else p1
		
		if var8 then
			table.insert(p2, v)
		end
		fillBoneTreeFlatList(v, var8, p2)
	end
end

local function nameIsMappedInRigDescriptions(p3, p4, p5)
	-- upvalues: r15plusUtilsModule (ref)
	for i, v in r15plusUtilsModule.getHrdJointLabels() do
		if p3.Name == v.Name then
			local var10 = p4:GetJoint(v)
			
			return var10 and var10.UniqueId == p3.UniqueId
		end
	end
	if p5 then
		for i, v in r15plusUtilsModule.getDrdJointLabels() do
			if p3.Name == `{p5.Side.Name}Hand{v.Name}` then
				local var9 = p5:GetJoint(v)
				
				return var9 and var9.UniqueId == p3.UniqueId
			end
		end
	end
	return false
end

function t.run(p6, p7)
	-- upvalues: getAllInstancesIsAModule (ref), UGCValidationRemoveHRDBlocker (ref), errorSourceStringsModule (ref), r15plusUtilsModule (ref), fillBoneTreeFlatList (ref), nameIsMappedInRigDescriptions (ref)
	for i, v in getAllInstancesIsAModule(p7.rootInstance, "MeshPart") do
		local name = v.Name
		local humanoidRigDescription = v:FindFirstChildWhichIsA("HumanoidRigDescription")
		local digitsRigDescription = v:FindFirstChildWhichIsA("DigitsRigDescription")
		
		if humanoidRigDescription ~= nil and not UGCValidationRemoveHRDBlocker then
			p6:fail(errorSourceStringsModule.Keys.HrdCheck_TempR15BonesUploadNotAllowed, nil, humanoidRigDescription)
		end
		if humanoidRigDescription == nil then
			for i_1, v_1 in getAllInstancesIsAModule(v, "Bone") do
				p6:fail(errorSourceStringsModule.Keys.HrdCheck_BoneWithoutHrd, { bonePath = v_1:GetFullName() }, v_1)
			end
			if digitsRigDescription ~= nil then
				p6:fail(errorSourceStringsModule.Keys.HrdCheck_DrdWithoutHrd, nil, digitsRigDescription)
			end
		end
		local path
		local schemaFlatHierarchyList = r15plusUtilsModule.getSchemaFlatHierarchyList(r15plusUtilsModule.getAvatarBoneSchema(name), { name })
		local t = {}
		fillBoneTreeFlatList(v, false, t)
		local t_1 = { [name] = true }
		
		for i_1, v_1 in t do
			p6:setReportingInstance(v_1)
			local name_1 = v_1.Name
			path = schemaFlatHierarchyList[name_1]
			
			if name_1 ~= r15plusUtilsModule.JointRotationName then
				if path == nil or path.ClassName ~= v_1.ClassName then
					p6:fail(errorSourceStringsModule.Keys.HrdCheck_UndefinedInstanceInBoneTree, { instName = name_1, className = v_1.ClassName })
				elseif t_1[name_1] then
					p6:fail(errorSourceStringsModule.Keys.HrdCheck_DuplicateInstance, { instName = name_1 })
				else
					t_1[name_1] = true
					
					if path.ClassName == "Bone" and not nameIsMappedInRigDescriptions(v_1, humanoidRigDescription, digitsRigDescription) then
						p6:fail(errorSourceStringsModule.Keys.HrdCheck_BoneNotMappedInHRD, { boneName = name_1 })
					end
				end
			end
		end
		for i_1, v_1 in v:GetDescendants() do
			p6:setReportingInstance(v_1)
			local name_1 = schemaFlatHierarchyList[v_1.Name]
			
			if name_1 and v_1:IsA("Attachment") and v_1.Name ~= r15plusUtilsModule.JointRotationName then
				path = name_1.path
				local var16 = #path - 1
				
				if v_1.ClassName == "Attachment" then
					while var16 > 1 and not t_1[path[var16]] do
						var16 -= 1
					end
				end
				local var17 = name_1.path[var16]
				local name_2 = v_1.Parent.Name
				
				if name_2 ~= var17 then
					p6:fail(errorSourceStringsModule.Keys.HrdCheck_ImproperParent, {
						instName = v_1.Name,
						parentName = name_2,
						expectedParentName = var17
					})
				end
			end
		end
	end
end

return t