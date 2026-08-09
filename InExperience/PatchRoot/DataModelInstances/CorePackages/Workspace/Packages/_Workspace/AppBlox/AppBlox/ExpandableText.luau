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
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local luaAppExpandableTextNewLineStrip = game:DefineFastFlag("LuaAppExpandableTextNewLineStrip", true)
local luaAppExpandableTextAdjustClipToContent = game:DefineFastFlag("LuaAppExpandableTextAdjustClipToContent", false)
local fFlagLuaAppExpandableTextTappableText = sharedFlagsModule.FFlagLuaAppExpandableTextTappableText
local t = { Selectable = true }

local var9 = function() --[[ line: 25 ]] end

local t_1 = {
	affordance = foundationModule.Enums.StateLayerAffordance.None
}

local function getCompactLineMeasureText(p0) --[[ line: 53 ]]
	if p0 <= 0 then
		return ""
	end
	local t = {}
	
	for _ = 1, p0 do
		table.insert(t, "A")
	end
	return table.concat(t, "\n")
end

local function _(p1, p2, p3, p4) --[[ line: 68 | named "calculateBlankLineAdjustedHeight" ]]
	local var13 = if p2 > 0 and p1 > 0 then p1 / p2 else 0
	
	if var13 > 0 and p3 > 0 and math.floor(p3 / var13 + 0.5) + 1 == p2 then
		local var14 = p1 + var13
		
		return if var14 < p4 then math.ceil(var14) else p1
	end
end

return reactModule.memo(function(p5) --[[ line: 88 | named "ExpandableText" ]]
	-- upvalues: luaAppExpandableTextNewLineStrip (ref), signalsReactModule (ref), textSizeModule (ref), useTokens (ref), cryoModule (ref), fFlagLuaAppExpandableTextTappableText (ref), reactModule (ref), controlState (ref), useLocalization (ref), useProperty (ref), luaAppExpandableTextAdjustClipToContent (ref), view (ref), fFlagSduiExperienceDetailsSupport (ref), t (ref), var9 (ref), t_1 (ref), text (ref), getCompactLineMeasureText (ref)
	local var15 = if luaAppExpandableTextNewLineStrip then (p5.text or ""):gsub("[\r\n]+$", "") else p5.text
	local var16 = signalsReactModule.useSignalState(function(p6) --[[ line: 92 ]]
		-- upvalues: textSizeModule (copy)
		return textSizeModule.getTextSizeStore(p6).getTextSizeOffset(p6)
	end)
	local var17 = useTokens()
	local fontStyle = p5.fontStyle or var17.Typography.CaptionLarge
	local var19 = cryoModule.Dictionary.join(fontStyle, { FontSize = fontStyle.FontSize + var16 })
	local var20 = if not fFlagLuaAppExpandableTextTappableText then p5.textColor or var17.Color.Content.Default.Color3 else nil
	local textStyle = p5.textStyle or var17.Color.Content.Default
	local compactNumberOfLines = p5.compactNumberOfLines or 3
	local _ = nil
	local var23 = nil
	local var24 = nil
	
	if fFlagLuaAppExpandableTextTappableText then
		local pressedTextStyle = p5.pressedTextStyle or var17.Color.Content.Muted
		local var26, var27 = reactModule.useBinding(controlState.Default)
		var23 = var27
		var24 = var26:map(function(p7) --[[ line: 112 ]]
			-- upvalues: controlState (copy), pressedTextStyle (ref), textStyle (ref)
			return if p7 == controlState.Pressed or p7 == controlState.SelectedPressed then pressedTextStyle else textStyle
		end)
	end
	local var45, var46
	local var28, var29 = reactModule.useState(p5.expandedInitially or false)
	local var30 = reactModule.useCallback(function() --[[ line: 122 ]]
		-- upvalues: var29 (ref), p5 (ref)
		var29(function(p8) --[[ line: 123 ]]
			-- upvalues: p5 (copy)
			local var53 = not p8
			
			if p5.onExpandChanged then
				p5.onExpandChanged(var53)
			end
			return var53
		end)
	end, { p5.onExpandChanged })
	local var31 = useLocalization({
		moreText = "CommonUI.Features.Action.MoreLowercase",
		lessText = "CommonUI.Features.Action.LessLowercase"
	})
	local var32 = reactModule.useRef(nil)
	local var33 = useProperty(var32, "AbsoluteSize")
	local var34 = reactModule.useRef(nil)
	local var35 = useProperty(var34, "AbsoluteSize")
	local var36 = reactModule.useRef(nil)
	local var37 = useProperty(var36, "AbsoluteSize")
	local var38 = var33 and var33.X > 0
	local var39 = if var37 then var37.Y else 0
	local var40 = if var35 then var35.Y else 0
	local var41 = var40
	local var42 = nil
	local var43 = nil
	
	if luaAppExpandableTextAdjustClipToContent then
		var42 = reactModule.useRef(nil)
		local var44 = useProperty(var42, "AbsoluteSize")
		var43 = reactModule.useMemo(function() --[[ line: 160 ]]
			-- upvalues: p5 (ref), var15 (ref)
			if not p5.avoidBlankLineClip then
				return nil
			end
			local var54 = var15:find("\n\n")
			
			return if var54 then var15:sub(1, var54 - 1) else nil
		end, { var15, p5.avoidBlankLineClip })
		
		if var43 then
			var45 = if var44 then var44.Y else 0
			var46 = if compactNumberOfLines > 0 and var40 > 0 then var40 / compactNumberOfLines else 0
			
			if var46 > 0 and var45 > 0 and math.floor(var45 / var46 + 0.5) + 1 == compactNumberOfLines then
				local var47 = var40 + var46
				var41 = if var47 < var39 then math.ceil(var47) else var40
			end
		end
	end
	local var48 = not p5.expandedInitially and var41 + 1 < var39
	var45 = var28 or not var48
	var46 = var39
	local lessText = var31.lessText
	
	if var48 and not var28 then
		var46 = var41
		lessText = var31.moreText
	end
	if var15 == "" then
		return nil
	end
	local var52
	local var49 = if var45 then {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	} else { Size = UDim2.new(1, 0, 0, math.ceil(var46)) }
	local createElement = reactModule.createElement
	local t_2 = {
		tag = "col size-full-0 auto-y",
		LayoutOrder = p5.LayoutOrder,
		selection = if fFlagSduiExperienceDetailsSupport and p5.selectable ~= false then t else nil,
		onActivated = if fFlagSduiExperienceDetailsSupport and p5.selectable ~= false then var9 else nil,
		stateLayer = if fFlagSduiExperienceDetailsSupport and p5.selectable ~= false then t_1 else nil,
		ref = var32
	}
	local t_3 = {}
	
	if var38 and (var45 or var46 > 0) then
		var52 = reactModule.createElement
		var52 = var52(text, cryoModule.Dictionary.join({
			LayoutOrder = 1,
			TextWrapped = true,
			Text = var15,
			fontStyle = var19,
			textStyle = if fFlagLuaAppExpandableTextTappableText then if var48 then var24 else textStyle else nil,
			textColor = if not fFlagLuaAppExpandableTextTappableText then var20 else nil,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			ClipsDescendants = if fFlagLuaAppExpandableTextTappableText and var48 then not var28 else nil,
			onActivated = if fFlagLuaAppExpandableTextTappableText and var48 then var30 else nil,
			onStateChanged = if fFlagLuaAppExpandableTextTappableText and var48 then var23 else nil,
			selection = if fFlagLuaAppExpandableTextTappableText and var48 then { Selectable = false } else nil,
			stateLayer = if fFlagLuaAppExpandableTextTappableText and var48 then t_1 else nil
		}, var49))
	else
		var52 = nil
	end
	t_3.TextContent = var52
	t_3.ToggleExpandButton = if var48 then reactModule.createElement(text, {
		LayoutOrder = 2,
		tag = "auto-xy radius-small",
		RichText = true,
		Text = `<u><b>{lessText}</b></u>`,
		fontStyle = var19,
		textStyle = if fFlagLuaAppExpandableTextTappableText then var17.Color.Content.Emphasis else nil,
		textColor = if not fFlagLuaAppExpandableTextTappableText then var17.Color.Content.Emphasis.Color3 else nil,
		onActivated = var30
	}) else nil
	t_3.CompactTextMeasure = reactModule.createElement(text, {
		Visible = false,
		IgnoreLayout = true,
		LayoutOrder = 3,
		TextWrapped = true,
		ref = var34,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Text = getCompactLineMeasureText(compactNumberOfLines),
		fontStyle = var19,
		textStyle = if fFlagLuaAppExpandableTextTappableText then textStyle else nil,
		textColor = if not fFlagLuaAppExpandableTextTappableText then var20 else nil,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top
	})
	t_3.FullTextMeasure = reactModule.createElement(text, {
		Visible = false,
		IgnoreLayout = true,
		LayoutOrder = 4,
		TextWrapped = true,
		ref = var36,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Text = var15,
		fontStyle = var19,
		textStyle = if fFlagLuaAppExpandableTextTappableText then textStyle else nil,
		textColor = if not fFlagLuaAppExpandableTextTappableText then var20 else nil,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top
	})
	t_3.PrefixMeasure = if luaAppExpandableTextAdjustClipToContent and var43 then reactModule.createElement(text, {
		Visible = false,
		IgnoreLayout = true,
		LayoutOrder = 5,
		TextWrapped = true,
		ref = var42,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Text = var43,
		fontStyle = var19,
		textColor = var20,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top
	}) else nil
	
	return createElement(view, t_2, t_3)
end)