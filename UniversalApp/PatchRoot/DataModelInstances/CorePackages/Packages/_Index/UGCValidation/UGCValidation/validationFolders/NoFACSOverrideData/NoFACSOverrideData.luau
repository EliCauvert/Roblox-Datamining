local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

return {
	categories = { ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD },
	requiredData = { ValidationEnumsModule.SharedDataMember.rootInstance },
	fflag = require(Parent.flags.getEngineFeatureUGCValidateCheckFacsDisableOverride),
	run = function(p1, p2) --[[ Line: 12 ]]
		-- upvalues: ErrorSourceStringsModule (copy)
		local FaceControls = p2.rootInstance:FindFirstChildOfClass("FaceControls")
		
		if FaceControls and FaceControls:HasOverrideFACSData() then
			p1:fail(ErrorSourceStringsModule.Keys.FaceControlsOverrideFACSNotEmpty, nil, FaceControls)
		end
	end
}