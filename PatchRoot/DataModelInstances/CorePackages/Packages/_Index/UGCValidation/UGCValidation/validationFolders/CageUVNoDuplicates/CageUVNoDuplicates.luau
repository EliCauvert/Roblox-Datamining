-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:45 2026 Pacific Standard Time.

local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local wrapTargetCageUVReferenceValuesModule = require(parent.WrapTargetCageUVReferenceValues)
local getFIntUGCValidateCageDuplicateUVThresholdModule = require(parent.flags.getFIntUGCValidateCageDuplicateUVThreshold)

return {
	categories = { validationEnumsModule.UploadCategory.LAYERED_CLOTHING },
	requiredData = {
		validationEnumsModule.SharedDataMember.innerCagesData,
		validationEnumsModule.SharedDataMember.outerCagesData
	},
	conditionalData = {},
	fflag = require(parent.flags.getFFlagUGCValidateMigrateCageUV),
	expectedFailures = {},
	run = function(p0, p1) --[[ line: 39 ]]
		-- upvalues: wrapTargetCageUVReferenceValuesModule (ref), UGCValidationService (ref), getFIntUGCValidateCageDuplicateUVThresholdModule (ref), errorSourceStringsModule (ref)
		local t = {}
		
		for i, v in pairs(wrapTargetCageUVReferenceValuesModule) do
			for i_1, v_1 in pairs(v) do
				table.insert(t, v_1)
			end
		end
		local function checkCage(p2, p3) --[[ line: 48 ]]
			-- upvalues: UGCValidationService (copy), t (ref), getFIntUGCValidateCageDuplicateUVThresholdModule (copy), p0 (ref), errorSourceStringsModule (copy)
			for i, v in p2 do
				local var7 = UGCValidationService:ValidateEditableMeshUVDuplicates(t, v.editable)
				
				if getFIntUGCValidateCageDuplicateUVThresholdModule() < var7 then
					p0:fail(errorSourceStringsModule.Keys.CageUV_ExtraDuplicateUVs, {
						count = tostring(var7),
						cageType = if p3 then "inner" else "outer",
						partName = i
					})
				end
			end
		end
		
		checkCage(p1.innerCagesData, true)
		checkCage(p1.outerCagesData, false)
	end
}