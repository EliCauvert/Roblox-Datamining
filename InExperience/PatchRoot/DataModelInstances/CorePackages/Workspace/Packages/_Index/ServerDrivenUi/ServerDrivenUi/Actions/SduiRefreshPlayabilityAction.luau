local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local fetchGamePlayabilityAndProductInfo = require(parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local gamePlayButtonModule = require(parent.GamePlayButton)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType

return function(p1, _, p2)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), gamePlayButtonModule (ref), fetchGamePlayabilityAndProductInfo (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.RefreshPlayability
		}, p2.appPage)
		
		return
	end
	local universeId = var1.universeId
	
	if universeId == nil then return end
	if gamePlayButtonModule.Flags.GetFFlagLuaAppFetchPlayabilityKillSwitch() then return end
	local networking = p2.dependencies.networking
	
	if networking == nil then
		p2.dependencies.logger.reportError(sduiErrorType.GetNilDependencies, {
			message = "RefreshPlayability requires networking dependency",
			name = sduiActionType.RefreshPlayability
		}, p2.appPage)
		
		return
	end
	p2.dependencies.dispatch(fetchGamePlayabilityAndProductInfo.Fetch(networking, universeId))
end