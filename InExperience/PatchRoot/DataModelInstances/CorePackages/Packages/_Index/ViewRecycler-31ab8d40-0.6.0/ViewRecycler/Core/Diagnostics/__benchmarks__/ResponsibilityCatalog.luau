local Frozen = table.freeze({
	Initialization = "core.initialization",
	DataMutation = "core.dataMutation",
	LayoutGeometry = "core.layoutGeometry",
	ViewportRange = "core.viewportRange",
	Overscan = "core.overscan",
	Prefetch = "core.prefetch",
	ListRows = "core.itemViewPresentation",
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
local Frozen1 = table.freeze({
	GeometryPlacement = "roblox.geometryPlacement",
	ReparentSelection = "roblox.reparentSelection",
	PhysicalLifecycle = "roblox.physicalLifecycle",
	ScrollViewportSync = "roblox.scrollViewportSync",
	CanvasPublication = "roblox.canvasPublication",
	MeasurementScheduling = "roblox.measurementScheduling",
	ViewportActivation = "roblox.viewportActivation",
	Teardown = "roblox.teardown"
})
local Frozen2 = table.freeze({
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

local function _(List) --[[ Line: 47 | Named "values" ]]
	local List1 = {}
	
	for _, value in List do
		table.insert(List1, value)
	end
	table.sort(List1)
	
	return List1
end

local FreezeFunction3 = table.freeze
local t = {}
local FreezeFunction1 = table.freeze
local List = {}

for _, value in Frozen do
	table.insert(List, value)
end
table.sort(List)
t.core = FreezeFunction1(List)
local FreezeFunction = table.freeze
local List1 = {}

for _, value1 in Frozen1 do
	table.insert(List1, value1)
end
table.sort(List1)
t.roblox = FreezeFunction(List1)
local FreezeFunction2 = table.freeze
local List2 = {}

for _, value2 in Frozen2 do
	table.insert(List2, value2)
end
table.sort(List2)
t.react = FreezeFunction2(List2)
local FreezeResult = FreezeFunction3(t)
local t1 = {}

for _, value3 in FreezeResult do
	for _, value4 in value3 do
		t1[value4] = true
	end
end
return table.freeze({
	Core = Frozen,
	Roblox = Frozen1,
	React = Frozen2,
	byOwner = FreezeResult,
	isKnown = function(p1): boolean --[[ Line: 69 ]]
		-- upvalues: t1 (copy)
		return t1[p1] == true
	end,
	getMissing = function(List, Owner) --[[ Line: 73 ]]
		-- upvalues: FreezeResult (copy)
		local t = {}
		
		for _, value in List do
			if value.owner == Owner then
				t[value.responsibility] = true
			end
		end
		local List1 = {}
		
		for _, value1 in FreezeResult[Owner] do
			if not t[value1] then
				table.insert(List1, value1)
			end
		end
		return List1
	end
})