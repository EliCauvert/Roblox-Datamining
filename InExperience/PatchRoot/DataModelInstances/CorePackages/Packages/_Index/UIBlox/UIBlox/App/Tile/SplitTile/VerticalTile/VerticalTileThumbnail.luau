local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.Parent.Parent.React)
local loadableImageModule = require(parent.Loading.LoadableImage)
local _ = require(parent.Style.StyleTypes)
local uDim = UDim.new(0, 8)

return function(p1)
	-- upvalues: uDim (ref), reactModule (ref), loadableImageModule (ref)
	local var1
	local aspectRatio = p1.aspectRatio
	local isTopRounded = p1.isTopRounded
	local isBottomRounded = p1.isBottomRounded
	local thumbnail = p1.thumbnail
	local border = p1.border
	local isBottomRounded_1 = isTopRounded and isBottomRounded
	local var2 = not isBottomRounded_1 and (isTopRounded or isBottomRounded)
	local var3 = if border ~= nil then uDim else border.CornerRadius
	local createElement = reactModule.createElement
	local var4 = "Frame"
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
			Size = UDim2.fromScale(1, if not var2 then 1 else 0.5)
		}, {
			TopImage = reactModule.createElement(loadableImageModule, {
				BackgroundTransparency = 1,
				showFailedStateWhenLoadingFailed = true,
				useShimmerAnimationWhileLoading = true,
				Image = thumbnail,
				Position = UDim2.fromScale(0, 0),
				Size = UDim2.fromScale(1, if not var2 then 1 else 2),
				cornerRadius = if isBottomRounded_1 or isTopRounded then var3 else nil
			})
		})
	}
	
	if var2 then
		var1 = reactModule.createElement
		var1 = var1("Frame", {
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
				cornerRadius = if isBottomRounded_1 or isBottomRounded then var3 else nil
			})
		})
	else
		var1 = nil
	end
	t_1.BottomFrame = var1
	
	return createElement(var4, t, t_1)
end