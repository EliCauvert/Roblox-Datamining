local TeleportService = game:GetService("TeleportService")
local ContextActionService = game:GetService("ContextActionService")
local Parent = script:FindFirstAncestor("InExperienceDetailsPrompt").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local DataHydrationModule = require(Parent.DataHydration)
local Game1 = DataHydrationModule.Game
local VotesUtils = Game1.VotesUtils
local EnumGameDetailErrorTypes = require(Parent.DiscoveryTypes).EnumGameDetailErrorTypes
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local FireInExperienceDetailsPromptClosedEventFunction = DiscoveryAnalyticsModule.Events.fireInExperienceDetailsPromptClosedEvent
local FireInExperienceDetailsPromptPlayButtonClickedEventFunction = DiscoveryAnalyticsModule.Events.fireInExperienceDetailsPromptPlayButtonClickedEvent
local FireInExperienceDetailsPromptLoadedEventFunction = DiscoveryAnalyticsModule.Events.fireInExperienceDetailsPromptLoadedEvent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local InExperienceDetailsPromptModule = require(script.Parent.InExperienceDetailsPrompt)
local FFlagLuaAppIedpOverlayAndNavigationFix = require(Parent.SharedFlags).FFlagLuaAppIedpOverlayAndNavigationFix
local FFlagLuaAppIedpFixPlayButton = require(Parent.SharedFlags).FFlagLuaAppIedpFixPlayButton
local FFlagLuaAppIedpControlledJoin = require(Parent.SharedFlags).FFlagLuaAppIedpControlledJoin
local InExperienceDetailsPromptClose = if FFlagLuaAppIedpOverlayAndNavigationFix then "InExperienceDetailsPromptClose" else nil

local function _(Failed, p1)
	-- upvalues: DataHydrationModule (copy), EnumGameDetailErrorTypes (copy)
	return if Failed == DataHydrationModule.DataStatus.Failed then EnumGameDetailErrorTypes.NetworkError elseif p1 and p1.isUnavailable == true then EnumGameDetailErrorTypes.ExperienceUnavailable else nil
end

return function(p1)
	-- upvalues: Game1 (copy), SignalsReactModule (copy), DataHydrationModule (copy), EnumGameDetailErrorTypes (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), ReactModule (copy), FFlagLuaAppIedpControlledJoin (copy), FireInExperienceDetailsPromptClosedEventFunction (copy), FireInExperienceDetailsPromptPlayButtonClickedEventFunction (copy), TeleportService (copy), DiscoveryEventErrorLogger (copy), FFlagLuaAppIedpOverlayAndNavigationFix (copy), InExperienceDetailsPromptClose (copy), ContextActionService (copy), FireInExperienceDetailsPromptLoadedEventFunction (copy), InExperienceDetailsPromptModule (copy), VotesUtils (copy), FFlagLuaAppIedpFixPlayButton (copy)
	local AndFetchGameInfo = Game1.getGameInfoStore(false).getAndFetchGameInfo(p1.universeId)
	local AndFetchPlayability = Game1.getPlayabilityStore(false).getAndFetchPlayability(p1.universeId)
	local UseSignalStateResult = SignalsReactModule.useSignalState(AndFetchGameInfo.data)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(Game1.getAgeRecommendationStore(false).getAndFetchAgeRecommendation(p1.universeId).data)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(AndFetchPlayability.data)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(Game1.getVotesStore(false).getAndFetchVote(p1.universeId).data)
	local UseSignalStateResult4 = SignalsReactModule.useSignalState(AndFetchGameInfo.status)
	local UseSignalStateResult5 = SignalsReactModule.useSignalState(AndFetchPlayability.status)
	local Number = if UseSignalStateResult and UseSignalStateResult.rootPlaceId then tonumber(UseSignalStateResult.rootPlaceId) else nil
	local NetworkError = if UseSignalStateResult4 == DataHydrationModule.DataStatus.Failed then EnumGameDetailErrorTypes.NetworkError elseif UseSignalStateResult and UseSignalStateResult.isUnavailable == true then EnumGameDetailErrorTypes.ExperienceUnavailable else nil
	local UseFocusRootResult = UseFocusRootFunction({
		isIsolated = true,
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagLuaAppIedpControlledJoin (upval), p1 (copy), Number (copy), FireInExperienceDetailsPromptClosedEventFunction (upval), UseSignalStateResult4 (copy), DataHydrationModule (upval), UseSignalStateResult5 (copy), UseSignalStateResult2 (copy), NetworkError (copy), FireInExperienceDetailsPromptPlayButtonClickedEventFunction (upval), TeleportService (upval), DiscoveryEventErrorLogger (upval)
		if FFlagLuaAppIedpControlledJoin then
			if p1.onJoin then
				p1.onJoin(Number)
			end
			if Number then
				FireInExperienceDetailsPromptClosedEventFunction({
					targetUniverseId = p1.universeId,
					targetRootPlaceId = Number,
					closeReason = Enum.PromptExperienceDetailsResult.TeleportAttempted.Name,
					isFullyLoaded = UseSignalStateResult4 ~= DataHydrationModule.DataStatus.NotReady and UseSignalStateResult5 ~= DataHydrationModule.DataStatus.NotReady,
					isPlayable = UseSignalStateResult2 and UseSignalStateResult2.isPlayable,
					playabilityStatus = UseSignalStateResult2 and UseSignalStateResult2.playabilityStatus,
					gameInfoErrorType = NetworkError
				})
			end
			FireInExperienceDetailsPromptPlayButtonClickedEventFunction({
				targetUniverseId = p1.universeId,
				targetRootPlaceId = Number,
				playabilityRetrievalStatus = UseSignalStateResult5
			})
			
			return
		else
			if Number then
				p1.onClose()
				TeleportService:PromptExperienceDetailsCompleted(Enum.PromptExperienceDetailsResult.TeleportAttempted)
				TeleportService:Teleport(Number)
				FireInExperienceDetailsPromptClosedEventFunction({
					targetUniverseId = p1.universeId,
					targetRootPlaceId = Number,
					closeReason = Enum.PromptExperienceDetailsResult.TeleportAttempted.Name,
					isFullyLoaded = UseSignalStateResult4 ~= DataHydrationModule.DataStatus.NotReady and UseSignalStateResult5 ~= DataHydrationModule.DataStatus.NotReady,
					isPlayable = UseSignalStateResult2 and UseSignalStateResult2.isPlayable,
					playabilityStatus = UseSignalStateResult2 and UseSignalStateResult2.playabilityStatus,
					gameInfoErrorType = NetworkError
				})
			else
				DiscoveryEventErrorLogger.reportError("InExperienceDetailsPromptContainerOnJoinMissingRootPlaceId", "Missing valid root place id for universe id", { universeId = p1.universeId, rootPlaceId = Number })
			end
			FireInExperienceDetailsPromptPlayButtonClickedEventFunction({
				targetUniverseId = p1.universeId,
				targetRootPlaceId = Number,
				playabilityRetrievalStatus = UseSignalStateResult5
			})
		end
	end, {
		p1.onClose, Number, p1.universeId, UseSignalStateResult4,
		UseSignalStateResult5, UseSignalStateResult2, NetworkError,
		if FFlagLuaAppIedpControlledJoin then p1.onJoin else nil
	})
	local IsPlayable = UseSignalStateResult2 and UseSignalStateResult2.isPlayable
	local PlayabilityStatus = UseSignalStateResult2 and UseSignalStateResult2.playabilityStatus
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), FFlagLuaAppIedpControlledJoin (upval), TeleportService (upval), FireInExperienceDetailsPromptClosedEventFunction (upval), Number (copy), NetworkError (copy), IsPlayable (copy), PlayabilityStatus (copy), UseSignalStateResult4 (copy), DataHydrationModule (upval), UseSignalStateResult5 (copy)
		p1.onClose()
		
		if not FFlagLuaAppIedpControlledJoin then
			TeleportService:PromptExperienceDetailsCompleted(Enum.PromptExperienceDetailsResult.PromptClosed)
		end
		FireInExperienceDetailsPromptClosedEventFunction({
			targetUniverseId = p1.universeId,
			targetRootPlaceId = Number,
			gameInfoErrorType = NetworkError,
			closeReason = Enum.PromptExperienceDetailsResult.PromptClosed.Name,
			isPlayable = IsPlayable,
			playabilityStatus = PlayabilityStatus,
			isFullyLoaded = UseSignalStateResult4 ~= DataHydrationModule.DataStatus.NotReady and UseSignalStateResult5 ~= DataHydrationModule.DataStatus.NotReady
		})
	end, {
		p1.onClose, p1.universeId, Number, NetworkError, IsPlayable, PlayabilityStatus,
		UseSignalStateResult4, UseSignalStateResult5
	})
	local UseRefResult = nil
	
	if FFlagLuaAppIedpOverlayAndNavigationFix then
		UseRefResult = ReactModule.useRef(nil)
		ReactModule.useEffect(function()
			-- upvalues: InExperienceDetailsPromptClose (upval), UseRefResult (ref), DiscoveryEventErrorLogger (upval), p1 (copy), ContextActionService (upval)
			ContextActionService:BindCoreAction(InExperienceDetailsPromptClose, function(InExperienceDetailsPromptClose1, UserInputState)
				-- upvalues: InExperienceDetailsPromptClose (upval), UseRefResult (upval), DiscoveryEventErrorLogger (upval), p1 (upval)
				if InExperienceDetailsPromptClose1 == InExperienceDetailsPromptClose and UserInputState == Enum.UserInputState.Begin then
					if UseRefResult.current and UseRefResult.current.close then
						UseRefResult.current.close()
					else
						DiscoveryEventErrorLogger.reportError("InExperienceDetailsPromptCloseError", "SheetRef containing close function is not defined", { sheetRef = UseRefResult, universeId = p1.universeId })
					end
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape, Enum.KeyCode.ButtonStart)
			
			return function()
				-- upvalues: ContextActionService (upval), InExperienceDetailsPromptClose (upval)
				ContextActionService:UnbindCoreAction(InExperienceDetailsPromptClose)
			end
		end, { p1.universeId })
	end
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UseSignalStateResult4 (copy), DataHydrationModule (upval), UseSignalStateResult5 (copy), FireInExperienceDetailsPromptLoadedEventFunction (upval), p1 (copy), Number (copy), IsPlayable (copy), PlayabilityStatus (copy), NetworkError (copy)
		if not UseRefResult1.current and UseSignalStateResult4 ~= DataHydrationModule.DataStatus.NotReady and UseSignalStateResult5 ~= DataHydrationModule.DataStatus.NotReady then
			FireInExperienceDetailsPromptLoadedEventFunction({
				targetUniverseId = p1.universeId,
				gameInfoRetrievalStatus = UseSignalStateResult4,
				playabilityRetrievalStatus = UseSignalStateResult5,
				targetRootPlaceId = Number,
				isPlayable = IsPlayable,
				playabilityStatus = PlayabilityStatus,
				gameInfoErrorType = NetworkError
			})
			UseRefResult1.current = true
		end
	end, {
		p1.universeId, UseSignalStateResult4, UseSignalStateResult5, Number,
		IsPlayable, PlayabilityStatus, NetworkError
	})
	
	return ReactModule.createElement(InExperienceDetailsPromptModule, {
		name = UseSignalStateResult and UseSignalStateResult.name,
		imageUri = UseSignalStateResult and `rbxthumb://type=GameIcon&id={p1.universeId}&w=150&h=150`,
		creator = UseSignalStateResult and UseSignalStateResult.creator,
		ageRecommendation = UseSignalStateResult1,
		rating = UseSignalStateResult3 and VotesUtils.getRatingDisplayText(UseSignalStateResult3),
		playability = UseSignalStateResult2,
		errorType = NetworkError,
		rootPlaceId = if FFlagLuaAppIedpFixPlayButton then Number else nil,
		onJoin = UseResult,
		onClose = UseResult1,
		focusRootRef = UseFocusRootResult,
		sheetRef = if FFlagLuaAppIedpOverlayAndNavigationFix then UseRefResult else nil,
		playabilityRetrievalStatus = UseSignalStateResult5
	})
end