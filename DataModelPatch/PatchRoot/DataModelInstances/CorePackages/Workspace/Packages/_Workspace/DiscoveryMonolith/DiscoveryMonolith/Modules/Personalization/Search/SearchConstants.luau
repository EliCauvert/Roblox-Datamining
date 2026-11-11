local FFlagRenameDeprecatedUIBloxTokens = require(script:FindFirstAncestor("DiscoveryMonolith").Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens

local function _(p1, p2)
	-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy)
	return p1 * (if FFlagRenameDeprecatedUIBloxTokens then p2.Stroke.Standard else p2.Global.Stroke_100)
end

return {
	SEARCH_MARGIN = 24,
	SEARCH_BAR_HEIGHT = 28,
	SEARCH_BAR_PADDING = 12,
	SEARCH_BAR_TEXT_SIZE = 20,
	SEARCH_BAR_ICON_PADDING = 9,
	SEARCH_BAR_TEXT_PADDING_WITH_ICON = 36,
	SEARCH_BAR_TEXT_PADDING_WITHOUT_ICON = 12,
	CLEAR_IMAGE_SIZE = 16,
	CLEAR_IMAGE_PADDING = 6,
	CANCEL_BUTTON_WIDTH = 88,
	CANCEL_BUTTON_PADDING = 7,
	TABLET_LIST_PICKER_HEIGHT = 540,
	SHADOW_BOLDNESS = 14,
	SHADOW_TOP_OFFSET = 5,
	SHADOW_BOTTOM_OFFSET = 12,
	NON_COMPACT_SEARCH_BAR_SIZE = 400,
	OverlayContentPageType = {
		LandingPage = "LandingPage",
		AutocompleteSuggestions = "AutocompleteSuggestions",
		NoResults = "NoResults"
	},
	SearchBarAnimationStyle = {
		ExpandFromRight = "ExpandFromRight",
		ExpandFromCenter = "ExpandFromCenter"
	},
	getSearchTokens = function(p1)
		-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy)
		return {
			searchMargin = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_600 else p1.Global.Size_300,
			backgroundContainer = {
				screenWidthScale = 0.625,
				minimumWidth = 712 * (if FFlagRenameDeprecatedUIBloxTokens then p1.Stroke.Standard else p1.Global.Stroke_100),
				maximumWidth = 1500 * (if FFlagRenameDeprecatedUIBloxTokens then p1.Stroke.Standard else p1.Global.Stroke_100),
				padding = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_1200 else p1.Global.Size_600,
				backgroundColor3 = (if FFlagRenameDeprecatedUIBloxTokens then p1.Color.Surface.Surface_0 else p1.Semantic.Color.Background.Default).Color3,
				backgroundTransparency = (if FFlagRenameDeprecatedUIBloxTokens then p1.Color.Surface.Surface_0 else p1.Semantic.Color.Background.Default).Transparency,
				shadowBoldness = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_350 else p1.Global.Size_175,
				shadowTopOffset = 5 * (if FFlagRenameDeprecatedUIBloxTokens then p1.Stroke.Standard else p1.Global.Stroke_100),
				shadowBottomOffset = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_300 else p1.Global.Size_150
			},
			searchLandingPage = {
				topPadding = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_600 else p1.Global.Size_300,
				bottomPadding = 38 * (if FFlagRenameDeprecatedUIBloxTokens then p1.Stroke.Standard else p1.Global.Stroke_100),
				itemPadding = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_1200 else p1.Global.Size_600,
				trendingSearches = {
					pillTextSize = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_500 else p1.Global.Size_250,
					pillVerticalPadding = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_200 else p1.Global.Size_100,
					pillHorizontalPadding = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_400 else p1.Global.Size_200,
					pillFont = if FFlagRenameDeprecatedUIBloxTokens then p1.Typography.BodyLarge.Font else p1.Semantic.Typography.Body.Font,
					pillTextColor = (if FFlagRenameDeprecatedUIBloxTokens then p1.Color.Content.Emphasis else p1.Semantic.Color.Text.Emphasis).Color3,
					pillBackgroundColor = (if FFlagRenameDeprecatedUIBloxTokens then p1.Color.State.Hover else p1.Semantic.Color.Background.OnHover).Color3,
					pillBackgroundTransparency = (if FFlagRenameDeprecatedUIBloxTokens then p1.Color.State.Hover else p1.Semantic.Color.Background.OnHover).Transparency,
					columnGap = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_250 else p1.Global.Size_125
				}
			},
			searchBarListPicker = { height = 540 }
		}
	end
}