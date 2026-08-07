local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local centralOverlayModule = require(parent.CentralOverlay)
local dataHydrationModule = require(parent.DataHydration)
local playerFeedbackModule = require(parent.PlayerFeedback)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local game = dataHydrationModule.Game
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
local playerFeedbackEvents = playerFeedbackModule.Analytics.Events.PlayerFeedbackEvents
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local getSduiClientPageScope = sduiCoreSystemModule.getSduiClientPageScope
local t = { [true] = "Upvote", [false] = "Downvote" }

return function(p0, _, p1, _) --[[ line: 32 | named "SduiOpenGameFeedbackFormAction" ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), game (ref), t (ref), playerFeedbackEvents (ref), setCentralOverlay (ref), centralOverlayType (ref), getSduiClientPageScope (ref)
	local var6 = if p0 then p0.actionParams else nil
	
	if var6 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenGameFeedbackForm
		}, p1.appPage)
		
		return
	end
	local universeId = var6.universeId
	
	if typeof(universeId) ~= "string" or universeId == "" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "universeId",
			name = sduiActionType.OpenGameFeedbackForm,
			message = `Invalid or missing universeId: {tostring(universeId)}`
		}, p1.appPage)
		
		return
	end
	local rootPlaceId = var6.rootPlaceId
	
	if typeof(rootPlaceId) ~= "string" or rootPlaceId == "" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "rootPlaceId",
			name = sduiActionType.OpenGameFeedbackForm,
			message = `Invalid or missing rootPlaceId: {tostring(rootPlaceId)}`
		}, p1.appPage)
		
		return
	end
	local var7 = game.getUserVoteFeedbackMetadataStore(false).getUserVoteFeedbackMetadata(rootPlaceId).data(false)
	local var8 = game.getVotesStore(false).getAndFetchUserVote(universeId).data(false)
	
	if not var7 or not var7.canSubmitReview or not var8 or var8.userVote ~= true and var8.userVote ~= false then
		p1.dependencies.logger.reportError(sduiErrorType.FailedToExecuteAction, {
			name = sduiActionType.OpenGameFeedbackForm,
			message = `Missing or invalid feedback hydration: hasMetadata={tostring(var7 ~= nil)}, canSubmitReview={tostring(var7 and var7.canSubmitReview)}, hasUserVoteData={tostring(var8 ~= nil)}, userVote={tostring(var8 and var8.userVote)}`
		}, p1.appPage)
		
		return
	end
	local userVote = t[var8.userVote]
	local var9 = nil
	
	for i, v in var7.categories do
		if v.type == userVote then
			var9 = v
			break
		end
	end
	if var9 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.FailedToExecuteAction, {
			name = sduiActionType.OpenGameFeedbackForm,
			message = `No matching vote category found for type: {tostring(userVote)}`
		}, p1.appPage)
		
		return
	end
	playerFeedbackEvents.ClickPlayerFeedbackPromptCta(p1.dependencies.eventIngest, rootPlaceId)
	local configKey = p1.configKey
	p1.dependencies.dispatch(setCentralOverlay(centralOverlayType.GamePlayerFeedbackForm, {
		universeId = universeId,
		playerFeedbackMetadata = {
			rootPlaceId = var7.rootPlaceId,
			canSubmitReview = var7.canSubmitReview,
			canSubmitComment = var7.canSubmitComment,
			categoryType = userVote,
			category = var9,
			comment = var7.comment,
			metadata = var7.metadata
		},
		onSubmitted = function() --[[ line: 123 ]]
			-- upvalues: game (copy), rootPlaceId (ref), configKey (ref), getSduiClientPageScope (copy)
			game.getUserVoteFeedbackMetadataStore(false).clearItem(rootPlaceId)
			
			if configKey then
				getSduiClientPageScope(configKey).set("showPlayerFeedback", false)
			end
		end
	}))
end