local Parent = script:FindFirstAncestor("EditProfile").Parent
local GetFStringSelfProfileViewFunction = require(Parent.SharedFlags).getFStringSelfProfileView
local UseUserExperimentFunction = require(Parent.RoactAppExperiment).useUserExperiment
local FFlagEditProfileSetupNewExperimentFlowModule = require(script.Parent.FFlagEditProfileSetupNewExperimentFlow)
local EditProfileExperimentKey = game:DefineFastString("EditProfileExperimentKey", "can_view_edit_profile")

local function IsExperimentEnabled(p1): boolean --[[ Line: 11 ]]
	-- upvalues: GetFStringSelfProfileViewFunction (copy), FFlagEditProfileSetupNewExperimentFlowModule (copy), EditProfileExperimentKey (copy)
	local Entry = (p1 or {})[GetFStringSelfProfileViewFunction()] or {}
	
	return if FFlagEditProfileSetupNewExperimentFlowModule then Entry[EditProfileExperimentKey] == true else Entry.can_view_edit_profile == true
end

return {
	isExperimentEnabled = IsExperimentEnabled,
	useIsExperimentEnabled = function(p1) --[[ Line: 25 ]]
		-- upvalues: UseUserExperimentFunction (copy), GetFStringSelfProfileViewFunction (copy), IsExperimentEnabled (copy)
		return UseUserExperimentFunction({ GetFStringSelfProfileViewFunction() }, IsExperimentEnabled, if p1 then p1.isExposureEnabled else nil)
	end
}