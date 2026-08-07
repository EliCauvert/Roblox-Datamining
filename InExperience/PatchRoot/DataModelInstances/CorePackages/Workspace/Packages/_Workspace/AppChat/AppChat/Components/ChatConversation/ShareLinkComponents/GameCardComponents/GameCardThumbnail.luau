local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local image = require(parent.Foundation).Image
local roundedVariantModule = require(appChat.Enums.RoundedVariant)
local t = {
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

return reactModule.memo(function(p0) --[[ line: 36 | named "GameCardThumbnail" ]]
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), roundedVariantModule (ref), list (ref), image (ref)
	local var6 = cryoModule.Dictionary.union(t, p0)
	local var7 = reactModule.useMemo(function() --[[ line: 45 ]]
		-- upvalues: var6 (ref), roundedVariantModule (copy)
		local degrees = math.deg(math.atan(var6.aspectRatio))
		
		return {
			[roundedVariantModule.Top] = 90,
			[roundedVariantModule.Bottom] = 270,
			[roundedVariantModule.Left] = 0,
			[roundedVariantModule.Right] = 180,
			[roundedVariantModule.TopLeft] = degrees + 0,
			[roundedVariantModule.TopRight] = 180 - degrees,
			[roundedVariantModule.BottomLeft] = degrees + 180,
			[roundedVariantModule.BottomRight] = 360 - degrees
		}
	end, { var6.aspectRatio })
	
	return reactModule.createElement(image, {
		ZIndex = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Image = var6.gameThumbnail,
		LayoutOrder = var6.LayoutOrder,
		aspectRatio = {
			AspectRatio = var6.aspectRatio,
			AspectType = Enum.AspectType.ScaleWithParentSize,
			DominantAxis = Enum.DominantAxis.Width
		},
		cornerRadius = UDim.new(0, var6.cornerRadius),
		onActivated = var6.onActivated,
		Visible = var6.Visible
	}, {
		OverlayImage = reactModule.createElement(image, {
			tag = "size-full",
			Image = var6.gameThumbnail,
			Visible = var6.Visible
		}, {
			TransparencyGradient = reactModule.useMemo(function() --[[ line: 60 ]]
				-- upvalues: reactModule (copy), var6 (ref), var7 (ref), list (copy)
				return reactModule.createElement("UIGradient", {
					Rotation = if var6.roundedVariant then var7[var6.roundedVariant] else 0,
					Transparency = NumberSequence.new(list)
				})
			end, { var6.roundedVariant, var7 })
		})
	})
end)