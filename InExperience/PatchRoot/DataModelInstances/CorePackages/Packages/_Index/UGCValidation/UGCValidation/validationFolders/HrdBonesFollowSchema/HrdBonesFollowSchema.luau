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

local function fillBoneTreeFlatList(p0, p1, p2) --[[ line: 23 ]]
	-- upvalues: fillBoneTreeFlatList (ref)
	for i, v in p0:GetChildren() do
		local var11 = if v:IsA("Bone") then true else p1
		
		if var11 then
			table.insert(p2, v)
		end
		fillBoneTreeFlatList(v, var11, p2)
	end
end

local function nameIsMappedInRigDescriptions(p3, p4, p5) --[[ line: 38 ]]
	-- upvalues: r15plusUtilsModule (ref)
	for i, v in r15plusUtilsModule.getHrdJointLabels() do
		if p3.Name == v.Name then
			local var13 = p4:GetJoint(v)
			
			return var13 and var13.UniqueId == p3.UniqueId
		end
	end
	if p5 then
		for i, v in r15plusUtilsModule.getDrdJointLabels() do
			if p3.Name == `{p5.Side.Name}Hand{v.Name}` then
				local var12 = p5:GetJoint(v)
				
				return var12 and var12.UniqueId == p3.UniqueId
			end
		end
	end
	return false
end

local function validateBonesForRoot(p6, p7) --[[ line: 64 ]]
	-- upvalues: getAllInstancesIsAModule (ref), UGCValidationRemoveHRDBlocker (ref), errorSourceStringsModule (ref), r15plusUtilsModule (ref), fillBoneTreeFlatList (ref), nameIsMappedInRigDescriptions (ref)
	for i, v in getAllInstancesIsAModule(p6, "MeshPart") do
		local name = v.Name
		local humanoidRigDescription = v:FindFirstChildWhichIsA("HumanoidRigDescription")
		local digitsRigDescription = v:FindFirstChildWhichIsA("DigitsRigDescription")
		
		if humanoidRigDescription ~= nil and not UGCValidationRemoveHRDBlocker then
			p7:fail(errorSourceStringsModule.Keys.HrdCheck_TempR15BonesUploadNotAllowed, nil, humanoidRigDescription)
		end
		if humanoidRigDescription == nil then
			for i_1, v_1 in getAllInstancesIsAModule(v, "Bone") do
				p7:fail(errorSourceStringsModule.Keys.HrdCheck_BoneWithoutHrd, { bonePath = v_1:GetFullName() }, v_1)
			end
			if digitsRigDescription ~= nil then
				p7:fail(errorSourceStringsModule.Keys.HrdCheck_DrdWithoutHrd, nil, digitsRigDescription)
			end
		end
		local path
		local schemaFlatHierarchyList = r15plusUtilsModule.getSchemaFlatHierarchyList(r15plusUtilsModule.getAvatarBoneSchema(name), { name })
		local t = {}
		fillBoneTreeFlatList(v, false, t)
		local t_1 = { [name] = true }
		
		for i_1, v_1 in t do
			p7:setReportingInstance(v_1)
			local name_1 = v_1.Name
			path = schemaFlatHierarchyList[name_1]
			
			if name_1 ~= r15plusUtilsModule.JointRotationName then
				if path == nil or path.ClassName ~= v_1.ClassName then
					p7:fail(errorSourceStringsModule.Keys.HrdCheck_UndefinedInstanceInBoneTree, { instName = name_1, className = v_1.ClassName })
				elseif t_1[name_1] then
					p7:fail(errorSourceStringsModule.Keys.HrdCheck_DuplicateInstance, { instName = name_1 })
				else
					t_1[name_1] = true
					
					if path.ClassName == "Bone" and not nameIsMappedInRigDescriptions(v_1, humanoidRigDescription, digitsRigDescription) then
						p7:fail(errorSourceStringsModule.Keys.HrdCheck_BoneNotMappedInHRD, { boneName = name_1 })
					end
				end
			end
		end
		for i_1, v_1 in v:GetDescendants() do
			p7:setReportingInstance(v_1)
			local name_1 = schemaFlatHierarchyList[v_1.Name]
			
			if name_1 and v_1:IsA("Attachment") and v_1.Name ~= r15plusUtilsModule.JointRotationName then
				path = name_1.path
				local var19 = #path - 1
				
				if v_1.ClassName == "Attachment" then
					while var19 > 1 and not t_1[path[var19]] do
						var19 -= 1
					end
				end
				local var20 = name_1.path[var19]
				local name_2 = v_1.Parent.Name
				
				if name_2 ~= var20 then
					p7:fail(errorSourceStringsModule.Keys.HrdCheck_ImproperParent, {
						instName = v_1.Name,
						parentName = name_2,
						expectedParentName = var20
					})
				end
			end
		end
	end
end

function t.run(p8, p9) --[[ line: 159 ]]
	-- upvalues: validateBonesForRoot (ref), getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule (ref), shouldValidateR15LegacyDuplicateModule (ref), errorSourceStringsModule (ref)
	validateBonesForRoot(p9.rootInstance, p8)
	
	if getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule() and shouldValidateR15LegacyDuplicateModule(p9) then
		if p9.r15LegacyDuplicateRoot == nil then
			p8:fail(errorSourceStringsModule.Keys.FolderStructureMismatch)
			
			return
		end
		p8:setReportingRoot(p9.r15LegacyDuplicateRoot)
		validateBonesForRoot(p9.r15LegacyDuplicateRoot, p8)
		p8:setReportingRoot(p9.rootInstance)
	end
end

return t