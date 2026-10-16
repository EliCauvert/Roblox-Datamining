local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local FoundationFontFaceMigration = require(Parent.Foundation).Utility.Flags.FoundationFontFaceMigration
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Text = require(Parent.AppCommonLib).Text
local UseStyleFunction = UIBloxModule.Core.Style.useStyle

return function(Frame: Frame) --[[ Line: 28 ]]
	-- upvalues: UseStyleFunction (copy), FoundationFontFaceMigration (copy), ReactModule (copy), GetTextSizeFunction (copy), Text (copy), Button (copy), ButtonType (copy)
	local UseStyleResult = UseStyleFunction()
	local TitleLargeFont = if FoundationFontFaceMigration then UseStyleResult.Tokens.Typography.TitleLarge.Font else UseStyleResult.Font.Header2.Font
	local ScaledBaseSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Header2.RelativeSize
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 36 ]]
		-- upvalues: Frame (copy), FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), ScaledBaseSize (copy), TitleLargeFont (copy), Text (upval)
		return if Frame.buttonWidth then Frame.buttonWidth else (if FoundationFontFaceMigration then GetTextSizeFunction(Frame.text, ScaledBaseSize, TitleLargeFont, Vector2.new(10000, 10000)).X else Text.GetTextWidth(Frame.text, TitleLargeFont, ScaledBaseSize)) + 24
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