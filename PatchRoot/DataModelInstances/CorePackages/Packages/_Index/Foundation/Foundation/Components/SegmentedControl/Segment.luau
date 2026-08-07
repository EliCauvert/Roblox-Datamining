-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:07 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local _ = require(parent.BuilderIcons)
local iconModule = require(foundation.Components.Icon)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local _ = require(foundation.Enums.IconSize)
local _ = require(foundation.Enums.InputSize)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local useSegmentedControlVariantsModule = require(script.Parent.useSegmentedControlVariants)

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 43 | named "Segment" ]]
	-- upvalues: useTokensModule (ref), useSegmentedControlVariantsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref), textModule (ref)
	local var8 = useSegmentedControlVariantsModule(useTokensModule(), p0.size, p0.isCircular)
	
	if _G.__DEV__ == true then
		assert(if p0.text ~= nil then p0.icon == nil else true, "Segment: `text` and `icon` are mutually exclusive. Only one can be provided.")
	end
	local var9 = p0.icon ~= nil
	local icon = nil
	local variant = nil
	local icon_1 = nil
	
	if var9 then
		if typeof(p0.icon) == "table" then
			local icon_2 = p0.icon
			icon = icon_2.name
			variant = icon_2.variant
		else
			icon = p0.icon
		end
		icon_1 = var8.icon
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(p0, {
		tag = var8.segment.tag,
		onActivated = function() --[[ line: 77 ]]
			-- upvalues: p0 (ref)
			p0.onActivated(p0.id)
		end,
		ref = p1
	}), {
		Text = if var9 then reactModule.createElement(iconModule, {
			name = icon,
			variant = variant,
			size = icon_1.size,
			style = icon_1.style
		}) else reactModule.createElement(textModule, { tag = var8.text.tag, Text = p0.text })
	})
end))