local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local formatStatStringModule = require(parent.Common.FormatStatString)
local useStyle = require(parent_1.UIBlox).Core.Style.useStyle
local useLayoutValuesModule = require(parent.Common.useLayoutValues)
local fFlagRemoveNewPlayerListOverlayModule = require(parent.Flags.FFlagRemoveNewPlayerListOverlay)
local fFlagEnableMobilePlayerListOnConsoleModule = require(parent.Flags.FFlagEnableMobilePlayerListOnConsole)

return reactModule.memo(function(p1)
	-- upvalues: useStyle (ref), useLayoutValuesModule (ref), fFlagEnableMobilePlayerListOnConsoleModule (ref), reactModule (ref), formatStatStringModule (ref), fFlagRemoveNewPlayerListOverlayModule (ref)
	local font, var1
	local var2 = useStyle()
	local var3 = useLayoutValuesModule()
	local _ = nil
	local _ = nil
	local textDefault = var2.Theme.TextDefault
	local textStyle = p1.textStyle
	local var4 = if textStyle then textStyle.Color else textDefault.Color
	local var5 = if textStyle then textStyle.Transparency else textDefault.Transparency
	local var6 = if textStyle then textStyle.StrokeColor else nil
	local var7 = if textStyle and textStyle.StrokeTransparency then textStyle.StrokeTransparency else nil
	
	if var3.IsTenFoot then
		var1 = var3.StatTextSize
		font = if p1.isTeamEntry then var3.TeamStatFont else var3.StatFont
	else
		font = var2.Font.CaptionHeader.Font
		var1 = if fFlagEnableMobilePlayerListOnConsoleModule then var3.StatTextSize else var2.Font.CaptionHeader.RelativeSize * var2.Font.BaseSize
	end
	local var8 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), formatStatStringModule (copy), font (write), var1 (write), var4 (ref), var5 (ref), var6 (ref), var7 (ref)
		return {
			BackgroundTransparency = 1,
			Text = p1.statValue:map(function(p2)
				-- upvalues: formatStatStringModule (copy)
				return formatStatStringModule(p2)
			end),
			Size = p1.showStatTitle and UDim2.fromScale(1, 0.5) or UDim2.fromScale(1, 1),
			Position = p1.showStatTitle and UDim2.fromScale(0, 0.5) or UDim2.fromScale(0, 0),
			Font = font,
			TextSize = var1,
			TextColor3 = var4,
			TextTransparency = var5,
			TextStrokeColor3 = var6,
			TextStrokeTransparency = var7,
			TextTruncate = Enum.TextTruncate.AtEnd
		}
	end, {
		p1.showStatTitle, font, var1, var4, var5, var6, var7
	})
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0, var3.StatEntrySizeX, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		LayoutOrder = p1.layoutOrder,
		BackgroundTransparency = if p1.backgroundStyle then p1.backgroundStyle.Transparency else 1,
		BackgroundColor3 = if p1.backgroundStyle then p1.backgroundStyle.Color else nil
	}, {
		PlayerStatDisplay = if p1.showStatTitle and p1.statName then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			StatTitle = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Text = p1.statName,
				Size = UDim2.fromScale(1, 0.5),
				Position = UDim2.fromScale(0, 0),
				Font = var3.TitleStatFont,
				TextSize = var1,
				TextColor3 = var4,
				TextTransparency = var5,
				TextStrokeColor3 = var6,
				TextStrokeTransparency = var7,
				TextTruncate = Enum.TextTruncate.AtEnd
			}),
			StatText = reactModule.createElement("TextLabel", var8)
		}) else reactModule.createElement("TextLabel", var8),
		DoubleOverLay = if fFlagRemoveNewPlayerListOverlayModule or not p1.doubleOverlay or not p1.overlayStyle then nil else reactModule.createElement("Frame", {
			ZIndex = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p1.overlayStyle.Transparency,
			BackgroundColor3 = p1.overlayStyle.Color
		}),
		OverlayFrame = if fFlagRemoveNewPlayerListOverlayModule or not p1.overlayStyle then nil else reactModule.createElement("Frame", {
			ZIndex = 2,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p1.overlayStyle.Transparency,
			BackgroundColor3 = p1.overlayStyle.Color
		})
	})
end)