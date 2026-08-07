local appChat = script:FindFirstAncestor("AppChat")
local roactNavigationModule = require(appChat.Parent.RoactNavigation)
local chatLandingStackNavigatorScreensModule = require(script.Parent.chatLandingStackNavigatorScreens)
local fFlagAppChatDisableAbsorbInputSelectableModule = require(appChat.Flags.FFlagAppChatDisableAbsorbInputSelectable)

local function instantTransitionConfig() --[[ line: 10 ]]
	return {
		transitionSpec = { frequency = 1000000, dampingRatio = 1 }
	}
end

return function(p0) --[[ line: 19 | named "getChatLandingStackNavigator" ]]
	-- upvalues: roactNavigationModule (ref), chatLandingStackNavigatorScreensModule (ref), fFlagAppChatDisableAbsorbInputSelectableModule (ref), instantTransitionConfig (ref)
	return roactNavigationModule.createRobloxStackNavigator(chatLandingStackNavigatorScreensModule, {
		defaultNavigationOptions = if fFlagAppChatDisableAbsorbInputSelectableModule then { absorbInputSelectable = false } else nil,
		transitionConfig = if p0 then instantTransitionConfig else nil
	})
end