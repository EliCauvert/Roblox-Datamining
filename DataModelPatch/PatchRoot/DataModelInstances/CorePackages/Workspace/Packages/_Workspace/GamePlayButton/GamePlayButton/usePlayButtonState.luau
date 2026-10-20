local GamePlayButton = script:FindFirstAncestor("GamePlayButton")
local PlayButtonStatesModule = require(GamePlayButton.PlayButtonStates)
local FetchGamePlayButtonDataModule = require(GamePlayButton.FetchGamePlayButtonData)
local ApiPostPreparePurchaseModule = require(GamePlayButton.ApiPostPreparePurchase)
local Parent = GamePlayButton.Parent
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

local function selectPlayButtonState(FetchingStatus, Current, p1, p2, p3, GameDetail, p4)
	-- upvalues: RetrievalStatus (copy), PlayButtonStatesModule (copy), PlayabilityStatusEnum (copy), FFlagLuaAppPlayButtonAmpAgeCheckFlow (copy), FFlagLuaAppParentUpsellPolicy (copy), FFlagLuaAppParentApprovedExperiences (copy), GetFFlagIsSquadEnabledFunction (copy)
	local Playable = nil
	if FetchingStatus == RetrievalStatus.Done and Current ~= nil then
		if Current.isPlayable == true then
			Playable = PlayButtonStatesModule.Playable
		elseif Current.playabilityStatus == PlayabilityStatusEnum.PurchaseRequired and p1 ~= nil and p1.isForSale == true then
			Playable = PlayButtonStatesModule.PaidAccess
		elseif Current.playabilityStatus == PlayabilityStatusEnum.FiatPurchaseRequired and p1 ~= nil and p1.isForSale == true then
			Playable = PlayButtonStatesModule.FiatPaidAccess
		elseif FFlagLuaAppPlayButtonAmpAgeCheckFlow and (Current.playabilityStatus == PlayabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser or (not FFlagLuaAppParentUpsellPolicy or p4) and (Current.playabilityStatus == PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls or FFlagLuaAppParentApprovedExperiences and Current.playabilityStatus == PlayabilityStatusEnum.ContextualPlayabilityRequireParentApproval) or Current.playabilityStatus == PlayabilityStatusEnum.ContextualPlayabilityAgeCheckRequired) then
			Playable = PlayButtonStatesModule.ActionNeeded
		elseif FFlagLuaAppPlayButtonAmpAgeCheckFlow or Current.playabilityStatus ~= PlayabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser then
			if FFlagLuaAppPlayButtonAmpAgeCheckFlow or (FFlagLuaAppParentUpsellPolicy and not p4 or Current.playabilityStatus ~= PlayabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls and (not FFlagLuaAppParentApprovedExperiences or Current.playabilityStatus ~= PlayabilityStatusEnum.ContextualPlayabilityRequireParentApproval)) then
				Playable = PlayButtonStatesModule.UnplayableOther
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

return function(p1, Current, Delay, p2, p3, Current1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), FetchGamePlayButtonDataModule (copy), FFlagLuaAppParentUpsellPolicy (copy), UseAppPolicyFunction (copy), FFlagLuaAppSupportDisablePlayableWhenLoading (copy), FFlagLuaAppDisablePlayableWhenLoadingForce (copy), GetFFlagIsSquadEnabledFunction (copy), UseCurrentSquadSelectorFunction (copy), UseIsExperienceInvitePendingModule (copy), UseSelectorFunction (copy), FFlagLuaAppEnablePlayableStateWhenLoading (copy), PlayButtonStatesModule (copy), ApiPostPreparePurchaseModule (copy), RetrievalStatus (copy), FetchGamePlayabilityAndProductInfo (copy), GamesProductInfoReducer (copy), selectPlayButtonState (copy), FFlagLuaAppPlayButtonLoadingDurationTelemetry (copy), UseRouteNameFunction (copy), SendPlayButtonLoadingDurationFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	ReactModule.useEffect(function()
		-- upvalues: Delay (copy), UseDispatchResult (copy), FetchGamePlayButtonDataModule (upval), p1 (copy), Current (copy)
		local DelayedThread = nil
		
		if Delay == nil or Delay <= 0 then
			UseDispatchResult(FetchGamePlayButtonDataModule.Fetch(p1, Current))
		else
			DelayedThread = task.delay(Delay, function()
				-- upvalues: DelayedThread (ref), UseDispatchResult (upval), FetchGamePlayButtonDataModule (upval), p1 (upval), Current (upval)
				DelayedThread = nil
				UseDispatchResult(FetchGamePlayButtonDataModule.Fetch(p1, Current))
			end)
		end
		return function()
			-- upvalues: DelayedThread (ref)
			if DelayedThread ~= nil then
				task.cancel(DelayedThread)
			end
		end
	end, { Current, Delay })
	local UseAppPolicyResult = if FFlagLuaAppParentUpsellPolicy then UseAppPolicyFunction(function(p4)
		return p4.getShouldShowVpcPlayButtonUpsells()
	end) else nil
	local v1 = nil
	
	if FFlagLuaAppSupportDisablePlayableWhenLoading then
		local UseAppPolicyResult1 = UseAppPolicyFunction(function(p4)
			return p4.getDisablePlayableWhenLoading()
		end)
		v1 = FFlagLuaAppDisablePlayableWhenLoadingForce or UseAppPolicyResult1
	end
	local UseCurrentSquadSelectorResult = if GetFFlagIsSquadEnabledFunction() then UseCurrentSquadSelectorFunction() else nil
	local UseIsExperienceInvitePendingModuleResult = if GetFFlagIsSquadEnabledFunction() then UseIsExperienceInvitePendingModule() else nil
	local UseSelectorResult = UseSelectorFunction(function(p4)
		-- upvalues: Current (copy)
		return p4.PlayabilityStatus and p4.PlayabilityStatus[Current] or nil
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p4)
		-- upvalues: FetchGamePlayButtonDataModule (upval), Current (copy), FFlagLuaAppEnablePlayableStateWhenLoading (upval), p2 (copy), FFlagLuaAppSupportDisablePlayableWhenLoading (upval), v1 (ref), GetFFlagIsSquadEnabledFunction (upval), UseCurrentSquadSelectorResult (copy), UseIsExperienceInvitePendingModuleResult (copy), PlayButtonStatesModule (upval), ApiPostPreparePurchaseModule (upval), RetrievalStatus (upval), FetchGamePlayabilityAndProductInfo (upval), GamesProductInfoReducer (upval), selectPlayButtonState (upval), UseSelectorResult (copy), FFlagLuaAppParentUpsellPolicy (upval), UseAppPolicyResult (ref)
		if FetchGamePlayButtonDataModule.IsLoading(p4, Current) then
			return if FFlagLuaAppEnablePlayableStateWhenLoading and (p2 and (not FFlagLuaAppSupportDisablePlayableWhenLoading or not v1)) then if GetFFlagIsSquadEnabledFunction() and UseCurrentSquadSelectorResult and #UseCurrentSquadSelectorResult.members > 1 then if UseIsExperienceInvitePendingModuleResult then PlayButtonStatesModule.WaitingForParty else PlayButtonStatesModule.PlayableWithParty else PlayButtonStatesModule.Playable else PlayButtonStatesModule.Loading
		elseif ApiPostPreparePurchaseModule.GetFetchingStatus(p4, Current) == RetrievalStatus.Fetching then
			return PlayButtonStatesModule.Loading
		else
			local FetchingStatus = FetchGamePlayabilityAndProductInfo.GetFetchingStatus(p4, Current)
			local v2 = p4[GamesProductInfoReducer.key] and p4[GamesProductInfoReducer.key][Current] or nil
			
			return if GetFFlagIsSquadEnabledFunction() then selectPlayButtonState(FetchingStatus, UseSelectorResult, v2, UseCurrentSquadSelectorResult, UseIsExperienceInvitePendingModuleResult, p4.GameDetails[Current], if FFlagLuaAppParentUpsellPolicy then UseAppPolicyResult else nil) else selectPlayButtonState(FetchingStatus, UseSelectorResult, v2, nil, nil, nil, if FFlagLuaAppParentUpsellPolicy then UseAppPolicyResult else nil)
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
		local UseResult = ReactModule.useCallback(function(EndReason)
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
		ReactModule.useEffect(function()
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
		ReactModule.useEffect(function()
			-- upvalues: UseResult (copy)
			return function()
				-- upvalues: UseResult (upval)
				UseResult("unmounted")
			end
		end, { UseResult })
	end
	return {
		playButtonState = UseSelectorResult1,
		playabilityStatus = UseSelectorResult
	}
end