local teleportService = game:GetService("TeleportService")
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
local fFlagLuaAppIedpControlledJoin = require(parent.SharedFlags).FFlagLuaAppIedpControlledJoin
local var8 = if fFlagLuaAppIedpOverlayAndNavigationFix then "InExperienceDetailsPromptClose" else nil

local function _(p0, p1) --[[ line: 45 | named "getGameDetailErrorType" ]]
	-- upvalues: dataHydrationModule (ref), enumGameDetailErrorTypes (ref)
	return if p0 == dataHydrationModule.DataStatus.Failed then enumGameDetailErrorTypes.NetworkError elseif p1 and p1.isUnavailable == true then enumGameDetailErrorTypes.ExperienceUnavailable else nil
end

return function(p2) --[[ line: 60 | named "InExperienceDetailsPromptContainer" ]]
	-- upvalues: game (ref), signalsReactModule (ref), dataHydrationModule (ref), enumGameDetailErrorTypes (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), reactModule (ref), fFlagLuaAppIedpControlledJoin (ref), fireInExperienceDetailsPromptClosedEvent (ref), fireInExperienceDetailsPromptPlayButtonClickedEvent (ref), teleportService (ref), discoveryEventErrorLogger (ref), fFlagLuaAppIedpOverlayAndNavigationFix (ref), var8 (ref), contextActionService (ref), fireInExperienceDetailsPromptLoadedEvent (ref), inExperienceDetailsPromptModule (ref), votesUtils (ref), fFlagLuaAppIedpFixPlayButton (ref)
	local gameInfoStore = game.getGameInfoStore(false)
	local ageRecommendationStore = game.getAgeRecommendationStore(false)
	local playabilityStore = game.getPlayabilityStore(false)
	local votesStore = game.getVotesStore(false)
	local andFetchGameInfo = gameInfoStore.getAndFetchGameInfo(p2.universeId)
	local andFetchAgeRecommendation = ageRecommendationStore.getAndFetchAgeRecommendation(p2.universeId)
	local andFetchPlayability = playabilityStore.getAndFetchPlayability(p2.universeId)
	local andFetchVote = votesStore.getAndFetchVote(p2.universeId)
	local var17 = signalsReactModule.useSignalState(andFetchGameInfo.data)
	local var18 = signalsReactModule.useSignalState(andFetchAgeRecommendation.data)
	local var19 = signalsReactModule.useSignalState(andFetchPlayability.data)
	local var20 = signalsReactModule.useSignalState(andFetchVote.data)
	local var21 = signalsReactModule.useSignalState(andFetchGameInfo.status)
	local var22 = signalsReactModule.useSignalState(andFetchPlayability.status)
	local var23 = if var17 and var17.rootPlaceId then tonumber(var17.rootPlaceId) else nil
	local var24 = if var21 == dataHydrationModule.DataStatus.Failed then enumGameDetailErrorTypes.NetworkError elseif var17 and var17.isUnavailable == true then enumGameDetailErrorTypes.ExperienceUnavailable else nil
	local var25 = useFocusRoot({
		isIsolated = true,
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
	})
	local var26 = reactModule.useCallback(function() --[[ line: 90 ]]
		-- upvalues: fFlagLuaAppIedpControlledJoin (copy), p2 (ref), var23 (ref), fireInExperienceDetailsPromptClosedEvent (copy), var21 (ref), dataHydrationModule (copy), var22 (ref), var19 (ref), var24 (ref), fireInExperienceDetailsPromptPlayButtonClickedEvent (copy), teleportService (copy), discoveryEventErrorLogger (copy)
		if fFlagLuaAppIedpControlledJoin then
			if p2.onJoin then
				p2.onJoin(var23)
			end
			if var23 then
				fireInExperienceDetailsPromptClosedEvent({
					targetUniverseId = p2.universeId,
					targetRootPlaceId = var23,
					closeReason = Enum.PromptExperienceDetailsResult.TeleportAttempted.Name,
					isFullyLoaded = var21 ~= dataHydrationModule.DataStatus.NotReady and var22 ~= dataHydrationModule.DataStatus.NotReady,
					isPlayable = var19 and var19.isPlayable,
					playabilityStatus = var19 and var19.playabilityStatus,
					gameInfoErrorType = var24
				})
			end
			fireInExperienceDetailsPromptPlayButtonClickedEvent({
				targetUniverseId = p2.universeId,
				targetRootPlaceId = var23,
				playabilityRetrievalStatus = var22
			})
			
			return
		elseif var23 then
			p2.onClose()
			teleportService:PromptExperienceDetailsCompleted(Enum.PromptExperienceDetailsResult.TeleportAttempted)
			teleportService:Teleport(var23)
			fireInExperienceDetailsPromptClosedEvent({
				targetUniverseId = p2.universeId,
				targetRootPlaceId = var23,
				closeReason = Enum.PromptExperienceDetailsResult.TeleportAttempted.Name,
				isFullyLoaded = var21 ~= dataHydrationModule.DataStatus.NotReady and var22 ~= dataHydrationModule.DataStatus.NotReady,
				isPlayable = var19 and var19.isPlayable,
				playabilityStatus = var19 and var19.playabilityStatus,
				gameInfoErrorType = var24
			})
		else
			discoveryEventErrorLogger.reportError("InExperienceDetailsPromptContainerOnJoinMissingRootPlaceId", "Missing valid root place id for universe id", { universeId = p2.universeId, rootPlaceId = var23 })
		end
		fireInExperienceDetailsPromptPlayButtonClickedEvent({
			targetUniverseId = p2.universeId,
			targetRootPlaceId = var23,
			playabilityRetrievalStatus = var22
		})
	end, {
		p2.onClose, var23, p2.universeId, var21, var22, var19, var24,
		if fFlagLuaAppIedpControlledJoin then p2.onJoin else nil
	})
	local isPlayable = var19 and var19.isPlayable
	local playabilityStatus = var19 and var19.playabilityStatus
	local var29 = reactModule.useCallback(function() --[[ line: 162 ]]
		-- upvalues: p2 (ref), fFlagLuaAppIedpControlledJoin (copy), teleportService (copy), fireInExperienceDetailsPromptClosedEvent (copy), var23 (ref), var24 (ref), isPlayable (ref), playabilityStatus (ref), var21 (ref), dataHydrationModule (copy), var22 (ref)
		p2.onClose()
		
		if not fFlagLuaAppIedpControlledJoin then
			teleportService:PromptExperienceDetailsCompleted(Enum.PromptExperienceDetailsResult.PromptClosed)
		end
		fireInExperienceDetailsPromptClosedEvent({
			targetUniverseId = p2.universeId,
			targetRootPlaceId = var23,
			gameInfoErrorType = var24,
			closeReason = Enum.PromptExperienceDetailsResult.PromptClosed.Name,
			isPlayable = isPlayable,
			playabilityStatus = playabilityStatus,
			isFullyLoaded = var21 ~= dataHydrationModule.DataStatus.NotReady and var22 ~= dataHydrationModule.DataStatus.NotReady
		})
	end, {
		p2.onClose, p2.universeId, var23, var24, isPlayable, playabilityStatus, var21,
		var22
	})
	local var30 = nil
	
	if fFlagLuaAppIedpOverlayAndNavigationFix then
		var30 = reactModule.useRef(nil)
		reactModule.useEffect(function() --[[ line: 194 ]]
			-- upvalues: var8 (copy), var30 (write), discoveryEventErrorLogger (copy), p2 (ref), contextActionService (copy)
			contextActionService:BindCoreAction(var8, function(p3, p4) --[[ line: 195 ]]
				-- upvalues: var8 (copy), var30 (copy), discoveryEventErrorLogger (copy), p2 (copy)
				if p3 == var8 and p4 == Enum.UserInputState.Begin then
					if var30.current and var30.current.close then
						var30.current.close()
					else
						discoveryEventErrorLogger.reportError("InExperienceDetailsPromptCloseError", "SheetRef containing close function is not defined", { sheetRef = var30, universeId = p2.universeId })
					end
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape, Enum.KeyCode.ButtonStart)
			
			return function() --[[ line: 220 ]]
				-- upvalues: contextActionService (copy), var8 (copy)
				contextActionService:UnbindCoreAction(var8)
			end
		end, { p2.universeId })
	end
	local var31 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 228 ]]
		-- upvalues: var31 (ref), var21 (ref), dataHydrationModule (copy), var22 (ref), fireInExperienceDetailsPromptLoadedEvent (copy), p2 (ref), var23 (ref), isPlayable (ref), playabilityStatus (ref), var24 (ref)
		if not var31.current and var21 ~= dataHydrationModule.DataStatus.NotReady and var22 ~= dataHydrationModule.DataStatus.NotReady then
			fireInExperienceDetailsPromptLoadedEvent({
				targetUniverseId = p2.universeId,
				gameInfoRetrievalStatus = var21,
				playabilityRetrievalStatus = var22,
				targetRootPlaceId = var23,
				isPlayable = isPlayable,
				playabilityStatus = playabilityStatus,
				gameInfoErrorType = var24
			})
			var31.current = true
		end
	end, {
		p2.universeId, var21, var22, var23, isPlayable, playabilityStatus, var24
	})
	
	return reactModule.createElement(inExperienceDetailsPromptModule, {
		name = var17 and var17.name,
		imageUri = var17 and `rbxthumb://type=GameIcon&id={p2.universeId}&w=150&h=150`,
		creator = var17 and var17.creator,
		ageRecommendation = var18,
		rating = var20 and votesUtils.getRatingDisplayText(var20),
		playability = var19,
		errorType = var24,
		rootPlaceId = if fFlagLuaAppIedpFixPlayButton then var23 else nil,
		onJoin = var26,
		onClose = var29,
		focusRootRef = var25,
		sheetRef = if fFlagLuaAppIedpOverlayAndNavigationFix then var30 else nil,
		playabilityRetrievalStatus = var22
	})
end