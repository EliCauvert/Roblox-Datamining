local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FoundationFontFaceMigration = require(Parent1.SharedFlags).FFlagFontFacePlayerList and FoundationModule.Utility.Flags.FoundationFontFaceMigration
local FormatStatStringModule = require(Parent.Common.FormatStatString)
local UseStyleFunction = require(Parent1.UIBlox).Core.Style.useStyle
local UseLayoutValuesModule = require(Parent.Common.useLayoutValues)
local FFlagRemoveNewPlayerListOverlayModule = require(Parent.Flags.FFlagRemoveNewPlayerListOverlay)
local FFlagEnableMobilePlayerListOnConsoleModule = require(Parent.Flags.FFlagEnableMobilePlayerListOnConsole)

return ReactModule.memo(function(p1) --[[ Line: 41 ]]
	-- upvalues: UseStyleFunction (copy), UseLayoutValuesModule (copy), FoundationFontFaceMigration (copy), UseTokensFunction (copy), NormalizeFontFaceFunction (copy), FFlagEnableMobilePlayerListOnConsoleModule (copy), ReactModule (copy), FormatStatStringModule (copy), FFlagRemoveNewPlayerListOverlayModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseLayoutValuesModuleResult = UseLayoutValuesModule()
	local UseTokensResult = if FoundationFontFaceMigration then UseTokensFunction() else nil
	local NormalizeFontFaceResult = nil
	local StatTextSize = nil
	local TextDefault = UseStyleResult.Theme.TextDefault
	local TextStyle = p1.textStyle
	local Color = if TextStyle then TextStyle.Color else TextDefault.Color
	local Transparency = if TextStyle then TextStyle.Transparency else TextDefault.Transparency
	local StrokeColor = if TextStyle then TextStyle.StrokeColor else nil
	local StrokeTransparency = if TextStyle and TextStyle.StrokeTransparency then TextStyle.StrokeTransparency else nil
	
	if UseLayoutValuesModuleResult.IsTenFoot then
		StatTextSize = UseLayoutValuesModuleResult.StatTextSize
		NormalizeFontFaceResult = if p1.isTeamEntry then if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseLayoutValuesModuleResult.TeamStatFont) else UseLayoutValuesModuleResult.TeamStatFont elseif FoundationFontFaceMigration then NormalizeFontFaceFunction(UseLayoutValuesModuleResult.StatFont) else UseLayoutValuesModuleResult.StatFont
	else
		NormalizeFontFaceResult = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.CaptionLarge.Font) else UseStyleResult.Font.CaptionHeader.Font
		StatTextSize = if FFlagEnableMobilePlayerListOnConsoleModule then UseLayoutValuesModuleResult.StatTextSize else UseStyleResult.Font.CaptionHeader.RelativeSize * UseStyleResult.Font.BaseSize
	end
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 73 ]]
		-- upvalues: p1 (copy), FormatStatStringModule (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceResult (ref), StatTextSize (ref), Color (copy), Transparency (copy), StrokeColor (copy), StrokeTransparency (copy)
		return {
			BackgroundTransparency = 1,
			Text = p1.statValue:map(function(p2) --[[ Line: 75 ]]
				-- upvalues: FormatStatStringModule (upval)
				return FormatStatStringModule(p2)
			end),
			Size = p1.showStatTitle and UDim2.fromScale(1, 0.5) or UDim2.fromScale(1, 1),
			Position = p1.showStatTitle and UDim2.fromScale(0, 0.5) or UDim2.fromScale(0, 0),
			Font = if FoundationFontFaceMigration then nil else NormalizeFontFaceResult,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceResult else nil,
			TextSize = StatTextSize,
			TextColor3 = Color,
			TextTransparency = Transparency,
			TextStrokeColor3 = StrokeColor,
			TextStrokeTransparency = StrokeTransparency,
			TextTruncate = Enum.TextTruncate.AtEnd
		}
	end, {
		p1.showStatTitle, NormalizeFontFaceResult, StatTextSize, Color, Transparency,
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
				Font = if FoundationFontFaceMigration then nil else UseLayoutValuesModuleResult.TitleStatFont,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseLayoutValuesModuleResult.TitleStatFont) else nil,
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