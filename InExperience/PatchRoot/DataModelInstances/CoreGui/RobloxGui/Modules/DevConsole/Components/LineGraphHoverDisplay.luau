local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Constants)
local hoverGreen = constantsModule.Color.HoverGreen
local lineWidth = constantsModule.GeneralFormatting.LineWidth
local textPadding = constantsModule.Graph.TextPadding
local innerPaddingY = constantsModule.Graph.InnerPaddingY

return function(p0)
	-- upvalues: roactModule (ref), lineWidth (ref), hoverGreen (ref), textPadding (ref), innerPaddingY (ref)
	local hoverLineX = p0.hoverLineX
	local hoverLineY = p0.hoverLineY
	local hoverValX = p0.hoverValX
	local hoverValY = p0.hoverValY
	local stringFormatX = p0.stringFormatX
	local stringFormatY = p0.stringFormatY
	
	return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		hoverLine = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, lineWidth, 1, 0),
			Position = UDim2.new(0, hoverLineX, 0, 0),
			BackgroundColor3 = hoverGreen
		}),
		HoverHorizontal = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, hoverLineX + textPadding, 0, lineWidth),
			Position = UDim2.new(0, -textPadding, 1 - innerPaddingY, -hoverLineY),
			BackgroundColor3 = hoverGreen
		}),
		HoverTextY = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = stringFormatY and stringFormatY(hoverValY) or hoverValY,
			TextColor3 = hoverGreen,
			TextXAlignment = Enum.TextXAlignment.Right,
			Position = UDim2.new(0, (-textPadding) - 2, 1 - innerPaddingY, -hoverLineY)
		}),
		HoverTextX = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = stringFormatX and stringFormatX(hoverValX) or hoverValX,
			TextColor3 = hoverGreen,
			TextXAlignment = Enum.TextXAlignment.Center,
			Position = UDim2.new(0, hoverLineX, 1, textPadding)
		})
	})
end