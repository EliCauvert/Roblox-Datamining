local IXPService = game:GetService("IXPService")
local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local NavigateToBadgesSeeAllFunction = require(Parent.Badges).navigateToBadgesSeeAll
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local FFlagLuaAppBadgesSeeAllLogExposure = require(Parent.SharedFlags).FFlagLuaAppBadgesSeeAllLogExposure
local FStringLuaAppBadgesSeeAllIxpLayer = require(Parent.SharedFlags).FStringLuaAppBadgesSeeAllIxpLayer

return function(p1, _, p2, _) --[[ Line: 18 ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), FFlagLuaAppBadgesSeeAllLogExposure (copy), IXPService (copy), FStringLuaAppBadgesSeeAllIxpLayer (copy), NavigateToBadgesSeeAllFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenBadgesSeeAll
		}, p2.appPage)
		
		return
	end
	local UniverseId = ActionParams.universeId
	
	if typeof(UniverseId) ~= "string" or UniverseId == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "universeId",
			name = SduiActionType.OpenBadgesSeeAll,
			message = `Invalid or missing universeId: {tostring(UniverseId)}`
		}, p2.appPage)
		
		return
	end
	if FFlagLuaAppBadgesSeeAllLogExposure then
		IXPService:LogFlagLinkedUserLayerExposure(FStringLuaAppBadgesSeeAllIxpLayer)
	end
	NavigateToBadgesSeeAllFunction(p2.dependencies.getNavigation(), UniverseId)
end