local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetAllInstancesIsAModule = require(Parent.util.getAllInstancesIsA)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local GetEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule = require(Parent.flags.getEngineFeatureEngineUGCValidateInstanceTreesEquivalent)
local ShouldValidateR15LegacyDuplicateModule = require(Parent.util.shouldValidateR15LegacyDuplicate)
local UGCValidationRemoveHRDBlocker = game:DefineFastFlag("UGCValidationRemoveHRDBlocker", false)

local function fillBoneTreeFlatList(Bone, p1, List) --[[ Line: 23 ]]
	-- upvalues: fillBoneTreeFlatList (copy)
	for _, Bone1 in Bone:GetChildren() do
		local v1 = if Bone1:IsA("Bone") then true else p1
		
		if v1 then
			table.insert(List, Bone1)
		end
		fillBoneTreeFlatList(Bone1, v1, List)
	end
end

local function nameIsMappedInRigDescriptions(p2, HumanoidRigDescription, DigitsRigDescription): boolean --[[ Line: 38 ]]
	-- upvalues: R15plusUtilsModule (copy)
	for _, value in R15plusUtilsModule.getHrdJointLabels() do
		if p2.Name == value.Name then
			local Joint = HumanoidRigDescription:GetJoint(value)
			
			return Joint and Joint.UniqueId == p2.UniqueId
		end
	end
	if DigitsRigDescription then
		for _, value1 in R15plusUtilsModule.getDrdJointLabels() do
			if p2.Name == `{DigitsRigDescription.Side.Name}Hand{value1.Name}` then
				local Joint = DigitsRigDescription:GetJoint(value1)
				
				return Joint and Joint.UniqueId == p2.UniqueId
			end
		end
	end
	return false
end

local function validateBonesForRoot(R15LegacyDuplicateRoot, p3) --[[ Line: 64 ]]
	-- upvalues: GetAllInstancesIsAModule (copy), UGCValidationRemoveHRDBlocker (copy), ErrorSourceStringsModule (copy), R15plusUtilsModule (copy), fillBoneTreeFlatList (copy), nameIsMappedInRigDescriptions (copy)
	for _, Object in GetAllInstancesIsAModule(R15LegacyDuplicateRoot, "MeshPart") do
		local Name = Object.Name
		local HumanoidRigDescription = Object:FindFirstChildWhichIsA("HumanoidRigDescription")
		local DigitsRigDescription = Object:FindFirstChildWhichIsA("DigitsRigDescription")
		
		if HumanoidRigDescription ~= nil and not UGCValidationRemoveHRDBlocker then
			p3:fail(ErrorSourceStringsModule.Keys.HrdCheck_TempR15BonesUploadNotAllowed, nil, HumanoidRigDescription)
		end
		if HumanoidRigDescription == nil then
			for _, value in GetAllInstancesIsAModule(Object, "Bone") do
				p3:fail(ErrorSourceStringsModule.Keys.HrdCheck_BoneWithoutHrd, { bonePath = value:GetFullName() }, value)
			end
			if DigitsRigDescription ~= nil then
				p3:fail(ErrorSourceStringsModule.Keys.HrdCheck_DrdWithoutHrd, nil, DigitsRigDescription)
			end
		else
			local SchemaFlatHierarchyList = R15plusUtilsModule.getSchemaFlatHierarchyList(R15plusUtilsModule.getAvatarBoneSchema(Name), { Name })
			local t = {}
			fillBoneTreeFlatList(Object, false, t)
			local config = { [Name] = true }
			
			for _, value1 in t do
				p3:setReportingInstance(value1)
				local Name1 = value1.Name
				local SchemaFlatHierarchy = SchemaFlatHierarchyList[Name1]
				
				if Name1 ~= R15plusUtilsModule.JointRotationName then
					if SchemaFlatHierarchy == nil or SchemaFlatHierarchy.ClassName ~= value1.ClassName then
						p3:fail(ErrorSourceStringsModule.Keys.HrdCheck_UndefinedInstanceInBoneTree, { instName = Name1, className = value1.ClassName })
					elseif config[Name1] then
						p3:fail(ErrorSourceStringsModule.Keys.HrdCheck_DuplicateInstance, { instName = Name1 })
					else
						config[Name1] = true
						
						if SchemaFlatHierarchy.ClassName == "Bone" and not nameIsMappedInRigDescriptions(value1, HumanoidRigDescription, DigitsRigDescription) then
							p3:fail(ErrorSourceStringsModule.Keys.HrdCheck_BoneNotMappedInHRD, { boneName = Name1 })
						end
					end
				end
			end
			for _, Attachment in Object:GetDescendants() do
				p3:setReportingInstance(Attachment)
				local SchemaFlatHierarchy = SchemaFlatHierarchyList[Attachment.Name]
				
				if SchemaFlatHierarchy and Attachment:IsA("Attachment") and Attachment.Name ~= R15plusUtilsModule.JointRotationName then
					local Path = SchemaFlatHierarchy.path
					local Count = #Path - 1
					
					if Attachment.ClassName == "Attachment" then
						while Count > 1 and not config[Path[Count]] do
							Count -= 1
						end
					end
					local PathEntry = SchemaFlatHierarchy.path[Count]
					local Name2 = Attachment.Parent.Name
					
					if Name2 ~= PathEntry then
						p3:fail(ErrorSourceStringsModule.Keys.HrdCheck_ImproperParent, {
							instName = Attachment.Name,
							parentName = Name2,
							expectedParentName = PathEntry
						})
					end
				end
			end
		end
	end
end

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.uploadEnum,
		ValidationEnumsModule.SharedDataMember.consumerConfig
	},
	fflag = R15plusUtilsModule.checkFlagEnabledForAllowHrd,
	run = function(p4, p5) --[[ Line: 159 ]]
		-- upvalues: validateBonesForRoot (copy), GetEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule (copy), ShouldValidateR15LegacyDuplicateModule (copy), ErrorSourceStringsModule (copy)
		validateBonesForRoot(p5.rootInstance, p4)
		
		if GetEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule() and ShouldValidateR15LegacyDuplicateModule(p5) then
			if p5.r15LegacyDuplicateRoot == nil then
				p4:fail(ErrorSourceStringsModule.Keys.FolderStructureMismatch)
				
				return
			end
			p4:setReportingRoot(p5.r15LegacyDuplicateRoot)
			validateBonesForRoot(p5.r15LegacyDuplicateRoot, p4)
			p4:setReportingRoot(p5.rootInstance)
		end
	end
}