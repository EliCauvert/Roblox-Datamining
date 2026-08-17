local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local icon = require(parent.BuilderIcons).Icon
local _ = require(script.Parent.Parent.Utilities.DateTimeCalendarViewUtilities)
local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local buttonVariantModule = require(foundation.Enums.ButtonVariant)
local iconButtonModule = require(foundation.Components.IconButton)
local inputSizeModule = require(foundation.Enums.InputSize)
local textModule = require(foundation.Components.Text)
local viewModule = require(foundation.Components.View)

return function(p0) --[[ line: 28 | named "TwoMonthCalendarHeader" ]]
	-- upvalues: reactModule (ref), viewModule (ref), iconButtonModule (ref), icon (ref), inputSizeModule (ref), buttonVariantModule (ref), textModule (ref), dateTimeUtilitiesModule (ref)
	return reactModule.createElement(viewModule, {
		LayoutOrder = 1,
		tag = "row align-y-center gap-small size-full-0 auto-y padding-x-large padding-y-medium"
	}, {
		PreviousMonthButton = reactModule.createElement(iconButtonModule, {
			isCircular = false,
			LayoutOrder = 1,
			icon = icon.ChevronSmallLeft,
			onActivated = p0.onPreviousMonth,
			size = inputSizeModule.Small,
			testId = `{p0.testId}--previous-month-button`,
			variant = buttonVariantModule.Utility
		}),
		FirstMonthLabel = reactModule.createElement(textModule, {
			LayoutOrder = 2,
			tag = "grow auto-y text-title-small text-align-x-center",
			testId = `{p0.testId}--first-month-label`,
			Text = `{dateTimeUtilitiesModule.monthMap[p0.currViewDate.month]} {p0.currViewDate.year}`
		}),
		SecondMonthLabel = reactModule.createElement(textModule, {
			LayoutOrder = 3,
			tag = "grow auto-y text-title-small text-align-x-center",
			testId = `{p0.testId}--second-month-label`,
			Text = `{dateTimeUtilitiesModule.monthMap[p0.secondMonth]} {p0.secondYear}`
		}),
		NextMonthButton = reactModule.createElement(iconButtonModule, {
			isCircular = false,
			LayoutOrder = 4,
			icon = icon.ChevronSmallRight,
			onActivated = p0.onNextMonth,
			size = inputSizeModule.Small,
			testId = `{p0.testId}--next-month-button`,
			variant = buttonVariantModule.Utility
		})
	})
end