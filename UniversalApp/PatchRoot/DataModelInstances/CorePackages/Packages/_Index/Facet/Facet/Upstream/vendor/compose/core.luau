local v1 = nil
local v2 = nil
local v3 = nil
local v4 = nil
local v5 = nil
local v6 = nil
local v7 = nil
local v8 = nil
local v9 = nil
local v10 = nil
local v11 = nil
local v12 = nil
local v13 = nil
local v14 = nil
local v15 = nil
local v16 = nil
local v17 = nil
local v18 = nil
local v19 = nil
local v20 = nil
local v21 = nil
local v22 = nil
local v23 = nil
local v24 = nil
local v25 = nil
local v26 = nil
local v27 = nil
local v28 = nil
local ActiveModule = require("@self/ownership/active")
local DiagnosticsModule = require("@self/diagnostics")
local DynamicModule = require("@self/dynamic")
local GraphModule = require("@self/reactive/graph")
local _ = require("@self/host")
local PropsModule = require("@self/runtime/props")
local OwnerModule = require("@self/ownership/owner")
local _ = require("@self/types")
local _ = require("@self/reactive/types")
local CellModule = require("@self/reactive/cell")
local NodesModule = require("@self/ownership/nodes")
local v29 = nil
local ReactorModule = require("@self/reactive/reactor")
local WatchModule = require("@self/reactive/watch")
local EvaluationModule = require("@self/reactive/evaluation")
local Stats = EvaluationModule.stats

local function sampleRead(p1)
	-- upvalues: CellModule (copy), GraphModule (copy)
	return if CellModule.isValue(p1) then p1:peek() else GraphModule.notANode("the reader Compose.sample passes to a body", p1)
end

return {
	cell = CellModule.cell,
	lazyCell = CellModule.lazyCell,
	sharedCell = CellModule.cell,
	formula = function(p1, p2)
		-- upvalues: v29 (ref), ActiveModule (copy), GraphModule (copy), OwnerModule (copy)
		local V39 = v29 or require("@self/reactive/formula")
		v29 = V39
		local VResult = V39(p1, p2)
		local CurrentResult = ActiveModule.current()
		
		if CurrentResult ~= nil then
			GraphModule.detachers[GraphModule.nodeOf(VResult)] = OwnerModule.own(CurrentResult, function()
				-- upvalues: VResult (copy)
				VResult:dispose()
			end)
		end
		return VResult
	end,
	map = PropsModule.map,
	accumulator = function(p1)
		-- upvalues: v9 (ref)
		local V8 = v9 or require("@self/accumulator")
		v9 = V8
		
		return V8(p1)
	end,
	selector = function(p1)
		-- upvalues: v10 (ref)
		local V9 = v10 or require("@self/selector")
		v10 = V9
		
		return V9(p1)
	end,
	watch = function(CurrentResult, p1)
		-- upvalues: ActiveModule (copy), DiagnosticsModule (copy), OwnerModule (copy)
		local CurrentResult1 = ActiveModule.current()
		
		return if CurrentResult1 == nil then DiagnosticsModule.raise("owner/no-active-owner", "watch ran with no owner to hold it", {
			contract = "a watch lives exactly as long as the owner that created it",
			fix = "call it inside a component, or use OwnerModule.watch(owner, ...) with an explicit owner"
		}) else OwnerModule.watch(CurrentResult1, CurrentResult, p1)
	end,
	sample = function(Callback)
		-- upvalues: CellModule (copy), DiagnosticsModule (copy), WatchModule (copy), sampleRead (copy)
		if type(Callback) == "function" then
			return WatchModule.sample(function()
				-- upvalues: Callback (copy), sampleRead (upval)
				return Callback(sampleRead)
			end)
		elseif CellModule.isValue(Callback) then
			return Callback:peek()
		else
			local DescribeResult = DiagnosticsModule.describe(Callback)
			
			return DiagnosticsModule.raise("reactive/not-a-source", ("Compose.sample was given a %s it cannot read"):format(DescribeResult), {
				expected = "a cell, a formula, or a function taking `use`",
				contract = "sample reads a source's current value once, without recording a dependency",
				fix = "pass the cell or formula itself, or a body that reads one",
				actual = DescribeResult
			})
		end
	end,
	isValue = CellModule.isValue,
	reactor = {
		create = ReactorModule.create,
		batch = ReactorModule.batch,
		settle = ReactorModule.settle,
		pending = ReactorModule.pending
	},
	createOwner = OwnerModule.createOwner,
	owner = OwnerModule.api,
	withOwner = ActiveModule.withOwner,
	bindOwner = function(Callback)
		-- upvalues: DiagnosticsModule (copy), ActiveModule (copy)
		if type(Callback) == "function" then
			local CurrentResult = ActiveModule.current()
			
			return if CurrentResult == nil then DiagnosticsModule.raise("owner/no-active-owner", "bindOwner has no owner to bind to", {
				contract = "a bound callback re-enters the owner that created it, so there has to be one to capture",
				fix = "call Compose.bindOwner inside the component or mount whose owner the callback belongs to"
			}) else ActiveModule.bind(CurrentResult, Callback)
		else
			return DiagnosticsModule.raise("owner/bind-body-not-a-function", "bindOwner expects the function to bind", {
				expected = "a function to run later under the owner active now",
				contract = "bindOwner exists to carry one callback back into its owner; there is nothing else to bind",
				actual = DiagnosticsModule.describe(Callback)
			})
		end
	end,
	withRootOwner = function(p1, p2)
		-- upvalues: v3 (ref)
		local V2 = v3 or require("@self/ownership/root-scope")
		v3 = V2
		
		return V2.withRootOwner(p1, p2)
	end,
	createRootOwner = function(p1, p2)
		-- upvalues: v3 (ref)
		local V2 = v3 or require("@self/ownership/root-scope")
		v3 = V2
		
		return V2.createRootOwner(p1, p2)
	end,
	currentOwner = ActiveModule.current,
	cleanup = function(Callback)
		-- upvalues: DynamicModule (copy), DiagnosticsModule (copy), ActiveModule (copy), NodesModule (copy), v27 (ref)
		local TeardownResult: (() -> ())? = nil
		
		if type(Callback) == "function" then
			TeardownResult = DynamicModule.teardown(Callback)
		else
			if type(Callback) ~= "table" then
				return DiagnosticsModule.raise("owner/uncleanable", "cleanup was given something it cannot tear down", {
					expected = "a function, or a table with a destroy or dispose method",
					actual = DiagnosticsModule.describe(Callback)
				})
			end
			if type(DynamicModule.read(Callback, "destroy")) == "function" then
				TeardownResult = function()
					-- upvalues: DynamicModule (upval), Callback (copy)
					DynamicModule.invoke(DynamicModule.read(Callback, "destroy"), Callback)
				end
			else
				if type(DynamicModule.read(Callback, "dispose")) ~= "function" then
					return DiagnosticsModule.raise("owner/uncleanable", "cleanup was given a table it cannot tear down", {
						actual = "table with neither destroy nor dispose",
						expected = "a function, or a table with a destroy or dispose method"
					})
				end
				TeardownResult = function()
					-- upvalues: DynamicModule (upval), Callback (copy)
					DynamicModule.invoke(DynamicModule.read(Callback, "dispose"), Callback)
				end
			end
		end
		local CurrentResult = ActiveModule.current()
		
		if CurrentResult ~= nil and NodesModule.inspecting.active then
			local V26 = v27 or require("@self/ownership/inspect")
			v27 = V26
			V26.cleanup(CurrentResult)
		end
		return ActiveModule.own(TeardownResult, "cleanup")
	end,
	custodyOf = NodesModule.custodyOf,
	labelOf = NodesModule.labelOf,
	createRuntime = require("@self/runtime").createRuntime,
	event = PropsModule.event,
	group = PropsModule.group,
	property = PropsModule.property,
	static = PropsModule.static,
	presence = function(p1, p2, p3)
		-- upvalues: v14 (ref)
		local V13 = v14 or require("@self/structure/presence")
		v14 = V13
		
		return V13(p1, p2, p3)
	end,
	show = function(p1, p2, p3)
		-- upvalues: v15 (ref)
		local V14 = v15 or require("@self/structure/show")
		v15 = V14
		
		return V14(p1, p2, p3)
	end,
	switch = function(p1, p2, p3)
		-- upvalues: v16 (ref)
		local V15 = v16 or require("@self/structure/switch")
		v16 = V15
		
		return V15(p1, p2, p3)
	end,
	keyed = function(p1)
		-- upvalues: v17 (ref)
		local V16 = v17 or require("@self/structure/keyed")
		v17 = V16
		
		return V16(p1)
	end,
	indexes = function(p1, p2)
		-- upvalues: v18 (ref)
		local V17 = v18 or require("@self/structure/indexes")
		v18 = V17
		
		return V17(p1, p2)
	end,
	OrderedCollection = function(p1)
		-- upvalues: v19 (ref)
		local V18 = v19 or require("@self/structure/ordered-collection")
		v19 = V18
		
		return V18(p1)
	end,
	SpatialCollection = function(p1)
		-- upvalues: v20 (ref)
		local V19 = v20 or require("@self/structure/spatial-collection")
		v20 = V19
		
		return V19(p1)
	end,
	TileCollection = function(p1)
		-- upvalues: v21 (ref)
		local V20 = v21 or require("@self/structure/tile-collection")
		v21 = V20
		
		return V20(p1)
	end,
	LayerStack = function(p1)
		-- upvalues: v22 (ref)
		local V21 = v22 or require("@self/structure/layer-stack")
		v22 = V21
		
		return V21(p1)
	end,
	MountBudget = function(p1)
		-- upvalues: v23 (ref)
		local V22 = v23 or require("@self/structure/mount-budget")
		v23 = V22
		
		return V22(p1)
	end,
	fragment = function(p1)
		-- upvalues: v24 (ref)
		local V23 = v24 or require("@self/structure/fragment")
		v24 = V23
		
		return V23(p1)
	end,
	portal = function(p1, p2)
		-- upvalues: v25 (ref)
		local V24 = v25 or require("@self/structure/portal")
		v25 = V24
		
		return V24(p1, p2)
	end,
	createFocusScope = function(p1)
		-- upvalues: v12 (ref)
		local V11 = v12 or require("@self/focus-scope")
		v12 = V11
		
		return V11(p1)
	end,
	focusNeighbor = function(p1, p2, p3)
		-- upvalues: v13 (ref)
		local V12 = v13 or require("@self/focus-neighbor")
		v13 = V12
		
		return V12(p1, p2, p3)
	end,
	createPool = function(p1)
		-- upvalues: v6 (ref)
		local V5 = v6 or require("@self/pool")
		v6 = V5
		
		return V5(p1)
	end,
	createKeyedCache = function(p1)
		-- upvalues: v7 (ref)
		local V6 = v7 or require("@self/keyed-cache")
		v7 = V6
		
		return V6(p1)
	end,
	createSlot = function(p1)
		-- upvalues: v8 (ref)
		local V7 = v8 or require("@self/slot")
		v8 = V7
		
		return V7(p1)
	end,
	geometry = table.freeze({
		safeArea = function(p1, p2, p3)
			-- upvalues: v2 (ref)
			local V1 = v2 or require("@self/geometry")
			v2 = V1
			
			return V1.safeArea(p1, p2, p3)
		end,
		fit = function(p1, p2, p3)
			-- upvalues: v2 (ref)
			local V1 = v2 or require("@self/geometry")
			v2 = V1
			
			return V1.fit(p1, p2, p3)
		end,
		overlaps = function(p1, p2)
			-- upvalues: v2 (ref)
			local V1 = v2 or require("@self/geometry")
			v2 = V1
			
			return V1.overlaps(p1, p2)
		end,
		contains = function(p1, p2)
			-- upvalues: v2 (ref)
			local V1 = v2 or require("@self/geometry")
			v2 = V1
			
			return V1.contains(p1, p2)
		end,
		firstClear = function(p1, p2)
			-- upvalues: v2 (ref)
			local V1 = v2 or require("@self/geometry")
			v2 = V1
			
			return V1.firstClear(p1, p2)
		end
	}),
	easing = require("@self/animation/easing"),
	cubicBezier = function(p1, p2, p3, p4)
		-- upvalues: v4 (ref)
		local V3 = v4 or require("@self/animation/cubic-bezier")
		v4 = V3
		
		return V3(p1, p2, p3, p4)
	end,
	numberCodec = require("@self/animation/codec").number,
	createSpringState = function(p1, p2)
		-- upvalues: v5 (ref)
		local V4 = v5 or require("@self/animation/spring")
		v5 = V4
		
		return V4.createState(p1, p2)
	end,
	stepSpring = function(p1, p2, p3, p4, p5)
		-- upvalues: v5 (ref)
		local V4 = v5 or require("@self/animation/spring")
		v5 = V4
		
		return V4.step(p1, p2, p3, p4, p5)
	end,
	springAtRest = function(p1, p2, p3, p4)
		-- upvalues: v5 (ref)
		local V4 = v5 or require("@self/animation/spring")
		v5 = V4
		
		return V4.atRest(p1, p2, p3, p4)
	end,
	springCoefficients = function(p1, p2)
		-- upvalues: v5 (ref)
		local V4 = v5 or require("@self/animation/spring")
		v5 = V4
		
		return V4.coefficients(p1, p2)
	end,
	createSharedResource = function(p1)
		-- upvalues: v1 (ref)
		local V0 = v1 or require("@self/async/shared")
		v1 = V0
		
		return V0(p1)
	end,
	createContext = require("@self/context"),
	boundary = function(p1, p2)
		-- upvalues: v11 (ref)
		local V10 = v11 or require("@self/async/boundary")
		v11 = V10
		
		return V10(p1, p2)
	end,
	formatDiagnostic = DiagnosticsModule.format,
	parseDiagnostic = DiagnosticsModule.parse,
	setWorkCounters = Stats.setEnabled,
	readWorkCounters = Stats.read,
	resetWorkCounters = Stats.reset,
	setYieldChecking = EvaluationModule.setValidating,
	profile = {
		start = function(p1, p2)
			-- upvalues: v28 (ref)
			local V27 = v28 or require("@self/reactive/profile")
			v28 = V27
			V27.start(p1, p2)
		end,
		stop = function()
			-- upvalues: v28 (ref)
			local V27 = v28 or require("@self/reactive/profile")
			v28 = V27
			
			return V27.stop()
		end,
		label = function(p1, p2)
			-- upvalues: v28 (ref)
			local V27 = v28 or require("@self/reactive/profile")
			v28 = V27
			V27.label(p1, p2)
		end,
		active = function()
			-- upvalues: v28 (ref)
			local V27 = v28 or require("@self/reactive/profile")
			v28 = V27
			
			return V27.isActive()
		end,
		format = function(p1, p2)
			-- upvalues: v28 (ref)
			local V27 = v28 or require("@self/reactive/profile")
			v28 = V27
			
			return V27.format(p1, p2)
		end,
		data = function(p1)
			-- upvalues: v28 (ref)
			local V27 = v28 or require("@self/reactive/profile")
			v28 = V27
			
			return V27.data(p1)
		end
	},
	inspect = {
		start = function(p1)
			-- upvalues: v27 (ref)
			local V26 = v27 or require("@self/ownership/inspect")
			v27 = V26
			V26.start(p1)
		end,
		stop = function()
			-- upvalues: v27 (ref)
			local V26 = v27 or require("@self/ownership/inspect")
			v27 = V26
			V26.stop()
		end,
		active = function()
			-- upvalues: NodesModule (copy)
			return NodesModule.inspecting.active
		end,
		label = function(p1, p2)
			-- upvalues: v27 (ref)
			local V26 = v27 or require("@self/ownership/inspect")
			v27 = V26
			V26.label(p1, p2)
		end,
		snapshot = function()
			-- upvalues: v26 (ref)
			local V25 = v26 or require("@self/ownership/report")
			v26 = V25
			
			return V25.snapshot()
		end,
		owner = function(p1)
			-- upvalues: v26 (ref)
			local V25 = v26 or require("@self/ownership/report")
			v26 = V25
			
			return V25.owner(p1)
		end,
		owned = function(p1)
			-- upvalues: v26 (ref)
			local V25 = v26 or require("@self/ownership/report")
			v26 = V25
			
			return V25.owned(p1)
		end,
		node = function(p1)
			-- upvalues: v26 (ref)
			local V25 = v26 or require("@self/ownership/report")
			v26 = V25
			
			return V25.node(p1)
		end,
		format = function(p1)
			-- upvalues: v26 (ref)
			local V25 = v26 or require("@self/ownership/report")
			v26 = V25
			
			return V25.format(p1)
		end,
		data = function(p1)
			-- upvalues: v26 (ref)
			local V25 = v26 or require("@self/ownership/report")
			v26 = V25
			
			return V25.data(p1)
		end
	},
	outstandingMounts = OwnerModule.rootSize,
	__resetForTests = function()
		-- upvalues: ActiveModule (copy), OwnerModule (copy), NodesModule (copy), GraphModule (copy), Stats (copy)
		ActiveModule.resetForTests()
		OwnerModule.disposeRoots()
		NodesModule.resetForTests()
		GraphModule.clock.now = 0
		Stats.reset()
	end
}