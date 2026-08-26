local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local eventIngestService = game:GetService("EventIngestService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local fFlagLuaAppDefaultHttpRetry = require(parent.SharedFlags).FFlagLuaAppDefaultHttpRetry
local _ = require(appChat.types)
local constantsModule = require(appChat.Constants)
local constructGameThumbnailUrlModule = require(appChat.Utils.constructGameThumbnailUrl)
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local eventStream = require(parent.Analytics).AnalyticsReporters.EventStream
local memo = reactModule.memo
local useCallback = reactModule.useCallback
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect
local useIsExternalNavigationAvailableModule = require(appChat.Hooks.useIsExternalNavigationAvailable)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useMemo = reactModule.useMemo
local useSignalState = require(parent.SignalsReact).useSignalState
local gameCardContainer = require(parent.Loggers).Logger:new("GameCardContainer")
local withLocalization = require(parent.Localization).withLocalization
local gameParams = require(parent.ExperienceService).GameParams
local eventIngest = require(parent.Analytics).AnalyticsReporters.EventIngest
local apiFetchGameDetails = require(parent.GameDetailRodux).GameDetails.ApiFetchGameDetails
local apiFetchPlayabilityStatus = require(parent.PlayabilityRodux).PlayabilityStatus.ApiFetchPlayabilityStatus
local reportAnEventModule = require(script.Parent.ReportAnEvent)
local appSessionService = require(parent.RoactServiceTags).AppSessionService
local sessionType = require(parent.RobloxAppSessionization).SessionType
local roactServices = require(parent.RoactServices).RoactServices
local roactAnalyticsCommonGameEvents = require(parent.RoactServiceTags).RoactAnalyticsCommonGameEvents
local gameCardGroupableModule = require(script.Parent.GameCardGroupable)
local dataHydrationModule = require(parent.DataHydration)
local roundedVariantModule = require(appChat.Enums.RoundedVariant)
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local chatConversationTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local chatConversationTelemetryEventsModule = require(script.Parent.Parent.Parent.ChatConversationTelemetryEvents)
local appGame = roactServices.AppGame
local experienceService = require(parent.ExperienceService).ExperienceService
local setGamePlaySession = require(parent.RobloxAppSessionization).SetGamePlaySession
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local httpRequestModule = require(parent.HttpRequest)
local var1 = httpRequestModule.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: gameCardContainer (ref), httpRequestModule (ref)
		gameCardContainer:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
		
		return httpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
	end,
	maxRetryCount = if fFlagLuaAppDefaultHttpRetry then game:DefineFastInt("GameCardContainerHttpRetryCount", 4) else nil
})
local enumScreensModule = require(appChat.EnumScreens)
local appChatShutdownBeforeLaunch = game:DefineFastFlag("AppChatShutdownBeforeLaunch", false)
local getFFlagAppChatHidePlayButtonsInExpModule = require(appChat.Flags.getFFlagAppChatHidePlayButtonsInExp)
local t = {
	placeId = nil,
	universeId = nil,
	conversationId = nil,
	luaChatPlayTogetherEnabled = nil,
	networkImpl = var1,
	eventStream = eventStream.new(rbxAnalyticsService),
	eventIngest = eventIngest.new(eventIngestService),
	onDetailsOpened = function() end,
	onPlayButtonActivated = function(p1)
		-- upvalues: setGamePlaySession (ref), sessionType (ref), reportAnEventModule (ref), cryoModule (ref), gameParams (ref), appChatShutdownBeforeLaunch (ref), experienceService (ref)
		local placeId = p1.placeId
		local senderUserId = p1.senderUserId
		setGamePlaySession(p1.sessionService, sessionType.StructuralIdentifier.GamePlayFromChat, true)
		reportAnEventModule(p1, "clickBtnFromLinkCardInChat", "touch")
		
		if placeId then
			local var2 = function(p2)
				-- upvalues: p1 (write), cryoModule (copy), reportAnEventModule (copy)
				p1 = cryoModule.Dictionary.join(p1, { joinAttemptId = p2 })
				reportAnEventModule(p1, "gamePlayIntent", "PlayGameFromLinkCard")
			end
			
			local var3 = gameParams.fromParams({ userId = senderUserId, placeId = placeId })
			
			if appChatShutdownBeforeLaunch then
				game:Shutdown()
			end
			experienceService:LaunchExperience(var3, "PlayGameFromLinkCard", var2)
		end
	end,
	openDetails = function(p1)
		-- upvalues: reportAnEventModule (ref)
		local universeId = p1.universeId
		local placeId = p1.placeId
		reportAnEventModule(p1, "clickLinkCardInChat", "touch")
		p1.onDetailsOpened()
		p1.openGameDetailsPage(universeId, "LuaChatAssetCard")
		local reportOpenGameDetailFromChat = p1.analytics and p1.analytics.reportOpenGameDetailFromChat
		
		if reportOpenGameDetailFromChat then
			reportOpenGameDetailFromChat(placeId, p1.conversationId, universeId, "GameDetailFromLinkCard")
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
	-- upvalues: cryoModule (ref), t (ref), useSelector (ref), useCallback (ref), constructGameThumbnailUrlModule (ref), constantsModule (ref), useIsExternalNavigationAvailableModule (ref), enumScreensModule (ref), useDispatch (ref), apiFetchGameDetails (ref), apiFetchPlayabilityStatus (ref), dataHydrationModule (ref), signalsModule (ref), useMemo (ref), useSignalState (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), useEffect (ref), chatConversationTelemetryEventsModule (ref), roundedVariantModule (ref), reactModule (ref), gameCardGroupableModule (ref), useIsInExperienceModule (ref), getFFlagAppChatHidePlayButtonsInExpModule (ref), withLocalization (ref)
	local var2 = cryoModule.Dictionary.join(t, p1)
	
	if not var2.universeId then
		assert("universeId does not exist", "universeId does not exist")
	end
	local var3 = useSelector(useCallback(function(p2)
		-- upvalues: var2 (ref)
		return p2.GameDetails[var2.universeId] or {}
	end, { var2.universeId }))
	local var4 = useSelector(useCallback(function(p2)
		-- upvalues: var2 (ref)
		return p2.PlayabilityStatus[var2.universeId] or {}
	end, { var2.universeId }))
	local var5 = constructGameThumbnailUrlModule(var2.placeId, constantsModule.GameCard.THUMBNAIL_WIDTH, constantsModule.GameCard.THUMBNAIL_HEIGHT)
	local universeId = `rbxthumb://type=GameIcon&id={var2.universeId}&w={150}&h={150}`
	local var6 = useIsExternalNavigationAvailableModule({ enumScreensModule.GameDetail })
	local placeId = var2.placeId or var3.rootPlaceId
	local name = var3.name
	local description = var3.description or ""
	local price = var3.price or 0
	local var7 = useDispatch()
	
	local var8 = function(p2, p3)
		-- upvalues: var7 (ref), apiFetchGameDetails (copy), apiFetchPlayabilityStatus (copy)
		var7(apiFetchGameDetails.Fetch(p2, { p3 }))
		var7(apiFetchPlayabilityStatus.Fetch(p2, { p3 }))
	end
	
	local votesStore = dataHydrationModule.Game.getVotesStore(false)
	local var9 = signalsModule.createSignal(nil)
	local notReady = signalsModule.createSignal("NotReady")
	local var10 = useMemo(function()
		-- upvalues: var2 (ref), var9 (ref), notReady (ref), votesStore (ref)
		return if var2.universeId then votesStore.getAndFetchVotes({ var2.universeId })[var2.universeId] or { data = var9, status = notReady } else { data = var9, status = notReady }
	end, { votesStore, var2.universeId })
	local var11 = useSignalState(var10.data)
	local var12 = useSignalState(var10.status)
	local var13 = useMemo(function()
		-- upvalues: var11 (ref)
		if var11 and var11.upVotes and var11.downVotes then
			local var14 = var11.upVotes + var11.downVotes
			
			return if var14 > 0 then tostring(math.floor(var11.upVotes / var14 * 100)) .. "%" else "--"
		end
	end, { var11 })
	local var14 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	useEffect(function()
		-- upvalues: var2 (ref), var8 (ref)
		local universeId = var2.universeId
		
		if universeId then
			var8(var2.networkImpl, universeId)
			
			return
		end
	end, { var2.universeId, var2.networkImpl })
	local var15 = useCallback(function()
		-- upvalues: var14 (ref), chatConversationTelemetryEventsModule (copy), var2 (ref), placeId (ref)
		var14.emit(chatConversationTelemetryEventsModule.GameCardThumbnailClicked, { universeId = var2.universeId, placeId = placeId })
		var2:openDetails()
	end, { var14, var2.openDetails, var2.universeId, placeId })
	local var16 = useCallback(function()
		-- upvalues: var14 (ref), chatConversationTelemetryEventsModule (copy), var2 (ref), placeId (ref)
		var14.emit(chatConversationTelemetryEventsModule.GameCardPlayButtonClicked, { universeId = var2.universeId, placeId = placeId })
		var2:onPlayButtonActivated()
	end, {
		var14,
		var2.onPlayButtonActivated,
		var2.universeId,
		placeId
	})
	local var17 = useCallback(function()
		-- upvalues: var14 (ref), chatConversationTelemetryEventsModule (copy), var2 (ref), placeId (ref)
		var14.emit(chatConversationTelemetryEventsModule.GameCardMetadataClicked, { universeId = var2.universeId, placeId = placeId })
		var2:openDetails()
	end, { var14, var2.openDetails, var2.universeId, placeId })
	
	local function renderCard(p2)
		-- upvalues: roundedVariantModule (copy), var15 (ref), var16 (ref), var17 (ref), reactModule (copy), gameCardGroupableModule (copy)
		return reactModule.createElement(gameCardGroupableModule, {
			thumbnailAspectRatio = 1.777777777778,
			gameName = p2.gameName,
			gameDescription = p2.gameDescription,
			gameThumbnail = p2.gameThumbnail,
			gameRating = p2.gameRating,
			gamePlayerCount = p2.gamePlayerCount,
			thumbnailRoundedVariant = if p2.isStartOfGroup then roundedVariantModule.Top elseif p2.isIncoming then roundedVariantModule.TopRight else roundedVariantModule.TopLeft,
			shouldShowPlayButton = if p2.isPlayButtonEnabled and p2.playabilityStatus then p2.playabilityStatus.isPlayable == true else false,
			onPlayButtonActivated = if p2.onPlayButtonActivated then var16 else nil,
			onThumbnailActivated = if p2.openDetails then var15 else nil,
			onMetadataActivated = if p2.openDetails then var17 else nil,
			isRepliedTo = p2.isRepliedTo,
			isIncoming = p2.isIncoming,
			isPending = p2.isPending,
			isLoading = if p2.universeId then if p2.gameName then if p2.gameThumbnail then if p2.votesStatus ~= "NotReady" then not p2.gamePlayerCount else true else not p2.gameThumbnail else not p2.gameName else not p2.universeId,
			LayoutOrder = p2.layoutOrder
		})
	end
	
	local var18 = if getFFlagAppChatHidePlayButtonsInExpModule() then if useIsInExperienceModule() then false else true else true
	
	return withLocalization({
		purchaseGameText = "Feature.GameDetails.Heading.PurchaseGame",
		viewDetailsText = "Feature.Chat.Action.ViewAssetDetails",
		playText = "Common.VisitGame.Label.Play",
		noDescriptionText = "Feature.Chat.Label.NoDescriptionYet"
	})(function(_)
		-- upvalues: cryoModule (copy), var2 (ref), var3 (ref), var4 (ref), universeId (ref), placeId (ref), name (ref), description (ref), price (ref), var18 (ref), var6 (ref), enumScreensModule (copy), var8 (ref), var5 (ref), var13 (ref), var12 (ref), renderCard (ref)
		return renderCard(cryoModule.Dictionary.join(var2, {
			details = var3,
			playabilityStatus = var4,
			gameIcon = universeId,
			placeId = placeId,
			gameName = name,
			gameDescription = description,
			gamePrice = price,
			isPlayButtonEnabled = var18,
			viewDetailsEnabled = var6[enumScreensModule.GameDetail],
			fetchGameData = var8,
			gameThumbnail = var5,
			gameRating = var13,
			gamePlayerCount = var3.playing or 0,
			votesStatus = var12
		}))
	end)
end

return roactServices.connect({
	game = appGame,
	sessionService = appSessionService,
	analytics = roactAnalyticsCommonGameEvents
})(memo(GameCardContainer))