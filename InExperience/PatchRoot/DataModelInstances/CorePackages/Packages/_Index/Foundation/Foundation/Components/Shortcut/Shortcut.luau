local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local _ = require(Foundation.Enums.InputPlatform)
local PlacementModule = require(Foundation.Enums.Placement)
local _ = require(Foundation.Enums.ShortcutSeparator)
local UseInputPlatformModule = require(Foundation.Utility.useInputPlatform)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local KeyCapModule = require(script.Parent.KeyCap)
local SeparatorModule = require(script.Parent.Separator)
local KeyDisplayModule = require(script.Parent.keyDisplay)
local UseShortcutVariantsModule = require(script.Parent.useShortcutVariants)
local config = {
	testId = "--foundation-shortcut",
	size = require(Foundation.Enums.InputSize).XSmall,
	placement = PlacementModule.Start,
	variant = require(Foundation.Enums.ShortcutVariant).Standard
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseInputPlatformModule (copy), UseShortcutVariantsModule (copy), ReactModule (copy), SeparatorModule (copy), KeyDisplayModule (copy), KeyCapModule (copy), ViewModule (copy), WithCommonPropsModule (copy), PlacementModule (copy), TextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseInputPlatformModuleResult = UseInputPlatformModule()
	local UseShortcutVariantsModuleResult = UseShortcutVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, WithDefaultsModuleResult.variant)
	local Elements = {}
	local Count = 0
	local Count1 = 0
	
	for LayoutOrder, value in WithDefaultsModuleResult.shortcut do
		if value.separator ~= nil then
			Count1 += 1
			Elements[`Separator{Count1}`] = ReactModule.createElement(SeparatorModule, {
				separator = value.separator,
				variantProps = UseShortcutVariantsModuleResult,
				LayoutOrder = LayoutOrder,
				testId = `{WithDefaultsModuleResult.testId}--separator-{Count1}`
			})
		elseif value.keyCode ~= nil and not KeyDisplayModule.isNonDisplayable(value.keyCode) then
			Count += 1
			Elements[`Key{Count}`] = ReactModule.createElement(KeyCapModule, {
				keyCode = value.keyCode,
				platform = UseInputPlatformModuleResult,
				variantProps = UseShortcutVariantsModuleResult,
				LayoutOrder = LayoutOrder,
				testId = `{WithDefaultsModuleResult.testId}--key-{Count}`
			})
		end
	end
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = UseShortcutVariantsModuleResult.container.tag,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, UseShortcutVariantsModuleResult.container.gap),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		ref = Ref
	}), {
		Keys = ReactModule.createElement(ViewModule, {
			tag = UseShortcutVariantsModuleResult.keys.tag,
			LayoutOrder = if WithDefaultsModuleResult.placement == PlacementModule.End then 2 else 1,
			testId = `{WithDefaultsModuleResult.testId}--keys`
		}, Elements),
		Keybinding = if WithDefaultsModuleResult.keybinding == nil or WithDefaultsModuleResult.keybinding == "" then nil else ReactModule.createElement(TextModule, {
			Text = WithDefaultsModuleResult.keybinding,
			tag = UseShortcutVariantsModuleResult.keybinding.tag,
			LayoutOrder = if WithDefaultsModuleResult.placement == PlacementModule.End then 1 else 2,
			testId = `{WithDefaultsModuleResult.testId}--keybinding`
		})
	})
end))