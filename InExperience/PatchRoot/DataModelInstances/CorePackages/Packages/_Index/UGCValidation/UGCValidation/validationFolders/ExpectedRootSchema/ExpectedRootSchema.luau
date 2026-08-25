local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local constantsModule = require(parent.Constants)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local createExpectedSchemaModule = require(parent.util.CreateExpectedSchema)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule = require(parent.flags.getFFlagUGCValidationExtendSchemaToIgnoreDescendants)
local getFFlagUGCValidationAnimationPackSupportModule = require(parent.flags.getFFlagUGCValidationAnimationPackSupport)
local getFFlagUGCValidationAnimationPackFolderStructureModule = require(parent.flags.getFFlagUGCValidationAnimationPackFolderStructure)
local getFFlagUGCValidationAnimationPackDisableModelStructureModule = require(parent.flags.getFFlagUGCValidationAnimationPackDisableModelStructure)
local getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule = require(parent.flags.getEngineFeatureEngineUGCValidateInstanceTreesEquivalent)
local shouldValidateR15LegacyDuplicateModule = require(parent.util.shouldValidateR15LegacyDuplicate)
local t = {
	categories = constantsModule.AllUploadCategories,
	requiredData = {
		validationEnumsModule.SharedDataMember.entrypointInput,
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.uploadCategory,
		validationEnumsModule.SharedDataMember.uploadEnum,
		validationEnumsModule.SharedDataMember.consumerConfig
	}
}

local function _(p0, p1)
	return if type(p0) == "table" then table.find(p0, p1) ~= nil else p0 == p1
end

local _ = function(p2)
	return if type(p2) == "table" then table.concat(p2, " or ") elseif type(p2) == "string" then p2 else "*"
end

local function validateInstancesFromSchema(p3, p4, p5, p6)
	-- upvalues: getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule (ref), validateInstancesFromSchema (ref), errorSourceStringsModule (ref)
	p5[p3] = true
	
	if getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule() and p4._ignoreDescendants then
		assert(not p4._children, "if _ignoreDescendants is true, there should be no descendants in the schema as they would be ignored anyway")
		
		for i, v in p3:GetDescendants() do
			p5[v] = true
		end
		return
	else
		local var14
		for i, v in p4._children or {} do
			var14 = false
			
			for i_1, v_1 in p3:GetChildren() do
				if p5[v_1] == nil and v_1.ClassName == v.ClassName then
					if v.Name ~= nil then
						local var15
						local name = v.Name
						local name_1 = v_1.Name
						
						if type(name) == "table" then
							var15 = table.find(name, name_1) ~= nil
							var15 = nil
						else
							var15 = name == name_1
						end
						if var15 then
							validateInstancesFromSchema(v_1, v, p5, p6)
							var14 = true
							break
						end
					end
				end
			end
			if not var14 and not v._optional then
				local assetSchemaMissingItem = errorSourceStringsModule.Keys.AssetSchemaMissingItem
				i_1 = {
					ParentPath = p3:GetFullName(),
					ExpectedClass = v.ClassName
				}
				local name = v.Name
				i_1.ExpectedName = if type(name) == "table" then table.concat(name, " or ") elseif type(name) == "string" then name else "*"
				p6:fail(assetSchemaMissingItem, i_1, p3)
			end
		end
	end
end

local function validateNoInstancesOutsideSchema(p7, p8, p9)
	-- upvalues: errorSourceStringsModule (ref)
	local t = {}
	
	for i, v in pairs(p7:GetDescendants()) do
		if p8[v] == nil then
			table.insert(t, v:GetFullName())
		end
	end
	if #t > 0 then
		p9:fail(errorSourceStringsModule.Keys.AssetSchemaUnexpectedItems, { UnexpectedDescendantPaths = table.concat(t, ", ") }, p7)
	end
end

local function validateRootAgainstSchema(p10, p11, p12)
	-- upvalues: errorSourceStringsModule (ref), validateInstancesFromSchema (ref), validateNoInstancesOutsideSchema (ref)
	local t = {}
	
	if p11.ClassName ~= p10.ClassName then
		p12:fail(errorSourceStringsModule.Keys.AssetSchemaWrongRootClass, { RootClass = p10.ClassName, ExpectedClass = p11.ClassName })
		
		return
	elseif p11.Name ~= nil then
		local var18
		local name = p11.Name
		local name_1 = p10.Name
		
		if type(name) == "table" then
			var18 = table.find(name, name_1) ~= nil
			var18 = nil
		else
			var18 = name == name_1
		end
		if var18 then
			validateInstancesFromSchema(p10, p11, t, p12)
			validateNoInstancesOutsideSchema(p10, t, p12)
			
			return
		else
			p12:fail(errorSourceStringsModule.Keys.AssetSchemaWrongRootName, { RootName = p10.Name, ExpectedName = p11.Name })
		end
	end
end

function t.run(p13, p14)
	-- upvalues: errorSourceStringsModule (ref), getFFlagUGCValidationAnimationPackSupportModule (ref), getFFlagUGCValidationAnimationPackDisableModelStructureModule (ref), getFFlagUGCValidationAnimationPackFolderStructureModule (ref), createExpectedSchemaModule (ref), validateRootAgainstSchema (ref), getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule (ref), shouldValidateR15LegacyDuplicateModule (ref)
	local rootInstance = p14.rootInstance
	local uploadCategory = p14.uploadCategory
	local uploadEnum = p14.uploadEnum
	
	if rootInstance == nil then
		p13:fail(errorSourceStringsModule.Keys.SelectionCountNotOne)
		
		return
	end
	local _ = nil
	local var19 = if not uploadEnum.bundleType then if not getFFlagUGCValidationAnimationPackSupportModule() or uploadEnum.bundleType ~= Enum.BundleType.Animations then if getFFlagUGCValidationAnimationPackDisableModelStructureModule() or not getFFlagUGCValidationAnimationPackFolderStructureModule() then createExpectedSchemaModule.generateAnimationPackBundleSchema(nil) else createExpectedSchemaModule.generateAnimationPackBundleSchema(rootInstance) else createExpectedSchemaModule.generateBundleSchema(p14.entrypointInput) else createExpectedSchemaModule.generateAssetSchema(uploadCategory, uploadEnum.assetType, rootInstance)
	validateRootAgainstSchema(rootInstance, var19, p13)
	
	if getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule() and shouldValidateR15LegacyDuplicateModule(p14) then
		if p14.r15LegacyDuplicateRoot == nil then
			p13:fail(errorSourceStringsModule.Keys.FolderStructureMismatch)
			
			return
		end
		p13:setReportingRoot(p14.r15LegacyDuplicateRoot)
		validateRootAgainstSchema(p14.r15LegacyDuplicateRoot, var19, p13)
		p13:setReportingRoot(rootInstance)
	end
end

return t