local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateCurveAnimAttributesModule = require(Parent.flags.getFFlagUGCValidateCurveAnimAttributes)
local GetFFlagUGCValidateMakeupCategoryParityModule = require(Parent.flags.getFFlagUGCValidateMakeupCategoryParity)
local GetFFlagUGCValidateR15FixedAttributesModule = require(Parent.flags.getFFlagUGCValidateR15FixedAttributes)
game:DefineFastFlag("UGCValidateAllowEmoteAttributes", false)
local config = {
	[ConstantsModule.EmoteIsUGCAttributeName] = true,
	[ConstantsModule.EmoteMaxPartTranslationAttributeName] = true
}
local AttributesAllowedModule = {
	categories = if GetFFlagUGCValidateMakeupCategoryParityModule() then ConstantsModule.AllAssetUploadCategories else ConstantsModule.AllAssetUploadCategoriesIncludingMakeup,
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.consumerConfig,
		ValidationEnumsModule.SharedDataMember.hsrAssets
	}
}

if GetFFlagUGCValidateCurveAnimAttributesModule() then
	table.insert(AttributesAllowedModule.requiredData, ValidationEnumsModule.SharedDataMember.curveAnimations)
end
AttributesAllowedModule.expectedFailures = {}

local function hasOnlyAllowedAttribute(Attributes, p1, p2): boolean
	-- upvalues: ConstantsModule (copy)
	for i, attribute in Attributes do
		if (not p1 or i ~= ConstantsModule.AlternateMeshIdAttributeName) and (not p2 or not p2[i]) then
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

local function _(p3, Object)
	-- upvalues: ErrorSourceStringsModule (copy)
	p3:fail(ErrorSourceStringsModule.Keys.NoAttributes, {
		RootInstanceName = Object.Name,
		InstanceNameList = Object:GetFullName()
	})
end

local function walkInstanceTree(p3, Object, IsConsumerEnvMatch, p4)
	-- upvalues: hasOnlyAllowedAttribute (copy), ErrorSourceStringsModule (copy), ConstantsModule (copy)
	if not hasOnlyAllowedAttribute(Object:GetAttributes(), IsConsumerEnvMatch, p4) then
		p3:fail(ErrorSourceStringsModule.Keys.NoAttributes, {
			RootInstanceName = Object.Name,
			InstanceNameList = Object:GetFullName()
		})
	end
	for _, descendant in Object:GetDescendants() do
		if (not IsConsumerEnvMatch or not descendant:GetAttribute(ConstantsModule.AlternateMeshIdAttributeName)) and next(descendant:GetAttributes()) ~= nil then
			p3:fail(ErrorSourceStringsModule.Keys.NoAttributes, {
				RootInstanceName = descendant.Name,
				InstanceNameList = descendant:GetFullName()
			})
		end
	end
end

function AttributesAllowedModule.run(p5, p6)
	-- upvalues: ValidationEnumsModule (copy), walkInstanceTree (copy), GetFFlagUGCValidateR15FixedAttributesModule (copy), GetFFlagUGCValidateCurveAnimAttributesModule (copy), config (copy)
	local IsConsumerEnvMatch = p6.consumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.IEC
	walkInstanceTree(p5, p6.rootInstance, IsConsumerEnvMatch)
	
	if GetFFlagUGCValidateR15FixedAttributesModule() and p6.consumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.Backend and p6.r15LegacyDuplicateRoot ~= nil then
		walkInstanceTree(p5, p6.r15LegacyDuplicateRoot, IsConsumerEnvMatch)
	end
	for _, hsrAsset in p6.hsrAssets do
		for _, value in hsrAsset do
			walkInstanceTree(p5, value, IsConsumerEnvMatch)
		end
	end
	if GetFFlagUGCValidateCurveAnimAttributesModule() then
		local Config = if game:GetFastFlag("UGCValidateAllowEmoteAttributes") and p6.uploadCategory == ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION then config else nil
		for _, curveAnimation in p6.curveAnimations do
			walkInstanceTree(p5, curveAnimation, IsConsumerEnvMatch, Config)
		end
	end
end

return AttributesAllowedModule