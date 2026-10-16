local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ScrollViewModule = require(Foundation.Components.ScrollView)
local _ = require(Foundation.Components.Types)
local VisibilityModule = require(Foundation.Enums.Visibility)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local UseScrollBarPaddingModule = require(script.Parent.useScrollBarPadding)
local UseDialogVariantsFunction = require(script.Parent.Parent.useDialogVariants).useDialogVariants
local UseDialogModule = require(script.Parent.Parent.useDialog)

return function(Gui) --[[ Line: 19 | Named "DialogContent" ]]
	-- upvalues: UseScrollBarPaddingModule (copy), UseDialogVariantsFunction (copy), UseDialogModule (copy), ReactModule (copy), ScrollViewModule (copy), WithCommonPropsModule (copy), VisibilityModule (copy)
	local UseScrollBarPaddingModuleResult, UseScrollBarPaddingModuleResult2, UseScrollBarPaddingModuleResult3 = UseScrollBarPaddingModule()
	local UseDialogVariantsResult = UseDialogVariantsFunction()
	Gui.testId = `{UseDialogModule().testId}--content`
	
	return ReactModule.createElement(ScrollViewModule, WithCommonPropsModule(Gui, {
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.new(0, 0, 0, 0),
			scrollBarVisibility = if UseScrollBarPaddingModuleResult then VisibilityModule.Auto else VisibilityModule.None
		},
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalFlex = Enum.UIFlexAlignment.Fill,
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		selection = {
			Selectable = (Gui.Selectable == nil or Gui.Selectable) and UseScrollBarPaddingModuleResult,
			NextSelectionUp = Gui.NextSelectionUp,
			NextSelectionDown = Gui.NextSelectionDown,
			NextSelectionLeft = Gui.NextSelectionLeft,
			NextSelectionRight = Gui.NextSelectionRight
		},
		onAbsoluteCanvasSizeChanged = UseScrollBarPaddingModuleResult3,
		onAbsoluteWindowSizeChanged = UseScrollBarPaddingModuleResult3,
		tag = UseDialogVariantsResult.content.tag
	}), {
		ScrollPadding = ReactModule.createElement("UIPadding", {
			PaddingRight = UseScrollBarPaddingModuleResult2:map(function(Offset): UDim --[[ Line: 55 ]]
				return UDim.new(0, Offset)
			end)
		}),
		ScrollContent = ReactModule.createElement(ReactModule.Fragment, nil, Gui.children)
	})
end