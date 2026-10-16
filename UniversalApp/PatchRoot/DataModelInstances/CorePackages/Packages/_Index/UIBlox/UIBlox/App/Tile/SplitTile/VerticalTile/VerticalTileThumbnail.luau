local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.Parent.Parent.React)
local LoadableImageModule = require(Parent.Loading.LoadableImage)
local _ = require(Parent.Style.StyleTypes)
local _UDim = UDim.new(0, 8)

return function(p1) --[[ Line: 27 | Named "VerticalTileThumbnail" ]]
	-- upvalues: _UDim (copy), ReactModule (copy), LoadableImageModule (copy)
	local AspectRatio = p1.aspectRatio
	local IsTopRounded = p1.isTopRounded
	local IsBottomRounded = p1.isBottomRounded
	local Thumbnail = p1.thumbnail
	local Border = p1.border
	local IsBottomRounded1 = IsTopRounded and IsBottomRounded
	local IsTopRounded1 = not IsBottomRounded1 and (IsTopRounded or IsBottomRounded)
	local CornerRadius = if Border == nil then _UDim else Border.CornerRadius
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = if AspectRatio then UDim2.new(1, 0, AspectRatio, 0) else UDim2.new(1, 0, 1, 0),
		SizeConstraint = if AspectRatio then Enum.SizeConstraint.RelativeXX else nil
	}, {
		TopFrame = ReactModule.createElement("Frame", {
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0, 0),
			Size = UDim2.fromScale(1, if IsTopRounded1 then 0.5 else 1)
		}, {
			TopImage = ReactModule.createElement(LoadableImageModule, {
				BackgroundTransparency = 1,
				showFailedStateWhenLoadingFailed = true,
				useShimmerAnimationWhileLoading = true,
				Image = Thumbnail,
				Position = UDim2.fromScale(0, 0),
				Size = UDim2.fromScale(1, if IsTopRounded1 then 2 else 1),
				cornerRadius = if IsBottomRounded1 or IsTopRounded then CornerRadius else nil
			})
		}),
		BottomFrame = if IsTopRounded1 then ReactModule.createElement("Frame", {
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0, 0.5),
			Size = UDim2.fromScale(1, 0.5)
		}, {
			BottomImage = ReactModule.createElement(LoadableImageModule, {
				BackgroundTransparency = 1,
				showFailedStateWhenLoadingFailed = true,
				useShimmerAnimationWhileLoading = true,
				Image = Thumbnail,
				Position = UDim2.fromScale(0, -1),
				Size = UDim2.fromScale(1, 2),
				cornerRadius = if IsBottomRounded1 or IsBottomRounded then CornerRadius else nil
			})
		}) else nil
	})
end