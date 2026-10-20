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
local LuaAppExpandableTextNewLineStrip = game:DefineFastFlag("LuaAppExpandableTextNewLineStrip", true)
local config = { Selectable = true }

local function v11() end

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
	-- upvalues: LuaAppExpandableTextNewLineStrip (copy), SignalsReactModule (copy), TextSizeModule (copy), UseTokensFunction (copy), CryoModule (copy), ReactModule (copy), ControlState (copy), UseLocalizationFunction (copy), UsePropertyFunction (copy), View (copy), config (copy), v11 (copy), config1 (copy), Text (copy), getCompactLineMeasureText (copy)
	local Text1 = if LuaAppExpandableTextNewLineStrip then (Frame.text or ""):gsub("[\r\n]+$", "") else Frame.text
	local UseSignalStateResult = SignalsReactModule.useSignalState(function(p1)
		-- upvalues: TextSizeModule (upval)
		return TextSizeModule.getTextSizeStore(p1).getTextSizeOffset(p1)
	end)
	local UseTokensResult = UseTokensFunction()
	local FontStyle = Frame.fontStyle or UseTokensResult.Typography.CaptionLarge
	local JoinResult = CryoModule.Dictionary.join(FontStyle, { FontSize = FontStyle.FontSize + UseSignalStateResult })
	local TextStyle = Frame.textStyle or UseTokensResult.Color.Content.Default
	local CompactNumberOfLines = Frame.compactNumberOfLines or 3
	local PressedTextStyle = Frame.pressedTextStyle or UseTokensResult.Color.Content.Muted
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(ControlState.Default)
	local MapResult = UseBindingResult:map(function(Pressed)
		-- upvalues: ControlState (upval), PressedTextStyle (copy), TextStyle (copy)
		return if Pressed == ControlState.Pressed or Pressed == ControlState.SelectedPressed then PressedTextStyle else TextStyle
	end)
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
	local UseRefResult3 = ReactModule.useRef(nil)
	local AbsoluteSize3 = UsePropertyFunction(UseRefResult3, "AbsoluteSize")
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Frame (copy), Text1 (copy)
		if Frame.avoidBlankLineClip then
			local v1: number = Text1:find("\n\n")
			
			return if v1 then Text1:sub(1, v1 - 1) else nil
		else
			return nil
		end
	end, { Text1, Frame.avoidBlankLineClip })
	repeat
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
			selection = if Frame.selectable == false then nil else config,
			onActivated = if Frame.selectable == false then nil else v11,
			stateLayer = if Frame.selectable == false then nil else config1,
			ref = UseRefResult
		}, {
			TextContent = if IsXAbove and (UseStateResult1 or Value1 > 0) then ReactModule.createElement(Text, CryoModule.Dictionary.join({
				LayoutOrder = 1,
				TextWrapped = true,
				Text = Text1,
				fontStyle = JoinResult,
				textStyle = if IsCeiledBelow then MapResult else TextStyle,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				ClipsDescendants = if IsCeiledBelow then not UseStateResult else nil,
				onActivated = if IsCeiledBelow then UseResult else nil,
				onStateChanged = if IsCeiledBelow then UseBindingResult2 else nil,
				selection = if IsCeiledBelow then { Selectable = false } else nil,
				stateLayer = if IsCeiledBelow then config1 else nil
			}, Config)) else nil,
			ToggleExpandButton = if IsCeiledBelow then ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy radius-small",
				RichText = true,
				Text = `<u><b>{LessText}</b></u>`,
				fontStyle = JoinResult,
				textStyle = UseTokensResult.Color.Content.Emphasis,
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
				textStyle = TextStyle,
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
				textStyle = TextStyle,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			}),
			PrefixMeasure = if UseMemoResult then ReactModule.createElement(Text, {
				Visible = false,
				IgnoreLayout = true,
				LayoutOrder = 5,
				textColor = nil,
				TextWrapped = true,
				ref = UseRefResult3,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = UseMemoResult,
				fontStyle = JoinResult,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			}) else nil
		})
	end
end)