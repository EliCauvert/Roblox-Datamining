local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useEarlyIsFocused = require(parent.Navigation).useEarlyIsFocused
local AXTooltip = require(parent.AvatarExperienceUIKit).AXTooltipComponents.AXTooltip
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXMarketplaceLicensingItemDetails = avatarExperienceFlagsModule.FFlagAXMarketplaceLicensingItemDetails
local fFlagAXMarketplaceLicensingItemCards = avatarExperienceFlagsModule.FFlagAXMarketplaceLicensingItemCards
local itemLicenseType = require(parent.AvatarExperienceModel).Enums.ItemLicenseType
local badgeVariant = foundationModule.Enums.BadgeVariant
local badgeSize = foundationModule.Enums.BadgeSize
local t = {
	[itemLicenseType.FirstParty] = {
		label = "Feature.Catalog.Label.LicensingOfficial",
		info = "Feature.Catalog.Label.LicensingOfficialInfo",
		passiveVariant = badgeVariant.Contrast
	},
	[itemLicenseType.ThirdParty] = {
		label = "Feature.Catalog.Label.LicensingLicensed",
		info = "Feature.Catalog.Label.LicensingLicensedInfo",
		passiveVariant = badgeVariant.OverMedia
	}
}

local function PassiveLicensingBadge(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), foundationModule (ref), badgeSize (ref)
	return reactModule.createElement(foundationModule.Badge, {
		testId = "LicensingBadge",
		text = useLocalization({ label = p1.config.label }).label,
		variant = p1.config.passiveVariant,
		size = p1.passiveSize or badgeSize.Small,
		LayoutOrder = p1.LayoutOrder,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged
	})
end

local function InteractiveLicensingBadge(p1)
	-- upvalues: useTokens (ref), reactModule (ref), useLocalization (ref), fFlagAXMarketplaceLicensingItemDetails (ref), useEarlyIsFocused (ref), foundationModule (ref), badgeVariant (ref), badgeSize (ref), AXTooltip (ref)
	local var1 = useTokens()
	local var2, var3 = reactModule.useState(false)
	local var4 = useLocalization({ label = p1.config.label, info = p1.config.info })
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
end

return reactModule.memo(function(p1)
	-- upvalues: t (ref), fFlagAXMarketplaceLicensingItemCards (ref), reactModule (ref), PassiveLicensingBadge (ref), InteractiveLicensingBadge (ref)
	local cloned = table.clone(p1)
	cloned.config = t[p1.itemLicensingInfo.licenseType]
	
	return if fFlagAXMarketplaceLicensingItemCards and p1.isInteractive == false then reactModule.createElement(PassiveLicensingBadge, cloned) else reactModule.createElement(InteractiveLicensingBadge, cloned)
end)