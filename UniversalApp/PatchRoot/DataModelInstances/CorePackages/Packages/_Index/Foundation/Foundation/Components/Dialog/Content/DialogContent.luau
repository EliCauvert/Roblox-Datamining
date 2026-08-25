local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local scrollViewModule = require(foundation.Components.ScrollView)
local _ = require(foundation.Components.Types)
local visibilityModule = require(foundation.Enums.Visibility)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local useScrollBarPaddingModule = require(script.Parent.useScrollBarPadding)
local useDialogVariants = require(script.Parent.Parent.useDialogVariants).useDialogVariants
local useDialogModule = require(script.Parent.Parent.useDialog)

return function(p1)
	-- upvalues: useScrollBarPaddingModule (ref), useDialogVariants (ref), useDialogModule (ref), reactModule (ref), scrollViewModule (ref), withCommonPropsModule (ref), visibilityModule (ref)
	local var1, var2, var3 = useScrollBarPaddingModule()
	local var4 = useDialogVariants()
	p1.testId = `{useDialogModule().testId}--content`
	
	return reactModule.createElement(scrollViewModule, withCommonPropsModule(p1, {
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.new(0, 0, 0, 0),
			scrollBarVisibility = if var1 then visibilityModule.Auto else visibilityModule.None
		},
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalFlex = Enum.UIFlexAlignment.Fill,
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		selection = {
			Selectable = (p1.Selectable == nil or p1.Selectable) and var1,
			NextSelectionUp = p1.NextSelectionUp,
			NextSelectionDown = p1.NextSelectionDown,
			NextSelectionLeft = p1.NextSelectionLeft,
			NextSelectionRight = p1.NextSelectionRight
		},
		onAbsoluteCanvasSizeChanged = var3,
		onAbsoluteWindowSizeChanged = var3,
		tag = var4.content.tag
	}), {
		ScrollPadding = reactModule.createElement("UIPadding", {
			PaddingRight = var2:map(function(p1)
				return UDim.new(0, p1)
			end)
		}),
		ScrollContent = reactModule.createElement(reactModule.Fragment, nil, p1.children)
	})
end