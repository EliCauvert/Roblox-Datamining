local IXPService = game:GetService("IXPService")
local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local navigateToBadgesSeeAll = require(parent.Badges).navigateToBadgesSeeAll
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local fFlagLuaAppBadgesSeeAllLogExposure = require(parent.SharedFlags).FFlagLuaAppBadgesSeeAllLogExposure
local fStringLuaAppBadgesSeeAllIxpLayer = require(parent.SharedFlags).FStringLuaAppBadgesSeeAllIxpLayer

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), fFlagLuaAppBadgesSeeAllLogExposure (ref), IXPService (ref), fStringLuaAppBadgesSeeAllIxpLayer (ref), navigateToBadgesSeeAll (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenBadgesSeeAll
		}, p2.appPage)
		
		return
	end
	local universeId = var1.universeId
	
	if typeof(universeId) ~= "string" or universeId == "" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "universeId",
			name = sduiActionType.OpenBadgesSeeAll,
			message = `Invalid or missing universeId: {tostring(universeId)}`
		}, p2.appPage)
		
		return
	elseif fFlagLuaAppBadgesSeeAllLogExposure then
		IXPService:LogFlagLinkedUserLayerExposure(fStringLuaAppBadgesSeeAllIxpLayer)
	end
	navigateToBadgesSeeAll(p2.dependencies.getNavigation(), universeId)
end