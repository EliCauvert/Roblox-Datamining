local DumpNavigationHierarchyModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.RoactNavigation.Debug.dumpNavigationHierarchy)
local AxRnState = require(game:GetService("CorePackages").Workspace.Packages.AppDebug).LogTree.logger("ax.rn.state")

return function(p1, p2)
	-- upvalues: AxRnState (copy), DumpNavigationHierarchyModule (copy)
	if p2 == nil then
		p2 = AxRnState.active[AxRnState.Levels.Trace]
	end
	if p2 then
		local v1 = nil
		
		return function(_, p3, p4)
			-- upvalues: DumpNavigationHierarchyModule (upval), p1 (copy), v1 (ref)
			local DumpNavigationHierarchyModuleResult = DumpNavigationHierarchyModule(p3)
			print(string.format("[%s] action: %s\n%s", p1, tostring(p4.type), if DumpNavigationHierarchyModuleResult == v1 then "" else DumpNavigationHierarchyModuleResult))
			v1 = DumpNavigationHierarchyModuleResult
		end
	else
		return function(_, _, _) end
	end
end