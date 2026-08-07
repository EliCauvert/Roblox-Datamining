local corePackagesService = game:GetService("CorePackages")
local policyProvider = require(corePackagesService.Packages.InGameMenuDependencies).PolicyProvider
local sharedFlags = corePackagesService.Workspace.Packages.SharedFlags
local getFFlagUseVoiceExitBetaLanguage = require(sharedFlags).GetFFlagUseVoiceExitBetaLanguage
local getFFlagGateEducationalPopupVisibilityViaGUAC = require(sharedFlags).GetFFlagGateEducationalPopupVisibilityViaGUAC
local var1 = policyProvider.withGetPolicyImplementation(policyProvider.GetPolicyImplementations.MemStorageService("app-policy"))
local getFIntEducationalPopupDisplayMaxCountModule = require(script.Parent.Parent.Flags.GetFIntEducationalPopupDisplayMaxCount)
local isSubjectToDesktopPolicies = require(corePackagesService.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies

function var1.Mapper(p0) --[[ line: 16 ]]
	-- upvalues: isSubjectToDesktopPolicies (ref), getFFlagGateEducationalPopupVisibilityViaGUAC (ref), getFIntEducationalPopupDisplayMaxCountModule (ref), getFFlagUseVoiceExitBetaLanguage (ref)
	return {
		enableInGameHomeIcon = function() --[[ line: 18 ]]
			-- upvalues: isSubjectToDesktopPolicies (copy)
			return isSubjectToDesktopPolicies()
		end,
		enableEducationalPopup = function() --[[ line: 22 ]]
			-- upvalues: isSubjectToDesktopPolicies (copy), getFFlagGateEducationalPopupVisibilityViaGUAC (copy), p0 (ref)
			return not (not isSubjectToDesktopPolicies() or not game:GetEngineFeature("NativeCloseIntercept")) and (if getFFlagGateEducationalPopupVisibilityViaGUAC() then p0.InExperienceCanViewEducationalPopup == nil or p0.InExperienceCanViewEducationalPopup else true)
		end,
		educationalPopupMaxDisplayCount = function() --[[ line: 35 ]]
			-- upvalues: isSubjectToDesktopPolicies (copy), getFIntEducationalPopupDisplayMaxCountModule (copy)
			return isSubjectToDesktopPolicies() and getFIntEducationalPopupDisplayMaxCountModule() or 0
		end,
		getGameInfoShowChatFeatures = function() --[[ line: 39 ]]
			-- upvalues: getFFlagUseVoiceExitBetaLanguage (copy), p0 (ref)
			return if getFFlagUseVoiceExitBetaLanguage() then p0.GameInfoShowChatFeatures or false else false
		end,
		enableFullscreenTitleBar = function() --[[ line: 46 ]]
			-- upvalues: p0 (ref)
			return p0.FullscreenTitleBarEnabled or false
		end,
		getDisplayCheckboxInVoiceConsent = function() --[[ line: 50 ]]
			-- upvalues: p0 (ref)
			return p0.DisplayCheckboxInVoiceConsent == nil or p0.DisplayCheckboxInVoiceConsent
		end
	}
end

return var1