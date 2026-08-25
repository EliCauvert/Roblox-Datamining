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

local function _(p1, p2)
	-- upvalues: errorSourceStringsModule (ref)
	p1:fail(errorSourceStringsModule.Keys.NoAttributes, {
		RootInstanceName = p2.Name,
		InstanceNameList = p2:GetFullName()
	})
end

local function walkInstanceTree(p1, p2, p3)
	-- upvalues: hasOnlyAllowedAttribute (ref), errorSourceStringsModule (ref), constantsModule (ref)
	if not hasOnlyAllowedAttribute(p2:GetAttributes(), p3) then
		p1:fail(errorSourceStringsModule.Keys.NoAttributes, {
			RootInstanceName = p2.Name,
			InstanceNameList = p2:GetFullName()
		})
	end
	for i, v in p2:GetDescendants() do
		if (not p3 or not v:GetAttribute(constantsModule.AlternateMeshIdAttributeName)) and next(v:GetAttributes()) ~= nil then
			p1:fail(errorSourceStringsModule.Keys.NoAttributes, {
				RootInstanceName = v.Name,
				InstanceNameList = v:GetFullName()
			})
		end
	end
end

function t.run(p1, p2)
	-- upvalues: validationEnumsModule (ref), walkInstanceTree (ref)
	local var1 = p2.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.IEC
	walkInstanceTree(p1, p2.rootInstance, var1)
	
	for i, v in p2.hsrAssets do
		for i_1, v_1 in v do
			walkInstanceTree(p1, v_1, var1)
		end
	end
end

return t