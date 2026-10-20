local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local ControlNames = {
	"LeftEyeClosed", "EyesLookDown", "RightEyeClosed", "JawDrop", "Pucker",
	"LeftLipCornerPuller", "RightLipCornerPuller", "ChinRaiser",
	"ChinRaiserUpperLip", "LeftCheekRaiser", "RightCheekRaiser",
	"LeftInnerBrowRaiser", "RightInnerBrowRaiser", "LeftLipCornerDown",
	"RightLipCornerDown", "LeftLowerLipDepressor", "RightLowerLipDepressor"
}

return {
	categories = { ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD },
	prereqTests = {
		ValidationEnumsModule.ValidationModule.DynamicHeadFacsPresent
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.renderMeshesData },
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: UGCValidationService (copy), ControlNames (copy), ErrorSourceStringsModule (copy)
		local Head = p2.renderMeshesData.Head
		local Success, Result, Result3 = pcall(function()
			-- upvalues: UGCValidationService (upval), Head (copy), ControlNames (upval)
			return UGCValidationService:GetDynamicHeadEditableMeshInactiveControls(Head.editable, ControlNames)
		end)
		
		if not Success then
			if string.find(Result, "Download Error") == 1 then
				p1:fetchError(string.format("Failed to load model for dynamic head '%s'. Make sure model exists and try again.", p2.rootInstance.Name))
			end
			assert(false, Result)
		end
		local MeshId = p2.rootInstance.MeshId
		
		if #Result > 0 then
			p1:fail(ErrorSourceStringsModule.Keys.DynHead_ControlsMissing, {
				headName = p2.rootInstance.Name,
				meshId = MeshId,
				controlList = table.concat(Result, ", ")
			})
		end
		if #Result3 > 0 then
			p1:fail(ErrorSourceStringsModule.Keys.DynHead_ControlsInactive, {
				headName = p2.rootInstance.Name,
				meshId = MeshId,
				controlList = table.concat(Result3, ", ")
			})
		end
	end
}