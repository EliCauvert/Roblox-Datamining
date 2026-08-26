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
local var1 = if fFlagLuaAppIedpOverlayAndNavigationFix then "InExperienceDetailsPromptClose" else nil

local function _(p1, p2)
	-- upvalues: dataHydrationModule (ref), enumGameDetailErrorTypes (ref)
	return if p1 == dataHydrationModule.DataStatus.Failed then enumGameDetailErrorTypes.NetworkError elseif p2 and p2.isUnavailable == true then enumGameDetailErrorTypes.ExperienceUnavailable else nil
end

return function(p1)
	-- upvalues: game (ref), signalsReactModule (ref), dataHydrationModule (ref), enumGameDetailErrorTypes (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), reactModule (ref), fireInExperienceDetailsPromptClosedEvent (ref), fireInExperienceDetailsPromptPlayButtonClickedEvent (ref), fFlagLuaAppIedpOverlayAndNavigationFix (ref), var1 (ref), discoveryEventErrorLogger (ref), contextActionService (ref), fireInExperienceDetailsPromptLoadedEvent (ref), inExperienceDetailsPromptModule (ref), votesUtils (ref), fFlagLuaAppIedpFixPlayButton (ref)
	local gameInfoStore = game.getGameInfoStore(false)
	local ageRecommendationStore = game.getAgeRecommendationStore(false)
	local playabilityStore = game.getPlayabilityStore(false)
	local votesStore = game.getVotesStore(false)
	local andFetchGameInfo = gameInfoStore.getAndFetchGameInfo(p1.universeId)
	local andFetchAgeRecommendation = ageRecommendationStore.getAndFetchAgeRecommendation(p1.universeId)
	local andFetchPlayability = playabilityStore.getAndFetchPlayability(p1.universeId)
	local andFetchVote = votesStore.getAndFetchVote(p1.universeId)
	local var2 = signalsReactModule.useSignalState(andFetchGameInfo.data)
	local var3 = signalsReactModule.useSignalState(andFetchAgeRecommendation.data)
	local var4 = signalsReactModule.useSignalState(andFetchPlayability.data)
	local var5 = signalsReactModule.useSignalState(andFetchVote.data)
	local var6 = signalsReactModule.useSignalState(andFetchGameInfo.status)
	local var7 = signalsReactModule.useSignalState(andFetchPlayability.status)
	local var8 = if var2 and var2.rootPlaceId then tonumber(var2.rootPlaceId) else nil
	local var9 = if var6 == dataHydrationModule.DataStatus.Failed then enumGameDetailErrorTypes.NetworkError elseif var2 and var2.isUnavailable == true then enumGameDetailErrorTypes.ExperienceUnavailable else nil
	local var10 = useFocusRoot({
		isIsolated = true,
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
	})
	local var11 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var8 (ref), fireInExperienceDetailsPromptClosedEvent (copy), var6 (ref), dataHydrationModule (copy), var7 (ref), var4 (ref), var9 (ref), fireInExperienceDetailsPromptPlayButtonClickedEvent (copy)
		if p1.onJoin then
			p1.onJoin(var8)
		end
		if var8 then
			fireInExperienceDetailsPromptClosedEvent({
				targetUniverseId = p1.universeId,
				targetRootPlaceId = var8,
				closeReason = Enum.PromptExperienceDetailsResult.TeleportAttempted.Name,
				isFullyLoaded = var6 ~= dataHydrationModule.DataStatus.NotReady and var7 ~= dataHydrationModule.DataStatus.NotReady,
				isPlayable = var4 and var4.isPlayable,
				playabilityStatus = var4 and var4.playabilityStatus,
				gameInfoErrorType = var9
			})
		end
		fireInExperienceDetailsPromptPlayButtonClickedEvent({
			targetUniverseId = p1.universeId,
			targetRootPlaceId = var8,
			playabilityRetrievalStatus = var7
		})
	end, {
		p1.onClose, var8, p1.universeId, var6, var7, var4, var9, p1.onJoin
	})
	local isPlayable = var4 and var4.isPlayable
	local playabilityStatus = var4 and var4.playabilityStatus
	local var12 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), fireInExperienceDetailsPromptClosedEvent (copy), var8 (ref), var9 (ref), isPlayable (ref), playabilityStatus (ref), var6 (ref), dataHydrationModule (copy), var7 (ref)
		p1.onClose()
		fireInExperienceDetailsPromptClosedEvent({
			targetUniverseId = p1.universeId,
			targetRootPlaceId = var8,
			gameInfoErrorType = var9,
			closeReason = Enum.PromptExperienceDetailsResult.PromptClosed.Name,
			isPlayable = isPlayable,
			playabilityStatus = playabilityStatus,
			isFullyLoaded = var6 ~= dataHydrationModule.DataStatus.NotReady and var7 ~= dataHydrationModule.DataStatus.NotReady
		})
	end, {
		p1.onClose, p1.universeId, var8, var9, isPlayable, playabilityStatus, var6,
		var7
	})
	local var13 = nil
	
	if fFlagLuaAppIedpOverlayAndNavigationFix then
		var13 = reactModule.useRef(nil)
		reactModule.useEffect(function()
			-- upvalues: var1 (copy), var13 (write), discoveryEventErrorLogger (copy), p1 (ref), contextActionService (copy)
			contextActionService:BindCoreAction(var1, function(p2, p3)
				-- upvalues: var1 (copy), var13 (copy), discoveryEventErrorLogger (copy), p1 (copy)
				if p2 == var1 and p3 == Enum.UserInputState.Begin then
					if var13.current and var13.current.close then
						var13.current.close()
					else
						discoveryEventErrorLogger.reportError("InExperienceDetailsPromptCloseError", "SheetRef containing close function is not defined", { sheetRef = var13, universeId = p1.universeId })
					end
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape, Enum.KeyCode.ButtonStart)
			
			return function()
				-- upvalues: contextActionService (copy), var1 (copy)
				contextActionService:UnbindCoreAction(var1)
			end
		end, { p1.universeId })
	end
	local var14 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), var6 (ref), dataHydrationModule (copy), var7 (ref), fireInExperienceDetailsPromptLoadedEvent (copy), p1 (ref), var8 (ref), isPlayable (ref), playabilityStatus (ref), var9 (ref)
		if not var14.current and var6 ~= dataHydrationModule.DataStatus.NotReady and var7 ~= dataHydrationModule.DataStatus.NotReady then
			fireInExperienceDetailsPromptLoadedEvent({
				targetUniverseId = p1.universeId,
				gameInfoRetrievalStatus = var6,
				playabilityRetrievalStatus = var7,
				targetRootPlaceId = var8,
				isPlayable = isPlayable,
				playabilityStatus = playabilityStatus,
				gameInfoErrorType = var9
			})
			var14.current = true
		end
	end, {
		p1.universeId, var6, var7, var8, isPlayable, playabilityStatus, var9
	})
	
	return reactModule.createElement(inExperienceDetailsPromptModule, {
		name = var2 and var2.name,
		imageUri = var2 and `rbxthumb://type=GameIcon&id={p1.universeId}&w=150&h=150`,
		creator = var2 and var2.creator,
		ageRecommendation = var3,
		rating = var5 and votesUtils.getRatingDisplayText(var5),
		playability = var4,
		errorType = var9,
		rootPlaceId = if fFlagLuaAppIedpFixPlayButton then var8 else nil,
		onJoin = var11,
		onClose = var12,
		focusRootRef = var10,
		sheetRef = if fFlagLuaAppIedpOverlayAndNavigationFix then var13 else nil,
		playabilityRetrievalStatus = var7
	})
end