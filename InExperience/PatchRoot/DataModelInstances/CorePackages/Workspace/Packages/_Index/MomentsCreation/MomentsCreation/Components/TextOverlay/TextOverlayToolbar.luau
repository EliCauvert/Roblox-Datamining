local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local useToggleState = momentsCommonModule.Hooks.useToggleState
local fFlagMomentsTextAlignmentPickerModule = require(momentsCreation.Flags.FFlagMomentsTextAlignmentPicker)
local fFlagMomentsTextColorPickerModule = require(momentsCreation.Flags.FFlagMomentsTextColorPicker)
local textAlignmentButtonModule = require(momentsCreation.Components.TextOverlay.TextAlignmentButton)
local textColorButtonModule = require(momentsCreation.Components.TextOverlay.TextColorButton)
local textColorSwatchRowModule = require(momentsCreation.Components.TextOverlay.TextColorSwatchRow)
local _ = require(momentsCreation.Types.CreationFlowTypes)

return function(p1)
	-- upvalues: useTokens (ref), useToggleState (ref), fFlagMomentsTextAlignmentPickerModule (ref), fFlagMomentsTextColorPickerModule (ref), reactModule (ref), view (ref), textColorButtonModule (ref), textAlignmentButtonModule (ref), textColorSwatchRowModule (ref)
	local controller = p1.controller
	local var1 = useTokens()
	local var2 = useToggleState(false)
	
	return if p1.isKeyboardVisible or not fFlagMomentsTextAlignmentPickerModule and not fFlagMomentsTextColorPickerModule then nil else reactModule.createElement(view, {
		tag = "col align-x-center gap-medium position-bottom-center anchor-bottom-center size-full-0 auto-y",
		ZIndex = 10,
		padding = { bottom = UDim.new(0, var1.Padding.Large) }
	}, {
		IconRow = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row gap-xsmall auto-xy",
			padding = {
				left = UDim.new(0, var1.Padding.Large),
				right = UDim.new(0, var1.Padding.Large)
			}
		}, {
			ColorButton = if fFlagMomentsTextColorPickerModule then reactModule.createElement(textColorButtonModule, { expanded = var2.enabled, onToggle = var2.toggle }) else nil,
			AlignmentButton = if fFlagMomentsTextAlignmentPickerModule then reactModule.createElement(textAlignmentButtonModule, { controller = controller }) else nil
		}),
		SwatchRow = if fFlagMomentsTextColorPickerModule and var2.enabled then reactModule.createElement(textColorSwatchRowModule, { LayoutOrder = 2, controller = controller }) else nil
	})
end