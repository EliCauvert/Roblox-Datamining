local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ButtonGroupModule = require(Foundation.Components.ButtonGroup)
local _ = require(Foundation.Enums.ButtonVariant)
local DialogSizeModule = require(Foundation.Enums.DialogSize)
local FillBehaviorModule = require(Foundation.Enums.FillBehavior)
local OrientationModule = require(Foundation.Enums.Orientation)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseDialogVariantsFunction = require(script.Parent.Parent.useDialogVariants).useDialogVariants
local UseDialogModule = require(script.Parent.Parent.useDialog)
local config = { orientation = OrientationModule.Horizontal }

return function(p1) --[[ Line: 45 | Named "DialogActions" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseDialogVariantsFunction (copy), UseDialogModule (copy), DialogSizeModule (copy), OrientationModule (copy), ReactModule (copy), ViewModule (copy), ButtonGroupModule (copy), FillBehaviorModule (copy), TextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseDialogVariantsResult = UseDialogVariantsFunction()
	local UseDialogModuleResult = UseDialogModule()
	local IsResponsiveSizeMatch = UseDialogModuleResult.responsiveSize == DialogSizeModule.Small
	local IsResponsiveSizeMatch1: boolean = WithDefaultsModuleResult.orientation == OrientationModule.Vertical and IsResponsiveSizeMatch
	
	return ReactModule.createElement(ViewModule, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = WithDefaultsModuleResult.LayoutOrder,
		testId = `{UseDialogModuleResult.testId}--actions`
	}, {
		ActionsContainer = ReactModule.createElement(ButtonGroupModule, {
			LayoutOrder = 1,
			buttons = WithDefaultsModuleResult.actions or {},
			orientation = if IsResponsiveSizeMatch1 then OrientationModule.Vertical else OrientationModule.Horizontal,
			fillBehavior = FillBehaviorModule.Fill,
			testId = `{UseDialogModuleResult.testId}--actions-container`
		}),
		ActionsLabel = if WithDefaultsModuleResult.label then ReactModule.createElement(TextModule, {
			LayoutOrder = 2,
			Text = WithDefaultsModuleResult.label,
			tag = UseDialogVariantsResult.actionsLabel.tag,
			testId = `{UseDialogModuleResult.testId}--actions-label`
		}) else nil
	})
end