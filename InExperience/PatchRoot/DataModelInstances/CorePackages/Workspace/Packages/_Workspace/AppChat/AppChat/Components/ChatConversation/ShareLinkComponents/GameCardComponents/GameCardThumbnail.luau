local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local Image = FoundationModule.Image
local UseTokensFunction = FoundationModule.Hooks.useTokens
local RoundedVariantModule = require(AppChat.Enums.RoundedVariant)
local GetGameCardThumbnailCornerRadiiModule = require(script.Parent.getGameCardThumbnailCornerRadii)
local FFlagAppChatNativeFoundationCornerRadiiModule = require(AppChat.Flags.FFlagAppChatNativeFoundationCornerRadii)
local config = { LayoutOrder = 0, aspectRatio = 1, Visible = true }
local list = {
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.1, 1),
	NumberSequenceKeypoint.new(0.4, 0),
	NumberSequenceKeypoint.new(1, 0)
}

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseTokensFunction (copy), FFlagAppChatNativeFoundationCornerRadiiModule (copy), ReactModule (copy), Image (copy), GetGameCardThumbnailCornerRadiiModule (copy), RoundedVariantModule (copy), list (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local Size500 = UseTokensFunction().Size.Size_500
	
	if FFlagAppChatNativeFoundationCornerRadiiModule then
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
			cornerRadius = GetGameCardThumbnailCornerRadiiModule(UnionResult.roundedVariant, Size500),
			onActivated = UnionResult.onActivated,
			Visible = UnionResult.Visible
		})
	else
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: UnionResult (copy), RoundedVariantModule (upval)
			local Degrees = math.deg((math.atan(UnionResult.aspectRatio)))
			
			return {
				[RoundedVariantModule.Top] = 90,
				[RoundedVariantModule.TopLeft] = Degrees + 0,
				[RoundedVariantModule.TopRight] = 180 - Degrees
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
			cornerRadius = UDim.new(0, Size500),
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
	end
end)