local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local parent = accountUpgrade.Parent
local reactModule = require(parent.React)
local otterModule = require(parent.Otter)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local authSignupModule = require(parent.AuthSignup)
local sharedFlagsModule = require(parent.SharedFlags)
local useRequireManualSelectionModule = require(accountUpgrade.Hooks.useRequireManualSelection)
local _ = require(script.Parent.MobileBirthdaySheetView)
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
	-- upvalues: useSlide (ref), useValidatedBirthday (ref), fIntSinglePageSignupMinimumAge (ref), useRequireManualSelectionModule (ref), reactModule (ref), useLocalization (ref)
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
	local var7 = useLocalization({
		titleText = "Authentication.SignUp.Label.SelectBirthdaySentenceCase",
		confirmText = "Authentication.SignUp.Button.OKCaptialized"
	})
	local birthday = p1.birthday
	
	return {
		titleText = var7.titleText,
		confirmText = var7.confirmText,
		slideProgress = var1,
		minAgeAllowed = fIntSinglePageSignupMinimumAge,
		requireManualSelection = var5,
		updateBirthday = var4,
		initialMonth = if birthday then birthday.Month else nil,
		initialDay = if birthday then birthday.Day else nil,
		initialYear = if birthday then birthday.Year else nil,
		isConfirmEnabled = var3 ~= nil,
		onDismiss = var2,
		onConfirmActivated = var6
	}
end