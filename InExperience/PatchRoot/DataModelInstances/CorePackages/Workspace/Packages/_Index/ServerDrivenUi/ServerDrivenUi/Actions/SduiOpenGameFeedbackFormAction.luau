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

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), game (ref), t (ref), playerFeedbackEvents (ref), setCentralOverlay (ref), centralOverlayType (ref), getSduiClientPageScope (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenGameFeedbackForm
		}, p2.appPage)
		
		return
	end
	local universeId = var1.universeId
	
	if typeof(universeId) ~= "string" or universeId == "" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "universeId",
			name = sduiActionType.OpenGameFeedbackForm,
			message = `Invalid or missing universeId: {tostring(universeId)}`
		}, p2.appPage)
		
		return
	end
	local rootPlaceId = var1.rootPlaceId
	
	if typeof(rootPlaceId) ~= "string" or rootPlaceId == "" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "rootPlaceId",
			name = sduiActionType.OpenGameFeedbackForm,
			message = `Invalid or missing rootPlaceId: {tostring(rootPlaceId)}`
		}, p2.appPage)
		
		return
	end
	local var2 = game.getUserVoteFeedbackMetadataStore(false).getUserVoteFeedbackMetadata(rootPlaceId).data(false)
	local var3 = game.getVotesStore(false).getAndFetchUserVote(universeId).data(false)
	
	if not var2 or not var2.canSubmitReview or not var3 or var3.userVote ~= true and var3.userVote ~= false then
		p2.dependencies.logger.reportError(sduiErrorType.FailedToExecuteAction, {
			name = sduiActionType.OpenGameFeedbackForm,
			message = `Missing or invalid feedback hydration: hasMetadata={tostring(var2 ~= nil)}, canSubmitReview={tostring(var2 and var2.canSubmitReview)}, hasUserVoteData={tostring(var3 ~= nil)}, userVote={tostring(var3 and var3.userVote)}`
		}, p2.appPage)
		
		return
	end
	local userVote = t[var3.userVote]
	local var4 = nil
	
	for i, v in var2.categories do
		if v.type == userVote then
			var4 = v
			break
		end
	end
	if var4 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.FailedToExecuteAction, {
			name = sduiActionType.OpenGameFeedbackForm,
			message = `No matching vote category found for type: {tostring(userVote)}`
		}, p2.appPage)
		
		return
	end
	playerFeedbackEvents.ClickPlayerFeedbackPromptCta(p2.dependencies.eventIngest, rootPlaceId)
	local configKey = p2.configKey
	p2.dependencies.dispatch(setCentralOverlay(centralOverlayType.GamePlayerFeedbackForm, {
		universeId = universeId,
		playerFeedbackMetadata = {
			rootPlaceId = var2.rootPlaceId,
			canSubmitReview = var2.canSubmitReview,
			canSubmitComment = var2.canSubmitComment,
			categoryType = userVote,
			category = var4,
			comment = var2.comment,
			metadata = var2.metadata
		},
		onSubmitted = function()
			-- upvalues: game (copy), rootPlaceId (ref), configKey (ref), getSduiClientPageScope (copy)
			game.getUserVoteFeedbackMetadataStore(false).clearItem(rootPlaceId)
			
			if configKey then
				getSduiClientPageScope(configKey).set("showPlayerFeedback", false)
			end
		end
	}))
end