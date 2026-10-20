local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local FFlagMomentsNonInfiniteScrollEndStateFixesModule = require(Moments.Flags.FFlagMomentsNonInfiniteScrollEndStateFixes)
local Button = FoundationModule.Button
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local UseFormFactorFunction = MomentsCommonModule.Hooks.useFormFactor
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FormFactor = MomentsCommonModule.Enums.FormFactor
local config = {
	title = "Feature.Moments.Label.NonInfiniteScrollEndTitle",
	description = "Feature.Moments.Description.NonInfiniteScrollEndBody",
	loadMore = "Feature.Moments.Action.Continue"
}
local config1 = {
	title = "Feature.Moments.Label.FeedEndTitle",
	description = "Feature.Moments.Label.FeedEndBody"
}

local function _(p1, p2)
	return if p1 == nil or p1 == "" then p2 else p1
end

return function(Frame)
	-- upvalues: UseTokensFunction (copy), UseFormFactorFunction (copy), FormFactor (copy), FFlagMomentsNonInfiniteScrollEndStateFixesModule (copy), UseLocalizationFunction (copy), config1 (copy), config (copy), ReactModule (copy), View (copy), Icon (copy), IconSize (copy), Text (copy), Button (copy), FillBehavior (copy), InputSize (copy), ButtonVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local IsUseFormFactorResultMatch = UseFormFactorFunction() == FormFactor.Wide
	local IsShowLoadMore = Frame.showLoadMore ~= false
	local NoIsShowLoadMore: boolean = FFlagMomentsNonInfiniteScrollEndStateFixesModule and not IsShowLoadMore
	local UseLocalizationResult = UseLocalizationFunction(if NoIsShowLoadMore then config1 else config)
	local Title = UseLocalizationResult.title
	local ThereAreMoreMomentsToWatch = if Title == nil or Title == "" then "There are more Moments to watch" else Title
	local Description = UseLocalizationResult.description
	local WeVePausedYourFeedYouCanDecideIfYouDLikeToContinueWatching = if Description == nil or Description == "" then "We've paused your feed. You can decide if you'd like to continue watching." else Description
	local LoadMore = UseLocalizationResult.loadMore
	local Continue = if LoadMore == nil or LoadMore == "" then "Continue" else LoadMore
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center align-y-center gap-xxlarge size-full clip bg-surface-0",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Content = ReactModule.createElement(View, {
			tag = "col align-x-center gap-xxlarge size-full-0 auto-y",
			sizeConstraint = {
				MaxSize = if IsUseFormFactorResultMatch then Vector2.new(420, 1e999) else nil
			}
		}, {
			TextBlock = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "col align-x-center gap-medium size-full-0 auto-y"
			}, {
				Graphic = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "align-x-center align-y-center size-full-0 auto-y",
					Size = UDim2.new(1, 0, 0, 180)
				}, {
					IconCluster = ReactModule.createElement(View, {
						tag = "position-center-center anchor-center-center",
						testId = "moments-end-state-icon-cluster",
						Size = UDim2.fromOffset(94, 94)
					}, {
						TiltFrame = ReactModule.createElement(View, {
							tag = "position-center-center anchor-center-center stroke-standard stroke-default radius-large",
							Rotation = -15,
							testId = "moments-end-state-tilt-frame",
							ZIndex = 1,
							Size = UDim2.fromOffset(115, 115)
						}),
						Glyph = ReactModule.createElement(Icon, {
							name = "icons/brands/moments_large",
							testId = "moments-end-state-brand-icon",
							ZIndex = 2,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.fromScale(0.5, 0.5),
							size = IconSize.Large,
							style = UseTokensResult.Color.Content.Emphasis
						})
					})
				}),
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-center content-emphasis",
					Text = ThereAreMoreMomentsToWatch
				}),
				Description = ReactModule.createElement(Text, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
					Text = WeVePausedYourFeedYouCanDecideIfYouDLikeToContinueWatching
				})
			}),
			ButtonGroup = if IsShowLoadMore then ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "col align-x-center gap-small auto-y",
				Size = UDim2.fromOffset(200, 0)
			}, {
				LoadMore = ReactModule.createElement(Button, {
					LayoutOrder = 1,
					testId = "moments-end-state-load-more",
					fillBehavior = FillBehavior.Fill,
					onActivated = Frame.onLoadMore,
					size = InputSize.Medium,
					text = Continue,
					variant = ButtonVariant.Standard,
					width = UDim.new(1, 0)
				})
			}) else nil
		})
	})
end