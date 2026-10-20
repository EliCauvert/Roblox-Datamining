local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local Icon = require(Parent.BuilderIcons).Icon
local _ = require(script.Parent.Parent.Utilities.DateTimeCalendarViewUtilities)
local DateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local ButtonVariantModule = require(Foundation.Enums.ButtonVariant)
local IconButtonModule = require(Foundation.Components.IconButton)
local InputSizeModule = require(Foundation.Enums.InputSize)
local TextModule = require(Foundation.Components.Text)
local ViewModule = require(Foundation.Components.View)

return function(p1)
	-- upvalues: ReactModule (copy), ViewModule (copy), IconButtonModule (copy), Icon (copy), InputSizeModule (copy), ButtonVariantModule (copy), TextModule (copy), DateTimeUtilitiesModule (copy)
	return ReactModule.createElement(ViewModule, {
		LayoutOrder = 1,
		tag = "row align-y-center gap-small size-full-0 auto-y padding-x-large padding-y-medium"
	}, {
		PreviousMonthButton = ReactModule.createElement(IconButtonModule, {
			isCircular = false,
			LayoutOrder = 1,
			icon = Icon.ChevronSmallLeft,
			onActivated = p1.onPreviousMonth,
			size = InputSizeModule.Small,
			testId = `{p1.testId}--previous-month-button`,
			variant = ButtonVariantModule.Utility
		}),
		FirstMonthLabel = ReactModule.createElement(TextModule, {
			LayoutOrder = 2,
			tag = "grow auto-y text-title-small text-align-x-center",
			testId = `{p1.testId}--first-month-label`,
			Text = `{DateTimeUtilitiesModule.monthMap[p1.currViewDate.month]} {p1.currViewDate.year}`
		}),
		SecondMonthLabel = ReactModule.createElement(TextModule, {
			LayoutOrder = 3,
			tag = "grow auto-y text-title-small text-align-x-center",
			testId = `{p1.testId}--second-month-label`,
			Text = `{DateTimeUtilitiesModule.monthMap[p1.secondMonth]} {p1.secondYear}`
		}),
		NextMonthButton = ReactModule.createElement(IconButtonModule, {
			isCircular = false,
			LayoutOrder = 4,
			icon = Icon.ChevronSmallRight,
			onActivated = p1.onNextMonth,
			size = InputSizeModule.Small,
			testId = `{p1.testId}--next-month-button`,
			variant = ButtonVariantModule.Utility
		})
	})
end