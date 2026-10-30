local FFlagViewRecyclerReact08 = require(script.Flags).FFlagViewRecyclerReact08
local AttachedViewportOverlayModule = require(script.RobloxAdapter.AttachedViewportOverlay)
local CanvasItemPlacerModule = require(script.RobloxAdapter.CanvasItemPlacer)
local HostPlacementModule = require(script.RobloxAdapter.HostPlacement)
local MeasurementBatcherModule = require(script.RobloxAdapter.MeasurementBatcher)
local MeasurerModule = require(script.RobloxAdapter.Measurer)
local ScrollHostModule = require(script.RobloxAdapter.ScrollHost)

return table.freeze({
	createRecyclingScope = require(script.RobloxAdapter.createRecyclingScope).create,
	createVirtualizer = require(script.RobloxAdapter.createVirtualizer),
	ChatPreset = require(script.Parent.ViewRecycler).ChatPreset,
	HostPresentationPhase = require(script.RobloxAdapter.HostPresentationPhase),
	ReparentableHost = require(script.RobloxAdapter.ReparentableHost),
	SlotGeometry = require(script.RobloxAdapter.SlotGeometry),
	ViewportCoordinator = require(script.RobloxAdapter.ViewportCoordinator),
	Internal = table.freeze({
		ScrollbarOverlay = require(script.RobloxAdapter.ScrollbarOverlay),
		AttachedViewportOverlay = if FFlagViewRecyclerReact08 then nil else AttachedViewportOverlayModule,
		CanvasItemPlacer = if FFlagViewRecyclerReact08 then nil else CanvasItemPlacerModule,
		HostPlacement = if FFlagViewRecyclerReact08 then nil else HostPlacementModule,
		ScrollHost = if FFlagViewRecyclerReact08 then nil else ScrollHostModule
	}),
	["jest.config"] = script["jest.config"],
	MeasurementBatcher = if FFlagViewRecyclerReact08 then nil else MeasurementBatcherModule,
	Measurer = if FFlagViewRecyclerReact08 then nil else MeasurerModule
})