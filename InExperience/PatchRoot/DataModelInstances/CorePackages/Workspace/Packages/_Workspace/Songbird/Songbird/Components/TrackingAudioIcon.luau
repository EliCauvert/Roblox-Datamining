local Songbird = script:FindFirstAncestor("Songbird")
local CryoModule = require(Songbird.Parent.Cryo)
local FoundationModule = require(Songbird.Parent.Foundation)
local ReactModule = require(Songbird.Parent.React)
local CreateNextOrderFunction = require(Songbird.Parent.ReactUtils).createNextOrder
local MusicPlayingIconModule = require(Songbird.Components.MusicPlayingIcon)
local config = { isMoving = true }

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), CreateNextOrderFunction (copy), FoundationModule (copy), ReactModule (copy), MusicPlayingIconModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local NextOrder = CreateNextOrderFunction()
	local Size900: number = FoundationModule.Hooks.useTokens().Size.Size_900
	
	return ReactModule.createElement(FoundationModule.View, { Size = UDim2.fromOffset(Size900, Size900) }, {
		BaseIcon = ReactModule.createElement(FoundationModule.Image, {
			Image = "icons/common/musicTrackingBorder_medium",
			Size = UDim2.fromOffset(Size900, Size900),
			ZIndex = NextOrder()
		}),
		CenterCover = ReactModule.createElement(FoundationModule.View, {
			Transparency = 1,
			Size = UDim2.fromOffset(Size900 / 2, Size900 / 2),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ZIndex = NextOrder()
		}, {
			Bars = ReactModule.createElement(MusicPlayingIconModule, {
				numAnimatedBars = 4,
				heightRange = NumberRange.new(0.25, 0.9),
				zIndex = NextOrder(),
				isMoving = JoinResult.isMoving
			})
		})
	})
end