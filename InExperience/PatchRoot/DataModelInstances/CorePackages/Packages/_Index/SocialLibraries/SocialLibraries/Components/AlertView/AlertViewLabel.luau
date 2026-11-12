local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local FoundationFontFaceMigration = DependenciesModule.Foundation.Utility.Flags.FoundationFontFaceMigration
local NormalizeFontFaceFunction = DependenciesModule.Foundation.Utility.normalizeFontFace
local AlertViewLabel = Roact.PureComponent:extend("AlertViewLabel")
AlertViewLabel.defaultProps = {
	BackgroundTransparency = 1,
	Text = "",
	Size = UDim2.new(1, 0, 0, 40),
	TextXAlignment = Enum.TextXAlignment.Center
}

function AlertViewLabel.render(p1)
	-- upvalues: UIBlox (copy), Roact (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	return UIBlox.Style.withStyle(function(p2)
		-- upvalues: p1 (copy), Roact (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
		local _Font = p1.props.Font or p2.Font.Body.Font
		
		return Roact.createElement("TextLabel", {
			TextWrapped = true,
			BackgroundTransparency = p1.props.BackgroundTransparency,
			Font = if FoundationFontFaceMigration then nil else _Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(_Font) else nil,
			LayoutOrder = p1.props.LayoutOrder,
			Size = p1.props.Size,
			Text = p1.props.Text,
			TextColor3 = p1.props.TextColor3 or p2.Theme.TextDefault.Color,
			TextSize = p1.props.TextSize or p2.Font.Body.RelativeSize * p2.Font.BaseSize,
			TextXAlignment = p1.props.TextXAlignment
		})
	end)
end

return AlertViewLabel