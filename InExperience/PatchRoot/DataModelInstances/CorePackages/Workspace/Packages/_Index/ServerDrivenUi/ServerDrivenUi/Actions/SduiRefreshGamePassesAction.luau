local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local dataHydrationModule = require(parent.DataHydration)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType

return function(p0, _, p1)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), dataHydrationModule (ref)
	local var2 = if p0 then p0.actionParams else nil
	
	if var2 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.RefreshGamePasses
		}, p1.appPage)
		
		return
	end
	local universeId = var2.universeId
	
	if universeId then
		dataHydrationModule.Game.getGamePassStore(false).fetchPassesForUniverse(universeId)
	end
end