local authSignup = script:FindFirstAncestor("AuthSignup")
local parent = authSignup.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local authAnalyticsModule = require(parent.AuthAnalytics)
local authCommonModule = require(parent.AuthCommon)
local timeModule = require(parent.Time)
local authFormInteraction = authAnalyticsModule.Events.authFormInteraction
local eventStreamConstants = authAnalyticsModule.EventStreamConstants
local useLocalization = require(parent.Localization).Hooks.useLocalization
local validateBirthdayModule = require(authSignup.Util.validateBirthday)
local birthday = authCommonModule.Models.Birthday
local useTokens = foundationModule.Hooks.useTokens
local text = foundationModule.Text
local view = foundationModule.View
local useEffect = reactModule.useEffect
local useState = reactModule.useState
local timeUnit = timeModule.TimeUnit
local dateHelper = timeModule.DateHelper
local dropdownWithPopover = authCommonModule.Components.DropdownWithPopover

local var1 = function(p1)
	local t = {}
	
	for i = 1, 12 do
		table.insert(t, { text = p1[i], value = i })
	end
	return t
end

local t = { minAgeAllowed = 0, maxAgeAllowed = 99 }

return reactModule.memo(function(p2)
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), useLocalization (ref), dateHelper (ref), useState (ref), timeUnit (ref), reactModule (ref), var1 (ref), useEffect (ref), birthday (ref), validateBirthdayModule (ref), eventStreamConstants (ref), authFormInteraction (ref), view (ref), dropdownWithPopover (ref), text (ref)
	local var2 = cryoModule.Dictionary.join(t, p2)
	local var3 = useTokens()
	local var4 = useLocalization({
		errorText = "Authentication.SignUp.Response.InvalidBirthday",
		monthLabel = "Authentication.SignUp.Label.Month",
		dayLabel = "Authentication.SignUp.Label.Day",
		yearLabel = "Authentication.SignUp.Label.Year"
	})
	local var5 = useLocalization(dateHelper.MonthsLocalizationKeys)
	local var6, var7 = useState(nil)
	local var8, var9 = useState(nil)
	local var10, var11 = useState(nil)
	local var12, var13 = useState(false)
	local years = dateHelper:getCurrentDate()[timeUnit.Years]
	local minAgeAllowed = var2.minAgeAllowed
	local var14 = years - var2.maxAgeAllowed
	local var15 = years - minAgeAllowed
	local localeId = dateHelper.DateTypeOrder[var2.localeId]
	local months = localeId[timeUnit.Months]
	local days = localeId[timeUnit.Days]
	local years_1 = localeId[timeUnit.Years]
	local var16 = reactModule.useMemo(function()
		-- upvalues: dateHelper (copy), var14 (ref), var15 (ref)
		return dateHelper:generateYearCellDatas(var14, var15)
	end, { var14, var15 })
	local var17 = reactModule.useMemo(function()
		-- upvalues: var1 (copy), var5 (ref)
		return var1(var5)
	end, { var5 })
	local var18 = reactModule.useMemo(function()
		-- upvalues: dateHelper (copy)
		return dateHelper:generateDayCellDatas()
	end, {})
	local focusOnMount = var2.focusOnMount
	useEffect(function()
		-- upvalues: var8 (ref), var6 (ref), var10 (ref), birthday (copy), validateBirthdayModule (copy), minAgeAllowed (ref), var2 (ref), var13 (ref), eventStreamConstants (copy), authFormInteraction (copy)
		if var8 == nil or var6 == nil or var10 == nil then return end
		local var19 = birthday.new({ Month = var8, Day = var6, Year = var10 })
		
		if validateBirthdayModule(var8, var6, var10, minAgeAllowed) then
			var2.onBirthdaySelected(var19, var19:GetAgeInYears(), true)
			var13(false)
			authFormInteraction(var2.analyticsEventContext, eventStreamConstants.Field.BirthdayDropdown, eventStreamConstants.State.BirthdayDropdownBirthdaySelected .. "," .. var28:ToString(","))
			
			return
		end
		var2.onBirthdaySelected(var19, var19:GetAgeInYears(), false)
		var13(true)
		authFormInteraction(var2.analyticsEventContext, eventStreamConstants.Field.BirthdayDropdown, eventStreamConstants.State.BirthdayDropdownInvalidBirthdayError)
	end, { var8, var6, var10 })
	
	return reactModule.createElement(view, { tag = "col size-full-0 auto-y gap-small align-x-start" }, {
		DropdownContainer = reactModule.createElement(view, { tag = "row size-full-0 flex-x-fill auto-y gap-medium" }, {
			MonthDropdown = reactModule.createElement(dropdownWithPopover, {
				dropdownHeight = 40,
				fixSizeToParent = true,
				placeholder = var4.monthLabel,
				value = var8,
				cellDatas = var17,
				layoutOrder = months,
				onChange = var9,
				errorState = var12,
				focusOnMount = focusOnMount and months == 1,
				backgroundColorToken = var3.Color.Common.Shadow,
				onDropdownOpened = var2.onDropdownOpened
			}),
			DayDropdown = reactModule.createElement(dropdownWithPopover, {
				dropdownHeight = 40,
				fixSizeToParent = true,
				placeholder = var4.dayLabel,
				value = var6,
				cellDatas = var18,
				layoutOrder = days,
				onChange = var7,
				errorState = var12,
				focusOnMount = focusOnMount and days == 1,
				backgroundColorToken = var3.Color.Common.Shadow,
				onDropdownOpened = var2.onDropdownOpened
			}),
			YearDropdown = reactModule.createElement(dropdownWithPopover, {
				dropdownHeight = 40,
				fixSizeToParent = true,
				placeholder = var4.yearLabel,
				value = var10,
				cellDatas = var16,
				layoutOrder = years_1,
				onChange = var11,
				errorState = var12,
				focusOnMount = focusOnMount and years_1 == 1,
				backgroundColorToken = var3.Color.Common.Shadow,
				onDropdownOpened = var2.onDropdownOpened
			})
		}),
		ErrorText = var12 and reactModule.createElement(text, {
			tag = "auto-xy text-body-small",
			Text = var4.errorText,
			padding = { bottom = UDim.new(0, 0) },
			textStyle = var3.Color.System.Alert
		})
	})
end)