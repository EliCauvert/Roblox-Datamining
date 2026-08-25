local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local formatStatStringModule = require(parent.Common.FormatStatString)
local useStyle = require(parent_1.UIBlox).Core.Style.useStyle
local useLayoutValuesModule = require(parent.Common.useLayoutValues)
local fFlagRemoveNewPlayerListOverlayModule = require(parent.Flags.FFlagRemoveNewPlayerListOverlay)
local fFlagEnableMobilePlayerListOnConsoleModule = require(parent.Flags.FFlagEnableMobilePlayerListOnConsole)

return reactModule.memo(function(p0)
	-- upvalues: useStyle (ref), useLayoutValuesModule (ref), fFlagEnableMobilePlayerListOnConsoleModule (ref), reactModule (ref), formatStatStringModule (ref), fFlagRemoveNewPlayerListOverlayModule (ref)
	local font, var11
	local var5 = useStyle()
	local var6 = useLayoutValuesModule()
	local _ = nil
	local _ = nil
	local textDefault = var5.Theme.TextDefault
	local textStyle = p0.textStyle
	local var7 = if textStyle then textStyle.Color else textDefault.Color
	local var8 = if textStyle then textStyle.Transparency else textDefault.Transparency
	local var9 = if textStyle then textStyle.StrokeColor else nil
	local var10 = if textStyle and textStyle.StrokeTransparency then textStyle.StrokeTransparency else nil
	
	if var6.IsTenFoot then
		var11 = var6.StatTextSize
		font = if p0.isTeamEntry then var6.TeamStatFont else var6.StatFont
	else
		font = var5.Font.CaptionHeader.Font
		var11 = if fFlagEnableMobilePlayerListOnConsoleModule then var6.StatTextSize else var5.Font.CaptionHeader.RelativeSize * var5.Font.BaseSize
	end
	local var12 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), formatStatStringModule (copy), font (write), var11 (write), var7 (ref), var8 (ref), var9 (ref), var10 (ref)
		return {
			BackgroundTransparency = 1,
			Text = p0.statValue:map(function(p1)
				-- upvalues: formatStatStringModule (copy)
				return formatStatStringModule(p1)
			end),
			Size = p0.showStatTitle and UDim2.fromScale(1, 0.5) or UDim2.fromScale(1, 1),
			Position = p0.showStatTitle and UDim2.fromScale(0, 0.5) or UDim2.fromScale(0, 0),
			Font = font,
			TextSize = var11,
			TextColor3 = var7,
			TextTransparency = var8,
			TextStrokeColor3 = var9,
			TextStrokeTransparency = var10,
			TextTruncate = Enum.TextTruncate.AtEnd
		}
	end, {
		p0.showStatTitle, font, var11, var7, var8, var9, var10
	})
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0, var6.StatEntrySizeX, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		LayoutOrder = p0.layoutOrder,
		BackgroundTransparency = if p0.backgroundStyle then p0.backgroundStyle.Transparency else 1,
		BackgroundColor3 = if p0.backgroundStyle then p0.backgroundStyle.Color else nil
	}, {
		PlayerStatDisplay = if p0.showStatTitle and p0.statName then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			StatTitle = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Text = p0.statName,
				Size = UDim2.fromScale(1, 0.5),
				Position = UDim2.fromScale(0, 0),
				Font = var6.TitleStatFont,
				TextSize = var11,
				TextColor3 = var7,
				TextTransparency = var8,
				TextStrokeColor3 = var9,
				TextStrokeTransparency = var10,
				TextTruncate = Enum.TextTruncate.AtEnd
			}),
			StatText = reactModule.createElement("TextLabel", var12)
		}) else reactModule.createElement("TextLabel", var12),
		DoubleOverLay = if fFlagRemoveNewPlayerListOverlayModule or not p0.doubleOverlay or not p0.overlayStyle then nil else reactModule.createElement("Frame", {
			ZIndex = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p0.overlayStyle.Transparency,
			BackgroundColor3 = p0.overlayStyle.Color
		}),
		OverlayFrame = if fFlagRemoveNewPlayerListOverlayModule or not p0.overlayStyle then nil else reactModule.createElement("Frame", {
			ZIndex = 2,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p0.overlayStyle.Transparency,
			BackgroundColor3 = p0.overlayStyle.Color
		})
	})
end)