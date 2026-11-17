local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local _ = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local FFlagEnableGroupSidebarSdui = require(Parent.SharedFlags).FFlagEnableGroupSidebarSdui
local GroupOverviewPaneModule = require(Groups.Components.GroupOverviewPane)
local GroupsPageModule = require(Groups.Components.GroupsPage)
local GroupsRoutesModule = require(script.Parent.GroupsRoutes)
local GetGroupsTransitionConfigModule = require(script.Parent.getGroupsTransitionConfig)

return RoactNavigationModule.createRobloxStackNavigator({
	{
		[GroupsRoutesModule.GroupsPage] = {
			screen = function(_)
				-- upvalues: ReactModule (copy), GroupsPageModule (copy)
				return ReactModule.createElement(GroupsPageModule)
			end
		}
	},
	{
		[GroupsRoutesModule.GroupOverviewPane] = {
			screen = function(p1)
				-- upvalues: ReactModule (copy), GroupOverviewPaneModule (copy)
				return ReactModule.createElement(GroupOverviewPaneModule, { navigation = p1.navigation })
			end,
			navigationOptions = { disableBackButton = false }
		}
	}
}, {
	keepVisitedScreensMounted = false,
	initialRouteName = GroupsRoutesModule.GroupsPage,
	backBehavior = RoactNavigationModule.BackBehavior.History,
	transitionConfig = if FFlagEnableGroupSidebarSdui then GetGroupsTransitionConfigModule else nil
})