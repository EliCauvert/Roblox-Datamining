local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local iconModule = require(foundation.Components.Icon)
local textModule = require(foundation.Components.Text)
local viewModule = require(foundation.Components.View)
local _ = require(foundation.Enums.InputPlatform)
local keyDisplayModule = require(script.Parent.keyDisplay)
local _ = require(script.Parent.useShortcutVariants)

return function(p1)
	-- upvalues: keyDisplayModule (ref), reactModule (ref), viewModule (ref), iconModule (ref), textModule (ref)
	local variantProps = p1.variantProps
	local var1 = keyDisplayModule.resolveKey(p1.keyCode, p1.platform)
	
	return if var1 == nil then nil elseif var1.kind == "GamepadIcon" then reactModule.createElement(viewModule, {
		tag = variantProps.capless.tag,
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId
	}, {
		Content = reactModule.createElement(iconModule, {
			name = var1.icon,
			size = variantProps.gamepadIcon.size,
			style = variantProps.gamepadIcon.style,
			testId = `{p1.testId}--icon`
		})
	}) else reactModule.createElement(viewModule, {
		tag = variantProps.cap.tag,
		padding = if var1.kind == "Text" and (utf8.len(var1.text) or 0) > 1 then {
			left = UDim.new(0, variantProps.capWide.padding),
			right = UDim.new(0, variantProps.capWide.padding)
		} else nil,
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId
	}, {
		Content = if var1.kind == "Icon" then reactModule.createElement(iconModule, {
			name = var1.icon,
			size = variantProps.icon.size,
			style = variantProps.icon.style,
			testId = `{p1.testId}--icon`
		}) else reactModule.createElement(textModule, {
			Text = var1.text,
			tag = variantProps.text.tag,
			testId = `{p1.testId}--text`
		})
	})
end