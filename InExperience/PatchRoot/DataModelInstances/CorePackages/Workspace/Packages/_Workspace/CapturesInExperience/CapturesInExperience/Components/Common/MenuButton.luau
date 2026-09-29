local parent = script.Parent.Parent.Parent.Parent
local appCommonLibModule = require(parent.AppCommonLib)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local getTextSize = require(parent.Style).GetTextSize
local foundationFontFaceMigration = require(parent.Foundation).Utility.Flags.FoundationFontFaceMigration
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local text = appCommonLibModule.Text
local useStyle = UIBloxModule.Core.Style.useStyle

return function(p1)
	-- upvalues: useStyle (ref), foundationFontFaceMigration (ref), reactModule (ref), getTextSize (ref), text (ref), button (ref), buttonType (ref)
	local var1 = useStyle()
	local var2 = if foundationFontFaceMigration then var1.Tokens.Typography.TitleLarge.Font else var1.Font.Header2.Font
	local var3 = var1.Font.BaseSize * var1.Font.Header2.RelativeSize
	local var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), foundationFontFaceMigration (copy), getTextSize (copy), var3 (ref), var2 (ref), text (copy)
		return if p1.buttonWidth then p1.buttonWidth else (if foundationFontFaceMigration then getTextSize(p1.text, var3, var2, Vector2.new(10000, 10000)).X else text.GetTextWidth(p1.text, var2, var3)) + 24
	end, { p1.text, var2, var3, p1.buttonWidth })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = p1.AnchorPoint,
		LayoutOrder = p1.LayoutOrder,
		Position = p1.Position,
		Size = if p1.buttonHeight then UDim2.fromOffset(var4, p1.buttonHeight) else UDim2.new(0, var4, 1, 0)
	}, {
		ShowMoreButton = reactModule.createElement(button, {
			buttonType = buttonType.Secondary,
			onActivated = p1.onActivated,
			size = UDim2.fromScale(1, 1),
			text = p1.text
		})
	})
end