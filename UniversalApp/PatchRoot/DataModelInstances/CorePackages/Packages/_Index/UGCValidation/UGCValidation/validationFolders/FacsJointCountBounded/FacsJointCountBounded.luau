local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFIntUGCValidateFacsJointCountMaximumModule = require(Parent.flags.getFIntUGCValidateFacsJointCountMaximum)

return {
	categories = { ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD },
	requiredData = { ValidationEnumsModule.SharedDataMember.renderMeshesData },
	fflag = require(Parent.flags.getFFlagUGCValidateFacsJointCountBounded),
	expectedFailures = { "Asset_EF_DynamicHeadExcessiveFacs" },
	run = function(p1, p2) --[[ Line: 23 ]]
		-- upvalues: GetFIntUGCValidateFacsJointCountMaximumModule (copy), ErrorSourceStringsModule (copy)
		local Count = #p2.renderMeshesData.Head.editable:GetBones()
		local FIntUGCValidateFacsJointCountMaximumModule = GetFIntUGCValidateFacsJointCountMaximumModule()
		
		if FIntUGCValidateFacsJointCountMaximumModule < Count then
			p1:fail(ErrorSourceStringsModule.Keys.FacsJointCountBounded, {
				maxFacsJointCount = string.format("%d", FIntUGCValidateFacsJointCountMaximumModule),
				actualJointCount = string.format("%d", Count)
			})
		end
	end
}