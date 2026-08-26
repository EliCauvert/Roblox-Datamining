local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local constantsModule = require(script.Parent.Parent.Constants)
local slotNumbers = roactModule.PureComponent:extend("SlotNumbers")

function slotNumbers.render(p1)
	-- upvalues: constantsModule (ref), roactModule (ref)
	local layout = constantsModule.Layouts[p1.props.layout]
	local t = {}
	
	for i = 1, constantsModule.EmotesPerPage do
		local var1 = 360 / constantsModule.EmotesPerPage * (i - 1) + constantsModule.SegmentsStartRotation
		local var2 = constantsModule.InnerCircleSizeRatio / 2
		local slotNumberSize = constantsModule.SlotNumberSize
		local var3 = slotNumberSize / 2
		local var4 = math.cos(math.rad(var1))
		local var5 = math.sin(math.rad(var1))
		t[i] = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextScaled = true,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5 + var2 * var4 + var3 * var4, 0, 0.5 + var2 * var5 + var3 * var5, 0),
			Size = UDim2.new(slotNumberSize, 0, slotNumberSize, 0),
			TextSize = layout.SlotNumberTextSize,
			TextColor3 = constantsModule.Colors.White,
			Text = i,
			Font = layout.SlotNumberFont
		}, {
			TextSizeConstraint = roactModule.createElement("UITextSizeConstraint", { MaxTextSize = layout.SlotNumberTextSize })
		})
	end
	return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, t)
end

return roactRoduxModule.connect(function(p2)
	return { layout = p2.layout }
end, nil)(slotNumbers)