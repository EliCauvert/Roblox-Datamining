local Parent = script.Parent.Parent.Parent
local TranslatorModule = require(Parent.Translations.Translator)
local ReactModule = require(Parent.Parent.React)
local UseStyleModule = require(Parent.Core.Style.useStyle)

local function _(InputLabel, None)
	-- upvalues: ReactModule (copy), TranslatorModule (copy)
	return if None == nil or None == ReactModule.None then InputLabel elseif None then InputLabel .. "*" else TranslatorModule:FormatByKey("CommonUI.Controls.Input.Optional", { inputLabel = InputLabel })
end

return function(Frame)
	-- upvalues: UseStyleModule (copy), ReactModule (copy), TranslatorModule (copy)
	local InputLabel = UseStyleModule().Tokens.Component.InputLabel
	local Typography = InputLabel.Base.Typography
	local ContentColor = InputLabel.Base.ContentColor
	local Text = Frame.text
	local Required = Frame.required
	
	return ReactModule.createElement("TextLabel", {
		TextWrapped = true,
		BackgroundTransparency = 1,
		Text = if Required == nil or Required == ReactModule.None then Text elseif Required then Text .. "*" else TranslatorModule:FormatByKey("CommonUI.Controls.Input.Optional", { inputLabel = Text }),
		TextTransparency = ContentColor.Transparency,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextColor3 = ContentColor.Color3,
		Font = Typography.Font,
		TextSize = Typography.FontSize,
		LineHeight = Typography.LineHeight,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder
	})
end