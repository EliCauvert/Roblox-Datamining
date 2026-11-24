local Parent = script:FindFirstAncestor("AvatarExperienceSearch").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ChipGroup = FoundationModule.ChipGroup
local ChipGroupVariant = FoundationModule.Enums.ChipGroupVariant
local ChipSize = FoundationModule.Enums.ChipSize
local Text = FoundationModule.Text
local View = FoundationModule.View
local FFlagAXSearchTrendingChipLogging = require(Parent.AvatarExperienceFlags).FFlagAXSearchTrendingChipLogging
local _ = require(script.Parent.useTrendingSearchTermsWidgetProps)
local config = { title = "Feature.Catalog.Label.Trending" }

return function(Frame)
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), View (copy), FFlagAXSearchTrendingChipLogging (copy), Text (copy), ChipGroup (copy), ChipSize (copy), ChipGroupVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	
	return if Frame.chips and #Frame.chips ~= 0 then ReactModule.createElement(View, {
		testId = "TrendingSearchTermsWidget",
		LayoutOrder = Frame.LayoutOrder,
		tag = {
			["size-full-0 auto-y padding-y-small col gap-medium"] = true,
			clip = FFlagAXSearchTrendingChipLogging
		}
	}, {
		Title = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-heading-small text-align-x-left text-truncate-end content-emphasis",
			testId = "TrendingSearchTermsWidget--title",
			Text = UseLocalizationResult.title
		}),
		ChipGroup = ReactModule.createElement(ChipGroup, {
			LayoutOrder = 2,
			testId = "TrendingSearchTermsWidget--chips",
			chips = Frame.chips,
			size = ChipSize.Medium,
			variant = ChipGroupVariant.Row
		})
	}) else nil
end