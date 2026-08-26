local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)

return {
	categories = { validationEnumsModule.UploadCategory.DYNAMIC_HEAD },
	requiredData = { validationEnumsModule.SharedDataMember.rootInstance },
	fflag = require(parent.flags.getEngineFeatureUGCValidateCheckFacsDisableOverride),
	run = function(p1, p2)
		-- upvalues: errorSourceStringsModule (ref)
		local faceControls = p2.rootInstance:FindFirstChildOfClass("FaceControls")
		
		if faceControls and faceControls:HasOverrideFACSData() then
			p1:fail(errorSourceStringsModule.Keys.FaceControlsOverrideFACSNotEmpty, nil, faceControls)
		end
	end
}