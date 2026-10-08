return table.freeze({
	createRecyclingScope = require(script.RobloxAdapter.createRecyclingScope).create,
	createVirtualizer = require(script.RobloxAdapter.createVirtualizer),
	ChatPreset = require(script.Parent.ViewRecycler).ChatPreset,
	HostPresentationPhase = require(script.RobloxAdapter.HostPresentationPhase),
	MeasurementBatcher = require(script.RobloxAdapter.MeasurementBatcher),
	Measurer = require(script.RobloxAdapter.Measurer),
	ReparentableHost = require(script.RobloxAdapter.ReparentableHost),
	SlotGeometry = require(script.RobloxAdapter.SlotGeometry),
	ViewportCoordinator = require(script.RobloxAdapter.ViewportCoordinator),
	Internal = table.freeze({
		CanvasItemPlacer = require(script.RobloxAdapter.CanvasItemPlacer),
		HostPlacement = require(script.RobloxAdapter.HostPlacement),
		ScrollbarOverlay = require(script.RobloxAdapter.ScrollbarOverlay),
		ScrollHost = require(script.RobloxAdapter.ScrollHost)
	}),
	["jest.config"] = script["jest.config"]
})