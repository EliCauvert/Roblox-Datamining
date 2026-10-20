local CorePackages = game:GetService("CorePackages")
local StackRouterFunction = require(CorePackages.Packages.RoactNavigation).StackRouter
local CryoModule = require(CorePackages.Packages.Cryo)
local AvatarExperienceActionsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceActions)

return function(p1, p2)
	-- upvalues: CryoModule (copy), AvatarExperienceActionsModule (copy), StackRouterFunction (copy)
	local StackRouterResult = StackRouterFunction(p1, (CryoModule.Dictionary.join(p2 or {}, {
		getCustomActionCreators = function(_, _)
			-- upvalues: AvatarExperienceActionsModule (upval)
			return {
				clearScreens = AvatarExperienceActionsModule.clearScreens
			}
		end
	})))
	local GetStateForActionFunction = StackRouterResult.getStateForAction
	
	function StackRouterResult.getStateForAction(p3, p4)
		-- upvalues: AvatarExperienceActionsModule (upval), CryoModule (upval), GetStateForActionFunction (copy)
		if p3.type == AvatarExperienceActionsModule.ClearScreens then
			local Set = CryoModule.List.toSet(p3.routeNames)
			local FilterResult = CryoModule.List.filter(p4.routes, function(p5): boolean
				-- upvalues: Set (copy)
				return not Set[p5.routeName]
			end)
			
			return (CryoModule.Dictionary.join(p4, { routes = FilterResult, index = #FilterResult }))
		else
			return GetStateForActionFunction(p3, p4)
		end
	end
	
	return StackRouterResult
end