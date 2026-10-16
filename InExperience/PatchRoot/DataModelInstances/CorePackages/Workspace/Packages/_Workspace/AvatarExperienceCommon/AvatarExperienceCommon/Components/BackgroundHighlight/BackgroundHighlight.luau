local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local NumberSequence1 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(0.1, 1),
	NumberSequenceKeypoint.new(0.9, 1),
	NumberSequenceKeypoint.new(1, 0)
})
local NumberSequence2 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.6, 1),
	NumberSequenceKeypoint.new(0.85, 0.15),
	NumberSequenceKeypoint.new(1, 0)
})

local function Gradient(p1) --[[ Line: 32 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy)
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ZIndex = 1,
		BackgroundColor3 = UseTokensFunction().Color.Surface.Surface_0.Color3,
		Size = UDim2.fromScale(1, 1)
	}, {
		UIGradient = ReactModule.createElement("UIGradient", { Rotation = p1.Rotation, Transparency = p1.Transparency })
	})
end

return function(p1) --[[ Line: 48 | Named "BackgroundHighlight" ]]
	-- upvalues: ReactModule (copy), Gradient (copy), NumberSequence2 (copy), NumberSequence1 (copy)
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1.2, 1.2),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		BackgroundTransparency = p1.highlightColor.Transparency,
		BackgroundColor3 = p1.highlightColor.Color3,
		ZIndex = p1.ZIndex or 0
	}, {
		TriangleGradientBottom = ReactModule.createElement(Gradient, { Rotation = 90, Transparency = NumberSequence2 }),
		TriangleGradientLeft = ReactModule.createElement(Gradient, { Rotation = 210, Transparency = NumberSequence2 }),
		TriangleGradientRight = ReactModule.createElement(Gradient, { Rotation = 330, Transparency = NumberSequence2 }),
		EdgeGradientHorizontal = ReactModule.createElement(Gradient, { Rotation = 0, Transparency = NumberSequence1 }),
		EdgeGradientVertical = ReactModule.createElement(Gradient, { Rotation = 90, Transparency = NumberSequence1 })
	})
end