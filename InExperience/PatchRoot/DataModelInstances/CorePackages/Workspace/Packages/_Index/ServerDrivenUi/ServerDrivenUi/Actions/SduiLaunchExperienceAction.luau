local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local cryoModule = require(parent.Cryo)
local launchGame = require(parent.GameLaunch).LaunchGame
local fFlagDeferInExperienceRbxmDownload = require(parent.SharedFlags).FFlagDeferInExperienceRbxmDownload
local fFlagLuaAppFixLaunchGameSourceParam = require(parent.SharedFlags).FFlagLuaAppFixLaunchGameSourceParam
local sduiReportGamePlayIntent = require(parent.SduiSharedContent).sduiReportGamePlayIntent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local launchExperience = sduiCoreSystemModule.SduiActionType.LaunchExperience

return function(p1, p2, p3, _)
	-- upvalues: sduiErrorType (ref), launchExperience (ref), fFlagDeferInExperienceRbxmDownload (ref), cryoModule (ref), sduiReportGamePlayIntent (ref), fFlagLuaAppFixLaunchGameSourceParam (ref), launchGame (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = launchExperience
		}, p3.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local placeId = var1.placeId
	
	if placeId == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing placeId",
			propName = "placeId",
			name = launchExperience
		}, p3.appPage)
		
		return
	end
	local universeId = var1.universeId
	local launchSource = var1.launchSource
	local experienceJoinData = var1.experienceJoinData
	
	if fFlagDeferInExperienceRbxmDownload then
		experienceJoinData = cryoModule.Dictionary.join(experienceJoinData or {}, { universeId = universeId })
	end
	sduiReportGamePlayIntent({
		sduiContext = p3,
		analyticsContext = p2,
		universeId = tostring(universeId or ""),
		placeId = placeId
	})
	
	if fFlagLuaAppFixLaunchGameSourceParam then
		launchGame(placeId, nil, experienceJoinData, nil, launchSource)
		
		return
	end
	launchGame(placeId, launchSource, experienceJoinData, nil)
end