local WeakModule = require("../weak")
local CreateFunction = table.create
local CreateFunction1 = table.create
local _ = require("./types")
local NodeModule = require("./node")
local Stats = require("./evaluation").stats

local function _(p1): string
	return if p1.body == nil then if p1.effect == nil and p1.listener == nil then if p1.version == nil then "node" else "cell" else "watch" else "formula"
end

local Config = nil
local Enabled = false
local v1 = nil

local function rowFor(ProfilingLabelsRequireARegisteredReactiveNode, Kind)
	-- upvalues: NodeModule (copy), Config (ref)
	local AsNodeResult = NodeModule.asNode(ProfilingLabelsRequireARegisteredReactiveNode) or ProfilingLabelsRequireARegisteredReactiveNode
	local Config1 = Config
	
	if Config1 == nil then
		return nil
	end
	local Row = Config1.rows[AsNodeResult]
	
	if Row ~= nil then
		if Row.kind == "node" and Kind ~= "node" then
			Row.kind = Kind
		end
		return Row
	elseif Config1.maxNodes <= #Config1.ordered then
		Config1.droppedRecords += 1
		
		return nil
	else
		Config1.nextId += 1
		local config = {
			label = nil,
			writes = 0,
			writesSuppressed = 0,
			recomputations = 0,
			recomputationsSuppressed = 0,
			runs = 0,
			schedules = 0,
			schedulesCoalesced = 0,
			hostWrites = 0,
			peakFanOut = 0,
			id = Config1.nextId,
			kind = Kind,
			wakes = {}
		}
		Config1.rows[AsNodeResult] = config
		table.insert(Config1.ordered, config)
		
		return config
	end
end

local _ = function(p1)
	-- upvalues: Config (ref)
	local Config1 = Config
	
	if Config1 == nil or Config1.broken then return end
	if not pcall(p1, Config1) then
		Config1.broken = true
	end
end

local _ = function(p1)
	return p1.label or ("%s#%d"):format(p1.kind, p1.id)
end

local _ = function(Totals)
	return Totals.writes + Totals.recomputations + Totals.runs + Totals.hostWrites
end

Stats.state.recorder = {
	write = function(p1, p2)
		-- upvalues: rowFor (copy), Config (ref)
		local function v17(p3)
			-- upvalues: rowFor (upval), p1 (copy), p2 (copy)
			local Cell = rowFor(p1, "cell")
			
			if Cell == nil then return end
			if p2 then
				Cell.writesSuppressed += 1
				
				return
			else
				Cell.writes += 1
				p3.cause = Cell.label or ("cell#%d"):format(Cell.id)
			end
		end
		
		local Config1 = Config
		
		if Config1 ~= nil then
			if Config1.broken then return end
			if not pcall(v17, Config1) then
				Config1.broken = true
			end
		end
	end,
	wake = function(p1, Kind, PeakFanOut)
		-- upvalues: rowFor (copy), Config (ref)
		local function v20()
			-- upvalues: rowFor (upval), p1 (copy), Kind (copy), PeakFanOut (copy)
			local RowForResult = rowFor(p1, Kind)
			
			if RowForResult == nil then return end
			if RowForResult.peakFanOut < PeakFanOut then
				RowForResult.peakFanOut = PeakFanOut
			end
		end
		
		local Config1 = Config
		
		if Config1 ~= nil then
			if Config1.broken then return end
			if not pcall(v20, Config1) then
				Config1.broken = true
			end
		end
	end,
	edge = function(p1, Kind, p2)
		-- upvalues: rowFor (copy), Config (ref)
		local function v23()
			-- upvalues: rowFor (upval), p1 (copy), Kind (copy), p2 (copy)
			local RowForResult = rowFor(p1, Kind)
			local RowForResult1 = rowFor(p2, if p2.body == nil then if p2.effect == nil and p2.listener == nil then if p2.version == nil then "node" else "cell" else "watch" else "formula")
			
			if RowForResult == nil or RowForResult1 == nil then return end
			local Wake = RowForResult.wakes[RowForResult1.id]
			
			if Wake == nil then
				local Count = 0
				
				for _ in RowForResult.wakes do
					Count += 1
				end
				if Count >= 32 then return end
			end
			RowForResult.wakes[RowForResult1.id] = (Wake or 0) + 1
		end
		
		local Config1 = Config
		
		if Config1 ~= nil then
			if Config1.broken then return end
			if not pcall(v23, Config1) then
				Config1.broken = true
			end
		end
	end,
	recompute = function(p3)
		-- upvalues: rowFor (copy), Config (ref)
		local function v29()
			-- upvalues: rowFor (upval), p3 (copy)
			local Formula = rowFor(p3, "formula")
			
			if Formula ~= nil then
				Formula.recomputations += 1
			end
		end
		
		local Config1 = Config
		
		if Config1 ~= nil then
			if Config1.broken then return end
			if not pcall(v29, Config1) then
				Config1.broken = true
			end
		end
	end,
	suppressedRecompute = function(p3)
		-- upvalues: rowFor (copy), Config (ref)
		local function v32()
			-- upvalues: rowFor (upval), p3 (copy)
			local Formula = rowFor(p3, "formula")
			
			if Formula ~= nil then
				Formula.recomputationsSuppressed += 1
			end
		end
		
		local Config1 = Config
		
		if Config1 ~= nil then
			if Config1.broken then return end
			if not pcall(v32, Config1) then
				Config1.broken = true
			end
		end
	end,
	schedule = function(p3, p4)
		-- upvalues: rowFor (copy), Config (ref)
		local function v35()
			-- upvalues: rowFor (upval), p3 (copy), p4 (copy)
			local Watch = rowFor(p3, "watch")
			
			if Watch == nil then return end
			if p4 then
				Watch.schedulesCoalesced += 1
				
				return
			else
				Watch.schedules += 1
			end
		end
		
		local Config1 = Config
		
		if Config1 ~= nil then
			if Config1.broken then return end
			if not pcall(v35, Config1) then
				Config1.broken = true
			end
		end
	end,
	enterRun = function(p3)
		-- upvalues: Config (ref), rowFor (copy)
		local Config1 = Config
		
		if Config1 == nil or Config1.broken then return end
		local function v39()
			-- upvalues: rowFor (upval), p3 (copy), Config1 (copy)
			local Watch = rowFor(p3, "watch")
			
			if Watch ~= nil then
				Watch.runs += 1
				Config1.running = Watch
				
				return
			end
		end
		
		local Config2 = Config
		
		if Config2 ~= nil then
			if Config2.broken then return end
			if not pcall(v39, Config2) then
				Config2.broken = true
			end
		end
	end,
	hostWrite = function()
		-- upvalues: Config (ref)
		local Config1 = Config
		
		if Config1 == nil or Config1.broken then return end
		local Running = Config1.running
		
		if Running ~= nil then
			Running.hostWrites += 1
		end
	end,
	drain = function(Runs, Seconds)
		-- upvalues: Config (ref)
		local function v44(p3)
			-- upvalues: Runs (copy), Seconds (copy)
			local config = { runs = Runs, seconds = Seconds, cause = p3.cause }
			p3.cause = nil
			
			if #p3.drains < p3.maxDrains then
				table.insert(p3.drains, config)
				
				return
			else
				p3.drainCursor = p3.drainCursor % p3.maxDrains + 1
				p3.drains[p3.drainCursor] = config
			end
		end
		
		local Config1 = Config
		
		if Config1 ~= nil then
			if Config1.broken then return end
			if not pcall(v44, Config1) then
				Config1.broken = true
			end
		end
	end,
	naming = function(PendingLabel)
		-- upvalues: Config (ref)
		local Config1 = Config
		
		if Config1 ~= nil and not Config1.broken then
			Config1.pendingLabel = PendingLabel
		end
	end,
	born = function(p3, p4)
		-- upvalues: rowFor (copy), Config (ref)
		local function v52(p5)
			-- upvalues: rowFor (upval), p3 (copy), p4 (copy)
			local Watch = rowFor(p3, "watch")
			
			if Watch ~= nil and Watch.label == nil then
				Watch.label = p4 or p5.pendingLabel
			end
		end
		
		local Config1 = Config
		
		if Config1 ~= nil then
			if Config1.broken then return end
			if not pcall(v52, Config1) then
				Config1.broken = true
			end
		end
	end,
	nowOrNil = function()
		-- upvalues: v1 (ref), Config (ref)
		local Callback = v1
		
		return if Config == nil or Callback == nil then nil else Callback()
	end
}

return {
	start = function(Callback, p3)
		-- upvalues: Enabled (ref), Stats (copy), v1 (ref), WeakModule (copy), Config (ref)
		local P27 = p3 or {}
		Enabled = Stats.state.enabled
		Stats.setEnabled(true)
		v1 = Callback
		local Rows = {}
		WeakModule.keys(Rows)
		Config = {
			nextId = 0,
			droppedRecords = 0,
			drainCursor = 0,
			cause = nil,
			running = nil,
			pendingLabel = nil,
			broken = false,
			rows = Rows,
			ordered = {},
			maxNodes = P27.maxNodes or 4096,
			maxDrains = P27.maxDrains or 256,
			drains = {},
			startedAt = Callback()
		}
	end,
	stop = function()
		-- upvalues: Config (ref), v1 (ref), Stats (copy), Enabled (ref)
		local Config1 = Config
		local Callback = v1
		Config = nil
		v1 = nil
		Stats.setEnabled(Enabled)
		
		if Config1 == nil then
			return {
				active = false,
				seconds = 0,
				droppedRecords = 0,
				nodes = {},
				drains = {},
				totals = {}
			}
		end
		local Totals = {
			writes = 0,
			writesSuppressed = 0,
			recomputations = 0,
			recomputationsSuppressed = 0,
			runs = 0,
			schedules = 0,
			schedulesCoalesced = 0,
			hostWrites = 0
		}
		
		for _, Totals1 in Config1.ordered do
			Totals.writes += Totals1.writes
			Totals.writesSuppressed += Totals1.writesSuppressed
			Totals.recomputations += Totals1.recomputations
			Totals.recomputationsSuppressed += Totals1.recomputationsSuppressed
			Totals.runs += Totals1.runs
			Totals.schedules += Totals1.schedules
			Totals.schedulesCoalesced += Totals1.schedulesCoalesced
			Totals.hostWrites += Totals1.hostWrites
		end
		Totals.broken = if Config1.broken then 1 else 0
		
		return {
			active = true,
			seconds = if Callback == nil then 0 else Callback() - Config1.startedAt,
			nodes = Config1.ordered,
			drains = Config1.drains,
			droppedRecords = Config1.droppedRecords,
			totals = Totals
		}
	end,
	label = function(p3, Label)
		-- upvalues: NodeModule (copy), rowFor (copy), Config (ref)
		local function v47()
			-- upvalues: NodeModule (upval), p3 (copy), rowFor (upval), Label (copy)
			local ProfilingLabelsRequireARegisteredReactiveNode = assert(NodeModule.asNode(p3), "profiling labels require a registered reactive node")
			local RowForResult = rowFor(ProfilingLabelsRequireARegisteredReactiveNode, if ProfilingLabelsRequireARegisteredReactiveNode.body == nil then if ProfilingLabelsRequireARegisteredReactiveNode.effect == nil and ProfilingLabelsRequireARegisteredReactiveNode.listener == nil then if ProfilingLabelsRequireARegisteredReactiveNode.version == nil then "node" else "cell" else "watch" else "formula")
			
			if RowForResult ~= nil then
				RowForResult.label = Label
			end
		end
		
		local Config1 = Config
		
		if Config1 ~= nil then
			if Config1.broken then return end
			if not pcall(v47, Config1) then
				Config1.broken = true
			end
		end
	end,
	isActive = function(): boolean
		-- upvalues: Config (ref)
		return Config ~= nil
	end,
	format = function(p3, p4): string
		local List = {}
		
		local function _(p5)
			-- upvalues: List (copy)
			table.insert(List, p5)
		end
		
		if not p3.active then
			return "compose profile: not running\n"
		end
		table.insert(List, (("compose profile: %.3f s, %d node(s) tracked"):format(p3.seconds, #p3.nodes)))
		
		if p3.droppedRecords > 0 then
			table.insert(List, (("  capture dropped %d time(s) at the node cap; counts are incomplete"):format(p3.droppedRecords)))
		end
		if (p3.totals.broken or 0) > 0 then
			table.insert(List, "  the recorder failed part-way and stopped; counts below are incomplete")
		end
		table.insert(List, "")
		table.insert(List, (("  writes %d (%d suppressed) | recomputations %d (%d published) | watch runs %d | host writes %d"):format(p3.totals.writes, p3.totals.writesSuppressed, p3.totals.recomputations, p3.totals.recomputations - p3.totals.recomputationsSuppressed, p3.totals.runs, p3.totals.hostWrites)))
		table.insert(List, (("  schedules %d (%d coalesced)"):format(p3.totals.schedules, p3.totals.schedulesCoalesced)))
		table.insert(List, "")
		local Copy = table.clone(p3.nodes)
		table.sort(Copy, function(A, B): boolean
			local NewWrites = A.writes + A.recomputations + A.runs + A.hostWrites
			local NewWrites1 = B.writes + B.recomputations + B.runs + B.hostWrites
			
			return if NewWrites == NewWrites1 then A.id < B.id else NewWrites1 < NewWrites
		end)
		local t = {}
		
		for _, node in p3.nodes do
			t[node.id] = node
		end
		table.insert(List, "hottest:")
		
		for i = 1, math.min(p4 or 12, #Copy) do
			local Entry = Copy[i]
			local List1 = {}
			
			if Entry.writes > 0 then
				table.insert(List1, ("%d write%s"):format(Entry.writes, if Entry.writes == 1 then "" else "s"))
			end
			if Entry.writesSuppressed > 0 then
				table.insert(List1, ("%d suppressed"):format(Entry.writesSuppressed))
			end
			if Entry.recomputations > 0 then
				table.insert(List1, ("%d recompute%s (%d published)"):format(Entry.recomputations, if Entry.recomputations == 1 then "" else "s", Entry.recomputations - Entry.recomputationsSuppressed))
			end
			if Entry.runs > 0 then
				table.insert(List1, ("%d run%s"):format(Entry.runs, if Entry.runs == 1 then "" else "s"))
			end
			if Entry.schedulesCoalesced > 0 then
				table.insert(List1, ("%d coalesced"):format(Entry.schedulesCoalesced))
			end
			if Entry.hostWrites > 0 then
				table.insert(List1, ("%d host write%s"):format(Entry.hostWrites, if Entry.hostWrites == 1 then "" else "s"))
			end
			if Entry.peakFanOut > 0 then
				table.insert(List1, ("fan-out %d"):format(Entry.peakFanOut))
			end
			if #List1 == 0 then
				table.insert(List1, "no recorded work")
			end
			table.insert(List, (("  %-34s %s"):format(Entry.label or ("%s#%d"):format(Entry.kind, Entry.id), table.concat(List1, ", "))))
			local List2 = {}
			
			for wake in Entry.wakes do
				table.insert(List2, wake)
			end
			table.sort(List2)
			
			for _, value in List2 do
				local v2 = t[value]
				
				if v2 ~= nil then
					table.insert(List, (("      -> %-30s x%d"):format(v2.label or ("%s#%d"):format(v2.kind, v2.id), Entry.wakes[value])))
				end
			end
		end
		if #p3.drains > 0 then
			local Copy1 = table.clone(p3.drains)
			table.sort(Copy1, function(A, B): boolean
				return B.seconds < A.seconds
			end)
			table.insert(List, "")
			table.insert(List, (("longest drains (of %d recorded):"):format(#p3.drains)))
			
			for i1 = 1, math.min(5, #Copy1) do
				local Entry = Copy1[i1]
				table.insert(List, (("  %8.3f ms  %d run%s  %s"):format(Entry.seconds * 1000, Entry.runs, if Entry.runs == 1 then "" else "s", Entry.cause or "cause not recorded")))
			end
		end
		return table.concat(List, "\n") .. "\n"
	end,
	data = function(p5)
		-- upvalues: CreateFunction (copy), CreateFunction1 (copy)
		local CreateResult = CreateFunction(#p5.nodes)
		
		for i, node in p5.nodes do
			local Wakes = {}
			local List = {}
			
			for wake in node.wakes do
				table.insert(List, wake)
			end
			table.sort(List)
			
			for _, To in List do
				table.insert(Wakes, { to = To, count = node.wakes[To] })
			end
			CreateResult[i] = {
				id = node.id,
				kind = node.kind,
				label = node.label,
				name = node.label or ("%s#%d"):format(node.kind, node.id),
				writes = node.writes,
				writesSuppressed = node.writesSuppressed,
				recomputations = node.recomputations,
				recomputationsPublished = node.recomputations - node.recomputationsSuppressed,
				runs = node.runs,
				schedules = node.schedules,
				schedulesCoalesced = node.schedulesCoalesced,
				hostWrites = node.hostWrites,
				peakFanOut = node.peakFanOut,
				wakes = Wakes
			}
		end
		local CreateResult1 = CreateFunction1(#p5.drains)
		
		for i1, drain in p5.drains do
			CreateResult1[i1] = {
				runs = drain.runs,
				seconds = drain.seconds,
				cause = drain.cause
			}
		end
		return {
			schemaVersion = 1,
			active = p5.active,
			seconds = p5.seconds,
			droppedRecords = p5.droppedRecords,
			totals = p5.totals,
			nodes = CreateResult,
			drains = CreateResult1
		}
	end
}