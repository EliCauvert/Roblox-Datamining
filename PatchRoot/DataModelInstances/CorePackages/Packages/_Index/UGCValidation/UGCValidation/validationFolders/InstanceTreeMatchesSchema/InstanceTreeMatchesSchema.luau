-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:47 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)

return {
	categories = {
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		validationEnumsModule.UploadCategory.EMOTE_ANIMATION,
		validationEnumsModule.UploadCategory.MAKEUP
	},
	requiredData = { validationEnumsModule.SharedDataMember.rootInstance },
	fflag = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties),
	expectedFailures = {},
	run = function(p0, p1) --[[ line: 24 ]]
		-- upvalues: constantsModule (ref), errorSourceStringsModule (ref)
		local rootInstance = p1.rootInstance
		
		if constantsModule.BANNED_NAMES[rootInstance.Name] then
			p0:fail(errorSourceStringsModule.Keys.InstanceTreeBannedName, { InstancePath = rootInstance:GetFullName() })
		end
		for i, v in rootInstance:GetDescendants() do
			for i_1, v_1 in constantsModule.BANNED_CLASS_NAMES do
				if v:IsA(v_1) then
					p0:fail(errorSourceStringsModule.Keys.InstanceTreeBannedClass, { InstancePath = v:GetFullName(), ClassName = v_1 })
				end
			end
			if constantsModule.BANNED_NAMES[v.Name] then
				p0:fail(errorSourceStringsModule.Keys.InstanceTreeBannedName, { InstancePath = v:GetFullName() })
			end
		end
	end
}