return {
	DrawerContainer = require(script.Components.DrawerContainer),
	Hooks = {
		useDrawerVisible = require(script.Hooks.useDrawerVisible),
		useSetDrawerVisible = require(script.Hooks.useSetDrawerVisible),
		useDrawerShouldMount = require(script.Hooks.useDrawerShouldMount)
	},
	Stores = {
		GetDrawerVisibleStore = require(script.Stores.GetDrawerVisibleStore)
	}
}