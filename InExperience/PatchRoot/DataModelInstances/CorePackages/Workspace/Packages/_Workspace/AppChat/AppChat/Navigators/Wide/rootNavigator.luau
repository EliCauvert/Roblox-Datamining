local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local roactModule = require(parent.Roact)
local roactNavigationModule = require(parent.RoactNavigation)
local enumScreensModule = require(appChat.EnumScreens)
local toastScreenModule = require(appChat.Components.Toast.ToastScreen)
local fFlagAppChatDisableAbsorbInputSelectableModule = require(appChat.Flags.FFlagAppChatDisableAbsorbInputSelectable)
local chatLandingWithDialogsNavigatorModule = require(script.Parent.chatLandingWithDialogsNavigator)
local chatLandingWithDialogsNavigatorConnector = roactModule.Component:extend("ChatLandingWithDialogsNavigatorConnector")
chatLandingWithDialogsNavigatorConnector.router = chatLandingWithDialogsNavigatorModule.router

function chatLandingWithDialogsNavigatorConnector.render(p0)
	-- upvalues: roactModule (ref), chatLandingWithDialogsNavigatorModule (ref)
	return roactModule.createElement(chatLandingWithDialogsNavigatorModule, p0.props)
end

return roactNavigationModule.createRobloxStackNavigator({
	{
		ChatLandingWithDialogs = chatLandingWithDialogsNavigatorConnector
	},
	{
		[enumScreensModule.RoactChatToast] = {
			screen = toastScreenModule,
			navigationOptions = {
				overlayEnabled = true,
				overlayTransparency = 1,
				absorbInput = false
			}
		}
	}
}, {
	defaultNavigationOptions = if fFlagAppChatDisableAbsorbInputSelectableModule then { absorbInputSelectable = false } else nil,
	mode = roactNavigationModule.StackPresentationStyle.Overlay
})