local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local useCallback = reactModule.useCallback
local useState = reactModule.useState
local useTokens = foundationModule.Hooks.useTokens
local fFlagMomentsTextAlignmentPickerModule = require(momentsCreation.Flags.FFlagMomentsTextAlignmentPicker)
local fFlagMomentsTextColorPickerModule = require(momentsCreation.Flags.FFlagMomentsTextColorPicker)
local fFlagMomentsTextFontPickerModule = require(momentsCreation.Flags.FFlagMomentsTextFontPicker)
local textAlignmentButtonModule = require(momentsCreation.Components.TextOverlay.TextAlignmentButton)
local textColorButtonModule = require(momentsCreation.Components.TextOverlay.TextColorButton)
local textColorSwatchRowModule = require(momentsCreation.Components.TextOverlay.TextColorSwatchRow)
local textFontButtonModule = require(momentsCreation.Components.TextOverlay.TextFontButton)
local textFontRowModule = require(momentsCreation.Components.TextOverlay.TextFontRow)
local _ = require(momentsCreation.Types.CreationFlowTypes)

return function(p1)
	-- upvalues: useTokens (ref), useState (ref), useCallback (ref), fFlagMomentsTextAlignmentPickerModule (ref), fFlagMomentsTextColorPickerModule (ref), fFlagMomentsTextFontPickerModule (ref), reactModule (ref), view (ref), textFontButtonModule (ref), textColorButtonModule (ref), textAlignmentButtonModule (ref), textColorSwatchRowModule (ref), textFontRowModule (ref)
	local controller = p1.controller
	local var1 = useTokens()
	local var2, var3 = useState(nil)
	
	return if p1.isKeyboardVisible or not fFlagMomentsTextAlignmentPickerModule and not fFlagMomentsTextColorPickerModule and not fFlagMomentsTextFontPickerModule then nil else reactModule.createElement(view, {
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
			FontButton = if fFlagMomentsTextFontPickerModule then reactModule.createElement(textFontButtonModule, {
				LayoutOrder = 1,
				expanded = var2 == "Font",
				onToggle = useCallback(function()
					-- upvalues: var3 (ref)
					var3(function(p2)
						return if p2 == "Font" then nil else "Font"
					end)
				end, {})
			}) else nil,
			ColorButton = if fFlagMomentsTextColorPickerModule then reactModule.createElement(textColorButtonModule, {
				LayoutOrder = 2,
				expanded = var2 == "Color",
				onToggle = useCallback(function()
					-- upvalues: var3 (ref)
					var3(function(p2)
						return if p2 == "Color" then nil else "Color"
					end)
				end, {})
			}) else nil,
			AlignmentButton = if fFlagMomentsTextAlignmentPickerModule then reactModule.createElement(textAlignmentButtonModule, { LayoutOrder = 3, controller = controller }) else nil
		}),
		SwatchRow = if fFlagMomentsTextColorPickerModule and var2 == "Color" then reactModule.createElement(textColorSwatchRowModule, { LayoutOrder = 2, controller = controller }) else nil,
		FontRow = if fFlagMomentsTextFontPickerModule and var2 == "Font" then reactModule.createElement(textFontRowModule, { LayoutOrder = 3, controller = controller }) else nil
	})
end