local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local imageModule = require(foundation.Components.Image)
local _ = require(foundation.Components.Types)

return function(p1)
	-- upvalues: reactModule (ref), imageModule (ref)
	local uDim2
	local _ = nil
	local t = nil
	local t_1 = nil
	
	if p1.isEnd then
		uDim2 = UDim2.new(0, p1.width, if p1.isFillHeight then 1 else 0, 0)
		t = { MaxSize = Vector2.new(p1.width, 1e999) }
		t_1 = {
			FlexMode = Enum.UIFlexMode.Shrink,
			ItemLineAlignment = Enum.ItemLineAlignment.Stretch
		}
	else
		uDim2 = UDim2.new(1, 0, 0, p1.bottomHeight)
	end
	return reactModule.createElement(imageModule, {
		LayoutOrder = 2,
		Image = p1.image,
		ScaleType = Enum.ScaleType.Crop,
		tag = p1.tag,
		Size = uDim2,
		sizeConstraint = t,
		flexItem = t_1,
		testId = `{p1.testId}--image`
	})
end