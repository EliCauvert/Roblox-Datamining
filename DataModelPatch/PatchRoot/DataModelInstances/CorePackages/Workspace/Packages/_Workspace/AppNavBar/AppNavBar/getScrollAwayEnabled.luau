local Parent = script.Parent.Parent
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagAppIaScrollAwayGuac = SharedFlagsModule.FFlagAppIaScrollAwayGuac
local EnableFlyoutWithScrollAway2 = game:DefineFastFlag("EnableFlyoutWithScrollAway2", false)
local FlyoutSidePanelIXP = require(Parent.SharedExperimentDefinition).FlyoutSidePanelIXP

local function _(): boolean
	-- upvalues: FFlagAppIaScrollAway (copy), FFlagAppIaScrollAwayGuac (copy), UniversalAppPolicyModule (copy), EnableFlyoutWithScrollAway2 (copy), FlyoutSidePanelIXP (copy)
	return if FFlagAppIaScrollAway then (not FFlagAppIaScrollAwayGuac or UniversalAppPolicyModule.getAppFeaturePolicies().getAppIaScrollAwayEnabled()) and (if EnableFlyoutWithScrollAway2 and FlyoutSidePanelIXP.isScrollAwayEnabled() then true else false) else false
end

local v1 = nil

return function(): boolean
	-- upvalues: v1 (ref), FFlagAppIaScrollAway (copy), FFlagAppIaScrollAwayGuac (copy), UniversalAppPolicyModule (copy), EnableFlyoutWithScrollAway2 (copy), FlyoutSidePanelIXP (copy)
	if v1 == nil then
		v1 = if FFlagAppIaScrollAway then (not FFlagAppIaScrollAwayGuac or UniversalAppPolicyModule.getAppFeaturePolicies().getAppIaScrollAwayEnabled()) and (if EnableFlyoutWithScrollAway2 and FlyoutSidePanelIXP.isScrollAwayEnabled() then true else false) else false
	end
	return v1
end