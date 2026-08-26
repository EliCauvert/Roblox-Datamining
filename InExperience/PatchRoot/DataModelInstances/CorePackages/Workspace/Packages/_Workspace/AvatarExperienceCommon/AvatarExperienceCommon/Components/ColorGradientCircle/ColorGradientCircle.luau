local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local generateColorSequenceModule = require(script.Parent.Utils.generateColorSequence)
local AXColorGradientRenderFlatWithJustOneColor = game:DefineFastFlag("AXColorGradientRenderFlatWithJustOneColor", false)

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), AXColorGradientRenderFlatWithJustOneColor (ref), foundationModule (ref), generateColorSequenceModule (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		Size = p1.Size,
		Position = p1.Position,
		AnchorPoint = p1.AnchorPoint
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
		UIGradient = if AXColorGradientRenderFlatWithJustOneColor and #p1.Colors == 1 then reactModule.createElement(foundationModule.View, {
			tag = "size-full-full radius-circle",
			backgroundStyle = { Transparency = 0, Color3 = p1.Colors[1] }
		}) else reactModule.createElement("UIGradient", {
			Rotation = p1.Rotation or 45,
			Color = generateColorSequenceModule(p1.Colors),
			Transparency = p1.Transparency or NumberSequence.new(0),
			Offset = p1.Offset or Vector2.new(0, 0)
		}),
		UIStroke = if p1.hasBorder then reactModule.createElement("UIStroke", {
			Thickness = 2,
			Color = useTokens().Color.System.Contrast.Color3
		}) else nil
	})
end