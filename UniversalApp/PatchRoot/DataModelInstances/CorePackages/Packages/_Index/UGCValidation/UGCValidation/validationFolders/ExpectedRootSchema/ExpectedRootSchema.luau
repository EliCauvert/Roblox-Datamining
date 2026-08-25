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

local function _(p1, p2)
	return if type(p1) == "table" then table.find(p1, p2) ~= nil else p1 == p2
end

local _ = function(p1)
	return if type(p1) == "table" then table.concat(p1, " or ") elseif type(p1) == "string" then p1 else "*"
end

local function validateInstancesFromSchema(p1, p2, p3, p4)
	-- upvalues: getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule (ref), validateInstancesFromSchema (ref), errorSourceStringsModule (ref)
	p3[p1] = true
	
	if getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule() and p2._ignoreDescendants then
		assert(not p2._children, "if _ignoreDescendants is true, there should be no descendants in the schema as they would be ignored anyway")
		
		for i, v in p1:GetDescendants() do
			p3[v] = true
		end
		return
	else
		local var1
		for i, v in p2._children or {} do
			var1 = false
			
			for i_1, v_1 in p1:GetChildren() do
				if p3[v_1] == nil and v_1.ClassName == v.ClassName then
					if v.Name ~= nil then
						local var2
						local name = v.Name
						local name_1 = v_1.Name
						
						if type(name) == "table" then
							var2 = table.find(name, name_1) ~= nil
							var2 = nil
						else
							var2 = name == name_1
						end
						if var2 then
							validateInstancesFromSchema(v_1, v, p3, p4)
							var1 = true
							break
						end
					end
				end
			end
			if not var1 and not v._optional then
				local assetSchemaMissingItem = errorSourceStringsModule.Keys.AssetSchemaMissingItem
				i_1 = {
					ParentPath = p1:GetFullName(),
					ExpectedClass = v.ClassName
				}
				local name = v.Name
				i_1.ExpectedName = if type(name) == "table" then table.concat(name, " or ") elseif type(name) == "string" then name else "*"
				p4:fail(assetSchemaMissingItem, i_1, p1)
			end
		end
	end
end

local function validateNoInstancesOutsideSchema(p1, p2, p3)
	-- upvalues: errorSourceStringsModule (ref)
	local t = {}
	
	for i, v in pairs(p1:GetDescendants()) do
		if p2[v] == nil then
			table.insert(t, v:GetFullName())
		end
	end
	if #t > 0 then
		p3:fail(errorSourceStringsModule.Keys.AssetSchemaUnexpectedItems, { UnexpectedDescendantPaths = table.concat(t, ", ") }, p1)
	end
end

function t.run(p1, p2)
	-- upvalues: errorSourceStringsModule (ref), getFFlagUGCValidationAnimationPackSupportModule (ref), getFFlagUGCValidationAnimationPackDisableModelStructureModule (ref), getFFlagUGCValidationAnimationPackFolderStructureModule (ref), createExpectedSchemaModule (ref), validateInstancesFromSchema (ref), validateNoInstancesOutsideSchema (ref)
	local rootInstance = p2.rootInstance
	local uploadCategory = p2.uploadCategory
	local uploadEnum = p2.uploadEnum
	
	if rootInstance == nil then
		p1:fail(errorSourceStringsModule.Keys.SelectionCountNotOne)
		
		return
	end
	local _ = nil
	local var1 = if not uploadEnum.bundleType then if not getFFlagUGCValidationAnimationPackSupportModule() or uploadEnum.bundleType ~= Enum.BundleType.Animations then if getFFlagUGCValidationAnimationPackDisableModelStructureModule() or not getFFlagUGCValidationAnimationPackFolderStructureModule() then createExpectedSchemaModule.generateAnimationPackBundleSchema(nil) else createExpectedSchemaModule.generateAnimationPackBundleSchema(rootInstance) else createExpectedSchemaModule.generateBundleSchema(p2.entrypointInput) else createExpectedSchemaModule.generateAssetSchema(uploadCategory, uploadEnum.assetType, rootInstance)
	local t = {}
	
	if var1.ClassName ~= rootInstance.ClassName then
		p1:fail(errorSourceStringsModule.Keys.AssetSchemaWrongRootClass, {
			RootClass = rootInstance.ClassName,
			ExpectedClass = var1.ClassName
		})
		
		return
	elseif var1.Name ~= nil then
		local var2
		local name = var1.Name
		local name_1 = rootInstance.Name
		
		if type(name) == "table" then
			var2 = table.find(name, name_1) ~= nil
			var2 = nil
		else
			var2 = name == name_1
		end
		if var2 then
			validateInstancesFromSchema(rootInstance, var1, t, p1)
			validateNoInstancesOutsideSchema(rootInstance, t, p1)
			
			return
		else
			p1:fail(errorSourceStringsModule.Keys.AssetSchemaWrongRootName, { RootName = rootInstance.Name, ExpectedName = var1.Name })
		end
	end
end

return t