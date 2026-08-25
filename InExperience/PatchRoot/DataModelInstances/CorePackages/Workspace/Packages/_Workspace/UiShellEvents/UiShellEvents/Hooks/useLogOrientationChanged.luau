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
local var4 = if logSessionOnOrientationChange then game:GetService("SessionService") else nil
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

return function(p0, p1, p2)
	-- upvalues: useNavigation (ref), useCurrentCamera (ref), useDeviceOrientation (ref), getCurrentRouteState (ref), t (ref), reactModule (ref), logSessionOnOrientationChange (ref), var4 (ref), orientationChangedEventModule (ref)
	local var6 = useNavigation()
	local var7 = useCurrentCamera()
	local var8 = useDeviceOrientation()
	p2 = p2 or (getCurrentRouteState(var6) or {}).name
	local var10 = t[p1]
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var10 (ref), logSessionOnOrientationChange (copy), var4 (copy), orientationChangedEventModule (copy), p0 (ref), p2 (ref), var7 (ref)
		local var11 = tostring(game.GameId)
		local var12 = if var11 == "0" then "app" else "experience"
		
		if var8 or var10 then
			local level2aSessionID = nil
			local level2bSessionID = nil
			local level2aSessionTag = nil
			local level2bSessionTag = nil
			
			if logSessionOnOrientationChange and var4 then
				if var4:SessionExists("level2a") then
					level2aSessionID = var4:GetSessionID("level2a")
					level2aSessionTag = var4:GetSessionTag("level2a")
				end
				if var4:SessionExists("level2b") then
					level2bSessionID = var4:GetSessionID("level2b")
					level2bSessionTag = var4:GetSessionTag("level2b")
				end
			end
			orientationChangedEventModule(p0, var12, {
				deviceOrientation = var8,
				experienceOrientation = var10,
				page = p2,
				viewportX = math.floor(var7.ViewportSize.X or 0.5),
				viewportY = math.floor(var7.ViewportSize.Y or 0.5),
				universeId = var11,
				l2a_session_id = level2aSessionID,
				l2b_session_id = level2bSessionID,
				l2a_session_tag = level2aSessionTag,
				l2b_session_tag = level2bSessionTag
			})
		end
	end, { p0, var8, var10 })
end