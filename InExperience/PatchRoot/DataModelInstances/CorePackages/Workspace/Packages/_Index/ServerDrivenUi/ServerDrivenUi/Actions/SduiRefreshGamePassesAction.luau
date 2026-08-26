local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local dataHydrationModule = require(parent.DataHydration)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType

return function(p1, _, p2)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), dataHydrationModule (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.RefreshGamePasses
		}, p2.appPage)
		
		return
	end
	local universeId = var1.universeId
	
	if universeId then
		dataHydrationModule.Game.getGamePassStore(false).fetchPassesForUniverse(universeId)
	end
end