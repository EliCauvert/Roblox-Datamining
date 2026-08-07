-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:45 2026 Pacific Standard Time.

local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local wrapTargetCageUVReferenceValuesModule = require(parent.WrapTargetCageUVReferenceValues)

return {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { validationEnumsModule.SharedDataMember.outerCagesData },
	conditionalData = {},
	fflag = require(parent.flags.getFFlagUGCValidateMigrateCageUV),
	expectedFailures = {},
	run = function(p0, p1) --[[ line: 38 ]]
		-- upvalues: wrapTargetCageUVReferenceValuesModule (ref), UGCValidationService (ref), errorSourceStringsModule (ref)
		for i, v in p1.outerCagesData do
			local var4 = wrapTargetCageUVReferenceValuesModule[i]
			
			if var4 and not UGCValidationService:ValidateEditableMeshUVValuesInReference(var4, v.editable) then
				p0:fail(errorSourceStringsModule.Keys.CageUV_InvalidUVValue, { partName = i })
			end
		end
	end
}