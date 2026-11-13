--!native

local CodecModule = require("./animation/codec")
local ActiveModule = require("./ownership/active")
local ChildrenModule = require("@self/children")
local Block = ChildrenModule.block
local DiagnosticsModule = require("./diagnostics")
local DynamicModule = require("./dynamic")
local HostModule = require("./host")
local NodesModule = require("./ownership/nodes")
local OwnerModule = require("./ownership/owner")
local ReactorModule = require("./reactive/reactor")
local PropsModule = require("@self/props")
local _ = require("./types")
local _ = require("./reactive/types")
local v1 = nil
local v2 = nil
local Frozen = table.freeze({ __mode = "ks" })
local Applying = PropsModule.applying
local Inspecting = NodesModule.inspecting
local v3 = nil

local function inspector()
	-- upvalues: v3 (ref)
	local v4 = v3
	
	if v4 == nil then
		local InspectModule = require("./ownership/inspect")
		v3 = InspectModule
		
		return InspectModule
	else
		return v4
	end
end

local Tracked = NodesModule.tracked

local function _(p1)
	assert(type(p1) == "table")
	
	return p1
end

local function rollbackChildren(p1, p2, p3, p4)
	-- upvalues: DynamicModule (copy), NodesModule (copy), OwnerModule (copy)
	local EntriesResult = DynamicModule.entries(p2)
	local List = {}
	
	for i = #EntriesResult, 1, -1 do
		local EntriesResultEntry = EntriesResult[i]
		
		if (type(EntriesResultEntry) == "table" or type(EntriesResultEntry) == "userdata") and NodesModule.belongsTo(EntriesResultEntry, p4) then
			local Success, Result = pcall(p1, p3, EntriesResultEntry)
			
			if not Success then
				table.insert(List, Result)
			end
		end
	end
	OwnerModule.raiseAll(List)
end

return {
	createRuntime = function(Host)
		-- upvalues: ReactorModule (copy), OwnerModule (copy), HostModule (copy), ActiveModule (copy), DiagnosticsModule (copy), NodesModule (copy), PropsModule (copy), Tracked (copy), Frozen (copy), DynamicModule (copy), Applying (copy), ChildrenModule (copy), Inspecting (copy), v3 (ref), rollbackChildren (copy), Block (copy), v1 (ref), inspector (copy), v2 (ref), CodecModule (copy)
		local NewReactor = ReactorModule.create()
		local Owner = OwnerModule.createOwner(NewReactor)
		local Flag = false
		HostModule.validate(Host)
		local Tbl = Host
		local Frames = nil
		local v4 = nil
		local Copy = table.clone(Tbl)
		Copy.frames = nil
		setmetatable(Copy, {
			__index = function(_, p5)
				-- upvalues: Tbl (copy), Frames (ref), v4 (ref), NewReactor (copy)
				if p5 ~= "frames" then
					return nil
				end
				if Tbl.frames ~= Frames then
					Frames = Tbl.frames
					v4 = if Frames then require("./frames")(Frames, NewReactor) else nil
				end
				return v4
			end
		})
		local Copy1 = Copy
		local Render = Copy1.render
		
		local function requireOwner(CreateName)
			-- upvalues: ActiveModule (upval), DiagnosticsModule (upval)
			local CurrentResult = ActiveModule.current()
			
			return if CurrentResult == nil then DiagnosticsModule.raise("owner/no-active-owner", ("%s ran with no owner to register with"):format(CreateName), {
				contract = "nodes and bindings must belong to something that can release them",
				fix = "call it inside runtime.mount(component, target), or inside Compose.withOwner(owner, fn)"
			}) else CurrentResult
		end
		
		local function destroyOwnedNode(p5)
			-- upvalues: DiagnosticsModule (upval), NodesModule (upval), PropsModule (upval), Copy1 (ref), Tracked (upval), Render (copy)
			if type(p5) ~= "table" and type(p5) ~= "userdata" then
				return DiagnosticsModule.raise("host/node-not-a-reference", "owned node is not a reference", {})
			elseif not NodesModule.isDestructible(p5) then
				PropsModule.detach(Copy1, p5)
				
				return
			else
				PropsModule.forget(p5)
				
				if Tracked.dependents == 0 then
					Render.destroyNode(p5)
					NodesModule.forget(p5)
					
					return
				end
				local Success, Result = pcall(NodesModule.releaseDependents, p5)
				Render.destroyNode(p5)
				NodesModule.forget(p5)
				
				if not Success then
					error(Result, 0)
				end
			end
		end
		
		local Kinds = {}
		local t = {}
		setmetatable(Kinds, Frozen)
		setmetatable(t, Frozen)
		
		local function buildConstructor(Kind)
			-- upvalues: DiagnosticsModule (upval), DynamicModule (upval), NodesModule (upval), Tbl (copy), Applying (upval), PropsModule (upval), OwnerModule (upval), ChildrenModule (upval), Kinds (copy), Copy1 (ref), t (copy), ActiveModule (upval), requireOwner (copy), Render (copy), destroyOwnedNode (copy), Inspecting (upval), v3 (upval), rollbackChildren (upval)
			if type(Kind) == "string" then
				local CreateName: string = ("create(%q)"):format(Kind)
				
				local function applyBuild(p5, p6, p7, p8)
					-- upvalues: DynamicModule (upval), NodesModule (upval), Tbl (upval), Applying (upval), PropsModule (upval), OwnerModule (upval), ChildrenModule (upval), Kinds (upval), Copy1 (upval), DiagnosticsModule (upval), Kind (copy), t (upval)
					assert(type(p6) == "table")
					local EntriesResult = DynamicModule.entries(p6)
					
					if p5 ~= nil then
						NodesModule.label(p7, p5)
						local Naming = Tbl.naming
						
						if Naming ~= nil then
							Applying.key = "<name>"
							Naming.setName(p7, p5)
							Applying.key = nil
						end
					end
					PropsModule.apply(Tbl, p7, p6, p8, true)
					local CountEntriesResult = #EntriesResult
					
					if CountEntriesResult == 0 then return end
					Applying.key = nil
					local v5 = nil
					local AddSlotResult = 0
					local v6 = nil
					local Flag = false
					local ForeignLeavesResult = nil
					local Callback = nil
					
					for i = 1, CountEntriesResult do
						Callback = EntriesResult[i]
						
						if type(Callback) == "table" or type(Callback) == "userdata" then
							local MembershipResult = NodesModule.membership(Callback, p8)
							
							if MembershipResult == nil then
								if not Flag then
									Flag = true
									ForeignLeavesResult = NodesModule.foreignLeaves(EntriesResult, i, p8)
								end
								MembershipResult = ForeignLeavesResult == nil or ForeignLeavesResult[Callback] == nil
							end
							if not MembershipResult or not NodesModule.isDestructible(Callback) then
								local v7 = v6
								
								if v7 == nil then
									local t1 = {}
									v7 = t1
									v6 = t1
									NodesModule.protect(p7)
									OwnerModule.adopt(p8, function()
										-- upvalues: t1 (copy), Tbl (upval), p7 (copy), OwnerModule (upval)
										local List = {}
										
										for i = #t1, 1, -1 do
											local Success, Result = pcall(Tbl.render.removeChild, p7, t1[i])
											
											if not Success then
												table.insert(List, Result)
											end
										end
										OwnerModule.raiseAll(List)
									end)
								end
								table.insert(assert(v7), Callback)
							end
							if v5 == nil then
								Tbl.render.insertChild(p7, Callback, i)
							else
								if AddSlotResult == 0 then
									AddSlotResult = ChildrenModule.addSlot(v5)
								end
								ChildrenModule.insertStatic(v5, AddSlotResult, Callback)
							end
						else
							if type(Callback) ~= "function" or Kinds[Callback] ~= nil then
								return if Kinds[Callback] == nil then DiagnosticsModule.raise("mount/not-a-child", "a child is neither a node nor a directive", {
									expected = "a node, or a directive such as show(...) or keyed(...)",
									kind = Kind,
									index = i,
									actual = DiagnosticsModule.describe(Callback)
								}) else DiagnosticsModule.raise("mount/constructor-not-applied", "a child is a constructor that was never given props", {
									contract = "a constructor builds a node only once it is called with props",
									kind = Kind,
									index = i,
									childKind = Kinds[Callback],
									label = t[Callback],
									fix = if t[Callback] == nil then ("write %s {} -- an empty table is fine"):format(Kinds[Callback]) else ("write %s %q {} -- an empty table is fine"):format(Kinds[Callback], t[Callback])
								})
							end
							NodesModule.protect(p7)
							local V69 = v5 or ChildrenModule.createList(Copy1, p7, Tbl)
							
							if v5 == nil then
								if i > 1 then
									V69[1] = i - 1
									V69.total = i - 1
								end
								v5 = V69
							end
							AddSlotResult = 0
							Callback(ChildrenModule.mountPointFor(V69, (ChildrenModule.addSlot(V69))))
						end
					end
				end
				
				local function build(Label, p9)
					-- upvalues: DiagnosticsModule (upval), Kind (copy), ActiveModule (upval), requireOwner (upval), CreateName (copy), OwnerModule (upval), Render (upval), NodesModule (upval), destroyOwnedNode (upval), Inspecting (upval), v3 (upval), Applying (upval), applyBuild (copy), rollbackChildren (upval), Tbl (upval)
					if type(p9) ~= "table" then
						return DiagnosticsModule.raise("props/not-a-table", ("create(%q) expects a props table"):format(Kind), {
							expected = "a table of properties, with children in its array part",
							kind = Kind,
							label = Label,
							actual = DiagnosticsModule.describe(p9)
						})
					end
					local ResolveResult, ResolveResult2 = ActiveModule.resolve()
					local RequireOwnerResult = if ResolveResult == nil then requireOwner(CreateName) else ResolveResult
					local Head = RequireOwnerResult.head
					local HeldCountResult = OwnerModule.heldCount(RequireOwnerResult)
					local Node = Render.createNode(Kind)
					local NodeToken = RequireOwnerResult.nodeToken or NodesModule.ownerToken()
					RequireOwnerResult.nodeToken = NodeToken
					NodesModule.markOwned(Node, NodeToken)
					OwnerModule.holdSubject(RequireOwnerResult, destroyOwnedNode, Node)
					
					if Inspecting.active then
						local v8 = v3
						local v9 = nil
						
						if v8 == nil then
							local InspectModule = require("./ownership/inspect")
							v3 = InspectModule
							v9 = InspectModule
						else
							v9 = v8
						end
						v9.node(RequireOwnerResult, Node, "owned")
						NodesModule.chargeToOwner(RequireOwnerResult, Node, "owned")
					end
					local Key = Applying.key
					Applying.key = nil
					local PushResult = if ResolveResult2 then nil else ActiveModule.push(RequireOwnerResult)
					local Success, Result = pcall(applyBuild, Label, p9, Node, RequireOwnerResult)
					
					if PushResult ~= nil then
						ActiveModule.pop(RequireOwnerResult, PushResult)
					end
					if not Success then
						local Success1, Result1 = pcall(rollbackChildren, Tbl.render.removeChild, p9, Node, RequireOwnerResult)
						OwnerModule.rollbackTo(RequireOwnerResult, Head)
						OwnerModule.rollbackHeld(RequireOwnerResult, HeldCountResult)
						local Key1 = Applying.key
						Applying.key = Key
						
						if not Success1 then
							OwnerModule.raiseAll({ Result, Result1 })
						end
						if Key1 ~= nil then
							error(("%s\n  while applying: %s.%s"):format(tostring(Result), Kind, (tostring(Key1))), 0)
						end
						error(Result, 0)
					end
					Applying.key = Key
					
					return Node
				end
				
				local function constructor(Label, Label1)
					-- upvalues: build (copy), Kinds (upval), Kind (copy), t (upval)
					if type(Label) == "string" then
						local function labelled(p9)
							-- upvalues: build (upval), Label (copy)
							return build(Label, p9)
						end
						
						Kinds[labelled] = Kind
						t[labelled] = Label
						
						return labelled
					else
						return build(Label1, Label)
					end
				end
				
				Kinds[constructor] = Kind
				
				return constructor
			else
				return DiagnosticsModule.raise("mount/kind-not-a-string", "create expects a node kind", {
					expected = "a string the host understands, e.g. \"Frame\"",
					actual = DiagnosticsModule.describe(Kind)
				})
			end
		end
		
		local Constructors = {}
		setmetatable(Constructors, {
			__index = function(p5, Kind)
				-- upvalues: buildConstructor (copy)
				local Constructor = buildConstructor(Kind)
				rawset(p5, Kind, Constructor)
				
				return Constructor
			end
		})
		
		local function refuseAfterDispose(p5, Component)
			-- upvalues: Flag (ref), DiagnosticsModule (upval)
			if not Flag then return end
			return DiagnosticsModule.raise("runtime/disposed", ("%s ran after runtime:dispose()"):format(p5), {
				contract = "a disposed runtime starts no new work",
				fix = "create a new runtime, or mount before disposing this one",
				component = Component
			})
		end
		
		local function releaseInOrder(p5, p6)
			local Success, Result = pcall(p5)
			local Success1, Result1 = pcall(p6)
			
			if not Success then
				error(Result, 0)
			end
			if not Success1 then
				error(Result1, 0)
			end
		end
		
		local function claimTarget(p5)
			-- upvalues: NodesModule (upval)
			if not NodesModule.isDestructible(p5) then
				NodesModule.markBorrowed(p5)
			end
		end
		
		local function orderAgainstTarget(p5, p6)
			-- upvalues: NodesModule (upval)
			if NodesModule.isDestructible(p5) then
				local AttachDependentResult = NodesModule.attachDependent(p5, p6)
				
				return function()
					-- upvalues: AttachDependentResult (copy), p6 (copy)
					AttachDependentResult()
					p6()
				end
			else
				return p6
			end
		end
		
		local function mountInto(p5, p6, Component)
			-- upvalues: DiagnosticsModule (upval), Flag (ref), NodesModule (upval), ActiveModule (upval), OwnerModule (upval), NewReactor (copy), Inspecting (upval), v3 (upval), ChildrenModule (upval), Copy1 (ref), Block (upval)
			if type(p6) ~= "table" and type(p6) ~= "userdata" then
				return DiagnosticsModule.raise("mount/target-not-a-node", "mount expects a host node to mount into", {
					expected = "a node belonging to the host this runtime renders to",
					component = Component,
					actual = DiagnosticsModule.describe(p6)
				})
			end
			if Flag then
				local _ = DiagnosticsModule.raise("runtime/disposed", ("%s ran after runtime:dispose()"):format("mount"), {
					contract = "a disposed runtime starts no new work",
					fix = "create a new runtime, or mount before disposing this one",
					component = Component
				})
			end
			if not NodesModule.isDestructible(p6) then
				NodesModule.markBorrowed(p6)
			end
			local CurrentResult = ActiveModule.current()
			local NoCurrentResult = CurrentResult == nil
			local CurrentResult1 = CurrentResult or OwnerModule.createOwner(NewReactor)
			
			if NoCurrentResult and Inspecting.active then
				local v5 = v3
				local v6 = nil
				
				if v5 == nil then
					local InspectModule = require("./ownership/inspect")
					v3 = InspectModule
					v6 = InspectModule
				else
					v6 = v5
				end
				v6.mount(CurrentResult1)
				local v7 = v3
				local v8 = nil
				
				if v7 == nil then
					local InspectModule = require("./ownership/inspect")
					v3 = InspectModule
					v8 = InspectModule
				else
					v8 = v7
				end
				v8.label(CurrentResult1, Component)
			end
			local Success, Result = pcall(Block.mountBlock, ChildrenModule.wholeOf(Copy1, p6), CurrentResult1, p5, Component, nil, false)
			
			if not Success then
				if NoCurrentResult then
					OwnerModule.dispose(CurrentResult1)
				end
				error(Result, 0)
			end
			if not NoCurrentResult then
				return OwnerModule.disposer(Result.owner), Result.nodes
			end
			local HoldRootResult = OwnerModule.holdRoot(function()
				-- upvalues: OwnerModule (upval), Result (copy), CurrentResult1 (copy)
				local DisposerResult = OwnerModule.disposer(CurrentResult1)
				local Success, Result1 = pcall((OwnerModule.disposer(Result.owner)))
				local Success1, Result2 = pcall(DisposerResult)
				
				if not Success then
					error(Result1, 0)
				end
				if not Success1 then
					error(Result2, 0)
				end
			end)
			
			if NodesModule.isDestructible(p6) then
				local AttachDependentResult = NodesModule.attachDependent(p6, HoldRootResult)
				
				local function HoldRootResult1()
					-- upvalues: AttachDependentResult (copy), HoldRootResult (copy)
					AttachDependentResult()
					HoldRootResult()
				end
			else
				local HoldRootResult1: () -> () = HoldRootResult
			end
			return HoldRootResult1, Result.nodes
		end
		
		local v5 = nil
		local v6 = nil
		
		local function _()
			-- upvalues: v6 (ref), CodecModule (upval), v2 (upval), Copy1 (ref), requireOwner (copy)
			local v7 = v6
			
			if v7 == nil then
				local V14 = v2 or require("./animation/motion")
				v2 = V14
				local Motion = V14.createMotion(Copy1, requireOwner, CodecModule.number)
				v6 = Motion
				
				return Motion
			else
				return v7
			end
		end
		
		local v7 = nil
		
		local function timeline(p5)
			-- upvalues: v7 (ref), Copy1 (ref), requireOwner (copy)
			local Callback = v7
			
			if Callback == nil then
				local TimelineFunction = require("./animation/timeline").createTimelines(Copy1, requireOwner).timeline
				v7 = TimelineFunction
				
				return TimelineFunction(p5)
			else
				return Callback(p5)
			end
		end
		
		local v8 = nil
		local v9 = nil
		local v10 = nil
		local v11 = nil
		local v12 = nil
		
		return {
			host = Tbl,
			reactor = NewReactor,
			watch = function(_, p5, p6)
				-- upvalues: ActiveModule (upval), Owner (copy), OwnerModule (upval)
				return OwnerModule.watch(ActiveModule.current() or Owner, p5, p6)
			end,
			batch = ReactorModule.batchMethod(NewReactor),
			settle = function(_)
				-- upvalues: ReactorModule (upval), NewReactor (copy)
				ReactorModule.settle(NewReactor)
			end,
			pending = function(_)
				-- upvalues: ReactorModule (upval), NewReactor (copy)
				return ReactorModule.pending(NewReactor)
			end,
			dispose = function(_)
				-- upvalues: Flag (ref), OwnerModule (upval), Owner (copy)
				Flag = true
				OwnerModule.dispose(Owner)
			end,
			connect = function(p5, RequireOwner, p6)
				-- upvalues: v1 (upval), Copy1 (ref), requireOwner (copy)
				local V13 = v1 or require("@self/extensions")
				v1 = V13
				
				return V13.connect(Copy1, requireOwner, p5, RequireOwner, p6)
			end,
			create = function(p5)
				-- upvalues: Constructors (copy)
				return Constructors[p5]
			end,
			constructors = Constructors,
			decorate = function(Host, RequireOwner)
				-- upvalues: v1 (upval), Tbl (copy), requireOwner (copy)
				local V13 = v1 or require("@self/extensions")
				v1 = V13
				
				return V13.decorate(Tbl, requireOwner, Host, RequireOwner)
			end,
			mount = function(Callback, p5)
				-- upvalues: ActiveModule (upval), Flag (ref), Inspecting (upval), NodesModule (upval), Block (upval), Copy1 (ref), OwnerModule (upval), mountInto (copy)
				local CurrentResult = ActiveModule.current()
				
				if CurrentResult == nil or Flag or Inspecting.active or type(p5) ~= "table" and type(p5) ~= "userdata" then
					local MountIntoResult, MountIntoResult2 = mountInto(function()
						-- upvalues: Callback (copy)
						return { Callback() }
					end, p5, (Block.nameOf(Callback)))
					
					return MountIntoResult, MountIntoResult2[1]
				end
				if not NodesModule.isDestructible(p5) then
					NodesModule.markBorrowed(p5)
				end
				local MountSingleResult, MountSingleResult2 = Block.mountSingle(Copy1, p5, CurrentResult, Callback)
				
				return OwnerModule.disposer(MountSingleResult), MountSingleResult2
			end,
			mountFragment = function(p5, p6)
				-- upvalues: v5 (ref), v1 (upval), Copy1 (ref), NewReactor (copy), Kinds (copy), t (copy), refuseAfterDispose (copy), claimTarget (copy), releaseInOrder (copy), orderAgainstTarget (copy), inspector (upval)
				local Callback = v5
				
				if Callback == nil then
					local V13 = v1 or require("@self/extensions")
					v1 = V13
					local FragmentMount = V13.createFragmentMount(Copy1, NewReactor, Kinds, t, refuseAfterDispose, claimTarget, releaseInOrder, orderAgainstTarget, inspector)
					v5 = FragmentMount
					
					return FragmentMount(p5, p6)
				else
					return Callback(p5, p6)
				end
			end,
			adopt = function(p5)
				-- upvalues: v1 (upval), Copy1 (ref), requireOwner (copy), destroyOwnedNode (copy), inspector (upval)
				local V13 = v1 or require("@self/extensions")
				v1 = V13
				
				return V13.adopt(Copy1, requireOwner, destroyOwnedNode, inspector, p5)
			end,
			borrow = function(Inspector)
				-- upvalues: v1 (upval), inspector (upval)
				local V13 = v1 or require("@self/extensions")
				v1 = V13
				
				return V13.borrow(inspector, Inspector)
			end,
			motion = function(p5)
				-- upvalues: v2 (upval), Copy1 (ref), requireOwner (copy)
				local V14 = v2 or require("./animation/motion")
				v2 = V14
				
				return V14.createMotion(Copy1, requireOwner, p5)
			end,
			spring = function(p5, p6)
				-- upvalues: v6 (ref), CodecModule (upval), v2 (upval), Copy1 (ref), requireOwner (copy)
				local v13 = v6
				local v14 = nil
				
				if v13 == nil then
					local V14 = v2 or require("./animation/motion")
					v2 = V14
					local Motion = V14.createMotion(Copy1, requireOwner, CodecModule.number)
					v6 = Motion
					v14 = Motion
				else
					v14 = v13
				end
				return v14.spring(p5, p6)
			end,
			tween = function(p5, p6)
				-- upvalues: v6 (ref), CodecModule (upval), v2 (upval), Copy1 (ref), requireOwner (copy)
				local v13 = v6
				local v14 = nil
				
				if v13 == nil then
					local V14 = v2 or require("./animation/motion")
					v2 = V14
					local Motion = V14.createMotion(Copy1, requireOwner, CodecModule.number)
					v6 = Motion
					v14 = Motion
				else
					v14 = v13
				end
				return v14.tween(p5, p6)
			end,
			running = function(p5)
				-- upvalues: v6 (ref), CodecModule (upval), v2 (upval), Copy1 (ref), requireOwner (copy)
				local v13 = v6
				local v14 = nil
				
				if v13 == nil then
					local V14 = v2 or require("./animation/motion")
					v2 = V14
					local Motion = V14.createMotion(Copy1, requireOwner, CodecModule.number)
					v6 = Motion
					v14 = Motion
				else
					v14 = v13
				end
				return v14.running(p5)
			end,
			timeline = timeline,
			ramp = function(p5, p6)
				-- upvalues: v6 (ref), CodecModule (upval), v2 (upval), Copy1 (ref), requireOwner (copy)
				local v13 = v6
				local v14 = nil
				
				if v13 == nil then
					local V14 = v2 or require("./animation/motion")
					v2 = V14
					local Motion = V14.createMotion(Copy1, requireOwner, CodecModule.number)
					v6 = Motion
					v14 = Motion
				else
					v14 = v13
				end
				return v14.ramp(p5, p6)
			end,
			scheduler = function(p5)
				-- upvalues: v8 (ref), Copy1 (ref), requireOwner (copy)
				local Callback = v8
				
				if Callback == nil then
					local Schedulers = require("./scheduler").createSchedulers(Copy1, requireOwner)
					v8 = Schedulers
					
					return Schedulers(p5)
				else
					return Callback(p5)
				end
			end,
			observe = function(p5, p6, p7)
				-- upvalues: v9 (ref), Copy1 (ref), requireOwner (copy), NewReactor (copy)
				local Callback = v9
				
				if Callback == nil then
					local Callback1 = require("@self/observe")(Copy1, requireOwner, NewReactor)
					v9 = Callback1
					
					return Callback1(p5, p6, p7)
				else
					return Callback(p5, p6, p7)
				end
			end,
			settled = function(p5)
				-- upvalues: v10 (ref), Copy1 (ref), requireOwner (copy)
				local Callback1 = v10
				
				if Callback1 == nil then
					local Callback = require("@self/settled")(Copy1, requireOwner)
					v10 = Callback
					
					return Callback(p5)
				else
					return Callback1(p5)
				end
			end,
			clock = function(p5)
				-- upvalues: v11 (ref), Copy1 (ref), requireOwner (copy)
				local Callback1 = v11
				
				if Callback1 == nil then
					local Callback = require("@self/clock")(Copy1, requireOwner)
					v11 = Callback
					
					return Callback(p5)
				else
					return Callback1(p5)
				end
			end,
			sequence = function(p5)
				-- upvalues: v12 (ref), timeline (copy), requireOwner (copy)
				local Callback1 = v12
				
				if Callback1 == nil then
					local Callback = require("@self/sequence")(timeline, requireOwner)
					v12 = Callback
					
					return Callback(p5)
				else
					return Callback1(p5)
				end
			end
		}
	end
}