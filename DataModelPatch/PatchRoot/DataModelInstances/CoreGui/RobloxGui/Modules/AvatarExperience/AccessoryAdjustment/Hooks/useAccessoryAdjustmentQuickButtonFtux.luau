local SafeAppStorageService = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceCommon).Lib.SafeAppStorageService
local AXAccessoryAdjustmentFtuxUseMemStorage = game:DefineFastFlag("AXAccessoryAdjustmentFtuxUseMemStorage", false)

return function()
	-- upvalues: SafeAppStorageService (copy), AXAccessoryAdjustmentFtuxUseMemStorage (copy)
	return {
		shouldShowFirstTimeGlow = function(): boolean
			-- upvalues: SafeAppStorageService (upval), AXAccessoryAdjustmentFtuxUseMemStorage (upval)
			return SafeAppStorageService.getItem("AXMarketplaceAccessoryAdjustmentQuickButtonFTUX", AXAccessoryAdjustmentFtuxUseMemStorage) ~= "SEEN"
		end,
		completeFirstTimeGlow = function()
			-- upvalues: SafeAppStorageService (upval), AXAccessoryAdjustmentFtuxUseMemStorage (upval)
			SafeAppStorageService.setItem("AXMarketplaceAccessoryAdjustmentQuickButtonFTUX", "SEEN", AXAccessoryAdjustmentFtuxUseMemStorage)
			SafeAppStorageService.flush()
		end
	}
end