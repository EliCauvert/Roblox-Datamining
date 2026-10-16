local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoactModule = require(Parent.Roact)
local RoactNavigationModule = require(Parent.RoactNavigation)
local EnumScreensModule = require(AppChat.EnumScreens)
local ToastScreenModule = require(AppChat.Components.Toast.ToastScreen)
local FFlagAppChatDisableAbsorbInputSelectableModule = require(AppChat.Flags.FFlagAppChatDisableAbsorbInputSelectable)
local ChatLandingWithDialogsNavigatorModule = require(script.Parent.chatLandingWithDialogsNavigator)
local ChatLandingWithDialogsNavigatorConnector = RoactModule.Component:extend("ChatLandingWithDialogsNavigatorConnector")
ChatLandingWithDialogsNavigatorConnector.router = ChatLandingWithDialogsNavigatorModule.router

function ChatLandingWithDialogsNavigatorConnector.render(p1) --[[ Line: 17 ]]
	-- upvalues: RoactModule (copy), ChatLandingWithDialogsNavigatorModule (copy)
	return RoactModule.createElement(ChatLandingWithDialogsNavigatorModule, p1.props)
end

return RoactNavigationModule.createRobloxStackNavigator({
	{
		ChatLandingWithDialogs = ChatLandingWithDialogsNavigatorConnector
	},
	{
		[EnumScreensModule.RoactChatToast] = {
			screen = ToastScreenModule,
			navigationOptions = {
				overlayEnabled = true,
				overlayTransparency = 1,
				absorbInput = false
			}
		}
	}
}, {
	defaultNavigationOptions = if FFlagAppChatDisableAbsorbInputSelectableModule then { absorbInputSelectable = false } else nil,
	mode = RoactNavigationModule.StackPresentationStyle.Overlay
})