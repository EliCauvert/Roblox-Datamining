local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule = require(Parent.flags.getEngineFeatureEngineUGCValidationExpandReturnSchema)

return {
	categories = { ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD },
	requiredData = { ValidationEnumsModule.SharedDataMember.rootInstance },
	fflag = require(Parent.flags.getEngineFeatureUGCValidateCheckFacsDisableOverride),
	run = function(p1, p2)
		-- upvalues: ErrorSourceStringsModule (copy), GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule (copy)
		local FaceControls = p2.rootInstance:FindFirstChildOfClass("FaceControls")
		
		if FaceControls and FaceControls:HasOverrideFACSData() then
			p1:fail(ErrorSourceStringsModule.Keys.FaceControlsOverrideFACSNotEmpty, nil, if GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then FaceControls else nil)
		end
	end
}