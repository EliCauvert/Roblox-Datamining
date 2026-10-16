local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local CheckIconModule = require(script.Parent.CheckIcon)
local FoundationFontFaceMigration = DependenciesModule.Foundation.Utility.Flags.FoundationFontFaceMigration
local NormalizeFontFaceFunction = DependenciesModule.Foundation.Utility.normalizeFontFace
local AlertViewCheckbox = Roact.Component:extend("AlertViewCheckbox")
AlertViewCheckbox.defaultProps = {
	Text = "",
	LayoutOrder = 0,
	checked = false,
	onActivated = function() --[[ Line: 14 ]] end
}

function AlertViewCheckbox.render(p1) --[[ Line: 18 ]]
	-- upvalues: UIBlox (copy), Roact (copy), CheckIconModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	return UIBlox.Style.withStyle(function(p2) --[[ Line: 19 ]]
		-- upvalues: Roact (upval), p1 (copy), CheckIconModule (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
		return Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = p1.props.LayoutOrder,
			Size = UDim2.new(1, 0, 0, 35)
		}, {
			List = Roact.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 10)
			}),
			Checkbox = Roact.createElement(CheckIconModule, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				checked = p1.props.checked,
				onActivated = p1.props.onActivated
			}),
			Label = Roact.createElement("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Size = UDim2.new(0.7, 0, 1, 0),
				Text = p1.props.Text,
				TextColor3 = p1.props.TextColor3 or p2.Theme.TextDefault.Color,
				TextSize = p1.props.TextSize or p2.Font.Body.RelativeSize * p2.Font.BaseSize,
				Font = if FoundationFontFaceMigration then nil else p1.props.Font or p2.Font.CaptionSubHeader.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p1.props.Font or p2.Font.CaptionSubHeader.Font) else nil,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		})
	end)
end

return AlertViewCheckbox