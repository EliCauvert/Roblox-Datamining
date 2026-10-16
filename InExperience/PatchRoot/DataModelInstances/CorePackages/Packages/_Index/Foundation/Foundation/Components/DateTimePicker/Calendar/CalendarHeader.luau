local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local Icon = require(Parent.BuilderIcons).Icon
local _ = require(script.Parent.Parent.Utilities.DateTimeCalendarViewUtilities)
local DateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local ButtonVariantModule = require(Foundation.Enums.ButtonVariant)
local DropdownModule = require(Foundation.Components.Dropdown)
local IconButtonModule = require(Foundation.Components.IconButton)
local InputSizeModule = require(Foundation.Enums.InputSize)
local InputVariantModule = require(Foundation.Enums.InputVariant)
local ViewModule = require(Foundation.Components.View)
local UseScaledValueModule = require(Foundation.Utility.useScaledValue)
local UseScrollToSelectedRefModule = require(script.Parent.useScrollToSelectedRef)
local UseTextSizeModule = require(Foundation.Utility.useTextSize)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return function(Frame) --[[ Line: 46 | Named "CalendarHeader" ]]
	-- upvalues: UseTokensModule (copy), DateTimeUtilitiesModule (copy), UseTextSizeModule (copy), UseScaledValueModule (copy), ReactModule (copy), UseScrollToSelectedRefModule (copy), ViewModule (copy), IconButtonModule (copy), Icon (copy), InputSizeModule (copy), ButtonVariantModule (copy), DropdownModule (copy), InputVariantModule (copy)
	local ViewDate = Frame.viewDate
	local UseTokensModuleResult = UseTokensModule()
	local Text = tostring(ViewDate.year)
	local UseTextSizeModuleResult = UseTextSizeModule(DateTimeUtilitiesModule.monthMap[ViewDate.month], UseTokensModuleResult.Typography.BodySmall)
	local UseTextSizeModuleResult1 = UseTextSizeModule(Text, UseTokensModuleResult.Typography.BodySmall)
	local UseScaledValueModuleResult = UseScaledValueModule(44)
	local UseScaledValueModuleResult1 = UseScaledValueModule(200)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 59 ]]
		-- upvalues: DateTimeUtilitiesModule (upval)
		local List = {}
		
		for Id, Text in DateTimeUtilitiesModule.monthMap do
			table.insert(List, { id = Id, text = Text })
		end
		return List
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 70 ]]
		-- upvalues: Frame (copy), DateTimeUtilitiesModule (upval), ViewDate (copy)
		local Year = nil
		local Year1 = nil
		if Frame.selectableDateRange then
			Year = DateTimeUtilitiesModule.toLocalTime(Frame.selectableDateRange.startDate).Year
			Year1 = DateTimeUtilitiesModule.toLocalTime(Frame.selectableDateRange.endDate).Year
		else
			Year = ViewDate.year - 50
			Year1 = ViewDate.year + 50
		end
		local List = {}
		
		for i = Year, Year1 do
			table.insert(List, { id = i, text = tostring(i) })
		end
		return List
	end, { Frame.selectableDateRange, ViewDate.year })
	
	return ReactModule.createElement(ViewModule, {
		tag = "row align-y-center gap-small size-full-0 auto-y padding-y-small",
		LayoutOrder = Frame.LayoutOrder
	}, {
		PreviousMonthButton = ReactModule.createElement(IconButtonModule, {
			LayoutOrder = 1,
			icon = Icon.ChevronSmallLeft,
			onActivated = Frame.onPreviousMonth,
			size = InputSizeModule.Small,
			testId = `{Frame.testId}--previous-month-button`,
			variant = ButtonVariantModule.Utility
		}),
		MonthYearDropdowns = ReactModule.createElement(ViewModule, {
			LayoutOrder = 2,
			tag = "row align-x-center align-y-center grow gap-small auto-y"
		}, {
			MonthDropdown = ReactModule.createElement(DropdownModule.Root, {
				label = "",
				LayoutOrder = 1,
				items = UseMemoResult,
				maxHeight = UseScaledValueModuleResult1,
				onItemChanged = ReactModule.useCallback(function(p1) --[[ Line: 92 ]]
					-- upvalues: Frame (copy), ViewDate (copy)
					local Number: number? = tonumber(p1)
					
					if Number then
						Frame.onViewDateChanged({ month = Number, year = ViewDate.year })
					end
				end, { Frame.onViewDateChanged, ViewDate.year }),
				scrollingFrameRef = UseScrollToSelectedRefModule(UseMemoResult, ViewDate.month),
				size = InputSizeModule.XSmall,
				testId = `{Frame.testId}--month-dropdown`,
				value = ViewDate.month,
				variant = InputVariantModule.Utility,
				width = UDim.new(0, if UseTextSizeModuleResult then math.ceil(UseTextSizeModuleResult.X) + UseScaledValueModuleResult else 110)
			}),
			YearDropdown = ReactModule.createElement(DropdownModule.Root, {
				label = "",
				LayoutOrder = 2,
				items = UseMemoResult1,
				maxHeight = UseScaledValueModuleResult1,
				onItemChanged = ReactModule.useCallback(function(p1) --[[ Line: 99 ]]
					-- upvalues: Frame (copy), ViewDate (copy)
					local Number: number? = tonumber(p1)
					
					if Number then
						Frame.onViewDateChanged({ month = ViewDate.month, year = Number })
					end
				end, { Frame.onViewDateChanged, ViewDate.month }),
				scrollingFrameRef = UseScrollToSelectedRefModule(UseMemoResult1, ViewDate.year),
				size = InputSizeModule.XSmall,
				testId = `{Frame.testId}--year-dropdown`,
				value = ViewDate.year,
				variant = InputVariantModule.Utility,
				width = UDim.new(0, if UseTextSizeModuleResult1 then math.ceil(UseTextSizeModuleResult1.X) + UseScaledValueModuleResult else 70)
			})
		}),
		NextMonthButton = ReactModule.createElement(IconButtonModule, {
			LayoutOrder = 3,
			icon = Icon.ChevronSmallRight,
			onActivated = Frame.onNextMonth,
			size = InputSizeModule.Small,
			testId = `{Frame.testId}--next-month-button`,
			variant = ButtonVariantModule.Utility
		})
	})
end