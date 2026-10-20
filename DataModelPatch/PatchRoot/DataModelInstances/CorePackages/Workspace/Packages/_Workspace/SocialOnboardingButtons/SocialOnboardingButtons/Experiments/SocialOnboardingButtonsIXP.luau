local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ColorVariantsEnumModule = require(Parent.Enums.ColorVariantsEnum)
local UseUserExperimentFunction = require(Parent1.RoactAppExperiment).useUserExperiment
local FStringSocialOnboardingExperimentLayer = require(Parent1.SharedFlags).FStringSocialOnboardingExperimentLayer
local SocialOnboardingEnabledVariableName = game:DefineFastString("SocialOnboardingEnabledVariableName", "socialOnboardingBtnsEnabled")
local SocialOnboardingColorVariableName = game:DefineFastString("SocialOnboardingColorVariableName", "socialOnboardingBtnsColor")
local SocialOnboardingButtonsVariableName = game:DefineFastString("SocialOnboardingButtonsVariableName", "socialOnboardingButtons")
local SocialOnboardingHideAfterSignupVariableNam = game:DefineFastString("SocialOnboardingHideAfterSignupVariableNam", "hideAfterSignup")

local function v8(p1)
	-- upvalues: FStringSocialOnboardingExperimentLayer (copy), SocialOnboardingEnabledVariableName (copy)
	return (p1[FStringSocialOnboardingExperimentLayer] or {})[SocialOnboardingEnabledVariableName] or false
end

local function v9(p1)
	-- upvalues: FStringSocialOnboardingExperimentLayer (copy), SocialOnboardingColorVariableName (copy), ColorVariantsEnumModule (copy)
	return (p1[FStringSocialOnboardingExperimentLayer] or {})[SocialOnboardingColorVariableName] or ColorVariantsEnumModule.Default
end

local function v10(p1)
	-- upvalues: FStringSocialOnboardingExperimentLayer (copy), SocialOnboardingButtonsVariableName (copy)
	return (p1[FStringSocialOnboardingExperimentLayer] or {})[SocialOnboardingButtonsVariableName] or ""
end

local function v11(p1)
	-- upvalues: FStringSocialOnboardingExperimentLayer (copy), SocialOnboardingHideAfterSignupVariableNam (copy)
	return (p1[FStringSocialOnboardingExperimentLayer] or {})[SocialOnboardingHideAfterSignupVariableNam] or false
end

return {
	useSocialOnboardingBtnsEnabled = function()
		-- upvalues: UseUserExperimentFunction (copy), FStringSocialOnboardingExperimentLayer (copy), v8 (copy)
		return UseUserExperimentFunction({ FStringSocialOnboardingExperimentLayer }, v8)
	end,
	useSocialOnboardingBtnsColor = function()
		-- upvalues: UseUserExperimentFunction (copy), FStringSocialOnboardingExperimentLayer (copy), v9 (copy)
		return UseUserExperimentFunction({ FStringSocialOnboardingExperimentLayer }, v9)
	end,
	useSocialOnboardingBtnsOrder = function()
		-- upvalues: UseUserExperimentFunction (copy), FStringSocialOnboardingExperimentLayer (copy), v10 (copy)
		return UseUserExperimentFunction({ FStringSocialOnboardingExperimentLayer }, v10)
	end,
	useSocialOnboardingBtnsHideAfterSignup = function()
		-- upvalues: UseUserExperimentFunction (copy), FStringSocialOnboardingExperimentLayer (copy), v11 (copy)
		return UseUserExperimentFunction({ FStringSocialOnboardingExperimentLayer }, v11)
	end
}