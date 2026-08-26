local corePackagesService = game:GetService("CorePackages")
local policyProvider = require(corePackagesService.Packages.InGameMenuDependencies).PolicyProvider
local sharedFlags = corePackagesService.Workspace.Packages.SharedFlags
local getFFlagUseVoiceExitBetaLanguage = require(sharedFlags).GetFFlagUseVoiceExitBetaLanguage
local getFFlagGateEducationalPopupVisibilityViaGUAC = require(sharedFlags).GetFFlagGateEducationalPopupVisibilityViaGUAC
local var1 = policyProvider.withGetPolicyImplementation(policyProvider.GetPolicyImplementations.MemStorageService("app-policy"))
local getFIntEducationalPopupDisplayMaxCountModule = require(script.Parent.Parent.Flags.GetFIntEducationalPopupDisplayMaxCount)
local isSubjectToDesktopPolicies = require(corePackagesService.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies

function var1.Mapper(p1)
	-- upvalues: isSubjectToDesktopPolicies (ref), getFFlagGateEducationalPopupVisibilityViaGUAC (ref), getFIntEducationalPopupDisplayMaxCountModule (ref), getFFlagUseVoiceExitBetaLanguage (ref)
	return {
		enableInGameHomeIcon = function()
			-- upvalues: isSubjectToDesktopPolicies (copy)
			return isSubjectToDesktopPolicies()
		end,
		enableEducationalPopup = function()
			-- upvalues: isSubjectToDesktopPolicies (copy), getFFlagGateEducationalPopupVisibilityViaGUAC (copy), p1 (ref)
			return not (not isSubjectToDesktopPolicies() or not game:GetEngineFeature("NativeCloseIntercept")) and (if getFFlagGateEducationalPopupVisibilityViaGUAC() then p1.InExperienceCanViewEducationalPopup == nil or p1.InExperienceCanViewEducationalPopup else true)
		end,
		educationalPopupMaxDisplayCount = function()
			-- upvalues: isSubjectToDesktopPolicies (copy), getFIntEducationalPopupDisplayMaxCountModule (copy)
			return isSubjectToDesktopPolicies() and getFIntEducationalPopupDisplayMaxCountModule() or 0
		end,
		getGameInfoShowChatFeatures = function()
			-- upvalues: getFFlagUseVoiceExitBetaLanguage (copy), p1 (ref)
			return if getFFlagUseVoiceExitBetaLanguage() then p1.GameInfoShowChatFeatures or false else false
		end,
		enableFullscreenTitleBar = function()
			-- upvalues: p1 (ref)
			return p1.FullscreenTitleBarEnabled or false
		end,
		getDisplayCheckboxInVoiceConsent = function()
			-- upvalues: p1 (ref)
			return p1.DisplayCheckboxInVoiceConsent == nil or p1.DisplayCheckboxInVoiceConsent
		end
	}
end

return var1