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

local function fillBoneTreeFlatList(p1, p2, p3)
	-- upvalues: fillBoneTreeFlatList (ref)
	for i, v in p1:GetChildren() do
		local var1 = if v:IsA("Bone") then true else p2
		
		if var1 then
			table.insert(p3, v)
		end
		fillBoneTreeFlatList(v, var1, p3)
	end
end

local function nameIsMappedInRigDescriptions(p1, p2, p3)
	-- upvalues: r15plusUtilsModule (ref)
	for i, v in r15plusUtilsModule.getHrdJointLabels() do
		if p1.Name == v.Name then
			local var1 = p2:GetJoint(v)
			
			return var1 and var1.UniqueId == p1.UniqueId
		end
	end
	if p3 then
		for i, v in r15plusUtilsModule.getDrdJointLabels() do
			if p1.Name == `{p3.Side.Name}Hand{v.Name}` then
				local var2 = p3:GetJoint(v)
				
				return var2 and var2.UniqueId == p1.UniqueId
			end
		end
	end
	return false
end

function t.run(p1, p2)
	-- upvalues: getAllInstancesIsAModule (ref), UGCValidationRemoveHRDBlocker (ref), errorSourceStringsModule (ref), r15plusUtilsModule (ref), fillBoneTreeFlatList (ref), nameIsMappedInRigDescriptions (ref)
	for i, v in getAllInstancesIsAModule(p2.rootInstance, "MeshPart") do
		local name = v.Name
		local humanoidRigDescription = v:FindFirstChildWhichIsA("HumanoidRigDescription")
		local digitsRigDescription = v:FindFirstChildWhichIsA("DigitsRigDescription")
		
		if humanoidRigDescription ~= nil and not UGCValidationRemoveHRDBlocker then
			p1:fail(errorSourceStringsModule.Keys.HrdCheck_TempR15BonesUploadNotAllowed, nil, humanoidRigDescription)
		end
		if humanoidRigDescription == nil then
			for i_1, v_1 in getAllInstancesIsAModule(v, "Bone") do
				p1:fail(errorSourceStringsModule.Keys.HrdCheck_BoneWithoutHrd, { bonePath = v_1:GetFullName() }, v_1)
			end
			if digitsRigDescription ~= nil then
				p1:fail(errorSourceStringsModule.Keys.HrdCheck_DrdWithoutHrd, nil, digitsRigDescription)
			end
		end
		local path
		local schemaFlatHierarchyList = r15plusUtilsModule.getSchemaFlatHierarchyList(r15plusUtilsModule.getAvatarBoneSchema(name), { name })
		local t = {}
		fillBoneTreeFlatList(v, false, t)
		local t_1 = { [name] = true }
		
		for i_1, v_1 in t do
			p1:setReportingInstance(v_1)
			local name_1 = v_1.Name
			path = schemaFlatHierarchyList[name_1]
			
			if name_1 ~= r15plusUtilsModule.JointRotationName then
				if path == nil or path.ClassName ~= v_1.ClassName then
					p1:fail(errorSourceStringsModule.Keys.HrdCheck_UndefinedInstanceInBoneTree, { instName = name_1, className = v_1.ClassName })
				elseif t_1[name_1] then
					p1:fail(errorSourceStringsModule.Keys.HrdCheck_DuplicateInstance, { instName = name_1 })
				else
					t_1[name_1] = true
					
					if path.ClassName == "Bone" and not nameIsMappedInRigDescriptions(v_1, humanoidRigDescription, digitsRigDescription) then
						p1:fail(errorSourceStringsModule.Keys.HrdCheck_BoneNotMappedInHRD, { boneName = name_1 })
					end
				end
			end
		end
		for i_1, v_1 in v:GetDescendants() do
			p1:setReportingInstance(v_1)
			local name_1 = schemaFlatHierarchyList[v_1.Name]
			
			if name_1 and v_1:IsA("Attachment") and v_1.Name ~= r15plusUtilsModule.JointRotationName then
				path = name_1.path
				local var1 = #path - 1
				
				if v_1.ClassName == "Attachment" then
					while var1 > 1 and not t_1[path[var1]] do
						var1 -= 1
					end
				end
				local var2 = name_1.path[var1]
				local name_2 = v_1.Parent.Name
				
				if name_2 ~= var2 then
					p1:fail(errorSourceStringsModule.Keys.HrdCheck_ImproperParent, {
						instName = v_1.Name,
						parentName = name_2,
						expectedParentName = var2
					})
				end
			end
		end
	end
end

return t