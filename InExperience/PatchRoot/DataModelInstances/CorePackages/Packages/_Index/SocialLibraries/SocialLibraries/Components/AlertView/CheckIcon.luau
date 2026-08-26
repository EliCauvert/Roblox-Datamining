local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local imagesModule = require(script.Parent.Images)
local checkIcon = roact.PureComponent:extend("CheckIcon")
checkIcon.defaultProps = {
	checked = false,
	onActivated = function() end
}

function checkIcon.render(p1)
	-- upvalues: imagesModule (ref), UIBlox (ref), roact (ref)
	local var1 = if p1.props.checked then imagesModule.checkFill else imagesModule.checkStroke
	
	return UIBlox.Style.withStyle(function(p2)
		-- upvalues: roact (copy), var1 (ref), p1 (ref)
		return roact.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 17, 0, 17)
		}, {
			Button = roact.createElement("ImageButton", {
				AutoButtonColor = false,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Image = var1.Image,
				ImageRectOffset = var1.ImageRectOffset,
				ImageRectSize = var1.ImageRectSize,
				ImageColor3 = p2.Theme.UIDefault.Color,
				ScaleType = Enum.ScaleType.Slice,
				Size = UDim2.new(1, 0, 1, 0),
				SliceCenter = var1.SliceCenter,
				[roact.Event.MouseButton1Click] = p1.props.onActivated
			})
		})
	end)
end

return checkIcon