local DependenciesModule = require(script:FindFirstAncestor("SocialTab").dependencies)
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local T = DependenciesModule.t
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local ValidateColorInfo = UIBlox.Style.Validator.validateColorInfo
local Llama = DependenciesModule.llama
local StyledImageSetLabel = Roact.PureComponent:extend("StyledImageSetLabel")
StyledImageSetLabel.defaultProps = {
	BorderSizePixel = 0,
	Image = "",
	BackgroundStyle = { Transparency = 1, Color = Color3.fromRGB(0, 0, 0) },
	ImageStyle = { Transparency = 0, Color = Color3.fromRGB(255, 255, 255) },
	Size = UDim2.new(1, 0, 1, 0)
}
StyledImageSetLabel.validateProps = T.interface({
	BackgroundStyle = T.optional(ValidateColorInfo),
	ImageStyle = T.optional(ValidateColorInfo),
	Image = T.optional(T.union(T.string, UIBlox.Core.ImageSet.Validator.validateImage))
})

function StyledImageSetLabel.render(p1)
	-- upvalues: Roact (copy), ImageSetLabel (copy), Llama (copy)
	return Roact.createElement(ImageSetLabel, Llama.Dictionary.join({
		BackgroundColor3 = p1.props.BackgroundStyle.Color,
		BackgroundTransparency = p1.props.BackgroundStyle.Transparency,
		ImageColor3 = p1.props.ImageStyle.Color,
		ImageTransparency = p1.props.ImageStyle.Transparency
	}, p1.props, {
		BackgroundStyle = Llama.None,
		ImageStyle = Llama.None,
		[Roact.Children] = Llama.None
	}), p1.props[Roact.Children])
end

return StyledImageSetLabel