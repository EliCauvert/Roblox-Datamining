local Parent = script:FindFirstAncestor("AppBlox").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Text = FoundationModule.Text
local View = FoundationModule.View
local ControlState = FoundationModule.Enums.ControlState
local UsePropertyFunction = require(Parent.GuiObjectUtils).useProperty
local UseTokensFunction = FoundationModule.Hooks.useTokens
local SignalsReactModule = require(Parent.SignalsReact)
local TextSizeModule = require(Parent.TextSize)
local CryoModule = require(Parent.Cryo)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiExperienceDetailsSupport = SharedFlagsModule.FFlagSduiExperienceDetailsSupport
local LuaAppExpandableTextNewLineStrip = game:DefineFastFlag("LuaAppExpandableTextNewLineStrip", true)
local LuaAppExpandableTextAdjustClipToContent = game:DefineFastFlag("LuaAppExpandableTextAdjustClipToContent", false)
local FFlagLuaAppExpandableTextTappableText = SharedFlagsModule.FFlagLuaAppExpandableTextTappableText
local config = { Selectable = true }

local function v15() end

local config1 = {
	affordance = FoundationModule.Enums.StateLayerAffordance.None
}

local function getCompactLineMeasureText(CompactNumberOfLines: number): string
	if CompactNumberOfLines <= 0 then
		return ""
	end
	local List = {}
	
	for _ = 1, CompactNumberOfLines do
		table.insert(List, "A")
	end
	return (table.concat(List, "\n"))
end

local function _(p1: number, NewFloored: number, p2: number, p3): number
	local v1 = if NewFloored > 0 and p1 > 0 then p1 / NewFloored else 0
	
	if v1 > 0 and p2 > 0 and math.floor(p2 / v1 + 0.5) + 1 == NewFloored then
		local Value = p1 + v1
		
		if Value < p3 then
			return (math.ceil(Value))
		end
	end
	return p1
end

return ReactModule.memo(function(Frame)
	-- upvalues: LuaAppExpandableTextNewLineStrip (copy), SignalsReactModule (copy), TextSizeModule (copy), UseTokensFunction (copy), CryoModule (copy), FFlagLuaAppExpandableTextTappableText (copy), ReactModule (copy), ControlState (copy), UseLocalizationFunction (copy), UsePropertyFunction (copy), LuaAppExpandableTextAdjustClipToContent (copy), View (copy), FFlagSduiExperienceDetailsSupport (copy), config (copy), v15 (copy), config1 (copy), Text (copy), getCompactLineMeasureText (copy)
	local Text1 = if LuaAppExpandableTextNewLineStrip then (Frame.text or ""):gsub("[\r\n]+$", "") else Frame.text
	local UseSignalStateResult = SignalsReactModule.useSignalState(function(p1)
		-- upvalues: TextSizeModule (upval)
		return TextSizeModule.getTextSizeStore(p1).getTextSizeOffset(p1)
	end)
	local UseTokensResult = UseTokensFunction()
	local FontStyle = Frame.fontStyle or UseTokensResult.Typography.CaptionLarge
	local JoinResult = CryoModule.Dictionary.join(FontStyle, { FontSize = FontStyle.FontSize + UseSignalStateResult })
	local TextColor = if FFlagLuaAppExpandableTextTappableText then nil else Frame.textColor or UseTokensResult.Color.Content.Default.Color3
	local TextStyle = Frame.textStyle or UseTokensResult.Color.Content.Default
	local CompactNumberOfLines = Frame.compactNumberOfLines or 3
	local v1 = nil
	local MapResult = nil
	
	if FFlagLuaAppExpandableTextTappableText then
		local PressedTextStyle = Frame.pressedTextStyle or UseTokensResult.Color.Content.Muted
		local UseBindingResult
		UseBindingResult, v29 = ReactModule.useBinding(ControlState.Default)
		MapResult = UseBindingResult:map(function(Pressed)
			-- upvalues: ControlState (upval), PressedTextStyle (copy), TextStyle (copy)
			return if Pressed == ControlState.Pressed or Pressed == ControlState.SelectedPressed then PressedTextStyle else TextStyle
		end)
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(Frame.expandedInitially or false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), Frame (copy)
		UseStateResult2(function(p1): boolean
			-- upvalues: Frame (upval)
			local NoP8 = not p1
			
			if Frame.onExpandChanged then
				Frame.onExpandChanged(NoP8)
			end
			return NoP8
		end)
	end, { Frame.onExpandChanged })
	local UseLocalizationResult = UseLocalizationFunction({
		moreText = "CommonUI.Features.Action.MoreLowercase",
		lessText = "CommonUI.Features.Action.LessLowercase"
	})
	local UseRefResult = ReactModule.useRef(nil)
	local AbsoluteSize = UsePropertyFunction(UseRefResult, "AbsoluteSize")
	local UseRefResult1 = ReactModule.useRef(nil)
	local AbsoluteSize1 = UsePropertyFunction(UseRefResult1, "AbsoluteSize")
	local UseRefResult2 = ReactModule.useRef(nil)
	local AbsoluteSize2 = UsePropertyFunction(UseRefResult2, "AbsoluteSize")
	local IsXAbove: boolean = AbsoluteSize and AbsoluteSize.X > 0
	local Y = AbsoluteSize2 and AbsoluteSize2.Y or 0
	local Y1 = AbsoluteSize1 and AbsoluteSize1.Y or 0
	local Ceiled: number = Y1
	local UseRefResult3 = nil
	local UseMemoResult = nil
	repeat
		if not LuaAppExpandableTextAdjustClipToContent then break end
		UseRefResult3 = ReactModule.useRef(nil)
		local AbsoluteSize3 = UsePropertyFunction(UseRefResult3, "AbsoluteSize")
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: Frame (copy), Text1 (copy)
			if Frame.avoidBlankLineClip then
				local v2: number = Text1:find("\n\n")
				
				return if v2 then Text1:sub(1, v2 - 1) else nil
			else
				return nil
			end
		end, { Text1, Frame.avoidBlankLineClip })
		
		if not UseMemoResult then break end
		local Y2 = AbsoluteSize3 and AbsoluteSize3.Y or 0
		local YRatio = if CompactNumberOfLines > 0 and Y1 > 0 then Y1 / CompactNumberOfLines else 0
		
		if YRatio > 0 and Y2 > 0 and math.floor(Y2 / YRatio + 0.5) + 1 == CompactNumberOfLines then
			local Value = Y1 + YRatio
			
			if Value < Y then
				Ceiled = math.ceil(Value)
				break
			end
		end
		Ceiled = Y1
	until true
	local IsCeiledBelow: boolean = not Frame.expandedInitially and Ceiled + 1 < Y
	local UseStateResult1 = UseStateResult or not IsCeiledBelow
	local Value1: number = Y
	local LessText = UseLocalizationResult.lessText
	
	if IsCeiledBelow and not UseStateResult then
		Value1 = Ceiled
		LessText = UseLocalizationResult.moreText
	end
	if Text1 == "" then
		return nil
	else
		local Config = if UseStateResult1 then {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		} else { Size = UDim2.new(1, 0, 0, (math.ceil(Value1))) }
		
		return ReactModule.createElement(View, {
			tag = "col size-full-0 auto-y",
			LayoutOrder = Frame.LayoutOrder,
			selection = if FFlagSduiExperienceDetailsSupport and Frame.selectable ~= false then config else nil,
			onActivated = if FFlagSduiExperienceDetailsSupport and Frame.selectable ~= false then v15 else nil,
			stateLayer = if FFlagSduiExperienceDetailsSupport and Frame.selectable ~= false then config1 else nil,
			ref = UseRefResult
		}, {
			TextContent = if IsXAbove and (UseStateResult1 or Value1 > 0) then ReactModule.createElement(Text, CryoModule.Dictionary.join({
				LayoutOrder = 1,
				TextWrapped = true,
				Text = Text1,
				fontStyle = JoinResult,
				textStyle = if FFlagLuaAppExpandableTextTappableText then if IsCeiledBelow then MapResult else TextStyle else nil,
				textColor = if FFlagLuaAppExpandableTextTappableText then nil else TextColor,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				ClipsDescendants = if FFlagLuaAppExpandableTextTappableText and IsCeiledBelow then not UseStateResult else nil,
				onActivated = if FFlagLuaAppExpandableTextTappableText and IsCeiledBelow then UseResult else nil,
				onStateChanged = if FFlagLuaAppExpandableTextTappableText and IsCeiledBelow then v1 else nil,
				selection = if FFlagLuaAppExpandableTextTappableText and IsCeiledBelow then { Selectable = false } else nil,
				stateLayer = if FFlagLuaAppExpandableTextTappableText and IsCeiledBelow then config1 else nil
			}, Config)) else nil,
			ToggleExpandButton = if IsCeiledBelow then ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy radius-small",
				RichText = true,
				Text = `<u><b>{LessText}</b></u>`,
				fontStyle = JoinResult,
				textStyle = if FFlagLuaAppExpandableTextTappableText then UseTokensResult.Color.Content.Emphasis else nil,
				textColor = if FFlagLuaAppExpandableTextTappableText then nil else UseTokensResult.Color.Content.Emphasis.Color3,
				onActivated = UseResult
			}) else nil,
			CompactTextMeasure = ReactModule.createElement(Text, {
				Visible = false,
				IgnoreLayout = true,
				LayoutOrder = 3,
				TextWrapped = true,
				ref = UseRefResult1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = getCompactLineMeasureText(CompactNumberOfLines),
				fontStyle = JoinResult,
				textStyle = if FFlagLuaAppExpandableTextTappableText then TextStyle else nil,
				textColor = if FFlagLuaAppExpandableTextTappableText then nil else TextColor,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			}),
			FullTextMeasure = ReactModule.createElement(Text, {
				Visible = false,
				IgnoreLayout = true,
				LayoutOrder = 4,
				TextWrapped = true,
				ref = UseRefResult2,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = Text1,
				fontStyle = JoinResult,
				textStyle = if FFlagLuaAppExpandableTextTappableText then TextStyle else nil,
				textColor = if FFlagLuaAppExpandableTextTappableText then nil else TextColor,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			}),
			PrefixMeasure = if LuaAppExpandableTextAdjustClipToContent and UseMemoResult then ReactModule.createElement(Text, {
				Visible = false,
				IgnoreLayout = true,
				LayoutOrder = 5,
				TextWrapped = true,
				ref = UseRefResult3,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = UseMemoResult,
				fontStyle = JoinResult,
				textColor = TextColor,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			}) else nil
		})
	end
end)