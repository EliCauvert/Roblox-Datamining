local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Text = require(Parent.AppCommonLib).Text
local UseStyleFunction = UIBloxModule.Core.Style.useStyle

return function(Frame: Frame)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), Text (copy), Button (copy), ButtonType (copy)
	local UseStyleResult = UseStyleFunction()
	local HeaderFont = UseStyleResult.Font.Header2.Font
	local ScaledBaseSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Header2.RelativeSize
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Frame (copy), Text (upval), HeaderFont (copy), ScaledBaseSize (copy)
		return if Frame.buttonWidth then Frame.buttonWidth else Text.GetTextWidth(Frame.text, HeaderFont, ScaledBaseSize) + 24
	end, {
		Frame.text,
		HeaderFont,
		ScaledBaseSize,
		Frame.buttonWidth
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Frame.AnchorPoint,
		LayoutOrder = Frame.LayoutOrder,
		Position = Frame.Position,
		Size = if Frame.buttonHeight then UDim2.fromOffset(UseMemoResult, Frame.buttonHeight) else UDim2.new(0, UseMemoResult, 1, 0)
	}, {
		ShowMoreButton = ReactModule.createElement(Button, {
			buttonType = ButtonType.Secondary,
			onActivated = Frame.onActivated,
			size = UDim2.fromScale(1, 1),
			text = Frame.text
		})
	})
end