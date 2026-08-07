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
local t = {
	categories = constantsModule.AllUploadCategories,
	requiredData = {
		validationEnumsModule.SharedDataMember.entrypointInput,
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.uploadCategory,
		validationEnumsModule.SharedDataMember.uploadEnum
	}
}

local function _(p0, p1) --[[ line: 25 | named "checkName" ]]
	return if type(p0) == "table" then table.find(p0, p1) ~= nil else p0 == p1
end

local _ = function(p2) --[[ line: 32 | named "getReadableName" ]]
	return if type(p2) == "table" then table.concat(p2, " or ") elseif type(p2) == "string" then p2 else "*"
end

local function validateInstancesFromSchema(p3, p4, p5, p6) --[[ line: 41 ]]
	-- upvalues: getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule (ref), validateInstancesFromSchema (ref), errorSourceStringsModule (ref)
	p5[p3] = true
	
	if getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule() and p4._ignoreDescendants then
		assert(not p4._children, "if _ignoreDescendants is true, there should be no descendants in the schema as they would be ignored anyway")
		
		for i, v in p3:GetDescendants() do
			p5[v] = true
		end
		return
	else
		local var11
		for i, v in p4._children or {} do
			var11 = false
			
			for i_1, v_1 in p3:GetChildren() do
				if p5[v_1] == nil and v_1.ClassName == v.ClassName then
					if v.Name ~= nil then
						local var12
						local name = v.Name
						local name_1 = v_1.Name
						
						if type(name) == "table" then
							var12 = table.find(name, name_1) ~= nil
							var12 = nil
						else
							var12 = name == name_1
						end
						if var12 then
							validateInstancesFromSchema(v_1, v, p5, p6)
							var11 = true
							break
						end
					end
				end
			end
			if not var11 and not v._optional then
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

local function validateNoInstancesOutsideSchema(p7, p8, p9) --[[ line: 86 ]]
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

function t.run(p10, p11) --[[ line: 107 ]]
	-- upvalues: errorSourceStringsModule (ref), getFFlagUGCValidationAnimationPackSupportModule (ref), getFFlagUGCValidationAnimationPackDisableModelStructureModule (ref), getFFlagUGCValidationAnimationPackFolderStructureModule (ref), createExpectedSchemaModule (ref), validateInstancesFromSchema (ref), validateNoInstancesOutsideSchema (ref)
	local rootInstance = p11.rootInstance
	local uploadCategory = p11.uploadCategory
	local uploadEnum = p11.uploadEnum
	
	if rootInstance == nil then
		p10:fail(errorSourceStringsModule.Keys.SelectionCountNotOne)
		
		return
	end
	local _ = nil
	local var14 = if not uploadEnum.bundleType then if not getFFlagUGCValidationAnimationPackSupportModule() or uploadEnum.bundleType ~= Enum.BundleType.Animations then if getFFlagUGCValidationAnimationPackDisableModelStructureModule() or not getFFlagUGCValidationAnimationPackFolderStructureModule() then createExpectedSchemaModule.generateAnimationPackBundleSchema(nil) else createExpectedSchemaModule.generateAnimationPackBundleSchema(rootInstance) else createExpectedSchemaModule.generateBundleSchema(p11.entrypointInput) else createExpectedSchemaModule.generateAssetSchema(uploadCategory, uploadEnum.assetType, rootInstance)
	local t = {}
	
	if var14.ClassName ~= rootInstance.ClassName then
		p10:fail(errorSourceStringsModule.Keys.AssetSchemaWrongRootClass, {
			RootClass = rootInstance.ClassName,
			ExpectedClass = var14.ClassName
		})
		
		return
	elseif var14.Name ~= nil then
		local var16
		local name = var14.Name
		local name_1 = rootInstance.Name
		
		if type(name) == "table" then
			var16 = table.find(name, name_1) ~= nil
			var16 = nil
		else
			var16 = name == name_1
		end
		if var16 then
			validateInstancesFromSchema(rootInstance, var14, t, p10)
			validateNoInstancesOutsideSchema(rootInstance, t, p10)
			
			return
		else
			p10:fail(errorSourceStringsModule.Keys.AssetSchemaWrongRootName, { RootName = rootInstance.Name, ExpectedName = var14.Name })
		end
	end
end

return t