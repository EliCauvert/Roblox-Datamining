local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local CreateExpectedSchemaModule = require(Parent.util.CreateExpectedSchema)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule = require(Parent.flags.getFFlagUGCValidationExtendSchemaToIgnoreDescendants)
local GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule = require(Parent.flags.getEngineFeatureEngineUGCValidationExpandReturnSchema)
local GetFFlagUGCValidationAnimationPackSupportModule = require(Parent.flags.getFFlagUGCValidationAnimationPackSupport)
local GetFFlagUGCValidationAnimationPackFolderStructureModule = require(Parent.flags.getFFlagUGCValidationAnimationPackFolderStructure)

local function _(List, Value): boolean
	return if type(List) == "table" then table.find(List, Value) ~= nil else List == Value
end

local _ = function(List)
	return if type(List) == "table" then table.concat(List, " or ") elseif type(List) == "string" then List else "*"
end

local function validateInstancesFromSchema(Object, AnimationPackBundleSchema, p1, p2)
	-- upvalues: GetFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule (copy), validateInstancesFromSchema (copy), ErrorSourceStringsModule (copy), GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule (copy)
	p1[Object] = true
	
	if GetFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule() and AnimationPackBundleSchema._ignoreDescendants then
		assert(not AnimationPackBundleSchema._children, "if _ignoreDescendants is true, there should be no descendants in the schema as they would be ignored anyway")
		
		for _, descendant in Object:GetDescendants() do
			p1[descendant] = true
		end
		return
	else
		local Children = AnimationPackBundleSchema._children or {}
		local Flag = nil
		for _, child in Children do
			Flag = false
			
			for _, child1 in Object:GetChildren() do
				if p1[child1] == nil and child1.ClassName == child.ClassName then
					local NoName = child.Name == nil
					
					if not NoName then
						local Name = child.Name
						local Name1 = child1.Name
						NoName = if type(Name) == "table" then table.find(Name, Name1) ~= nil else Name == Name1
					end
					if NoName then
						validateInstancesFromSchema(child1, child, p1, p2)
						Flag = true
						break
					end
				end
			end
			if not Flag and not child._optional then
				local Name = child.Name
				p2:fail(ErrorSourceStringsModule.Keys.AssetSchemaMissingItem, {
					ParentPath = Object:GetFullName(),
					ExpectedClass = child.ClassName,
					ExpectedName = if type(Name) == "table" then table.concat(Name, " or ") elseif type(Name) == "string" then Name else "*"
				}, if GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then Object else nil)
			end
		end
	end
end

local function validateNoInstancesOutsideSchema(RootInstance, p3, p4)
	-- upvalues: ErrorSourceStringsModule (copy), GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule (copy)
	local List = {}
	
	for _, descendant in pairs(RootInstance:GetDescendants()) do
		if p3[descendant] == nil then
			table.insert(List, descendant:GetFullName())
		end
	end
	if #List > 0 then
		p4:fail(ErrorSourceStringsModule.Keys.AssetSchemaUnexpectedItems, { UnexpectedDescendantPaths = table.concat(List, ", ") }, if GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then RootInstance else nil)
	end
end

return {
	categories = require(Parent.Constants).AllUploadCategories,
	requiredData = {
		ValidationEnumsModule.SharedDataMember.entrypointInput,
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.uploadCategory,
		ValidationEnumsModule.SharedDataMember.uploadEnum
	},
	run = function(p5, p6)
		-- upvalues: ErrorSourceStringsModule (copy), GetFFlagUGCValidationAnimationPackSupportModule (copy), GetFFlagUGCValidationAnimationPackFolderStructureModule (copy), CreateExpectedSchemaModule (copy), validateInstancesFromSchema (copy), validateNoInstancesOutsideSchema (copy)
		local RootInstance = p6.rootInstance
		local UploadCategory = p6.uploadCategory
		local UploadEnum = p6.uploadEnum
		
		if RootInstance == nil then
			p5:fail(ErrorSourceStringsModule.Keys.SelectionCountNotOne)
			
			return
		end
		local AnimationPackBundleSchema = if UploadEnum.bundleType then if GetFFlagUGCValidationAnimationPackSupportModule() and UploadEnum.bundleType == Enum.BundleType.Animations then if GetFFlagUGCValidationAnimationPackFolderStructureModule() then CreateExpectedSchemaModule.generateAnimationPackBundleSchema(RootInstance) else CreateExpectedSchemaModule.generateAnimationPackBundleSchema(nil) else CreateExpectedSchemaModule.generateBundleSchema(p6.entrypointInput) else CreateExpectedSchemaModule.generateAssetSchema(UploadCategory, UploadEnum.assetType, RootInstance)
		local t = {}
		
		if AnimationPackBundleSchema.ClassName ~= RootInstance.ClassName then
			p5:fail(ErrorSourceStringsModule.Keys.AssetSchemaWrongRootClass, {
				RootClass = RootInstance.ClassName,
				ExpectedClass = AnimationPackBundleSchema.ClassName
			})
			
			return
		end
		if AnimationPackBundleSchema.Name ~= nil then
			local Name = AnimationPackBundleSchema.Name
			local Name1 = RootInstance.Name
			
			if not (if type(Name) == "table" then table.find(Name, Name1) ~= nil else Name == Name1) then
				p5:fail(ErrorSourceStringsModule.Keys.AssetSchemaWrongRootName, {
					RootName = RootInstance.Name,
					ExpectedName = AnimationPackBundleSchema.Name
				})
				
				return
			end
		end
		validateInstancesFromSchema(RootInstance, AnimationPackBundleSchema, t, p5)
		validateNoInstancesOutsideSchema(RootInstance, t, p5)
	end
}