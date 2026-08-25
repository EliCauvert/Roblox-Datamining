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
local devAssertModule = require(foundation.Utility.devAssert)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local useSegmentedControlVariantsModule = require(script.Parent.useSegmentedControlVariants)

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: flagsModule (ref), useTokensModule (ref), useSegmentedControlVariantsModule (ref), devAssertModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref), textModule (ref)
	local var1 = useSegmentedControlVariantsModule(useTokensModule(), p1.size, if flagsModule.FoundationSegmentedControlBeta then if flagsModule.FoundationSegmentedControlBeta then p1.variant else nil else nil, if flagsModule.FoundationSegmentedControlBeta then if flagsModule.FoundationSegmentedControlBeta then p1.fillBehavior else nil else nil, p1.isCircular, if flagsModule.FoundationSegmentedControlBeta then p1.isActive else nil)
	devAssertModule(if p1.text ~= nil then p1.icon == nil else true, "Segment: `text` and `icon` are mutually exclusive. Only one can be provided.")
	local var2 = p1.icon ~= nil
	local icon = nil
	local variant = nil
	local icon_1 = nil
	
	if var2 then
		if typeof(p1.icon) == "table" then
			local icon_2 = p1.icon
			icon = icon_2.name
			variant = icon_2.variant
		else
			icon = p1.icon
		end
		icon_1 = var1.icon
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(p1, {
		tag = var1.segment.tag,
		onActivated = function()
			-- upvalues: p1 (ref)
			p1.onActivated(p1.id)
		end,
		ref = p2
	}), {
		Text = if var2 then reactModule.createElement(iconModule, {
			name = icon,
			variant = variant,
			size = icon_1.size,
			style = icon_1.style,
			testId = if flagsModule.FoundationSegmentedControlBeta then `{p1.testId}--icon` else nil
		}) else reactModule.createElement(textModule, {
			tag = var1.text.tag,
			Text = p1.text,
			textStyle = if flagsModule.FoundationSegmentedControlBeta then var1.text.style else nil,
			testId = if flagsModule.FoundationSegmentedControlBeta then `{p1.testId}--text` else nil
		})
	})
end))