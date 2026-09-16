local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useEarlyIsFocused = require(parent.Navigation).useEarlyIsFocused
local AXTooltip = require(parent.AvatarExperienceUIKit).AXTooltipComponents.AXTooltip
local fFlagAXMarketplaceLicensingItemDetails = require(parent.AvatarExperienceFlags).FFlagAXMarketplaceLicensingItemDetails
local itemLicenseType = require(parent.AvatarExperienceModel).Enums.ItemLicenseType
local badgeVariant = foundationModule.Enums.BadgeVariant
local badgeSize = foundationModule.Enums.BadgeSize
local t = {
	[itemLicenseType.FirstParty] = {
		label = "Feature.Catalog.Label.LicensingOfficial",
		info = "Feature.Catalog.Label.LicensingOfficialInfo"
	},
	[itemLicenseType.ThirdParty] = {
		label = "Feature.Catalog.Label.LicensingLicensed",
		info = "Feature.Catalog.Label.LicensingLicensedInfo"
	}
}

return reactModule.memo(function(p1)
	-- upvalues: t (ref), useTokens (ref), reactModule (ref), useLocalization (ref), fFlagAXMarketplaceLicensingItemDetails (ref), useEarlyIsFocused (ref), foundationModule (ref), badgeVariant (ref), badgeSize (ref), AXTooltip (ref)
	local licenseType = t[p1.licensing.licenseType]
	local var1 = useTokens()
	local var2, var3 = reactModule.useState(false)
	local var4 = useLocalization({ label = licenseType.label, info = licenseType.info })
	local var5 = reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		var3(function(p2)
			return not p2
		end)
	end, {})
	local var6 = reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		var3(false)
	end, {})
	reactModule.useImperativeHandle(p1.dismissTooltipRef, function()
		-- upvalues: var6 (ref)
		return var6
	end, { var6 })
	
	if fFlagAXMarketplaceLicensingItemDetails then
		local var7 = useEarlyIsFocused()
		reactModule.useEffect(function()
			-- upvalues: var7 (ref), var6 (ref)
			if not var7 then
				var6()
			end
		end, { var7, var6 })
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy",
		testId = "LicensingBadge",
		LayoutOrder = p1.LayoutOrder,
		onActivated = var5,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged
	}, {
		Badge = reactModule.createElement(foundationModule.Badge, {
			text = var4.label,
			variant = badgeVariant.Standard,
			size = badgeSize.Small
		}),
		Tooltip = reactModule.createElement(AXTooltip, {
			isOpen = var2,
			popoverSide = p1.popoverSide or "Bottom",
			tooltipText = var4.info,
			maxWidth = var1.Size.Size_1200 * 3,
			onTooltipActivated = var6
		})
	})
end)