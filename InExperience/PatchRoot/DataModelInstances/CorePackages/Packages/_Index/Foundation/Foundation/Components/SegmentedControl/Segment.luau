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

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: flagsModule (ref), useTokensModule (ref), useSegmentedControlVariantsModule (ref), devAssertModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref), textModule (ref)
	local var10 = useSegmentedControlVariantsModule(useTokensModule(), p0.size, if flagsModule.FoundationSegmentedControlBeta then if flagsModule.FoundationSegmentedControlBeta then p0.variant else nil else nil, if flagsModule.FoundationSegmentedControlBeta then if flagsModule.FoundationSegmentedControlBeta then p0.fillBehavior else nil else nil, p0.isCircular, if flagsModule.FoundationSegmentedControlBeta then p0.isActive else nil)
	devAssertModule(if p0.text ~= nil then p0.icon == nil else true, "Segment: `text` and `icon` are mutually exclusive. Only one can be provided.")
	local var11 = p0.icon ~= nil
	local icon = nil
	local variant = nil
	local icon_1 = nil
	
	if var11 then
		if typeof(p0.icon) == "table" then
			local icon_2 = p0.icon
			icon = icon_2.name
			variant = icon_2.variant
		else
			icon = p0.icon
		end
		icon_1 = var10.icon
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(p0, {
		tag = var10.segment.tag,
		onActivated = function()
			-- upvalues: p0 (ref)
			p0.onActivated(p0.id)
		end,
		ref = p1
	}), {
		Text = if var11 then reactModule.createElement(iconModule, {
			name = icon,
			variant = variant,
			size = icon_1.size,
			style = icon_1.style,
			testId = if flagsModule.FoundationSegmentedControlBeta then `{p0.testId}--icon` else nil
		}) else reactModule.createElement(textModule, {
			tag = var10.text.tag,
			Text = p0.text,
			textStyle = if flagsModule.FoundationSegmentedControlBeta then var10.text.style else nil,
			testId = if flagsModule.FoundationSegmentedControlBeta then `{p0.testId}--text` else nil
		})
	})
end))