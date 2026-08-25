local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local imagesModule = require(script.Parent.Images)
local checkIcon = roact.PureComponent:extend("CheckIcon")
checkIcon.defaultProps = {
	checked = false,
	onActivated = function() end
}

function checkIcon.render(p0)
	-- upvalues: imagesModule (ref), UIBlox (ref), roact (ref)
	local var3 = if p0.props.checked then imagesModule.checkFill else imagesModule.checkStroke
	
	return UIBlox.Style.withStyle(function(p1)
		-- upvalues: roact (copy), var3 (ref), p0 (ref)
		return roact.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 17, 0, 17)
		}, {
			Button = roact.createElement("ImageButton", {
				AutoButtonColor = false,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Image = var3.Image,
				ImageRectOffset = var3.ImageRectOffset,
				ImageRectSize = var3.ImageRectSize,
				ImageColor3 = p1.Theme.UIDefault.Color,
				ScaleType = Enum.ScaleType.Slice,
				Size = UDim2.new(1, 0, 1, 0),
				SliceCenter = var3.SliceCenter,
				[roact.Event.MouseButton1Click] = p0.props.onActivated
			})
		})
	end)
end

return checkIcon