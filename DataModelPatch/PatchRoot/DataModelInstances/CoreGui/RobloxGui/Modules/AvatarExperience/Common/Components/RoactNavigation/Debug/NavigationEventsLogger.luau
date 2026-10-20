local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local NavigationEvents = require(CorePackages.Packages.RoactNavigation).NavigationEvents
local UseRouteNameFunction = require(CorePackages.Workspace.Packages.Navigation).useRouteName
local AxRnEvents = require(CorePackages.Workspace.Packages.AppDebug).LogTree.logger("ax.rn.events")

return if AxRnEvents.active[AxRnEvents.Levels.Debug] then function()
	-- upvalues: UseRouteNameFunction (copy), AxRnEvents (copy), ReactModule (copy), NavigationEvents (copy)
	local UseRouteNameResult = UseRouteNameFunction()
	
	local function _(p1)
		-- upvalues: AxRnEvents (upval), UseRouteNameResult (copy)
		AxRnEvents:debug("[{}] {}", UseRouteNameResult, p1)
	end
	
	ReactModule.useEffect(function()
		-- upvalues: AxRnEvents (upval), UseRouteNameResult (copy)
		AxRnEvents:debug("[{}] {}", UseRouteNameResult, "didMount")
		
		return function()
			-- upvalues: AxRnEvents (upval), UseRouteNameResult (upval)
			AxRnEvents:debug("[{}] {}", UseRouteNameResult, "willUnmount")
		end
	end, {})
	
	return ReactModule.createElement(NavigationEvents, {
		onWillFocus = function()
			-- upvalues: AxRnEvents (upval), UseRouteNameResult (copy)
			AxRnEvents:debug("[{}] {}", UseRouteNameResult, "onWillFocus")
		end,
		onWillBlur = function()
			-- upvalues: AxRnEvents (upval), UseRouteNameResult (copy)
			AxRnEvents:debug("[{}] {}", UseRouteNameResult, "onWillBlur")
		end,
		onDidFocus = function()
			-- upvalues: AxRnEvents (upval), UseRouteNameResult (copy)
			AxRnEvents:debug("[{}] {}", UseRouteNameResult, "onDidFocus")
		end,
		onDidBlur = function()
			-- upvalues: AxRnEvents (upval), UseRouteNameResult (copy)
			AxRnEvents:debug("[{}] {}", UseRouteNameResult, "onDidBlur")
		end
	})
end else function() end