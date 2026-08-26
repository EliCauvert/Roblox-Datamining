local parent = script.Parent.Parent.Parent.Parent
local appCommonLibModule = require(parent.AppCommonLib)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local text = appCommonLibModule.Text
local useStyle = UIBloxModule.Core.Style.useStyle

return function(p1)
	-- upvalues: useStyle (ref), reactModule (ref), text (ref), button (ref), buttonType (ref)
	local var1 = useStyle()
	local font = var1.Font.Header2.Font
	local var2 = var1.Font.BaseSize * var1.Font.Header2.RelativeSize
	local var3 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), text (copy), font (ref), var2 (ref)
		return if p1.buttonWidth then p1.buttonWidth else text.GetTextWidth(p1.text, font, var2) + 24
	end, { p1.text, font, var2, p1.buttonWidth })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = p1.AnchorPoint,
		LayoutOrder = p1.LayoutOrder,
		Position = p1.Position,
		Size = if p1.buttonHeight then UDim2.fromOffset(var3, p1.buttonHeight) else UDim2.new(0, var3, 1, 0)
	}, {
		ShowMoreButton = reactModule.createElement(button, {
			buttonType = buttonType.Secondary,
			onActivated = p1.onActivated,
			size = UDim2.fromScale(1, 1),
			text = p1.text
		})
	})
end