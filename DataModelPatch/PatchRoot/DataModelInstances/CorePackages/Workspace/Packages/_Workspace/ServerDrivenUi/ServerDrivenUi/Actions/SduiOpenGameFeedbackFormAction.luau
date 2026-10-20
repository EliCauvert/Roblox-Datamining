local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local Game = require(Parent.DataHydration).Game
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local PlayerFeedbackEvents = require(Parent.PlayerFeedback).Analytics.Events.PlayerFeedbackEvents
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GetSduiClientPageScopeFunction = SduiCoreSystemModule.getSduiClientPageScope
local config = { [true] = "Upvote", [false] = "Downvote" }

return function(p1, _, p2, _)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), Game (copy), config (copy), PlayerFeedbackEvents (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), GetSduiClientPageScopeFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenGameFeedbackForm
		}, p2.appPage)
		
		return
	end
	local UniverseId = ActionParams.universeId
	
	if typeof(UniverseId) ~= "string" or UniverseId == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "universeId",
			name = SduiActionType.OpenGameFeedbackForm,
			message = `Invalid or missing universeId: {tostring(UniverseId)}`
		}, p2.appPage)
		
		return
	end
	local RootPlaceId = ActionParams.rootPlaceId
	
	if typeof(RootPlaceId) ~= "string" or RootPlaceId == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "rootPlaceId",
			name = SduiActionType.OpenGameFeedbackForm,
			message = `Invalid or missing rootPlaceId: {tostring(RootPlaceId)}`
		}, p2.appPage)
		
		return
	end
	local DataResult = Game.getUserVoteFeedbackMetadataStore(false).getUserVoteFeedbackMetadata(RootPlaceId).data(false)
	local DataResult1 = Game.getVotesStore(false).getAndFetchUserVote(UniverseId).data(false)
	
	if not DataResult or not DataResult.canSubmitReview or not DataResult1 or DataResult1.userVote ~= true and DataResult1.userVote ~= false then
		p2.dependencies.logger.reportError(SduiErrorType.FailedToExecuteAction, {
			name = SduiActionType.OpenGameFeedbackForm,
			message = `Missing or invalid feedback hydration: hasMetadata={tostring(DataResult ~= nil)}, canSubmitReview={tostring(DataResult and DataResult.canSubmitReview)}, hasUserVoteData={tostring(DataResult1 ~= nil)}, userVote={tostring(DataResult1 and DataResult1.userVote)}`
		}, p2.appPage)
		
		return
	end
	local Entry = config[DataResult1.userVote]
	local Category = nil
	
	for _, category in DataResult.categories do
		if category.type == Entry then
			Category = category
			break
		end
	end
	if Category == nil then
		p2.dependencies.logger.reportError(SduiErrorType.FailedToExecuteAction, {
			name = SduiActionType.OpenGameFeedbackForm,
			message = `No matching vote category found for type: {tostring(Entry)}`
		}, p2.appPage)
		
		return
	else
		PlayerFeedbackEvents.ClickPlayerFeedbackPromptCta(p2.dependencies.eventIngest, RootPlaceId)
		local ConfigKey = p2.configKey
		p2.dependencies.dispatch(SetCentralOverlayFunction(CentralOverlayType.GamePlayerFeedbackForm, {
			universeId = UniverseId,
			playerFeedbackMetadata = {
				rootPlaceId = DataResult.rootPlaceId,
				canSubmitReview = DataResult.canSubmitReview,
				canSubmitComment = DataResult.canSubmitComment,
				categoryType = Entry,
				category = Category,
				comment = DataResult.comment,
				metadata = DataResult.metadata
			},
			onSubmitted = function()
				-- upvalues: Game (upval), RootPlaceId (copy), ConfigKey (copy), GetSduiClientPageScopeFunction (upval)
				Game.getUserVoteFeedbackMetadataStore(false).clearItem(RootPlaceId)
				
				if ConfigKey then
					GetSduiClientPageScopeFunction(ConfigKey).set("showPlayerFeedback", false)
				end
			end
		}))
	end
end