local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local cryoModule = require(parent.Cryo)
local launchGame = require(parent.GameLaunch).LaunchGame
local fFlagDeferInExperienceRbxmDownload = require(parent.SharedFlags).FFlagDeferInExperienceRbxmDownload
local fFlagLuaAppFixLaunchGameSourceParam = require(parent.SharedFlags).FFlagLuaAppFixLaunchGameSourceParam
local sduiReportGamePlayIntent = require(parent.SduiSharedContent).sduiReportGamePlayIntent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local launchExperience = sduiCoreSystemModule.SduiActionType.LaunchExperience

return function(p0, p1, p2, _)
	-- upvalues: sduiErrorType (ref), launchExperience (ref), fFlagDeferInExperienceRbxmDownload (ref), cryoModule (ref), sduiReportGamePlayIntent (ref), fFlagLuaAppFixLaunchGameSourceParam (ref), launchGame (ref)
	local var2 = if p0 then p0.actionParams else nil
	
	if var2 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = launchExperience
		}, p2.appPage)
		
		return
	end
	assert(var2, "actionParams must exist")
	local placeId = var2.placeId
	
	if placeId == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing placeId",
			propName = "placeId",
			name = launchExperience
		}, p2.appPage)
		
		return
	end
	local universeId = var2.universeId
	local launchSource = var2.launchSource
	local experienceJoinData = var2.experienceJoinData
	
	if fFlagDeferInExperienceRbxmDownload then
		experienceJoinData = cryoModule.Dictionary.join(experienceJoinData or {}, { universeId = universeId })
	end
	sduiReportGamePlayIntent({
		sduiContext = p2,
		analyticsContext = p1,
		universeId = tostring(universeId or ""),
		placeId = placeId
	})
	
	if fFlagLuaAppFixLaunchGameSourceParam then
		launchGame(placeId, nil, experienceJoinData, nil, launchSource)
		
		return
	end
	launchGame(placeId, launchSource, experienceJoinData, nil)
end