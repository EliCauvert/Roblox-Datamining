local EngagementScreen = script:FindFirstAncestor("EngagementScreen")
local Parent = EngagementScreen.Parent
local ReactModule = require(Parent.React)
local EngagementScreenModule = require(EngagementScreen.Components.EngagementScreen)
local UseEngagementScreenPropsModule = require(EngagementScreen.Components.useEngagementScreenProps)
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies

return function()
	-- upvalues: ReactModule (copy), EngagementScreenModule (copy), UseEngagementScreenPropsModule (copy), GetAppFeaturePoliciesFunction (copy)
	return ReactModule.createElement(EngagementScreenModule, UseEngagementScreenPropsModule({
		useSingleSignOn = GetAppFeaturePoliciesFunction().getUseSingleSignOn(),
		allowPlatformAccountSwitching = GetAppFeaturePoliciesFunction().getAllowPlatformAccountSwitching()
	}))
end