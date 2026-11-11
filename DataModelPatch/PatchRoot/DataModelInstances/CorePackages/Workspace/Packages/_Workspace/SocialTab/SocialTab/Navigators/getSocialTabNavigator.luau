local SocialTab = script:FindFirstAncestor("SocialTab")
local DependenciesModule = require(SocialTab.dependencies)
local Parent = SocialTab.Parent
local Roact = DependenciesModule.Roact
local Llama = DependenciesModule.llama
local RoactNavigation = DependenciesModule.RoactNavigation
local BackBehavior = DependenciesModule.RoactNavigation.BackBehavior
local SocialTabContextModule = require(SocialTab.SocialTabContext)
local SocialTabEventReceiverModule = require(SocialTab.SocialTabEventReceiver)
local SocialTabNavigationEventReceiverModule = require(SocialTab.SocialTabNavigationEventReceiver)
local SocialTabContainerModule = require(SocialTab.Components.SocialTabContainer)
local EnumScreensModule = require(SocialTab.EnumScreens)
local ChatPlacementContextModule = require(Parent.AppChat.ChatPlacementContext)
local SocialTabBarVisibleFix = game:DefineFastFlag("SocialTabBarVisibleFix", false)
local SocialTabBarSwitchNavUseContext2 = game:DefineFastFlag("SocialTabBarSwitchNavUseContext2", false)
local FFlagCreateConnectionsHub = require(Parent.SharedFlags).FFlagCreateConnectionsHub
local FFlagAppChatFixRootChatBackNavigation = require(Parent.SharedFlags).FFlagAppChatFixRootChatBackNavigation

local function getActiveChildNavigationOptions(ChildNavigation)
	-- upvalues: getActiveChildNavigationOptions (copy), RoactNavigation (copy)
	local State = ChildNavigation.state
	local Index = State.index
	local Route = State.routes and State.routes[Index]
	
	return if Route and Route.routes then getActiveChildNavigationOptions((ChildNavigation.getChildNavigation(Route.key))) else RoactNavigation.getActiveChildNavigationOptions(ChildNavigation)
end

local function getActiveRouteName(Route)
	-- upvalues: getActiveRouteName (copy)
	local Index = Route.index
	local Route1 = Route.routes and Route.routes[Index]
	
	return if Route1 then getActiveRouteName(Route1) else Route.routeName
end

return function(p1, p2)
	-- upvalues: EnumScreensModule (copy), Roact (copy), SocialTabContainerModule (copy), SocialTabNavigationEventReceiverModule (copy), RoactNavigation (copy), SocialTabContextModule (copy), Llama (copy), FFlagAppChatFixRootChatBackNavigation (copy), FFlagCreateConnectionsHub (copy), ChatPlacementContextModule (copy), BackBehavior (copy), getActiveRouteName (copy), getActiveChildNavigationOptions (copy), SocialTabBarVisibleFix (copy), SocialTabEventReceiverModule (copy), SocialTabBarSwitchNavUseContext2 (copy)
	local RobloxSwitchNavigator = RoactNavigation.createRobloxSwitchNavigator(Llama.List.removeIndex({
		{
			[EnumScreensModule.SocialTab] = {
				screen = function(p3)
					-- upvalues: Roact (upval), SocialTabContainerModule (upval), SocialTabNavigationEventReceiverModule (upval), RoactNavigation (upval)
					return Roact.createFragment({
						screen = Roact.createElement(SocialTabContainerModule, { navigation = p3.navigation }),
						navigationEvents = Roact.createElement(SocialTabNavigationEventReceiverModule, {
							navigationEventReceiver = RoactNavigation.NavigationEvents
						})
					})
				end,
				navigationOptions = { tabBarVisible = true }
			}
		},
		{
			[EnumScreensModule.RoactChat] = {
				screen = function(p3)
					-- upvalues: SocialTabContextModule (upval), p2 (copy), EnumScreensModule (upval), Llama (upval), FFlagAppChatFixRootChatBackNavigation (upval), FFlagCreateConnectionsHub (upval), ChatPlacementContextModule (upval), Roact (upval), p1 (copy)
					return SocialTabContextModule.with(function(p4)
						-- upvalues: p2 (upval), EnumScreensModule (upval), Llama (upval), p3 (copy), FFlagAppChatFixRootChatBackNavigation (upval), FFlagCreateConnectionsHub (upval), ChatPlacementContextModule (upval), Roact (upval), p1 (upval)
						local config = {
							logger = p4.Logger,
							isLuaProfilePageEnabled = p4.isLuaProfilePageEnabled,
							parameters = p4.parameters,
							wideMode = p4.wideMode,
							isVisible = p4.isVisible,
							notificationCount = p4.notificationCount,
							navigateToLuaAppPages = p4.navigateToLuaAppPages,
							rnBypassActionSignal = p4.rnBypassActionSignal,
							setActiveConversationId = p4.setActiveConversationId,
							setBackButtonEnabled = p4.setBackButtonEnabled,
							setTabBarVisible = p4.setTabBarVisible,
							androidBackButtonSignal = p2.androidBackButtonSignal[EnumScreensModule.RoactChat],
							androidBackButtonConnection = p2.androidBackButtonConnection,
							updateExternalNavigationForScreen = p4.updateExternalNavigationForScreen
						}
						
						return Roact.createElement(p1[EnumScreensModule.RoactChat], (Llama.Dictionary.join(Llama.Dictionary.join(p3, p2, config, {
							navigateToRootStack = function()
								-- upvalues: FFlagAppChatFixRootChatBackNavigation (upval), config (copy), EnumScreensModule (upval), p3 (upval)
								if FFlagAppChatFixRootChatBackNavigation then
									local NavigateToLuaAppPage: () -> () = config.navigateToLuaAppPages[EnumScreensModule.Home]
									
									if NavigateToLuaAppPage then
										NavigateToLuaAppPage()
										
										return
									end
								else
									p3.navigation.navigate(EnumScreensModule.SocialTab)
								end
							end,
							navigateToAddFriends = if FFlagCreateConnectionsHub then nil else function()
								-- upvalues: p2 (upval)
								p2.navigateToAddFriends()
							end
						}), { chatPlacement = ChatPlacementContextModule.Enum.ChatTab })))
					end)
				end,
				navigationOptions = { tabBarVisible = true }
			}
		}
	}, 1), {
		keepVisitedScreensMounted = false,
		initialRouteName = p2.initialRouteName,
		backBehavior = BackBehavior.History
	})
	local SocialTabSwitchNavigator = Roact.PureComponent:extend("SocialTabSwitchNavigator")
	
	function SocialTabSwitchNavigator.init(p3)
		-- upvalues: getActiveRouteName (upval), EnumScreensModule (upval), p2 (copy)
		function p3.onBackButtonPressed()
			-- upvalues: p3 (copy), getActiveRouteName (upval), EnumScreensModule (upval), p2 (upval)
			local State = p3.props.navigation.state
			local Index = State.index
			local Route = State.routes and State.routes[Index]
			local ActiveRouteName = if Route then getActiveRouteName(Route) else State.routeName
			
			if p3.props.androidBackButtonHandlerDisabled then return end
			if ActiveRouteName == EnumScreensModule.RoactChat or ActiveRouteName == EnumScreensModule.SocialTab then
				p2.androidBackButtonSignal[ActiveRouteName]:fire()
				
				return
			else
				p3.props.navigation.goBack()
			end
		end
		
		function p3.isTabViewVisible(): boolean
			-- upvalues: p3 (copy), getActiveRouteName (upval), EnumScreensModule (upval)
			local State = p3.props.navigation.state
			local Index = State.index
			local Route = State.routes and State.routes[Index]
			
			return (if Route then getActiveRouteName(Route) else State.routeName) == EnumScreensModule.RoactChat
		end
	end
	
	function SocialTabSwitchNavigator.didMount(p3)
		-- upvalues: p2 (copy)
		p2.connectToAndroidBackButton(p3.onBackButtonPressed)
	end
	
	function SocialTabSwitchNavigator:willUnmount()
		-- upvalues: p2 (copy)
		p2.disconnectFromAndroidBackButton()
	end
	
	function SocialTabSwitchNavigator:willUpdate(p3)
		-- upvalues: getActiveChildNavigationOptions (upval), RoactNavigation (upval), SocialTabBarVisibleFix (upval), SocialTabContextModule (upval), p2 (copy)
		local Navigation = p3.navigation
		local State = Navigation.state
		local Index = State.index
		local Route = State.routes and State.routes[Index]
		local ActiveChildNavigationOptions = if Route and Route.routes then getActiveChildNavigationOptions((Navigation.getChildNavigation(Route.key))) else RoactNavigation.getActiveChildNavigationOptions(Navigation)
		
		if ActiveChildNavigationOptions and ActiveChildNavigationOptions.tabBarVisible ~= nil then
			if SocialTabBarVisibleFix then
				SocialTabContextModule.with(function(p4)
					-- upvalues: ActiveChildNavigationOptions (copy)
					if p4.setTabBarVisible then
						p4.setTabBarVisible(ActiveChildNavigationOptions.tabBarVisible)
					end
				end)
				
				return
			end
			p2.setTabBarVisible(ActiveChildNavigationOptions.tabBarVisible)
		end
	end
	
	function SocialTabSwitchNavigator.render(p3)
		-- upvalues: SocialTabContextModule (upval), Roact (upval), SocialTabEventReceiverModule (upval), getActiveRouteName (upval), SocialTabBarSwitchNavUseContext2 (upval), EnumScreensModule (upval), p2 (copy), RobloxSwitchNavigator (copy)
		return SocialTabContextModule.with(function(p4)
			-- upvalues: p3 (copy), Roact (upval), SocialTabEventReceiverModule (upval), getActiveRouteName (upval), SocialTabBarSwitchNavUseContext2 (upval), EnumScreensModule (upval), p2 (upval), RobloxSwitchNavigator (upval)
			if p4.isLuaProfilePageEnabled then
				p4.setIsTabBarEnabled(p3.isTabViewVisible)
			end
			return Roact.createFragment({
				eventReceiver = Roact.createElement(SocialTabEventReceiverModule, {
					robloxEventReceiver = p4.robloxEventReceiver,
					getActiveConversationId = p4.getActiveConversationId,
					showTabBar = function()
						-- upvalues: p3 (upval), getActiveRouteName (upval), SocialTabBarSwitchNavUseContext2 (upval), p4 (copy), EnumScreensModule (upval), p2 (upval)
						local State = p3.props.navigation.state
						local Index = State.index
						local Route = State.routes and State.routes[Index]
						local ActiveRouteName = if Route then getActiveRouteName(Route) else State.routeName
						
						if SocialTabBarSwitchNavUseContext2 then
							p4.setTabBarVisible(ActiveRouteName == EnumScreensModule.RoactChat)
							
							return
						else
							p2.setTabBarVisible(ActiveRouteName == EnumScreensModule.RoactChat)
						end
					end,
					goToChat = function()
						-- upvalues: p3 (upval), EnumScreensModule (upval)
						p3.props.navigation.navigate(EnumScreensModule.RoactChat)
					end
				}),
				switchNavigator = Roact.createElement(RobloxSwitchNavigator, { navigation = p3.props.navigation })
			})
		end)
	end
	
	SocialTabSwitchNavigator.router = RobloxSwitchNavigator.router
	
	return SocialTabSwitchNavigator
end