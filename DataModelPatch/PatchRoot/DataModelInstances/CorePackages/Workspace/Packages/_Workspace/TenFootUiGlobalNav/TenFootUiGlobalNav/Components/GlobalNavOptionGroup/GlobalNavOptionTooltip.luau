local Parent = script:FindFirstAncestor("TenFootUiGlobalNav").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local TenFootUiGlobalNavFixOptionText = game:DefineFastFlag("TenFootUiGlobalNavFixOptionText", false)

return function(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), StyledTextLabel (copy), TenFootUiGlobalNavFixOptionText (copy)
	local UseStyleResult = UseStyleFunction()
	
	return ReactModule.createElement("Frame", {
		[ReactModule.Tag] = "data-testid=GlobalNavOptionTooltip",
		Transparency = 1,
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 300, 1, 0),
		AnchorPoint = Vector2.new(0.5, -1),
		Position = UDim2.new(0, p1.xOffset, 0, p1.yOffset)
	}, ReactModule.createElement(StyledTextLabel, {
		size = UDim2.new(1, 0, 1, 0),
		text = p1.label,
		textXAlignment = Enum.TextXAlignment.Center,
		colorStyle = {
			Transparency = 0,
			Color = UseStyleResult.Theme.TextDefault.Color
		},
		fontStyle = if TenFootUiGlobalNavFixOptionText then UseStyleResult.Tokens.Typography.BodyLarge else UseStyleResult.Font.Header2
	}))
end