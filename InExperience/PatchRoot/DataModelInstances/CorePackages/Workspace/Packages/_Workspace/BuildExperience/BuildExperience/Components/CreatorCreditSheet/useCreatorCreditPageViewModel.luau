local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorCreditModule = require(Parent.DataHydration.CreatorCredit)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local CreatorCreditConfigModule = require(BuildExperience.CreatorCreditConfig)
local _ = require(script.Parent.CreatorCreditPageView)
local _ = require(script.Parent.DailyLimitBottomSheet)
local GetHoursUntilResetModule = require(script.Parent.getHoursUntilReset)
local UseOpenBuyRobuxWebViewModule = require(script.Parent.useOpenBuyRobuxWebView)
local UseRefreshCreatorCreditOnUnhideModule = require(script.Parent.useRefreshCreatorCreditOnUnhide)
local FFlagBuildExperienceModelPickerModule = require(BuildExperience.Flags.FFlagBuildExperienceModelPicker)
local GetBuildCreatorCreditRefreshStoreModule = require(BuildExperience.Stores.GetBuildCreatorCreditRefreshStore)
local DataStatus = require(Parent.DataHydration).DataStatus

return function()
	-- upvalues: CreatorCreditModule (copy), ReactModule (copy), SignalsReactModule (copy), DataStatus (copy), FFlagBuildExperienceModelPickerModule (copy), GetBuildCreatorCreditRefreshStoreModule (copy), UseOpenBuyRobuxWebViewModule (copy), UseRefreshCreatorCreditOnUnhideModule (copy), GetHoursUntilResetModule (copy), CreatorCreditConfigModule (copy)
	local CreatorCreditStore = CreatorCreditModule.getCreatorCreditStore(false)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CreatorCreditStore (copy)
		return CreatorCreditStore.getDailyLimit()
	end, { CreatorCreditStore })
	local UseSignalStateResult = SignalsReactModule.useSignalState(ReactModule.useMemo(function()
		-- upvalues: CreatorCreditStore (copy)
		return CreatorCreditStore.getQuotaSummary()
	end, { CreatorCreditStore }).data)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseMemoResult.data)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(UseMemoResult.status)
	local UseSignalStateResult1_1 = UseSignalStateResult1 or (if UseSignalStateResult then UseSignalStateResult.limitSettings else nil)
	local RobuxBalance = if UseSignalStateResult then UseSignalStateResult.robuxBalance else 0
	local RobuxSpentToday = if UseSignalStateResult then UseSignalStateResult.robuxSpentToday else 0
	local AdditionalUsageEnabled = if UseSignalStateResult1_1 then UseSignalStateResult1_1.additionalUsageEnabled else false
	local DailyLimit = if UseSignalStateResult1_1 and UseSignalStateResult1_1.dailyLimitSet then UseSignalStateResult1_1.dailyLimit else nil
	local HasUseSignalStateResult = UseSignalStateResult1_1 ~= nil
	local HasUseSignalStateResult1: boolean = UseSignalStateResult2 == DataStatus.Ready and UseSignalStateResult1 ~= nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(0)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		UseRefResult.current += 1
		UseStateResult2_1(true)
		UseStateResult2_2(false)
		
		return UseRefResult.current
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Current, p1)
		-- upvalues: UseRefResult (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		if UseRefResult.current == Current then
			UseStateResult2_1(false)
			UseStateResult2_2(p1)
			
			return
		end
	end, {})
	local UseResult2 = ReactModule.useCallback(function(AdditionalUsageEnabled)
		-- upvalues: HasUseSignalStateResult1 (copy), UseStateResult1 (copy), UseSignalStateResult1_1 (copy), UseResult (copy), CreatorCreditStore (copy), UseResult1 (copy)
		if HasUseSignalStateResult1 and not UseStateResult1 and UseSignalStateResult1_1 ~= nil then
			local UseResultResult = UseResult()
			CreatorCreditStore.setDailyLimit({
				additionalUsageEnabled = AdditionalUsageEnabled,
				dailyLimitSet = UseSignalStateResult1_1.dailyLimitSet,
				dailyLimit = UseSignalStateResult1_1.dailyLimit
			}):andThen(function()
				-- upvalues: UseResult1 (upval), UseResultResult (copy)
				UseResult1(UseResultResult, false)
			end):catch(function()
				-- upvalues: UseResult1 (upval), UseResultResult (copy)
				UseResult1(UseResultResult, true)
			end)
			
			return
		end
	end, {
		UseResult, CreatorCreditStore, UseResult1, UseStateResult1,
		UseSignalStateResult1_1, HasUseSignalStateResult1
	})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: HasUseSignalStateResult1 (copy), UseStateResult1 (copy), UseStateResult2_2 (copy), UseStateResult2 (copy)
		if HasUseSignalStateResult1 and not UseStateResult1 then
			UseStateResult2_2(false)
			UseStateResult2(true)
		end
	end, { UseStateResult1, HasUseSignalStateResult1 })
	local UseResult4 = ReactModule.useCallback(function(p1)
		-- upvalues: HasUseSignalStateResult1 (copy), UseStateResult1 (copy), UseSignalStateResult1_1 (copy), UseResult (copy), CreatorCreditStore (copy), UseRefResult (copy), UseResult1 (copy), UseStateResult2 (copy)
		if HasUseSignalStateResult1 and not UseStateResult1 and UseSignalStateResult1_1 ~= nil then
			local UseResultResult = UseResult()
			CreatorCreditStore.setDailyLimit({
				additionalUsageEnabled = UseSignalStateResult1_1.additionalUsageEnabled,
				dailyLimitSet = p1 ~= nil,
				dailyLimit = p1 or 0
			}):andThen(function()
				-- upvalues: UseRefResult (upval), UseResultResult (copy), UseResult1 (upval), UseStateResult2 (upval)
				if UseRefResult.current == UseResultResult then
					UseResult1(UseResultResult, false)
					UseStateResult2(false)
				end
			end):catch(function()
				-- upvalues: UseResult1 (upval), UseResultResult (copy)
				UseResult1(UseResultResult, true)
			end)
			
			return
		end
	end, {
		UseResult, CreatorCreditStore, UseResult1, UseStateResult1,
		UseSignalStateResult1_1, HasUseSignalStateResult1
	})
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: FFlagBuildExperienceModelPickerModule (upval), GetBuildCreatorCreditRefreshStoreModule (upval), CreatorCreditStore (copy)
		if FFlagBuildExperienceModelPickerModule then
			GetBuildCreatorCreditRefreshStoreModule(false).refresh()
			
			return
		else
			CreatorCreditStore.refreshQuotaSummary():catch(function() end)
		end
	end, { CreatorCreditStore })
	local UseOpenBuyRobuxWebViewModuleResult = UseOpenBuyRobuxWebViewModule(UseResult6)
	
	if FFlagBuildExperienceModelPickerModule then
		ReactModule.useEffect(function()
			-- upvalues: GetBuildCreatorCreditRefreshStoreModule (upval)
			return GetBuildCreatorCreditRefreshStoreModule(false).acquire()
		end, {})
	else
		UseRefreshCreatorCreditOnUnhideModule(UseResult6)
	end
	return {
		pageProps = {
			dailyPctUsed = if UseSignalStateResult then UseSignalStateResult.freeTrialPctUsed else 0,
			resetHours = if UseSignalStateResult then GetHoursUntilResetModule(UseSignalStateResult.nextResetEligibleTime) else nil,
			resetPeriod = if UseSignalStateResult then UseSignalStateResult.freeTrialResetPeriod else nil,
			additionalEnabled = AdditionalUsageEnabled,
			dailyLimit = DailyLimit,
			hasLimitConfigured = HasUseSignalStateResult,
			additionalUsed = RobuxSpentToday,
			robuxAvailable = RobuxBalance,
			settingsDisabled = not HasUseSignalStateResult1 or UseStateResult1,
			settingsError = UseStateResult3 or UseSignalStateResult2 == DataStatus.Failed,
			showBuyRobux = UseSignalStateResult ~= nil and (UseSignalStateResult.freeTrialRemaining <= 0 and UseSignalStateResult.robuxBalance < CreatorCreditConfigModule.FIntMinimumUsableRobuxBalance),
			onToggleAdditional = UseResult2,
			onOpenLimitSheet = UseResult3,
			onOpenBuyRobux = UseOpenBuyRobuxWebViewModuleResult
		},
		limitSheetProps = {
			isOpen = UseStateResult,
			initialValue = DailyLimit,
			initialIsNoLimit = HasUseSignalStateResult and DailyLimit == nil,
			additionalUsed = RobuxSpentToday,
			isSaving = UseStateResult1,
			saveError = UseStateResult3,
			onConfirm = UseResult4,
			onCancel = UseResult5
		}
	}
end