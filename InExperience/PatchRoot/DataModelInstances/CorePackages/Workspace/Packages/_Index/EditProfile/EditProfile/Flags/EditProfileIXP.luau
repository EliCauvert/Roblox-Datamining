local parent = script:FindFirstAncestor("EditProfile").Parent
local getFStringSelfProfileView = require(parent.SharedFlags).getFStringSelfProfileView
local useUserExperiment = require(parent.RoactAppExperiment).useUserExperiment
local fFlagEditProfileSetupNewExperimentFlowModule = require(script.Parent.FFlagEditProfileSetupNewExperimentFlow)
local editProfileExperimentKey = game:DefineFastString("EditProfileExperimentKey", "can_view_edit_profile")

local var2 = function(p0)
	-- upvalues: getFStringSelfProfileView (ref), fFlagEditProfileSetupNewExperimentFlowModule (ref), editProfileExperimentKey (ref)
	local var3 = (p0 or {})[getFStringSelfProfileView()] or {}
	
	return if fFlagEditProfileSetupNewExperimentFlowModule then var3[editProfileExperimentKey] == true else var3.can_view_edit_profile == true
end

return {
	isExperimentEnabled = var2,
	useIsExperimentEnabled = function(p1)
		-- upvalues: useUserExperiment (ref), getFStringSelfProfileView (ref), var2 (ref)
		return useUserExperiment({ getFStringSelfProfileView() }, var2, if p1 then p1.isExposureEnabled else nil)
	end
}