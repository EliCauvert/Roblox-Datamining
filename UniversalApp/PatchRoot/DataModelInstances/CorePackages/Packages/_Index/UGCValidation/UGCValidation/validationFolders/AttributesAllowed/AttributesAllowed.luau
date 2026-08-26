local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local t = {
	categories = constantsModule.AllAssetUploadCategoriesIncludingMakeup,
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.consumerConfig,
		validationEnumsModule.SharedDataMember.hsrAssets
	},
	fflag = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties),
	expectedFailures = {}
}

local function hasOnlyAllowedAttribute(p1, p2)
	-- upvalues: constantsModule (ref)
	for i, v in p1 do
		if not p2 or i ~= constantsModule.AlternateMeshIdAttributeName then
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

local function _(p3, p4)
	-- upvalues: errorSourceStringsModule (ref)
	p3:fail(errorSourceStringsModule.Keys.NoAttributes, {
		RootInstanceName = p4.Name,
		InstanceNameList = p4:GetFullName()
	})
end

local function walkInstanceTree(p3, p4, p5)
	-- upvalues: hasOnlyAllowedAttribute (ref), errorSourceStringsModule (ref), constantsModule (ref)
	if not hasOnlyAllowedAttribute(p4:GetAttributes(), p5) then
		p3:fail(errorSourceStringsModule.Keys.NoAttributes, {
			RootInstanceName = p4.Name,
			InstanceNameList = p4:GetFullName()
		})
	end
	for i, v in p4:GetDescendants() do
		if (not p5 or not v:GetAttribute(constantsModule.AlternateMeshIdAttributeName)) and next(v:GetAttributes()) ~= nil then
			p3:fail(errorSourceStringsModule.Keys.NoAttributes, {
				RootInstanceName = v.Name,
				InstanceNameList = v:GetFullName()
			})
		end
	end
end

function t.run(p6, p7)
	-- upvalues: validationEnumsModule (ref), walkInstanceTree (ref)
	local var1 = p7.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.IEC
	walkInstanceTree(p6, p7.rootInstance, var1)
	
	for i, v in p7.hsrAssets do
		for i_1, v_1 in v do
			walkInstanceTree(p6, v_1, var1)
		end
	end
end

return t