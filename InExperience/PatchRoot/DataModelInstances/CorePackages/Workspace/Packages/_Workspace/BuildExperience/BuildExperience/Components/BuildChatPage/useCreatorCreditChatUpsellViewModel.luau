local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorCreditModule = require(Parent.DataHydration.CreatorCredit)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local CreatorCreditConfigModule = require(BuildExperience.CreatorCreditConfig)
local UseOpenBuyRobuxWebViewModule = require(BuildExperience.Components.CreatorCreditSheet.useOpenBuyRobuxWebView)
local UseRefreshCreatorCreditOnUnhideModule = require(BuildExperience.Components.CreatorCreditSheet.useRefreshCreatorCreditOnUnhide)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagBuildExperienceFreeLimitCardModule = require(BuildExperience.Flags.FFlagBuildExperienceFreeLimitCard)

local function _(p1)
	-- upvalues: CreatorCreditConfigModule (copy)
	return if p1 == nil then nil elseif p1.allowed == nil then if p1.freeTrialRemaining > 0 then nil elseif p1.limitSettings.additionalUsageEnabled then if p1.robuxBalance < CreatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "InsufficientRobuxBalance" elseif p1.limitSettings.dailyLimitSet and p1.limitRemaining < CreatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "DailyLimitReached" else nil else "FreeTrialExhausted" elseif p1.allowed then nil else p1.reason
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), FFlagBuildExperienceFreeLimitCardModule (copy), CreatorCreditModule (copy), ReactModule (copy), SignalsReactModule (copy), CreatorCreditConfigModule (copy), UseOpenBuyRobuxWebViewModule (copy), UseRefreshCreatorCreditOnUnhideModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		adjustLimit = LocalizationStringsModule.CREATOR_CREDIT_ADJUST_LIMIT_BUTTON,
		buyMoreDescription = LocalizationStringsModule.CREATOR_CREDIT_BUY_MORE_ROBUX_DESCRIPTION,
		buyMoreTitle = LocalizationStringsModule.CREATOR_CREDIT_BUY_MORE_ROBUX_TITLE,
		buyRobux = LocalizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_SHEET_CONFIRM,
		dailyLimitDescription = LocalizationStringsModule.CREATOR_CREDIT_DAILY_LIMIT_REACHED_DESCRIPTION,
		dailyLimitTitle = LocalizationStringsModule.CREATOR_CREDIT_DAILY_LIMIT_REACHED_TITLE,
		freeTrialDescription = if FFlagBuildExperienceFreeLimitCardModule then LocalizationStringsModule.CREATOR_CREDIT_FREE_LIMIT_REACHED_DESCRIPTION else LocalizationStringsModule.CREATOR_CREDIT_FREE_TRIAL_EXHAUSTED_DESCRIPTION,
		freeTrialTitle = if FFlagBuildExperienceFreeLimitCardModule then LocalizationStringsModule.CREATOR_CREDIT_FREE_LIMIT_REACHED_TITLE else LocalizationStringsModule.CREATOR_CREDIT_FREE_TRIAL_EXHAUSTED_TITLE,
		freeTrialAction = if FFlagBuildExperienceFreeLimitCardModule then LocalizationStringsModule.CREATOR_CREDIT_MANAGE_USAGE_BUTTON else LocalizationStringsModule.CREATOR_CREDIT_VIEW_USAGE_BUTTON,
		notNow = LocalizationStringsModule.CREATOR_CREDIT_NOT_NOW_BUTTON,
		viewUsage = LocalizationStringsModule.CREATOR_CREDIT_VIEW_USAGE_BUTTON
	})
	local CreatorCreditStore = CreatorCreditModule.getCreatorCreditStore(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(ReactModule.useMemo(function()
		-- upvalues: CreatorCreditStore (copy)
		return CreatorCreditStore.getQuotaSummary()
	end, { CreatorCreditStore }).data)
	local NextResetEligibleTime = if UseSignalStateResult == nil then nil else UseSignalStateResult.nextResetEligibleTime
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local OutOfCreditsPromptFailureCount = p1.outOfCreditsPromptFailureCount or 0
	local UseRefResult = ReactModule.useRef(OutOfCreditsPromptFailureCount)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), CreatorCreditStore (copy), UseStateResult2_1 (copy), CreatorCreditConfigModule (upval)
		local Current = UseRefResult1.current
		CreatorCreditStore.refreshQuotaSummary():andThen(function(Result)
			-- upvalues: Current (copy), UseRefResult1 (upval), UseStateResult2_1 (upval), CreatorCreditConfigModule (upval)
			if Result ~= nil and Current == UseRefResult1.current then
				UseStateResult2_1(if Result == nil then nil elseif Result.allowed == nil then if Result.freeTrialRemaining > 0 then nil elseif Result.limitSettings.additionalUsageEnabled then if Result.robuxBalance < CreatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "InsufficientRobuxBalance" elseif Result.limitSettings.dailyLimitSet and Result.limitRemaining < CreatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "DailyLimitReached" else nil else "FreeTrialExhausted" elseif Result.allowed then nil else Result.reason)
			end
		end):catch(function() end)
	end, { CreatorCreditStore })
	ReactModule.useEffect(function()
		-- upvalues: OutOfCreditsPromptFailureCount (copy), UseRefResult (copy), UseRefResult1 (copy), UseStateResult2_1 (copy), p1 (copy), UseStateResult2 (copy), UseResult (copy)
		if UseRefResult.current < OutOfCreditsPromptFailureCount then
			UseRefResult1.current += 1
			UseStateResult2_1(p1.outOfCreditsPromptFailureReason)
			UseStateResult2(false)
			UseResult()
		end
		UseRefResult.current = OutOfCreditsPromptFailureCount
	end, {
		OutOfCreditsPromptFailureCount,
		p1.outOfCreditsPromptFailureReason,
		UseResult
	})
	local UseRefResult2 = ReactModule.useRef(p1.isAssistantResponding)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), p1 (copy), CreatorCreditConfigModule (upval), UseResult (copy)
		local NoIsAssistantResponding: boolean = UseRefResult2.current and not p1.isAssistantResponding
		UseRefResult2.current = p1.isAssistantResponding
		
		if not NoIsAssistantResponding then return end
		local DelayedThread = task.delay(CreatorCreditConfigModule.FIntPostTurnRefreshDelaySeconds, UseResult)
		
		return function()
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, { p1.isAssistantResponding, UseResult })
	ReactModule.useEffect(function()
		-- upvalues: NextResetEligibleTime (copy), CreatorCreditConfigModule (upval), UseResult (copy)
		if NextResetEligibleTime == nil or NextResetEligibleTime == "" then return end
		local _DateTime = DateTime.fromIsoDate(NextResetEligibleTime)
		
		if _DateTime == nil then return end
		local DelayedThread = task.delay(math.max(1, _DateTime.UnixTimestamp - DateTime.now().UnixTimestamp + CreatorCreditConfigModule.FIntResetRefreshBufferSeconds), UseResult)
		
		return function()
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, { NextResetEligibleTime, UseResult })
	local UseOpenBuyRobuxWebViewModuleResult = UseOpenBuyRobuxWebViewModule((ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), UseStateResult2 (copy)
		UseResult()
		UseStateResult2(true)
	end, { UseResult })))
	UseRefreshCreatorCreditOnUnhideModule(UseResult)
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(true)
		
		if p1.onOpenCreatorCreditPage then
			p1.onOpenCreatorCreditPage()
		end
	end, { p1.onOpenCreatorCreditPage })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, {})
	local UseStateResult1_1 = UseStateResult1 or (if UseSignalStateResult == nil then nil elseif UseSignalStateResult.allowed == nil then if UseSignalStateResult.freeTrialRemaining > 0 then nil elseif UseSignalStateResult.limitSettings.additionalUsageEnabled then if UseSignalStateResult.robuxBalance < CreatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "InsufficientRobuxBalance" elseif UseSignalStateResult.limitSettings.dailyLimitSet and UseSignalStateResult.limitRemaining < CreatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "DailyLimitReached" else nil else "FreeTrialExhausted" elseif UseSignalStateResult.allowed then nil else UseSignalStateResult.reason)
	local BuyMoreTitle = UseLocalizationResult.buyMoreTitle
	local BuyMoreDescription = UseLocalizationResult.buyMoreDescription
	local BuyRobux = UseLocalizationResult.buyRobux
	local ViewUsage = UseLocalizationResult.viewUsage
	local OnBuyMoreRobuxCardPrimaryAction = UseOpenBuyRobuxWebViewModuleResult
	local OnBuyMoreRobuxCardSecondaryAction = UseResult1
	
	if UseStateResult1_1 == "FreeTrialExhausted" then
		BuyMoreTitle = UseLocalizationResult.freeTrialTitle
		BuyMoreDescription = UseLocalizationResult.freeTrialDescription
		BuyRobux = UseLocalizationResult.freeTrialAction
		ViewUsage = UseLocalizationResult.notNow
		OnBuyMoreRobuxCardPrimaryAction = UseResult1
		OnBuyMoreRobuxCardSecondaryAction = UseResult2
	elseif UseStateResult1_1 == "DailyLimitReached" then
		BuyMoreTitle = UseLocalizationResult.dailyLimitTitle
		BuyMoreDescription = UseLocalizationResult.dailyLimitDescription
		BuyRobux = UseLocalizationResult.adjustLimit
		ViewUsage = UseLocalizationResult.notNow
		OnBuyMoreRobuxCardPrimaryAction = UseResult1
		OnBuyMoreRobuxCardSecondaryAction = UseResult2
	end
	return {
		showBuyMoreRobuxCard = UseStateResult1_1 ~= nil and (not UseStateResult and p1.onOpenCreatorCreditPage ~= nil),
		buyMoreRobuxCardTitle = BuyMoreTitle,
		buyMoreRobuxCardDescription = BuyMoreDescription,
		buyMoreRobuxCardPrimaryActionText = BuyRobux,
		onBuyMoreRobuxCardPrimaryAction = OnBuyMoreRobuxCardPrimaryAction,
		buyMoreRobuxCardSecondaryActionText = ViewUsage,
		onBuyMoreRobuxCardSecondaryAction = OnBuyMoreRobuxCardSecondaryAction
	}
end