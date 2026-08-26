local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getAllInstancesIsAModule = require(parent.util.getAllInstancesIsA)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule = require(parent.flags.getEngineFeatureEngineUGCValidateInstanceTreesEquivalent)
local shouldValidateR15LegacyDuplicateModule = require(parent.util.shouldValidateR15LegacyDuplicate)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.uploadEnum,
		validationEnumsModule.SharedDataMember.consumerConfig
	},
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

local function nameIsMappedInRigDescriptions(p4, p5, p6)
	-- upvalues: r15plusUtilsModule (ref)
	for i, v in r15plusUtilsModule.getHrdJointLabels() do
		if p4.Name == v.Name then
			local var2 = p5:GetJoint(v)
			
			return var2 and var2.UniqueId == p4.UniqueId
		end
	end
	if p6 then
		for i, v in r15plusUtilsModule.getDrdJointLabels() do
			if p4.Name == `{p6.Side.Name}Hand{v.Name}` then
				local var3 = p6:GetJoint(v)
				
				return var3 and var3.UniqueId == p4.UniqueId
			end
		end
	end
	return false
end

local function validateBonesForRoot(p7, p8)
	-- upvalues: getAllInstancesIsAModule (ref), UGCValidationRemoveHRDBlocker (ref), errorSourceStringsModule (ref), r15plusUtilsModule (ref), fillBoneTreeFlatList (ref), nameIsMappedInRigDescriptions (ref)
	for i, v in getAllInstancesIsAModule(p7, "MeshPart") do
		local name = v.Name
		local humanoidRigDescription = v:FindFirstChildWhichIsA("HumanoidRigDescription")
		local digitsRigDescription = v:FindFirstChildWhichIsA("DigitsRigDescription")
		
		if humanoidRigDescription ~= nil and not UGCValidationRemoveHRDBlocker then
			p8:fail(errorSourceStringsModule.Keys.HrdCheck_TempR15BonesUploadNotAllowed, nil, humanoidRigDescription)
		end
		if humanoidRigDescription == nil then
			for i_1, v_1 in getAllInstancesIsAModule(v, "Bone") do
				p8:fail(errorSourceStringsModule.Keys.HrdCheck_BoneWithoutHrd, { bonePath = v_1:GetFullName() }, v_1)
			end
			if digitsRigDescription ~= nil then
				p8:fail(errorSourceStringsModule.Keys.HrdCheck_DrdWithoutHrd, nil, digitsRigDescription)
			end
		end
		local path
		local schemaFlatHierarchyList = r15plusUtilsModule.getSchemaFlatHierarchyList(r15plusUtilsModule.getAvatarBoneSchema(name), { name })
		local t = {}
		fillBoneTreeFlatList(v, false, t)
		local t_1 = { [name] = true }
		
		for i_1, v_1 in t do
			p8:setReportingInstance(v_1)
			local name_1 = v_1.Name
			path = schemaFlatHierarchyList[name_1]
			
			if name_1 ~= r15plusUtilsModule.JointRotationName then
				if path == nil or path.ClassName ~= v_1.ClassName then
					p8:fail(errorSourceStringsModule.Keys.HrdCheck_UndefinedInstanceInBoneTree, { instName = name_1, className = v_1.ClassName })
				elseif t_1[name_1] then
					p8:fail(errorSourceStringsModule.Keys.HrdCheck_DuplicateInstance, { instName = name_1 })
				else
					t_1[name_1] = true
					
					if path.ClassName == "Bone" and not nameIsMappedInRigDescriptions(v_1, humanoidRigDescription, digitsRigDescription) then
						p8:fail(errorSourceStringsModule.Keys.HrdCheck_BoneNotMappedInHRD, { boneName = name_1 })
					end
				end
			end
		end
		for i_1, v_1 in v:GetDescendants() do
			p8:setReportingInstance(v_1)
			local name_1 = schemaFlatHierarchyList[v_1.Name]
			
			if name_1 and v_1:IsA("Attachment") and v_1.Name ~= r15plusUtilsModule.JointRotationName then
				path = name_1.path
				local var4 = #path - 1
				
				if v_1.ClassName == "Attachment" then
					while var4 > 1 and not t_1[path[var4]] do
						var4 -= 1
					end
				end
				local var5 = name_1.path[var4]
				local name_2 = v_1.Parent.Name
				
				if name_2 ~= var5 then
					p8:fail(errorSourceStringsModule.Keys.HrdCheck_ImproperParent, {
						instName = v_1.Name,
						parentName = name_2,
						expectedParentName = var5
					})
				end
			end
		end
	end
end

function t.run(p9, p10)
	-- upvalues: validateBonesForRoot (ref), getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule (ref), shouldValidateR15LegacyDuplicateModule (ref), errorSourceStringsModule (ref)
	validateBonesForRoot(p10.rootInstance, p9)
	
	if getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule() and shouldValidateR15LegacyDuplicateModule(p10) then
		if p10.r15LegacyDuplicateRoot == nil then
			p9:fail(errorSourceStringsModule.Keys.FolderStructureMismatch)
			
			return
		end
		p9:setReportingRoot(p10.r15LegacyDuplicateRoot)
		validateBonesForRoot(p10.r15LegacyDuplicateRoot, p9)
		p9:setReportingRoot(p10.rootInstance)
	end
end

return t