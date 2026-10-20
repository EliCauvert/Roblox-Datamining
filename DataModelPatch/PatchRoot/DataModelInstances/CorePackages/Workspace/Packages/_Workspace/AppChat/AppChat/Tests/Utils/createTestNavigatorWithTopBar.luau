local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoactNavigationModule = require(Parent.RoactNavigation)
local RoactModule = require(Parent.Roact)
local MountFrameWithTopBarFunction = require(AppChat.Tests.MountFrameHelpers).mountFrameWithTopBar
local EnumScreensModule = require(AppChat.EnumScreens)
local TopBarContextModule = require(AppChat.TopBarContext)
local ConfigureTopBarWithNavigationOptionsModule = require(AppChat.configureTopBarWithNavigationOptions)
local FFlagAppChatTopBarConfigDrivenModule = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local SystemMenuTopBarModule = require(AppChat.Components.TopBar.SystemMenuTopBar)
local GetRoactChatStackNavigatorModule = require(AppChat.getRoactChatStackNavigator)

return function(Store, p1)
	-- upvalues: RoactNavigationModule (copy), RoactModule (copy), FFlagAppChatTopBarConfigDrivenModule (copy), EnumScreensModule (copy), SystemMenuTopBarModule (copy), ConfigureTopBarWithNavigationOptionsModule (copy), GetRoactChatStackNavigatorModule (copy), TopBarContextModule (copy), MountFrameWithTopBarFunction (copy)
	local RobloxStackNavigator = RoactNavigationModule.createRobloxStackNavigator(p1.navigator)
	local TestNavigatorConnector = RoactModule.Component:extend("testNavigatorConnector")
	TestNavigatorConnector.router = RobloxStackNavigator.router
	
	function TestNavigatorConnector.render(p2)
		-- upvalues: FFlagAppChatTopBarConfigDrivenModule (upval), EnumScreensModule (upval), RoactModule (upval), SystemMenuTopBarModule (upval), ConfigureTopBarWithNavigationOptionsModule (upval), p1 (copy), RobloxStackNavigator (copy)
		local Element = nil
		
		if FFlagAppChatTopBarConfigDrivenModule() then
			local State = p2.props.navigation.state
			local RouteName = State and (State.routes and (State.routes[State.index] and State.routes[State.index].routeName))
			
			if RouteName == EnumScreensModule.CreateNewChat or RouteName == EnumScreensModule.EditChatMembers then
				Element = RoactModule.createElement(SystemMenuTopBarModule, { screenName = RouteName, navigation = p2.props.navigation })
			end
		end
		if not Element then
			Element = ConfigureTopBarWithNavigationOptionsModule(p2.props.navigation)
		end
		return RoactModule.createFragment({
			layout = RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
			testButton = RoactModule.createElement("TextButton", {
				LayoutOrder = -2,
				Size = UDim2.new(0, 100, 0, 20),
				Text = "test button",
				[RoactModule.Event.Activated] = function()
					-- upvalues: p2 (copy), p1 (upval)
					p2.props.navigation.navigate(p1.testRoute, p1.testRouteParams)
				end
			}),
			topBar = Element,
			testNavigator = RoactModule.createElement(RobloxStackNavigator, p2.props)
		})
	end
	
	local AppContainer = RoactNavigationModule.createAppContainer(GetRoactChatStackNavigatorModule(TestNavigatorConnector))
	local Element = RoactModule.createElement(TopBarContextModule.Consumer, {
		render = function(p2)
			-- upvalues: RoactModule (upval), AppContainer (copy)
			return RoactModule.createElement(AppContainer, {
				screenProps = {
					topBarHeight = 64,
					getScreenTopBar = p2.getScreenTopBar,
					setScreenTopBar = p2.setScreenTopBar
				}
			})
		end
	})
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Parent = game:GetService("CoreGui")
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	local MountFrameWithTopBarResult, MountFrameWithTopBarResult2 = MountFrameWithTopBarFunction(Element, { store = Store, parent = ScreenGui })
	
	return MountFrameWithTopBarResult, MountFrameWithTopBarResult2
end