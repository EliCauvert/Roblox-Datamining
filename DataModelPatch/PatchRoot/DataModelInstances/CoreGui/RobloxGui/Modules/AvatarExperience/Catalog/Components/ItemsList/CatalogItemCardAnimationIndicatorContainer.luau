local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Packages.Foundation)
local ItemCardAnimationStateIndicator = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardAnimationStateIndicator
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types)
local UseCatalogItemCardAnimationIndicatorViewModelModule = require(script.Parent.useCatalogItemCardAnimationIndicatorViewModel)

return ReactModule.memo(function(p1)
	-- upvalues: UseCatalogItemCardAnimationIndicatorViewModelModule (copy), ReactModule (copy), ItemCardAnimationStateIndicator (copy)
	return ReactModule.createElement(ItemCardAnimationStateIndicator, {
		states = UseCatalogItemCardAnimationIndicatorViewModelModule(p1.bundleInfo).states,
		ZIndex = p1.ZIndex,
		paddingTop = p1.paddingTop,
		paddingBottom = p1.paddingBottom,
		paddingLeft = p1.paddingLeft,
		paddingRight = p1.paddingRight
	})
end)