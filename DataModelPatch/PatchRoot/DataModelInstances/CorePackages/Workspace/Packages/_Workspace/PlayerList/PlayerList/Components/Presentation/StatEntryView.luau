local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FormatStatStringModule = require(Parent.Common.FormatStatString)
local UseStyleFunction = require(Parent1.UIBlox).Core.Style.useStyle
local UseLayoutValuesModule = require(Parent.Common.useLayoutValues)
local FFlagRemoveNewPlayerListOverlayModule = require(Parent.Flags.FFlagRemoveNewPlayerListOverlay)
local FFlagEnableMobilePlayerListOnConsoleModule = require(Parent.Flags.FFlagEnableMobilePlayerListOnConsole)

return ReactModule.memo(function(p1)
	-- upvalues: UseStyleFunction (copy), UseLayoutValuesModule (copy), FFlagEnableMobilePlayerListOnConsoleModule (copy), ReactModule (copy), FormatStatStringModule (copy), FFlagRemoveNewPlayerListOverlayModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseLayoutValuesModuleResult = UseLayoutValuesModule()
	local CaptionHeaderFont = nil
	local StatTextSize = nil
	local TextDefault = UseStyleResult.Theme.TextDefault
	local TextStyle = p1.textStyle
	local Color = if TextStyle then TextStyle.Color else TextDefault.Color
	local Transparency = if TextStyle then TextStyle.Transparency else TextDefault.Transparency
	local StrokeColor = if TextStyle then TextStyle.StrokeColor else nil
	local StrokeTransparency = if TextStyle and TextStyle.StrokeTransparency then TextStyle.StrokeTransparency else nil
	
	if UseLayoutValuesModuleResult.IsTenFoot then
		StatTextSize = UseLayoutValuesModuleResult.StatTextSize
		CaptionHeaderFont = if p1.isTeamEntry then UseLayoutValuesModuleResult.TeamStatFont else UseLayoutValuesModuleResult.StatFont
	else
		CaptionHeaderFont = UseStyleResult.Font.CaptionHeader.Font
		StatTextSize = if FFlagEnableMobilePlayerListOnConsoleModule then UseLayoutValuesModuleResult.StatTextSize else UseStyleResult.Font.CaptionHeader.RelativeSize * UseStyleResult.Font.BaseSize
	end
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), FormatStatStringModule (upval), CaptionHeaderFont (ref), StatTextSize (ref), Color (copy), Transparency (copy), StrokeColor (copy), StrokeTransparency (copy)
		return {
			BackgroundTransparency = 1,
			Text = p1.statValue:map(function(p2)
				-- upvalues: FormatStatStringModule (upval)
				return FormatStatStringModule(p2)
			end),
			Size = p1.showStatTitle and UDim2.fromScale(1, 0.5) or UDim2.fromScale(1, 1),
			Position = p1.showStatTitle and UDim2.fromScale(0, 0.5) or UDim2.fromScale(0, 0),
			Font = CaptionHeaderFont,
			TextSize = StatTextSize,
			TextColor3 = Color,
			TextTransparency = Transparency,
			TextStrokeColor3 = StrokeColor,
			TextStrokeTransparency = StrokeTransparency,
			TextTruncate = Enum.TextTruncate.AtEnd
		}
	end, {
		p1.showStatTitle, CaptionHeaderFont, StatTextSize, Color, Transparency,
		StrokeColor, StrokeTransparency
	})
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0, UseLayoutValuesModuleResult.StatEntrySizeX, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		LayoutOrder = p1.layoutOrder,
		BackgroundTransparency = if p1.backgroundStyle then p1.backgroundStyle.Transparency else 1,
		BackgroundColor3 = if p1.backgroundStyle then p1.backgroundStyle.Color else nil
	}, {
		PlayerStatDisplay = if p1.showStatTitle and p1.statName then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			StatTitle = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Text = p1.statName,
				Size = UDim2.fromScale(1, 0.5),
				Position = UDim2.fromScale(0, 0),
				Font = UseLayoutValuesModuleResult.TitleStatFont,
				TextSize = StatTextSize,
				TextColor3 = Color,
				TextTransparency = Transparency,
				TextStrokeColor3 = StrokeColor,
				TextStrokeTransparency = StrokeTransparency,
				TextTruncate = Enum.TextTruncate.AtEnd
			}),
			StatText = ReactModule.createElement("TextLabel", UseMemoResult)
		}) else ReactModule.createElement("TextLabel", UseMemoResult),
		DoubleOverLay = if FFlagRemoveNewPlayerListOverlayModule or not p1.doubleOverlay or not p1.overlayStyle then nil else ReactModule.createElement("Frame", {
			ZIndex = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p1.overlayStyle.Transparency,
			BackgroundColor3 = p1.overlayStyle.Color
		}),
		OverlayFrame = if FFlagRemoveNewPlayerListOverlayModule or not p1.overlayStyle then nil else ReactModule.createElement("Frame", {
			ZIndex = 2,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p1.overlayStyle.Transparency,
			BackgroundColor3 = p1.overlayStyle.Color
		})
	})
end)