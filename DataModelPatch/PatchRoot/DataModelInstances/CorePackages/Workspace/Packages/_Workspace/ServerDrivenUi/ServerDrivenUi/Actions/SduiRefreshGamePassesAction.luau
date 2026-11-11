local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local DataHydrationModule = require(Parent.DataHydration)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType

return function(p1, _, p2)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), DataHydrationModule (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.RefreshGamePasses
		}, p2.appPage)
		
		return
	end
	local UniverseId = ActionParams.universeId
	
	if UniverseId then
		DataHydrationModule.Game.getGamePassStore(false).fetchPassesForUniverse(UniverseId)
	end
end