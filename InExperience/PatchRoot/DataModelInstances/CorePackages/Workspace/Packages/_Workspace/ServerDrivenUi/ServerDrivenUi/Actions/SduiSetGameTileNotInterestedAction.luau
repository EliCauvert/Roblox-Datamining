local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local GameTileModule = require(Parent.GameTile)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local ActivateGameNotInterestedFunction = GameTileModule.activateGameNotInterested
local GetGameTileHiddenStoreFunction = GameTileModule.getGameTileHiddenStore
local LocalizeStringsFunction = require(Parent.Localization).localizeStrings

local function _(p1, Message, PropName)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy)
	p1.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
		name = SduiActionType.SetGameTileNotInterested,
		message = Message,
		propName = PropName
	}, p1.appPage)
end

return function(p1, _, p2)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), LocalizeStringsFunction (copy), ActivateGameNotInterestedFunction (copy), GetGameTileHiddenStoreFunction (copy)
	local ActionParams = if p1 then p1.actionParams else nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			propName = nil,
			name = SduiActionType.SetGameTileNotInterested
		}, p2.appPage)
		
		return
	end
	local UniverseId = ActionParams.universeId
	
	if typeof(UniverseId) ~= "string" or UniverseId == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing or invalid actionParam: universeId",
			propName = "universeId",
			name = SduiActionType.SetGameTileNotInterested
		}, p2.appPage)
		
		return
	end
	local CollectionId = ActionParams.collectionId
	
	if typeof(CollectionId) == "string" and CollectionId ~= "" then
		ActivateGameNotInterestedFunction({
			appPage = p2.appPage,
			collectionId = CollectionId,
			dispatch = p2.dependencies.dispatch,
			isSponsored = if typeof(ActionParams.isSponsored) == "boolean" then ActionParams.isSponsored else nil,
			localizedStrings = LocalizeStringsFunction(p2.dependencies.localization, {
				checkboxListTitle = "Feature.GameDetails.Message.HidingExperienceQuestion",
				dialogText = "Feature.GameDetails.Message.HelpImproveExperience",
				dialogTitle = "Feature.GameDetails.Label.ProvideFeedbackTitle",
				dontLikeGame = "Feature.GameDetails.Label.DontLikeGame",
				dontLikeImage = "Feature.GameDetails.Label.DontLikeImage",
				inappropriateContent = "Feature.GameDetails.Label.InappropriateContent",
				somethingElse = "Feature.GameDetails.Label.SomethingElse",
				tooRepetitive = "Feature.GameDetails.Label.TooRepetitive"
			}),
			networking = p2.dependencies.networking,
			placeId = ActionParams.placeId,
			setGameHidden = GetGameTileHiddenStoreFunction(CollectionId).setGameHidden,
			universeId = UniverseId
		})
		
		return
	else
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing or invalid actionParam: collectionId",
			propName = "collectionId",
			name = SduiActionType.SetGameTileNotInterested
		}, p2.appPage)
	end
end