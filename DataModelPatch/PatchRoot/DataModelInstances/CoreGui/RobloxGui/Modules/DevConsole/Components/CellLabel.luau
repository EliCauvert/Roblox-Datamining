local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Constants)
local MainWindow = ConstantsModule.DefaultFontSize.MainWindow
local Text = ConstantsModule.Color.Text
local MainWindow1 = ConstantsModule.Font.MainWindow
local MainWindowBold = ConstantsModule.Font.MainWindowBold

return function(p1)
	-- upvalues: RoactModule (copy), MainWindow (copy), Text (copy), MainWindowBold (copy), MainWindow1 (copy)
	return RoactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		Text = p1.text,
		TextSize = MainWindow,
		TextColor3 = Text,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextWrapped = p1.textWrapped == nil or p1.textWrapped,
		TextTruncate = if p1.textTruncate == nil then nil else p1.textTruncate,
		Font = p1.bold and MainWindowBold or MainWindow1,
		Size = p1.size,
		Position = p1.pos,
		LayoutOrder = p1.layoutOrder,
		RichText = p1.richText
	})
end