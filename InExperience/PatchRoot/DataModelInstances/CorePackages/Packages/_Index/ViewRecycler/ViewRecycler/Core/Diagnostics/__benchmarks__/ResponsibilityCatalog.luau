local frozen = table.freeze({
	Initialization = "core.initialization",
	DataMutation = "core.dataMutation",
	LayoutGeometry = "core.layoutGeometry",
	ViewportRange = "core.viewportRange",
	OverscanHysteresis = "core.overscanHysteresis",
	Prefetch = "core.prefetch",
	ItemViewPresentation = "core.itemViewPresentation",
	RecyclingScope = "core.recyclingScope",
	Measurement = "core.measurement",
	DataAnchoring = "core.dataAnchoring",
	MeasurementAnchoring = "core.measurementAnchoring",
	ProgrammaticScroll = "core.programmaticScroll",
	ScrollPolicy = "core.scrollPolicy",
	PinnedSticky = "core.pinnedSticky",
	Diagnostics = "core.diagnostics",
	Teardown = "core.teardown"
})
local frozen_1 = table.freeze({
	GeometryPlacement = "roblox.geometryPlacement",
	ReparentSelection = "roblox.reparentSelection",
	LeaseLifecycle = "roblox.leaseLifecycle",
	ScrollViewportSync = "roblox.scrollViewportSync",
	CanvasPublication = "roblox.canvasPublication",
	MeasurementScheduling = "roblox.measurementScheduling",
	ViewportActivation = "roblox.viewportActivation",
	Teardown = "roblox.teardown"
})
local frozen_2 = table.freeze({
	DataReconciliation = "react.dataReconciliation",
	PropSynchronization = "react.propSynchronization",
	MountScroll = "react.mountScroll",
	AssignmentBinding = "react.assignmentBinding",
	Presentation = "react.presentation",
	StatefulTransfer = "react.statefulTransfer",
	AutomaticSizeTransfer = "react.automaticSizeTransfer",
	MeasurementWiring = "react.measurementWiring",
	SignalsPublication = "react.signalsPublication",
	ViewportActiveGating = "react.viewportActiveGating",
	ScopeOwnership = "react.scopeOwnership",
	Composition = "react.composition",
	Teardown = "react.teardown"
})

local function _(p0) --[[ line: 47 | named "values" ]]
	local t = {}
	
	for i, v in p0 do
		table.insert(t, v)
	end
	table.sort(t)
	
	return t
end

local freeze = table.freeze
local t = {}
local freeze_1 = table.freeze
local t_1 = {}

for i, v in frozen do
	table.insert(t_1, v)
end
table.sort(t_1)
t.core = freeze_1(t_1)
local freeze_2 = table.freeze
local t_2 = {}

for i, v_1 in frozen_1 do
	table.insert(t_2, v_1)
end
table.sort(t_2)
t.roblox = freeze_2(t_2)
local freeze_3 = table.freeze
local t_3 = {}

for i, v_2 in frozen_2 do
	table.insert(t_3, v_2)
end
table.sort(t_3)
t.react = freeze_3(t_3)
freeze = freeze(t)
local t_4 = {}

for i_3, v_3 in freeze do
	for i_4, v_4 in v_3 do
		t_4[v_4] = true
	end
end
return table.freeze({
	Core = frozen,
	Roblox = frozen_1,
	React = frozen_2,
	byOwner = freeze,
	isKnown = function(p1) --[[ line: 69 ]]
		-- upvalues: t_4 (ref)
		return t_4[p1] == true
	end,
	getMissing = function(p2, p3) --[[ line: 73 ]]
		-- upvalues: freeze (ref)
		local t = {}
		
		for i, v in p2 do
			if v.owner == p3 then
				t[v.responsibility] = true
			end
		end
		local t_1 = {}
		
		for i_1, v_1 in freeze[p3] do
			if not t[v_1] then
				table.insert(t_1, v_1)
			end
		end
		return t_1
	end
})