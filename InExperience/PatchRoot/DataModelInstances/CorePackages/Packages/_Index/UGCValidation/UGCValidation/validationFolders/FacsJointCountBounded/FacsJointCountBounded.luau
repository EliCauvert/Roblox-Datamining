local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFIntUGCValidateFacsJointCountMaximumModule = require(parent.flags.getFIntUGCValidateFacsJointCountMaximum)

return {
	categories = { validationEnumsModule.UploadCategory.DYNAMIC_HEAD },
	requiredData = { validationEnumsModule.SharedDataMember.renderMeshesData },
	fflag = require(parent.flags.getFFlagUGCValidateFacsJointCountBounded),
	expectedFailures = { "Asset_EF_DynamicHeadExcessiveFacs" },
	run = function(p1, p2)
		-- upvalues: getFIntUGCValidateFacsJointCountMaximumModule (ref), errorSourceStringsModule (ref)
		local count = #p2.renderMeshesData.Head.editable:GetBones()
		local var1 = getFIntUGCValidateFacsJointCountMaximumModule()
		
		if var1 < count then
			p1:fail(errorSourceStringsModule.Keys.FacsJointCountBounded, {
				maxFacsJointCount = string.format("%d", var1),
				actualJointCount = string.format("%d", count)
			})
		end
	end
}