local groups = script:FindFirstAncestor("Groups")
local parent = groups.Parent
local _ = require(parent.Navigation)
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local groupDetailPaneModule = require(groups.Components.GroupDetailPane)
local groupsPageModule = require(groups.Components.GroupsPage)
local groupsRoutesModule = require(script.Parent.GroupsRoutes)

return roactNavigationModule.createRobloxStackNavigator({
	{
		[groupsRoutesModule.GroupsPage] = {
			screen = function(_)
				-- upvalues: reactModule (ref), groupsPageModule (ref)
				return reactModule.createElement(groupsPageModule)
			end
		}
	},
	{
		[groupsRoutesModule.GroupDetailPane] = {
			screen = function(p1)
				-- upvalues: reactModule (ref), groupDetailPaneModule (ref)
				return reactModule.createElement(groupDetailPaneModule, { navigation = p1.navigation })
			end,
			navigationOptions = { disableBackButton = false }
		}
	}
}, {
	keepVisitedScreensMounted = false,
	initialRouteName = groupsRoutesModule.GroupsPage,
	backBehavior = roactNavigationModule.BackBehavior.History
})