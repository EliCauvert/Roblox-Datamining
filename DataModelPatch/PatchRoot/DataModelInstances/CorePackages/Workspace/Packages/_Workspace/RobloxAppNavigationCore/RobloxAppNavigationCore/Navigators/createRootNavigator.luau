local Parent = script:FindFirstAncestor("RobloxAppNavigationCore").Parent
local RoactNavigationModule = require(Parent.RoactNavigation)
local _ = require(Parent.Navigation)
local NavigationRoduxModule = require(Parent.NavigationRodux)
local CreateAdaptiveStackNavigatorModule = require(script.Parent.createAdaptiveStackNavigator)
local CreateMainSwitchNavigatorModule = require(script.Parent.createMainSwitchNavigator)
local RootNavigatorInitialRouteName = game:DefineFastString("RootNavigatorInitialRouteName", (tostring(require(Parent.RobloxAppEnums).AppPage.PlatformAccountRouter)))

local function TransitionConfig()
	return {
		transitionSpec = { frequency = 1000000, dampingRatio = 1 }
	}
end

return function(List, List1)
	-- upvalues: NavigationRoduxModule (copy), CreateMainSwitchNavigatorModule (copy), CreateAdaptiveStackNavigatorModule (copy), RootNavigatorInitialRouteName (copy), RoactNavigationModule (copy), TransitionConfig (copy)
	local t = {}
	
	for i, value in List1 do
		t[value] = i
	end
	local List2 = {}
	local List3 = {}
	
	for _, value1 in List do
		if t[next(value1)] ~= nil then
			table.insert(List2, value1)
		else
			table.insert(List3, value1)
		end
	end
	table.sort(List2, function(A, B): boolean
		-- upvalues: t (copy)
		return t[next(A)] < t[next(B)]
	end)
	table.insert(List3, {
		[NavigationRoduxModule.Constants.TempRnSwitchNavigatorName] = CreateMainSwitchNavigatorModule(List2)
	})
	
	return CreateAdaptiveStackNavigatorModule(List3, {
		initialRouteName = RootNavigatorInitialRouteName,
		mode = RoactNavigationModule.StackPresentationStyle.Overlay,
		transitionConfig = TransitionConfig,
		defaultNavigationOptions = { absorbInputSelectable = false, overlayTransparency = 0.3 }
	})
end