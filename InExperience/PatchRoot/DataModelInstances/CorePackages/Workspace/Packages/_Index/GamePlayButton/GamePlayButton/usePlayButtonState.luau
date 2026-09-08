local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local playButtonStatesModule = require(gamePlayButton.PlayButtonStates)
local fetchGamePlayButtonDataModule = require(gamePlayButton.FetchGamePlayButtonData)
local apiPostPreparePurchaseModule = require(gamePlayButton.ApiPostPreparePurchase)
local parent = gamePlayButton.Parent
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

local function selectPlayButtonState(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: retrievalStatus (ref), playButtonStatesModule (ref), playabilityStatusEnum (ref), fFlagLuaAppPlayButtonAmpAgeCheckFlow (ref), fFlagLuaAppParentUpsellPolicy (ref), fFlagLuaAppParentApprovedExperiences (ref), getFFlagIsSquadEnabled (ref)
	local _ = nil
	local var1 = if p1 ~= retrievalStatus.Done or p2 == nil then if p2.isPlayable == true then playButtonStatesModule.Playable elseif p2.playabilityStatus == playabilityStatusEnum.PurchaseRequired and p3 ~= nil and p3.isForSale == true then playButtonStatesModule.PaidAccess elseif p2.playabilityStatus == playabilityStatusEnum.FiatPurchaseRequired and p3 ~= nil and p3.isForSale == true then playButtonStatesModule.FiatPaidAccess elseif fFlagLuaAppPlayButtonAmpAgeCheckFlow and (p2.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser or (if fFlagLuaAppParentUpsellPolicy then p7 else true) and (p2.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls or fFlagLuaAppParentApprovedExperiences and p2.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityRequireParentApproval) or p2.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityAgeCheckRequired) then playButtonStatesModule.ActionNeeded elseif not fFlagLuaAppPlayButtonAmpAgeCheckFlow and p2.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser then if fFlagLuaAppPlayButtonAmpAgeCheckFlow or not (if fFlagLuaAppParentUpsellPolicy then p7 else true) or p2.playabilityStatus ~= playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls and (not fFlagLuaAppParentApprovedExperiences or p2.playabilityStatus ~= playabilityStatusEnum.ContextualPlayabilityRequireParentApproval) then playButtonStatesModule.UnplayableOther else playButtonStatesModule.ActionNeeded else playButtonStatesModule.ActionNeeded else playButtonStatesModule.Playable
	
	if getFFlagIsSquadEnabled() and var1 == playButtonStatesModule.Playable and (p4 and #p4.members > 1) and (not p6 or not p6.maxPlayers or p6.maxPlayers > 1) then
		if p5 then
			return playButtonStatesModule.WaitingForParty
		end
		var1 = playButtonStatesModule.PlayableWithParty
	end
	return var1
end

local function _(p1, p2)
	-- upvalues: playButtonStatesModule (ref), playabilityStatusEnum (ref)
	return if p2 == nil then nil elseif (if p1 ~= playButtonStatesModule.PaidAccess then if p1 ~= playButtonStatesModule.FiatPaidAccess then p2.playabilityStatus == playabilityStatusEnum.FiatPurchaseDeviceRestricted or (p2.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityRegionalAvailability and p1 == playButtonStatesModule.UnplayableOther) else true else true) and p2.demoModeAvailable then playButtonStatesModule.DemoMode else nil
end

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: useDispatch (ref), reactModule (ref), fetchGamePlayButtonDataModule (ref), fFlagLuaAppParentUpsellPolicy (ref), useAppPolicy (ref), fFlagLuaAppSupportDisablePlayableWhenLoading (ref), fFlagLuaAppDisablePlayableWhenLoadingForce (ref), getFFlagIsSquadEnabled (ref), useCurrentSquadSelector (ref), useIsExperienceInvitePendingModule (ref), useSelector (ref), fFlagLuaAppEnablePlayableStateWhenLoading (ref), playButtonStatesModule (ref), apiPostPreparePurchaseModule (ref), retrievalStatus (ref), fetchGamePlayabilityAndProductInfo (ref), gamesProductInfoReducer (ref), selectPlayButtonState (ref), fFlagLuaAppPlayButtonLoadingDurationTelemetry (ref), useRouteName (ref), sendPlayButtonLoadingDuration (ref), playabilityStatusEnum (ref)
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
	local var2 = if fFlagLuaAppParentUpsellPolicy then useAppPolicy(function(p7)
		return p7.getShouldShowVpcPlayButtonUpsells()
	end) else nil
	local var3 = if fFlagLuaAppSupportDisablePlayableWhenLoading then fFlagLuaAppDisablePlayableWhenLoadingForce or useAppPolicy(function(p7)
		return p7.getDisablePlayableWhenLoading()
	end) else nil
	local var4 = if getFFlagIsSquadEnabled() then useCurrentSquadSelector() else nil
	local var5 = if getFFlagIsSquadEnabled() then useIsExperienceInvitePendingModule() else nil
	local var6 = useSelector(function(p7)
		-- upvalues: p2 (ref)
		return if p7.PlayabilityStatus then p7.PlayabilityStatus[p2] else nil
	end)
	local var7 = useSelector(function(p7)
		-- upvalues: fetchGamePlayButtonDataModule (copy), p2 (ref), fFlagLuaAppEnablePlayableStateWhenLoading (copy), p4 (ref), fFlagLuaAppSupportDisablePlayableWhenLoading (copy), var3 (write), getFFlagIsSquadEnabled (copy), var4 (ref), var5 (ref), playButtonStatesModule (copy), apiPostPreparePurchaseModule (copy), retrievalStatus (copy), fetchGamePlayabilityAndProductInfo (copy), gamesProductInfoReducer (copy), selectPlayButtonState (copy), var6 (ref), fFlagLuaAppParentUpsellPolicy (copy), var2 (write)
		if fetchGamePlayButtonDataModule.IsLoading(p7, p2) then
			return if fFlagLuaAppEnablePlayableStateWhenLoading then if p4 and (not fFlagLuaAppSupportDisablePlayableWhenLoading or not var3) then if getFFlagIsSquadEnabled() and var4 and #var4.members > 1 then if var5 then playButtonStatesModule.WaitingForParty else playButtonStatesModule.PlayableWithParty else playButtonStatesModule.Playable else playButtonStatesModule.Loading else playButtonStatesModule.Loading
		elseif apiPostPreparePurchaseModule.GetFetchingStatus(p7, p2) == retrievalStatus.Fetching then
			return playButtonStatesModule.Loading
		end
		local fetchingStatus = fetchGamePlayabilityAndProductInfo.GetFetchingStatus(p7, p2)
		local var8 = if p7[gamesProductInfoReducer.key] then p7[gamesProductInfoReducer.key][p2] else nil
		
		return if getFFlagIsSquadEnabled() then selectPlayButtonState(fetchingStatus, var6, var8, var4, var5, p7.GameDetails[p2], if fFlagLuaAppParentUpsellPolicy then var2 else nil) else selectPlayButtonState(fetchingStatus, var6, var8, nil, nil, nil, if fFlagLuaAppParentUpsellPolicy then var2 else nil)
	end)
	
	if fFlagLuaAppPlayButtonLoadingDurationTelemetry then
		local var8 = useRouteName()
		local var9 = reactModule.useRef(nil)
		local var10 = reactModule.useRef(nil)
		local var11 = reactModule.useRef(nil)
		local var12 = reactModule.useRef(nil)
		local var13 = reactModule.useRef(var7)
		var13.current = var7
		local var14 = reactModule.useRef(var6)
		var14.current = var6
		local var15 = reactModule.useCallback(function(p7)
			-- upvalues: var9 (ref), var10 (ref), var11 (ref), sendPlayButtonLoadingDuration (copy), var13 (ref), var14 (ref), var12 (ref)
			local current = var9.current
			local current_1 = var10.current
			local current_2 = var11.current
			
			if current and current_1 then
				var9.current = nil
				var10.current = nil
				sendPlayButtonLoadingDuration({
					universeId = current_1,
					durationMs = math.floor((os.clock() - current) * 1000),
					endReason = p7,
					endPlayButtonState = var13.current,
					endPlayabilityStatus = if var14.current then var14.current.playabilityStatus else nil,
					pageName = var12.current
				}, current_2)
				var11.current = nil
				var12.current = nil
				
				return
			end
		end, {})
		reactModule.useEffect(function()
			-- upvalues: var7 (ref), playButtonStatesModule (copy), p5 (ref), var9 (ref), var10 (ref), p2 (ref), var11 (ref), p6 (ref), var12 (ref), var8 (ref), var15 (ref)
			if var7 == playButtonStatesModule.Loading then
				if not p5 then return end
				if not var9.current then
					var9.current = os.clock()
					var10.current = p2
					var11.current = p6
					var12.current = var8
					
					return
				elseif var10.current == p2 then
					return
				else
					var15("universeChanged")
					var9.current = os.clock()
					var10.current = p2
					var11.current = p6
					var12.current = var8
					
					return
				end
			else
				var15("stateChanged")
			end
		end, {
			var7, var15, p2, p5, p6, var8
		})
		reactModule.useEffect(function()
			-- upvalues: var15 (ref)
			return function()
				-- upvalues: var15 (copy)
				var15("unmounted")
			end
		end, { var15 })
	end
	return {
		playButtonState = var7,
		secondaryPlayButtonState = if var6 == nil then nil elseif (if var7 ~= playButtonStatesModule.PaidAccess then if var7 ~= playButtonStatesModule.FiatPaidAccess then var6.playabilityStatus == playabilityStatusEnum.FiatPurchaseDeviceRestricted or (var6.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityRegionalAvailability and var7 == playButtonStatesModule.UnplayableOther) else true else true) and var6.demoModeAvailable then playButtonStatesModule.DemoMode else nil,
		playabilityStatus = var6
	}
end