local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.BuilderIcons)
local IconModule = require(Foundation.Components.Icon)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local _ = require(Foundation.Enums.FillBehavior)
local FlagsModule = require(Foundation.Utility.Flags)
local _ = require(Foundation.Enums.IconSize)
local _ = require(Foundation.Enums.InputSize)
local _ = require(Foundation.Enums.SegmentedControlVariant)
local DevAssertModule = require(Foundation.Utility.devAssert)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local UseSegmentedControlVariantsModule = require(script.Parent.useSegmentedControlVariants)

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: FlagsModule (copy), UseTokensModule (copy), UseSegmentedControlVariantsModule (copy), DevAssertModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), IconModule (copy), TextModule (copy)
	local Variant = if FlagsModule.FoundationSegmentedControlBeta then p1.variant else nil
	local FillBehavior = if FlagsModule.FoundationSegmentedControlBeta then p1.fillBehavior else nil
	local UseSegmentedControlVariantsModuleResult = UseSegmentedControlVariantsModule(UseTokensModule(), p1.size, if FlagsModule.FoundationSegmentedControlBeta then Variant else nil, if FlagsModule.FoundationSegmentedControlBeta then FillBehavior else nil, p1.isCircular, if FlagsModule.FoundationSegmentedControlBeta then p1.isActive else nil)
	DevAssertModule(p1.text == nil or p1.icon == nil, "Segment: `text` and `icon` are mutually exclusive. Only one can be provided.")
	local HasIcon = p1.icon ~= nil
	local Name = nil
	local Variant1 = nil
	local Icon = nil
	
	if HasIcon then
		if typeof(p1.icon) == "table" then
			local Icon1 = p1.icon
			Name = Icon1.name
			Variant1 = Icon1.variant
		else
			Name = p1.icon
		end
		Icon = UseSegmentedControlVariantsModuleResult.icon
	end
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(p1, {
		tag = UseSegmentedControlVariantsModuleResult.segment.tag,
		onActivated = function()
			-- upvalues: p1 (copy)
			p1.onActivated(p1.id)
		end,
		ref = Ref
	}), {
		Text = if HasIcon then ReactModule.createElement(IconModule, {
			name = Name,
			variant = Variant1,
			size = Icon.size,
			style = Icon.style,
			testId = if FlagsModule.FoundationSegmentedControlBeta then `{p1.testId}--icon` else nil
		}) else ReactModule.createElement(TextModule, {
			tag = UseSegmentedControlVariantsModuleResult.text.tag,
			Text = p1.text,
			textStyle = if FlagsModule.FoundationSegmentedControlBeta then UseSegmentedControlVariantsModuleResult.text.style else nil,
			testId = if FlagsModule.FoundationSegmentedControlBeta then `{p1.testId}--text` else nil
		})
	})
end))