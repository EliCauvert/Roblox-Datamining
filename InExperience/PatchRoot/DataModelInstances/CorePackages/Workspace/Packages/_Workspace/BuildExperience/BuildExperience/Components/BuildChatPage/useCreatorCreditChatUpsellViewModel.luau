local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorCreditModule = require(parent.DataHydration.CreatorCredit)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local creatorCreditConfigModule = require(buildExperience.CreatorCreditConfig)
local useOpenBuyRobuxWebViewModule = require(buildExperience.Components.CreatorCreditSheet.useOpenBuyRobuxWebView)
local useRefreshCreatorCreditOnUnhideModule = require(buildExperience.Components.CreatorCreditSheet.useRefreshCreatorCreditOnUnhide)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization

local function _(p0) --[[ line: 38 | named "getQuotaBlockReason" ]]
	-- upvalues: creatorCreditConfigModule (ref)
	return if p0 == nil then nil elseif p0.allowed == nil then if p0.freeTrialRemaining > 0 then nil elseif p0.limitSettings.additionalUsageEnabled then if p0.robuxBalance < creatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "InsufficientRobuxBalance" elseif p0.limitSettings.dailyLimitSet and p0.limitRemaining < creatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "DailyLimitReached" else nil else "FreeTrialExhausted" elseif p0.allowed then nil else p0.reason
end

return function(p1) --[[ line: 63 | named "useCreatorCreditChatUpsellViewModel" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), creatorCreditModule (ref), reactModule (ref), signalsReactModule (ref), creatorCreditConfigModule (ref), useOpenBuyRobuxWebViewModule (ref), useRefreshCreatorCreditOnUnhideModule (ref)
	local var9 = if fFlagBuildLocalization then useLocalization({
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
	}) else nil
	local creatorCreditStore = creatorCreditModule.getCreatorCreditStore(false)
	local var11 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 79 ]]
		-- upvalues: creatorCreditStore (ref)
		return creatorCreditStore.getQuotaSummary()
	end, { creatorCreditStore }).data)
	local var12 = if var11 ~= nil then nil else var11.nextResetEligibleTime
	local var13, var14 = reactModule.useState(false)
	local outOfCreditsPromptFailureCount = p1.outOfCreditsPromptFailureCount or 0
	local var16 = reactModule.useRef(outOfCreditsPromptFailureCount)
	local var17 = reactModule.useRef(0)
	local var18, var19 = reactModule.useState(nil)
	local var20 = reactModule.useCallback(function() --[[ line: 91 ]]
		-- upvalues: var17 (ref), creatorCreditStore (ref), var19 (ref), creatorCreditConfigModule (copy)
		local current = var17.current
		creatorCreditStore.refreshQuotaSummary():andThen(function(p2) --[[ line: 95 ]]
			-- upvalues: current (ref), var17 (copy), var19 (copy), creatorCreditConfigModule (copy)
			if p2 ~= nil and current == var17.current then
				var19(if p2 == nil then nil elseif p2.allowed ~= nil then if p2.freeTrialRemaining > 0 then nil elseif not p2.limitSettings.additionalUsageEnabled then if p2.robuxBalance < creatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "InsufficientRobuxBalance" elseif p2.limitSettings.dailyLimitSet and p2.limitRemaining < creatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "DailyLimitReached" else nil else "FreeTrialExhausted" elseif p2.allowed then nil else p2.reason)
			end
		end):catch(function() --[[ line: 100 ]] end)
	end, { creatorCreditStore })
	reactModule.useEffect(function() --[[ line: 102 ]]
		-- upvalues: outOfCreditsPromptFailureCount (ref), var16 (ref), var17 (ref), var19 (ref), p1 (ref), var14 (ref), var20 (ref)
		if var16.current < outOfCreditsPromptFailureCount then
			var17.current += 1
			var19(p1.outOfCreditsPromptFailureReason)
			var14(false)
			var20()
		end
		var16.current = outOfCreditsPromptFailureCount
	end, {
		outOfCreditsPromptFailureCount,
		p1.outOfCreditsPromptFailureReason,
		var20
	})
	local var21 = reactModule.useRef(p1.isAssistantResponding)
	reactModule.useEffect(function() --[[ line: 113 ]]
		-- upvalues: var21 (ref), p1 (ref), creatorCreditConfigModule (copy), var20 (ref)
		local var28 = var21.current and not p1.isAssistantResponding
		var21.current = p1.isAssistantResponding
		
		if var28 then
			local delayedThread = task.delay(creatorCreditConfigModule.FIntPostTurnRefreshDelaySeconds, var20)
			
			return function() --[[ line: 120 ]]
				-- upvalues: delayedThread (ref)
				task.cancel(delayedThread)
			end
		end
	end, { p1.isAssistantResponding, var20 })
	reactModule.useEffect(function() --[[ line: 125 ]]
		-- upvalues: var12 (ref), creatorCreditConfigModule (copy), var20 (ref)
		if var12 == nil or var12 == "" then return end
		local dateTime = DateTime.fromIsoDate(var12)
		
		if dateTime == nil then
			return
		end
		local delayedThread = task.delay(math.max(1, dateTime.UnixTimestamp - DateTime.now().UnixTimestamp + creatorCreditConfigModule.FIntResetRefreshBufferSeconds), var20)
		
		return function() --[[ line: 140 ]]
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { var12, var20 })
	local var22 = useOpenBuyRobuxWebViewModule(reactModule.useCallback(function() --[[ line: 145 ]]
		-- upvalues: var20 (ref), var14 (ref)
		var20()
		var14(true)
	end, { var20 }))
	useRefreshCreatorCreditOnUnhideModule(var20)
	local var23 = reactModule.useCallback(function() --[[ line: 152 ]]
		-- upvalues: var14 (ref), p1 (ref)
		var14(true)
		
		if p1.onOpenCreatorCreditPage then
			p1.onOpenCreatorCreditPage()
		end
	end, { p1.onOpenCreatorCreditPage })
	local var24 = reactModule.useCallback(function() --[[ line: 158 ]]
		-- upvalues: var14 (ref)
		var14(true)
	end, {})
	local var25 = var18
	
	if not var25 then
		var25 = if var11 == nil then nil elseif var11.allowed ~= nil then if var11.freeTrialRemaining > 0 then nil elseif not var11.limitSettings.additionalUsageEnabled then if var11.robuxBalance < creatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "InsufficientRobuxBalance" elseif var11.limitSettings.dailyLimitSet and var11.limitRemaining < creatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "DailyLimitReached" else nil else "FreeTrialExhausted" elseif var11.allowed then nil else var11.reason
	end
	local buyMoreTitle, buyMoreDescription, buyRobux, viewUsage
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		buyMoreTitle = var9.buyMoreTitle
		buyMoreDescription = var9.buyMoreDescription
		buyRobux = var9.buyRobux
		viewUsage = var9.viewUsage
	else
		buyMoreTitle = localizationStringsModule.CREATOR_CREDIT_BUY_MORE_ROBUX_TITLE
		buyMoreDescription = localizationStringsModule.CREATOR_CREDIT_BUY_MORE_ROBUX_DESCRIPTION
		buyRobux = localizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_SHEET_CONFIRM
		viewUsage = localizationStringsModule.CREATOR_CREDIT_VIEW_USAGE_BUTTON
	end
	local var26 = var22
	local var27 = var23
	
	if var25 == "FreeTrialExhausted" then
		if fFlagBuildLocalization then
			buyMoreTitle = var9.freeTrialTitle
			buyMoreDescription = var9.freeTrialDescription
			buyRobux = var9.viewUsage
			viewUsage = var9.notNow
		else
			buyMoreTitle = localizationStringsModule.CREATOR_CREDIT_FREE_TRIAL_EXHAUSTED_TITLE
			buyMoreDescription = localizationStringsModule.CREATOR_CREDIT_FREE_TRIAL_EXHAUSTED_DESCRIPTION
			buyRobux = localizationStringsModule.CREATOR_CREDIT_VIEW_USAGE_BUTTON
			viewUsage = localizationStringsModule.CREATOR_CREDIT_NOT_NOW_BUTTON
		end
		var26 = var23
		var27 = var24
	elseif var25 == "DailyLimitReached" then
		if fFlagBuildLocalization then
			buyMoreTitle = var9.dailyLimitTitle
			buyMoreDescription = var9.dailyLimitDescription
			buyRobux = var9.adjustLimit
			viewUsage = var9.notNow
		else
			buyMoreTitle = localizationStringsModule.CREATOR_CREDIT_DAILY_LIMIT_REACHED_TITLE
			buyMoreDescription = localizationStringsModule.CREATOR_CREDIT_DAILY_LIMIT_REACHED_DESCRIPTION
			buyRobux = localizationStringsModule.CREATOR_CREDIT_ADJUST_LIMIT_BUTTON
			viewUsage = localizationStringsModule.CREATOR_CREDIT_NOT_NOW_BUTTON
		end
		var26 = var23
		var27 = var24
	end
	return {
		showBuyMoreRobuxCard = var25 ~= nil and (not var13 and p1.onOpenCreatorCreditPage ~= nil),
		buyMoreRobuxCardTitle = buyMoreTitle,
		buyMoreRobuxCardDescription = buyMoreDescription,
		buyMoreRobuxCardPrimaryActionText = buyRobux,
		onBuyMoreRobuxCardPrimaryAction = var26,
		buyMoreRobuxCardSecondaryActionText = viewUsage,
		onBuyMoreRobuxCardSecondaryAction = var27
	}
end