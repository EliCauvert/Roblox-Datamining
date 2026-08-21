local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local getFFlagUGCValidateCurveAnimAttributesModule = require(parent.flags.getFFlagUGCValidateCurveAnimAttributes)
local getFFlagUGCValidateR15FixedAttributesModule = require(parent.flags.getFFlagUGCValidateR15FixedAttributes)
local t = {
	categories = if require(parent.flags.getFFlagUGCValidateMakeupCategoryParity)() then constantsModule.AllAssetUploadCategories else constantsModule.AllAssetUploadCategoriesIncludingMakeup,
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.consumerConfig,
		validationEnumsModule.SharedDataMember.hsrAssets
	}
}

if getFFlagUGCValidateCurveAnimAttributesModule() then
	table.insert(t.requiredData, validationEnumsModule.SharedDataMember.curveAnimations)
end
t.fflag = getFFlagUGCValidateMigrateSchemaPropertiesModule
t.expectedFailures = {}

local function hasOnlyAllowedAttribute(p0, p1) --[[ line: 33 ]]
	-- upvalues: constantsModule (ref)
	for i, v in p0 do
		if not p1 or i ~= constantsModule.AlternateMeshIdAttributeName then
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

local function _(p2, p3) --[[ line: 54 | named "reportInstanceWithDisallowedAttributes" ]]
	-- upvalues: errorSourceStringsModule (ref)
	p2:fail(errorSourceStringsModule.Keys.NoAttributes, {
		RootInstanceName = p3.Name,
		InstanceNameList = p3:GetFullName()
	})
end

local function walkInstanceTree(p4, p5, p6) --[[ line: 62 ]]
	-- upvalues: hasOnlyAllowedAttribute (ref), errorSourceStringsModule (ref), constantsModule (ref)
	if not hasOnlyAllowedAttribute(p5:GetAttributes(), p6) then
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

function t.run(p7, p8) --[[ line: 81 ]]
	-- upvalues: validationEnumsModule (ref), walkInstanceTree (ref), getFFlagUGCValidateR15FixedAttributesModule (ref), getFFlagUGCValidateCurveAnimAttributesModule (ref)
	local var9 = p8.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.IEC
	walkInstanceTree(p7, p8.rootInstance, var9)
	
	if getFFlagUGCValidateR15FixedAttributesModule() and p8.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend and p8.r15LegacyDuplicateRoot ~= nil then
		walkInstanceTree(p7, p8.r15LegacyDuplicateRoot, var9)
	end
	for i, v in p8.hsrAssets do
		for i_2, v_1 in v do
			walkInstanceTree(p7, v_1, var9)
		end
	end
	if getFFlagUGCValidateCurveAnimAttributesModule() then
		for i, v_1 in p8.curveAnimations do
			walkInstanceTree(p7, v_1, var9)
		end
	end
end

return t