local CorePackages = game:GetService("CorePackages")
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local NavigateDownToAvatarScreenModule = require(script:FindFirstAncestor("Modules").AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.NavigateDownToAvatarScreen)
local FFlagAXFixPurchaseSurfaceLogging = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXFixPurchaseSurfaceLogging

return function(ItemId, ItemType, _, p1, p2)
	-- upvalues: FFlagAXFixPurchaseSurfaceLogging (copy), NavigateDownToAvatarScreenModule (copy), AvatarScreen (copy)
	return function(p3)
		-- upvalues: ItemType (copy), ItemId (copy), FFlagAXFixPurchaseSurfaceLogging (upval), p1 (copy), p2 (copy), NavigateDownToAvatarScreenModule (upval), AvatarScreen (upval)
		p3:dispatch(NavigateDownToAvatarScreenModule(AvatarScreen.ItemDetails, ItemType .. ItemId, {
			mountAsFullView = true,
			mountAnimation = false,
			itemId = ItemId,
			itemType = ItemType,
			fromProfile = not FFlagAXFixPurchaseSurfaceLogging or p1,
			fromSurface = if FFlagAXFixPurchaseSurfaceLogging then p2 else nil,
			itemDetailsPeekViewRefs = {}
		}))
	end
end