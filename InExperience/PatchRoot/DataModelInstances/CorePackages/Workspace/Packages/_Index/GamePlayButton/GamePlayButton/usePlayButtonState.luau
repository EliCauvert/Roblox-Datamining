local GamePlayButton = script:FindFirstAncestor("GamePlayButton")
local PlayButtonStatesModule = require(GamePlayButton.PlayButtonStates)
local FetchGamePlayButtonDataModule = require(GamePlayButton.FetchGamePlayButtonData)
local ApiPostPreparePurchaseModule = require(GamePlayButton.ApiPostPreparePurchase)
local PlaytestUnlockUpsellModule = require(GamePlayButton.PlaytestUnlockUpsell)
local Parent = GamePlayButton.Parent
local FFlagEnableGameJoinEarlyAccess = require(Parent.SharedFlags).FFlagEnableGameJoinEarlyAccess
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local ReactModule = require(Parent.React)
local _ = require(Parent.PlayabilityRodux)
local PlayabilityStatusEnum = require(Parent.DiscoveryTypes).PlayabilityStatusEnum
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local FetchGamePlayabilityAndProductInfo = require(Parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local GamesProductInfoReducer = require(Parent.GameProductInfoRodux).GamesProductInfoReducer
local UseCurrentSquadSelectorFunction = require(Parent.RoduxSquads).Hooks.useCurrentSquadSelector
local UseIsExperienceInvitePendingModule = require(Parent.Squads.useIsExperienceInvitePending)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseRouteNameFunction = require(Parent.Navigation).useRouteName
local SendPlayButtonLoadingDurationFunction = require(Parent.DiscoveryAnalytics).Events.sendPlayButtonLoadingDuration
local FFlagLuaAppParentUpsellPolicy = require(Parent.SharedFlags).FFlagLuaAppParentUpsellPolicy
local FFlagLuaAppEnablePlayableStateWhenLoading = require(Parent.SharedFlags).FFlagLuaAppEnablePlayableStateWhenLoading
local FFlagLuaAppSupportDisablePlayableWhenLoading = require(Parent.SharedFlags).FFlagLuaAppSupportDisablePlayableWhenLoading
local FFlagLuaAppDisablePlayableWhenLoadingForce = require(Parent.SharedFlags).FFlagLuaAppDisablePlayableWhenLoadingForce
local FFlagLuaAppPlayButtonAmpAgeCheckFlow = require(Parent.SharedFlags).FFlagLuaAppPlayButtonAmpAgeCheckFlow
local FFlagLuaAppParentApprovedExperiences = require(Parent.SharedFlags).FFlagLuaAppParentApprovedExperiences
local FFlagLuaAppPlayButtonLoadingDurationTelemetry = require(Parent.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry
local FFlagLuaAppPlayButtonPrivatePTEnableSingleButton = require(Parent.SharedFlags).FFlagLuaAppPlayButtonPrivatePTEnableSingleButton
local FFlagLuaAppPlayButtonPrivatePTEnableDualButton = require(Parent.SharedFlags).FFlagLuaAppPlayButtonPrivatePTEnableDualButton
local LuaAppPlaytestSingleBlocksPlayable = game:DefineFastFlag("LuaAppPlaytestSingleBlocksPlayable", false)

local function selectPlayButtonState(FetchingStatus, Current, p1, p2, p3, GameDetail, p4, p5) --[[ Line: 56 ]]
	-- upvalues: RetrievalStatus (copy), FFlagLuaAppPlayButtonPrivatePTEnableSingleButton (copy), PlaytestUnlockUpsellModule (copy), LuaAppPlaytestSingleBlocksPlayable (copy), PlayButtonStatesModule (copy), PlayabilityStatusEnum (copy), FFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), FFlagLuaAppParentUpsellPolicy (copy), FFlagLuaAppParentApprovedExperiences (copy), FFlagEnableGameJoinEarlyAccess (copy), GetFFlagIsSquadEnabledFunction (copy)
	local Playable = nil
	if FetchingStatus == RetrievalStatus.Done and Current ~= nil then
		local HasType = if FFlagLuaAppPlayButtonPrivatePTEnableSingleButton then Current.privatePlaytestInfo ~= nil and (not Current.privatePlaytestInfo.isPlayable and PlaytestUnlockUpsellModule.getType(Current.privatePlaytestInfo.playabilityStatus) ~= nil) else nil
		
		if Current.isPlayable == true and (not LuaAppPlaytestSingleBlocksPlayable or not HasType) then
			Playable = PlayButtonStatesModule.Playable
		elseif FFlagLuaAppPlayButtonPrivatePTEnableSingleButton and HasType then
			Playable = PlayButtonStatesModule.ActionNeeded
		elseif Current.playabilityStatus == PlayabilityStatusEnum.PurchaseRequired and p1 ~= nil and p1.isForSale == true then
			Playable = PlayButtonStatesModule.PaidAccess
		elseif Current.playabilityStatus == PlayabilityStatusEnum.FiatPurchaseRequired and p1 ~= nil and p1.isForSale == true then
			Playable = PlayButtonStatesModule.FiatPaidAccess
		elseif FFlagLuaAppPlayButtonAmpAgeCheckFlow and (Current.playabilityStatus == PlayabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser or (not FFlagLuaAppParentUpsellPolicy or p4) and (Current.playabilityStatus == PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls or FFlagLuaAppParentApprovedExperiences and Current.playabilityStatus == PlayabilityStatusEnum.ContextualPlayabilityRequireParentApproval) or Current.playabilityStatus == PlayabilityStatusEnum.ContextualPlayabilityAgeCheckRequired) then
			Playable = PlayButtonStatesModule.ActionNeeded
		elseif FFlagLuaAppPlayButtonAmpAgeCheckFlow or Current.playabilityStatus ~= PlayabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser then
			if FFlagLuaAppPlayButtonAmpAgeCheckFlow or (FFlagLuaAppParentUpsellPolicy and not p4 or Current.playabilityStatus ~= PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls and (not FFlagLuaAppParentApprovedExperiences or Current.playabilityStatus ~= PlayabilityStatusEnum.ContextualPlayabilityRequireParentApproval)) then
				Playable = if FFlagEnableGameJoinEarlyAccess and p5 and Current.playabilityStatus == PlayabilityStatusEnum.PlusSubscriptionRequired then PlayButtonStatesModule.EarlyAccessLocked else PlayButtonStatesModule.UnplayableOther
			else
				Playable = PlayButtonStatesModule.ActionNeeded
			end
		else
			Playable = PlayButtonStatesModule.ActionNeeded
		end
	else
		Playable = PlayButtonStatesModule.Playable
	end
	if GetFFlagIsSquadEnabledFunction() and Playable == PlayButtonStatesModule.Playable and p2 and #p2.members > 1 and (not GameDetail or not GameDetail.maxPlayers or GameDetail.maxPlayers > 1) then
		if p3 then
			return PlayButtonStatesModule.WaitingForParty
		end
		Playable = PlayButtonStatesModule.PlayableWithParty
	end
	return Playable
end

local function selectSecondaryPlayButtonState(UnplayableOther, Current) --[[ Line: 159 ]]
	-- upvalues: FFlagLuaAppPlayButtonPrivatePTEnableDualButton (copy), PlaytestUnlockUpsellModule (copy), PlayButtonStatesModule (copy), PlayabilityStatusEnum (copy)
	if Current == nil then
		return nil
	end
	if FFlagLuaAppPlayButtonPrivatePTEnableDualButton and Current.privatePlaytestInfo ~= nil then
		local PrivatePlaytestInfo = Current.privatePlaytestInfo
		local Type = PlaytestUnlockUpsellModule.getType(PrivatePlaytestInfo.playabilityStatus)
		
		if UnplayableOther == PlayButtonStatesModule.ActionNeeded then
			return nil
		elseif PrivatePlaytestInfo.isPlayable or Type ~= nil then
			return PlayButtonStatesModule.Playtest
		end
	end
	local IsUnplayableOtherMatch: boolean = UnplayableOther == PlayButtonStatesModule.PaidAccess or (UnplayableOther == PlayButtonStatesModule.FiatPaidAccess or (Current.playabilityStatus == PlayabilityStatusEnum.FiatPurchaseDeviceRestricted and UnplayableOther == PlayButtonStatesModule.UnplayableOther or Current.playabilityStatus == PlayabilityStatusEnum.ContextualPlayabilityRegionalAvailability and UnplayableOther == PlayButtonStatesModule.UnplayableOther))
	
	return if IsUnplayableOtherMatch and Current.demoModeAvailable then PlayButtonStatesModule.DemoMode else nil
end

return function(p1, Current, Delay, p2, p3, Current1, p4) --[[ Line: 195 ]]
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), FetchGamePlayButtonDataModule (copy), FFlagLuaAppParentUpsellPolicy (copy), UseAppPolicyFunction (copy), FFlagLuaAppSupportDisablePlayableWhenLoading (copy), FFlagLuaAppDisablePlayableWhenLoadingForce (copy), GetFFlagIsSquadEnabledFunction (copy), UseCurrentSquadSelectorFunction (copy), UseIsExperienceInvitePendingModule (copy), UseSelectorFunction (copy), FFlagEnableGameJoinEarlyAccess (copy), GamePlayButton (copy), FFlagLuaAppEnablePlayableStateWhenLoading (copy), PlayButtonStatesModule (copy), ApiPostPreparePurchaseModule (copy), RetrievalStatus (copy), FetchGamePlayabilityAndProductInfo (copy), GamesProductInfoReducer (copy), selectPlayButtonState (copy), FFlagLuaAppPlayButtonLoadingDurationTelemetry (copy), UseRouteNameFunction (copy), SendPlayButtonLoadingDurationFunction (copy), selectSecondaryPlayButtonState (copy)
	local UseDispatchResult = UseDispatchFunction()
	ReactModule.useEffect(function() --[[ Line: 206 ]]
		-- upvalues: Delay (copy), UseDispatchResult (copy), FetchGamePlayButtonDataModule (upval), p1 (copy), Current (copy)
		local DelayedThread = nil
		
		if Delay == nil or Delay <= 0 then
			UseDispatchResult(FetchGamePlayButtonDataModule.Fetch(p1, Current))
		else
			DelayedThread = task.delay(Delay, function() --[[ Line: 209 ]]
				-- upvalues: DelayedThread (ref), UseDispatchResult (upval), FetchGamePlayButtonDataModule (upval), p1 (upval), Current (upval)
				DelayedThread = nil
				UseDispatchResult(FetchGamePlayButtonDataModule.Fetch(p1, Current))
			end)
		end
		return function() --[[ Line: 217 ]]
			-- upvalues: DelayedThread (ref)
			if DelayedThread ~= nil then
				task.cancel(DelayedThread)
			end
		end
	end, { Current, Delay })
	local UseAppPolicyResult = if FFlagLuaAppParentUpsellPolicy then UseAppPolicyFunction(function(p5) --[[ Line: 226 ]]
		return p5.getShouldShowVpcPlayButtonUpsells()
	end) else nil
	local v1 = nil
	
	if FFlagLuaAppSupportDisablePlayableWhenLoading then
		local UseAppPolicyResult1 = UseAppPolicyFunction(function(p5) --[[ Line: 233 ]]
			return p5.getDisablePlayableWhenLoading()
		end)
		v1 = FFlagLuaAppDisablePlayableWhenLoadingForce or UseAppPolicyResult1
	end
	local UseCurrentSquadSelectorResult = if GetFFlagIsSquadEnabledFunction() then UseCurrentSquadSelectorFunction() else nil
	local UseIsExperienceInvitePendingModuleResult = if GetFFlagIsSquadEnabledFunction() then UseIsExperienceInvitePendingModule() else nil
	local UseSelectorResult = UseSelectorFunction(function(p5) --[[ Line: 242 ]]
		-- upvalues: Current (copy)
		return p5.PlayabilityStatus and p5.PlayabilityStatus[Current] or nil
	end)
	local EarlyAccess = nil
	
	if FFlagEnableGameJoinEarlyAccess then
		EarlyAccess = require(GamePlayButton.EarlyAccess.useGameJoinEarlyAccess)(Current, UseSelectorResult)
		local IsIsPendingUnlock: boolean = EarlyAccess ~= nil and EarlyAccess.isPendingUnlock == true
		local IsGainedSubscription: boolean = EarlyAccess ~= nil and EarlyAccess.gainedSubscription == true
		ReactModule.useEffect(function() --[[ Line: 256 ]]
			-- upvalues: IsIsPendingUnlock (copy), IsGainedSubscription (copy), UseDispatchResult (copy), FetchGamePlayButtonDataModule (upval), p1 (copy), Current (copy)
			if IsIsPendingUnlock or IsGainedSubscription then
				UseDispatchResult(FetchGamePlayButtonDataModule.Fetch(p1, Current, true))
			end
		end, {
			IsIsPendingUnlock,
			if EarlyAccess == nil then 0 else EarlyAccess.unlockRefetchTick,
			IsGainedSubscription,
			Current
		})
	end
	local UseSelectorResult1 = UseSelectorFunction(function(p5) --[[ Line: 263 ]]
		-- upvalues: FetchGamePlayButtonDataModule (upval), Current (copy), FFlagLuaAppEnablePlayableStateWhenLoading (upval), p2 (copy), FFlagLuaAppSupportDisablePlayableWhenLoading (upval), v1 (ref), GetFFlagIsSquadEnabledFunction (upval), UseCurrentSquadSelectorResult (copy), UseIsExperienceInvitePendingModuleResult (copy), PlayButtonStatesModule (upval), ApiPostPreparePurchaseModule (upval), RetrievalStatus (upval), FetchGamePlayabilityAndProductInfo (upval), GamesProductInfoReducer (upval), selectPlayButtonState (upval), UseSelectorResult (copy), FFlagLuaAppParentUpsellPolicy (upval), UseAppPolicyResult (ref), FFlagEnableGameJoinEarlyAccess (upval), p4 (copy)
		if FetchGamePlayButtonDataModule.IsLoading(p5, Current) then
			return if FFlagLuaAppEnablePlayableStateWhenLoading and (p2 and (not FFlagLuaAppSupportDisablePlayableWhenLoading or not v1)) then if GetFFlagIsSquadEnabledFunction() and UseCurrentSquadSelectorResult and #UseCurrentSquadSelectorResult.members > 1 then if UseIsExperienceInvitePendingModuleResult then PlayButtonStatesModule.WaitingForParty else PlayButtonStatesModule.PlayableWithParty else PlayButtonStatesModule.Playable else PlayButtonStatesModule.Loading
		elseif ApiPostPreparePurchaseModule.GetFetchingStatus(p5, Current) == RetrievalStatus.Fetching then
			return PlayButtonStatesModule.Loading
		else
			local FetchingStatus = FetchGamePlayabilityAndProductInfo.GetFetchingStatus(p5, Current)
			local v2 = p5[GamesProductInfoReducer.key] and p5[GamesProductInfoReducer.key][Current] or nil
			
			return if GetFFlagIsSquadEnabledFunction() then selectPlayButtonState(FetchingStatus, UseSelectorResult, v2, UseCurrentSquadSelectorResult, UseIsExperienceInvitePendingModuleResult, p5.GameDetails[Current], if FFlagLuaAppParentUpsellPolicy then UseAppPolicyResult else nil, if FFlagEnableGameJoinEarlyAccess then p4 else nil) else selectPlayButtonState(FetchingStatus, UseSelectorResult, v2, nil, nil, nil, if FFlagLuaAppParentUpsellPolicy then UseAppPolicyResult else nil, if FFlagEnableGameJoinEarlyAccess then p4 else nil)
		end
	end)
	
	if FFlagLuaAppPlayButtonLoadingDurationTelemetry then
		local UseRouteNameResult = UseRouteNameFunction()
		local UseRefResult = ReactModule.useRef(nil)
		local UseRefResult1 = ReactModule.useRef(nil)
		local UseRefResult2 = ReactModule.useRef(nil)
		local UseRefResult3 = ReactModule.useRef(nil)
		local UseRefResult4 = ReactModule.useRef(UseSelectorResult1)
		UseRefResult4.current = UseSelectorResult1
		local UseRefResult5 = ReactModule.useRef(UseSelectorResult)
		UseRefResult5.current = UseSelectorResult
		local UseResult = ReactModule.useCallback(function(EndReason) --[[ Line: 341 ]]
			-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), SendPlayButtonLoadingDurationFunction (upval), UseRefResult4 (copy), UseRefResult5 (copy), UseRefResult3 (copy)
			local Current = UseRefResult.current
			local Current1 = UseRefResult1.current
			local Current2 = UseRefResult2.current
			
			if Current and Current1 then
				UseRefResult.current = nil
				UseRefResult1.current = nil
				SendPlayButtonLoadingDurationFunction({
					universeId = Current1,
					durationMs = math.floor((os.clock() - Current) * 1000),
					endReason = EndReason,
					endPlayButtonState = UseRefResult4.current,
					endPlayabilityStatus = UseRefResult5.current and UseRefResult5.current.playabilityStatus or nil,
					pageName = UseRefResult3.current
				}, Current2)
				UseRefResult2.current = nil
				UseRefResult3.current = nil
				
				return
			end
		end, {})
		ReactModule.useEffect(function() --[[ Line: 368 ]]
			-- upvalues: UseSelectorResult1 (copy), PlayButtonStatesModule (upval), p3 (copy), UseRefResult (copy), UseRefResult1 (copy), Current (copy), UseRefResult2 (copy), Current1 (copy), UseRefResult3 (copy), UseRouteNameResult (copy), UseResult (copy)
			if UseSelectorResult1 ~= PlayButtonStatesModule.Loading then
				UseResult("stateChanged")
			elseif not p3 then return end
			if not UseRefResult.current then
				UseRefResult.current = os.clock()
				UseRefResult1.current = Current
				UseRefResult2.current = Current1
				UseRefResult3.current = UseRouteNameResult
				
				return
			end
			if UseRefResult1.current ~= Current then
				UseResult("universeChanged")
				UseRefResult.current = os.clock()
				UseRefResult1.current = Current
				UseRefResult2.current = Current1
				UseRefResult3.current = UseRouteNameResult
				
				return
			end
		end, {
			UseSelectorResult1, UseResult, Current, p3, Current1, UseRouteNameResult
		})
		ReactModule.useEffect(function() --[[ Line: 400 ]]
			-- upvalues: UseResult (copy)
			return function() --[[ Line: 401 ]]
				-- upvalues: UseResult (upval)
				UseResult("unmounted")
			end
		end, { UseResult })
	end
	return {
		playButtonState = UseSelectorResult1,
		secondaryPlayButtonState = selectSecondaryPlayButtonState(UseSelectorResult1, UseSelectorResult),
		playabilityStatus = UseSelectorResult,
		earlyAccess = EarlyAccess
	}
end