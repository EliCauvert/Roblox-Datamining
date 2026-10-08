local localizationService = game:GetService("LocalizationService")
local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local parent = accountUpgrade.Parent
local reactModule = require(parent.React)
local otterModule = require(parent.Otter)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local authSignupModule = require(parent.AuthSignup)
local sharedFlagsModule = require(parent.SharedFlags)
local useRequireManualSelectionModule = require(accountUpgrade.Hooks.useRequireManualSelection)
local _ = require(script.Parent.BirthdaySheetView)
local dateHelper = require(parent.Time).DateHelper
local useValidatedBirthday = authSignupModule.Hooks.useValidatedBirthday
local fIntSinglePageSignupMinimumAge = sharedFlagsModule.FIntSinglePageSignupMinimumAge
local t = { frequency = 3 }

local function useSlide(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), otterModule (ref), t (ref)
	local reducedMotion = foundationModule.Hooks.usePreferences().reducedMotion
	local var1, var2 = reactModule.useBinding(if reducedMotion then 1 else 0)
	local var3 = reactModule.useMemo(function()
		-- upvalues: otterModule (copy), reducedMotion (ref)
		return otterModule.createSingleMotor(if reducedMotion then 1 else 0)
	end, { reducedMotion })
	local var4 = reactModule.useRef(false)
	local var5 = reactModule.useRef(p1)
	var5.current = p1
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var2 (ref), var4 (ref), var5 (ref), reducedMotion (ref), otterModule (copy), t (copy)
		local var6 = var3:onStep(function(p2)
			-- upvalues: var2 (copy), var4 (copy), var3 (copy), var5 (copy)
			var2(p2)
			
			if var4.current and p2 <= 0.1 then
				var4.current = false
				var3:stop()
				var5.current()
			end
		end)
		
		if not reducedMotion then
			var3:setGoal(otterModule.spring(1, t))
		end
		return function()
			-- upvalues: var6 (ref), var3 (copy)
			var6()
			var3:destroy()
		end
	end, { var3, reducedMotion })
	
	return var1, reactModule.useCallback(function()
		-- upvalues: reducedMotion (ref), var5 (ref), var4 (ref), var3 (ref), otterModule (copy), t (copy)
		if reducedMotion then
			var5.current()
			
			return
		elseif var4.current then
			return
		end
		var4.current = true
		var3:setGoal(otterModule.spring(0, t))
	end, { var3, reducedMotion })
end

return function(p1)
	-- upvalues: useSlide (ref), useValidatedBirthday (ref), fIntSinglePageSignupMinimumAge (ref), useRequireManualSelectionModule (ref), reactModule (ref), useLocalization (ref), dateHelper (ref), localizationService (ref)
	local var1, var2 = useSlide(p1.onClose)
	local var3, var4 = useValidatedBirthday(fIntSinglePageSignupMinimumAge)
	local var5 = useRequireManualSelectionModule()
	local onConfirm = p1.onConfirm
	local var6 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), onConfirm (ref)
		if var3 ~= nil then
			onConfirm(var3)
		end
	end, { var3, onConfirm })
	local onAllPicked = p1.onAllPicked
	local var7 = reactModule.useRef(false)
	local var8 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: var4 (ref), onAllPicked (ref), var7 (ref)
		var4(p2, p3, p4)
		
		if onAllPicked and not var7.current and (p2 and p3) and p4 then
			var7.current = true
			onAllPicked()
		end
	end, { var4, onAllPicked })
	local var9 = if p1.showsAgeSummary then var3 else nil
	local var10 = if var9 then var9:GetAgeInYears() else nil
	local onAgeSummaryShown = p1.onAgeSummaryShown
	local var11 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), onAgeSummaryShown (ref), var11 (ref)
		if var10 ~= nil and onAgeSummaryShown and not var11.current then
			var11.current = true
			onAgeSummaryShown(var10)
		end
	end, { var10, onAgeSummaryShown })
	local var12 = useLocalization({
		titleText = "Authentication.SignUp.Label.SelectBirthdaySentenceCase",
		confirmText = "Authentication.SignUp.Button.OKCaptialized",
		monthText = if var9 then dateHelper.MonthsLocalizationKeys[var9.Month] else nil,
		dayAffix = dateHelper.DayAffixLocalizationKey,
		yearAffix = dateHelper.YearAffixLocalizationKey
	})
	local var13 = if var9 and var12.monthText then dateHelper:GetFormattedFullString(var12.monthText, var9.Day, var12.dayAffix, var9.Year, var12.yearAffix, " ", localizationService.RobloxLocaleId) else nil
	local birthday = p1.birthday
	
	return {
		titleText = var12.titleText,
		confirmText = var12.confirmText,
		ageSummaryText = useLocalization({
			ageSummaryText = if var13 then {
				"Authentication.SignUp.Label.BirthdayPickerWithDateAndAge",
				date = var13,
				yearsOld = tostring(var10)
			} else nil
		}).ageSummaryText,
		isCentered = p1.isCentered == true,
		slideProgress = var1,
		minAgeAllowed = fIntSinglePageSignupMinimumAge,
		requireManualSelection = var5,
		updateBirthday = var8,
		initialMonth = if birthday then birthday.Month else nil,
		initialDay = if birthday then birthday.Day else nil,
		initialYear = if birthday then birthday.Year else nil,
		isConfirmEnabled = var3 ~= nil,
		onDismiss = var2,
		onConfirmActivated = var6
	}
end