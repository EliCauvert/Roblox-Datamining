local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local fetchGamePlayabilityAndProductInfo = require(parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local gamePlayButtonModule = require(parent.GamePlayButton)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType

return function(p0, _, p1) --[[ line: 15 | named "SduiRefreshPlayabilityAction" ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), gamePlayButtonModule (ref), fetchGamePlayabilityAndProductInfo (ref)
	local var2 = if p0 then p0.actionParams else nil
	
	if var2 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.RefreshPlayability
		}, p1.appPage)
		
		return
	end
	local universeId = var2.universeId
	
	if universeId == nil then return end
	if gamePlayButtonModule.Flags.GetFFlagLuaAppFetchPlayabilityKillSwitch() then return end
	local networking = p1.dependencies.networking
	
	if networking == nil then
		p1.dependencies.logger.reportError(sduiErrorType.GetNilDependencies, {
			message = "RefreshPlayability requires networking dependency",
			name = sduiActionType.RefreshPlayability
		}, p1.appPage)
		
		return
	end
	p1.dependencies.dispatch(fetchGamePlayabilityAndProductInfo.Fetch(networking, universeId))
end