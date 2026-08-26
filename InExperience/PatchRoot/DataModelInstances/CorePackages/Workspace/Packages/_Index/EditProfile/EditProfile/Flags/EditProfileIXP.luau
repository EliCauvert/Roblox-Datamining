local parent = script:FindFirstAncestor("EditProfile").Parent
local getFStringSelfProfileView = require(parent.SharedFlags).getFStringSelfProfileView
local useUserExperiment = require(parent.RoactAppExperiment).useUserExperiment
local fFlagEditProfileSetupNewExperimentFlowModule = require(script.Parent.FFlagEditProfileSetupNewExperimentFlow)
local editProfileExperimentKey = game:DefineFastString("EditProfileExperimentKey", "can_view_edit_profile")

local var1 = function(p1)
	-- upvalues: getFStringSelfProfileView (ref), fFlagEditProfileSetupNewExperimentFlowModule (ref), editProfileExperimentKey (ref)
	local var2 = (p1 or {})[getFStringSelfProfileView()] or {}
	
	return if fFlagEditProfileSetupNewExperimentFlowModule then var2[editProfileExperimentKey] == true else var2.can_view_edit_profile == true
end

return {
	isExperimentEnabled = var1,
	useIsExperimentEnabled = function(p1)
		-- upvalues: useUserExperiment (ref), getFStringSelfProfileView (ref), var1 (ref)
		return useUserExperiment({ getFStringSelfProfileView() }, var1, if p1 then p1.isExposureEnabled else nil)
	end
}