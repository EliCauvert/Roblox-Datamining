local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

local function hasOnlyAllowedAttribute(Attributes, p1): boolean
	-- upvalues: ConstantsModule (copy)
	for i, attribute in Attributes do
		if not p1 or i ~= ConstantsModule.AlternateMeshIdAttributeName then
			if i ~= ConstantsModule.GUIDAttributeName then
				return false
			end
			if typeof(attribute) ~= "string" then
				return false
			elseif ConstantsModule.GUIDAttributeMaxLength < string.len(attribute) then
				return false
			end
			continue
		end
	end
	return true
end

local function _(p2, Object)
	-- upvalues: ErrorSourceStringsModule (copy)
	p2:fail(ErrorSourceStringsModule.Keys.NoAttributes, {
		RootInstanceName = Object.Name,
		InstanceNameList = Object:GetFullName()
	})
end

local function walkInstanceTree(p2, Object, IsConsumerEnvMatch)
	-- upvalues: hasOnlyAllowedAttribute (copy), ErrorSourceStringsModule (copy), ConstantsModule (copy)
	if not hasOnlyAllowedAttribute(Object:GetAttributes(), IsConsumerEnvMatch) then
		p2:fail(ErrorSourceStringsModule.Keys.NoAttributes, {
			RootInstanceName = Object.Name,
			InstanceNameList = Object:GetFullName()
		})
	end
	for _, descendant in Object:GetDescendants() do
		if (not IsConsumerEnvMatch or not descendant:GetAttribute(ConstantsModule.AlternateMeshIdAttributeName)) and next(descendant:GetAttributes()) ~= nil then
			p2:fail(ErrorSourceStringsModule.Keys.NoAttributes, {
				RootInstanceName = descendant.Name,
				InstanceNameList = descendant:GetFullName()
			})
		end
	end
end

return {
	categories = ConstantsModule.AllAssetUploadCategoriesIncludingMakeup,
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.consumerConfig,
		ValidationEnumsModule.SharedDataMember.hsrAssets
	},
	fflag = require(Parent.flags.getFFlagUGCValidateMigrateSchemaProperties),
	expectedFailures = {},
	run = function(p3, p4)
		-- upvalues: ValidationEnumsModule (copy), walkInstanceTree (copy)
		local IsConsumerEnvMatch = p4.consumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.IEC
		walkInstanceTree(p3, p4.rootInstance, IsConsumerEnvMatch)
		
		for _, hsrAsset in p4.hsrAssets do
			for _, value in hsrAsset do
				walkInstanceTree(p3, value, IsConsumerEnvMatch)
			end
		end
	end
}