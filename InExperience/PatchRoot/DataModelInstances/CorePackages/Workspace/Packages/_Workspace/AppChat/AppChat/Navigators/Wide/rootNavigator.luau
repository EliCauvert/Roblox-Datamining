local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local roactModule = require(parent.Roact)
local roactNavigationModule = require(parent.RoactNavigation)
local enumScreensModule = require(appChat.EnumScreens)
local toastScreenModule = require(appChat.Components.Toast.ToastScreen)
local chatLandingWithDialogsNavigatorModule = require(script.Parent.chatLandingWithDialogsNavigator)
local chatLandingWithDialogsNavigatorConnector = roactModule.Component:extend("ChatLandingWithDialogsNavigatorConnector")
chatLandingWithDialogsNavigatorConnector.router = chatLandingWithDialogsNavigatorModule.router

function chatLandingWithDialogsNavigatorConnector.render(p0) --[[ line: 15 ]]
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
	mode = roactNavigationModule.StackPresentationStyle.Overlay
})