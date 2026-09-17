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
local luaAppExpandableTextNewLineStrip = game:DefineFastFlag("LuaAppExpandableTextNewLineStrip", true)
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
	-- upvalues: luaAppExpandableTextNewLineStrip (ref), signalsReactModule (ref), textSizeModule (ref), useTokens (ref), cryoModule (ref), reactModule (ref), controlState (ref), useLocalization (ref), useProperty (ref), view (ref), t (ref), var1 (ref), t_1 (ref), text (ref), getCompactLineMeasureText (ref)
	local var2
	local var3 = if luaAppExpandableTextNewLineStrip then (p2.text or ""):gsub("[\r\n]+$", "") else p2.text
	local var4 = signalsReactModule.useSignalState(function(p3)
		-- upvalues: textSizeModule (copy)
		return textSizeModule.getTextSizeStore(p3).getTextSizeOffset(p3)
	end)
	local var5 = useTokens()
	local fontStyle = p2.fontStyle or var5.Typography.CaptionLarge
	local var6 = cryoModule.Dictionary.join(fontStyle, { FontSize = fontStyle.FontSize + var4 })
	local textStyle = p2.textStyle or var5.Color.Content.Default
	local compactNumberOfLines = p2.compactNumberOfLines or 3
	local _ = nil
	local _ = nil
	local _ = nil
	local pressedTextStyle = p2.pressedTextStyle or var5.Color.Content.Muted
	local var7, var8 = reactModule.useBinding(controlState.Default)
	var7 = var7:map(function(p3)
		-- upvalues: controlState (copy), pressedTextStyle (ref), textStyle (ref)
		return if p3 == controlState.Pressed or p3 == controlState.SelectedPressed then pressedTextStyle else textStyle
	end)
	local var9, var10 = reactModule.useState(p2.expandedInitially or false)
	local var11 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), p2 (ref)
		var10(function(p3)
			-- upvalues: p2 (copy)
			local var12 = not p3
			
			if p2.onExpandChanged then
				p2.onExpandChanged(var12)
			end
			return var12
		end)
	end, { p2.onExpandChanged })
	local var12 = useLocalization({
		moreText = "CommonUI.Features.Action.MoreLowercase",
		lessText = "CommonUI.Features.Action.LessLowercase"
	})
	local var13 = reactModule.useRef(nil)
	local var14 = useProperty(var13, "AbsoluteSize")
	local var15 = reactModule.useRef(nil)
	local var16 = useProperty(var15, "AbsoluteSize")
	local var17 = reactModule.useRef(nil)
	local var18 = useProperty(var17, "AbsoluteSize")
	local var19 = var14 and var14.X > 0
	local var20 = if var18 then var18.Y else 0
	local var21 = if var16 then var16.Y else 0
	local var22 = var21
	local _ = nil
	local _ = nil
	local var23 = reactModule.useRef(nil)
	var23 = useProperty(var23, "AbsoluteSize")
	local var24 = reactModule.useMemo(function()
		-- upvalues: p2 (ref), var3 (ref)
		if not p2.avoidBlankLineClip then
			return nil
		end
		local var25 = var3:find("\n\n")
		
		return if var25 then var3:sub(1, var25 - 1) else nil
	end, { var3, p2.avoidBlankLineClip })
	
	if var24 then
		var24 = if var23 then var23.Y else 0
		var2 = if compactNumberOfLines > 0 and var21 > 0 then var21 / compactNumberOfLines else 0
		
		if var2 > 0 and var24 > 0 and math.floor(var24 / var2 + 0.5) + 1 == compactNumberOfLines then
			local var25 = var21 + var2
			var22 = if var25 < var20 then math.ceil(var25) else var21
		end
	end
	var24 = not p2.expandedInitially and var22 + 1 < var20
	var2 = var9 or not var24
	local var26 = var20
	local lessText = var12.lessText
	
	if var24 and not var9 then
		var26 = var22
		lessText = var12.moreText
	end
	return if var3 == "" then nil else reactModule.createElement(view, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = p2.LayoutOrder,
		selection = if p2.selectable ~= false then nil else t,
		onActivated = if p2.selectable ~= false then nil else var1,
		stateLayer = if p2.selectable ~= false then nil else t_1,
		ref = var13
	}, {
		TextContent = if var19 and (var2 or var26 > 0) then reactModule.createElement(text, cryoModule.Dictionary.join({
			LayoutOrder = 1,
			TextWrapped = true,
			Text = var3,
			fontStyle = var6,
			textStyle = if var24 then var7 else textStyle,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			ClipsDescendants = if var24 then not var9 else nil,
			onActivated = if var24 then var11 else nil,
			onStateChanged = if var24 then var8 else nil,
			selection = if var24 then { Selectable = false } else nil,
			stateLayer = if var24 then t_1 else nil
		}, if var2 then {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		} else { Size = UDim2.new(1, 0, 0, math.ceil(var26)) })) else nil,
		ToggleExpandButton = if var24 then reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "auto-xy radius-small",
			RichText = true,
			Text = `<u><b>{lessText}</b></u>`,
			fontStyle = var6,
			textStyle = var5.Color.Content.Emphasis,
			onActivated = var11
		}) else nil,
		CompactTextMeasure = reactModule.createElement(text, {
			Visible = false,
			IgnoreLayout = true,
			LayoutOrder = 3,
			TextWrapped = true,
			ref = var15,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = getCompactLineMeasureText(compactNumberOfLines),
			fontStyle = var6,
			textStyle = textStyle,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		}),
		FullTextMeasure = reactModule.createElement(text, {
			Visible = false,
			IgnoreLayout = true,
			LayoutOrder = 4,
			TextWrapped = true,
			ref = var17,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = var3,
			fontStyle = var6,
			textStyle = textStyle,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		}),
		PrefixMeasure = if var24 then reactModule.createElement(text, {
			Visible = false,
			IgnoreLayout = true,
			LayoutOrder = 5,
			textColor = nil,
			TextWrapped = true,
			ref = var23,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = var24,
			fontStyle = var6,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		}) else nil
	})
end)