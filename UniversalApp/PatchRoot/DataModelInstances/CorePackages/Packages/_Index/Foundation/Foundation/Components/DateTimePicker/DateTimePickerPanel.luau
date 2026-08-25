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

return function(p1)
	-- upvalues: useTokensModule (ref), useScaledValueModule (ref), dateTimeLayoutUtilitiesModule (ref), reactModule (ref), buttonModule (ref), translatorModule (ref), buttonVariantModule (ref), viewModule (ref), dateTimeCalendarConstantsModule (ref), dividerModule (ref)
	local var1 = useTokensModule()
	local var2 = useScaledValueModule(dateTimeLayoutUtilitiesModule.PANE_WIDTH)
	local var3 = useScaledValueModule(dateTimeLayoutUtilitiesModule.CALENDAR_WIDTH)
	local var4 = useScaledValueModule(dateTimeLayoutUtilitiesModule.TIME_LIST_WIDTH)
	local var5 = reactModule.createElement(buttonModule, {
		LayoutOrder = 2,
		isDisabled = p1.isApplyButtonDisabled,
		onActivated = p1.onApply,
		testId = `{p1.testId}--apply-button`,
		text = translatorModule:FormatByKey("CommonUI.Controls.Action.Apply"),
		variant = buttonVariantModule.Emphasis
	})
	local var6 = reactModule.createElement(buttonModule, {
		LayoutOrder = 3,
		onActivated = p1.onCancel,
		testId = `{p1.testId}--cancel-button`,
		text = translatorModule:FormatByKey("CommonUI.Controls.Action.Cancel"),
		variant = buttonVariantModule.Standard
	})
	local var7 = if p1.isSectioned then "padding-x-large padding-y-large" else "padding-top-large"
	local var8 = if p1.showReset and p1.onReset then reactModule.createElement(viewModule, {
		LayoutOrder = 3,
		tag = `row align-y-center gap-small size-full-0 auto-y {var7}`
	}, {
		ResetButton = reactModule.createElement(buttonModule, {
			LayoutOrder = 1,
			isDisabled = p1.isResetButtonDisabled,
			onActivated = p1.onReset,
			testId = `{p1.testId}--reset-button`,
			text = translatorModule:FormatByKey("CommonUI.Controls.Action.ResetAll"),
			variant = buttonVariantModule.Utility
		}),
		PrimaryActions = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = "row align-x-right grow gap-small auto-y"
		}, { ApplyButton = var5, CancelButton = var6 })
	}) else reactModule.createElement(viewModule, {
		LayoutOrder = 3,
		tag = `row flex-fill gap-small size-full-0 auto-y {var7}`
	}, { ApplyButton = var5, CancelButton = var6 })
	local var9 = if p1.sectionedLayout == "dual" then 2 * var2 + 3 * var1.Padding.Large elseif p1.sectionedLayout == "singleWithTime" then dateTimeLayoutUtilitiesModule.computeSingleWithTimeLayout(var3, var4, var1, dateTimeCalendarConstantsModule.NUM_CALENDAR_GRID_ROWS).contentWidth else nil
	local var10 = p1.isSectioned == true
	local var11 = var10 and p1.sectionedLayout ~= nil
	
	return reactModule.createElement(viewModule, {
		Size = if var9 then UDim2.fromOffset(var9, 0) else nil,
		tag = {
			col = true,
			["bg-surface-200"] = true,
			["stroke-default"] = true,
			["radius-large"] = true,
			["auto-y"] = var11,
			["auto-xy"] = not var11,
			clip = var10,
			["padding-large"] = not var10
		}
	}, {
		Content = p1.children,
		ActionsDivider = if p1.isSectioned then reactModule.createElement(dividerModule, { LayoutOrder = 2 }) else nil,
		Actions = var8
	})
end