local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local dateTimeCalendarConstantsModule = require(script.Parent.Utilities.DateTimeCalendarConstants)
local dateTimeLayoutUtilitiesModule = require(script.Parent.Utilities.DateTimeLayoutUtilities)
local buttonModule = require(foundation.Components.Button)
local buttonVariantModule = require(foundation.Enums.ButtonVariant)
local dividerModule = require(foundation.Components.Divider)
local translatorModule = require(foundation.Utility.Localization.Translator)
local viewModule = require(foundation.Components.View)
local useScaledValueModule = require(foundation.Utility.useScaledValue)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return function(p0)
	-- upvalues: useTokensModule (ref), useScaledValueModule (ref), dateTimeLayoutUtilitiesModule (ref), reactModule (ref), buttonModule (ref), translatorModule (ref), buttonVariantModule (ref), viewModule (ref), dateTimeCalendarConstantsModule (ref), dividerModule (ref)
	local var11 = useTokensModule()
	local var12 = useScaledValueModule(dateTimeLayoutUtilitiesModule.PANE_WIDTH)
	local var13 = useScaledValueModule(dateTimeLayoutUtilitiesModule.CALENDAR_WIDTH)
	local var14 = useScaledValueModule(dateTimeLayoutUtilitiesModule.TIME_LIST_WIDTH)
	local var15 = reactModule.createElement(buttonModule, {
		LayoutOrder = 2,
		isDisabled = p0.isApplyButtonDisabled,
		onActivated = p0.onApply,
		testId = `{p0.testId}--apply-button`,
		text = translatorModule:FormatByKey("CommonUI.Controls.Action.Apply"),
		variant = buttonVariantModule.Emphasis
	})
	local var16 = reactModule.createElement(buttonModule, {
		LayoutOrder = 3,
		onActivated = p0.onCancel,
		testId = `{p0.testId}--cancel-button`,
		text = translatorModule:FormatByKey("CommonUI.Controls.Action.Cancel"),
		variant = buttonVariantModule.Standard
	})
	local var17 = if p0.isSectioned then "padding-x-large padding-y-large" else "padding-top-large"
	local var18 = if p0.showReset and p0.onReset then reactModule.createElement(viewModule, {
		LayoutOrder = 3,
		tag = `row align-y-center gap-small size-full-0 auto-y {var17}`
	}, {
		ResetButton = reactModule.createElement(buttonModule, {
			LayoutOrder = 1,
			isDisabled = p0.isResetButtonDisabled,
			onActivated = p0.onReset,
			testId = `{p0.testId}--reset-button`,
			text = translatorModule:FormatByKey("CommonUI.Controls.Action.ResetAll"),
			variant = buttonVariantModule.Utility
		}),
		PrimaryActions = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = "row align-x-right grow gap-small auto-y"
		}, { ApplyButton = var15, CancelButton = var16 })
	}) else reactModule.createElement(viewModule, {
		LayoutOrder = 3,
		tag = `row flex-fill gap-small size-full-0 auto-y {var17}`
	}, { ApplyButton = var15, CancelButton = var16 })
	local var19 = if p0.sectionedLayout == "dual" then 2 * var12 + 3 * var11.Padding.Large elseif p0.sectionedLayout == "singleWithTime" then dateTimeLayoutUtilitiesModule.computeSingleWithTimeLayout(var13, var14, var11, dateTimeCalendarConstantsModule.NUM_CALENDAR_GRID_ROWS).contentWidth else nil
	local var20 = p0.isSectioned == true
	local var21 = var20 and p0.sectionedLayout ~= nil
	
	return reactModule.createElement(viewModule, {
		Size = if var19 then UDim2.fromOffset(var19, 0) else nil,
		tag = {
			col = true,
			["bg-surface-200"] = true,
			["stroke-default"] = true,
			["radius-large"] = true,
			["auto-y"] = var21,
			["auto-xy"] = not var21,
			clip = var20,
			["padding-large"] = not var20
		}
	}, {
		Content = p0.children,
		ActionsDivider = if p0.isSectioned then reactModule.createElement(dividerModule, { LayoutOrder = 2 }) else nil,
		Actions = var18
	})
end