local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local list = {
	"LeftEyeClosed", "EyesLookDown", "RightEyeClosed", "JawDrop", "Pucker",
	"LeftLipCornerPuller", "RightLipCornerPuller", "ChinRaiser",
	"ChinRaiserUpperLip", "LeftCheekRaiser", "RightCheekRaiser",
	"LeftInnerBrowRaiser", "RightInnerBrowRaiser", "LeftLipCornerDown",
	"RightLipCornerDown", "LeftLowerLipDepressor", "RightLowerLipDepressor"
}

return {
	fflag = require(parent.flags.getFFlagUGCValidateMigrateDynamicHeadData),
	categories = { validationEnumsModule.UploadCategory.DYNAMIC_HEAD },
	prereqTests = {
		validationEnumsModule.ValidationModule.DynamicHeadFacsPresent
	},
	requiredData = { validationEnumsModule.SharedDataMember.renderMeshesData },
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: UGCValidationService (ref), list (ref), errorSourceStringsModule (ref)
		local head = p2.renderMeshesData.Head
		local ok, status, var1 = pcall(function()
			-- upvalues: UGCValidationService (copy), head (ref), list (copy)
			return UGCValidationService:GetDynamicHeadEditableMeshInactiveControls(head.editable, list)
		end)
		
		if not ok then
			if string.find(status, "Download Error") == 1 then
				p1:fetchError(string.format("Failed to load model for dynamic head '%s'. Make sure model exists and try again.", p2.rootInstance.Name))
			end
			assert(false, status)
		end
		local meshId = p2.rootInstance.MeshId
		
		if #status > 0 then
			p1:fail(errorSourceStringsModule.Keys.DynHead_ControlsMissing, {
				headName = p2.rootInstance.Name,
				meshId = meshId,
				controlList = table.concat(status, ", ")
			})
		end
		if #var1 > 0 then
			p1:fail(errorSourceStringsModule.Keys.DynHead_ControlsInactive, {
				headName = p2.rootInstance.Name,
				meshId = meshId,
				controlList = table.concat(var1, ", ")
			})
		end
	end
}