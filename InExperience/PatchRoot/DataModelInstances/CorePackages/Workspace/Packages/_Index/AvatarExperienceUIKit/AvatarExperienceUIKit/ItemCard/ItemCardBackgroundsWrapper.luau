local avatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local parent = avatarExperienceUIKit.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local backgroundLayersModule = require(avatarExperienceUIKit.BackgroundLayers.BackgroundLayers)

return function(value) --[[ line: 17 | named "ItemCardBackgroundsWrapper" ]]
	-- upvalues: useTokens (ref), reactModule (ref), backgroundLayersModule (ref), view (ref)
	return reactModule.createElement(reactModule.Fragment, nil, {
		ItemCardBackgrounds = reactModule.createElement(backgroundLayersModule, {
			ZIndex = 0,
			backgroundLayers = value.backgroundLayers,
			cornerRadius = UDim.new(0, useTokens().Radius.Medium),
			imageScaleType = value.imageScaleType
		}),
		ItemCardContent = reactModule.createElement(view, {
			tag = "col gap-small size-full-0 auto-y padding-small",
			ZIndex = 1
		}, {
			ItemCardHeaderSlot = value.headerSlot,
			ItemCardFooterSlot = value.footerSlot
		})
	})
end