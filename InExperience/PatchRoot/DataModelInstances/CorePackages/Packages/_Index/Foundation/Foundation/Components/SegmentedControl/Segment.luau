local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local _ = require(parent.BuilderIcons)
local iconModule = require(foundation.Components.Icon)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local _ = require(foundation.Enums.FillBehavior)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Enums.IconSize)
local _ = require(foundation.Enums.InputSize)
local _ = require(foundation.Enums.SegmentedControlVariant)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local useSegmentedControlVariantsModule = require(script.Parent.useSegmentedControlVariants)

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 50 | named "Segment" ]]
	-- upvalues: flagsModule (ref), useTokensModule (ref), useSegmentedControlVariantsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref), textModule (ref)
	local var9 = useSegmentedControlVariantsModule(useTokensModule(), p0.size, if flagsModule.FoundationSegmentedControlBeta then if flagsModule.FoundationSegmentedControlBeta then p0.variant else nil else nil, if flagsModule.FoundationSegmentedControlBeta then if flagsModule.FoundationSegmentedControlBeta then p0.fillBehavior else nil else nil, p0.isCircular, if flagsModule.FoundationSegmentedControlBeta then p0.isActive else nil)
	
	if _G.__DEV__ == true then
		assert(if p0.text ~= nil then p0.icon == nil else true, "Segment: `text` and `icon` are mutually exclusive. Only one can be provided.")
	end
	local var10 = p0.icon ~= nil
	local icon = nil
	local variant = nil
	local icon_1 = nil
	
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
	return reactModule.createElement(viewModule, withCommonPropsModule(p0, {
		tag = var9.segment.tag,
		onActivated = function() --[[ line: 95 ]]
			-- upvalues: p0 (ref)
			p0.onActivated(p0.id)
		end,
		ref = p1
	}), {
		Text = if var10 then reactModule.createElement(iconModule, {
			name = icon,
			variant = variant,
			size = icon_1.size,
			style = icon_1.style,
			testId = if flagsModule.FoundationSegmentedControlBeta then `{p0.testId}--icon` else nil
		}) else reactModule.createElement(textModule, {
			tag = var9.text.tag,
			Text = p0.text,
			textStyle = if flagsModule.FoundationSegmentedControlBeta then var9.text.style else nil,
			testId = if flagsModule.FoundationSegmentedControlBeta then `{p0.testId}--text` else nil
		})
	})
end))