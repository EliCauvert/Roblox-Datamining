local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local SocialLuaAnalyticsModule = require(CorePackages.Workspace.Packages.SocialLuaAnalytics)
local EventNamesModule = require(CorePackages.Workspace.Packages.ProfilePlatform.EventNames)
local SocialStopwatchModule = require(CorePackages.Workspace.Packages.SocialStopwatch)
local v1 = require(CorePackages.Workspace.Packages.ProfilePlatform.initializeProfileAnalytics)()

return function(p1)
	-- upvalues: ArgCheckModule (copy), SocialStopwatchModule (copy), v1 (copy), EventNamesModule (copy), SocialLuaAnalyticsModule (copy), SetCentralOverlayModule (copy), OverlayTypeModule (copy)
	return function(p2)
		-- upvalues: ArgCheckModule (upval), p1 (copy), SocialStopwatchModule (upval), v1 (upval), EventNamesModule (upval), SocialLuaAnalyticsModule (upval), SetCentralOverlayModule (upval), OverlayTypeModule (upval)
		ArgCheckModule.isType(p1.user, "table", "props.user passed down to OpenCentralOverlayForPeopleList")
		ArgCheckModule.isType(p1.positionIndex, "number", "props.positionIndex passed down to OpenCentralOverlayForPeopleList")
		ArgCheckModule.isType(p1.onOpen, "function", "props.onOpen passed down to OpenCentralOverlayForPeopleList")
		ArgCheckModule.isType(p1.onClose, "function", "props.onClose passed down to OpenCentralOverlayForPeopleList")
		ArgCheckModule.isType(p1.anchorSpaceSize, "Vector2", "props.anchorSpaceSize passed down to OpenCentralOverlayForPeopleList")
		ArgCheckModule.isType(p1.anchorSpacePosition, "Vector2", "props.anchorSpacePosition passed down to OpenCentralOverlayForPeopleList")
		ArgCheckModule.isType(p1.absolutePosition, "number", "props.absolutePosition passed down to OpenCentralOverlayForPeopleList")
		SocialStopwatchModule.Stopwatch.start(SocialStopwatchModule.Events.JoinGameCardOpened);
		(if p1.mockProfileAnalytics_dev then p1.mockProfileAnalytics_dev else v1).fireAnalyticsEvent(EventNamesModule.ProfileInExperienceUserLoadingStage, {
			statValue = 0,
			status = SocialLuaAnalyticsModule.Analytics.Enums.LoadingStages.Started
		})
		p2:dispatch(SetCentralOverlayModule(OverlayTypeModule.PeopleList, p1))
	end
end