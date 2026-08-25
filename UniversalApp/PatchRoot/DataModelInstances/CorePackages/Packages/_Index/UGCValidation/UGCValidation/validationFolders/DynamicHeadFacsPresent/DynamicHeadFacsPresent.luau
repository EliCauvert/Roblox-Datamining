local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)

return {
	fflag = require(parent.flags.getFFlagUGCValidateMigrateDynamicHeadData),
	categories = { validationEnumsModule.UploadCategory.DYNAMIC_HEAD },
	requiredData = { validationEnumsModule.SharedDataMember.renderMeshesData },
	expectedFailures = {},
	run = function(p0, p1)
		-- upvalues: UGCValidationService (ref), errorSourceStringsModule (ref)
		local head = p1.renderMeshesData.Head
		local ok, status = pcall(function()
			-- upvalues: UGCValidationService (copy), head (ref)
			return UGCValidationService:ValidateDynamicHeadEditableMesh(head.editable)
		end)
		
		if not ok then
			p0:fetchError(string.format("Failed to load model for dynamic head '%s'. Make sure model exists and try again.", p1.rootInstance.Name))
		end
		if not status then
			p0:fail(errorSourceStringsModule.Keys.DynHead_FacsMissing, { headName = p1.rootInstance.Name })
		end
	end
}