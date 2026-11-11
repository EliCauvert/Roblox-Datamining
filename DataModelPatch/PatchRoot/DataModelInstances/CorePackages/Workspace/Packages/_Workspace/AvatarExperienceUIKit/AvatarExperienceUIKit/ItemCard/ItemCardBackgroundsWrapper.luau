local AvatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local Parent = AvatarExperienceUIKit.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local BackgroundLayersModule = require(AvatarExperienceUIKit.BackgroundLayers.BackgroundLayers)

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), BackgroundLayersModule (copy), View (copy)
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		ItemCardBackgrounds = ReactModule.createElement(BackgroundLayersModule, {
			ZIndex = 0,
			backgroundLayers = p1.backgroundLayers,
			cornerRadius = UDim.new(0, UseTokensFunction().Radius.Medium),
			imageScaleType = p1.imageScaleType
		}),
		ItemCardContent = ReactModule.createElement(View, {
			tag = "col gap-small size-full-0 auto-y padding-small",
			ZIndex = 1
		}, {
			ItemCardHeaderSlot = p1.headerSlot,
			ItemCardFooterSlot = p1.footerSlot
		})
	})
end