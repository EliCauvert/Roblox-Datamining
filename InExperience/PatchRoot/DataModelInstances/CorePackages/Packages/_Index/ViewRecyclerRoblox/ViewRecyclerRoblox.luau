return table.freeze({
	createRecyclingScope = require(script.RobloxAdapter.createRecyclingScope).create,
	createVirtualizer = require(script.RobloxAdapter.createVirtualizer),
	ChatPreset = require(script.Parent.ViewRecycler).Adapter.ScrollPolicy.ChatPreset,
	MeasurementBatcher = require(script.RobloxAdapter.MeasurementBatcher),
	Measurer = require(script.RobloxAdapter.Measurer),
	ReparentableHost = require(script.RobloxAdapter.ReparentableHost),
	SlotGeometry = require(script.RobloxAdapter.SlotGeometry),
	ViewportCoordinator = require(script.RobloxAdapter.ViewportCoordinator),
	Internal = table.freeze({
		CanvasItemPlacer = require(script.RobloxAdapter.CanvasItemPlacer),
		CanvasItemViewRuntime = require(script.RobloxAdapter.CanvasItemViewRuntime),
		ScrollListHostRuntime = require(script.RobloxAdapter.ScrollListHostRuntime),
		ScrollHostCoordinator = require(script.RobloxAdapter.ScrollHostCoordinator)
	}),
	["jest.config"] = script["jest.config"]
})