local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local gameTileModule = require(parent.GameTile)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local getGameTileHiddenStore = gameTileModule.getGameTileHiddenStore
local undoGameNotInterested = gameTileModule.undoGameNotInterested

local function _(p1, p2, p3)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref)
	p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		name = sduiActionType.UndoGameTileNotInterested,
		message = p2,
		propName = p3
	}, p1.appPage)
end

return function(p1, _, p2)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), undoGameNotInterested (ref), getGameTileHiddenStore (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			propName = nil,
			name = sduiActionType.UndoGameTileNotInterested
		}, p2.appPage)
		
		return
	end
	local universeId = var1.universeId
	
	if typeof(universeId) ~= "string" or universeId == "" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing or invalid actionParam: universeId",
			propName = "universeId",
			name = sduiActionType.UndoGameTileNotInterested
		}, p2.appPage)
		
		return
	end
	local collectionId = var1.collectionId
	
	if typeof(collectionId) == "string" and collectionId ~= "" then
		undoGameNotInterested({
			appPage = p2.appPage,
			collectionId = collectionId,
			dispatch = p2.dependencies.dispatch,
			networking = p2.dependencies.networking,
			setGameHidden = getGameTileHiddenStore(collectionId).setGameHidden,
			universeId = universeId
		})
		
		return
	end
	p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		message = "Missing or invalid actionParam: collectionId",
		propName = "collectionId",
		name = sduiActionType.UndoGameTileNotInterested
	}, p2.appPage)
end