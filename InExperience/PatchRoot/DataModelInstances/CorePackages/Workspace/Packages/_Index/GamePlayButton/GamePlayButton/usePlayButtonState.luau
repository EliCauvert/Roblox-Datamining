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

local function selectPlayButtonState(p0, p1, p2, p3, p4, p5, p6) --[[ line: 46 ]]
	-- upvalues: retrievalStatus (ref), playButtonStatesModule (ref), playabilityStatusEnum (ref), fFlagLuaAppPlayButtonAmpAgeCheckFlow (ref), fFlagLuaAppParentUpsellPolicy (ref), fFlagLuaAppParentApprovedExperiences (ref), getFFlagIsSquadEnabled (ref)
	local _ = nil
	local var8 = if p0 ~= retrievalStatus.Done or p1 == nil then if p1.isPlayable == true then playButtonStatesModule.Playable elseif p1.playabilityStatus == playabilityStatusEnum.PurchaseRequired and p2 ~= nil and p2.isForSale == true then playButtonStatesModule.PaidAccess elseif p1.playabilityStatus == playabilityStatusEnum.FiatPurchaseRequired and p2 ~= nil and p2.isForSale == true then playButtonStatesModule.FiatPaidAccess elseif fFlagLuaAppPlayButtonAmpAgeCheckFlow and (p1.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser or (if fFlagLuaAppParentUpsellPolicy then p6 else true) and (p1.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls or fFlagLuaAppParentApprovedExperiences and p1.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityRequireParentApproval) or p1.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityAgeCheckRequired) then playButtonStatesModule.ActionNeeded elseif not fFlagLuaAppPlayButtonAmpAgeCheckFlow and p1.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityUnverifiedSeventeenPlusUser then if fFlagLuaAppPlayButtonAmpAgeCheckFlow or not (if fFlagLuaAppParentUpsellPolicy then p6 else true) or p1.playabilityStatus ~= playabilityStatusEnum.ContextualPlayabilityAgeRecommendationParentalControls and (not fFlagLuaAppParentApprovedExperiences or p1.playabilityStatus ~= playabilityStatusEnum.ContextualPlayabilityRequireParentApproval) then playButtonStatesModule.UnplayableOther else playButtonStatesModule.ActionNeeded else playButtonStatesModule.ActionNeeded else playButtonStatesModule.Playable
	
	if getFFlagIsSquadEnabled() and var8 == playButtonStatesModule.Playable and (p3 and #p3.members > 1) and (not p5 or not p5.maxPlayers or p5.maxPlayers > 1) then
		if p4 then
			return playButtonStatesModule.WaitingForParty
		end
		var8 = playButtonStatesModule.PlayableWithParty
	end
	return var8
end

local function _(p7, p8) --[[ line: 131 | named "selectSecondaryPlayButtonState" ]]
	-- upvalues: playButtonStatesModule (ref), playabilityStatusEnum (ref)
	return if p8 == nil then nil elseif (if p7 ~= playButtonStatesModule.PaidAccess then if p7 ~= playButtonStatesModule.FiatPaidAccess then p8.playabilityStatus == playabilityStatusEnum.FiatPurchaseDeviceRestricted or (p8.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityRegionalAvailability and p7 == playButtonStatesModule.UnplayableOther) else true else true) and p8.demoModeAvailable then playButtonStatesModule.DemoMode else nil
end

return function(p9, p10, p11, p12, p13, p14) --[[ line: 154 ]]
	-- upvalues: useDispatch (ref), reactModule (ref), fetchGamePlayButtonDataModule (ref), fFlagLuaAppParentUpsellPolicy (ref), useAppPolicy (ref), fFlagLuaAppSupportDisablePlayableWhenLoading (ref), fFlagLuaAppDisablePlayableWhenLoadingForce (ref), getFFlagIsSquadEnabled (ref), useCurrentSquadSelector (ref), useIsExperienceInvitePendingModule (ref), useSelector (ref), fFlagLuaAppEnablePlayableStateWhenLoading (ref), playButtonStatesModule (ref), apiPostPreparePurchaseModule (ref), retrievalStatus (ref), fetchGamePlayabilityAndProductInfo (ref), gamesProductInfoReducer (ref), selectPlayButtonState (ref), fFlagLuaAppPlayButtonLoadingDurationTelemetry (ref), useRouteName (ref), sendPlayButtonLoadingDuration (ref), playabilityStatusEnum (ref)
	local var9 = useDispatch()
	reactModule.useEffect(function() --[[ line: 164 ]]
		-- upvalues: p11 (ref), var9 (ref), fetchGamePlayButtonDataModule (copy), p9 (ref), p10 (ref)
		local delayedThread = nil
		
		if p11 == nil or p11 <= 0 then
			var9(fetchGamePlayButtonDataModule.Fetch(p9, p10))
		else
			delayedThread = task.delay(p11, function() --[[ line: 167 ]]
				-- upvalues: delayedThread (write), var9 (copy), fetchGamePlayButtonDataModule (copy), p9 (copy), p10 (copy)
				delayedThread = nil
				var9(fetchGamePlayButtonDataModule.Fetch(p9, p10))
			end)
		end
		return function() --[[ line: 175 ]]
			-- upvalues: delayedThread (write)
			if delayedThread ~= nil then
				task.cancel(delayedThread)
			end
		end
	end, { p10, p11 })
	local var10 = if fFlagLuaAppParentUpsellPolicy then useAppPolicy(function(p15) --[[ line: 184 ]]
		return p15.getShouldShowVpcPlayButtonUpsells()
	end) else nil
	local var11 = if fFlagLuaAppSupportDisablePlayableWhenLoading then fFlagLuaAppDisablePlayableWhenLoadingForce or useAppPolicy(function(p16) --[[ line: 191 ]]
		return p16.getDisablePlayableWhenLoading()
	end) else nil
	local var12 = if getFFlagIsSquadEnabled() then useCurrentSquadSelector() else nil
	local var13 = if getFFlagIsSquadEnabled() then useIsExperienceInvitePendingModule() else nil
	local var14 = useSelector(function(p17) --[[ line: 200 ]]
		-- upvalues: p10 (ref)
		return if p17.PlayabilityStatus then p17.PlayabilityStatus[p10] else nil
	end)
	local var15 = useSelector(function(p18) --[[ line: 203 ]]
		-- upvalues: fetchGamePlayButtonDataModule (copy), p10 (ref), fFlagLuaAppEnablePlayableStateWhenLoading (copy), p12 (ref), fFlagLuaAppSupportDisablePlayableWhenLoading (copy), var11 (write), getFFlagIsSquadEnabled (copy), var12 (ref), var13 (ref), playButtonStatesModule (copy), apiPostPreparePurchaseModule (copy), retrievalStatus (copy), fetchGamePlayabilityAndProductInfo (copy), gamesProductInfoReducer (copy), selectPlayButtonState (copy), var14 (ref), fFlagLuaAppParentUpsellPolicy (copy), var10 (write)
		if fetchGamePlayButtonDataModule.IsLoading(p18, p10) then
			return if fFlagLuaAppEnablePlayableStateWhenLoading then if p12 and (not fFlagLuaAppSupportDisablePlayableWhenLoading or not var11) then if getFFlagIsSquadEnabled() and var12 and #var12.members > 1 then if var13 then playButtonStatesModule.WaitingForParty else playButtonStatesModule.PlayableWithParty else playButtonStatesModule.Playable else playButtonStatesModule.Loading else playButtonStatesModule.Loading
		elseif apiPostPreparePurchaseModule.GetFetchingStatus(p18, p10) == retrievalStatus.Fetching then
			return playButtonStatesModule.Loading
		end
		local fetchingStatus = fetchGamePlayabilityAndProductInfo.GetFetchingStatus(p18, p10)
		local var26 = if p18[gamesProductInfoReducer.key] then p18[gamesProductInfoReducer.key][p10] else nil
		
		return if getFFlagIsSquadEnabled() then selectPlayButtonState(fetchingStatus, var14, var26, var12, var13, p18.GameDetails[p10], if fFlagLuaAppParentUpsellPolicy then var10 else nil) else selectPlayButtonState(fetchingStatus, var14, var26, nil, nil, nil, if fFlagLuaAppParentUpsellPolicy then var10 else nil)
	end)
	
	if fFlagLuaAppPlayButtonLoadingDurationTelemetry then
		local var16 = useRouteName()
		local var17 = reactModule.useRef(nil)
		local var18 = reactModule.useRef(nil)
		local var19 = reactModule.useRef(nil)
		local var20 = reactModule.useRef(nil)
		local var21 = reactModule.useRef(var15)
		var21.current = var15
		local var22 = reactModule.useRef(var14)
		var22.current = var14
		local var23 = reactModule.useCallback(function(p19) --[[ line: 277 ]]
			-- upvalues: var17 (ref), var18 (ref), var19 (ref), sendPlayButtonLoadingDuration (copy), var21 (ref), var22 (ref), var20 (ref)
			local current = var17.current
			local current_1 = var18.current
			local current_2 = var19.current
			
			if current and current_1 then
				var17.current = nil
				var18.current = nil
				sendPlayButtonLoadingDuration({
					universeId = current_1,
					durationMs = math.floor((os.clock() - current) * 1000),
					endReason = p19,
					endPlayButtonState = var21.current,
					endPlayabilityStatus = if var22.current then var22.current.playabilityStatus else nil,
					pageName = var20.current
				}, current_2)
				var19.current = nil
				var20.current = nil
				
				return
			end
		end, {})
		reactModule.useEffect(function() --[[ line: 304 ]]
			-- upvalues: var15 (ref), playButtonStatesModule (copy), p13 (ref), var17 (ref), var18 (ref), p10 (ref), var19 (ref), p14 (ref), var20 (ref), var16 (ref), var23 (ref)
			if var15 == playButtonStatesModule.Loading then
				if not p13 then return end
				if not var17.current then
					var17.current = os.clock()
					var18.current = p10
					var19.current = p14
					var20.current = var16
					
					return
				elseif var18.current == p10 then
					return
				else
					var23("universeChanged")
					var17.current = os.clock()
					var18.current = p10
					var19.current = p14
					var20.current = var16
					
					return
				end
			else
				var23("stateChanged")
			end
		end, {
			var15, var23, p10, p13, p14, var16
		})
		reactModule.useEffect(function() --[[ line: 336 ]]
			-- upvalues: var23 (ref)
			return function() --[[ line: 337 ]]
				-- upvalues: var23 (copy)
				var23("unmounted")
			end
		end, { var23 })
	end
	return {
		playButtonState = var15,
		secondaryPlayButtonState = if var14 == nil then nil elseif (if var15 ~= playButtonStatesModule.PaidAccess then if var15 ~= playButtonStatesModule.FiatPaidAccess then var14.playabilityStatus == playabilityStatusEnum.FiatPurchaseDeviceRestricted or (var14.playabilityStatus == playabilityStatusEnum.ContextualPlayabilityRegionalAvailability and var15 == playButtonStatesModule.UnplayableOther) else true else true) and var14.demoModeAvailable then playButtonStatesModule.DemoMode else nil,
		playabilityStatus = var14
	}
end