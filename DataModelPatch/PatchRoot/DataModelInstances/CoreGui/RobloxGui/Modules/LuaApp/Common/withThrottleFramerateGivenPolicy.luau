local RunService = game:GetService("RunService")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local AppRunService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppRunService
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local UseRoactServiceModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Hooks.useRoactService)
local VideoPlaybackCoordinator = require(CorePackages.Workspace.Packages.VideoUtils).VideoPlaybackCoordinator
local Object = require(CorePackages.Packages.LuauPolyfill).Object
local FFlagLuaAppVideoPlaybackRefCount = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppVideoPlaybackRefCount

return function(p1)
	-- upvalues: ReactModule (copy), UseRoactServiceModule (copy), AppRunService (copy), RunService (copy), RoactAppPolicy (copy), FFlagLuaAppVideoPlaybackRefCount (copy), VideoPlaybackCoordinator (copy), Object (copy)
	return ReactModule.forwardRef(function(p2, Ref)
		-- upvalues: UseRoactServiceModule (upval), AppRunService (upval), RunService (upval), ReactModule (upval), RoactAppPolicy (upval), FFlagLuaAppVideoPlaybackRefCount (upval), VideoPlaybackCoordinator (upval), p1 (copy), Object (upval)
		local UseRoactServiceModuleResult = UseRoactServiceModule(AppRunService) or RunService
		
		return ReactModule.createElement(ReactModule.useMemo(function()
			-- upvalues: RoactAppPolicy (upval), FFlagLuaAppVideoPlaybackRefCount (upval), VideoPlaybackCoordinator (upval), UseRoactServiceModuleResult (copy), p1 (upval)
			return RoactAppPolicy.connect(function(p3)
				-- upvalues: FFlagLuaAppVideoPlaybackRefCount (upval), VideoPlaybackCoordinator (upval), UseRoactServiceModuleResult (upval)
				return {
					setThrottleFramerateEnabled = function(p4)
						-- upvalues: p3 (copy), FFlagLuaAppVideoPlaybackRefCount (upval), VideoPlaybackCoordinator (upval), UseRoactServiceModuleResult (upval)
						if p3.getThrottleFramerate() then
							if not FFlagLuaAppVideoPlaybackRefCount or not VideoPlaybackCoordinator.isAnyPlaying() then
								UseRoactServiceModuleResult:setThrottleFramerateEnabled(p4)
							end
							VideoPlaybackCoordinator.default:setPreferredFramerateThrottling(p4)
						end
					end
				}
			end)(p1)
		end, { p1, UseRoactServiceModuleResult }), Object.assign(p2, { ref = Ref }))
	end)
end