local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local _ = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local GroupDetailPaneModule = require(Groups.Components.GroupDetailPane)
local GroupsPageModule = require(Groups.Components.GroupsPage)
local GroupsRoutesModule = require(script.Parent.GroupsRoutes)

return RoactNavigationModule.createRobloxStackNavigator({
	{
		[GroupsRoutesModule.GroupsPage] = {
			screen = function(_) --[[ Line: 17 ]]
				-- upvalues: ReactModule (copy), GroupsPageModule (copy)
				return ReactModule.createElement(GroupsPageModule)
			end
		}
	},
	{
		[GroupsRoutesModule.GroupDetailPane] = {
			screen = function(p1) --[[ Line: 21 ]]
				-- upvalues: ReactModule (copy), GroupDetailPaneModule (copy)
				return ReactModule.createElement(GroupDetailPaneModule, { navigation = p1.navigation })
			end,
			navigationOptions = { disableBackButton = false }
		}
	}
}, {
	keepVisitedScreensMounted = false,
	initialRouteName = GroupsRoutesModule.GroupsPage,
	backBehavior = RoactNavigationModule.BackBehavior.History
})