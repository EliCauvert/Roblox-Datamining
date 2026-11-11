local AppChat = script:FindFirstAncestor("AppChat")
local RoactNavigationModule = require(AppChat.Parent.RoactNavigation)
local ChatLandingStackNavigatorScreensModule = require(script.Parent.chatLandingStackNavigatorScreens)
local FFlagAppChatDisableAbsorbInputSelectableModule = require(AppChat.Flags.FFlagAppChatDisableAbsorbInputSelectable)

local function instantTransitionConfig()
	return {
		transitionSpec = { frequency = 1000000, dampingRatio = 1 }
	}
end

return function(p1)
	-- upvalues: RoactNavigationModule (copy), ChatLandingStackNavigatorScreensModule (copy), FFlagAppChatDisableAbsorbInputSelectableModule (copy), instantTransitionConfig (copy)
	return RoactNavigationModule.createRobloxStackNavigator(ChatLandingStackNavigatorScreensModule, {
		defaultNavigationOptions = if FFlagAppChatDisableAbsorbInputSelectableModule then { absorbInputSelectable = false } else nil,
		transitionConfig = if p1 then instantTransitionConfig else nil
	})
end