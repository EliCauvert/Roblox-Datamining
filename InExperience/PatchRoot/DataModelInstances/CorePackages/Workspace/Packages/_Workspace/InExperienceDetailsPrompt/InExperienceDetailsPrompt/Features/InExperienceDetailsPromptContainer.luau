local contextActionService = game:GetService("ContextActionService")
local parent = script:FindFirstAncestor("InExperienceDetailsPrompt").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local dataHydrationModule = require(parent.DataHydration)
local game = dataHydrationModule.Game
local votesUtils = game.VotesUtils
local enumGameDetailErrorTypes = require(parent.DiscoveryTypes).EnumGameDetailErrorTypes
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local fireInExperienceDetailsPromptClosedEvent = discoveryAnalyticsModule.Events.fireInExperienceDetailsPromptClosedEvent
local fireInExperienceDetailsPromptPlayButtonClickedEvent = discoveryAnalyticsModule.Events.fireInExperienceDetailsPromptPlayButtonClickedEvent
local fireInExperienceDetailsPromptLoadedEvent = discoveryAnalyticsModule.Events.fireInExperienceDetailsPromptLoadedEvent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local inExperienceDetailsPromptModule = require(script.Parent.InExperienceDetailsPrompt)
local fFlagLuaAppIedpOverlayAndNavigationFix = require(parent.SharedFlags).FFlagLuaAppIedpOverlayAndNavigationFix
local fFlagLuaAppIedpFixPlayButton = require(parent.SharedFlags).FFlagLuaAppIedpFixPlayButton
local var7 = if fFlagLuaAppIedpOverlayAndNavigationFix then "InExperienceDetailsPromptClose" else nil

local function _(p0, p1)
	-- upvalues: dataHydrationModule (ref), enumGameDetailErrorTypes (ref)
	return if p0 == dataHydrationModule.DataStatus.Failed then enumGameDetailErrorTypes.NetworkError elseif p1 and p1.isUnavailable == true then enumGameDetailErrorTypes.ExperienceUnavailable else nil
end

return function(p2)
	-- upvalues: game (ref), signalsReactModule (ref), dataHydrationModule (ref), enumGameDetailErrorTypes (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), reactModule (ref), fireInExperienceDetailsPromptClosedEvent (ref), fireInExperienceDetailsPromptPlayButtonClickedEvent (ref), fFlagLuaAppIedpOverlayAndNavigationFix (ref), var7 (ref), discoveryEventErrorLogger (ref), contextActionService (ref), fireInExperienceDetailsPromptLoadedEvent (ref), inExperienceDetailsPromptModule (ref), votesUtils (ref), fFlagLuaAppIedpFixPlayButton (ref)
	local gameInfoStore = game.getGameInfoStore(false)
	local ageRecommendationStore = game.getAgeRecommendationStore(false)
	local playabilityStore = game.getPlayabilityStore(false)
	local votesStore = game.getVotesStore(false)
	local andFetchGameInfo = gameInfoStore.getAndFetchGameInfo(p2.universeId)
	local andFetchAgeRecommendation = ageRecommendationStore.getAndFetchAgeRecommendation(p2.universeId)
	local andFetchPlayability = playabilityStore.getAndFetchPlayability(p2.universeId)
	local andFetchVote = votesStore.getAndFetchVote(p2.universeId)
	local var16 = signalsReactModule.useSignalState(andFetchGameInfo.data)
	local var17 = signalsReactModule.useSignalState(andFetchAgeRecommendation.data)
	local var18 = signalsReactModule.useSignalState(andFetchPlayability.data)
	local var19 = signalsReactModule.useSignalState(andFetchVote.data)
	local var20 = signalsReactModule.useSignalState(andFetchGameInfo.status)
	local var21 = signalsReactModule.useSignalState(andFetchPlayability.status)
	local var22 = if var16 and var16.rootPlaceId then tonumber(var16.rootPlaceId) else nil
	local var23 = if var20 == dataHydrationModule.DataStatus.Failed then enumGameDetailErrorTypes.NetworkError elseif var16 and var16.isUnavailable == true then enumGameDetailErrorTypes.ExperienceUnavailable else nil
	local var24 = useFocusRoot({
		isIsolated = true,
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
	})
	local var25 = reactModule.useCallback(function()
		-- upvalues: p2 (ref), var22 (ref), fireInExperienceDetailsPromptClosedEvent (copy), var20 (ref), dataHydrationModule (copy), var21 (ref), var18 (ref), var23 (ref), fireInExperienceDetailsPromptPlayButtonClickedEvent (copy)
		if p2.onJoin then
			p2.onJoin(var22)
		end
		if var22 then
			fireInExperienceDetailsPromptClosedEvent({
				targetUniverseId = p2.universeId,
				targetRootPlaceId = var22,
				closeReason = Enum.PromptExperienceDetailsResult.TeleportAttempted.Name,
				isFullyLoaded = var20 ~= dataHydrationModule.DataStatus.NotReady and var21 ~= dataHydrationModule.DataStatus.NotReady,
				isPlayable = var18 and var18.isPlayable,
				playabilityStatus = var18 and var18.playabilityStatus,
				gameInfoErrorType = var23
			})
		end
		fireInExperienceDetailsPromptPlayButtonClickedEvent({
			targetUniverseId = p2.universeId,
			targetRootPlaceId = var22,
			playabilityRetrievalStatus = var21
		})
	end, {
		p2.onClose, var22, p2.universeId, var20, var21, var18, var23, p2.onJoin
	})
	local isPlayable = var18 and var18.isPlayable
	local playabilityStatus = var18 and var18.playabilityStatus
	local var28 = reactModule.useCallback(function()
		-- upvalues: p2 (ref), fireInExperienceDetailsPromptClosedEvent (copy), var22 (ref), var23 (ref), isPlayable (ref), playabilityStatus (ref), var20 (ref), dataHydrationModule (copy), var21 (ref)
		p2.onClose()
		fireInExperienceDetailsPromptClosedEvent({
			targetUniverseId = p2.universeId,
			targetRootPlaceId = var22,
			gameInfoErrorType = var23,
			closeReason = Enum.PromptExperienceDetailsResult.PromptClosed.Name,
			isPlayable = isPlayable,
			playabilityStatus = playabilityStatus,
			isFullyLoaded = var20 ~= dataHydrationModule.DataStatus.NotReady and var21 ~= dataHydrationModule.DataStatus.NotReady
		})
	end, {
		p2.onClose, p2.universeId, var22, var23, isPlayable, playabilityStatus, var20,
		var21
	})
	local var29 = nil
	
	if fFlagLuaAppIedpOverlayAndNavigationFix then
		var29 = reactModule.useRef(nil)
		reactModule.useEffect(function()
			-- upvalues: var7 (copy), var29 (write), discoveryEventErrorLogger (copy), p2 (ref), contextActionService (copy)
			contextActionService:BindCoreAction(var7, function(p3, p4)
				-- upvalues: var7 (copy), var29 (copy), discoveryEventErrorLogger (copy), p2 (copy)
				if p3 == var7 and p4 == Enum.UserInputState.Begin then
					if var29.current and var29.current.close then
						var29.current.close()
					else
						discoveryEventErrorLogger.reportError("InExperienceDetailsPromptCloseError", "SheetRef containing close function is not defined", { sheetRef = var29, universeId = p2.universeId })
					end
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape, Enum.KeyCode.ButtonStart)
			
			return function()
				-- upvalues: contextActionService (copy), var7 (copy)
				contextActionService:UnbindCoreAction(var7)
			end
		end, { p2.universeId })
	end
	local var30 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var30 (ref), var20 (ref), dataHydrationModule (copy), var21 (ref), fireInExperienceDetailsPromptLoadedEvent (copy), p2 (ref), var22 (ref), isPlayable (ref), playabilityStatus (ref), var23 (ref)
		if not var30.current and var20 ~= dataHydrationModule.DataStatus.NotReady and var21 ~= dataHydrationModule.DataStatus.NotReady then
			fireInExperienceDetailsPromptLoadedEvent({
				targetUniverseId = p2.universeId,
				gameInfoRetrievalStatus = var20,
				playabilityRetrievalStatus = var21,
				targetRootPlaceId = var22,
				isPlayable = isPlayable,
				playabilityStatus = playabilityStatus,
				gameInfoErrorType = var23
			})
			var30.current = true
		end
	end, {
		p2.universeId, var20, var21, var22, isPlayable, playabilityStatus, var23
	})
	
	return reactModule.createElement(inExperienceDetailsPromptModule, {
		name = var16 and var16.name,
		imageUri = var16 and `rbxthumb://type=GameIcon&id={p2.universeId}&w=150&h=150`,
		creator = var16 and var16.creator,
		ageRecommendation = var17,
		rating = var19 and votesUtils.getRatingDisplayText(var19),
		playability = var18,
		errorType = var23,
		rootPlaceId = if fFlagLuaAppIedpFixPlayButton then var22 else nil,
		onJoin = var25,
		onClose = var28,
		focusRootRef = var24,
		sheetRef = if fFlagLuaAppIedpOverlayAndNavigationFix then var29 else nil,
		playabilityRetrievalStatus = var21
	})
end