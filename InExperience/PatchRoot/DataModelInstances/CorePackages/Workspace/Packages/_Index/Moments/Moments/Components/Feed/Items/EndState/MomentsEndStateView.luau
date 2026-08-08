local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local fFlagMomentsNonInfiniteScrollEndStateFixesModule = require(moments.Flags.FFlagMomentsNonInfiniteScrollEndStateFixes)
local button = foundationModule.Button
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local useFormFactor = momentsCommonModule.Hooks.useFormFactor
local useLocalization = localizationModule.Hooks.useLocalization
local useTokens = foundationModule.Hooks.useTokens
local formFactor = momentsCommonModule.Enums.FormFactor
local t = {
	title = "Feature.Moments.Label.NonInfiniteScrollEndTitle",
	description = "Feature.Moments.Description.NonInfiniteScrollEndBody",
	loadMore = "Feature.Moments.Action.LearnMore"
}
local t_1 = {
	title = "Feature.Moments.Label.FeedEndTitle",
	description = "Feature.Moments.Label.FeedEndBody"
}

local function _(p0, p1) --[[ line: 54 | named "resolveLocalized" ]]
	return if p0 == nil or p0 == "" then p1 else p0
end

return function(p2) --[[ line: 86 | named "MomentsEndStateView" ]]
	-- upvalues: useTokens (ref), useFormFactor (ref), formFactor (ref), fFlagMomentsNonInfiniteScrollEndStateFixesModule (ref), useLocalization (ref), t_1 (ref), t (ref), reactModule (ref), view (ref), icon (ref), iconSize (ref), text (ref), button (ref), fillBehavior (ref), inputSize (ref), buttonVariant (ref)
	local var8 = useTokens()
	local var9 = useFormFactor() == formFactor.Wide
	local var10 = p2.showLoadMore ~= false
	local var11 = useLocalization(if fFlagMomentsNonInfiniteScrollEndStateFixesModule and not var10 then t_1 else t)
	local title = var11.title
	local var12 = if title == nil or title == "" then "You're all caught up for now" else title
	local description = var11.description
	title = if description == nil or description == "" then "You've reached a stopping point in Moments. Tap below to keep watching." else description
	local loadMore = var11.loadMore
	description = if loadMore == nil or loadMore == "" then "Load more" else loadMore
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-center gap-xxlarge size-full clip bg-surface-0",
		LayoutOrder = p2.LayoutOrder
	}, {
		Content = reactModule.createElement(view, {
			tag = "col align-x-center gap-xxlarge size-full-0 auto-y",
			sizeConstraint = { MaxSize = if var9 then Vector2.new(420, 1e999) else nil }
		}, {
			TextBlock = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "col align-x-center gap-medium size-full-0 auto-y"
			}, {
				Graphic = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "align-x-center align-y-center size-full-0 auto-y",
					Size = UDim2.new(1, 0, 0, 180)
				}, {
					IconCluster = reactModule.createElement(view, {
						tag = "position-center-center anchor-center-center",
						testId = "moments-end-state-icon-cluster",
						Size = UDim2.fromOffset(94, 94)
					}, {
						TiltFrame = reactModule.createElement(view, {
							tag = "position-center-center anchor-center-center stroke-standard stroke-default radius-large",
							Rotation = -15,
							testId = "moments-end-state-tilt-frame",
							ZIndex = 1,
							Size = UDim2.fromOffset(115, 115)
						}),
						Glyph = reactModule.createElement(icon, {
							name = "icons/brands/moments_large",
							testId = "moments-end-state-brand-icon",
							ZIndex = 2,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.fromScale(0.5, 0.5),
							size = iconSize.Large,
							style = var8.Color.Content.Emphasis
						})
					})
				}),
				Title = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-center content-emphasis",
					Text = var12
				}),
				Description = reactModule.createElement(text, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
					Text = title
				})
			}),
			ButtonGroup = if var10 then reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "col align-x-center gap-small auto-y",
				Size = UDim2.fromOffset(200, 0)
			}, {
				LoadMore = reactModule.createElement(button, {
					LayoutOrder = 1,
					testId = "moments-end-state-load-more",
					fillBehavior = fillBehavior.Fill,
					onActivated = p2.onLoadMore,
					size = inputSize.Medium,
					text = description,
					variant = buttonVariant.Emphasis,
					width = UDim.new(1, 0)
				})
			}) else nil
		})
	})
end