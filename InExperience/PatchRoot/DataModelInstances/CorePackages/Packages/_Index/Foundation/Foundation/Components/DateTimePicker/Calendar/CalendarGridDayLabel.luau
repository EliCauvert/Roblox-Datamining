local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local constantsModule = require(foundation.Constants)
local controlStateModule = require(foundation.Enums.ControlState)
local stateLayerModeModule = require(foundation.Enums.StateLayerMode)
local textModule = require(foundation.Components.Text)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)

local function _(p1, p2)
	local t = {
		["size-full text-title-small text-align-x-center text-align-y-center"] = true,
		["radius-circle"] = not p1
	}
	
	if p1 and p2 and p2 ~= "" then
		t[p2] = true
	end
	return t
end

return function(p1)
	-- upvalues: useTokensModule (ref), constantsModule (ref), reactModule (ref), controlStateModule (ref), textModule (ref), stateLayerModeModule (ref), viewModule (ref)
	local var1 = useTokensModule()
	local var2 = if p1.isSelected then var1.Inverse.Content.Emphasis.Color3 elseif p1.isSelectable and p1.emphasizeText then var1.Color.Content.Emphasis.Color3 else var1.Color.Content.Muted.Color3
	local var3 = if p1.isSelected or p1.isSelectable and p1.emphasizeText then 0 else constantsModule.DISABLED_TRANSPARENCY
	local var4 = p1.highlight == true and not p1.isSelected
	local bandRadiusTag = p1.bandRadiusTag
	local t = {
		["size-full text-title-small text-align-x-center text-align-y-center"] = true,
		["radius-circle"] = not var4
	}
	
	if var4 and bandRadiusTag and bandRadiusTag ~= "" then
		t[bandRadiusTag] = true
	end
	local var5
	t = reactModule.createElement(textModule, {
		backgroundStyle = if p1.isSelected then var1.Color.System.Contrast elseif p1.highlight then var1.Color.ActionStandard.Background else nil,
		onActivated = if p1.isSelectable then p1.onActivated else nil,
		onStateChanged = if p1.isSelectable then reactModule.useMemo(function()
			-- upvalues: p1 (ref), controlStateModule (copy)
			return if p1.onHoverEnter == nil then nil else function(p2)
				-- upvalues: controlStateModule (copy), p1 (copy)
				if p2 == controlStateModule.Hover then
					p1.onHoverEnter()
				end
			end
		end, { p1.onHoverEnter }) else nil,
		RichText = not p1.isSelectable,
		stateLayer = {
			mode = if p1.isSelected then stateLayerModeModule.Inverse else stateLayerModeModule.Default
		},
		tag = t,
		testId = p1.testId,
		Text = if p1.isSelectable then p1.label else `<s>{p1.label}</s>`,
		textStyle = { Color3 = var2, Transparency = var3 }
	})
	local createElement = reactModule.createElement
	local t_1 = { tag = "size-full", LayoutOrder = p1.LayoutOrder }
	local t_2 = {}
	
	if p1.bandPosition and p1.bandSize then
		var5 = reactModule.createElement
		var5 = var5(viewModule, {
			ZIndex = 0,
			backgroundStyle = var1.Color.ActionStandard.Background,
			Position = p1.bandPosition,
			Size = p1.bandSize,
			tag = if p1.bandRadiusTag and p1.bandRadiusTag ~= "" then p1.bandRadiusTag else nil
		})
	else
		var5 = nil
	end
	t_2.Band = var5
	t_2.Day = t
	
	return createElement(viewModule, t_1, t_2)
end