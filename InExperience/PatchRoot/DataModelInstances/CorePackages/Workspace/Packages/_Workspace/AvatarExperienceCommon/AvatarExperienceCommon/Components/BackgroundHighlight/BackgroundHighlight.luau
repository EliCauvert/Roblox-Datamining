local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local numberSequence = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(0.1, 1),
	NumberSequenceKeypoint.new(0.9, 1),
	NumberSequenceKeypoint.new(1, 0)
})
local numberSequence_1 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.6, 1),
	NumberSequenceKeypoint.new(0.85, 0.15),
	NumberSequenceKeypoint.new(1, 0)
})

local function Gradient(p0)
	-- upvalues: useTokens (ref), reactModule (ref)
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ZIndex = 1,
		BackgroundColor3 = useTokens().Color.Surface.Surface_0.Color3,
		Size = UDim2.fromScale(1, 1)
	}, {
		UIGradient = reactModule.createElement("UIGradient", { Rotation = p0.Rotation, Transparency = p0.Transparency })
	})
end

return function(value)
	-- upvalues: reactModule (ref), Gradient (ref), numberSequence_1 (ref), numberSequence (ref)
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1.2, 1.2),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		BackgroundTransparency = value.highlightColor.Transparency,
		BackgroundColor3 = value.highlightColor.Color3,
		ZIndex = value.ZIndex or 0
	}, {
		TriangleGradientBottom = reactModule.createElement(Gradient, { Rotation = 90, Transparency = numberSequence_1 }),
		TriangleGradientLeft = reactModule.createElement(Gradient, { Rotation = 210, Transparency = numberSequence_1 }),
		TriangleGradientRight = reactModule.createElement(Gradient, { Rotation = 330, Transparency = numberSequence_1 }),
		EdgeGradientHorizontal = reactModule.createElement(Gradient, { Rotation = 0, Transparency = numberSequence }),
		EdgeGradientVertical = reactModule.createElement(Gradient, { Rotation = 90, Transparency = numberSequence })
	})
end