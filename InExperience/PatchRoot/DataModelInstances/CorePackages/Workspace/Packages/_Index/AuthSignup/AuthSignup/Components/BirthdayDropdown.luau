local AuthSignup = script:FindFirstAncestor("AuthSignup")
local Parent = AuthSignup.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local AuthCommonModule = require(Parent.AuthCommon)
local TimeModule = require(Parent.Time)
local AuthFormInteractionFunction = AuthAnalyticsModule.Events.authFormInteraction
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ValidateBirthdayModule = require(AuthSignup.Util.validateBirthday)
local Birthday = AuthCommonModule.Models.Birthday
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseEffectFunction = ReactModule.useEffect
local UseStateFunction = ReactModule.useState
local TimeUnit = TimeModule.TimeUnit
local DateHelper = TimeModule.DateHelper
local DropdownWithPopover = AuthCommonModule.Components.DropdownWithPopover

local function v16(p1) --[[ Line: 34 ]]
	local List = {}
	
	for i = 1, 12 do
		table.insert(List, { text = p1[i], value = i })
	end
	return List
end

local config = { minAgeAllowed = 0, maxAgeAllowed = 99 }

return ReactModule.memo(function(p2) --[[ Line: 63 | Named "BirthdayDropdown" ]]
	-- upvalues: CryoModule (copy), config (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), DateHelper (copy), UseStateFunction (copy), TimeUnit (copy), ReactModule (copy), v16 (copy), UseEffectFunction (copy), Birthday (copy), ValidateBirthdayModule (copy), EventStreamConstants (copy), AuthFormInteractionFunction (copy), View (copy), DropdownWithPopover (copy), Text (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p2)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		errorText = "Authentication.SignUp.Response.InvalidBirthday",
		monthLabel = "Authentication.SignUp.Label.Month",
		dayLabel = "Authentication.SignUp.Label.Day",
		yearLabel = "Authentication.SignUp.Label.Year"
	})
	local UseLocalizationResult1 = UseLocalizationFunction(DateHelper.MonthsLocalizationKeys)
	local UseStateResult, UseStateResult2 = UseStateFunction(nil)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(nil)
	local UseStateResult3, UseStateResult2_2 = UseStateFunction(nil)
	local UseStateResult4, UseStateResult2_3 = UseStateFunction(false)
	local CurrentDateEntry = DateHelper:getCurrentDate()[TimeUnit.Years]
	local MinAgeAllowed = JoinResult.minAgeAllowed
	local CurrentDateEntryDelta = CurrentDateEntry - JoinResult.maxAgeAllowed
	local CurrentDateEntryDelta1 = CurrentDateEntry - MinAgeAllowed
	local DateTypeOrderEntry = DateHelper.DateTypeOrder[JoinResult.localeId]
	local DateTypeOrderEntry1 = DateTypeOrderEntry[TimeUnit.Months]
	local DateTypeOrderEntry2 = DateTypeOrderEntry[TimeUnit.Days]
	local DateTypeOrderEntry3 = DateTypeOrderEntry[TimeUnit.Years]
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 91 ]]
		-- upvalues: DateHelper (upval), CurrentDateEntryDelta (copy), CurrentDateEntryDelta1 (copy)
		return DateHelper:generateYearCellDatas(CurrentDateEntryDelta, CurrentDateEntryDelta1)
	end, { CurrentDateEntryDelta, CurrentDateEntryDelta1 })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 94 ]]
		-- upvalues: v16 (upval), UseLocalizationResult1 (copy)
		return (v16(UseLocalizationResult1))
	end, { UseLocalizationResult1 })
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 97 ]]
		-- upvalues: DateHelper (upval)
		return DateHelper:generateDayCellDatas()
	end, {})
	local FocusOnMount = JoinResult.focusOnMount
	UseEffectFunction(function() --[[ Line: 103 ]]
		-- upvalues: UseStateResult1 (copy), UseStateResult (copy), UseStateResult3 (copy), Birthday (upval), ValidateBirthdayModule (upval), MinAgeAllowed (copy), JoinResult (copy), UseStateResult2_3 (copy), EventStreamConstants (upval), AuthFormInteractionFunction (upval)
		if UseStateResult1 == nil or UseStateResult == nil or UseStateResult3 == nil then return end
		local NewBirthday = Birthday.new({
			Month = UseStateResult1,
			Day = UseStateResult,
			Year = UseStateResult3
		})
		
		if ValidateBirthdayModule(UseStateResult1, UseStateResult, UseStateResult3, MinAgeAllowed) then
			JoinResult.onBirthdaySelected(NewBirthday, NewBirthday:GetAgeInYears(), true)
			UseStateResult2_3(false)
			AuthFormInteractionFunction(JoinResult.analyticsEventContext, EventStreamConstants.Field.BirthdayDropdown, EventStreamConstants.State.BirthdayDropdownBirthdaySelected .. "," .. NewBirthday:ToString(","))
			
			return
		else
			JoinResult.onBirthdaySelected(NewBirthday, NewBirthday:GetAgeInYears(), false)
			UseStateResult2_3(true)
			AuthFormInteractionFunction(JoinResult.analyticsEventContext, EventStreamConstants.Field.BirthdayDropdown, EventStreamConstants.State.BirthdayDropdownInvalidBirthdayError)
		end
	end, { UseStateResult1, UseStateResult, UseStateResult3 })
	
	return ReactModule.createElement(View, { tag = "col size-full-0 auto-y gap-small align-x-start" }, {
		DropdownContainer = ReactModule.createElement(View, { tag = "row size-full-0 flex-x-fill auto-y gap-medium" }, {
			MonthDropdown = ReactModule.createElement(DropdownWithPopover, {
				dropdownHeight = 40,
				fixSizeToParent = true,
				placeholder = UseLocalizationResult.monthLabel,
				value = UseStateResult1,
				cellDatas = UseMemoResult1,
				layoutOrder = DateTypeOrderEntry1,
				onChange = UseStateResult2_1,
				errorState = UseStateResult4,
				focusOnMount = FocusOnMount and DateTypeOrderEntry1 == 1,
				backgroundColorToken = UseTokensResult.Color.Common.Shadow,
				onDropdownOpened = JoinResult.onDropdownOpened
			}),
			DayDropdown = ReactModule.createElement(DropdownWithPopover, {
				dropdownHeight = 40,
				fixSizeToParent = true,
				placeholder = UseLocalizationResult.dayLabel,
				value = UseStateResult,
				cellDatas = UseMemoResult2,
				layoutOrder = DateTypeOrderEntry2,
				onChange = UseStateResult2,
				errorState = UseStateResult4,
				focusOnMount = FocusOnMount and DateTypeOrderEntry2 == 1,
				backgroundColorToken = UseTokensResult.Color.Common.Shadow,
				onDropdownOpened = JoinResult.onDropdownOpened
			}),
			YearDropdown = ReactModule.createElement(DropdownWithPopover, {
				dropdownHeight = 40,
				fixSizeToParent = true,
				placeholder = UseLocalizationResult.yearLabel,
				value = UseStateResult3,
				cellDatas = UseMemoResult,
				layoutOrder = DateTypeOrderEntry3,
				onChange = UseStateResult2_2,
				errorState = UseStateResult4,
				focusOnMount = FocusOnMount and DateTypeOrderEntry3 == 1,
				backgroundColorToken = UseTokensResult.Color.Common.Shadow,
				onDropdownOpened = JoinResult.onDropdownOpened
			})
		}),
		ErrorText = UseStateResult4 and ReactModule.createElement(Text, {
			tag = "auto-xy text-body-small",
			Text = UseLocalizationResult.errorText,
			padding = { bottom = UDim.new(0, 0) },
			textStyle = UseTokensResult.Color.System.Alert
		})
	})
end)