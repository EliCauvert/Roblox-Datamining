local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local CryoModule = require(Parent.Cryo)
local LaunchGameFunction = require(Parent.GameLaunch).LaunchGame
local FFlagDeferInExperienceRbxmDownload = require(Parent.SharedFlags).FFlagDeferInExperienceRbxmDownload
local FFlagLuaAppFixLaunchGameSourceParam = require(Parent.SharedFlags).FFlagLuaAppFixLaunchGameSourceParam
local FFlagSduiLaunchExperienceCheckPlayabilityBeforeLaunch = require(Parent.SharedFlags).FFlagSduiLaunchExperienceCheckPlayabilityBeforeLaunch
local SduiReportGamePlayIntentFunction = require(Parent.SduiSharedContent).sduiReportGamePlayIntent
local LaunchUnlessNotPlayableFunction = require(Parent.GamePlayButton).LaunchUnlessNotPlayable
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local ExecuteActionFunction = SduiCoreSystemModule.executeAction
local LaunchExperience = SduiActionType.LaunchExperience

local function launchExperience(PlaceId, UniverseId, LaunchSource, ExperienceJoinData, AnalyticsContext, SduiContext)
	-- upvalues: SduiReportGamePlayIntentFunction (copy), FFlagLuaAppFixLaunchGameSourceParam (copy), LaunchGameFunction (copy)
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

return function(p1, AnalyticsContext, SduiContext, _)
	-- upvalues: SduiErrorType (copy), LaunchExperience (copy), FFlagDeferInExperienceRbxmDownload (copy), CryoModule (copy), FFlagSduiLaunchExperienceCheckPlayabilityBeforeLaunch (copy), launchExperience (copy), SduiActionType (copy), ExecuteActionFunction (copy), LaunchUnlessNotPlayableFunction (copy), SduiReportGamePlayIntentFunction (copy), FFlagLuaAppFixLaunchGameSourceParam (copy), LaunchGameFunction (copy)
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
	if not FFlagSduiLaunchExperienceCheckPlayabilityBeforeLaunch then
		SduiReportGamePlayIntentFunction({
			sduiContext = SduiContext,
			analyticsContext = AnalyticsContext,
			universeId = tostring(UniverseId or ""),
			placeId = PlaceId
		})
		
		if FFlagLuaAppFixLaunchGameSourceParam then
			LaunchGameFunction(PlaceId, nil, ExperienceJoinData, nil, LaunchSource)
		else
			LaunchGameFunction(PlaceId, LaunchSource, ExperienceJoinData, nil)
		end
	elseif ActionParams.checkPlayabilityBeforeLaunch == true then
		local function launch()
			-- upvalues: launchExperience (upval), PlaceId (copy), UniverseId (copy), LaunchSource (copy), ExperienceJoinData (ref), AnalyticsContext (copy), SduiContext (copy)
			launchExperience(PlaceId, UniverseId, LaunchSource, ExperienceJoinData, AnalyticsContext, SduiContext)
		end
		
		if UniverseId == nil then
			SduiContext.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
				message = "Missing universeId for checkPlayabilityBeforeLaunch",
				propName = "universeId",
				name = LaunchExperience
			}, SduiContext.appPage)
			launchExperience(PlaceId, UniverseId, LaunchSource, ExperienceJoinData, AnalyticsContext, SduiContext)
			
			return
		end
		local Dependencies = SduiContext.dependencies
		
		if Dependencies.networking == nil then
			Dependencies.logger.reportError(SduiErrorType.GetNilDependencies, {
				message = "checkPlayabilityBeforeLaunch requires networking dependency",
				name = LaunchExperience
			}, SduiContext.appPage)
			launchExperience(PlaceId, UniverseId, LaunchSource, ExperienceJoinData, AnalyticsContext, SduiContext)
			
			return
		else
			Dependencies.dispatch(LaunchUnlessNotPlayableFunction(Dependencies.networking, tostring(UniverseId), launch, function()
				-- upvalues: SduiActionType (upval), ActionParams (copy), ExecuteActionFunction (upval), AnalyticsContext (copy), SduiContext (copy)
				ExecuteActionFunction({
					actionType = SduiActionType.OpenGameDetails,
					actionParams = ActionParams
				}, AnalyticsContext, SduiContext)
			end))
			
			return
		end
	else
		launchExperience(PlaceId, UniverseId, LaunchSource, ExperienceJoinData, AnalyticsContext, SduiContext)
	end
end