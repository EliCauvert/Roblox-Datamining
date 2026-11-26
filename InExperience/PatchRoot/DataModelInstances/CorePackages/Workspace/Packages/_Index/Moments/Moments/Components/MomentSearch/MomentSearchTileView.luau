local Parent = script:FindFirstAncestor("Moments").Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GradientBackdrop = MomentsCommonModule.Components.GradientBackdrop

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), MomentsCommonModule (copy), GradientBackdrop (copy), Icon (copy), BuilderIconsModule (copy), FoundationModule (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local White100 = UseTokensResult.Color.Extended.White.White_100
	local HasReactionText = Frame.reactionText ~= nil
	
	return ReactModule.createElement(View, {
		tag = "size-full radius-small clip",
		LayoutOrder = Frame.LayoutOrder,
		onActivated = Frame.onActivated,
		testId = `--moments-search-tile-{Frame.id}`
	}, {
		Media = ReactModule.createElement(MomentsCommonModule.Media.MomentMediaTile, { isActive = false, mediaItem = Frame.mediaItem }),
		BottomGradient = if HasReactionText then ReactModule.createElement(GradientBackdrop, {
			rotation = -90,
			startingTransparency = 0,
			zIndex = 2,
			anchorPoint = Vector2.new(0, 1),
			color3 = UseTokensResult.Color.Common.Scrim.Color3,
			position = UDim2.fromScale(0, 1),
			size = UDim2.fromScale(1, 0.5)
		}) else nil,
		Reactions = if HasReactionText then ReactModule.createElement(View, {
			tag = "row align-y-center gap-xxsmall position-bottom-right anchor-bottom-right auto-xy padding-small",
			ZIndex = 3
		}, {
			Icon = ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				name = BuilderIconsModule.Icon.ThumbUp,
				variant = BuilderIconsModule.IconVariant.Filled,
				size = FoundationModule.Enums.IconSize.XSmall,
				style = White100
			}),
			Count = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-small",
				Text = Frame.reactionText,
				textStyle = White100
			})
		}) else nil
	})
end