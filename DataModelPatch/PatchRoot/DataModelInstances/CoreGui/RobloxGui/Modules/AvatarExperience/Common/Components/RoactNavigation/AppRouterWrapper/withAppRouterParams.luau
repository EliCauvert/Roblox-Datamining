local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local AppRouterParamsContextModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.AppRouterParamsContext)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local IsRootRouteInRNModule = require(Modules.LuaApp.Navigation.isRootRouteInRN)

return function(p1)
	-- upvalues: RoactModule (copy), NavigationUtilsModule (copy), IsRootRouteInRNModule (copy), CryoModule (copy), AppRouterParamsContextModule (copy)
	local AppRouterParams = RoactModule.PureComponent:extend("AppRouterParams")
	
	function AppRouterParams.init(p2)
		-- upvalues: NavigationUtilsModule (upval), IsRootRouteInRNModule (upval)
		local Navigation = p2.props.navigation
		
		if IsRootRouteInRNModule(NavigationUtilsModule.getRootNavigation(Navigation).state) and p2.props.params then
			Navigation.setParams(p2.props.params)
		end
	end
	
	function AppRouterParams.render(p2)
		-- upvalues: RoactModule (upval), p1 (copy), CryoModule (upval)
		return if p2.props.navigation.state.params == nil then nil else RoactModule.createElement(p1, CryoModule.Dictionary.join(p2.props, { params = CryoModule.None }))
	end
	
	return function(p2)
		-- upvalues: RoactModule (upval), AppRouterParamsContextModule (upval), CryoModule (upval), AppRouterParams (copy)
		return RoactModule.createElement(AppRouterParamsContextModule.Consumer, {
			render = function(Params)
				-- upvalues: p2 (copy), CryoModule (upval), RoactModule (upval), AppRouterParams (upval)
				if Params.setNavigationForTests then
					Params.setNavigationForTests(p2.navigation)
					Params = CryoModule.Dictionary.join(Params, { setNavigationForTests = CryoModule.None })
				end
				return RoactModule.createElement(AppRouterParams, (CryoModule.Dictionary.join(p2, { params = Params })))
			end
		})
	end
end