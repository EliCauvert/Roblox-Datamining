local parent = script.Parent.Parent
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAppIaScrollAway = sharedFlagsModule.FFlagAppIaScrollAway
local fFlagAppIaScrollAwayGuac = sharedFlagsModule.FFlagAppIaScrollAwayGuac
local enableFlyoutWithScrollAway2 = game:DefineFastFlag("EnableFlyoutWithScrollAway2", false)
local flyoutSidePanelIXP = require(parent.SharedExperimentDefinition).FlyoutSidePanelIXP

local function _()
	-- upvalues: fFlagAppIaScrollAway (ref), fFlagAppIaScrollAwayGuac (ref), universalAppPolicyModule (ref), enableFlyoutWithScrollAway2 (ref), flyoutSidePanelIXP (ref)
	return if fFlagAppIaScrollAway then if fFlagAppIaScrollAwayGuac and not universalAppPolicyModule.getAppFeaturePolicies().getAppIaScrollAwayEnabled() then false else enableFlyoutWithScrollAway2 and flyoutSidePanelIXP.isScrollAwayEnabled() else false
end

local var1 = nil

return function()
	-- upvalues: var1 (write), fFlagAppIaScrollAway (ref), fFlagAppIaScrollAwayGuac (ref), universalAppPolicyModule (ref), enableFlyoutWithScrollAway2 (ref), flyoutSidePanelIXP (ref)
	if var1 == nil then
		var1 = not fFlagAppIaScrollAway and (if fFlagAppIaScrollAwayGuac and not universalAppPolicyModule.getAppFeaturePolicies().getAppIaScrollAwayEnabled() then false elseif enableFlyoutWithScrollAway2 and flyoutSidePanelIXP.isScrollAwayEnabled() then true else false)
	end
	return var1
end