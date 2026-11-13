local ActiveModule = require("../ownership/active")
local DiagnosticsModule = require("../diagnostics")
local HostModule = require("../host")
local NodesModule = require("../ownership/nodes")
local OwnerModule = require("../ownership/owner")
local ChildrenModule = require("./children")
local Block = ChildrenModule.block
local _ = require("../reactive/types")
local PropsModule = require("./props")
local Applying = PropsModule.applying
local Inspecting = NodesModule.inspecting

return {
	createFragmentMount = function(p1, p2, p3, p4, Callback1, Callback2, Callback4, Callback, Callback3)
		-- upvalues: Block (copy), DiagnosticsModule (copy), ActiveModule (copy), OwnerModule (copy), Inspecting (copy), ChildrenModule (copy)
		local Render = p1.render
		
		return function(p5, p6)
			-- upvalues: Block (upval), DiagnosticsModule (upval), Callback1 (copy), Callback2 (copy), ActiveModule (upval), OwnerModule (upval), p2 (copy), Inspecting (upval), Callback3 (copy), ChildrenModule (upval), p1 (copy), Render (copy), p3 (copy), p4 (copy), Callback4 (copy), Callback (copy)
			local NameOfResult = Block.nameOf(p5)
			
			if type(p6) ~= "table" and type(p6) ~= "userdata" then
				return DiagnosticsModule.raise("mount/target-not-a-node", "mountFragment expects a host node to mount into", {
					expected = "a node belonging to the host this runtime renders to",
					component = NameOfResult,
					actual = DiagnosticsModule.describe(p6)
				})
			end
			Callback1("mountFragment", NameOfResult)
			Callback2(p6)
			local CurrentResult = ActiveModule.current()
			local NoCurrentResult = CurrentResult == nil
			local CurrentResult1 = CurrentResult or OwnerModule.createOwner(p2)
			
			if NoCurrentResult and Inspecting.active then
				Callback3().mount(CurrentResult1)
				Callback3().label(CurrentResult1, NameOfResult)
			end
			local Child = OwnerModule.createChild(CurrentResult1)
			local List = {}
			local List1 = ChildrenModule.createList(p1, p6)
			OwnerModule.own(Child, function()
				-- upvalues: List (copy), Render (upval), p6 (copy)
				local List1 = {}
				
				for i = #List, 1, -1 do
					local Success, Result = pcall(Render.removeChild, p6, List[i])
					
					if not Success then
						table.insert(List1, (tostring(Result)))
					end
				end
				if #List1 > 0 then
					error(table.concat(List1, "\n"), 0)
				end
			end)
			local Success, Result = pcall(function()
				-- upvalues: ActiveModule (upval), Child (copy), p5 (copy), DiagnosticsModule (upval), NameOfResult (copy), ChildrenModule (upval), List1 (copy), p3 (upval), List (copy), p4 (upval)
				local WithOwnerResult = ActiveModule.withOwner(Child, p5)
				
				if type(WithOwnerResult) ~= "table" then
					return DiagnosticsModule.raise("mount/not-a-child-list", "a fragment returned something that is not a list of children", {
						expected = "an array of nodes and structural directives",
						component = NameOfResult,
						actual = DiagnosticsModule.describe(WithOwnerResult)
					})
				end
				for Index, value in WithOwnerResult do
					local AddSlotResult = ChildrenModule.addSlot(List1)
					
					if type(value) == "function" and p3[value] == nil then
						ActiveModule.withOwner(Child, function()
							-- upvalues: value (copy), ChildrenModule (upval), List1 (upval), AddSlotResult (copy)
							value(ChildrenModule.mountPointFor(List1, AddSlotResult))
						end)
					elseif type(value) ~= "table" and type(value) ~= "userdata" then
						return if p3[value] == nil then DiagnosticsModule.raise("mount/not-a-child", "a fragment entry is neither a node nor a directive", {
							expected = "a node, or a directive such as show(...) or keyed(...)",
							component = NameOfResult,
							index = Index,
							actual = DiagnosticsModule.describe(value)
						}) else DiagnosticsModule.raise("mount/constructor-not-applied", "a fragment child is a constructor that was never given props", {
							component = NameOfResult,
							index = Index,
							childKind = p3[value],
							label = p4[value],
							fix = if p4[value] == nil then ("write %s {} -- an empty table is fine"):format(p3[value]) else ("write %s %q {} -- an empty table is fine"):format(p3[value], p4[value])
						})
					else
						ChildrenModule.insertStatic(List1, AddSlotResult, value)
						table.insert(List, value)
					end
				end
			end)
			
			if not Success then
				OwnerModule.dispose(Child)
				
				if NoCurrentResult then
					OwnerModule.dispose(CurrentResult1)
				end
				error(Result, 0)
			end
			if NoCurrentResult then
				return Callback(p6, (OwnerModule.holdRoot(function()
					-- upvalues: Callback4 (upval), OwnerModule (upval), Child (copy), CurrentResult1 (copy)
					Callback4(OwnerModule.disposer(Child), OwnerModule.disposer(CurrentResult1))
				end))), List
			else
				return OwnerModule.disposer(Child), List
			end
		end
	end,
	decorate = function(p7, Callback, p8, p9)
		-- upvalues: DiagnosticsModule (copy), OwnerModule (copy), Applying (copy), ActiveModule (copy), PropsModule (copy)
		if type(p8) ~= "table" and type(p8) ~= "userdata" then
			return DiagnosticsModule.raise("mount/not-a-node", "decorate expects an existing host node", {
				expected = "a node belonging to the host this runtime renders to",
				actual = DiagnosticsModule.describe(p8)
			})
		end
		if type(p9) ~= "table" then
			return DiagnosticsModule.raise("props/not-a-table", "decorate expects a props table", {
				expected = "a table of properties and event keys",
				actual = DiagnosticsModule.describe(p9)
			})
		end
		local Child = OwnerModule.createChild((Callback("decorate")))
		local Key = Applying.key
		Applying.key = nil
		local Success, Result = pcall(function()
			-- upvalues: ActiveModule (upval), Child (copy), PropsModule (upval), p7 (copy), p8 (copy), p9 (copy), DiagnosticsModule (upval)
			ActiveModule.withOwner(Child, function()
				-- upvalues: PropsModule (upval), p7 (upval), p8 (upval), p9 (upval), Child (upval), DiagnosticsModule (upval)
				PropsModule.apply(p7, p8, p9, Child)
				
				return if #p9 > 0 then DiagnosticsModule.raise("props/decorate-has-children", "decorate cannot add children", {
					contract = "decorate only applies properties and events to an existing node",
					fix = "use a portal to mount children into a node Compose does not own"
				}) else nil
			end)
		end)
		local Key1 = Applying.key
		Applying.key = Key
		
		if not Success then
			OwnerModule.dispose(Child)
			
			if Key1 ~= nil then
				error(("%s\n  while applying: decorate.%s"):format(tostring(Result), (tostring(Key1))), 0)
			end
			error(Result, 0)
		end
		if Child.head == nil then
			OwnerModule.dispose(Child)
		end
		return p8
	end,
	connect = function(p7, Callback, p8, Event, Callback1)
		-- upvalues: DiagnosticsModule (copy), OwnerModule (copy)
		if type(p8) ~= "table" and type(p8) ~= "userdata" then
			return DiagnosticsModule.raise("mount/not-a-node", "connect expects an existing host node", {
				expected = "a node belonging to the host this runtime renders to",
				event = Event,
				actual = DiagnosticsModule.describe(p8)
			})
		elseif type(Callback1) == "function" then
			local Events = p7.events
			
			return if Events == nil then DiagnosticsModule.raise("host/no-events", ("host %q cannot subscribe to events"):format(p7.name), {
				contract = "subscribing requires the host events capability",
				fix = "implement host.events.connectEvent, or stop calling connect on this host",
				event = Event
			}) else OwnerModule.own(Callback("connect"), (Events.connectEvent(p8, Event, Callback1)))
		else
			return DiagnosticsModule.raise("props/event-needs-handler", "connect expects a handler function", {
				expected = "a function",
				event = Event,
				actual = DiagnosticsModule.describe(Callback1)
			})
		end
	end,
	adopt = function(p7, Callback, Callback2, Callback1, p8)
		-- upvalues: NodesModule (copy), DiagnosticsModule (copy), HostModule (copy), OwnerModule (copy), Inspecting (copy)
		local Adopt = Callback("adopt")
		
		if NodesModule.custodyOf(p8) == "owned" then
			return DiagnosticsModule.raise("owner/already-owned", "adopt was given a node Compose already owns", {
				contract = "a node has exactly one owner; adopting a second time would destroy it twice",
				fix = "adopt only nodes created outside Compose",
				node = HostModule.describeNode(p7, p8)
			})
		end
		NodesModule.markAdopted(p8)
		OwnerModule.own(Adopt, function()
			-- upvalues: Callback2 (copy), p8 (copy)
			Callback2(p8)
		end)
		
		if Inspecting.active then
			Callback1().node(Adopt, p8, "adopted")
			NodesModule.chargeToOwner(Adopt, p8, "adopted")
		end
		return p8
	end,
	borrow = function(Callback, p7)
		-- upvalues: NodesModule (copy), Inspecting (copy), ActiveModule (copy)
		NodesModule.markBorrowed(p7)
		
		if Inspecting.active then
			local CurrentResult = ActiveModule.current()
			
			if CurrentResult ~= nil then
				Callback().node(CurrentResult, p7, "borrowed")
				NodesModule.chargeToOwner(CurrentResult, p7, "borrowed")
			end
		end
		return p7
	end
}