local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local AXTooltip = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.AXTooltip
local SelectIsPortraitModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local AXFilterButtonExpiredItemsTooltip = game:DefineFastString("AXFilterButtonExpiredItemsTooltip", "AXFilterButtonExpiredItemsTooltip")

return function(p1)
	-- upvalues: UseSelectorFunction (copy), SelectIsPortraitModule (copy), ReactModule (copy), AXTooltip (copy), AXFilterButtonExpiredItemsTooltip (copy)
	return ReactModule.createElement(AXTooltip, {
		showTooltip = true,
		tooltipLocalizationKey = "Feature.Avatar.tooltip.ExpiredItemsFilter",
		popoverSide = if UseSelectorFunction(SelectIsPortraitModule) then "Top" else "Bottom",
		tooltipStorageKey = AXFilterButtonExpiredItemsTooltip,
		dismissTooltipRef = p1.dismissTooltipRef
	})
end