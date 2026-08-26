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

return function(p1)
	-- upvalues: useTokensModule (ref), dateTimeUtilitiesModule (ref), useTextSizeModule (ref), useScaledValueModule (ref), reactModule (ref), useScrollToSelectedRefModule (ref), viewModule (ref), iconButtonModule (ref), icon (ref), inputSizeModule (ref), buttonVariantModule (ref), dropdownModule (ref), inputVariantModule (ref)
	local viewDate = p1.viewDate
	local var1 = useTokensModule()
	local var2 = useTextSizeModule(dateTimeUtilitiesModule.monthMap[viewDate.month], var1.Typography.BodySmall)
	local var3 = useTextSizeModule(tostring(viewDate.year), var1.Typography.BodySmall)
	local var4 = useScaledValueModule(44)
	local var5 = useScaledValueModule(200)
	local var6 = if var2 then math.ceil(var2.X) + var4 else 110
	local var7 = if var3 then math.ceil(var3.X) + var4 else 70
	local var8 = reactModule.useMemo(function()
		-- upvalues: dateTimeUtilitiesModule (copy)
		local t = {}
		
		for i, v in dateTimeUtilitiesModule.monthMap do
			table.insert(t, { id = i, text = v })
		end
		return t
	end, {})
	local var9 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), dateTimeUtilitiesModule (copy), viewDate (ref)
		local year, year_1
		local _ = nil
		local _ = nil
		
		if p1.selectableDateRange then
			year = dateTimeUtilitiesModule.toLocalTime(p1.selectableDateRange.startDate).Year
			year_1 = dateTimeUtilitiesModule.toLocalTime(p1.selectableDateRange.endDate).Year
		else
			year = viewDate.year - 50
			year_1 = viewDate.year + 50
		end
		local t = {}
		
		for i = year, year_1 do
			table.insert(t, { id = i, text = tostring(i) })
		end
		return t
	end, { p1.selectableDateRange, viewDate.year })
	
	return reactModule.createElement(viewModule, {
		tag = "row align-y-center gap-small size-full-0 auto-y padding-y-small",
		LayoutOrder = p1.LayoutOrder
	}, {
		PreviousMonthButton = reactModule.createElement(iconButtonModule, {
			LayoutOrder = 1,
			icon = icon.ChevronSmallLeft,
			onActivated = p1.onPreviousMonth,
			size = inputSizeModule.Small,
			testId = `{p1.testId}--previous-month-button`,
			variant = buttonVariantModule.Utility
		}),
		MonthYearDropdowns = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = "row align-x-center align-y-center grow gap-small auto-y"
		}, {
			MonthDropdown = reactModule.createElement(dropdownModule.Root, {
				label = "",
				LayoutOrder = 1,
				items = var8,
				maxHeight = var5,
				onItemChanged = reactModule.useCallback(function(p2)
					-- upvalues: p1 (ref), viewDate (ref)
					local var10 = tonumber(p2)
					
					if var10 then
						p1.onViewDateChanged({ month = var10, year = viewDate.year })
					end
				end, { p1.onViewDateChanged, viewDate.year }),
				scrollingFrameRef = useScrollToSelectedRefModule(var8, viewDate.month),
				size = inputSizeModule.XSmall,
				testId = `{p1.testId}--month-dropdown`,
				value = viewDate.month,
				variant = inputVariantModule.Utility,
				width = UDim.new(0, var6)
			}),
			YearDropdown = reactModule.createElement(dropdownModule.Root, {
				label = "",
				LayoutOrder = 2,
				items = var9,
				maxHeight = var5,
				onItemChanged = reactModule.useCallback(function(p2)
					-- upvalues: p1 (ref), viewDate (ref)
					local var10 = tonumber(p2)
					
					if var10 then
						p1.onViewDateChanged({ month = viewDate.month, year = var10 })
					end
				end, { p1.onViewDateChanged, viewDate.month }),
				scrollingFrameRef = useScrollToSelectedRefModule(var9, viewDate.year),
				size = inputSizeModule.XSmall,
				testId = `{p1.testId}--year-dropdown`,
				value = viewDate.year,
				variant = inputVariantModule.Utility,
				width = UDim.new(0, var7)
			})
		}),
		NextMonthButton = reactModule.createElement(iconButtonModule, {
			LayoutOrder = 3,
			icon = icon.ChevronSmallRight,
			onActivated = p1.onNextMonth,
			size = inputSizeModule.Small,
			testId = `{p1.testId}--next-month-button`,
			variant = buttonVariantModule.Utility
		})
	})
end