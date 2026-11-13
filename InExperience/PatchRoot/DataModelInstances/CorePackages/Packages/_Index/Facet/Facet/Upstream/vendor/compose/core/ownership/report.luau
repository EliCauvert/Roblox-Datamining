local CreateFunction = table.create
local InspectModule = require("./inspect")
local _ = require("../host")
local NodesModule = require("./nodes")
local OwnerModule = require("./owner")
local config = {
	active = false,
	outstandingMounts = 0,
	trackedNodes = 0,
	pending = 0,
	droppedOwners = 0,
	droppedNodes = 0,
	mounts = {},
	detached = {}
}

local function describe(OrderedEntry, Record, p1)
	-- upvalues: InspectModule (copy), OwnerModule (copy), describe (copy)
	if p1[OrderedEntry] then
		return {
			holding = 0,
			disposed = false,
			owned = 0,
			adopted = 0,
			borrowed = 0,
			watches = 0,
			cleanups = 0,
			totalHolding = 0,
			totalOwned = 0,
			totalAdopted = 0,
			totalBorrowed = 0,
			totalWatches = 0,
			totalCleanups = 0,
			descendants = 0,
			unclassified = 0,
			id = Record.id,
			label = Record.label,
			children = {}
		}
	end
	p1[OrderedEntry] = true
	local StateResult = InspectModule.__state()
	local SizeResult = 0
	local IsDisposed = false
	
	if not pcall(function()
		-- upvalues: SizeResult (ref), OwnerModule (upval), OrderedEntry (copy), IsDisposed (ref)
		SizeResult = OwnerModule.size(OrderedEntry)
		IsDisposed = OwnerModule.isDisposed(OrderedEntry)
	end) then
		SizeResult = 0
	end
	local Children = {}
	
	if StateResult ~= nil then
		local List = {}
		
		for child in Record.children do
			table.insert(List, child)
		end
		table.sort(List, function(A, B): boolean
			-- upvalues: StateResult (copy)
			local Record = StateResult.records[A]
			local Record1 = StateResult.records[B]
			
			return (if Record == nil then 0 else Record.id) < (if Record1 == nil then 0 else Record1.id)
		end)
		
		for _, value in List do
			local Record1 = StateResult.records[value]
			
			if Record1 ~= nil then
				table.insert(Children, describe(value, Record1, p1))
			end
		end
	end
	local NewOwned = Record.owned + Record.adopted + Record.borrowed + Record.watches + Record.cleanups + Record.childCount
	local NewTotalHolding: number = SizeResult
	local Owned = Record.owned
	local Adopted = Record.adopted
	local Borrowed = Record.borrowed
	local Watches = Record.watches
	local Cleanups = Record.cleanups
	local CountChildren = #Children
	
	for _, child1 in Children do
		NewTotalHolding += child1.totalHolding
		Owned += child1.totalOwned
		Adopted += child1.totalAdopted
		Borrowed += child1.totalBorrowed
		Watches += child1.totalWatches
		Cleanups += child1.totalCleanups
		CountChildren += child1.descendants
	end
	return {
		id = Record.id,
		label = Record.label,
		holding = SizeResult,
		disposed = IsDisposed,
		owned = Record.owned,
		adopted = Record.adopted,
		borrowed = Record.borrowed,
		watches = Record.watches,
		cleanups = Record.cleanups,
		children = Children,
		totalHolding = NewTotalHolding,
		totalOwned = Owned,
		totalAdopted = Adopted,
		totalBorrowed = Borrowed,
		totalWatches = Watches,
		totalCleanups = Cleanups,
		descendants = CountChildren,
		unclassified = math.max(0, SizeResult - NewOwned)
	}
end

local function _(Count: number): string
	return string.rep("  ", Count)
end

local _ = function(List, p2)
	table.insert(List, p2)
end

local function renderOwner(List, p2, Count: number)
	-- upvalues: renderOwner (copy)
	table.insert(List, (("%s%s  holding %d%s"):format(string.rep("  ", Count), p2.label or ("owner#%d"):format(p2.id), p2.holding, if p2.disposed then "  (disposed)" else "")))
	
	if Count == 1 and p2.descendants > 0 then
		table.insert(List, (("%s  tree: %d node%s owned, %d adopted, %d borrowed, %d watch%s, %d cleanup%s, %d owner%s"):format(string.rep("  ", Count), p2.totalOwned, if p2.totalOwned == 1 then "" else "s", p2.totalAdopted, p2.totalBorrowed, p2.totalWatches, if p2.totalWatches == 1 then "" else "es", p2.totalCleanups, if p2.totalCleanups == 1 then "" else "s", p2.descendants, if p2.descendants == 1 then "" else "s")))
	end
	local List1 = {}
	
	if p2.owned > 0 then
		table.insert(List1, ("%d owned node%s"):format(p2.owned, if p2.owned == 1 then "" else "s"))
	end
	if p2.adopted > 0 then
		table.insert(List1, ("%d adopted"):format(p2.adopted))
	end
	if p2.borrowed > 0 then
		table.insert(List1, ("%d borrowed"):format(p2.borrowed))
	end
	if p2.watches > 0 then
		table.insert(List1, ("%d watch%s"):format(p2.watches, if p2.watches == 1 then "" else "es"))
	end
	if p2.cleanups > 0 then
		table.insert(List1, ("%d cleanup%s"):format(p2.cleanups, if p2.cleanups == 1 then "" else "s"))
	end
	if #p2.children > 0 then
		table.insert(List1, ("%d child owner%s"):format(#p2.children, if #p2.children == 1 then "" else "s"))
	end
	if #List1 > 0 then
		table.insert(List, (("%s  %s"):format(string.rep("  ", Count), table.concat(List1, ", "))))
	end
	if p2.unclassified > 0 then
		table.insert(List, ("%s  %d unclassified -- registered before the inspector started, or a kind it does "):format(string.rep("  ", Count), p2.unclassified) .. "not track")
	end
	for _, child in p2.children do
		renderOwner(List, child, Count + 1)
	end
end

return {
	snapshot = function()
		-- upvalues: InspectModule (copy), config (copy), describe (copy), OwnerModule (copy), NodesModule (copy)
		local StateResult = InspectModule.__state()
		
		if StateResult == nil then
			return config
		end
		local Mounts = {}
		local Detached = {}
		local t = {}
		
		for i = 1, StateResult.orderedCount do
			local OrderedEntry = StateResult.ordered[i]
			local NoOrderedEntry = OrderedEntry == nil
			local Record = nil
			
			if not NoOrderedEntry then
				Record = StateResult.records[OrderedEntry]
				NoOrderedEntry = Record == nil or t[OrderedEntry]
			end
			if not NoOrderedEntry then
				if Record.isMount then
					table.insert(Mounts, (describe(OrderedEntry, Record, t)))
				elseif not Record.isChild then
					table.insert(Detached, (describe(OrderedEntry, Record, t)))
				end
			end
		end
		return {
			active = true,
			pending = 0,
			mounts = Mounts,
			detached = Detached,
			outstandingMounts = OwnerModule.rootSize(),
			trackedNodes = NodesModule.trackedCount(),
			droppedOwners = StateResult.droppedOwners,
			droppedNodes = StateResult.droppedNodes
		}
	end,
	node = function(p3)
		-- upvalues: NodesModule (copy), InspectModule (copy)
		local CustodyOfResult = NodesModule.custodyOf(p3)
		local LabelOfResult = NodesModule.labelOf(p3)
		local StateResult = InspectModule.__state()
		local NodeOwnerEntry = if StateResult == nil then nil else StateResult.nodeOwner[p3]
		local ThisNode: string = if LabelOfResult == nil then "this node" else ("%q"):format(LabelOfResult)
		
		return if CustodyOfResult == "borrowed" then {
			custody = CustodyOfResult,
			label = LabelOfResult,
			ownerId = if NodeOwnerEntry == nil then nil else NodeOwnerEntry.id,
			ownerLabel = if NodeOwnerEntry == nil then nil else NodeOwnerEntry.label,
			because = ("Compose will never destroy %s: it is borrowed. Whatever created it "):format(ThisNode) .. "is what has to end it."
		} elseif NodeOwnerEntry == nil then {
			ownerId = nil,
			ownerLabel = nil,
			custody = CustodyOfResult,
			label = LabelOfResult,
			because = ("Compose will destroy this node when its owner is disposed (custody %q), but "):format(CustodyOfResult) .. "which owner holds it was not recorded -- the inspector was not running when it was taken on."
		} else {
			custody = CustodyOfResult,
			label = LabelOfResult,
			ownerId = NodeOwnerEntry.id,
			ownerLabel = NodeOwnerEntry.label,
			because = ("Compose will destroy this node when %s is disposed (custody %q). It is alive "):format(NodeOwnerEntry.label or ("owner#%d"):format(NodeOwnerEntry.id), CustodyOfResult) .. "because that owner is."
		}
	end,
	owner = function(p3)
		-- upvalues: InspectModule (copy), describe (copy)
		local StateResult = InspectModule.__state()
		
		if StateResult == nil then
			return nil
		else
			local Record = StateResult.records[p3]
			
			return if Record == nil then nil else describe(p3, Record, {})
		end
	end,
	owned = function(p3)
		-- upvalues: InspectModule (copy), NodesModule (copy)
		return if InspectModule.__state() == nil then nil else NodesModule.ownedCounts(p3)
	end,
	format = function(p3): string
		-- upvalues: renderOwner (copy)
		if not p3.active then
			return "compose inspect: not running\n"
		end
		local List = {}
		table.insert(List, (("compose inspect: %d outstanding mount(s), %d node(s) with recorded custody, %d pending"):format(p3.outstandingMounts, p3.trackedNodes, p3.pending)))
		
		if p3.droppedOwners > 0 or p3.droppedNodes > 0 then
			table.insert(List, (("  capture dropped at the cap: %d owner(s), %d node(s); counts below are incomplete"):format(p3.droppedOwners, p3.droppedNodes)))
		end
		table.insert(List, "")
		
		if #p3.mounts == 0 then
			table.insert(List, "mounts: none")
		else
			table.insert(List, "mounts:")
			
			for _, mount in p3.mounts do
				renderOwner(List, mount, 1)
			end
		end
		if #p3.detached > 0 then
			table.insert(List, "")
			table.insert(List, "owners held outside any mount:")
			
			for _, value in p3.detached do
				renderOwner(List, value, 1)
			end
		end
		return table.concat(List, "\n") .. "\n"
	end,
	data = function(p4)
		-- upvalues: CreateFunction (copy)
		local function shape(p5)
			-- upvalues: CreateFunction (upval), shape (copy)
			local CreateResult = CreateFunction(#p5.children)
			
			for i, child in p5.children do
				CreateResult[i] = shape(child)
			end
			return {
				id = p5.id,
				label = p5.label,
				holding = p5.holding,
				disposed = p5.disposed,
				owned = p5.owned,
				adopted = p5.adopted,
				borrowed = p5.borrowed,
				watches = p5.watches,
				cleanups = p5.cleanups,
				unclassified = p5.unclassified,
				totalHolding = p5.totalHolding,
				totalOwned = p5.totalOwned,
				totalAdopted = p5.totalAdopted,
				totalBorrowed = p5.totalBorrowed,
				totalWatches = p5.totalWatches,
				totalCleanups = p5.totalCleanups,
				descendants = p5.descendants,
				children = CreateResult
			}
		end
		
		local CreateResult = CreateFunction(#p4.mounts)
		
		for i, mount in p4.mounts do
			CreateResult[i] = shape(mount)
		end
		local CreateResult1 = CreateFunction(#p4.detached)
		
		for i1, value in p4.detached do
			CreateResult1[i1] = shape(value)
		end
		return {
			schemaVersion = 1,
			active = p4.active,
			outstandingMounts = p4.outstandingMounts,
			trackedNodes = p4.trackedNodes,
			pending = p4.pending,
			droppedOwners = p4.droppedOwners,
			droppedNodes = p4.droppedNodes,
			mounts = CreateResult,
			detached = CreateResult1
		}
	end
}