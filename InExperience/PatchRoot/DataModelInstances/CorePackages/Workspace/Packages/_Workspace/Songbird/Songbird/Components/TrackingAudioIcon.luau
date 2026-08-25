local songbird = script:FindFirstAncestor("Songbird")
local cryoModule = require(songbird.Parent.Cryo)
local foundationModule = require(songbird.Parent.Foundation)
local reactModule = require(songbird.Parent.React)
local createNextOrder = require(songbird.Parent.ReactUtils).createNextOrder
local musicPlayingIconModule = require(songbird.Components.MusicPlayingIcon)
local t = { isMoving = true }

return function(p0)
	-- upvalues: cryoModule (ref), t (ref), createNextOrder (ref), foundationModule (ref), reactModule (ref), musicPlayingIconModule (ref)
	local var6 = cryoModule.Dictionary.join(t, p0)
	local var7 = createNextOrder()
	local size900 = foundationModule.Hooks.useTokens().Size.Size_900
	
	return reactModule.createElement(foundationModule.View, { Size = UDim2.fromOffset(size900, size900) }, {
		BaseIcon = reactModule.createElement(foundationModule.Image, {
			Image = "icons/common/musicTrackingBorder_medium",
			Size = UDim2.fromOffset(size900, size900),
			ZIndex = var7()
		}),
		CenterCover = reactModule.createElement(foundationModule.View, {
			Transparency = 1,
			Size = UDim2.fromOffset(size900 / 2, size900 / 2),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ZIndex = var7()
		}, {
			Bars = reactModule.createElement(musicPlayingIconModule, {
				numAnimatedBars = 4,
				heightRange = NumberRange.new(0.25, 0.9),
				zIndex = var7(),
				isMoving = var6.isMoving
			})
		})
	})
end