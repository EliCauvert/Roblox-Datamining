local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local Image = require(Parent.Foundation).Image
local RoundedVariantModule = require(AppChat.Enums.RoundedVariant)
local config = {
	LayoutOrder = 0,
	cornerRadius = 20,
	aspectRatio = 1,
	Visible = true
}
local list = {
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.1, 1),
	NumberSequenceKeypoint.new(0.4, 0),
	NumberSequenceKeypoint.new(1, 0)
}

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), RoundedVariantModule (copy), list (copy), Image (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UnionResult (copy), RoundedVariantModule (upval)
		local Degrees = math.deg((math.atan(UnionResult.aspectRatio)))
		
		return {
			[RoundedVariantModule.Top] = 90,
			[RoundedVariantModule.Bottom] = 270,
			[RoundedVariantModule.Left] = 0,
			[RoundedVariantModule.Right] = 180,
			[RoundedVariantModule.TopLeft] = Degrees + 0,
			[RoundedVariantModule.TopRight] = 180 - Degrees,
			[RoundedVariantModule.BottomLeft] = Degrees + 180,
			[RoundedVariantModule.BottomRight] = 360 - Degrees
		}
	end, { UnionResult.aspectRatio })
	
	return ReactModule.createElement(Image, {
		ZIndex = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Image = UnionResult.gameThumbnail,
		LayoutOrder = UnionResult.LayoutOrder,
		aspectRatio = {
			AspectRatio = UnionResult.aspectRatio,
			AspectType = Enum.AspectType.ScaleWithParentSize,
			DominantAxis = Enum.DominantAxis.Width
		},
		cornerRadius = UDim.new(0, UnionResult.cornerRadius),
		onActivated = UnionResult.onActivated,
		Visible = UnionResult.Visible
	}, {
		OverlayImage = ReactModule.createElement(Image, {
			tag = "size-full",
			Image = UnionResult.gameThumbnail,
			Visible = UnionResult.Visible
		}, {
			TransparencyGradient = ReactModule.useMemo(function()
				-- upvalues: ReactModule (upval), UnionResult (copy), UseMemoResult (copy), list (upval)
				return ReactModule.createElement("UIGradient", {
					Rotation = if UnionResult.roundedVariant then UseMemoResult[UnionResult.roundedVariant] else 0,
					Transparency = NumberSequence.new(list)
				})
			end, { UnionResult.roundedVariant, UseMemoResult })
		})
	})
end)