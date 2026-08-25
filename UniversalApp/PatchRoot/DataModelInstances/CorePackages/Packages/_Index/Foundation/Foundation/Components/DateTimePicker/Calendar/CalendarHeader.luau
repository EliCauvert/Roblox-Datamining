local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local icon = require(parent.BuilderIcons).Icon
local _ = require(script.Parent.Parent.Utilities.DateTimeCalendarViewUtilities)
local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)
local buttonVariantModule = require(foundation.Enums.ButtonVariant)
local dropdownModule = require(foundation.Components.Dropdown)
local iconButtonModule = require(foundation.Components.IconButton)
local inputSizeModule = require(foundation.Enums.InputSize)
local inputVariantModule = require(foundation.Enums.InputVariant)
local viewModule = require(foundation.Components.View)
local useScaledValueModule = require(foundation.Utility.useScaledValue)
local useScrollToSelectedRefModule = require(script.Parent.useScrollToSelectedRef)
local useTextSizeModule = require(foundation.Utility.useTextSize)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return function(p0)
	-- upvalues: useTokensModule (ref), dateTimeUtilitiesModule (ref), useTextSizeModule (ref), useScaledValueModule (ref), reactModule (ref), useScrollToSelectedRefModule (ref), viewModule (ref), iconButtonModule (ref), icon (ref), inputSizeModule (ref), buttonVariantModule (ref), dropdownModule (ref), inputVariantModule (ref)
	local viewDate = p0.viewDate
	local var13 = useTokensModule()
	local var14 = useTextSizeModule(dateTimeUtilitiesModule.monthMap[viewDate.month], var13.Typography.BodySmall)
	local var15 = useTextSizeModule(tostring(viewDate.year), var13.Typography.BodySmall)
	local var16 = useScaledValueModule(44)
	local var17 = useScaledValueModule(200)
	local var18 = if var14 then math.ceil(var14.X) + var16 else 110
	local var19 = if var15 then math.ceil(var15.X) + var16 else 70
	local var20 = reactModule.useMemo(function()
		-- upvalues: dateTimeUtilitiesModule (copy)
		local t = {}
		
		for i, v in dateTimeUtilitiesModule.monthMap do
			table.insert(t, { id = i, text = v })
		end
		return t
	end, {})
	local var21 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), dateTimeUtilitiesModule (copy), viewDate (ref)
		local year, year_1
		local _ = nil
		local _ = nil
		
		if p0.selectableDateRange then
			year = dateTimeUtilitiesModule.toLocalTime(p0.selectableDateRange.startDate).Year
			year_1 = dateTimeUtilitiesModule.toLocalTime(p0.selectableDateRange.endDate).Year
		else
			year = viewDate.year - 50
			year_1 = viewDate.year + 50
		end
		local t = {}
		
		for i = year, year_1 do
			table.insert(t, { id = i, text = tostring(i) })
		end
		return t
	end, { p0.selectableDateRange, viewDate.year })
	
	return reactModule.createElement(viewModule, {
		tag = "row align-y-center gap-small size-full-0 auto-y padding-y-small",
		LayoutOrder = p0.LayoutOrder
	}, {
		PreviousMonthButton = reactModule.createElement(iconButtonModule, {
			LayoutOrder = 1,
			icon = icon.ChevronSmallLeft,
			onActivated = p0.onPreviousMonth,
			size = inputSizeModule.Small,
			testId = `{p0.testId}--previous-month-button`,
			variant = buttonVariantModule.Utility
		}),
		MonthYearDropdowns = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = "row align-x-center align-y-center grow gap-small auto-y"
		}, {
			MonthDropdown = reactModule.createElement(dropdownModule.Root, {
				label = "",
				LayoutOrder = 1,
				items = var20,
				maxHeight = var17,
				onItemChanged = reactModule.useCallback(function(p1)
					-- upvalues: p0 (ref), viewDate (ref)
					local var24 = tonumber(p1)
					
					if var24 then
						p0.onViewDateChanged({ month = var24, year = viewDate.year })
					end
				end, { p0.onViewDateChanged, viewDate.year }),
				scrollingFrameRef = useScrollToSelectedRefModule(var20, viewDate.month),
				size = inputSizeModule.XSmall,
				testId = `{p0.testId}--month-dropdown`,
				value = viewDate.month,
				variant = inputVariantModule.Utility,
				width = UDim.new(0, var18)
			}),
			YearDropdown = reactModule.createElement(dropdownModule.Root, {
				label = "",
				LayoutOrder = 2,
				items = var21,
				maxHeight = var17,
				onItemChanged = reactModule.useCallback(function(p2)
					-- upvalues: p0 (ref), viewDate (ref)
					local var25 = tonumber(p2)
					
					if var25 then
						p0.onViewDateChanged({ month = viewDate.month, year = var25 })
					end
				end, { p0.onViewDateChanged, viewDate.month }),
				scrollingFrameRef = useScrollToSelectedRefModule(var21, viewDate.year),
				size = inputSizeModule.XSmall,
				testId = `{p0.testId}--year-dropdown`,
				value = viewDate.year,
				variant = inputVariantModule.Utility,
				width = UDim.new(0, var19)
			})
		}),
		NextMonthButton = reactModule.createElement(iconButtonModule, {
			LayoutOrder = 3,
			icon = icon.ChevronSmallRight,
			onActivated = p0.onNextMonth,
			size = inputSizeModule.Small,
			testId = `{p0.testId}--next-month-button`,
			variant = buttonVariantModule.Utility
		})
	})
end