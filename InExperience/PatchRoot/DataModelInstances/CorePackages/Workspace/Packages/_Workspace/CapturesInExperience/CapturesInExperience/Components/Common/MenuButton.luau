local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseStyleFunction = UIBloxModule.Core.Style.useStyle

return function(Frame: Frame)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), GetTextSizeFunction (copy), Button (copy), ButtonType (copy)
	local UseStyleResult = UseStyleFunction()
	local TitleLargeFont = UseStyleResult.Tokens.Typography.TitleLarge.Font
	local ScaledBaseSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Header2.RelativeSize
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Frame (copy), GetTextSizeFunction (upval), ScaledBaseSize (copy), TitleLargeFont (copy)
		return if Frame.buttonWidth then Frame.buttonWidth else GetTextSizeFunction(Frame.text, ScaledBaseSize, TitleLargeFont, Vector2.new(10000, 10000)).X + 24
	end, {
		Frame.text,
		TitleLargeFont,
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