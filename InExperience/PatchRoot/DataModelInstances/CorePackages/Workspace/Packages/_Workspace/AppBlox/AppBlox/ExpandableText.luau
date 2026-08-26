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

local var1 = function() end

local t_1 = {
	affordance = foundationModule.Enums.StateLayerAffordance.None
}

local function getCompactLineMeasureText(p1)
	if p1 <= 0 then
		return ""
	end
	local t = {}
	
	for _ = 1, p1 do
		table.insert(t, "A")
	end
	return table.concat(t, "\n")
end

local function _(p2, p3, p4, p5)
	local var2 = if p3 > 0 and p2 > 0 then p2 / p3 else 0
	
	if var2 > 0 and p4 > 0 and math.floor(p4 / var2 + 0.5) + 1 == p3 then
		local var3 = p2 + var2
		
		return if var3 < p5 then math.ceil(var3) else p2
	end
end

return reactModule.memo(function(p2)
	-- upvalues: luaAppExpandableTextNewLineStrip (ref), signalsReactModule (ref), textSizeModule (ref), useTokens (ref), cryoModule (ref), reactModule (ref), controlState (ref), useLocalization (ref), useProperty (ref), luaAppExpandableTextAdjustClipToContent (ref), view (ref), fFlagSduiExperienceDetailsSupport (ref), t (ref), var1 (ref), t_1 (ref), text (ref), getCompactLineMeasureText (ref)
	local var2, var3
	local var4 = if luaAppExpandableTextNewLineStrip then (p2.text or ""):gsub("[\r\n]+$", "") else p2.text
	local var5 = signalsReactModule.useSignalState(function(p3)
		-- upvalues: textSizeModule (copy)
		return textSizeModule.getTextSizeStore(p3).getTextSizeOffset(p3)
	end)
	local var6 = useTokens()
	local fontStyle = p2.fontStyle or var6.Typography.CaptionLarge
	local var7 = cryoModule.Dictionary.join(fontStyle, { FontSize = fontStyle.FontSize + var5 })
	local textStyle = p2.textStyle or var6.Color.Content.Default
	local compactNumberOfLines = p2.compactNumberOfLines or 3
	local _ = nil
	local _ = nil
	local _ = nil
	local pressedTextStyle = p2.pressedTextStyle or var6.Color.Content.Muted
	local var8, var9 = reactModule.useBinding(controlState.Default)
	var8 = var8:map(function(p3)
		-- upvalues: controlState (copy), pressedTextStyle (ref), textStyle (ref)
		return if p3 == controlState.Pressed or p3 == controlState.SelectedPressed then pressedTextStyle else textStyle
	end)
	local var10, var11 = reactModule.useState(p2.expandedInitially or false)
	local var12 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), p2 (ref)
		var11(function(p3)
			-- upvalues: p2 (copy)
			local var13 = not p3
			
			if p2.onExpandChanged then
				p2.onExpandChanged(var13)
			end
			return var13
		end)
	end, { p2.onExpandChanged })
	local var13 = useLocalization({
		moreText = "CommonUI.Features.Action.MoreLowercase",
		lessText = "CommonUI.Features.Action.LessLowercase"
	})
	local var14 = reactModule.useRef(nil)
	local var15 = useProperty(var14, "AbsoluteSize")
	local var16 = reactModule.useRef(nil)
	local var17 = useProperty(var16, "AbsoluteSize")
	local var18 = reactModule.useRef(nil)
	local var19 = useProperty(var18, "AbsoluteSize")
	local var20 = var15 and var15.X > 0
	local var21 = if var19 then var19.Y else 0
	local var22 = if var17 then var17.Y else 0
	local var23 = var22
	local var24 = nil
	local var25 = nil
	
	if luaAppExpandableTextAdjustClipToContent then
		var24 = reactModule.useRef(nil)
		local var26 = useProperty(var24, "AbsoluteSize")
		var25 = reactModule.useMemo(function()
			-- upvalues: p2 (ref), var4 (ref)
			if not p2.avoidBlankLineClip then
				return nil
			end
			local var27 = var4:find("\n\n")
			
			return if var27 then var4:sub(1, var27 - 1) else nil
		end, { var4, p2.avoidBlankLineClip })
		
		if var25 then
			var2 = if var26 then var26.Y else 0
			var3 = if compactNumberOfLines > 0 and var22 > 0 then var22 / compactNumberOfLines else 0
			
			if var3 > 0 and var2 > 0 and math.floor(var2 / var3 + 0.5) + 1 == compactNumberOfLines then
				local var27 = var22 + var3
				var23 = if var27 < var21 then math.ceil(var27) else var22
			end
		end
	end
	local var28 = not p2.expandedInitially and var23 + 1 < var21
	var2 = var10 or not var28
	var3 = var21
	local lessText = var13.lessText
	
	if var28 and not var10 then
		var3 = var23
		lessText = var13.moreText
	end
	return if var4 == "" then nil else reactModule.createElement(view, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = p2.LayoutOrder,
		selection = if fFlagSduiExperienceDetailsSupport and p2.selectable ~= false then t else nil,
		onActivated = if fFlagSduiExperienceDetailsSupport and p2.selectable ~= false then var1 else nil,
		stateLayer = if fFlagSduiExperienceDetailsSupport and p2.selectable ~= false then t_1 else nil,
		ref = var14
	}, {
		TextContent = if var20 and (var2 or var3 > 0) then reactModule.createElement(text, cryoModule.Dictionary.join({
			LayoutOrder = 1,
			TextWrapped = true,
			Text = var4,
			fontStyle = var7,
			textStyle = if var28 then var8 else textStyle,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			ClipsDescendants = if var28 then not var10 else nil,
			onActivated = if var28 then var12 else nil,
			onStateChanged = if var28 then var9 else nil,
			selection = if var28 then { Selectable = false } else nil,
			stateLayer = if var28 then t_1 else nil
		}, if var2 then {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		} else { Size = UDim2.new(1, 0, 0, math.ceil(var3)) })) else nil,
		ToggleExpandButton = if var28 then reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "auto-xy radius-small",
			RichText = true,
			Text = `<u><b>{lessText}</b></u>`,
			fontStyle = var7,
			textStyle = var6.Color.Content.Emphasis,
			onActivated = var12
		}) else nil,
		CompactTextMeasure = reactModule.createElement(text, {
			Visible = false,
			IgnoreLayout = true,
			LayoutOrder = 3,
			TextWrapped = true,
			ref = var16,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = getCompactLineMeasureText(compactNumberOfLines),
			fontStyle = var7,
			textStyle = textStyle,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		}),
		FullTextMeasure = reactModule.createElement(text, {
			Visible = false,
			IgnoreLayout = true,
			LayoutOrder = 4,
			TextWrapped = true,
			ref = var18,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = var4,
			fontStyle = var7,
			textStyle = textStyle,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		}),
		PrefixMeasure = if luaAppExpandableTextAdjustClipToContent and var25 then reactModule.createElement(text, {
			Visible = false,
			IgnoreLayout = true,
			LayoutOrder = 5,
			textColor = nil,
			TextWrapped = true,
			ref = var24,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = var25,
			fontStyle = var7,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		}) else nil
	})
end)