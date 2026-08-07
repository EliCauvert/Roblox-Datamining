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

local function hasOnlyAllowedAttribute(p0, p1) --[[ line: 21 ]]
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

local function _(p2, p3) --[[ line: 42 | named "reportInstanceWithDisallowedAttributes" ]]
	-- upvalues: errorSourceStringsModule (ref)
	p2:fail(errorSourceStringsModule.Keys.NoAttributes, {
		RootInstanceName = p3.Name,
		InstanceNameList = p3:GetFullName()
	})
end

local function walkInstanceTree(p4, p5, p6) --[[ line: 50 ]]
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

function t.run(p7, p8) --[[ line: 69 ]]
	-- upvalues: validationEnumsModule (ref), walkInstanceTree (ref)
	local var6 = p8.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.IEC
	walkInstanceTree(p7, p8.rootInstance, var6)
	
	for i, v in p8.hsrAssets do
		for i_1, v_1 in v do
			walkInstanceTree(p7, v_1, var6)
		end
	end
end

return t