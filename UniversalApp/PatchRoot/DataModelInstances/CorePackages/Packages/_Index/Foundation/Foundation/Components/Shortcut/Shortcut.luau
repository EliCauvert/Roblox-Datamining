local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local _ = require(foundation.Enums.InputPlatform)
local inputSizeModule = require(foundation.Enums.InputSize)
local placementModule = require(foundation.Enums.Placement)
local _ = require(foundation.Enums.ShortcutSeparator)
local shortcutVariantModule = require(foundation.Enums.ShortcutVariant)
local useInputPlatformModule = require(foundation.Utility.useInputPlatform)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local keyCapModule = require(script.Parent.KeyCap)
local separatorModule = require(script.Parent.Separator)
local keyDisplayModule = require(script.Parent.keyDisplay)
local useShortcutVariantsModule = require(script.Parent.useShortcutVariants)
local t = {
	testId = "--foundation-shortcut",
	size = inputSizeModule.XSmall,
	placement = placementModule.Start,
	variant = shortcutVariantModule.Standard
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useInputPlatformModule (ref), useShortcutVariantsModule (ref), reactModule (ref), separatorModule (ref), keyDisplayModule (ref), keyCapModule (ref), viewModule (ref), withCommonPropsModule (ref), placementModule (ref), textModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useInputPlatformModule()
	local var3 = useShortcutVariantsModule(useTokensModule(), var1.size, var1.variant)
	local t_1 = {}
	local var4 = 0
	local var5 = 0
	
	for i, v in var1.shortcut do
		if v.separator ~= nil then
			var5 += 1
			t_1[`Separator{var5}`] = reactModule.createElement(separatorModule, {
				separator = v.separator,
				variantProps = var3,
				LayoutOrder = i,
				testId = `{var1.testId}--separator-{var21}`
			})
		elseif v.keyCode ~= nil and not keyDisplayModule.isNonDisplayable(v.keyCode) then
			var4 += 1
			t_1[`Key{var4}`] = reactModule.createElement(keyCapModule, {
				keyCode = v.keyCode,
				platform = var2,
				variantProps = var3,
				LayoutOrder = i,
				testId = `{var1.testId}--key-{var20}`
			})
		end
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		tag = var3.container.tag,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var3.container.gap),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		ref = p2
	}), {
		Keys = reactModule.createElement(viewModule, {
			tag = var3.keys.tag,
			LayoutOrder = if var1.placement == placementModule.End then 2 else 1,
			testId = `{var1.testId}--keys`
		}, t_1),
		Keybinding = if var1.keybinding == nil or var1.keybinding == "" then nil else reactModule.createElement(textModule, {
			Text = var1.keybinding,
			tag = var3.keybinding.tag,
			LayoutOrder = if var1.placement == placementModule.End then 1 else 2,
			testId = `{var1.testId}--keybinding`
		})
	})
end))