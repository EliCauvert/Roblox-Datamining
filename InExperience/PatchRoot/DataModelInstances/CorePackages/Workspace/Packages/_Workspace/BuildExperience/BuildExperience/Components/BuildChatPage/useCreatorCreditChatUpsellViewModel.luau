local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorCreditModule = require(parent.DataHydration.CreatorCredit)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local creatorCreditConfigModule = require(buildExperience.CreatorCreditConfig)
local useOpenBuyRobuxWebViewModule = require(buildExperience.Components.CreatorCreditSheet.useOpenBuyRobuxWebView)
local useRefreshCreatorCreditOnUnhideModule = require(buildExperience.Components.CreatorCreditSheet.useRefreshCreatorCreditOnUnhide)
local localizationStringsModule = require(buildExperience.LocalizationStrings)

local function _(p1)
	-- upvalues: creatorCreditConfigModule (ref)
	return if p1 == nil then nil elseif p1.allowed == nil then if p1.freeTrialRemaining > 0 then nil elseif p1.limitSettings.additionalUsageEnabled then if p1.robuxBalance < creatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "InsufficientRobuxBalance" elseif p1.limitSettings.dailyLimitSet and p1.limitRemaining < creatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "DailyLimitReached" else nil else "FreeTrialExhausted" elseif p1.allowed then nil else p1.reason
end

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), creatorCreditModule (ref), reactModule (ref), signalsReactModule (ref), creatorCreditConfigModule (ref), useOpenBuyRobuxWebViewModule (ref), useRefreshCreatorCreditOnUnhideModule (ref)
	local var1 = useLocalization({
		adjustLimit = localizationStringsModule.CREATOR_CREDIT_ADJUST_LIMIT_BUTTON,
		buyMoreDescription = localizationStringsModule.CREATOR_CREDIT_BUY_MORE_ROBUX_DESCRIPTION,
		buyMoreTitle = localizationStringsModule.CREATOR_CREDIT_BUY_MORE_ROBUX_TITLE,
		buyRobux = localizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_SHEET_CONFIRM,
		dailyLimitDescription = localizationStringsModule.CREATOR_CREDIT_DAILY_LIMIT_REACHED_DESCRIPTION,
		dailyLimitTitle = localizationStringsModule.CREATOR_CREDIT_DAILY_LIMIT_REACHED_TITLE,
		freeTrialDescription = localizationStringsModule.CREATOR_CREDIT_FREE_TRIAL_EXHAUSTED_DESCRIPTION,
		freeTrialTitle = localizationStringsModule.CREATOR_CREDIT_FREE_TRIAL_EXHAUSTED_TITLE,
		notNow = localizationStringsModule.CREATOR_CREDIT_NOT_NOW_BUTTON,
		viewUsage = localizationStringsModule.CREATOR_CREDIT_VIEW_USAGE_BUTTON
	})
	local creatorCreditStore = creatorCreditModule.getCreatorCreditStore(false)
	local var2 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: creatorCreditStore (ref)
		return creatorCreditStore.getQuotaSummary()
	end, { creatorCreditStore }).data)
	local var3 = if var2 ~= nil then nil else var2.nextResetEligibleTime
	local var4, var5 = reactModule.useState(false)
	local outOfCreditsPromptFailureCount = p1.outOfCreditsPromptFailureCount or 0
	local var6 = reactModule.useRef(outOfCreditsPromptFailureCount)
	local var7 = reactModule.useRef(0)
	local var8, var9 = reactModule.useState(nil)
	local var10 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), creatorCreditStore (ref), var9 (ref), creatorCreditConfigModule (copy)
		local current = var7.current
		creatorCreditStore.refreshQuotaSummary():andThen(function(p2)
			-- upvalues: current (ref), var7 (copy), var9 (copy), creatorCreditConfigModule (copy)
			if p2 ~= nil and current == var7.current then
				var9(if p2 == nil then nil elseif p2.allowed ~= nil then if p2.freeTrialRemaining > 0 then nil elseif not p2.limitSettings.additionalUsageEnabled then if p2.robuxBalance < creatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "InsufficientRobuxBalance" elseif p2.limitSettings.dailyLimitSet and p2.limitRemaining < creatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "DailyLimitReached" else nil else "FreeTrialExhausted" elseif p2.allowed then nil else p2.reason)
			end
		end):catch(function() end)
	end, { creatorCreditStore })
	reactModule.useEffect(function()
		-- upvalues: outOfCreditsPromptFailureCount (ref), var6 (ref), var7 (ref), var9 (ref), p1 (ref), var5 (ref), var10 (ref)
		if var6.current < outOfCreditsPromptFailureCount then
			var7.current += 1
			var9(p1.outOfCreditsPromptFailureReason)
			var5(false)
			var10()
		end
		var6.current = outOfCreditsPromptFailureCount
	end, {
		outOfCreditsPromptFailureCount,
		p1.outOfCreditsPromptFailureReason,
		var10
	})
	local var11 = reactModule.useRef(p1.isAssistantResponding)
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), p1 (ref), creatorCreditConfigModule (copy), var10 (ref)
		local var12 = var11.current and not p1.isAssistantResponding
		var11.current = p1.isAssistantResponding
		
		if var12 then
			local delayedThread = task.delay(creatorCreditConfigModule.FIntPostTurnRefreshDelaySeconds, var10)
			
			return function()
				-- upvalues: delayedThread (ref)
				task.cancel(delayedThread)
			end
		end
	end, { p1.isAssistantResponding, var10 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), creatorCreditConfigModule (copy), var10 (ref)
		if var3 == nil or var3 == "" then return end
		local dateTime = DateTime.fromIsoDate(var3)
		
		if dateTime == nil then
			return
		end
		local delayedThread = task.delay(math.max(1, dateTime.UnixTimestamp - DateTime.now().UnixTimestamp + creatorCreditConfigModule.FIntResetRefreshBufferSeconds), var10)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { var3, var10 })
	local var12 = useOpenBuyRobuxWebViewModule(reactModule.useCallback(function()
		-- upvalues: var10 (ref), var5 (ref)
		var10()
		var5(true)
	end, { var10 }))
	useRefreshCreatorCreditOnUnhideModule(var10)
	local var13 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), p1 (ref)
		var5(true)
		
		if p1.onOpenCreatorCreditPage then
			p1.onOpenCreatorCreditPage()
		end
	end, { p1.onOpenCreatorCreditPage })
	local var14 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		var5(true)
	end, {})
	local var15 = var8
	
	if not var15 then
		var15 = if var2 == nil then nil elseif var2.allowed ~= nil then if var2.freeTrialRemaining > 0 then nil elseif not var2.limitSettings.additionalUsageEnabled then if var2.robuxBalance < creatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "InsufficientRobuxBalance" elseif var2.limitSettings.dailyLimitSet and var2.limitRemaining < creatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "DailyLimitReached" else nil else "FreeTrialExhausted" elseif var2.allowed then nil else var2.reason
	end
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local buyMoreTitle = var1.buyMoreTitle
	local buyMoreDescription = var1.buyMoreDescription
	local buyRobux = var1.buyRobux
	local viewUsage = var1.viewUsage
	local var16 = var12
	local var17 = var13
	
	if var15 == "FreeTrialExhausted" then
		buyMoreTitle = var1.freeTrialTitle
		buyMoreDescription = var1.freeTrialDescription
		buyRobux = var1.viewUsage
		viewUsage = var1.notNow
		var16 = var13
		var17 = var14
	elseif var15 == "DailyLimitReached" then
		buyMoreTitle = var1.dailyLimitTitle
		buyMoreDescription = var1.dailyLimitDescription
		buyRobux = var1.adjustLimit
		viewUsage = var1.notNow
		var16 = var13
		var17 = var14
	end
	return {
		showBuyMoreRobuxCard = var15 ~= nil and (not var4 and p1.onOpenCreatorCreditPage ~= nil),
		buyMoreRobuxCardTitle = buyMoreTitle,
		buyMoreRobuxCardDescription = buyMoreDescription,
		buyMoreRobuxCardPrimaryActionText = buyRobux,
		onBuyMoreRobuxCardPrimaryAction = var16,
		buyMoreRobuxCardSecondaryActionText = viewUsage,
		onBuyMoreRobuxCardSecondaryAction = var17
	}
end