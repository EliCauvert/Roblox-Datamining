local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Constants)
local HoverGreen = ConstantsModule.Color.HoverGreen
local LineWidth = ConstantsModule.GeneralFormatting.LineWidth
local TextPadding = ConstantsModule.Graph.TextPadding
local InnerPaddingY = ConstantsModule.Graph.InnerPaddingY

return function(p1) --[[ Line: 10 ]]
	-- upvalues: RoactModule (copy), LineWidth (copy), HoverGreen (copy), TextPadding (copy), InnerPaddingY (copy)
	local HoverLineX = p1.hoverLineX
	local HoverLineY = p1.hoverLineY
	local HoverValX = p1.hoverValX
	local HoverValY = p1.hoverValY
	local StringFormatXFunction = p1.stringFormatX
	local StringFormatYFunction = p1.stringFormatY
	
	return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		hoverLine = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, LineWidth, 1, 0),
			Position = UDim2.new(0, HoverLineX, 0, 0),
			BackgroundColor3 = HoverGreen
		}),
		HoverHorizontal = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, HoverLineX + TextPadding, 0, LineWidth),
			Position = UDim2.new(0, -TextPadding, 1 - InnerPaddingY, -HoverLineY),
			BackgroundColor3 = HoverGreen
		}),
		HoverTextY = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = StringFormatYFunction and StringFormatYFunction(HoverValY) or HoverValY,
			TextColor3 = HoverGreen,
			TextXAlignment = Enum.TextXAlignment.Right,
			Position = UDim2.new(0, -TextPadding - 2, 1 - InnerPaddingY, -HoverLineY)
		}),
		HoverTextX = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = StringFormatXFunction and StringFormatXFunction(HoverValX) or HoverValX,
			TextColor3 = HoverGreen,
			TextXAlignment = Enum.TextXAlignment.Center,
			Position = UDim2.new(0, HoverLineX, 1, TextPadding)
		})
	})
end