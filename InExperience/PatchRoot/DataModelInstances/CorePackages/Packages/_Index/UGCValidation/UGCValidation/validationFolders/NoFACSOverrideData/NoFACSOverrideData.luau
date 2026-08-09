local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getEngineFeatureEngineUGCValidationExpandReturnSchemaModule = require(parent.flags.getEngineFeatureEngineUGCValidationExpandReturnSchema)

return {
	categories = { validationEnumsModule.UploadCategory.DYNAMIC_HEAD },
	requiredData = { validationEnumsModule.SharedDataMember.rootInstance },
	fflag = require(parent.flags.getEngineFeatureUGCValidateCheckFacsDisableOverride),
	run = function(p0, p1) --[[ line: 14 ]]
		-- upvalues: errorSourceStringsModule (ref), getEngineFeatureEngineUGCValidationExpandReturnSchemaModule (ref)
		local faceControls = p1.rootInstance:FindFirstChildOfClass("FaceControls")
		
		if faceControls and faceControls:HasOverrideFACSData() then
			p0:fail(errorSourceStringsModule.Keys.FaceControlsOverrideFACSNotEmpty, nil, if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then faceControls else nil)
		end
	end
}