local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local text = foundationModule.Text
local view = foundationModule.View
local controlState = foundationModule.Enums.ControlState
local useProperty = require(parent.GuiObjectUtils).useProperty
local useTokens = foundationModule.Hooks.useTokens
local signalsReactModule = require(parent.SignalsReact)
local textSizeModule = require(parent.TextSize)
local cryoModule = require(parent.Cryo)
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local luaAppExpandableTextNewLineStrip = game:DefineFastFlag("LuaAppExpandableTextNewLineStrip", true)
local luaAppExpandableTextAdjustClipToContent = game:DefineFastFlag("LuaAppExpandableTextAdjustClipToContent", false)
local t = { Selectable = true }

local var8 = function() --[[ line: 24 ]] end

local t_1 = {
	affordance = foundationModule.Enums.StateLayerAffordance.None
}

local function getCompactLineMeasureText(p0) --[[ line: 52 ]]
	if p0 <= 0 then
		return ""
	end
	local t = {}
	
	for _ = 1, p0 do
		table.insert(t, "A")
	end
	return table.concat(t, "\n")
end

local function _(p1, p2, p3, p4) --[[ line: 67 | named "calculateBlankLineAdjustedHeight" ]]
	local var12 = if p2 > 0 and p1 > 0 then p1 / p2 else 0
	
	if var12 > 0 and p3 > 0 and math.floor(p3 / var12 + 0.5) + 1 == p2 then
		local var13 = p1 + var12
		
		return if var13 < p4 then math.ceil(var13) else p1
	end
end

return reactModule.memo(function(p5) --[[ line: 87 | named "ExpandableText" ]]
	-- upvalues: luaAppExpandableTextNewLineStrip (ref), signalsReactModule (ref), textSizeModule (ref), useTokens (ref), cryoModule (ref), reactModule (ref), controlState (ref), useLocalization (ref), useProperty (ref), luaAppExpandableTextAdjustClipToContent (ref), view (ref), fFlagSduiExperienceDetailsSupport (ref), t (ref), var8 (ref), t_1 (ref), text (ref), getCompactLineMeasureText (ref)
	local var41, var42
	local var14 = if luaAppExpandableTextNewLineStrip then (p5.text or ""):gsub("[\r\n]+$", "") else p5.text
	local var15 = signalsReactModule.useSignalState(function(p6) --[[ line: 91 ]]
		-- upvalues: textSizeModule (copy)
		return textSizeModule.getTextSizeStore(p6).getTextSizeOffset(p6)
	end)
	local var16 = useTokens()
	local fontStyle = p5.fontStyle or var16.Typography.CaptionLarge
	local var18 = cryoModule.Dictionary.join(fontStyle, { FontSize = fontStyle.FontSize + var15 })
	local textStyle = p5.textStyle or var16.Color.Content.Default
	local compactNumberOfLines = p5.compactNumberOfLines or 3
	local _ = nil
	local _ = nil
	local _ = nil
	local pressedTextStyle = p5.pressedTextStyle or var16.Color.Content.Muted
	local var22, var23 = reactModule.useBinding(controlState.Default)
	var22 = var22:map(function(p7) --[[ line: 108 ]]
		-- upvalues: controlState (copy), pressedTextStyle (ref), textStyle (ref)
		return if p7 == controlState.Pressed or p7 == controlState.SelectedPressed then pressedTextStyle else textStyle
	end)
	local var24, var25 = reactModule.useState(p5.expandedInitially or false)
	local var26 = reactModule.useCallback(function() --[[ line: 117 ]]
		-- upvalues: var25 (ref), p5 (ref)
		var25(function(p8) --[[ line: 118 ]]
			-- upvalues: p5 (copy)
			local var45 = not p8
			
			if p5.onExpandChanged then
				p5.onExpandChanged(var45)
			end
			return var45
		end)
	end, { p5.onExpandChanged })
	local var27 = useLocalization({
		moreText = "CommonUI.Features.Action.MoreLowercase",
		lessText = "CommonUI.Features.Action.LessLowercase"
	})
	local var28 = reactModule.useRef(nil)
	local var29 = useProperty(var28, "AbsoluteSize")
	local var30 = reactModule.useRef(nil)
	local var31 = useProperty(var30, "AbsoluteSize")
	local var32 = reactModule.useRef(nil)
	local var33 = useProperty(var32, "AbsoluteSize")
	local var34 = var29 and var29.X > 0
	local var35 = if var33 then var33.Y else 0
	local var36 = if var31 then var31.Y else 0
	local var37 = var36
	local var38 = nil
	local var39 = nil
	
	if luaAppExpandableTextAdjustClipToContent then
		var38 = reactModule.useRef(nil)
		local var40 = useProperty(var38, "AbsoluteSize")
		var39 = reactModule.useMemo(function() --[[ line: 155 ]]
			-- upvalues: p5 (ref), var14 (ref)
			if not p5.avoidBlankLineClip then
				return nil
			end
			local var46 = var14:find("\n\n")
			
			return if var46 then var14:sub(1, var46 - 1) else nil
		end, { var14, p5.avoidBlankLineClip })
		
		if var39 then
			var41 = if var40 then var40.Y else 0
			var42 = if compactNumberOfLines > 0 and var36 > 0 then var36 / compactNumberOfLines else 0
			
			if var42 > 0 and var41 > 0 and math.floor(var41 / var42 + 0.5) + 1 == compactNumberOfLines then
				local var43 = var36 + var42
				var37 = if var43 < var35 then math.ceil(var43) else var36
			end
		end
	end
	local var44 = not p5.expandedInitially and var37 + 1 < var35
	var41 = var24 or not var44
	var42 = var35
	local lessText = var27.lessText
	
	if var44 and not var24 then
		var42 = var37
		lessText = var27.moreText
	end
	return if var14 == "" then nil else reactModule.createElement(view, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = p5.LayoutOrder,
		selection = if fFlagSduiExperienceDetailsSupport and p5.selectable ~= false then t else nil,
		onActivated = if fFlagSduiExperienceDetailsSupport and p5.selectable ~= false then var8 else nil,
		stateLayer = if fFlagSduiExperienceDetailsSupport and p5.selectable ~= false then t_1 else nil,
		ref = var28
	}, {
		TextContent = if var34 and (var41 or var42 > 0) then reactModule.createElement(text, cryoModule.Dictionary.join({
			LayoutOrder = 1,
			TextWrapped = true,
			Text = var14,
			fontStyle = var18,
			textStyle = if var44 then var22 else textStyle,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			ClipsDescendants = if var44 then not var24 else nil,
			onActivated = if var44 then var26 else nil,
			onStateChanged = if var44 then var23 else nil,
			selection = if var44 then { Selectable = false } else nil,
			stateLayer = if var44 then t_1 else nil
		}, if var41 then {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		} else { Size = UDim2.new(1, 0, 0, math.ceil(var42)) })) else nil,
		ToggleExpandButton = if var44 then reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "auto-xy radius-small",
			RichText = true,
			Text = `<u><b>{lessText}</b></u>`,
			fontStyle = var18,
			textStyle = var16.Color.Content.Emphasis,
			onActivated = var26
		}) else nil,
		CompactTextMeasure = reactModule.createElement(text, {
			Visible = false,
			IgnoreLayout = true,
			LayoutOrder = 3,
			TextWrapped = true,
			ref = var30,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = getCompactLineMeasureText(compactNumberOfLines),
			fontStyle = var18,
			textStyle = textStyle,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		}),
		FullTextMeasure = reactModule.createElement(text, {
			Visible = false,
			IgnoreLayout = true,
			LayoutOrder = 4,
			TextWrapped = true,
			ref = var32,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = var14,
			fontStyle = var18,
			textStyle = textStyle,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		}),
		PrefixMeasure = if luaAppExpandableTextAdjustClipToContent and var39 then reactModule.createElement(text, {
			Visible = false,
			IgnoreLayout = true,
			LayoutOrder = 5,
			textColor = nil,
			TextWrapped = true,
			ref = var38,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = var39,
			fontStyle = var18,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		}) else nil
	})
end)