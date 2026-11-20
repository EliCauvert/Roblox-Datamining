local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GetGameTileHiddenStoreFunction = require(Parent.GameTile).getGameTileHiddenStore
local FFlagLuaAppNotInterestedTileFeedbackButton = require(Parent.SharedFlags).FFlagLuaAppNotInterestedTileFeedbackButton

local function _(p1, Message, PropName)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy)
	p1.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
		name = SduiActionType.OpenGameNotInterestedFeedback,
		message = Message,
		propName = PropName
	}, p1.appPage)
end

return function(p1, _, p2)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), FFlagLuaAppNotInterestedTileFeedbackButton (copy), GetGameTileHiddenStoreFunction (copy)
	local ActionParams = if p1 then p1.actionParams else nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			propName = nil,
			name = SduiActionType.OpenGameNotInterestedFeedback
		}, p2.appPage)
		
		return
	end
	local UniverseId = ActionParams.universeId
	
	if typeof(UniverseId) ~= "string" or UniverseId == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing or invalid actionParam: universeId",
			propName = "universeId",
			name = SduiActionType.OpenGameNotInterestedFeedback
		}, p2.appPage)
		
		return
	end
	local CollectionId = ActionParams.collectionId
	
	if typeof(CollectionId) ~= "string" or CollectionId == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing or invalid actionParam: collectionId",
			propName = "collectionId",
			name = SduiActionType.OpenGameNotInterestedFeedback
		}, p2.appPage)
		
		return
	end
	if FFlagLuaAppNotInterestedTileFeedbackButton then
		local GameTileHiddenStore = GetGameTileHiddenStoreFunction(CollectionId)
		local FeedbackOpener: () -> () = GameTileHiddenStore.getFeedbackOpeners(false)[UniverseId]
		
		if GameTileHiddenStore.getHiddenGames(false)[UniverseId] == true and FeedbackOpener then
			FeedbackOpener()
		end
	end
end