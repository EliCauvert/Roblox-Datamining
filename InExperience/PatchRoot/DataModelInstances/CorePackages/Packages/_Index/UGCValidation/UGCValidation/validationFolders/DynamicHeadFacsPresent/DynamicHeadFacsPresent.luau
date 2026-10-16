local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

return {
	categories = { ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD },
	requiredData = { ValidationEnumsModule.SharedDataMember.renderMeshesData },
	expectedFailures = {},
	run = function(p1, p2) --[[ Line: 20 ]]
		-- upvalues: UGCValidationService (copy), ErrorSourceStringsModule (copy)
		local Head = p2.renderMeshesData.Head
		local Success, Result = pcall(function() --[[ Line: 23 ]]
			-- upvalues: UGCValidationService (upval), Head (copy)
			return UGCValidationService:ValidateDynamicHeadEditableMesh(Head.editable)
		end)
		
		if not Success then
			p1:fetchError(string.format("Failed to load model for dynamic head '%s'. Make sure model exists and try again.", p2.rootInstance.Name))
		end
		if not Result then
			p1:fail(ErrorSourceStringsModule.Keys.DynHead_FacsMissing, { headName = p2.rootInstance.Name })
		end
	end
}