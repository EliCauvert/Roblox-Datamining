local coreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local reactModule = require(coreScriptsPlayerFeedback.Parent.React)
local _ = require(coreScriptsPlayerFeedback.CaptureTypes)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 8),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		PreviewImage = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			ImageContent = Content.fromObject(p1.capture),
			ScaleType = Enum.ScaleType.Fit,
			Size = UDim2.new(1, 0, 0, 260)
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 6) })
		})
	})
end)