return {
	TempRnSwitchNavigatorName = "RootSwitchNavigator",
	HomeContainerName = if require(script:FindFirstAncestor("NavigationRodux").Parent.SharedFlags).FFlagAppIaHomeSubTab then "HomeContainer" else nil
}