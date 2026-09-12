local parent = script:FindFirstAncestor("AccountUpgrade").Parent
local useBrowserTrackerExperiment = require(parent.RoactAppExperiment).useBrowserTrackerExperiment
local appBtidLayers = require(parent.ExperimentLayers).AppBtidLayers
local sharedFlagsModule = require(parent.SharedFlags)
local resolveBirthdaySelectVariant = require(parent.AuthSignup).Util.resolveBirthdaySelectVariant
local getFFlagSignUpBirthdayPickerRequireManualSelection = sharedFlagsModule.GetFFlagSignUpBirthdayPickerRequireManualSelection
local getFIntSignUpBirthdayPickerManualSelectVariantOverride = sharedFlagsModule.GetFIntSignUpBirthdayPickerManualSelectVariantOverride

return function()
	-- upvalues: useBrowserTrackerExperiment (ref), appBtidLayers (ref), resolveBirthdaySelectVariant (ref), getFFlagSignUpBirthdayPickerRequireManualSelection (ref), getFIntSignUpBirthdayPickerManualSelectVariantOverride (ref)
	return resolveBirthdaySelectVariant(getFFlagSignUpBirthdayPickerRequireManualSelection(), getFIntSignUpBirthdayPickerManualSelectVariantOverride(), useBrowserTrackerExperiment({ appBtidLayers.SignupLayer }, function(p1)
		-- upvalues: appBtidLayers (copy)
		return {
			birthdayManualSelectVariant = (p1[appBtidLayers.SignupLayer] or {}).birthdayManualSelectVariant
		}
	end, false).birthdayManualSelectVariant)
end