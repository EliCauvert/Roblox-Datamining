local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local DateTimeCalendarConstantsModule = require(script.Parent.Utilities.DateTimeCalendarConstants)
local DateTimeLayoutUtilitiesModule = require(script.Parent.Utilities.DateTimeLayoutUtilities)
local ButtonModule = require(Foundation.Components.Button)
local ButtonVariantModule = require(Foundation.Enums.ButtonVariant)
local DividerModule = require(Foundation.Components.Divider)
local TranslatorModule = require(Foundation.Utility.Localization.Translator)
local ViewModule = require(Foundation.Components.View)
local UseScaledValueModule = require(Foundation.Utility.useScaledValue)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return function(p1)
	-- upvalues: UseTokensModule (copy), UseScaledValueModule (copy), DateTimeLayoutUtilitiesModule (copy), ReactModule (copy), ButtonModule (copy), TranslatorModule (copy), ButtonVariantModule (copy), ViewModule (copy), DateTimeCalendarConstantsModule (copy), DividerModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local Element = ReactModule.createElement(ButtonModule, {
		LayoutOrder = 2,
		isDisabled = p1.isApplyButtonDisabled,
		onActivated = p1.onApply,
		testId = `{p1.testId}--apply-button`,
		text = TranslatorModule:FormatByKey("CommonUI.Controls.Action.Apply"),
		variant = ButtonVariantModule.Emphasis
	})
	local Element1 = ReactModule.createElement(ButtonModule, {
		LayoutOrder = 3,
		onActivated = p1.onCancel,
		testId = `{p1.testId}--cancel-button`,
		text = TranslatorModule:FormatByKey("CommonUI.Controls.Action.Cancel"),
		variant = ButtonVariantModule.Standard
	})
	local PaddingXLargePaddingYLarge: string = if p1.isSectioned then "padding-x-large padding-y-large" else "padding-top-large"
	local NewUseScaledValueModuleResult = 2 * UseScaledValueModule(DateTimeLayoutUtilitiesModule.PANE_WIDTH) + 3 * UseTokensModuleResult.Padding.Large
	local ContentWidth = DateTimeLayoutUtilitiesModule.computeSingleWithTimeLayout(UseScaledValueModule(DateTimeLayoutUtilitiesModule.CALENDAR_WIDTH), UseScaledValueModule(DateTimeLayoutUtilitiesModule.TIME_LIST_WIDTH), UseTokensModuleResult, DateTimeCalendarConstantsModule.NUM_CALENDAR_GRID_ROWS).contentWidth
	local XOffset = if p1.sectionedLayout == "dual" then NewUseScaledValueModuleResult elseif p1.sectionedLayout == "singleWithTime" then ContentWidth else nil
	local IsIsSectioned = p1.isSectioned == true
	local HasSectionedLayout: boolean = IsIsSectioned and p1.sectionedLayout ~= nil
	
	return ReactModule.createElement(ViewModule, {
		Size = if XOffset then UDim2.fromOffset(XOffset, 0) else nil,
		tag = {
			col = true,
			["bg-surface-200"] = true,
			["stroke-default"] = true,
			["radius-large"] = true,
			["auto-y"] = HasSectionedLayout,
			["auto-xy"] = not HasSectionedLayout,
			clip = IsIsSectioned,
			["padding-large"] = not IsIsSectioned
		}
	}, {
		Content = p1.children,
		ActionsDivider = if p1.isSectioned then ReactModule.createElement(DividerModule, { LayoutOrder = 2 }) else nil,
		Actions = if p1.showReset and p1.onReset then ReactModule.createElement(ViewModule, {
			LayoutOrder = 3,
			tag = `row align-y-center gap-small size-full-0 auto-y {PaddingXLargePaddingYLarge}`
		}, {
			ResetButton = ReactModule.createElement(ButtonModule, {
				LayoutOrder = 1,
				isDisabled = p1.isResetButtonDisabled,
				onActivated = p1.onReset,
				testId = `{p1.testId}--reset-button`,
				text = TranslatorModule:FormatByKey("CommonUI.Controls.Action.ResetAll"),
				variant = ButtonVariantModule.Utility
			}),
			PrimaryActions = ReactModule.createElement(ViewModule, {
				LayoutOrder = 2,
				tag = "row align-x-right grow gap-small auto-y"
			}, { ApplyButton = Element, CancelButton = Element1 })
		}) else ReactModule.createElement(ViewModule, {
			LayoutOrder = 3,
			tag = `row flex-fill gap-small size-full-0 auto-y {PaddingXLargePaddingYLarge}`
		}, { ApplyButton = Element, CancelButton = Element1 })
	})
end