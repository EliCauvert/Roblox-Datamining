local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local _ = require(parent.BuilderIcons)
local flagsModule = require(foundation.Utility.Flags)
local iconModule = require(foundation.Components.Icon)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local _ = require(foundation.Enums.IconSize)
local _ = require(foundation.Enums.InputSize)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local useSegmentedControlVariantsModule = require(script.Parent.useSegmentedControlVariants)

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 44 | named "Segment" ]]
	-- upvalues: useTokensModule (ref), useSegmentedControlVariantsModule (ref), flagsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref), textModule (ref)
	local var9 = useSegmentedControlVariantsModule(useTokensModule(), p0.size, if flagsModule.FoundationSegmentedControlCircular then p0.isCircular else nil)
	
	if _G.__DEV__ == true then
		assert(if p0.text ~= nil then p0.icon == nil else true, "Segment: `text` and `icon` are mutually exclusive. Only one can be provided.")
	end
	local var10 = nil
	local icon = nil
	local variant = nil
	local icon_1 = nil
	
	if flagsModule.FoundationSegmentedControlIconSupport then
		var10 = p0.icon ~= nil
		
		if var10 then
			if typeof(p0.icon) == "table" then
				local icon_2 = p0.icon
				icon = icon_2.name
				variant = icon_2.variant
			else
				icon = p0.icon
			end
			icon_1 = var9.icon
		end
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(p0, {
		tag = var9.segment.tag,
		onActivated = function() --[[ line: 85 ]]
			-- upvalues: p0 (ref)
			p0.onActivated(p0.id)
		end,
		ref = p1
	}), {
		Text = if var10 then reactModule.createElement(iconModule, {
			name = icon,
			variant = variant,
			size = icon_1.size,
			style = icon_1.style
		}) else reactModule.createElement(textModule, { tag = var9.text.tag, Text = p0.text })
	})
end))