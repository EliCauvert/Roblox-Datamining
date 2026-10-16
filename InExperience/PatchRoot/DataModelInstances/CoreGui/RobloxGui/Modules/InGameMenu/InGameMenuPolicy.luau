local CorePackages = game:GetService("CorePackages")
local PolicyProvider = require(CorePackages.Packages.InGameMenuDependencies).PolicyProvider
local GetFFlagGateEducationalPopupVisibilityViaGUACFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagGateEducationalPopupVisibilityViaGUAC
local WithGetPolicyImplementationResult = PolicyProvider.withGetPolicyImplementation((PolicyProvider.GetPolicyImplementations.MemStorageService("app-policy")))
local GetFIntEducationalPopupDisplayMaxCountModule = require(script.Parent.Parent.Flags.GetFIntEducationalPopupDisplayMaxCount)
local IsSubjectToDesktopPoliciesFunction = require(CorePackages.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies

function WithGetPolicyImplementationResult.Mapper(p1) --[[ Line: 15 ]]
	-- upvalues: IsSubjectToDesktopPoliciesFunction (copy), GetFFlagGateEducationalPopupVisibilityViaGUACFunction (copy), GetFIntEducationalPopupDisplayMaxCountModule (copy)
	return {
		enableInGameHomeIcon = function() --[[ Line: 17 ]]
			-- upvalues: IsSubjectToDesktopPoliciesFunction (upval)
			return IsSubjectToDesktopPoliciesFunction()
		end,
		enableEducationalPopup = function() --[[ Line: 21 ]]
			-- upvalues: IsSubjectToDesktopPoliciesFunction (upval), GetFFlagGateEducationalPopupVisibilityViaGUACFunction (upval), p1 (copy)
			local NativeCloseInterceptEngineFeature = game:GetEngineFeature("NativeCloseIntercept")
			
			return if IsSubjectToDesktopPoliciesFunction() and NativeCloseInterceptEngineFeature then not GetFFlagGateEducationalPopupVisibilityViaGUACFunction() or (p1.InExperienceCanViewEducationalPopup == nil or p1.InExperienceCanViewEducationalPopup) else false
		end,
		educationalPopupMaxDisplayCount = function() --[[ Line: 34 ]]
			-- upvalues: IsSubjectToDesktopPoliciesFunction (upval), GetFIntEducationalPopupDisplayMaxCountModule (upval)
			return IsSubjectToDesktopPoliciesFunction() and GetFIntEducationalPopupDisplayMaxCountModule() or 0
		end,
		getGameInfoShowChatFeatures = function(): boolean --[[ Line: 38 ]]
			return false
		end,
		enableFullscreenTitleBar = function() --[[ Line: 42 ]]
			-- upvalues: p1 (copy)
			return p1.FullscreenTitleBarEnabled or false
		end,
		getDisplayCheckboxInVoiceConsent = function() --[[ Line: 46 ]]
			-- upvalues: p1 (copy)
			return p1.DisplayCheckboxInVoiceConsent == nil or p1.DisplayCheckboxInVoiceConsent
		end
	}
end

return WithGetPolicyImplementationResult