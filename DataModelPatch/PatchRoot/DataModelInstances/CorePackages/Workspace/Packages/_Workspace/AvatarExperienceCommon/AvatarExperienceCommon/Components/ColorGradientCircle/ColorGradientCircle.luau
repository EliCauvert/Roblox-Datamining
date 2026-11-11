local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GenerateColorSequenceModule = require(script.Parent.Utils.generateColorSequence)
local AXColorGradientRenderFlatWithJustOneColor = game:DefineFastFlag("AXColorGradientRenderFlatWithJustOneColor", false)

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), AXColorGradientRenderFlatWithJustOneColor (copy), FoundationModule (copy), GenerateColorSequenceModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		Size = Frame.Size,
		Position = Frame.Position,
		AnchorPoint = Frame.AnchorPoint
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
		UIGradient = if AXColorGradientRenderFlatWithJustOneColor and #Frame.Colors == 1 then ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-full radius-circle",
			backgroundStyle = { Transparency = 0, Color3 = Frame.Colors[1] }
		}) else ReactModule.createElement("UIGradient", {
			Rotation = Frame.Rotation or 45,
			Color = GenerateColorSequenceModule(Frame.Colors),
			Transparency = Frame.Transparency or NumberSequence.new(0),
			Offset = Frame.Offset or Vector2.new(0, 0)
		}),
		UIStroke = if Frame.hasBorder then ReactModule.createElement("UIStroke", {
			Thickness = 2,
			Color = UseTokensResult.Color.System.Contrast.Color3
		}) else nil
	})
end