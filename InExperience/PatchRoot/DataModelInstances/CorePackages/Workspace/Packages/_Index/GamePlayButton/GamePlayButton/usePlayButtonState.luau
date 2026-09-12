local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local playButtonStatesModule = require(gamePlayButton.PlayButtonStates)
local fetchGamePlayButtonDataModule = require(gamePlayButton.FetchGamePlayButtonData)
local apiPostPreparePurchaseModule = require(gamePlayButton.ApiPostPreparePurchase)
local parent = gamePlayButton.Parent
local fFlagEnableGameJoinEarlyAccess = require(parent.SharedFlags).FFlagEnableGameJoinEarlyAccess
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local reactModule = require(parent.React)
local _ = require(parent.PlayabilityRodux)
local playabilityStatusEnum = require(parent.DiscoveryTypes).PlayabilityStatusEnum
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local roactUtilsModule = require(parent.RoactUtils)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local fetchGamePlayabilityAndProductInfo = require(parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local gamesProductInfoReducer = require(parent.GameProductInfoRodux).GamesProductInfoReducer
local useCurrentSquadSelector = require(parent.RoduxSquads).Hooks.useCurrentSquadSelector
local useIsExperienceInvitePendingModule = require(parent.Squads.useIsExperienceInvitePending)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useRouteName = require(parent.Navigation).useRouteName
local sendPlayButtonLoadingDuration = require(parent.DiscoveryAnalytics).Events.sendPlayButtonLoadingDuration
local fFlagLuaAppParentUpsellPolicy = require(parent.SharedFlags).FFlagLuaAppParentUpsellPolicy
local fFlagLuaAppEnablePlayableStateWhenLoading = require(parent.SharedFlags).FFlagLuaAppEnablePlayableStateWhenLoading
local fFlagLuaAppSupportDisablePlayableWhenLoading = require(parent.SharedFlags).FFlagLuaAppSupportDisablePlayableWhenLoading
local fFlagLuaAppDisablePlayableWhenLoadingForce = require(parent.SharedFlags).FFlagLuaAppDisablePlayableWhenLoadingForce
local fFlagLuaAppPlayButtonAmpAgeCheckFlow = require(parent.SharedFlags).FFlagLuaAppPlayButtonAmpAgeCheckFlow
local fFlagLuaAppParentApprovedExperiences = require(parent.SharedFlags).FFlagLuaAppParentApprovedExperiences
local fFlagLuaAppPlayButtonLoadingDurationTelemetry = require(parent.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry
local fFlagLuaAppPlayButtonPrivatePT = require(parent.SharedFlags).FFlagLuaAppPlayButtonPrivatePT

local function selectPlayButtonState(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: retrievalStatus (ref), playButtonStatesModule (ref), playabilityStatusEnum (ref), fFlagLuaAppPlayButtonAmpAgeCheckFlow (ref), fFlagLuaAppParentUpsellPolicy (ref), fFlagLuaAppParentApprovedExperiences (ref), fFlagEnableGameJoinEarlyAccess (ref), getFFlagIsSquadEnabled (ref)
	local _ = nil
	local var1 = if p1 ~= retrievalStatus.Done or p2 == nil then if p2.isPlayable == true then playButtonStatesModule.Playable elseif p2.playabilityStatus == playabilityStatusEnum.PurchaseRequired and p3 ~= nil and p3.isForSale == true then playButtonStatesModule.PaidAccess elseif p2.playabilityStatus == playabilityStatusEnum.FiatPurchaseRequired and p3 ~= nil and p3.isForSale == true then playButtonStatesModule.FiatPaidAccess elseif fFlagLuaAppPlayButtonAmpAgeCheckFlow and (p2.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser or (if fFlagLuaAppParentUpsellPolicy then p7 else true) and (p2.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls or fFlagLuaAppParentApprovedExperiences and p2.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityRequireParentApproval) or p2.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityAgeCheckRequired) then playButtonStatesModule.ActionNeeded elseif not fFlagLuaAppPlayButtonAmpAgeCheckFlow and p2.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser then if not fFlagLuaAppPlayButtonAmpAgeCheckFlow and (if fFlagLuaAppParentUpsellPolicy then p7 else true) and (p2.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls or fFlagLuaAppParentApprovedExperiences and p2.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityRequireParentApproval) then if fFlagEnableGameJoinEarlyAccess and p8 and p2.playabilityStatus == playabilityStatusEnum.PlusSubscriptionRequired then playButtonStatesModule.EarlyAccessLocked else playButtonStatesModule.UnplayableOther else playButtonStatesModule.ActionNeeded else playButtonStatesModule.ActionNeeded else playButtonStatesModule.Playable
	
	if getFFlagIsSquadEnabled() and var1 == playButtonStatesModule.Playable and (p4 and #p4.members > 1) and (not p6 or not p6.maxPlayers or p6.maxPlayers > 1) then
		if p5 then
			return playButtonStatesModule.WaitingForParty
		end
		var1 = playButtonStatesModule.PlayableWithParty
	end
	return var1
end

local function _(p1)
	-- upvalues: playabilityStatusEnum (ref), fFlagLuaAppPlayButtonAmpAgeCheckFlow (ref), fFlagLuaAppParentApprovedExperiences (ref)
	local var1 = true
	
	if p1.playabilityStatus ~= playabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser then
		if fFlagLuaAppPlayButtonAmpAgeCheckFlow then
			var1 = true
			
			if p1.playabilityStatus ~= playabilityStatusEnum.ContextualPlayabilityAgeCheckRequired then
				var1 = if p1.playabilityStatus ~= playabilityStatusEnum.ContextualPlayabilityTrustedFriendRequired then if p1.playabilityStatus ~= playabilityStatusEnum.ContextualPlayabilityPlaytestDisabled then fFlagLuaAppParentApprovedExperiences and p1.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityRequireParentApproval else true else true
			end
		end
	end
	return var1
end

local function selectSecondaryPlayButtonState(p1, p2)
	-- upvalues: playButtonStatesModule (ref), playabilityStatusEnum (ref), fFlagLuaAppPlayButtonPrivatePT (ref), fFlagLuaAppPlayButtonAmpAgeCheckFlow (ref), fFlagLuaAppParentApprovedExperiences (ref)
	if p2 == nil then
		return nil
	elseif (if p1 ~= playButtonStatesModule.PaidAccess then if p1 ~= playButtonStatesModule.FiatPaidAccess then p2.playabilityStatus == playabilityStatusEnum.FiatPurchaseDeviceRestricted or (p2.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityRegionalAvailability and p1 == playButtonStatesModule.UnplayableOther) else true else true) and p2.demoModeAvailable then
		return playButtonStatesModule.DemoMode
	elseif fFlagLuaAppPlayButtonPrivatePT and p2.privatePlaytestInfo ~= nil then
		local privatePlaytestInfo = p2.privatePlaytestInfo
		local var1 = true
		
		if privatePlaytestInfo.playabilityStatus ~= playabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser then
			if fFlagLuaAppPlayButtonAmpAgeCheckFlow then
				var1 = true
				
				if privatePlaytestInfo.playabilityStatus ~= playabilityStatusEnum.ContextualPlayabilityAgeCheckRequired then
					var1 = if privatePlaytestInfo.playabilityStatus ~= playabilityStatusEnum.ContextualPlayabilityTrustedFriendRequired then if privatePlaytestInfo.playabilityStatus ~= playabilityStatusEnum.ContextualPlayabilityPlaytestDisabled then fFlagLuaAppParentApprovedExperiences and privatePlaytestInfo.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityRequireParentApproval else true else true
				end
			end
		end
		return if p1 == playButtonStatesModule.ActionNeeded then nil elseif privatePlaytestInfo.isPlayable or var1 then playButtonStatesModule.Playtest else nil
	end
end

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: useDispatch (ref), reactModule (ref), fetchGamePlayButtonDataModule (ref), fFlagLuaAppParentUpsellPolicy (ref), useAppPolicy (ref), fFlagLuaAppSupportDisablePlayableWhenLoading (ref), fFlagLuaAppDisablePlayableWhenLoadingForce (ref), getFFlagIsSquadEnabled (ref), useCurrentSquadSelector (ref), useIsExperienceInvitePendingModule (ref), useSelector (ref), fFlagEnableGameJoinEarlyAccess (ref), gamePlayButton (ref), fFlagLuaAppEnablePlayableStateWhenLoading (ref), playButtonStatesModule (ref), apiPostPreparePurchaseModule (ref), retrievalStatus (ref), fetchGamePlayabilityAndProductInfo (ref), gamesProductInfoReducer (ref), selectPlayButtonState (ref), fFlagLuaAppPlayButtonLoadingDurationTelemetry (ref), useRouteName (ref), sendPlayButtonLoadingDuration (ref), selectSecondaryPlayButtonState (ref)
	local var1 = useDispatch()
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), var1 (ref), fetchGamePlayButtonDataModule (copy), p1 (ref), p2 (ref)
		local delayedThread = nil
		
		if p3 == nil or p3 <= 0 then
			var1(fetchGamePlayButtonDataModule.Fetch(p1, p2))
		else
			delayedThread = task.delay(p3, function()
				-- upvalues: delayedThread (write), var1 (copy), fetchGamePlayButtonDataModule (copy), p1 (copy), p2 (copy)
				delayedThread = nil
				var1(fetchGamePlayButtonDataModule.Fetch(p1, p2))
			end)
		end
		return function()
			-- upvalues: delayedThread (write)
			if delayedThread ~= nil then
				task.cancel(delayedThread)
			end
		end
	end, { p2, p3 })
	local var2 = if fFlagLuaAppParentUpsellPolicy then useAppPolicy(function(p8)
		return p8.getShouldShowVpcPlayButtonUpsells()
	end) else nil
	local var3 = if fFlagLuaAppSupportDisablePlayableWhenLoading then fFlagLuaAppDisablePlayableWhenLoadingForce or useAppPolicy(function(p8)
		return p8.getDisablePlayableWhenLoading()
	end) else nil
	local var4 = if getFFlagIsSquadEnabled() then useCurrentSquadSelector() else nil
	local var5 = if getFFlagIsSquadEnabled() then useIsExperienceInvitePendingModule() else nil
	local var6 = useSelector(function(p8)
		-- upvalues: p2 (ref)
		return if p8.PlayabilityStatus then p8.PlayabilityStatus[p2] else nil
	end)
	local var7 = nil
	
	if fFlagEnableGameJoinEarlyAccess then
		var7 = require(gamePlayButton.EarlyAccess.useGameJoinEarlyAccess)(p2, var6)
		local var8 = var7 ~= nil and var7.isPendingUnlock == true
		local var9 = var7 ~= nil and var7.gainedSubscription == true
		reactModule.useEffect(function()
			-- upvalues: var8 (ref), var9 (ref), var1 (ref), fetchGamePlayButtonDataModule (copy), p1 (ref), p2 (ref)
			if var8 or var9 then
				var1(fetchGamePlayButtonDataModule.Fetch(p1, p2, true))
			end
		end, {
			var8,
			if var7 ~= nil then 0 else var7.unlockRefetchTick,
			var9,
			p2
		})
	end
	local var10 = useSelector(function(p8)
		-- upvalues: fetchGamePlayButtonDataModule (copy), p2 (ref), fFlagLuaAppEnablePlayableStateWhenLoading (copy), p4 (ref), fFlagLuaAppSupportDisablePlayableWhenLoading (copy), var3 (write), getFFlagIsSquadEnabled (copy), var4 (ref), var5 (ref), playButtonStatesModule (copy), apiPostPreparePurchaseModule (copy), retrievalStatus (copy), fetchGamePlayabilityAndProductInfo (copy), gamesProductInfoReducer (copy), selectPlayButtonState (copy), var6 (ref), fFlagLuaAppParentUpsellPolicy (copy), var2 (write), fFlagEnableGameJoinEarlyAccess (copy), p7 (ref)
		if fetchGamePlayButtonDataModule.IsLoading(p8, p2) then
			return if fFlagLuaAppEnablePlayableStateWhenLoading then if p4 and (not fFlagLuaAppSupportDisablePlayableWhenLoading or not var3) then if getFFlagIsSquadEnabled() and var4 and #var4.members > 1 then if var5 then playButtonStatesModule.WaitingForParty else playButtonStatesModule.PlayableWithParty else playButtonStatesModule.Playable else playButtonStatesModule.Loading else playButtonStatesModule.Loading
		elseif apiPostPreparePurchaseModule.GetFetchingStatus(p8, p2) == retrievalStatus.Fetching then
			return playButtonStatesModule.Loading
		end
		local fetchingStatus = fetchGamePlayabilityAndProductInfo.GetFetchingStatus(p8, p2)
		local var11 = if p8[gamesProductInfoReducer.key] then p8[gamesProductInfoReducer.key][p2] else nil
		
		return if getFFlagIsSquadEnabled() then selectPlayButtonState(fetchingStatus, var6, var11, var4, var5, p8.GameDetails[p2], if fFlagLuaAppParentUpsellPolicy then var2 else nil, if fFlagEnableGameJoinEarlyAccess then p7 else nil) else selectPlayButtonState(fetchingStatus, var6, var11, nil, nil, nil, if fFlagLuaAppParentUpsellPolicy then var2 else nil, if fFlagEnableGameJoinEarlyAccess then p7 else nil)
	end)
	
	if fFlagLuaAppPlayButtonLoadingDurationTelemetry then
		local var11 = useRouteName()
		local var12 = reactModule.useRef(nil)
		local var13 = reactModule.useRef(nil)
		local var14 = reactModule.useRef(nil)
		local var15 = reactModule.useRef(nil)
		local var16 = reactModule.useRef(var10)
		var16.current = var10
		local var17 = reactModule.useRef(var6)
		var17.current = var6
		local var18 = reactModule.useCallback(function(p8)
			-- upvalues: var12 (ref), var13 (ref), var14 (ref), sendPlayButtonLoadingDuration (copy), var16 (ref), var17 (ref), var15 (ref)
			local current = var12.current
			local current_1 = var13.current
			local current_2 = var14.current
			
			if current and current_1 then
				var12.current = nil
				var13.current = nil
				sendPlayButtonLoadingDuration({
					universeId = current_1,
					durationMs = math.floor((os.clock() - current) * 1000),
					endReason = p8,
					endPlayButtonState = var16.current,
					endPlayabilityStatus = if var17.current then var17.current.playabilityStatus else nil,
					pageName = var15.current
				}, current_2)
				var14.current = nil
				var15.current = nil
				
				return
			end
		end, {})
		reactModule.useEffect(function()
			-- upvalues: var10 (ref), playButtonStatesModule (copy), p5 (ref), var12 (ref), var13 (ref), p2 (ref), var14 (ref), p6 (ref), var15 (ref), var11 (ref), var18 (ref)
			if var10 == playButtonStatesModule.Loading then
				if not p5 then return end
				if not var12.current then
					var12.current = os.clock()
					var13.current = p2
					var14.current = p6
					var15.current = var11
					
					return
				elseif var13.current == p2 then
					return
				else
					var18("universeChanged")
					var12.current = os.clock()
					var13.current = p2
					var14.current = p6
					var15.current = var11
					
					return
				end
			else
				var18("stateChanged")
			end
		end, {
			var10, var18, p2, p5, p6, var11
		})
		reactModule.useEffect(function()
			-- upvalues: var18 (ref)
			return function()
				-- upvalues: var18 (copy)
				var18("unmounted")
			end
		end, { var18 })
	end
	return {
		playButtonState = var10,
		secondaryPlayButtonState = selectSecondaryPlayButtonState(var10, var6),
		playabilityStatus = var6,
		earlyAccess = var7
	}
end