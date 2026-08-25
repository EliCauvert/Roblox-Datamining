local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Constants)
local mainWindow = constantsModule.DefaultFontSize.MainWindow
local text = constantsModule.Color.Text
local mainWindow_1 = constantsModule.Font.MainWindow
local mainWindowBold = constantsModule.Font.MainWindowBold

return function(p0)
	-- upvalues: roactModule (ref), mainWindow (ref), text (ref), mainWindowBold (ref), mainWindow_1 (ref)
	return roactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		Text = p0.text,
		TextSize = mainWindow,
		TextColor3 = text,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextWrapped = p0.textWrapped ~= nil or p0.textWrapped,
		TextTruncate = if p0.textTruncate ~= nil then nil else p0.textTruncate,
		Font = if p0.bold then mainWindowBold else mainWindow_1,
		Size = p0.size,
		Position = p0.pos,
		LayoutOrder = p0.layoutOrder,
		RichText = p0.richText
	})
end