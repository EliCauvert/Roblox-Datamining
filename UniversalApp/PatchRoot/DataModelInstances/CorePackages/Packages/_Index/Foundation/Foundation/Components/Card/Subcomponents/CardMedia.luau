local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ImageModule = require(Foundation.Components.Image)
local _ = require(Foundation.Components.Types)

return function(p1)
	-- upvalues: ReactModule (copy), ImageModule (copy)
	local SizeConstraint = nil
	local FlexItem = nil
	local _UDim2 = nil
	
	if p1.isEnd then
		_UDim2 = UDim2.new(0, p1.width, if p1.isFillHeight then 1 else 0, 0)
		SizeConstraint = { MaxSize = Vector2.new(p1.width, 1e999) }
		FlexItem = {
			FlexMode = Enum.UIFlexMode.Shrink,
			ItemLineAlignment = Enum.ItemLineAlignment.Stretch
		}
	else
		_UDim2 = UDim2.new(1, 0, 0, p1.bottomHeight)
	end
	return ReactModule.createElement(ImageModule, {
		LayoutOrder = 2,
		Image = p1.image,
		ScaleType = Enum.ScaleType.Crop,
		tag = p1.tag,
		Size = _UDim2,
		sizeConstraint = SizeConstraint,
		flexItem = FlexItem,
		testId = `{p1.testId}--image`
	})
end