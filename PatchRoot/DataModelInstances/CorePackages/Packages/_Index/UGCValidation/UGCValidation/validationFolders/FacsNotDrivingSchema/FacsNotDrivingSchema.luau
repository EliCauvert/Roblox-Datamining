-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:47 2026 Pacific Standard Time.

local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local constantsModule = require(parent.Constants)

return {
	fflag = require(parent.flags.getFFlagUGCValidationEnableR15plusSkinning),
	categories = { validationEnumsModule.UploadCategory.DYNAMIC_HEAD },
	requiredData = { validationEnumsModule.SharedDataMember.renderMeshesData },
	run = function(p0, p1) --[[ line: 14 ]]
		-- upvalues: r15plusUtilsModule (ref), UGCValidationService (ref), constantsModule (ref), errorSourceStringsModule (ref)
		local jointNameWhitelist = r15plusUtilsModule.getJointNameWhitelist()
		
		for i, v in {
			UGCValidationService:GetFacsDrivenJointNamesFromEditableMesh(p1.renderMeshesData.Head.editable)
		} do
			if jointNameWhitelist[v] or constantsModule.ALLOWED_SKINNING_TRANSFER_JOINT_NAMES[v] then
				p0:fail(errorSourceStringsModule.Keys.UnallowedFacsJoints, { jointName = v })
			end
		end
	end
}