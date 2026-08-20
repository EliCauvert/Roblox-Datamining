return {
	DrawerContainer = require(script.Components.DrawerContainer),
	Hooks = {
		useDrawerVisible = require(script.Hooks.useDrawerVisible),
		useSetDrawerVisible = require(script.Hooks.useSetDrawerVisible),
		useDrawerShouldMount = require(script.Hooks.useDrawerShouldMount),
		useDrawerAnimating = require(script.Hooks.useDrawerAnimating),
		useSetDrawerAnimating = require(script.Hooks.useSetDrawerAnimating)
	},
	Stores = {
		GetDrawerVisibleStore = require(script.Stores.GetDrawerVisibleStore)
	}
}