local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local launchGame = require(parent.GameLaunch).LaunchGame
local fFlagLuaAppFixLaunchGameSourceParam = require(parent.SharedFlags).FFlagLuaAppFixLaunchGameSourceParam
local sduiReportGamePlayIntent = require(parent.SduiSharedContent).sduiReportGamePlayIntent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local launchExperience = sduiCoreSystemModule.SduiActionType.LaunchExperience

return function(p0, p1, p2, _) --[[ line: 30 ]]
	-- upvalues: sduiErrorType (ref), launchExperience (ref), sduiReportGamePlayIntent (ref), fFlagLuaAppFixLaunchGameSourceParam (ref), launchGame (ref)
	local var1 = if p0 then p0.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = launchExperience
		}, p2.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local placeId = var1.placeId
	
	if placeId == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing placeId",
			propName = "placeId",
			name = launchExperience
		}, p2.appPage)
		
		return
	end
	local universeId = var1.universeId
	local launchSource = var1.launchSource
	local experienceJoinData = var1.experienceJoinData
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