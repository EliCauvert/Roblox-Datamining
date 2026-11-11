local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local ReactModule = require(CorePackages.Packages.React)
local VideoPlaybackCoordinator = require(CorePackages.Workspace.Packages.VideoUtils).VideoPlaybackCoordinator

return require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy.connect(function(p1, _)
	return { throttleFramerate = p1.getThrottleFramerate() }
end)(function(p1)
	-- upvalues: ReactModule (copy), RunService (copy), VideoPlaybackCoordinator (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), RunService (upval), VideoPlaybackCoordinator (upval)
		if p1.throttleFramerate then
			RunService:setThrottleFramerateEnabled(true)
			VideoPlaybackCoordinator.default:setIsSettingFramerateThrottleAllowedByPolicy(true)
			VideoPlaybackCoordinator.default:setPreferredFramerateThrottling(true)
		end
		return function()
			-- upvalues: p1 (upval), RunService (upval), VideoPlaybackCoordinator (upval)
			if p1.throttleFramerate then
				RunService:setThrottleFramerateEnabled(false)
				VideoPlaybackCoordinator.default:setIsSettingFramerateThrottleAllowedByPolicy(false)
				VideoPlaybackCoordinator.default:setPreferredFramerateThrottling(false)
			end
		end
	end, {})
end)