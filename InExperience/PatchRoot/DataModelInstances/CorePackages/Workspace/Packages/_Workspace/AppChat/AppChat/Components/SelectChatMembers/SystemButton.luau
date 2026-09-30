local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local getTextSize = require(parent.Style).GetTextSize
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local text = require(parent.AppCommonLib).Text
local systemButton = roactModule.PureComponent:extend("SystemButton")
systemButton.defaultProps = { text = "Text", enabled = false, onActivated = nil }

function systemButton.render(p1)
	-- upvalues: UIBloxModule (ref), foundationFontFaceMigration (ref), getTextSize (ref), text (ref), roactModule (ref), normalizeFontFace (ref)
	return UIBloxModule.Style.withStyle(function(p2)
		-- upvalues: p1 (ref), foundationFontFaceMigration (copy), getTextSize (copy), text (copy), roactModule (copy), normalizeFontFace (copy)
		local text_1 = p1.props.text
		local font = p2.Font.Header1.Font
		local var1 = if foundationFontFaceMigration then getTextSize(text_1, 24, p2.Tokens.Typography.HeadingSmall.Font, Vector2.new(10000, 10000)).X else text.GetTextWidth(text_1, font, 24)
		
		return roactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			Text = "",
			Size = UDim2.new(0, var1 + 8, 1, 0),
			[roactModule.Event.Activated] = p1.props.onActivated
		}, {
			layout = roactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			label = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 24,
				Size = UDim2.new(0, var1, 0, 24),
				Text = text_1,
				Font = if foundationFontFaceMigration then nil else font,
				FontFace = if foundationFontFaceMigration then normalizeFontFace(p2.Tokens.Typography.HeadingSmall.Font) else nil,
				TextColor3 = p2.Theme.SystemPrimaryDefault.Color,
				TextTransparency = if p1.props.enabled then 0 else 0.7
			})
		})
	end)
end

return systemButton