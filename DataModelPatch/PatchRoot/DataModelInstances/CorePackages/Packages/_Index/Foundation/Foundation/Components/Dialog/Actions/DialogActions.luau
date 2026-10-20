local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local ButtonModule = require(Foundation.Components.Button)
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

return function(p1)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseDialogVariantsFunction (copy), UseDialogModule (copy), ReactModule (copy), DashModule (copy), ButtonModule (copy), FillBehaviorModule (copy), DialogSizeModule (copy), OrientationModule (copy), ViewModule (copy), TextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseDialogVariantsResult = UseDialogVariantsFunction()
	local UseDialogModuleResult = UseDialogModule()
	local IsResponsiveSizeMatch = UseDialogModuleResult.responsiveSize == DialogSizeModule.Small
	
	return ReactModule.createElement(ViewModule, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = WithDefaultsModuleResult.LayoutOrder,
		testId = `{UseDialogModuleResult.testId}--actions`
	}, {
		ActionsContainer = ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			tag = {
				["gap-small size-full-0 auto-y"] = true,
				["row wrap"] = WithDefaultsModuleResult.orientation == OrientationModule.Horizontal or not IsResponsiveSizeMatch,
				["col flex-x-fill"] = WithDefaultsModuleResult.orientation == OrientationModule.Vertical and IsResponsiveSizeMatch
			},
			testId = `{UseDialogModuleResult.testId}--actions-container`
		}, {
			Actions = ReactModule.useMemo(function()
				-- upvalues: WithDefaultsModuleResult (copy), ReactModule (upval), DashModule (upval), ButtonModule (upval), FillBehaviorModule (upval)
				return if WithDefaultsModuleResult.actions then ReactModule.createElement(ReactModule.Fragment, nil, DashModule.map(WithDefaultsModuleResult.actions, function(p2, LayoutOrder)
					-- upvalues: ReactModule (upval), ButtonModule (upval), DashModule (upval), FillBehaviorModule (upval)
					return ReactModule.createElement(ButtonModule, DashModule.join(p2, {
						key = `{LayoutOrder}-{p2.text}`,
						Name = p2.text,
						LayoutOrder = LayoutOrder,
						fillBehavior = FillBehaviorModule.Fill
					}))
				end)) else nil
			end, { WithDefaultsModuleResult.actions })
		}),
		ActionsLabel = if WithDefaultsModuleResult.label then ReactModule.createElement(TextModule, {
			LayoutOrder = 2,
			Text = WithDefaultsModuleResult.label,
			tag = UseDialogVariantsResult.actionsLabel.tag,
			testId = `{UseDialogModuleResult.testId}--actions-label`
		}) else nil
	})
end