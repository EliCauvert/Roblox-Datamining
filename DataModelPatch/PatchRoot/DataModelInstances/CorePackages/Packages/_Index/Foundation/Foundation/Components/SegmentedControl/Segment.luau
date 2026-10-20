local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.BuilderIcons)
local FlagsModule = require(Foundation.Utility.Flags)
local IconModule = require(Foundation.Components.Icon)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local _ = require(Foundation.Enums.IconSize)
local _ = require(Foundation.Enums.InputSize)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local UseSegmentedControlVariantsModule = require(script.Parent.useSegmentedControlVariants)

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseTokensModule (copy), UseSegmentedControlVariantsModule (copy), FlagsModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), IconModule (copy), TextModule (copy)
	local UseSegmentedControlVariantsModuleResult = UseSegmentedControlVariantsModule(UseTokensModule(), p1.size, if FlagsModule.FoundationSegmentedControlCircular then p1.isCircular else nil)
	
	if _G.__DEV__ == true then
		assert(p1.text == nil or p1.icon == nil, "Segment: `text` and `icon` are mutually exclusive. Only one can be provided.")
	end
	local HasIcon = p1.icon ~= nil
	local Name = nil
	local Variant = nil
	local Icon = nil
	
	if HasIcon then
		if typeof(p1.icon) == "table" then
			local Icon1 = p1.icon
			Name = Icon1.name
			Variant = Icon1.variant
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
			variant = Variant,
			size = Icon.size,
			style = Icon.style
		}) else ReactModule.createElement(TextModule, {
			tag = UseSegmentedControlVariantsModuleResult.text.tag,
			Text = p1.text
		})
	})
end))