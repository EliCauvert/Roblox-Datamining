local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local ImagesModule = require(script.Parent.Images)
local CheckIcon = Roact.PureComponent:extend("CheckIcon")
CheckIcon.defaultProps = {
	checked = false,
	onActivated = function() end
}

function CheckIcon.render(p1)
	-- upvalues: ImagesModule (copy), UIBlox (copy), Roact (copy)
	local CheckFill = p1.props.checked and ImagesModule.checkFill or ImagesModule.checkStroke
	
	return UIBlox.Style.withStyle(function(p2)
		-- upvalues: Roact (upval), CheckFill (copy), p1 (copy)
		return Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 17, 0, 17)
		}, {
			Button = Roact.createElement("ImageButton", {
				AutoButtonColor = false,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Image = CheckFill.Image,
				ImageRectOffset = CheckFill.ImageRectOffset,
				ImageRectSize = CheckFill.ImageRectSize,
				ImageColor3 = p2.Theme.UIDefault.Color,
				ScaleType = Enum.ScaleType.Slice,
				Size = UDim2.new(1, 0, 1, 0),
				SliceCenter = CheckFill.SliceCenter,
				[Roact.Event.MouseButton1Click] = p1.props.onActivated
			})
		})
	end)
end

return CheckIcon