local CorePackages = game:GetService("CorePackages")
local GetIgrsImageFunction = require(CorePackages.Workspace.Packages.DataHydration).Game.AgeRecommendationUtils.getIgrsImage
local EnumIgrsRating = require(CorePackages.Workspace.Packages.DiscoveryTypes).EnumIgrsRating
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local View = FoundationModule.View
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame)
	-- upvalues: UseScaledValueFunction (copy), UseTokensFunction (copy), GetIgrsImageFunction (copy), ReactModule (copy), View (copy), FoundationModule (copy), Image (copy), EnumIgrsRating (copy), Text (copy)
	local UseScaledValueResult = UseScaledValueFunction(402)
	local UseTokensResult = UseTokensFunction()
	local IgrsImage = GetIgrsImageFunction(Frame.igrsRating)
	
	return ReactModule.createElement(View, {
		tag = "padding-medium gap-large radius-medium row align-y-center stroke-default size-full-0 auto-y",
		onActivated = Frame.onActivated,
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		},
		LayoutOrder = Frame.LayoutOrder
	}, {
		SizeConstraint = ReactModule.createElement("UISizeConstraint", {
			MaxSize = Vector2.new(UseScaledValueResult, 1e999),
			MinSize = Vector2.new(0, UseTokensResult.Size.Size_1700)
		}),
		RatingImage = if IgrsImage then ReactModule.createElement(Image, {
			tag = "size-1700-1700",
			LayoutOrder = 1,
			Image = IgrsImage
		}, {
			AspectRatio = ReactModule.createElement("UIAspectRatioConstraint", {
				AspectRatio = if Frame.igrsRating == EnumIgrsRating.IgrsUnrated then 0.8775804128660586 else 1,
				AspectType = Enum.AspectType.ScaleWithParentSize,
				DominantAxis = Enum.DominantAxis.Height
			})
		}) else nil,
		RatingText = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			Text = Frame.igrsRatingDisplayMessage or "",
			tag = {
				["fill auto-y text-wrap text-align-x-left"] = true,
				["text-body-medium"] = Frame.igrsRating ~= EnumIgrsRating.IgrsUnrated,
				["text-title-medium content-emphasis"] = Frame.igrsRating == EnumIgrsRating.IgrsUnrated
			}
		})
	})
end