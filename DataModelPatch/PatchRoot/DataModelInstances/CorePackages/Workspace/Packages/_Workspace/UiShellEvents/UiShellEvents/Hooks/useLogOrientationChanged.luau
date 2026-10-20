local UiShellEvents = script:FindFirstAncestor("UiShellEvents")
local Parent = UiShellEvents.Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseCurrentCameraFunction = require(Parent.RobloxAppHooks).useCurrentCamera
local UseDeviceOrientationFunction = require(Parent.RobloxAppHooks).useDeviceOrientation
local GetCurrentRouteStateFunction = require(Parent.Navigation).getCurrentRouteState
local _ = require(Parent.RobloxAppEnums)
local OrientationChangedEventModule = require(UiShellEvents.Analytics.orientationChangedEvent)
local LogSessionOnOrientationChange = game:DefineFastFlag("LogSessionOnOrientationChange", false)
local SessionService = if LogSessionOnOrientationChange then game:GetService("SessionService") else nil
local config = {
	[Enum.ScreenOrientation.LandscapeLeft] = "LandscapeLeft",
	[Enum.ScreenOrientation.LandscapeRight] = "LandscapeRight",
	[Enum.ScreenOrientation.LandscapeSensor] = "LandscapeSensor",
	[Enum.ScreenOrientation.Portrait] = "Portrait",
	[Enum.ScreenOrientation.Sensor] = "Sensor"
}

local function _(p1): number
	return (math.floor(p1 or 0.5))
end

return function(p1, p2, p3)
	-- upvalues: UseNavigationFunction (copy), UseCurrentCameraFunction (copy), UseDeviceOrientationFunction (copy), GetCurrentRouteStateFunction (copy), config (copy), ReactModule (copy), LogSessionOnOrientationChange (copy), SessionService (copy), OrientationChangedEventModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseCurrentCameraResult = UseCurrentCameraFunction()
	local UseDeviceOrientationResult = UseDeviceOrientationFunction()
	local CurrentRouteState = GetCurrentRouteStateFunction(UseNavigationResult) or {}
	local P3 = p3 or CurrentRouteState.name
	local Entry = config[p2]
	ReactModule.useEffect(function()
		-- upvalues: UseDeviceOrientationResult (copy), Entry (copy), LogSessionOnOrientationChange (upval), SessionService (upval), OrientationChangedEventModule (upval), p1 (copy), P3 (copy), UseCurrentCameraResult (copy)
		local Text = tostring(game.GameId)
		local App: string = if Text == "0" then "app" else "experience"
		
		if UseDeviceOrientationResult or Entry then
			local Level2aSessionID = nil
			local Level2bSessionID = nil
			local Level2aSessionTag = nil
			local Level2bSessionTag = nil
			
			if LogSessionOnOrientationChange and SessionService then
				if SessionService:SessionExists("level2a") then
					Level2aSessionID = SessionService:GetSessionID("level2a")
					Level2aSessionTag = SessionService:GetSessionTag("level2a")
				end
				if SessionService:SessionExists("level2b") then
					Level2bSessionID = SessionService:GetSessionID("level2b")
					Level2bSessionTag = SessionService:GetSessionTag("level2b")
				end
			end
			OrientationChangedEventModule(p1, App, {
				deviceOrientation = UseDeviceOrientationResult,
				experienceOrientation = Entry,
				page = P3,
				viewportX = math.floor(UseCurrentCameraResult.ViewportSize.X or 0.5),
				viewportY = math.floor(UseCurrentCameraResult.ViewportSize.Y or 0.5),
				universeId = Text,
				l2a_session_id = Level2aSessionID,
				l2b_session_id = Level2bSessionID,
				l2a_session_tag = Level2aSessionTag,
				l2b_session_tag = Level2bSessionTag
			})
		end
	end, { p1, UseDeviceOrientationResult, Entry })
end