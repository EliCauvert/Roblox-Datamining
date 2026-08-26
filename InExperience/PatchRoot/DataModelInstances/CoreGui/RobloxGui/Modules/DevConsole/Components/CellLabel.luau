local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Constants)
local mainWindow = constantsModule.DefaultFontSize.MainWindow
local text = constantsModule.Color.Text
local mainWindow_1 = constantsModule.Font.MainWindow
local mainWindowBold = constantsModule.Font.MainWindowBold

return function(p1)
	-- upvalues: roactModule (ref), mainWindow (ref), text (ref), mainWindowBold (ref), mainWindow_1 (ref)
	return roactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		Text = p1.text,
		TextSize = mainWindow,
		TextColor3 = text,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextWrapped = p1.textWrapped ~= nil or p1.textWrapped,
		TextTruncate = if p1.textTruncate ~= nil then nil else p1.textTruncate,
		Font = if p1.bold then mainWindowBold else mainWindow_1,
		Size = p1.size,
		Position = p1.pos,
		LayoutOrder = p1.layoutOrder,
		RichText = p1.richText
	})
end