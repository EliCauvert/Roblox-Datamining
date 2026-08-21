return {
	DrawerContainer = require(script.Components.DrawerContainer),
	Hooks = {
		useDrawerVisible = require(script.Hooks.useDrawerVisible),
		useSetDrawerVisible = require(script.Hooks.useSetDrawerVisible),
		useDrawerShouldMount = require(script.Hooks.useDrawerShouldMount),
		useSetDrawerAnimating = require(script.Hooks.useSetDrawerAnimating)
	},
	Stores = {
		GetDrawerVisibleStore = require(script.Stores.GetDrawerVisibleStore)
	}
}