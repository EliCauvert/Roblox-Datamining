local IXPService = game:GetService("IXPService")
local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local navigateToBadgesSeeAll = require(parent.Badges).navigateToBadgesSeeAll
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local fFlagLuaAppBadgesSeeAllLogExposure = require(parent.SharedFlags).FFlagLuaAppBadgesSeeAllLogExposure
local fStringLuaAppBadgesSeeAllIxpLayer = require(parent.SharedFlags).FStringLuaAppBadgesSeeAllIxpLayer

return function(p0, _, p1, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), fFlagLuaAppBadgesSeeAllLogExposure (ref), IXPService (ref), fStringLuaAppBadgesSeeAllIxpLayer (ref), navigateToBadgesSeeAll (ref)
	local var2 = if p0 then p0.actionParams else nil
	
	if var2 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenBadgesSeeAll
		}, p1.appPage)
		
		return
	end
	local universeId = var2.universeId
	
	if typeof(universeId) ~= "string" or universeId == "" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "universeId",
			name = sduiActionType.OpenBadgesSeeAll,
			message = `Invalid or missing universeId: {tostring(universeId)}`
		}, p1.appPage)
		
		return
	elseif fFlagLuaAppBadgesSeeAllLogExposure then
		IXPService:LogFlagLinkedUserLayerExposure(fStringLuaAppBadgesSeeAllIxpLayer)
	end
	navigateToBadgesSeeAll(p1.dependencies.getNavigation(), universeId)
end