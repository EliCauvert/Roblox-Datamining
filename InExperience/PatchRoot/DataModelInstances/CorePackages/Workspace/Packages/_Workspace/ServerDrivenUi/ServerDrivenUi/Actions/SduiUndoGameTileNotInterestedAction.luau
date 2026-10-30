local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local GameTileModule = require(Parent.GameTile)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GetGameTileHiddenStoreFunction = GameTileModule.getGameTileHiddenStore
local UndoGameNotInterestedFunction = GameTileModule.undoGameNotInterested

local function _(p1, Message, PropName)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy)
	p1.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
		name = SduiActionType.UndoGameTileNotInterested,
		message = Message,
		propName = PropName
	}, p1.appPage)
end

return function(p1, _, p2)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), UndoGameNotInterestedFunction (copy), GetGameTileHiddenStoreFunction (copy)
	local ActionParams = if p1 then p1.actionParams else nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			propName = nil,
			name = SduiActionType.UndoGameTileNotInterested
		}, p2.appPage)
		
		return
	end
	local UniverseId = ActionParams.universeId
	
	if typeof(UniverseId) ~= "string" or UniverseId == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing or invalid actionParam: universeId",
			propName = "universeId",
			name = SduiActionType.UndoGameTileNotInterested
		}, p2.appPage)
		
		return
	end
	local CollectionId = ActionParams.collectionId
	
	if typeof(CollectionId) == "string" and CollectionId ~= "" then
		UndoGameNotInterestedFunction({
			appPage = p2.appPage,
			collectionId = CollectionId,
			dispatch = p2.dependencies.dispatch,
			networking = p2.dependencies.networking,
			setGameHidden = GetGameTileHiddenStoreFunction(CollectionId).setGameHidden,
			universeId = UniverseId
		})
		
		return
	else
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing or invalid actionParam: collectionId",
			propName = "collectionId",
			name = SduiActionType.UndoGameTileNotInterested
		}, p2.appPage)
	end
end