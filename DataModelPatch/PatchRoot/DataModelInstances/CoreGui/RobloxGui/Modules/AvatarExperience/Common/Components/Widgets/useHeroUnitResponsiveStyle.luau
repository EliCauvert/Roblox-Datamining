local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local AvatarExperienceCatalogModule = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local InputSize = FoundationModule.Enums.InputSize
local WidgetListBreakPointEnum = AvatarExperienceCatalogModule.Components.ResultsList.WidgetListBreakPointEnum
local GetBreakpointFromRowWidthFunction = AvatarExperienceCatalogModule.Utils.getBreakpointFromRowWidth
local UseTokensFunction = FoundationModule.Hooks.useTokens
local config = {
	[WidgetListBreakPointEnum.Default] = {
		isStacked = true,
		cardPaddingTag = "padding-medium",
		cardPaddingScale = "Medium",
		titleTag = "text-heading-small",
		descriptionTag = "text-body-medium",
		titleGroupGapTag = "gap-none",
		stackedBadgeGapTag = "gap-large",
		stackedSeamScale = "small",
		spotlightCardHeight = 166,
		spotlightButtonSize = InputSize.Small
	},
	[WidgetListBreakPointEnum.XSmall] = {
		isStacked = true,
		cardPaddingTag = "padding-medium",
		cardPaddingScale = "Medium",
		titleTag = "text-heading-small",
		descriptionTag = "text-body-medium",
		titleGroupGapTag = "gap-none",
		stackedBadgeGapTag = "gap-large",
		stackedSeamScale = "small",
		spotlightCardHeight = 166,
		spotlightButtonSize = InputSize.Small
	},
	[WidgetListBreakPointEnum.Small] = {
		isStacked = true,
		cardPaddingTag = "padding-medium",
		cardPaddingScale = "Medium",
		titleTag = "text-heading-small",
		descriptionTag = "text-body-medium",
		titleGroupGapTag = "gap-none",
		stackedBadgeGapTag = "gap-large",
		stackedSeamScale = "small",
		spotlightCardHeight = 180,
		spotlightButtonSize = InputSize.Small
	},
	[WidgetListBreakPointEnum.Medium] = {
		isStacked = true,
		cardPaddingTag = "padding-xxlarge",
		cardPaddingScale = "XXLarge",
		titleTag = "text-heading-small",
		descriptionTag = "text-body-medium",
		titleGroupGapTag = "gap-xsmall",
		stackedBadgeGapTag = "gap-xlarge",
		stackedSeamScale = "medium",
		spotlightCardHeight = 200,
		spotlightButtonSize = InputSize.Medium
	},
	[WidgetListBreakPointEnum.Large] = {
		isStacked = false,
		cardPaddingTag = "padding-xxlarge",
		cardPaddingScale = "XXLarge",
		titleTag = "text-heading-medium",
		descriptionTag = "text-body-large",
		titleGroupGapTag = "gap-xsmall",
		stackedBadgeGapTag = "gap-large",
		stackedSeamScale = "small",
		spotlightCardHeight = 225,
		spotlightButtonSize = InputSize.Medium
	},
	[WidgetListBreakPointEnum.XLarge] = {
		isStacked = false,
		cardPaddingTag = "padding-xxlarge",
		cardPaddingScale = "XXLarge",
		titleTag = "text-heading-medium",
		descriptionTag = "text-body-large",
		titleGroupGapTag = "gap-xsmall",
		stackedBadgeGapTag = "gap-large",
		stackedSeamScale = "small",
		spotlightCardHeight = 225,
		spotlightButtonSize = InputSize.Medium
	},
	[WidgetListBreakPointEnum.X2Large] = {
		isStacked = false,
		cardPaddingTag = "padding-xxlarge",
		cardPaddingScale = "XXLarge",
		titleTag = "text-heading-medium",
		descriptionTag = "text-body-large",
		titleGroupGapTag = "gap-xsmall",
		stackedBadgeGapTag = "gap-large",
		stackedSeamScale = "small",
		spotlightCardHeight = 225,
		spotlightButtonSize = InputSize.Medium
	}
}
local Entry = config[WidgetListBreakPointEnum.Default]

return function(p1)
	-- upvalues: UseTokensFunction (copy), GetBreakpointFromRowWidthFunction (copy), ReactModule (copy), config (copy), Entry (copy)
	local UseTokensResult = UseTokensFunction()
	local BreakpointFromRowWidth = GetBreakpointFromRowWidthFunction(p1)
	
	return ReactModule.useMemo(function()
		-- upvalues: config (upval), BreakpointFromRowWidth (copy), Entry (upval), UseTokensResult (copy)
		local Entry1 = config[BreakpointFromRowWidth] or Entry
		
		return {
			isStacked = Entry1.isStacked,
			cardPaddingTag = Entry1.cardPaddingTag,
			cardPaddingPx = UseTokensResult.Padding[Entry1.cardPaddingScale],
			titleTag = Entry1.titleTag,
			descriptionTag = Entry1.descriptionTag,
			titleGroupGapTag = Entry1.titleGroupGapTag,
			stackedBadgeGapTag = Entry1.stackedBadgeGapTag,
			stackedSeamScale = Entry1.stackedSeamScale,
			spotlightCardHeight = Entry1.spotlightCardHeight,
			spotlightButtonSize = Entry1.spotlightButtonSize,
			itemGapPx = UseTokensResult.Gap.Medium
		}
	end, { BreakpointFromRowWidth, UseTokensResult })
end