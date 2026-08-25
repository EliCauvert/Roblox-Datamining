local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local constantsModule = require(foundation.Constants)
local controlStateModule = require(foundation.Enums.ControlState)
local stateLayerModeModule = require(foundation.Enums.StateLayerMode)
local textModule = require(foundation.Components.Text)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)

local function _(p0, p1)
	local t = {
		["size-full text-title-small text-align-x-center text-align-y-center"] = true,
		["radius-circle"] = not p0
	}
	
	if p0 and p1 and p1 ~= "" then
		t[p1] = true
	end
	return t
end

return function(p2)
	-- upvalues: useTokensModule (ref), constantsModule (ref), reactModule (ref), controlStateModule (ref), textModule (ref), stateLayerModeModule (ref), viewModule (ref)
	local var9 = useTokensModule()
	local var10 = if p2.isSelected then var9.Inverse.Content.Emphasis.Color3 elseif p2.isSelectable and p2.emphasizeText then var9.Color.Content.Emphasis.Color3 else var9.Color.Content.Muted.Color3
	local var11 = if p2.isSelected or p2.isSelectable and p2.emphasizeText then 0 else constantsModule.DISABLED_TRANSPARENCY
	local var12 = p2.highlight == true and not p2.isSelected
	local bandRadiusTag = p2.bandRadiusTag
	local t = {
		["size-full text-title-small text-align-x-center text-align-y-center"] = true,
		["radius-circle"] = not var12
	}
	
	if var12 and bandRadiusTag and bandRadiusTag ~= "" then
		t[bandRadiusTag] = true
	end
	local var16
	t = reactModule.createElement(textModule, {
		backgroundStyle = if p2.isSelected then var9.Color.System.Contrast elseif p2.highlight then var9.Color.ActionStandard.Background else nil,
		onActivated = if p2.isSelectable then p2.onActivated else nil,
		onStateChanged = if p2.isSelectable then reactModule.useMemo(function()
			-- upvalues: p2 (ref), controlStateModule (copy)
			return if p2.onHoverEnter == nil then nil else function(p3)
				-- upvalues: controlStateModule (copy), p2 (copy)
				if p3 == controlStateModule.Hover then
					p2.onHoverEnter()
				end
			end
		end, { p2.onHoverEnter }) else nil,
		RichText = not p2.isSelectable,
		stateLayer = {
			mode = if p2.isSelected then stateLayerModeModule.Inverse else stateLayerModeModule.Default
		},
		tag = t,
		testId = p2.testId,
		Text = if p2.isSelectable then p2.label else `<s>{p2.label}</s>`,
		textStyle = { Color3 = var10, Transparency = var11 }
	})
	local createElement = reactModule.createElement
	local t_1 = { tag = "size-full", LayoutOrder = p2.LayoutOrder }
	local t_2 = {}
	
	if p2.bandPosition and p2.bandSize then
		var16 = reactModule.createElement
		var16 = var16(viewModule, {
			ZIndex = 0,
			backgroundStyle = var9.Color.ActionStandard.Background,
			Position = p2.bandPosition,
			Size = p2.bandSize,
			tag = if p2.bandRadiusTag and p2.bandRadiusTag ~= "" then p2.bandRadiusTag else nil
		})
	else
		var16 = nil
	end
	t_2.Band = var16
	t_2.Day = t
	
	return createElement(viewModule, t_1, t_2)
end