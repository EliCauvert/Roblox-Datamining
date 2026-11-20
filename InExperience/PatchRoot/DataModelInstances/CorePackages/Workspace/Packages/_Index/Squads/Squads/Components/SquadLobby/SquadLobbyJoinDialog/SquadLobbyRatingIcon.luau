local Parent = script:FindFirstAncestor("Squads").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy)
	local ScaledScale = 52 * UseTokensFunction().Config.UI.Scale
	
	return ReactModule.createElement(FoundationModule.Image, {
		Image = p1.image,
		ScaleType = Enum.ScaleType.Fit,
		Size = UDim2.fromOffset(math.round(ScaledScale * p1.aspectRatio), (math.round(ScaledScale))),
		testId = p1.testId
	})
end