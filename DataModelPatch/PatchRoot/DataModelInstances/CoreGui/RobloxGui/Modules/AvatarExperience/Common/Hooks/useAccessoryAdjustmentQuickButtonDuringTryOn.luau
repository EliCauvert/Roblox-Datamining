local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local SelectAdjustableLastTryOnItem = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).State.Selectors.selectAdjustableLastTryOnItem
local UseAccessoryAdjustmentQuickButtonFtuxModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.AccessoryAdjustment.Hooks.useAccessoryAdjustmentQuickButtonFtux)
local AXEnableAccessoryAdjustmentDuringTryOnIXP = require(CorePackages.Workspace.Packages.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP

return function()
	-- upvalues: IxpUtilsModule (copy), AXEnableAccessoryAdjustmentDuringTryOnIXP (copy), UseAccessoryAdjustmentQuickButtonFtuxModule (copy), UseSelectorFunction (copy), SelectAdjustableLastTryOnItem (copy), ReactModule (copy)
	local TestVariable = IxpUtilsModule.readTestVariable(AXEnableAccessoryAdjustmentDuringTryOnIXP.EnabledForUser)
	local UseAccessoryAdjustmentQuickButtonFtuxModuleResult = UseAccessoryAdjustmentQuickButtonFtuxModule()
	local UseSelectorResult = UseSelectorFunction(SelectAdjustableLastTryOnItem)
	ReactModule.useEffect(function()
		-- upvalues: TestVariable (copy), UseAccessoryAdjustmentQuickButtonFtuxModuleResult (copy)
		if TestVariable and UseAccessoryAdjustmentQuickButtonFtuxModuleResult and UseAccessoryAdjustmentQuickButtonFtuxModuleResult.shouldShowFirstTimeGlow() then
			task.delay(10, function()
				-- upvalues: UseAccessoryAdjustmentQuickButtonFtuxModuleResult (upval)
				UseAccessoryAdjustmentQuickButtonFtuxModuleResult.completeFirstTimeGlow()
			end)
		end
	end, {
		TestVariable,
		UseAccessoryAdjustmentQuickButtonFtuxModuleResult
	})
	
	return {
		shouldEnableAccessoryAdjustmentDuringTryOn = TestVariable,
		adjustableLastTryOnItemId = UseSelectorResult,
		accessoryAdjustmentQuickButtonFtux = UseAccessoryAdjustmentQuickButtonFtuxModuleResult
	}
end