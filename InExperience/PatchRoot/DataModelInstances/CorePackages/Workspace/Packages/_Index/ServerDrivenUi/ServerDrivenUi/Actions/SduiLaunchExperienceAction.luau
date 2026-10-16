local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local CryoModule = require(Parent.Cryo)
local LaunchGameFunction = require(Parent.GameLaunch).LaunchGame
local FFlagDeferInExperienceRbxmDownload = require(Parent.SharedFlags).FFlagDeferInExperienceRbxmDownload
local FFlagLuaAppFixLaunchGameSourceParam = require(Parent.SharedFlags).FFlagLuaAppFixLaunchGameSourceParam
local SduiReportGamePlayIntentFunction = require(Parent.SduiSharedContent).sduiReportGamePlayIntent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local LaunchExperience = SduiCoreSystemModule.SduiActionType.LaunchExperience

return function(p1, AnalyticsContext, SduiContext, _) --[[ Line: 32 ]]
	-- upvalues: SduiErrorType (copy), LaunchExperience (copy), FFlagDeferInExperienceRbxmDownload (copy), CryoModule (copy), SduiReportGamePlayIntentFunction (copy), FFlagLuaAppFixLaunchGameSourceParam (copy), LaunchGameFunction (copy)
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
	local UniverseId = ActionParams.universeId
	local LaunchSource = ActionParams.launchSource
	local ExperienceJoinData = ActionParams.experienceJoinData
	
	if FFlagDeferInExperienceRbxmDownload then
		ExperienceJoinData = CryoModule.Dictionary.join(ExperienceJoinData or {}, { universeId = UniverseId })
	end
	SduiReportGamePlayIntentFunction({
		sduiContext = SduiContext,
		analyticsContext = AnalyticsContext,
		universeId = tostring(UniverseId or ""),
		placeId = PlaceId
	})
	
	if FFlagLuaAppFixLaunchGameSourceParam then
		LaunchGameFunction(PlaceId, nil, ExperienceJoinData, nil, LaunchSource)
		
		return
	else
		LaunchGameFunction(PlaceId, LaunchSource, ExperienceJoinData, nil)
	end
end