local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local LaunchGameFunction = require(Parent.GameLaunch).LaunchGame
local FFlagLuaAppFixLaunchGameSourceParam = require(Parent.SharedFlags).FFlagLuaAppFixLaunchGameSourceParam
local SduiReportGamePlayIntentFunction = require(Parent.SduiSharedContent).sduiReportGamePlayIntent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local LaunchExperience = SduiCoreSystemModule.SduiActionType.LaunchExperience

return function(p1, AnalyticsContext, SduiContext, _)
	-- upvalues: SduiErrorType (copy), LaunchExperience (copy), SduiReportGamePlayIntentFunction (copy), FFlagLuaAppFixLaunchGameSourceParam (copy), LaunchGameFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		SduiContext.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = LaunchExperience
		}, SduiContext.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local PlaceId = ActionParams.placeId
	
	if PlaceId == nil then
		SduiContext.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing placeId",
			propName = "placeId",
			name = LaunchExperience
		}, SduiContext.appPage)
		
		return
	end
	local LaunchSource = ActionParams.launchSource
	local ExperienceJoinData = ActionParams.experienceJoinData
	SduiReportGamePlayIntentFunction({
		sduiContext = SduiContext,
		analyticsContext = AnalyticsContext,
		universeId = tostring(ActionParams.universeId or ""),
		placeId = PlaceId
	})
	
	if FFlagLuaAppFixLaunchGameSourceParam then
		LaunchGameFunction(PlaceId, nil, ExperienceJoinData, nil, LaunchSource)
		
		return
	else
		LaunchGameFunction(PlaceId, LaunchSource, ExperienceJoinData, nil)
	end
end