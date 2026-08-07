-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:45 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local floatEqualsModule = require(parent.util.floatEquals)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		validationEnumsModule.UploadCategory.FULL_BODY
	},
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.renderMeshesData
	},
	fflag = require(parent.flags.getFFlagUGCValidateMigratePoseBlocking),
	expectedFailures = {}
}

local function validateMeshMin(a, b, p0) --[[ line: 35 ]]
	-- upvalues: floatEqualsModule (ref), errorSourceStringsModule (ref)
	local t = {}
	
	for i, v in { "X", "Y", "Z" } do
		if floatEqualsModule(b[v], 0, 0.0001) then
			table.insert(t, "Size on " .. v .. " axis is zero")
		end
	end
	if #t > 0 then
		a:fail(errorSourceStringsModule.Keys.BodyBlocking_ZeroMeshSize, { meshName = p0, details = table.concat(t, ". ") })
	end
end

function t.run(p1, p2) --[[ line: 53 ]]
	-- upvalues: validateMeshMin (ref)
	for i, v in p2.renderMeshesData do
		validateMeshMin(p1, v.originalSize, i)
	end
end

return t