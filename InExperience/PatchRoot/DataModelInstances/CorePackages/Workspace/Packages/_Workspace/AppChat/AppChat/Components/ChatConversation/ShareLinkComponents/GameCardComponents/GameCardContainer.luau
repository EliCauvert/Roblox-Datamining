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
local var19 = httpRequestModule.config({
	requestFunction = function(p0, p1, p2) --[[ line: 66 ]]
		-- upvalues: gameCardContainer (ref), httpRequestModule (ref)
		gameCardContainer:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p1, p0))
		
		return httpRequestModule.requestFunctions.HttpRbxApi(p0, p1, p2)
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
	networkImpl = var19,
	eventStream = eventStream.new(rbxAnalyticsService),
	eventIngest = eventIngest.new(eventIngestService),
	onDetailsOpened = function() --[[ line: 111 ]] end,
	onPlayButtonActivated = function(p3) --[[ line: 113 ]]
		-- upvalues: setGamePlaySession (ref), sessionType (ref), reportAnEventModule (ref), cryoModule (ref), gameParams (ref), appChatShutdownBeforeLaunch (ref), experienceService (ref)
		local placeId = p3.placeId
		local senderUserId = p3.senderUserId
		setGamePlaySession(p3.sessionService, sessionType.StructuralIdentifier.GamePlayFromChat, true)
		reportAnEventModule(p3, "clickBtnFromLinkCardInChat", "touch")
		
		if placeId then
			local var24 = function(p4) --[[ line: 122 ]]
				-- upvalues: p3 (write), cryoModule (copy), reportAnEventModule (copy)
				p3 = cryoModule.Dictionary.join(p3, { joinAttemptId = p4 })
				reportAnEventModule(p3, "gamePlayIntent", "PlayGameFromLinkCard")
			end
			
			local var25 = gameParams.fromParams({ userId = senderUserId, placeId = placeId })
			
			if appChatShutdownBeforeLaunch then
				game:Shutdown()
			end
			experienceService:LaunchExperience(var25, "PlayGameFromLinkCard", var24)
		end
	end,
	openDetails = function(p5) --[[ line: 140 ]]
		-- upvalues: reportAnEventModule (ref)
		local universeId = p5.universeId
		local placeId = p5.placeId
		reportAnEventModule(p5, "clickLinkCardInChat", "touch")
		p5.onDetailsOpened()
		p5.openGameDetailsPage(universeId, "LuaChatAssetCard")
		local reportOpenGameDetailFromChat = p5.analytics and p5.analytics.reportOpenGameDetailFromChat
		
		if reportOpenGameDetailFromChat then
			reportOpenGameDetailFromChat(placeId, p5.conversationId, universeId, "GameDetailFromLinkCard")
		end
	end
}

local function _(p6, p7) --[[ line: 157 | named "getGameDetails" ]]
	return p6.GameDetails[p7] or {}
end

local _ = function(p8, p9) --[[ line: 161 | named "getGamePlayabilityStatus" ]]
	return p8.PlayabilityStatus[p9] or {}
end

function GameCardContainer(p10) --[[ line: 165 ]]
	-- upvalues: cryoModule (ref), t (ref), useSelector (ref), useCallback (ref), constructGameThumbnailUrlModule (ref), constantsModule (ref), useIsExternalNavigationAvailableModule (ref), enumScreensModule (ref), useDispatch (ref), apiFetchGameDetails (ref), apiFetchPlayabilityStatus (ref), dataHydrationModule (ref), signalsModule (ref), useMemo (ref), useSignalState (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), useEffect (ref), chatConversationTelemetryEventsModule (ref), roundedVariantModule (ref), reactModule (ref), gameCardGroupableModule (ref), useIsInExperienceModule (ref), getFFlagAppChatHidePlayButtonsInExpModule (ref), withLocalization (ref)
	local var27 = cryoModule.Dictionary.join(t, p10)
	
	if not var27.universeId then
		assert("universeId does not exist", "universeId does not exist")
	end
	local var28 = useSelector(useCallback(function(p11) --[[ line: 171 ]]
		-- upvalues: var27 (ref)
		return p11.GameDetails[var27.universeId] or {}
	end, { var27.universeId }))
	local var29 = useSelector(useCallback(function(p12) --[[ line: 175 ]]
		-- upvalues: var27 (ref)
		return p12.PlayabilityStatus[var27.universeId] or {}
	end, { var27.universeId }))
	local var30 = constructGameThumbnailUrlModule(var27.placeId, constantsModule.GameCard.THUMBNAIL_WIDTH, constantsModule.GameCard.THUMBNAIL_HEIGHT)
	local universeId = `rbxthumb://type=GameIcon&id={var27.universeId}&w={150}&h={150}`
	local var32 = useIsExternalNavigationAvailableModule({ enumScreensModule.GameDetail })
	local placeId = var27.placeId or var28.rootPlaceId
	local name = var28.name
	local description = var28.description or ""
	local price = var28.price or 0
	local var36 = useDispatch()
	
	local var37 = function(p13, p14) --[[ line: 197 ]]
		-- upvalues: var36 (ref), apiFetchGameDetails (copy), apiFetchPlayabilityStatus (copy)
		var36(apiFetchGameDetails.Fetch(p13, { p14 }))
		var36(apiFetchPlayabilityStatus.Fetch(p13, { p14 }))
	end
	
	local votesStore = dataHydrationModule.Game.getVotesStore(false)
	local var39 = signalsModule.createSignal(nil)
	local notReady = signalsModule.createSignal("NotReady")
	local var41 = useMemo(function() --[[ line: 207 ]]
		-- upvalues: var27 (ref), var39 (ref), notReady (ref), votesStore (ref)
		return if var27.universeId then votesStore.getAndFetchVotes({ var27.universeId })[var27.universeId] or { data = var39, status = notReady } else { data = var39, status = notReady }
	end, { votesStore, var27.universeId })
	local var42 = useSignalState(var41.data)
	local var43 = useSignalState(var41.status)
	local var44 = useMemo(function() --[[ line: 227 ]]
		-- upvalues: var42 (ref)
		if var42 and var42.upVotes and var42.downVotes then
			local var51 = var42.upVotes + var42.downVotes
			
			return if var51 > 0 then tostring(math.floor(var42.upVotes / var51 * 100)) .. "%" else "--"
		end
	end, { var42 })
	local var45 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	useEffect(function() --[[ line: 239 ]]
		-- upvalues: var27 (ref), var37 (ref)
		local universeId = var27.universeId
		
		if universeId then
			var37(var27.networkImpl, universeId)
			
			return
		end
	end, { var27.universeId, var27.networkImpl })
	local var46 = useCallback(function() --[[ line: 249 ]]
		-- upvalues: var45 (ref), chatConversationTelemetryEventsModule (copy), var27 (ref), placeId (ref)
		var45.emit(chatConversationTelemetryEventsModule.GameCardThumbnailClicked, { universeId = var27.universeId, placeId = placeId })
		var27:openDetails()
	end, { var45, var27.openDetails, var27.universeId, placeId })
	local var47 = useCallback(function() --[[ line: 257 ]]
		-- upvalues: var45 (ref), chatConversationTelemetryEventsModule (copy), var27 (ref), placeId (ref)
		var45.emit(chatConversationTelemetryEventsModule.GameCardPlayButtonClicked, { universeId = var27.universeId, placeId = placeId })
		var27:onPlayButtonActivated()
	end, {
		var45,
		var27.onPlayButtonActivated,
		var27.universeId,
		placeId
	})
	local var48 = useCallback(function() --[[ line: 265 ]]
		-- upvalues: var45 (ref), chatConversationTelemetryEventsModule (copy), var27 (ref), placeId (ref)
		var45.emit(chatConversationTelemetryEventsModule.GameCardMetadataClicked, { universeId = var27.universeId, placeId = placeId })
		var27:openDetails()
	end, { var45, var27.openDetails, var27.universeId, placeId })
	
	local function renderCard(p15) --[[ line: 273 ]]
		-- upvalues: roundedVariantModule (copy), var46 (ref), var47 (ref), var48 (ref), reactModule (copy), gameCardGroupableModule (copy)
		return reactModule.createElement(gameCardGroupableModule, {
			thumbnailAspectRatio = 1.777777777778,
			gameName = p15.gameName,
			gameDescription = p15.gameDescription,
			gameThumbnail = p15.gameThumbnail,
			gameRating = p15.gameRating,
			gamePlayerCount = p15.gamePlayerCount,
			thumbnailRoundedVariant = if p15.isStartOfGroup then roundedVariantModule.Top elseif p15.isIncoming then roundedVariantModule.TopRight else roundedVariantModule.TopLeft,
			shouldShowPlayButton = if p15.isPlayButtonEnabled and p15.playabilityStatus then p15.playabilityStatus.isPlayable == true else false,
			onPlayButtonActivated = if p15.onPlayButtonActivated then var47 else nil,
			onThumbnailActivated = if p15.openDetails then var46 else nil,
			onMetadataActivated = if p15.openDetails then var48 else nil,
			isRepliedTo = p15.isRepliedTo,
			isIncoming = p15.isIncoming,
			isPending = p15.isPending,
			isLoading = if p15.universeId then if p15.gameName then if p15.gameThumbnail then if p15.votesStatus ~= "NotReady" then not p15.gamePlayerCount else true else not p15.gameThumbnail else not p15.gameName else not p15.universeId,
			LayoutOrder = p15.layoutOrder
		})
	end
	
	local var50 = if getFFlagAppChatHidePlayButtonsInExpModule() then if useIsInExperienceModule() then false else true else true
	
	return withLocalization({
		purchaseGameText = "Feature.GameDetails.Heading.PurchaseGame",
		viewDetailsText = "Feature.Chat.Action.ViewAssetDetails",
		playText = "Common.VisitGame.Label.Play",
		noDescriptionText = "Feature.Chat.Label.NoDescriptionYet"
	})(function(_) --[[ line: 324 ]]
		-- upvalues: cryoModule (copy), var27 (ref), var28 (ref), var29 (ref), universeId (ref), placeId (ref), name (ref), description (ref), price (ref), var50 (ref), var32 (ref), enumScreensModule (copy), var37 (ref), var30 (ref), var44 (ref), var43 (ref), renderCard (ref)
		return renderCard(cryoModule.Dictionary.join(var27, {
			details = var28,
			playabilityStatus = var29,
			gameIcon = universeId,
			placeId = placeId,
			gameName = name,
			gameDescription = description,
			gamePrice = price,
			isPlayButtonEnabled = var50,
			viewDetailsEnabled = var32[enumScreensModule.GameDetail],
			fetchGameData = var37,
			gameThumbnail = var30,
			gameRating = var44,
			gamePlayerCount = var28.playing or 0,
			votesStatus = var43
		}))
	end)
end

return roactServices.connect({
	game = appGame,
	sessionService = appSessionService,
	analytics = roactAnalyticsCommonGameEvents
})(memo(GameCardContainer))