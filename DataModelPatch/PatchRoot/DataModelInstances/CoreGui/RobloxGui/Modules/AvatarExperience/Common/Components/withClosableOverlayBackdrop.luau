local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local NavigationUtilsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)

return function(p1)
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), NavigationUtilsModule (copy)
	return function(p2)
		-- upvalues: UseNavigationFunction (upval), ReactModule (upval), NavigationUtilsModule (upval), p1 (copy)
		local UseNavigationResult = UseNavigationFunction()
		
		return ReactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Text = "",
			[ReactModule.Event.Activated] = ReactModule.useCallback(function()
				-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (copy)
				NavigationUtilsModule.closeOverlay(UseNavigationResult)
			end, { UseNavigationResult })
		}, { Prompt = ReactModule.createElement(p1, p2) })
	end
end