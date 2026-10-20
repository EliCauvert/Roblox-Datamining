local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local Badge = FoundationModule.Badge
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local FFlagEnableNonFlyoutUncheckedBadge = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableNonFlyoutUncheckedBadge

return ReactModule.memo(function(p1)
	-- upvalues: FFlagEnableNonFlyoutUncheckedBadge (copy), UseAppPolicyFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), Badge (copy), BadgeVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({ Unchecked = "CommonUI.Features.Label.Unchecked" })
	
	return if if FFlagEnableNonFlyoutUncheckedBadge then UseAppPolicyFunction(function(p2)
		return p2.getShowUncheckedBadge()
	end) else false then ReactModule.createElement(Badge, {
		text = UseLocalizationResult.Unchecked,
		variant = BadgeVariant.Neutral,
		LayoutOrder = p1.layoutOrder
	}) else nil
end)