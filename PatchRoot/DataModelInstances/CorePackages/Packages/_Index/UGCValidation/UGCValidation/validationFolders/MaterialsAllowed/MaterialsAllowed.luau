-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:48 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY
	},
	requiredData = { validationEnumsModule.SharedDataMember.rootInstance },
	fflag = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties),
	expectedFailures = {}
}

local function buildAcceptedMaterialList() --[[ line: 24 ]]
	-- upvalues: constantsModule (ref)
	local t = {}
	
	for i in pairs(constantsModule.MATERIAL_WHITELIST) do
		table.insert(t, i.Name)
	end
	return table.concat(t, ", ")
end

function t.run(p0, p1) --[[ line: 32 ]]
	-- upvalues: constantsModule (ref), buildAcceptedMaterialList (ref), errorSourceStringsModule (ref)
	local rootInstance = p1.rootInstance
	local descendants = rootInstance:GetDescendants()
	table.insert(descendants, rootInstance)
	local var7 = nil
	
	for i, v in descendants do
		if v:IsA("BasePart") and not constantsModule.MATERIAL_WHITELIST[v.Material] then
			var7 = var7 or buildAcceptedMaterialList()
			p0:fail(errorSourceStringsModule.Keys.MaterialNotAllowed, {
				InstanceNameList = v:GetFullName(),
				AllowedMaterials = var7
			})
		end
	end
end

return t