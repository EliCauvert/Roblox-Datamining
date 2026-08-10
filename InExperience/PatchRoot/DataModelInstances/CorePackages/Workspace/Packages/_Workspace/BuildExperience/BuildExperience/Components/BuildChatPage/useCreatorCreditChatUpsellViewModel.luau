local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorCreditModule = require(parent.DataHydration.CreatorCredit)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local creatorCreditConfigModule = require(buildExperience.CreatorCreditConfig)
local useOpenBuyRobuxWebViewModule = require(buildExperience.Components.CreatorCreditSheet.useOpenBuyRobuxWebView)
local useRefreshCreatorCreditOnUnhideModule = require(buildExperience.Components.CreatorCreditSheet.useRefreshCreatorCreditOnUnhide)
local localizationStringsModule = require(buildExperience.LocalizationStrings)

local function _(p0) --[[ line: 34 | named "getQuotaBlockReason" ]]
	-- upvalues: creatorCreditConfigModule (ref)
	return if p0 == nil then nil elseif p0.allowed == nil then if p0.freeTrialRemaining > 0 then nil elseif p0.limitSettings.additionalUsageEnabled then if p0.robuxBalance < creatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "InsufficientRobuxBalance" elseif p0.limitSettings.dailyLimitSet and p0.limitRemaining < creatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "DailyLimitReached" else nil else "FreeTrialExhausted" elseif p0.allowed then nil else p0.reason
end

return function(p1) --[[ line: 59 | named "useCreatorCreditChatUpsellViewModel" ]]
	-- upvalues: creatorCreditModule (ref), reactModule (ref), signalsReactModule (ref), creatorCreditConfigModule (ref), useOpenBuyRobuxWebViewModule (ref), useRefreshCreatorCreditOnUnhideModule (ref), localizationStringsModule (ref)
	local creatorCreditStore = creatorCreditModule.getCreatorCreditStore(false)
	local var9 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 61 ]]
		-- upvalues: creatorCreditStore (ref)
		return creatorCreditStore.getQuotaSummary()
	end, { creatorCreditStore }).data)
	local var10 = if var9 ~= nil then nil else var9.nextResetEligibleTime
	local var11, var12 = reactModule.useState(false)
	local outOfCreditsPromptFailureCount = p1.outOfCreditsPromptFailureCount or 0
	local var14 = reactModule.useRef(outOfCreditsPromptFailureCount)
	local var15 = reactModule.useRef(0)
	local var16, var17 = reactModule.useState(nil)
	local var18 = reactModule.useCallback(function() --[[ line: 73 ]]
		-- upvalues: var15 (ref), creatorCreditStore (ref), var17 (ref), creatorCreditConfigModule (copy)
		local current = var15.current
		creatorCreditStore.refreshQuotaSummary():andThen(function(p2) --[[ line: 77 ]]
			-- upvalues: current (ref), var15 (copy), var17 (copy), creatorCreditConfigModule (copy)
			if p2 ~= nil and current == var15.current then
				var17(if p2 == nil then nil elseif p2.allowed ~= nil then if p2.freeTrialRemaining > 0 then nil elseif not p2.limitSettings.additionalUsageEnabled then if p2.robuxBalance < creatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "InsufficientRobuxBalance" elseif p2.limitSettings.dailyLimitSet and p2.limitRemaining < creatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "DailyLimitReached" else nil else "FreeTrialExhausted" elseif p2.allowed then nil else p2.reason)
			end
		end):catch(function() --[[ line: 82 ]] end)
	end, { creatorCreditStore })
	reactModule.useEffect(function() --[[ line: 84 ]]
		-- upvalues: outOfCreditsPromptFailureCount (ref), var14 (ref), var15 (ref), var17 (ref), p1 (ref), var12 (ref), var18 (ref)
		if var14.current < outOfCreditsPromptFailureCount then
			var15.current += 1
			var17(p1.outOfCreditsPromptFailureReason)
			var12(false)
			var18()
		end
		var14.current = outOfCreditsPromptFailureCount
	end, {
		outOfCreditsPromptFailureCount,
		p1.outOfCreditsPromptFailureReason,
		var18
	})
	local var19 = reactModule.useRef(p1.isAssistantResponding)
	reactModule.useEffect(function() --[[ line: 95 ]]
		-- upvalues: var19 (ref), p1 (ref), creatorCreditConfigModule (copy), var18 (ref)
		local var26 = var19.current and not p1.isAssistantResponding
		var19.current = p1.isAssistantResponding
		
		if var26 then
			local delayedThread = task.delay(creatorCreditConfigModule.FIntPostTurnRefreshDelaySeconds, var18)
			
			return function() --[[ line: 102 ]]
				-- upvalues: delayedThread (ref)
				task.cancel(delayedThread)
			end
		end
	end, { p1.isAssistantResponding, var18 })
	reactModule.useEffect(function() --[[ line: 107 ]]
		-- upvalues: var10 (ref), creatorCreditConfigModule (copy), var18 (ref)
		if var10 == nil or var10 == "" then return end
		local dateTime = DateTime.fromIsoDate(var10)
		
		if dateTime == nil then
			return
		end
		local delayedThread = task.delay(math.max(1, dateTime.UnixTimestamp - DateTime.now().UnixTimestamp + creatorCreditConfigModule.FIntResetRefreshBufferSeconds), var18)
		
		return function() --[[ line: 122 ]]
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { var10, var18 })
	local var20 = useOpenBuyRobuxWebViewModule(reactModule.useCallback(function() --[[ line: 127 ]]
		-- upvalues: var18 (ref), var12 (ref)
		var18()
		var12(true)
	end, { var18 }))
	useRefreshCreatorCreditOnUnhideModule(var18)
	local var21 = reactModule.useCallback(function() --[[ line: 134 ]]
		-- upvalues: var12 (ref), p1 (ref)
		var12(true)
		
		if p1.onOpenCreatorCreditPage then
			p1.onOpenCreatorCreditPage()
		end
	end, { p1.onOpenCreatorCreditPage })
	local var22 = reactModule.useCallback(function() --[[ line: 140 ]]
		-- upvalues: var12 (ref)
		var12(true)
	end, {})
	local var23 = var16
	
	if not var23 then
		var23 = if var9 == nil then nil elseif var9.allowed ~= nil then if var9.freeTrialRemaining > 0 then nil elseif not var9.limitSettings.additionalUsageEnabled then if var9.robuxBalance < creatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "InsufficientRobuxBalance" elseif var9.limitSettings.dailyLimitSet and var9.limitRemaining < creatorCreditConfigModule.FIntMinimumUsableRobuxBalance then "DailyLimitReached" else nil else "FreeTrialExhausted" elseif var9.allowed then nil else var9.reason
	end
	local CREATOR_CREDIT_BUY_MORE_ROBUX_TITLE = localizationStringsModule.CREATOR_CREDIT_BUY_MORE_ROBUX_TITLE
	local CREATOR_CREDIT_BUY_MORE_ROBUX_DESCRIPTION = localizationStringsModule.CREATOR_CREDIT_BUY_MORE_ROBUX_DESCRIPTION
	local CREATOR_CREDIT_BUY_ROBUX_SHEET_CONFIRM = localizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_SHEET_CONFIRM
	local var24 = var20
	local CREATOR_CREDIT_VIEW_USAGE_BUTTON = localizationStringsModule.CREATOR_CREDIT_VIEW_USAGE_BUTTON
	local var25 = var21
	
	if var23 == "FreeTrialExhausted" then
		CREATOR_CREDIT_BUY_MORE_ROBUX_TITLE = localizationStringsModule.CREATOR_CREDIT_FREE_TRIAL_EXHAUSTED_TITLE
		CREATOR_CREDIT_BUY_MORE_ROBUX_DESCRIPTION = localizationStringsModule.CREATOR_CREDIT_FREE_TRIAL_EXHAUSTED_DESCRIPTION
		CREATOR_CREDIT_BUY_ROBUX_SHEET_CONFIRM = localizationStringsModule.CREATOR_CREDIT_VIEW_USAGE_BUTTON
		var24 = var21
		CREATOR_CREDIT_VIEW_USAGE_BUTTON = localizationStringsModule.CREATOR_CREDIT_NOT_NOW_BUTTON
		var25 = var22
	elseif var23 == "DailyLimitReached" then
		CREATOR_CREDIT_BUY_MORE_ROBUX_TITLE = localizationStringsModule.CREATOR_CREDIT_DAILY_LIMIT_REACHED_TITLE
		CREATOR_CREDIT_BUY_MORE_ROBUX_DESCRIPTION = localizationStringsModule.CREATOR_CREDIT_DAILY_LIMIT_REACHED_DESCRIPTION
		CREATOR_CREDIT_BUY_ROBUX_SHEET_CONFIRM = localizationStringsModule.CREATOR_CREDIT_ADJUST_LIMIT_BUTTON
		var24 = var21
		CREATOR_CREDIT_VIEW_USAGE_BUTTON = localizationStringsModule.CREATOR_CREDIT_NOT_NOW_BUTTON
		var25 = var22
	end
	return {
		showBuyMoreRobuxCard = var23 ~= nil and (not var11 and p1.onOpenCreatorCreditPage ~= nil),
		buyMoreRobuxCardTitle = CREATOR_CREDIT_BUY_MORE_ROBUX_TITLE,
		buyMoreRobuxCardDescription = CREATOR_CREDIT_BUY_MORE_ROBUX_DESCRIPTION,
		buyMoreRobuxCardPrimaryActionText = CREATOR_CREDIT_BUY_ROBUX_SHEET_CONFIRM,
		onBuyMoreRobuxCardPrimaryAction = var24,
		buyMoreRobuxCardSecondaryActionText = CREATOR_CREDIT_VIEW_USAGE_BUTTON,
		onBuyMoreRobuxCardSecondaryAction = var25
	}
end