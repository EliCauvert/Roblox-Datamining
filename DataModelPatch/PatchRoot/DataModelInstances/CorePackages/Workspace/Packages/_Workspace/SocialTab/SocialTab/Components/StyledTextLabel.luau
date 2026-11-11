local DependenciesModule = require(script:FindFirstAncestor("SocialTab").dependencies)
local Roact = DependenciesModule.Roact
local T = DependenciesModule.t
local UIBlox = DependenciesModule.UIBlox
local Llama = DependenciesModule.llama
local WithStyleFunction = UIBlox.Style.withStyle
local ValidateColorInfo = UIBlox.Style.Validator.validateColorInfo
local StyledTextLabel = Roact.PureComponent:extend("StyledTextLabel")
StyledTextLabel.defaultProps = {
	BorderSizePixel = 0,
	Text = "Text",
	BackgroundStyle = { Transparency = 1, Color = Color3.fromRGB(0, 0, 0) },
	FontStyle = {
		RelativeSize = 1,
		RelativeMinSize = 1,
		Font = Enum.Font.Gotham
	},
	TextStyle = { Transparency = 1, Color = Color3.fromRGB(0, 0, 0) },
	Size = UDim2.new(1, 0, 1, 0)
}
StyledTextLabel.validateProps = T.interface({
	BackgroundStyle = T.optional(ValidateColorInfo),
	FontStyle = T.optional(UIBlox.Style.Validator.validateFontInfo),
	TextStyle = T.optional(ValidateColorInfo),
	Text = T.optional(T.string)
})

function StyledTextLabel.render(p1)
	-- upvalues: WithStyleFunction (copy), Roact (copy), Llama (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), Roact (upval), Llama (upval)
		return Roact.createElement("TextLabel", Llama.Dictionary.join({
			BackgroundColor3 = p1.props.BackgroundStyle.Color,
			BackgroundTransparency = p1.props.BackgroundStyle.Transparency,
			Font = p1.props.FontStyle.Font,
			TextSize = p1.props.FontStyle.RelativeSize * p2.Font.BaseSize,
			TextColor3 = p1.props.TextStyle.Color,
			TextTransparency = p1.props.TextStyle.Transparency
		}, p1.props, {
			BackgroundStyle = Llama.None,
			FontStyle = Llama.None,
			TextStyle = Llama.None
		}))
	end)
end

return StyledTextLabel