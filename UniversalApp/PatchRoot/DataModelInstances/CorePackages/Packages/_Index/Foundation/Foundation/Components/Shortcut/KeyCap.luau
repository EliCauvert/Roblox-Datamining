local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local IconModule = require(Foundation.Components.Icon)
local TextModule = require(Foundation.Components.Text)
local ViewModule = require(Foundation.Components.View)
local _ = require(Foundation.Enums.InputPlatform)
local KeyDisplayModule = require(script.Parent.keyDisplay)
local _ = require(script.Parent.useShortcutVariants)

return function(Frame: Frame)
	-- upvalues: KeyDisplayModule (copy), ReactModule (copy), ViewModule (copy), IconModule (copy), TextModule (copy)
	local VariantProps = Frame.variantProps
	local ResolveKeyResult = KeyDisplayModule.resolveKey(Frame.keyCode, Frame.platform)
	
	if ResolveKeyResult == nil then
		return nil
	elseif ResolveKeyResult.kind == "GamepadIcon" then
		return ReactModule.createElement(ViewModule, {
			tag = VariantProps.capless.tag,
			LayoutOrder = Frame.LayoutOrder,
			testId = Frame.testId
		}, {
			Content = ReactModule.createElement(IconModule, {
				name = ResolveKeyResult.icon,
				size = VariantProps.gamepadIcon.size,
				style = VariantProps.gamepadIcon.style,
				testId = `{Frame.testId}--icon`
			})
		})
	else
		local v1: boolean = ResolveKeyResult.kind == "Text" and (utf8.len(ResolveKeyResult.text) or 0) > 1
		
		return ReactModule.createElement(ViewModule, {
			tag = VariantProps.cap.tag,
			padding = if v1 then {
				left = UDim.new(0, VariantProps.capWide.padding),
				right = UDim.new(0, VariantProps.capWide.padding)
			} else nil,
			LayoutOrder = Frame.LayoutOrder,
			testId = Frame.testId
		}, {
			Content = if ResolveKeyResult.kind == "Icon" then ReactModule.createElement(IconModule, {
				name = ResolveKeyResult.icon,
				size = VariantProps.icon.size,
				style = VariantProps.icon.style,
				testId = `{Frame.testId}--icon`
			}) else ReactModule.createElement(TextModule, {
				Text = ResolveKeyResult.text,
				tag = VariantProps.text.tag,
				testId = `{Frame.testId}--text`
			})
		})
	end
end