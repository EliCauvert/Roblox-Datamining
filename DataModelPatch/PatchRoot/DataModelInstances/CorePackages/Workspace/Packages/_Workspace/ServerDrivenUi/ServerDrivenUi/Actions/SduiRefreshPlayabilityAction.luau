local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local FetchGamePlayabilityAndProductInfo = require(Parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local GamePlayButtonModule = require(Parent.GamePlayButton)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType

return function(p1, _, p2)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), GamePlayButtonModule (copy), FetchGamePlayabilityAndProductInfo (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.RefreshPlayability
		}, p2.appPage)
		
		return
	end
	local UniverseId = ActionParams.universeId
	
	if UniverseId == nil then return end
	if GamePlayButtonModule.Flags.GetFFlagLuaAppFetchPlayabilityKillSwitch() then return end
	local Networking = p2.dependencies.networking
	
	if Networking == nil then
		p2.dependencies.logger.reportError(SduiErrorType.GetNilDependencies, {
			message = "RefreshPlayability requires networking dependency",
			name = SduiActionType.RefreshPlayability
		}, p2.appPage)
		
		return
	else
		p2.dependencies.dispatch(FetchGamePlayabilityAndProductInfo.Fetch(Networking, UniverseId))
	end
end