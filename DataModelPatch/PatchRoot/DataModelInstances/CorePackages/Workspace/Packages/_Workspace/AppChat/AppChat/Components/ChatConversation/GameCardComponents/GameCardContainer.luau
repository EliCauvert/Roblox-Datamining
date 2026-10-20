local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local ConstantsModule = require(AppChat.Constants)
local ConstructGameThumbnailUrlModule = require(AppChat.Utils.constructGameThumbnailUrl)
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local MemoFunction = ReactModule.memo
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseEffectFunction = ReactModule.useEffect
local UseIsExternalNavigationAvailableModule = require(AppChat.Hooks.useIsExternalNavigationAvailable)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseMemoFunction = ReactModule.useMemo
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local Logger = require(Parent.Loggers).Logger
local GameCardContainer1 = Logger.new(Logger, "GameCardContainer")
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local GameParams = require(Parent.ExperienceService).GameParams
local ApiFetchGameDetails = require(Parent.GameDetailRodux).GameDetails.ApiFetchGameDetails
local ApiFetchPlayabilityStatus = require(Parent.PlayabilityRodux).PlayabilityStatus.ApiFetchPlayabilityStatus
local ReportAnEventModule = require(script.Parent.ReportAnEvent)
local AppSessionService = require(Parent.RoactServiceTags).AppSessionService
local SessionType = require(Parent.RobloxAppSessionization).SessionType
local RoactServices = require(Parent.RoactServices).RoactServices
local RoactAnalyticsCommonGameEvents = require(Parent.RoactServiceTags).RoactAnalyticsCommonGameEvents
local GameCardGroupableModule = require(script.Parent.GameCardGroupable)
local DataHydrationModule = require(Parent.DataHydration)
local RoundedVariantModule = require(AppChat.Enums.RoundedVariant)
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local ChatConversationTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local ChatConversationTelemetryEventsModule = require(script.Parent.Parent.ChatConversationTelemetryEvents)
local AppGame = RoactServices.AppGame
local ExperienceService = require(Parent.ExperienceService).ExperienceService
local SetGamePlaySessionFunction = require(Parent.RobloxAppSessionization).SetGamePlaySession
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local HttpRequestModule = require(Parent.HttpRequest)
local EnumScreensModule = require(AppChat.EnumScreens)
local AppChatShutdownBeforeLaunch = game:DefineFastFlag("AppChatShutdownBeforeLaunch", false)
local GetFFlagAppChatHidePlayButtonsInExpModule = require(AppChat.Flags.getFFlagAppChatHidePlayButtonsInExp)
local config = {
	placeId = nil,
	universeId = nil,
	conversationId = nil,
	luaChatPlayTogetherEnabled = nil,
	networkImpl = HttpRequestModule.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: GameCardContainer1 (copy), HttpRequestModule (copy)
			GameCardContainer1:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return HttpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
		end,
		maxRetryCount = if require(Parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("GameCardContainerHttpRetryCount", 4) else nil
	}),
	eventStream = require(Parent.Analytics).AnalyticsReporters.EventStream.new((game:GetService("RbxAnalyticsService"))),
	eventIngest = require(Parent.Analytics).AnalyticsReporters.EventIngest.new((game:GetService("EventIngestService"))),
	onDetailsOpened = function() end,
	onPlayButtonActivated = function(JoinResult)
		-- upvalues: SetGamePlaySessionFunction (copy), SessionType (copy), ReportAnEventModule (copy), CryoModule (copy), GameParams (copy), AppChatShutdownBeforeLaunch (copy), ExperienceService (copy)
		local PlaceId = JoinResult.placeId
		local SenderUserId = JoinResult.senderUserId
		SetGamePlaySessionFunction(JoinResult.sessionService, SessionType.StructuralIdentifier.GamePlayFromChat, true)
		ReportAnEventModule(JoinResult, "clickBtnFromLinkCardInChat", "touch")
		
		if PlaceId then
			local function v37(JoinAttemptId)
				-- upvalues: JoinResult (ref), CryoModule (upval), ReportAnEventModule (upval)
				JoinResult = CryoModule.Dictionary.join(JoinResult, { joinAttemptId = JoinAttemptId })
				ReportAnEventModule(JoinResult, "gamePlayIntent", "PlayGameFromLinkCard")
			end
			
			local FromParamsResult = GameParams.fromParams({ userId = SenderUserId, placeId = PlaceId })
			
			if AppChatShutdownBeforeLaunch then
				game:Shutdown()
			end
			ExperienceService:LaunchExperience(FromParamsResult, "PlayGameFromLinkCard", v37)
		end
	end,
	openDetails = function(JoinResult)
		-- upvalues: ReportAnEventModule (copy)
		local UniverseId = JoinResult.universeId
		local PlaceId = JoinResult.placeId
		ReportAnEventModule(JoinResult, "clickLinkCardInChat", "touch")
		JoinResult.onDetailsOpened()
		JoinResult.openGameDetailsPage(UniverseId, "LuaChatAssetCard")
		local ReportOpenGameDetailFromChat: (any, any, any, any) -> () = JoinResult.analytics and JoinResult.analytics.reportOpenGameDetailFromChat
		
		if ReportOpenGameDetailFromChat then
			ReportOpenGameDetailFromChat(PlaceId, JoinResult.conversationId, UniverseId, "GameDetailFromLinkCard")
		end
	end
}

local function _(p1, p2)
	return p1.GameDetails[p2] or {}
end

local _ = function(p1, p2)
	return p1.PlayabilityStatus[p2] or {}
end

function GameCardContainer(p1)
	-- upvalues: CryoModule (copy), config (copy), UseSelectorFunction (copy), UseCallbackFunction (copy), ConstructGameThumbnailUrlModule (copy), ConstantsModule (copy), UseIsExternalNavigationAvailableModule (copy), EnumScreensModule (copy), UseDispatchFunction (copy), ApiFetchGameDetails (copy), ApiFetchPlayabilityStatus (copy), DataHydrationModule (copy), SignalsModule (copy), UseMemoFunction (copy), UseSignalStateFunction (copy), UseTelemetryModule (copy), ChatConversationTelemetryLayerModule (copy), UseEffectFunction (copy), ChatConversationTelemetryEventsModule (copy), RoundedVariantModule (copy), ReactModule (copy), GameCardGroupableModule (copy), UseIsInExperienceModule (copy), GetFFlagAppChatHidePlayButtonsInExpModule (copy), WithLocalizationFunction (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	
	if not JoinResult.universeId then
		assert("universeId does not exist", "universeId does not exist")
	end
	local UseSelectorResult = UseSelectorFunction(UseCallbackFunction(function(p2)
		-- upvalues: JoinResult (copy)
		return p2.GameDetails[JoinResult.universeId] or {}
	end, { JoinResult.universeId }))
	local UseSelectorResult1 = UseSelectorFunction(UseCallbackFunction(function(p2)
		-- upvalues: JoinResult (copy)
		return p2.PlayabilityStatus[JoinResult.universeId] or {}
	end, { JoinResult.universeId }))
	local ConstructGameThumbnailUrlModuleResult = ConstructGameThumbnailUrlModule(JoinResult.placeId, ConstantsModule.GameCard.THUMBNAIL_WIDTH, ConstantsModule.GameCard.THUMBNAIL_HEIGHT)
	local RbxthumbName: string = `rbxthumb://type=GameIcon&id={JoinResult.universeId}&w={150}&h={150}`
	local UseIsExternalNavigationAvailableModuleResult = UseIsExternalNavigationAvailableModule({ EnumScreensModule.GameDetail })
	local PlaceId = JoinResult.placeId or UseSelectorResult.rootPlaceId
	local Name = UseSelectorResult.name
	local Description = UseSelectorResult.description or ""
	local Price = UseSelectorResult.price or 0
	local UseDispatchResult = UseDispatchFunction()
	
	local function FetchGameData(NetworkImpl, UniverseId)
		-- upvalues: UseDispatchResult (copy), ApiFetchGameDetails (upval), ApiFetchPlayabilityStatus (upval)
		UseDispatchResult(ApiFetchGameDetails.Fetch(NetworkImpl, { UniverseId }))
		UseDispatchResult(ApiFetchPlayabilityStatus.Fetch(NetworkImpl, { UniverseId }))
	end
	
	local VotesStore = DataHydrationModule.Game.getVotesStore(false)
	local Signal = SignalsModule.createSignal(nil)
	local NotReady = SignalsModule.createSignal("NotReady")
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: JoinResult (copy), Signal (copy), NotReady (copy), VotesStore (copy)
		return if JoinResult.universeId then VotesStore.getAndFetchVotes({ JoinResult.universeId })[JoinResult.universeId] or { data = Signal, status = NotReady } else { data = Signal, status = NotReady }
	end, { VotesStore, JoinResult.universeId })
	local UseSignalStateResult = UseSignalStateFunction(UseMemoResult.data)
	local UseSignalStateResult1 = UseSignalStateFunction(UseMemoResult.status)
	local UseMemoResult1 = UseMemoFunction(function(): string
		-- upvalues: UseSignalStateResult (copy)
		if UseSignalStateResult and UseSignalStateResult.upVotes and UseSignalStateResult.downVotes then
			local NewUpVotes = UseSignalStateResult.upVotes + UseSignalStateResult.downVotes
			
			if NewUpVotes > 0 then
				return tostring((math.floor(UseSignalStateResult.upVotes / NewUpVotes * 100))) .. "%"
			end
		end
		return "--"
	end, { UseSignalStateResult })
	local UseTelemetryModuleResult = UseTelemetryModule(ChatConversationTelemetryLayerModule.Context)
	UseEffectFunction(function()
		-- upvalues: JoinResult (copy), FetchGameData (copy)
		local UniverseId = JoinResult.universeId
		
		if UniverseId then
			FetchGameData(JoinResult.networkImpl, UniverseId)
			
			return
		end
	end, { JoinResult.universeId, JoinResult.networkImpl })
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseTelemetryModuleResult (copy), ChatConversationTelemetryEventsModule (upval), JoinResult (copy), PlaceId (copy)
		UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.GameCardThumbnailClicked, { universeId = JoinResult.universeId, placeId = PlaceId })
		JoinResult.openDetails(JoinResult)
	end, {
		UseTelemetryModuleResult,
		JoinResult.openDetails,
		JoinResult.universeId,
		PlaceId
	})
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: UseTelemetryModuleResult (copy), ChatConversationTelemetryEventsModule (upval), JoinResult (copy), PlaceId (copy)
		UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.GameCardPlayButtonClicked, { universeId = JoinResult.universeId, placeId = PlaceId })
		JoinResult.onPlayButtonActivated(JoinResult)
	end, {
		UseTelemetryModuleResult,
		JoinResult.onPlayButtonActivated,
		JoinResult.universeId,
		PlaceId
	})
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: UseTelemetryModuleResult (copy), ChatConversationTelemetryEventsModule (upval), JoinResult (copy), PlaceId (copy)
		UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.GameCardMetadataClicked, { universeId = JoinResult.universeId, placeId = PlaceId })
		JoinResult.openDetails(JoinResult)
	end, {
		UseTelemetryModuleResult,
		JoinResult.openDetails,
		JoinResult.universeId,
		PlaceId
	})
	
	local function renderCard(JoinResult)
		-- upvalues: RoundedVariantModule (upval), UseCallbackResult (copy), UseCallbackResult1 (copy), UseCallbackResult2 (copy), ReactModule (upval), GameCardGroupableModule (upval)
		return ReactModule.createElement(GameCardGroupableModule, {
			thumbnailAspectRatio = 1.7777777777777777,
			gameName = JoinResult.gameName,
			gameDescription = JoinResult.gameDescription,
			gameThumbnail = JoinResult.gameThumbnail,
			gameRating = JoinResult.gameRating,
			gamePlayerCount = JoinResult.gamePlayerCount,
			thumbnailRoundedVariant = if JoinResult.isStartOfGroup then RoundedVariantModule.Top elseif JoinResult.isIncoming then RoundedVariantModule.TopRight else RoundedVariantModule.TopLeft,
			shouldShowPlayButton = if JoinResult.isPlayButtonEnabled and JoinResult.playabilityStatus then JoinResult.playabilityStatus.isPlayable == true else false,
			onPlayButtonActivated = if JoinResult.onPlayButtonActivated then UseCallbackResult1 else nil,
			onThumbnailActivated = if JoinResult.openDetails then UseCallbackResult else nil,
			onMetadataActivated = if JoinResult.openDetails then UseCallbackResult2 else nil,
			isRepliedTo = JoinResult.isRepliedTo,
			isIncoming = JoinResult.isIncoming,
			isPending = JoinResult.isPending,
			isLoading = not JoinResult.universeId or (not JoinResult.gameName or (not JoinResult.gameThumbnail or (JoinResult.votesStatus == "NotReady" or not JoinResult.gamePlayerCount))),
			LayoutOrder = JoinResult.layoutOrder
		})
	end
	
	local UseIsInExperienceModuleResult = UseIsInExperienceModule()
	local Inverted: boolean = not GetFFlagAppChatHidePlayButtonsInExpModule() or not UseIsInExperienceModuleResult
	
	return WithLocalizationFunction({
		purchaseGameText = "Feature.GameDetails.Heading.PurchaseGame",
		viewDetailsText = "Feature.Chat.Action.ViewAssetDetails",
		playText = "Common.VisitGame.Label.Play",
		noDescriptionText = "Feature.Chat.Label.NoDescriptionYet"
	})(function(_)
		-- upvalues: CryoModule (upval), JoinResult (copy), UseSelectorResult (copy), UseSelectorResult1 (copy), RbxthumbName (copy), PlaceId (copy), Name (copy), Description (copy), Price (copy), Inverted (copy), UseIsExternalNavigationAvailableModuleResult (copy), EnumScreensModule (upval), FetchGameData (copy), ConstructGameThumbnailUrlModuleResult (copy), UseMemoResult1 (copy), UseSignalStateResult1 (copy), renderCard (copy)
		return renderCard((CryoModule.Dictionary.join(JoinResult, {
			details = UseSelectorResult,
			playabilityStatus = UseSelectorResult1,
			gameIcon = RbxthumbName,
			placeId = PlaceId,
			gameName = Name,
			gameDescription = Description,
			gamePrice = Price,
			isPlayButtonEnabled = Inverted,
			viewDetailsEnabled = UseIsExternalNavigationAvailableModuleResult[EnumScreensModule.GameDetail],
			fetchGameData = FetchGameData,
			gameThumbnail = ConstructGameThumbnailUrlModuleResult,
			gameRating = UseMemoResult1,
			gamePlayerCount = UseSelectorResult.playing or 0,
			votesStatus = UseSignalStateResult1
		})))
	end)
end

return RoactServices.connect({
	game = AppGame,
	sessionService = AppSessionService,
	analytics = RoactAnalyticsCommonGameEvents
})(MemoFunction(GameCardContainer))