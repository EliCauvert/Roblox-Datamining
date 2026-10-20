local LocalizationService = game:GetService("LocalizationService")
local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local Parent = AccountUpgrade.Parent
local ReactModule = require(Parent.React)
local OtterModule = require(Parent.Otter)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseRequireManualSelectionModule = require(AccountUpgrade.Hooks.useRequireManualSelection)
local _ = require(script.Parent.BirthdaySheetView)
local DateHelper = require(Parent.Time).DateHelper
local UseValidatedBirthdayFunction = require(Parent.AuthSignup).Hooks.useValidatedBirthday
local FIntSinglePageSignupMinimumAge = require(Parent.SharedFlags).FIntSinglePageSignupMinimumAge
local config = { frequency = 3 }

local function useSlide(Current)
	-- upvalues: FoundationModule (copy), ReactModule (copy), OtterModule (copy), config (copy)
	local ReducedMotion = FoundationModule.Hooks.usePreferences().reducedMotion
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(if ReducedMotion then 1 else 0)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: OtterModule (upval), ReducedMotion (copy)
		return OtterModule.createSingleMotor(if ReducedMotion then 1 else 0)
	end, { ReducedMotion })
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(Current)
	UseRefResult1.current = Current
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), UseBindingResult2 (copy), UseRefResult (copy), UseRefResult1 (copy), ReducedMotion (copy), OtterModule (upval), config (upval)
		local OnStepResult = UseMemoResult:onStep(function(p1: number)
			-- upvalues: UseBindingResult2 (upval), UseRefResult (upval), UseMemoResult (upval), UseRefResult1 (upval)
			UseBindingResult2(p1)
			
			if UseRefResult.current and p1 <= 0.1 then
				UseRefResult.current = false
				UseMemoResult:stop()
				UseRefResult1.current()
			end
		end)
		
		if not ReducedMotion then
			UseMemoResult:setGoal(OtterModule.spring(1, config))
		end
		return function()
			-- upvalues: OnStepResult (copy), UseMemoResult (upval)
			OnStepResult()
			UseMemoResult:destroy()
		end
	end, { UseMemoResult, ReducedMotion })
	
	return UseBindingResult, (ReactModule.useCallback(function()
		-- upvalues: ReducedMotion (copy), UseRefResult1 (copy), UseRefResult (copy), UseMemoResult (copy), OtterModule (upval), config (upval)
		if ReducedMotion then
			UseRefResult1.current()
			
			return
		end
		if not UseRefResult.current then
			UseRefResult.current = true
			UseMemoResult:setGoal(OtterModule.spring(0, config))
			
			return
		end
	end, { UseMemoResult, ReducedMotion }))
end

return function(p1)
	-- upvalues: useSlide (copy), UseValidatedBirthdayFunction (copy), FIntSinglePageSignupMinimumAge (copy), UseRequireManualSelectionModule (copy), ReactModule (copy), UseLocalizationFunction (copy), DateHelper (copy), LocalizationService (copy)
	local UseSlideResult, UseSlideResult2 = useSlide(p1.onClose)
	local UseValidatedBirthdayResult, UseValidatedBirthdayResult2 = UseValidatedBirthdayFunction(FIntSinglePageSignupMinimumAge)
	local UseRequireManualSelectionModuleResult = UseRequireManualSelectionModule()
	local OnConfirmFunction = p1.onConfirm
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseValidatedBirthdayResult (copy), OnConfirmFunction (copy)
		if UseValidatedBirthdayResult ~= nil then
			OnConfirmFunction(UseValidatedBirthdayResult)
		end
	end, { UseValidatedBirthdayResult, OnConfirmFunction })
	local OnAllPickedFunction = p1.onAllPicked
	local UseRefResult = ReactModule.useRef(false)
	local UseResult1 = ReactModule.useCallback(function(p2, p3, p4)
		-- upvalues: UseValidatedBirthdayResult2 (copy), OnAllPickedFunction (copy), UseRefResult (copy)
		UseValidatedBirthdayResult2(p2, p3, p4)
		
		if OnAllPickedFunction and not UseRefResult.current and p2 and p3 and p4 then
			UseRefResult.current = true
			OnAllPickedFunction()
		end
	end, { UseValidatedBirthdayResult2, OnAllPickedFunction })
	local UseValidatedBirthdayResult1 = if p1.showsAgeSummary then UseValidatedBirthdayResult else nil
	local AgeInYears = if UseValidatedBirthdayResult1 then UseValidatedBirthdayResult1:GetAgeInYears() else nil
	local OnAgeSummaryShownFunction = p1.onAgeSummaryShown
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: AgeInYears (copy), OnAgeSummaryShownFunction (copy), UseRefResult1 (copy)
		if AgeInYears ~= nil and OnAgeSummaryShownFunction and not UseRefResult1.current then
			UseRefResult1.current = true
			OnAgeSummaryShownFunction(AgeInYears)
		end
	end, { AgeInYears, OnAgeSummaryShownFunction })
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = "Authentication.SignUp.Label.SelectBirthdaySentenceCase",
		confirmText = "Authentication.SignUp.Button.OKCaptialized",
		monthText = if UseValidatedBirthdayResult1 then DateHelper.MonthsLocalizationKeys[UseValidatedBirthdayResult1.Month] else nil,
		dayAffix = DateHelper.DayAffixLocalizationKey,
		yearAffix = DateHelper.YearAffixLocalizationKey
	})
	local Date = if UseValidatedBirthdayResult1 and UseLocalizationResult.monthText then DateHelper:GetFormattedFullString(UseLocalizationResult.monthText, UseValidatedBirthdayResult1.Day, UseLocalizationResult.dayAffix, UseValidatedBirthdayResult1.Year, UseLocalizationResult.yearAffix, " ", LocalizationService.RobloxLocaleId) else nil
	local Birthday = p1.birthday
	
	return {
		titleText = UseLocalizationResult.titleText,
		confirmText = UseLocalizationResult.confirmText,
		ageSummaryText = UseLocalizationFunction({
			ageSummaryText = if Date then {
				"Authentication.SignUp.Label.BirthdayPickerWithDateAndAge",
				date = Date,
				yearsOld = tostring(AgeInYears)
			} else nil
		}).ageSummaryText,
		isCentered = p1.isCentered == true,
		slideProgress = UseSlideResult,
		minAgeAllowed = FIntSinglePageSignupMinimumAge,
		requireManualSelection = UseRequireManualSelectionModuleResult,
		updateBirthday = UseResult1,
		initialMonth = if Birthday then Birthday.Month else nil,
		initialDay = if Birthday then Birthday.Day else nil,
		initialYear = if Birthday then Birthday.Year else nil,
		isConfirmEnabled = UseValidatedBirthdayResult ~= nil,
		onDismiss = UseSlideResult2,
		onConfirmActivated = UseResult
	}
end