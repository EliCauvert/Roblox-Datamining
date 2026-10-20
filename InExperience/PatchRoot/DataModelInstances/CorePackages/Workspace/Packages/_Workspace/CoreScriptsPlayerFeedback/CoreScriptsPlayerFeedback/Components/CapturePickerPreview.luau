local CoreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local ReactModule = require(CoreScriptsPlayerFeedback.Parent.React)
local _ = require(CoreScriptsPlayerFeedback.CaptureTypes)

return (ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 8),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		PreviewImage = ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			ImageContent = Content.fromObject(p1.capture),
			ScaleType = Enum.ScaleType.Fit,
			Size = UDim2.new(1, 0, 0, 260)
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 6) })
		})
	})
end))