local parent = script.Parent.Parent.Parent.Parent
local appCommonLibModule = require(parent.AppCommonLib)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local text = appCommonLibModule.Text
local useStyle = UIBloxModule.Core.Style.useStyle

return function(p0)
	-- upvalues: useStyle (ref), reactModule (ref), text (ref), button (ref), buttonType (ref)
	local var3 = useStyle()
	local font = var3.Font.Header2.Font
	local var4 = var3.Font.BaseSize * var3.Font.Header2.RelativeSize
	local var5 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), text (copy), font (ref), var4 (ref)
		return if p0.buttonWidth then p0.buttonWidth else text.GetTextWidth(p0.text, font, var4) + 24
	end, { p0.text, font, var4, p0.buttonWidth })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = p0.AnchorPoint,
		LayoutOrder = p0.LayoutOrder,
		Position = p0.Position,
		Size = if p0.buttonHeight then UDim2.fromOffset(var5, p0.buttonHeight) else UDim2.new(0, var5, 1, 0)
	}, {
		ShowMoreButton = reactModule.createElement(button, {
			buttonType = buttonType.Secondary,
			onActivated = p0.onActivated,
			size = UDim2.fromScale(1, 1),
			text = p0.text
		})
	})
end