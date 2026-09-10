local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local fFlagMomentsTextAlignmentPickerModule = require(momentsCreation.Flags.FFlagMomentsTextAlignmentPicker)
local textAlignmentButtonModule = require(momentsCreation.Components.TextOverlay.TextAlignmentButton)
local _ = require(momentsCreation.Types.CreationFlowTypes)

return function(p1)
	-- upvalues: useTokens (ref), fFlagMomentsTextAlignmentPickerModule (ref), reactModule (ref), view (ref), textAlignmentButtonModule (ref)
	return if fFlagMomentsTextAlignmentPickerModule then reactModule.createElement(view, {
		tag = "col align-x-center gap-medium position-bottom-center anchor-bottom-center auto-xy",
		ZIndex = 10,
		padding = { bottom = UDim.new(0, useTokens().Padding.Large) }
	}, {
		IconRow = reactModule.createElement(view, { LayoutOrder = 1, tag = "row gap-xsmall auto-xy" }, {
			AlignmentButton = reactModule.createElement(textAlignmentButtonModule, { controller = p1.controller })
		})
	}) else nil
end