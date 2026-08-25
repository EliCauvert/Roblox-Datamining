local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local constantsModule = require(script.Parent.Parent.Constants)
local slotNumbers = roactModule.PureComponent:extend("SlotNumbers")

function slotNumbers.render(p0)
	-- upvalues: constantsModule (ref), roactModule (ref)
	local layout = constantsModule.Layouts[p0.props.layout]
	local t = {}
	
	for i = 1, constantsModule.EmotesPerPage do
		local var6 = 360 / constantsModule.EmotesPerPage * (i - 1) + constantsModule.SegmentsStartRotation
		local var7 = constantsModule.InnerCircleSizeRatio / 2
		local slotNumberSize = constantsModule.SlotNumberSize
		local var8 = slotNumberSize / 2
		local var9 = math.cos(math.rad(var6))
		local var10 = math.sin(math.rad(var6))
		t[i] = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextScaled = true,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5 + var7 * var9 + var8 * var9, 0, 0.5 + var7 * var10 + var8 * var10, 0),
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

return roactRoduxModule.connect(function(p1)
	return { layout = p1.layout }
end, nil)(slotNumbers)