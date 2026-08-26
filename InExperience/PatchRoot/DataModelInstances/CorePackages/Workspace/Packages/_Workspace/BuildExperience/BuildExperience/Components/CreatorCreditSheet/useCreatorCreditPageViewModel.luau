local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local dataHydrationModule = require(parent.DataHydration)
local creatorCreditModule = require(parent.DataHydration.CreatorCredit)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local creatorCreditConfigModule = require(buildExperience.CreatorCreditConfig)
local _ = require(script.Parent.CreatorCreditPageView)
local _ = require(script.Parent.DailyLimitBottomSheet)
local getHoursUntilResetModule = require(script.Parent.getHoursUntilReset)
local useOpenBuyRobuxWebViewModule = require(script.Parent.useOpenBuyRobuxWebView)
local useRefreshCreatorCreditOnUnhideModule = require(script.Parent.useRefreshCreatorCreditOnUnhide)
local dataStatus = dataHydrationModule.DataStatus

return function()
	-- upvalues: creatorCreditModule (ref), reactModule (ref), signalsReactModule (ref), dataStatus (ref), useOpenBuyRobuxWebViewModule (ref), useRefreshCreatorCreditOnUnhideModule (ref), getHoursUntilResetModule (ref), creatorCreditConfigModule (ref)
	local creatorCreditStore = creatorCreditModule.getCreatorCreditStore(false)
	local var1 = reactModule.useMemo(function()
		-- upvalues: creatorCreditStore (ref)
		return creatorCreditStore.getDailyLimit()
	end, { creatorCreditStore })
	local var2 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: creatorCreditStore (ref)
		return creatorCreditStore.getQuotaSummary()
	end, { creatorCreditStore }).data)
	local var3 = signalsReactModule.useSignalState(var1.data)
	local var4 = signalsReactModule.useSignalState(var1.status)
	local var5 = var3 or (if var2 then var2.limitSettings else nil)
	local var6 = if var2 then var2.robuxBalance else 0
	local var7 = if var2 then var2.robuxSpentToday else 0
	local var8 = if var5 then var5.additionalUsageEnabled else false
	local var9 = if var5 and var5.dailyLimitSet then var5.dailyLimit else nil
	local var10 = var5 ~= nil
	local var11 = var4 == dataStatus.Ready and var3 ~= nil
	local var12, var13 = reactModule.useState(false)
	local var14, var15 = reactModule.useState(false)
	local var16, var17 = reactModule.useState(false)
	local var18 = reactModule.useRef(0)
	local var19 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), var15 (ref), var17 (ref)
		var18.current += 1
		var15(true)
		var17(false)
		
		return var18.current
	end, {})
	local var20 = reactModule.useCallback(function(p1, p2)
		-- upvalues: var18 (ref), var15 (ref), var17 (ref)
		if var18.current == p1 then
			var15(false)
			var17(p2)
			
			return
		end
	end, {})
	local var21 = reactModule.useCallback(function(p1)
		-- upvalues: var11 (ref), var14 (ref), var5 (ref), var19 (ref), creatorCreditStore (ref), var20 (ref)
		if var11 and not var14 and var5 ~= nil then
			local var22 = var19()
			creatorCreditStore.setDailyLimit({
				additionalUsageEnabled = p1,
				dailyLimitSet = var5.dailyLimitSet,
				dailyLimit = var5.dailyLimit
			}):andThen(function()
				-- upvalues: var20 (copy), var22 (ref)
				var20(var22, false)
			end):catch(function()
				-- upvalues: var20 (copy), var22 (ref)
				var20(var22, true)
			end)
			
			return
		end
	end, {
		var19, creatorCreditStore, var20, var14, var5, var11
	})
	local var22 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), var14 (ref), var17 (ref), var13 (ref)
		if var11 and not var14 then
			var17(false)
			var13(true)
		end
	end, { var14, var11 })
	local var23 = reactModule.useCallback(function(p1)
		-- upvalues: var11 (ref), var14 (ref), var5 (ref), var19 (ref), creatorCreditStore (ref), var18 (ref), var20 (ref), var13 (ref)
		if var11 and not var14 and var5 ~= nil then
			local var24 = var19()
			creatorCreditStore.setDailyLimit({
				additionalUsageEnabled = var5.additionalUsageEnabled,
				dailyLimitSet = p1 ~= nil,
				dailyLimit = p1 or 0
			}):andThen(function()
				-- upvalues: var18 (copy), var24 (ref), var20 (copy), var13 (copy)
				if var18.current == var24 then
					var20(var24, false)
					var13(false)
				end
			end):catch(function()
				-- upvalues: var20 (copy), var24 (ref)
				var20(var24, true)
			end)
			
			return
		end
	end, {
		var19, creatorCreditStore, var20, var14, var5, var11
	})
	local var24 = reactModule.useCallback(function()
		-- upvalues: var13 (ref)
		var13(false)
	end, {})
	local var25 = reactModule.useCallback(function()
		-- upvalues: creatorCreditStore (ref)
		creatorCreditStore.refreshQuotaSummary():catch(function() end)
	end, { creatorCreditStore })
	local var26 = useOpenBuyRobuxWebViewModule(var25)
	useRefreshCreatorCreditOnUnhideModule(var25)
	
	return {
		pageProps = {
			dailyPctUsed = if var2 then var2.freeTrialPctUsed else 0,
			resetHours = if var2 then getHoursUntilResetModule(var2.nextResetEligibleTime) else nil,
			additionalEnabled = var8,
			dailyLimit = var9,
			hasLimitConfigured = var10,
			additionalUsed = var7,
			robuxAvailable = var6,
			settingsDisabled = not var11 or var14,
			settingsError = var16 or var4 == dataStatus.Failed,
			showBuyRobux = var2 ~= nil and (var2.freeTrialRemaining <= 0 and var2.robuxBalance < creatorCreditConfigModule.FIntMinimumUsableRobuxBalance),
			onToggleAdditional = var21,
			onOpenLimitSheet = var22,
			onOpenBuyRobux = var26
		},
		limitSheetProps = {
			isOpen = var12,
			initialValue = var9,
			initialIsNoLimit = var10 and var9 == nil,
			additionalUsed = var7,
			isSaving = var14,
			saveError = var16,
			onConfirm = var23,
			onCancel = var24
		}
	}
end