local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local getFFlagUGCValidateCurveAnimAttributesModule = require(parent.flags.getFFlagUGCValidateCurveAnimAttributes)
local getFFlagUGCValidateMakeupCategoryParityModule = require(parent.flags.getFFlagUGCValidateMakeupCategoryParity)
local getFFlagUGCValidateR15FixedAttributesModule = require(parent.flags.getFFlagUGCValidateR15FixedAttributes)
game:DefineFastFlag("UGCValidateAllowEmoteAttributes", false)
local t = {
	categories = if getFFlagUGCValidateMakeupCategoryParityModule() then constantsModule.AllAssetUploadCategories else constantsModule.AllAssetUploadCategoriesIncludingMakeup,
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.consumerConfig,
		validationEnumsModule.SharedDataMember.hsrAssets
	}
}
local t_1 = {
	[constantsModule.EmoteIsUGCAttributeName] = true,
	[constantsModule.EmoteMaxPartTranslationAttributeName] = true
}

if getFFlagUGCValidateCurveAnimAttributesModule() then
	table.insert(t.requiredData, validationEnumsModule.SharedDataMember.curveAnimations)
end
t.fflag = getFFlagUGCValidateMigrateSchemaPropertiesModule
t.expectedFailures = {}

local function hasOnlyAllowedAttribute(p1, p2, p3)
	-- upvalues: constantsModule (ref)
	for i, v in p1 do
		if (not p2 or i ~= constantsModule.AlternateMeshIdAttributeName) and (not p3 or not p3[i]) then
			if i == constantsModule.GUIDAttributeName then
				if typeof(v) == "string" then
					if constantsModule.GUIDAttributeMaxLength < string.len(v) then
						return false
					end
				end
				return false
			end
			return false
		end
	end
	return true
end

local function _(p4, p5)
	-- upvalues: errorSourceStringsModule (ref)
	p4:fail(errorSourceStringsModule.Keys.NoAttributes, {
		RootInstanceName = p5.Name,
		InstanceNameList = p5:GetFullName()
	})
end

local function walkInstanceTree(p4, p5, p6, p7)
	-- upvalues: hasOnlyAllowedAttribute (ref), errorSourceStringsModule (ref), constantsModule (ref)
	if not hasOnlyAllowedAttribute(p5:GetAttributes(), p6, p7) then
		p4:fail(errorSourceStringsModule.Keys.NoAttributes, {
			RootInstanceName = p5.Name,
			InstanceNameList = p5:GetFullName()
		})
	end
	for i, v in p5:GetDescendants() do
		if (not p6 or not v:GetAttribute(constantsModule.AlternateMeshIdAttributeName)) and next(v:GetAttributes()) ~= nil then
			p4:fail(errorSourceStringsModule.Keys.NoAttributes, {
				RootInstanceName = v.Name,
				InstanceNameList = v:GetFullName()
			})
		end
	end
end

function t.run(p8, p9)
	-- upvalues: validationEnumsModule (ref), walkInstanceTree (ref), getFFlagUGCValidateR15FixedAttributesModule (ref), getFFlagUGCValidateCurveAnimAttributesModule (ref), t_1 (ref)
	local var1 = p9.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.IEC
	walkInstanceTree(p8, p9.rootInstance, var1)
	
	if getFFlagUGCValidateR15FixedAttributesModule() and p9.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend and p9.r15LegacyDuplicateRoot ~= nil then
		walkInstanceTree(p8, p9.r15LegacyDuplicateRoot, var1)
	end
	for i, v in p9.hsrAssets do
		for i_1, v_1 in v do
			walkInstanceTree(p8, v_1, var1)
		end
	end
	if getFFlagUGCValidateCurveAnimAttributesModule() then
		local var2 = if game:GetFastFlag("UGCValidateAllowEmoteAttributes") and p9.uploadCategory == validationEnumsModule.UploadCategory.EMOTE_ANIMATION then t_1 else nil
		
		for i_1, v_1 in p9.curveAnimations do
			walkInstanceTree(p8, v_1, var1, var2)
		end
	end
end

return t