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
	local var10 = reactModule.useMemo(function()
		-- upvalues: creatorCreditStore (ref)
		return creatorCreditStore.getDailyLimit()
	end, { creatorCreditStore })
	local var11 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: creatorCreditStore (ref)
		return creatorCreditStore.getQuotaSummary()
	end, { creatorCreditStore }).data)
	local var12 = signalsReactModule.useSignalState(var10.data)
	local var13 = signalsReactModule.useSignalState(var10.status)
	local var12_1 = var12 or (if var11 then var11.limitSettings else nil)
	local var15 = if var11 then var11.robuxBalance else 0
	local var16 = if var11 then var11.robuxSpentToday else 0
	local var17 = if var12_1 then var12_1.additionalUsageEnabled else false
	local var18 = if var12_1 and var12_1.dailyLimitSet then var12_1.dailyLimit else nil
	local var19 = var12_1 ~= nil
	local var20 = var13 == dataStatus.Ready and var12 ~= nil
	local var21, var22 = reactModule.useState(false)
	local var23, var24 = reactModule.useState(false)
	local var25, var26 = reactModule.useState(false)
	local var27 = reactModule.useRef(0)
	local var28 = reactModule.useCallback(function()
		-- upvalues: var27 (ref), var24 (ref), var26 (ref)
		var27.current += 1
		var24(true)
		var26(false)
		
		return var27.current
	end, {})
	local var29 = reactModule.useCallback(function(p0, p1)
		-- upvalues: var27 (ref), var24 (ref), var26 (ref)
		if var27.current == p0 then
			var24(false)
			var26(p1)
			
			return
		end
	end, {})
	local var30 = reactModule.useCallback(function(p2)
		-- upvalues: var20 (ref), var23 (ref), var12_1 (ref), var28 (ref), creatorCreditStore (ref), var29 (ref)
		if var20 and not var23 and var12_1 ~= nil then
			local var36 = var28()
			creatorCreditStore.setDailyLimit({
				additionalUsageEnabled = p2,
				dailyLimitSet = var12_1.dailyLimitSet,
				dailyLimit = var12_1.dailyLimit
			}):andThen(function()
				-- upvalues: var29 (copy), var36 (ref)
				var29(var36, false)
			end):catch(function()
				-- upvalues: var29 (copy), var36 (ref)
				var29(var36, true)
			end)
			
			return
		end
	end, {
		var28, creatorCreditStore, var29, var23, var12_1, var20
	})
	local var31 = reactModule.useCallback(function()
		-- upvalues: var20 (ref), var23 (ref), var26 (ref), var22 (ref)
		if var20 and not var23 then
			var26(false)
			var22(true)
		end
	end, { var23, var20 })
	local var32 = reactModule.useCallback(function(p3)
		-- upvalues: var20 (ref), var23 (ref), var12_1 (ref), var28 (ref), creatorCreditStore (ref), var27 (ref), var29 (ref), var22 (ref)
		if var20 and not var23 and var12_1 ~= nil then
			local var37 = var28()
			creatorCreditStore.setDailyLimit({
				additionalUsageEnabled = var12_1.additionalUsageEnabled,
				dailyLimitSet = p3 ~= nil,
				dailyLimit = p3 or 0
			}):andThen(function()
				-- upvalues: var27 (copy), var37 (ref), var29 (copy), var22 (copy)
				if var27.current == var37 then
					var29(var37, false)
					var22(false)
				end
			end):catch(function()
				-- upvalues: var29 (copy), var37 (ref)
				var29(var37, true)
			end)
			
			return
		end
	end, {
		var28, creatorCreditStore, var29, var23, var12_1, var20
	})
	local var33 = reactModule.useCallback(function()
		-- upvalues: var22 (ref)
		var22(false)
	end, {})
	local var34 = reactModule.useCallback(function()
		-- upvalues: creatorCreditStore (ref)
		creatorCreditStore.refreshQuotaSummary():catch(function() end)
	end, { creatorCreditStore })
	local var35 = useOpenBuyRobuxWebViewModule(var34)
	useRefreshCreatorCreditOnUnhideModule(var34)
	
	return {
		pageProps = {
			dailyPctUsed = if var11 then var11.freeTrialPctUsed else 0,
			resetHours = if var11 then getHoursUntilResetModule(var11.nextResetEligibleTime) else nil,
			additionalEnabled = var17,
			dailyLimit = var18,
			hasLimitConfigured = var19,
			additionalUsed = var16,
			robuxAvailable = var15,
			settingsDisabled = not var20 or var23,
			settingsError = var25 or var13 == dataStatus.Failed,
			showBuyRobux = var11 ~= nil and (var11.freeTrialRemaining <= 0 and var11.robuxBalance < creatorCreditConfigModule.FIntMinimumUsableRobuxBalance),
			onToggleAdditional = var30,
			onOpenLimitSheet = var31,
			onOpenBuyRobux = var35
		},
		limitSheetProps = {
			isOpen = var21,
			initialValue = var18,
			initialIsNoLimit = var19 and var18 == nil,
			additionalUsed = var16,
			isSaving = var23,
			saveError = var25,
			onConfirm = var32,
			onCancel = var33
		}
	}
end