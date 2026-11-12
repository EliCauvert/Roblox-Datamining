local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local ReactModule = require(AmpV2Wizard.Parent.React)
local _ = require(AmpV2Wizard.ComponentRegistry)
local _ = require(AmpV2Wizard.Types)
local GetFFlagAmpV2WizardDebugUnknownNodesModule = require(AmpV2Wizard.getFFlagAmpV2WizardDebugUnknownNodes)
local IsParentModeThemedNodeModule = require(AmpV2Wizard.isParentModeThemedNode)
local GetParentModeChromeThemeStoreModule = require(AmpV2Wizard.getParentModeChromeThemeStore)
local FFlagAmpV2WizardServerParentFacingModule = require(AmpV2Wizard.FFlagAmpV2WizardServerParentFacing)
local _ = require(AmpV2Wizard.usePresentedOverPage)

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: GetFFlagAmpV2WizardDebugUnknownNodesModule (copy), FFlagAmpV2WizardServerParentFacingModule (copy), IsParentModeThemedNodeModule (copy), ReactModule (copy), GetParentModeChromeThemeStoreModule (copy)
	local IsParentFacing = false
	
	if not p1 and (not p2 and (p3 ~= nil and (p5 ~= nil or GetFFlagAmpV2WizardDebugUnknownNodesModule()))) then
		local Node = if p6 == nil then p3 else p6.node
		IsParentFacing = if FFlagAmpV2WizardServerParentFacingModule then Node.behavior ~= nil and Node.behavior.parentFacing == true else IsParentModeThemedNodeModule(Node.type, p4)
	end
	ReactModule.useLayoutEffect(function()
		-- upvalues: GetParentModeChromeThemeStoreModule (upval), IsParentFacing (ref)
		GetParentModeChromeThemeStoreModule(false).setIsActive(IsParentFacing)
	end, { IsParentFacing })
	ReactModule.useLayoutEffect(function()
		-- upvalues: GetParentModeChromeThemeStoreModule (upval)
		return function()
			-- upvalues: GetParentModeChromeThemeStoreModule (upval)
			GetParentModeChromeThemeStoreModule(false).setIsActive(false)
		end
	end, {})
end