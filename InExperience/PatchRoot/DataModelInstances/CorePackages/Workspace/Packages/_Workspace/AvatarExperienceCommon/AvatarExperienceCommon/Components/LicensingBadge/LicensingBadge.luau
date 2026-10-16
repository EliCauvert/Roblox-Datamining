local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseEarlyIsFocusedFunction = require(Parent.Navigation).useEarlyIsFocused
local AXTooltip = require(Parent.AvatarExperienceUIKit).AXTooltipComponents.AXTooltip
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXMarketplaceLicensingItemDetails = AvatarExperienceFlagsModule.FFlagAXMarketplaceLicensingItemDetails
local FFlagAXMarketplaceLicensingItemCards = AvatarExperienceFlagsModule.FFlagAXMarketplaceLicensingItemCards
local ItemLicenseType = require(Parent.AvatarExperienceModel).Enums.ItemLicenseType
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local BadgeSize = FoundationModule.Enums.BadgeSize
local BadgeShape = FoundationModule.Enums.BadgeShape
local config = {
	[ItemLicenseType.FirstParty] = {
		label = "Feature.Catalog.Label.LicensingOfficial",
		info = "Feature.Catalog.Label.LicensingOfficialInfo",
		passiveVariant = BadgeVariant.Contrast
	},
	[ItemLicenseType.ThirdParty] = {
		label = "Feature.Catalog.Label.LicensingLicensed",
		info = "Feature.Catalog.Label.LicensingLicensedInfo",
		passiveVariant = BadgeVariant.OverMedia
	}
}

local function PassiveLicensingBadge(Frame) --[[ Line: 74 ]]
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), FoundationModule (copy), BadgeSize (copy)
	return ReactModule.createElement(FoundationModule.Badge, {
		testId = "LicensingBadge",
		text = UseLocalizationFunction({ label = Frame.config.label }).label,
		variant = Frame.config.passiveVariant,
		size = Frame.passiveSize or BadgeSize.Small,
		LayoutOrder = Frame.LayoutOrder,
		onAbsoluteSizeChanged = Frame.onAbsoluteSizeChanged
	})
end

local function InteractiveLicensingBadge(Frame) --[[ Line: 89 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), UseLocalizationFunction (copy), FFlagAXMarketplaceLicensingItemDetails (copy), UseEarlyIsFocusedFunction (copy), FoundationModule (copy), BadgeVariant (copy), BadgeSize (copy), BadgeShape (copy), AXTooltip (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseLocalizationResult = UseLocalizationFunction({ label = Frame.config.label, info = Frame.config.info })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 98 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p1): boolean --[[ Line: 99 ]]
			return not p1
		end)
	end, {})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 104 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	ReactModule.useImperativeHandle(Frame.dismissTooltipRef, function() --[[ Line: 108 ]]
		-- upvalues: UseResult1 (copy)
		return UseResult1
	end, { UseResult1 })
	
	if FFlagAXMarketplaceLicensingItemDetails then
		local UseEarlyIsFocusedResult = UseEarlyIsFocusedFunction()
		ReactModule.useEffect(function() --[[ Line: 117 ]]
			-- upvalues: UseEarlyIsFocusedResult (copy), UseResult1 (copy)
			if not UseEarlyIsFocusedResult then
				UseResult1()
			end
		end, { UseEarlyIsFocusedResult, UseResult1 })
	end
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy",
		testId = "LicensingBadge",
		LayoutOrder = Frame.LayoutOrder,
		onActivated = UseResult,
		onAbsoluteSizeChanged = Frame.onAbsoluteSizeChanged
	}, {
		Badge = ReactModule.createElement(FoundationModule.Badge, {
			text = UseLocalizationResult.label,
			variant = BadgeVariant.Standard,
			size = BadgeSize.Small,
			shape = BadgeShape.Box
		}),
		Tooltip = ReactModule.createElement(AXTooltip, {
			isOpen = UseStateResult,
			popoverSide = Frame.popoverSide or "Bottom",
			tooltipText = UseLocalizationResult.info,
			maxWidth = UseTokensResult.Size.Size_1200 * 3,
			onTooltipActivated = UseResult1
		})
	})
end

return ReactModule.memo(function(Tbl) --[[ Line: 147 | Named "LicensingBadge" ]]
	-- upvalues: config (copy), FFlagAXMarketplaceLicensingItemCards (copy), ReactModule (copy), PassiveLicensingBadge (copy), InteractiveLicensingBadge (copy)
	local Copy = table.clone(Tbl)
	Copy.config = config[Tbl.itemLicensingInfo.licenseType]
	
	return if FFlagAXMarketplaceLicensingItemCards and Tbl.isInteractive == false then ReactModule.createElement(PassiveLicensingBadge, Copy) else ReactModule.createElement(InteractiveLicensingBadge, Copy)
end)