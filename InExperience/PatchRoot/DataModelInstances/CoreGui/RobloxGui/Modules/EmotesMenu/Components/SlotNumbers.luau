local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ConstantsModule = require(script.Parent.Parent.Constants)
local SlotNumbers = RoactModule.PureComponent:extend("SlotNumbers")

function SlotNumbers.render(p1) --[[ Line: 13 ]]
	-- upvalues: ConstantsModule (copy), RoactModule (copy)
	local Layout = ConstantsModule.Layouts[p1.props.layout]
	local TextLabels = {}
	
	for i = 1, ConstantsModule.EmotesPerPage do
		local NewEmotesPerPage = 360 / ConstantsModule.EmotesPerPage * (i - 1) + ConstantsModule.SegmentsStartRotation
		local InnerCircleSizeRatioRatio = ConstantsModule.InnerCircleSizeRatio / 2
		local SlotNumberSize: number = ConstantsModule.SlotNumberSize
		local SlotNumberSizeRatio = SlotNumberSize / 2
		local Cosine = math.cos((math.rad(NewEmotesPerPage)))
		local Sine = math.sin((math.rad(NewEmotesPerPage)))
		TextLabels[i] = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextScaled = true,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5 + InnerCircleSizeRatioRatio * Cosine + SlotNumberSizeRatio * Cosine, 0, 0.5 + InnerCircleSizeRatioRatio * Sine + SlotNumberSizeRatio * Sine, 0),
			Size = UDim2.new(SlotNumberSize, 0, SlotNumberSize, 0),
			TextSize = Layout.SlotNumberTextSize,
			TextColor3 = ConstantsModule.Colors.White,
			Text = i,
			Font = Layout.SlotNumberFont
		}, {
			TextSizeConstraint = RoactModule.createElement("UITextSizeConstraint", { MaxTextSize = Layout.SlotNumberTextSize })
		})
	end
	return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, TextLabels)
end

return RoactRoduxModule.connect(function(p2) --[[ Line: 61 | Named "mapStateToProps" ]]
	return { layout = p2.layout }
end, nil)(SlotNumbers)