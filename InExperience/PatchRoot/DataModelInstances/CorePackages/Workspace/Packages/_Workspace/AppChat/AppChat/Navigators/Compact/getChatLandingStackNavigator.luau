local appChat = script:FindFirstAncestor("AppChat")
local roactNavigationModule = require(appChat.Parent.RoactNavigation)
local chatLandingStackNavigatorScreensModule = require(script.Parent.chatLandingStackNavigatorScreens)
local fFlagAppChatDisableAbsorbInputSelectableModule = require(appChat.Flags.FFlagAppChatDisableAbsorbInputSelectable)

local function instantTransitionConfig()
	return {
		transitionSpec = { frequency = 1000000, dampingRatio = 1 }
	}
end

return function(p1)
	-- upvalues: roactNavigationModule (ref), chatLandingStackNavigatorScreensModule (ref), fFlagAppChatDisableAbsorbInputSelectableModule (ref), instantTransitionConfig (ref)
	return roactNavigationModule.createRobloxStackNavigator(chatLandingStackNavigatorScreensModule, {
		defaultNavigationOptions = if fFlagAppChatDisableAbsorbInputSelectableModule then { absorbInputSelectable = false } else nil,
		transitionConfig = if p1 then instantTransitionConfig else nil
	})
end