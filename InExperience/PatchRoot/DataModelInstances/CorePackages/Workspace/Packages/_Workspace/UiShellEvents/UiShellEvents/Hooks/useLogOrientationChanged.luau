local uiShellEvents = script:FindFirstAncestor("UiShellEvents")
local parent = uiShellEvents.Parent
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local useCurrentCamera = require(parent.RobloxAppHooks).useCurrentCamera
local useDeviceOrientation = require(parent.RobloxAppHooks).useDeviceOrientation
local getCurrentRouteState = require(parent.Navigation).getCurrentRouteState
local _ = require(parent.RobloxAppEnums)
local orientationChangedEventModule = require(uiShellEvents.Analytics.orientationChangedEvent)
local logSessionOnOrientationChange = game:DefineFastFlag("LogSessionOnOrientationChange", false)
local var1 = if logSessionOnOrientationChange then game:GetService("SessionService") else nil
local t = {
	[Enum.ScreenOrientation.LandscapeLeft] = "LandscapeLeft",
	[Enum.ScreenOrientation.LandscapeRight] = "LandscapeRight",
	[Enum.ScreenOrientation.LandscapeSensor] = "LandscapeSensor",
	[Enum.ScreenOrientation.Portrait] = "Portrait",
	[Enum.ScreenOrientation.Sensor] = "Sensor"
}

local function _(value)
	return math.floor(value or 0.5)
end

return function(p1, p2, p3)
	-- upvalues: useNavigation (ref), useCurrentCamera (ref), useDeviceOrientation (ref), getCurrentRouteState (ref), t (ref), reactModule (ref), logSessionOnOrientationChange (ref), var1 (ref), orientationChangedEventModule (ref)
	local var2 = useNavigation()
	local var3 = useCurrentCamera()
	local var4 = useDeviceOrientation()
	p3 = p3 or (getCurrentRouteState(var2) or {}).name
	local var5 = t[p2]
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var5 (ref), logSessionOnOrientationChange (copy), var1 (copy), orientationChangedEventModule (copy), p1 (ref), p3 (ref), var3 (ref)
		local var6 = tostring(game.GameId)
		local var7 = if var6 == "0" then "app" else "experience"
		
		if var4 or var5 then
			local level2aSessionID = nil
			local level2bSessionID = nil
			local level2aSessionTag = nil
			local level2bSessionTag = nil
			
			if logSessionOnOrientationChange and var1 then
				if var1:SessionExists("level2a") then
					level2aSessionID = var1:GetSessionID("level2a")
					level2aSessionTag = var1:GetSessionTag("level2a")
				end
				if var1:SessionExists("level2b") then
					level2bSessionID = var1:GetSessionID("level2b")
					level2bSessionTag = var1:GetSessionTag("level2b")
				end
			end
			orientationChangedEventModule(p1, var7, {
				deviceOrientation = var4,
				experienceOrientation = var5,
				page = p3,
				viewportX = math.floor(var3.ViewportSize.X or 0.5),
				viewportY = math.floor(var3.ViewportSize.Y or 0.5),
				universeId = var6,
				l2a_session_id = level2aSessionID,
				l2b_session_id = level2bSessionID,
				l2a_session_tag = level2aSessionTag,
				l2b_session_tag = level2bSessionTag
			})
		end
	end, { p1, var4, var5 })
end