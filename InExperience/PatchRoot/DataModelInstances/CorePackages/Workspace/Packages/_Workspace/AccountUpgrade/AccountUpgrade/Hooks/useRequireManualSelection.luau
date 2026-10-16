local Parent = script:FindFirstAncestor("AccountUpgrade").Parent
local UseBrowserTrackerExperimentFunction = require(Parent.RoactAppExperiment).useBrowserTrackerExperiment
local AppBtidLayers = require(Parent.ExperimentLayers).AppBtidLayers
local SharedFlagsModule = require(Parent.SharedFlags)
local ResolveBirthdaySelectVariantFunction = require(Parent.AuthSignup).Util.resolveBirthdaySelectVariant
local GetFFlagSignUpBirthdayPickerRequireManualSelectionFunction = SharedFlagsModule.GetFFlagSignUpBirthdayPickerRequireManualSelection
local GetFIntSignUpBirthdayPickerManualSelectVariantOverrideFunction = SharedFlagsModule.GetFIntSignUpBirthdayPickerManualSelectVariantOverride

return function() --[[ Line: 17 | Named "useRequireManualSelection" ]]
	-- upvalues: UseBrowserTrackerExperimentFunction (copy), AppBtidLayers (copy), ResolveBirthdaySelectVariantFunction (copy), GetFFlagSignUpBirthdayPickerRequireManualSelectionFunction (copy), GetFIntSignUpBirthdayPickerManualSelectVariantOverrideFunction (copy)
	return ResolveBirthdaySelectVariantFunction(GetFFlagSignUpBirthdayPickerRequireManualSelectionFunction(), GetFIntSignUpBirthdayPickerManualSelectVariantOverrideFunction(), UseBrowserTrackerExperimentFunction({ AppBtidLayers.SignupLayer }, function(p1) --[[ Line: 23 ]]
		-- upvalues: AppBtidLayers (upval)
		return {
			birthdayManualSelectVariant = (p1[AppBtidLayers.SignupLayer] or {}).birthdayManualSelectVariant
		}
	end, false).birthdayManualSelectVariant)
end