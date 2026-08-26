local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local image = foundationModule.Image
local useTokens = foundationModule.Hooks.useTokens
local roundedVariantModule = require(appChat.Enums.RoundedVariant)
local getGameCardThumbnailCornerRadiiModule = require(script.Parent.getGameCardThumbnailCornerRadii)
local fFlagAppChatNativeFoundationCornerRadiiModule = require(appChat.Flags.FFlagAppChatNativeFoundationCornerRadii)
local t = { LayoutOrder = 0, aspectRatio = 1, Visible = true }
local list = {
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.1, 1),
	NumberSequenceKeypoint.new(0.4, 0),
	NumberSequenceKeypoint.new(1, 0)
}

return reactModule.memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), fFlagAppChatNativeFoundationCornerRadiiModule (ref), reactModule (ref), image (ref), getGameCardThumbnailCornerRadiiModule (ref), roundedVariantModule (ref), list (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local size500 = useTokens().Size.Size_500
	
	if fFlagAppChatNativeFoundationCornerRadiiModule then
		return reactModule.createElement(image, {
			ZIndex = 0,
			Size = UDim2.new(1, 0, 1, 0),
			Image = var1.gameThumbnail,
			LayoutOrder = var1.LayoutOrder,
			aspectRatio = {
				AspectRatio = var1.aspectRatio,
				AspectType = Enum.AspectType.ScaleWithParentSize,
				DominantAxis = Enum.DominantAxis.Width
			},
			cornerRadius = getGameCardThumbnailCornerRadiiModule(var1.roundedVariant, size500),
			onActivated = var1.onActivated,
			Visible = var1.Visible
		})
	end
	local var2 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), roundedVariantModule (copy)
		local degrees = math.deg(math.atan(var1.aspectRatio))
		
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
	end, { var1.aspectRatio })
	
	return reactModule.createElement(image, {
		ZIndex = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Image = var1.gameThumbnail,
		LayoutOrder = var1.LayoutOrder,
		aspectRatio = {
			AspectRatio = var1.aspectRatio,
			AspectType = Enum.AspectType.ScaleWithParentSize,
			DominantAxis = Enum.DominantAxis.Width
		},
		cornerRadius = UDim.new(0, size500),
		onActivated = var1.onActivated,
		Visible = var1.Visible
	}, {
		OverlayImage = reactModule.createElement(image, {
			tag = "size-full",
			Image = var1.gameThumbnail,
			Visible = var1.Visible
		}, {
			TransparencyGradient = reactModule.useMemo(function()
				-- upvalues: reactModule (copy), var1 (ref), var2 (ref), list (copy)
				return reactModule.createElement("UIGradient", {
					Rotation = if var1.roundedVariant then var2[var1.roundedVariant] else 0,
					Transparency = NumberSequence.new(list)
				})
			end, { var1.roundedVariant, var2 })
		})
	})
end)