local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local gameTileModule = require(parent.GameTile)
local localizationModule = require(parent.Localization)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local activateGameNotInterested = gameTileModule.activateGameNotInterested
local getGameTileHiddenStore = gameTileModule.getGameTileHiddenStore
local localizeStrings = localizationModule.localizeStrings

local function _(p1, p2, p3)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref)
	p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		name = sduiActionType.SetGameTileNotInterested,
		message = p2,
		propName = p3
	}, p1.appPage)
end

return function(value, _, p1)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), localizeStrings (ref), activateGameNotInterested (ref), getGameTileHiddenStore (ref)
	local var1 = if value then value.actionParams else nil
	
	if var1 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			propName = nil,
			name = sduiActionType.SetGameTileNotInterested
		}, p1.appPage)
		
		return
	end
	local universeId = var1.universeId
	
	if typeof(universeId) ~= "string" or universeId == "" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing or invalid actionParam: universeId",
			propName = "universeId",
			name = sduiActionType.SetGameTileNotInterested
		}, p1.appPage)
		
		return
	end
	local collectionId = var1.collectionId
	
	if typeof(collectionId) == "string" and collectionId ~= "" then
		activateGameNotInterested({
			appPage = p1.appPage,
			collectionId = collectionId,
			dispatch = p1.dependencies.dispatch,
			localizedStrings = localizeStrings(p1.dependencies.localization, {
				checkboxListTitle = "Feature.GameDetails.Message.HidingExperienceQuestion",
				dialogText = "Feature.GameDetails.Message.HelpImproveExperience",
				dialogTitle = "Feature.GameDetails.Label.ProvideFeedbackTitle",
				dontLikeGame = "Feature.GameDetails.Label.DontLikeGame",
				dontLikeImage = "Feature.GameDetails.Label.DontLikeImage",
				inappropriateContent = "Feature.GameDetails.Label.InappropriateContent",
				somethingElse = "Feature.GameDetails.Label.SomethingElse",
				tooRepetitive = "Feature.GameDetails.Label.TooRepetitive"
			}),
			networking = p1.dependencies.networking,
			placeId = var1.placeId,
			setGameHidden = getGameTileHiddenStore(collectionId).setGameHidden,
			universeId = universeId
		})
		
		return
	end
	p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		message = "Missing or invalid actionParam: collectionId",
		propName = "collectionId",
		name = sduiActionType.SetGameTileNotInterested
	}, p1.appPage)
end