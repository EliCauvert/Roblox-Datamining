local FFlagViewRecyclerReact084 = require(script.Flags).FFlagViewRecyclerReact084
local FFlagViewRecyclerReact08 = require(script.Flags).FFlagViewRecyclerReact08
local AttachedViewportOverlayModule = require(script.RobloxAdapter.AttachedViewportOverlay)
local CanvasItemPlacerModule = require(script.RobloxAdapter.CanvasItemPlacer)
local HostPlacementModule = require(script.RobloxAdapter.HostPlacement)
local MeasurementBatcherModule = require(script.RobloxAdapter.MeasurementBatcher)
local MeasurerModule = require(script.RobloxAdapter.Measurer)
local ScrollHostModule = require(script.RobloxAdapter.ScrollHost)
local VacantHostsModule = require(script.RobloxAdapter.VacantHosts)

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
		VacantHosts = if FFlagViewRecyclerReact084 then VacantHostsModule else nil,
		AttachedViewportOverlay = if FFlagViewRecyclerReact084 then nil elseif FFlagViewRecyclerReact08 then nil else AttachedViewportOverlayModule,
		CanvasItemPlacer = if FFlagViewRecyclerReact084 then nil elseif FFlagViewRecyclerReact08 then nil else CanvasItemPlacerModule,
		HostPlacement = if FFlagViewRecyclerReact084 then nil elseif FFlagViewRecyclerReact08 then nil else HostPlacementModule,
		ScrollHost = if FFlagViewRecyclerReact084 then nil elseif FFlagViewRecyclerReact08 then nil else ScrollHostModule
	}),
	["jest.config"] = script["jest.config"],
	MeasurementBatcher = if FFlagViewRecyclerReact084 then nil elseif FFlagViewRecyclerReact08 then nil else MeasurementBatcherModule,
	Measurer = if FFlagViewRecyclerReact084 then nil elseif FFlagViewRecyclerReact08 then nil else MeasurerModule
})