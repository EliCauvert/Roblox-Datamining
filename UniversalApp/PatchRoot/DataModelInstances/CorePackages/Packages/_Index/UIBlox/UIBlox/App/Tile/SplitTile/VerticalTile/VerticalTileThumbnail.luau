local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.Parent.Parent.React)
local loadableImageModule = require(parent.Loading.LoadableImage)
local _ = require(parent.Style.StyleTypes)
local uDim = UDim.new(0, 8)

return function(p0) --[[ line: 27 | named "VerticalTileThumbnail" ]]
	-- upvalues: uDim (ref), reactModule (ref), loadableImageModule (ref)
	local var9
	local aspectRatio = p0.aspectRatio
	local isTopRounded = p0.isTopRounded
	local isBottomRounded = p0.isBottomRounded
	local thumbnail = p0.thumbnail
	local border = p0.border
	local isBottomRounded_1 = isTopRounded and isBottomRounded
	local var4 = not isBottomRounded_1 and (isTopRounded or isBottomRounded)
	local var5 = if border ~= nil then uDim else border.CornerRadius
	local createElement = reactModule.createElement
	local var6 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		Size = if aspectRatio then UDim2.new(1, 0, aspectRatio, 0) else UDim2.new(1, 0, 1, 0),
		SizeConstraint = if aspectRatio then Enum.SizeConstraint.RelativeXX else nil
	}
	local t_1 = {
		TopFrame = reactModule.createElement("Frame", {
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0, 0),
			Size = UDim2.fromScale(1, if not var4 then 1 else 0.5)
		}, {
			TopImage = reactModule.createElement(loadableImageModule, {
				BackgroundTransparency = 1,
				showFailedStateWhenLoadingFailed = true,
				useShimmerAnimationWhileLoading = true,
				Image = thumbnail,
				Position = UDim2.fromScale(0, 0),
				Size = UDim2.fromScale(1, if not var4 then 1 else 2),
				cornerRadius = if isBottomRounded_1 or isTopRounded then var5 else nil
			})
		})
	}
	
	if var4 then
		var9 = reactModule.createElement
		var9 = var9("Frame", {
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0, 0.5),
			Size = UDim2.fromScale(1, 0.5)
		}, {
			BottomImage = reactModule.createElement(loadableImageModule, {
				BackgroundTransparency = 1,
				showFailedStateWhenLoadingFailed = true,
				useShimmerAnimationWhileLoading = true,
				Image = thumbnail,
				Position = UDim2.fromScale(0, -1),
				Size = UDim2.fromScale(1, 2),
				cornerRadius = if isBottomRounded_1 or isBottomRounded then var5 else nil
			})
		})
	else
		var9 = nil
	end
	t_1.BottomFrame = var9
	
	return createElement(var6, t, t_1)
end