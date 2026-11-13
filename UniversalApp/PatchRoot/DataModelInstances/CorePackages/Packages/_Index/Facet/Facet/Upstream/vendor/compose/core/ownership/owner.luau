--!native

local _ = require("../reactive/types")
local ReactorModule = require("../reactive/reactor")
local WatchModule = require("../reactive/watch")
local GraphModule = require("../reactive/graph")
local DynamicModule = require("../dynamic")
local _ = require("./types")
local Inspecting = require("./nodes").inspecting
local v1 = nil

local function _()
	-- upvalues: v1 (ref)
	local V7 = v1 or require("./inspect")
	v1 = V7
	
	return V7
end

local function v9()
	return nil
end

local v2 = nil
local ReleaseHeld = WatchModule.releaseHeld

local function noop() end

local function raiseAll(Entry)
	local CountEntry = #Entry
	
	if CountEntry == 0 then return end
	if CountEntry == 1 then
		error(Entry[1], 0)
	end
	local List = {
		("Compose: %d errors while disposing an owner:"):format(CountEntry)
	}
	
	for i, value in Entry do
		table.insert(List, ("  [%d] %s"):format(i, (tostring(value))))
	end
	error(table.concat(List, "\n"), 0)
end

local Callback = nil

local function reactorOf(Parent)
	-- upvalues: v2 (ref), ReactorModule (copy)
	local Parent1 = Parent
	local Reactor = nil
	while Parent1 ~= nil do
		Reactor = Parent1.reactor
		
		if Reactor ~= nil then
			return Reactor
		end
		Parent1 = Parent1.parent
	end
	local V10 = v2 or ReactorModule.create()
	v2 = V10
	
	return V10
end

local function isOwner(p1): boolean
	-- upvalues: DynamicModule (copy)
	return type(p1) == "table" and (DynamicModule.read(p1, "release") == nil and DynamicModule.read(p1, 1) == nil and (DynamicModule.read(p1, "reactor") ~= nil or DynamicModule.read(p1, "parent") ~= nil or DynamicModule.read(p1, "disposed") ~= nil))
end

local _ = function(p1): number
	return if p1.batchRelease == nil then #p1 // 2 else #p1
end

local Count = 0

local function releaseSingles(p1, Callback: (any) -> (), p2)
	-- upvalues: Count (ref)
	local Count1: number = Count
	while p2 < Count1 do
		local v3 = p1[Count1]
		p1[Count1] = nil
		Count1 -= 1
		Count = Count1
		Callback(v3)
	end
end

local function releasePairs(p3, p4: number)
	-- upvalues: Count (ref)
	local Count1: number = Count
	local v4 = p4 * 2 + 1
	while v4 <= Count1 do
		local Callback: (any) -> () = p3[Count1]
		local v5 = p3[Count1 + 1]
		p3[Count1] = nil
		p3[Count1 + 1] = nil
		Count1 -= 2
		Count = Count1
		
		if type(Callback) == "function" then
			Callback(v5)
		end
	end
end

local function releaseBatch(Head, p5, List)
	-- upvalues: Count (ref), releaseSingles (copy), releasePairs (copy)
	local Count1: number = Count
	local BatchRelease = Head.batchRelease
	
	if BatchRelease == nil then
		Count = #Head - 1
		while true do
			local Success1, Result1 = pcall(releasePairs, Head, p5)
			if Success1 then break end
			table.insert(List, Result1)
		end
		Count = Count1
		
		return
	else
		Count = #Head
		while true do
			local Success, Result = pcall(releaseSingles, Head, BatchRelease, p5)
			if Success then break end
			table.insert(List, Result)
		end
		Count = Count1
		
		if p5 == 0 then
			Head.batchRelease = nil
		end
	end
end

local function releaseEntry(Entry, List)
	-- upvalues: releaseBatch (copy), Callback (ref)
	local ReleaseFunction: () -> () = Entry.release
	
	if ReleaseFunction ~= nil then
		Entry.release = nil
		local After = Entry.after
		
		if After == nil then
			ReleaseFunction()
			
			return
		end
		Entry.after = nil
		local Success, Result = pcall(ReleaseFunction)
		
		if not Success then
			table.insert(List, Result)
		end
		local Success1, Result1 = pcall(After)
		
		if not Success1 then
			table.insert(List, Result1)
		end
		return
	elseif Entry[1] == nil then
		Callback(Entry)
		
		return
	else
		releaseBatch(Entry, 0, List)
	end
end

local _ = function(p6, Head)
	local Previous = Head.previous
	local Following = Head.following
	
	if Previous == nil then
		p6.head = Following
	else
		Previous.following = Following
	end
	if Following ~= nil then
		Following.previous = Previous
	end
	Head.previous = nil
	Head.following = nil
end

local _ = function(p6, Head)
	local Head1 = p6.head
	Head.following = Head1
	
	if Head1 ~= nil then
		Head1.previous = Head
	end
	p6.head = Head
end

local _ = function(p6, Release, After)
	local Head = { release = Release }
	
	if After ~= nil then
		Head.after = After
	end
	local Head1 = p6.head
	Head.following = Head1
	
	if Head1 ~= nil then
		Head1.previous = Head
	end
	p6.head = Head
	
	return Head
end

local function installCurrentOwner(p6)
	-- upvalues: v9 (ref)
	v9 = p6
end

local function runScopeOf(p6)
	return if p6.inherited == nil then nil else p6
end

local function createOwner(p6, p7)
	-- upvalues: v9 (ref), ReactorModule (copy)
	return {
		parent = p7 or v9(),
		reactor = p6 or ReactorModule.create()
	}
end

local function own(p6, Callback: () -> (), Callback1: () -> ())
	-- upvalues: noop (copy), releaseEntry (copy), raiseAll (copy)
	if p6.disposed then
		Callback()
		
		if Callback1 ~= nil then
			Callback1()
		end
		return noop
	else
		local Head = { release = Callback }
		
		if Callback1 ~= nil then
			Head.after = Callback1
		end
		local Head1 = p6.head
		Head.following = Head1
		
		if Head1 ~= nil then
			Head1.previous = Head
		end
		p6.head = Head
		
		return function()
			-- upvalues: p6 (copy), Head (copy), releaseEntry (upval), raiseAll (upval)
			if p6.disposed or Head.release == nil then return end
			local Previous = Head.previous
			local Following = Head.following
			
			if Previous == nil then
				p6.head = Following
			else
				Previous.following = Following
			end
			if Following ~= nil then
				Following.previous = Previous
			end
			Head.previous = nil
			Head.following = nil
			
			if Head.after ~= nil then
				local t = {}
				releaseEntry(Head, t)
				raiseAll(t)
				
				return
			end
			local ReleaseFunction: () -> () = Head.release
			Head.release = nil
			
			if ReleaseFunction ~= nil then
				ReleaseFunction()
			end
		end
	end
end

local function holdSubject(Parent, Callback: (any) -> (), p6)
	if Parent.disposed then
		Callback(p6)
		
		return
	end
	local Head = Parent.head
	
	if Head == nil or Head[1] == nil then
		local Head1 = Parent.head
		local Head2 = { p6, batchRelease = Callback, following = Head1 }
		
		if Head1 ~= nil then
			Head1.previous = Head2
		end
		Parent.head = Head2
		
		return
	else
		local BatchRelease = Head.batchRelease
		
		if BatchRelease == Callback then
			Head[#Head + 1] = p6
			
			return
		end
		if BatchRelease ~= nil then
			for i = #Head, 1, -1 do
				Head[i * 2] = Head[i]
				Head[i * 2 - 1] = BatchRelease
			end
			Head.batchRelease = nil
		end
		local CountHead = #Head
		Head[CountHead + 1] = Callback
		Head[CountHead + 2] = p6
	end
end

local function heldCount(p7): number
	local Head = p7.head
	
	return if Head == nil then 0 elseif Head.batchRelease == nil then #Head // 2 else #Head
end

local function rollbackHeld(p7, p8)
	-- upvalues: releaseBatch (copy), raiseAll (copy)
	local Head = p7.head
	
	if Head == nil then return end
	if (if Head.batchRelease == nil then #Head // 2 else #Head) > p8 then
		local t = {}
		releaseBatch(Head, p8, t)
		raiseAll(t)
		
		return
	end
end

local function adopt(p7, Callback: () -> ())
	if p7.disposed then
		Callback()
		
		return
	end
	local Head = p7.head
	local Head1 = { release = Callback, following = Head }
	
	if Head ~= nil then
		Head.previous = Head1
	end
	p7.head = Head1
end

local function checkpoint(p7)
	return p7.head
end

local function rollbackTo(p7, Head)
	-- upvalues: releaseEntry (copy), raiseAll (copy)
	local List = {}
	local Head1 = p7.head
	
	local function releaseRest()
		-- upvalues: Head1 (ref), Head (copy), p7 (copy), releaseEntry (upval), List (copy)
		while true do
			local Head2 = Head1
			if Head2 == nil or Head2 == Head then break end
			Head1 = Head2.following
			local v6 = p7
			local Previous = Head2.previous
			local Following = Head2.following
			
			if Previous == nil then
				v6.head = Following
			else
				Previous.following = Following
			end
			if Following ~= nil then
				Following.previous = Previous
			end
			Head2.previous = nil
			Head2.following = nil
			releaseEntry(Head2, List)
		end
	end
	while Head1 ~= nil and Head1 ~= Head do
		local Success, Result = pcall(releaseRest)
		
		if not Success then
			table.insert(List, Result)
		end
	end
	raiseAll(List)
end

local _ = function(Head)
	Head.disposed = true
	local Parent = Head.parent
	
	if Parent ~= nil and not Parent.disposed and (Head.previous ~= nil or Parent.head == Head) then
		local Previous = Head.previous
		local Following = Head.following
		
		if Previous == nil then
			Parent.head = Following
		else
			Previous.following = Following
		end
		if Following ~= nil then
			Following.previous = Previous
		end
		Head.previous = nil
		Head.following = nil
	end
	Head.parent = nil
	Head.head = nil
	
	return Head.head
end

local function releaseTree(Followings, p8, List)
	-- upvalues: releaseEntry (copy), raiseAll (copy)
	while #p8 > 0 do
		local CountP32 = #p8
		local Following = Followings[CountP32]
		
		if Following == nil then
			local v7: number = p8[CountP32]
			
			if CountP32 > 1 and #List - v7 > 1 then
				local List1 = {}
				
				for i = v7 + 1, #List do
					table.insert(List1, List[i])
					List[i] = nil
				end
				local Success, Result = pcall(raiseAll, List1)
				
				if not Success then
					table.insert(List, Result)
				end
			end
			p8[CountP32] = nil
			Followings[CountP32] = nil
		else
			Followings[CountP32] = Following.following
			Following.previous = nil
			Following.following = nil
			
			if Following.release == nil and Following[1] == nil then
				if Following.disposed then continue end
				p8[CountP32 + 1] = #List
				local NewCountP = CountP32 + 1
				Following.disposed = true
				local Parent = Following.parent
				
				if Parent ~= nil and not Parent.disposed and (Following.previous ~= nil or Parent.head == Following) then
					local Previous = Following.previous
					local Following1 = Following.following
					
					if Previous == nil then
						Parent.head = Following1
					else
						Previous.following = Following1
					end
					if Following1 ~= nil then
						Following1.previous = Previous
					end
					Following.previous = nil
					Following.following = nil
				end
				Following.parent = nil
				Following.head = nil
				Followings[NewCountP] = Following.head
			else
				releaseEntry(Following, List)
			end
		end
	end
end

Callback = function(Head)
	-- upvalues: releaseBatch (copy), releaseTree (copy), raiseAll (copy)
	if Head.disposed then return end
	Head.disposed = true
	local Parent = Head.parent
	
	if Parent ~= nil and not Parent.disposed and (Head.previous ~= nil or Parent.head == Head) then
		local Previous = Head.previous
		local Following = Head.following
		
		if Previous == nil then
			Parent.head = Following
		else
			Previous.following = Following
		end
		if Following ~= nil then
			Following.previous = Previous
		end
		Head.previous = nil
		Head.following = nil
	end
	Head.parent = nil
	local Head1 = Head.head
	Head.head = nil
	
	if Head1 == nil then return end
	local List = {}
	
	if Head1.following == nil and Head1[1] ~= nil then
		releaseBatch(Head1, 0, List)
	else
		local list = { Head1 }
		local list1 = { 0 }
		repeat
			local Success, Result = pcall(releaseTree, list, list1, List)
			if not Success then
				table.insert(List, Result)
			end
		until #list1 == 0
	end
	raiseAll(List)
end

local function isDisposed(p9): boolean
	return p9.disposed == true
end

local function size(p9): number
	local Total = 0
	local Head = p9.head
	while Head ~= nil do
		local CountHead: number = if Head.batchRelease == nil then #Head // 2 else #Head
		Total += if CountHead > 0 then CountHead else 1
		Head = Head.following
	end
	return Total
end

local function guardWith(p10, Boundary)
	p10.boundary = Boundary
end

local function createChild(Parent)
	-- upvalues: Callback (ref), Inspecting (copy), v1 (ref)
	local Head = { parent = Parent }
	
	if Parent.disposed then
		Callback(Head)
	else
		local Head1 = Parent.head
		Head.following = Head1
		
		if Head1 ~= nil then
			Head1.previous = Head
		end
		Parent.head = Head
	end
	if Inspecting.active then
		local V7 = v1 or require("./inspect")
		v1 = V7
		V7.child(Parent, Head)
	end
	local Boundary = Parent.boundary
	
	if Boundary ~= nil then
		Head.boundary = Boundary
	end
	return Head
end

local function startWatch(Parent, Callback, p10, p11, Callback1: () -> ())
	-- upvalues: v2 (ref), ReactorModule (copy), noop (copy), releaseEntry (copy), raiseAll (copy)
	if Callback1 == nil then
		local Parent1 = Parent
		local Reactor = nil
		local V = nil
		while Parent1 ~= nil do
			Reactor = Parent1.reactor
			
			if Reactor == nil then
				Parent1 = Parent1.parent
				continue
			end
			V = Reactor
			local CallbackResult, CallbackResult2 = Callback(V, p10, p11)
			
			if Parent.disposed then
				CallbackResult()
				
				if CallbackResult2 ~= nil then
					CallbackResult2()
				end
				return noop
			else
				local Head = { release = CallbackResult }
				
				if CallbackResult2 ~= nil then
					Head.after = CallbackResult2
				end
				local Head1 = Parent.head
				Head.following = Head1
				
				if Head1 ~= nil then
					Head1.previous = Head
				end
				Parent.head = Head
				
				return function()
					-- upvalues: Parent (copy), Head (copy), releaseEntry (upval), raiseAll (upval)
					if Parent.disposed or Head.release == nil then return end
					local Previous = Head.previous
					local Following = Head.following
					
					if Previous == nil then
						Parent.head = Following
					else
						Previous.following = Following
					end
					if Following ~= nil then
						Following.previous = Previous
					end
					Head.previous = nil
					Head.following = nil
					
					if Head.after ~= nil then
						local t = {}
						releaseEntry(Head, t)
						raiseAll(t)
						
						return
					end
					local ReleaseFunction: () -> () = Head.release
					Head.release = nil
					
					if ReleaseFunction ~= nil then
						ReleaseFunction()
					end
				end
			end
		end
		local V10 = v2 or ReactorModule.create()
		v2 = V10
		V = V10
	else
		local Parent2 = Parent
		local Reactor = nil
		local V = nil
		while Parent2 ~= nil do
			Reactor = Parent2.reactor
			
			if Reactor == nil then
				Parent2 = Parent2.parent
				continue
			end
			V = Reactor
			local Success, Result = pcall(Callback, V, p10, p11)
			
			if not Success then
				Callback1()
				error(Result, 0)
			end
			if Parent.disposed then
				Result()
				
				if Callback1 ~= nil then
					Callback1()
				end
				return noop
			else
				local Head2 = { release = Result }
				
				if Callback1 ~= nil then
					Head2.after = Callback1
				end
				local Head3 = Parent.head
				Head2.following = Head3
				
				if Head3 ~= nil then
					Head3.previous = Head2
				end
				Parent.head = Head2
				
				return function()
					-- upvalues: Parent (copy), Head2 (copy), releaseEntry (upval), raiseAll (upval)
					if Parent.disposed or Head2.release == nil then return end
					local Previous = Head2.previous
					local Following = Head2.following
					
					if Previous == nil then
						Parent.head = Following
					else
						Previous.following = Following
					end
					if Following ~= nil then
						Following.previous = Previous
					end
					Head2.previous = nil
					Head2.following = nil
					
					if Head2.after ~= nil then
						local t = {}
						releaseEntry(Head2, t)
						raiseAll(t)
						
						return
					end
					local ReleaseFunction: () -> () = Head2.release
					Head2.release = nil
					
					if ReleaseFunction ~= nil then
						ReleaseFunction()
					end
				end
			end
		end
		local V10 = v2 or ReactorModule.create()
		v2 = V10
		V = V10
	end
end

local _ = function(p12, p13)
	return if p12 == nil then p13 else function(p14)
		-- upvalues: p13 (copy), p12 (copy)
		local Success, Result = pcall(p13, p14)
		
		if not Success then
			p12.report(Result)
		end
	end
end

local function watchStatic(Parent, p12, Callback, After)
	-- upvalues: Inspecting (copy), v1 (ref), startWatch (copy), WatchModule (copy)
	if Inspecting.active then
		local V7 = v1 or require("./inspect")
		v1 = V7
		V7.watch(Parent)
	end
	local Boundary = Parent.boundary
	
	if Boundary == nil then
		return (startWatch(Parent, WatchModule.watchStatic, p12, Callback, After))
	else
		local function v152(Callback1)
			-- upvalues: Callback (copy), p12 (copy)
			Callback(Callback1(p12))
		end
		
		return (startWatch(Parent, WatchModule.watchGuarded, if Boundary == nil then v152 else function(p13)
			-- upvalues: v152 (copy), Boundary (copy)
			local Success, Result = pcall(v152, p13)
			
			if not Success then
				Boundary.report(Result)
			end
		end, nil, After))
	end
end

local function listenHeld(Parent, p12, p13, p14, p15, p16, p17)
	-- upvalues: Inspecting (copy), v1 (ref), GraphModule (copy), v2 (ref), ReactorModule (copy), holdSubject (copy), ReleaseHeld (copy)
	if Inspecting.active then
		local V7 = v1 or require("./inspect")
		v1 = V7
		V7.watch(Parent)
	end
	local ListenEdgeFunction = GraphModule.listenEdge
	local Parent1 = Parent
	local Reactor = nil
	local V = nil
	while Parent1 ~= nil do
		Reactor = Parent1.reactor
		
		if Reactor == nil then
			Parent1 = Parent1.parent
			continue
		end
		V = Reactor
		local ListenEdgeResult = ListenEdgeFunction(V, p12, p13, p14, p15, p16, p17)
		holdSubject(Parent, ReleaseHeld, ListenEdgeResult)
		
		return ListenEdgeResult
	end
	local V10 = v2 or ReactorModule.create()
	v2 = V10
	V = V10
end

local function effectHeld(Parent, p18)
	-- upvalues: Inspecting (copy), v1 (ref), WatchModule (copy), v2 (ref), ReactorModule (copy), holdSubject (copy), ReleaseHeld (copy)
	if Inspecting.active then
		local V7 = v1 or require("./inspect")
		v1 = V7
		V7.watch(Parent)
	end
	local Boundary = Parent.boundary
	local v8 = if Boundary == nil then p18 else function(p19)
		-- upvalues: p18 (copy), Boundary (copy)
		local Success, Result = pcall(p18, p19)
		
		if not Success then
			Boundary.report(Result)
		end
	end
	local TerminalNodeFunction = WatchModule.terminalNode
	local Parent1 = Parent
	local Reactor = nil
	local V = nil
	while Parent1 ~= nil do
		Reactor = Parent1.reactor
		
		if Reactor == nil then
			Parent1 = Parent1.parent
			continue
		end
		V = Reactor
		local TerminalNodeResult = TerminalNodeFunction(V, v8, Boundary ~= nil)
		
		if TerminalNodeResult.effect == nil then
			return nil
		else
			holdSubject(Parent, ReleaseHeld, TerminalNodeResult)
			
			return TerminalNodeResult
		end
	end
	local V10 = v2 or ReactorModule.create()
	v2 = V10
	V = V10
end

local function watchTerminal(Parent, p19, After)
	-- upvalues: Inspecting (copy), v1 (ref), startWatch (copy), WatchModule (copy)
	if Inspecting.active then
		local V7 = v1 or require("./inspect")
		v1 = V7
		V7.watch(Parent)
	end
	local Boundary = Parent.boundary
	
	return (startWatch(Parent, WatchModule.watchTerminal, if Boundary == nil then p19 else function(p20)
		-- upvalues: p19 (copy), Boundary (copy)
		local Success, Result = pcall(p19, p20)
		
		if not Success then
			Boundary.report(Result)
		end
	end, nil, After))
end

local function releaseScope(p19)
	-- upvalues: Callback (ref)
	local Child = p19.child
	
	if Child ~= nil then
		p19.child = nil
		Callback(Child)
	end
end

WatchModule.installScope(releaseScope, releaseScope)

local function watch(Parent, p19, p20, Callback: () -> ())
	-- upvalues: Inspecting (copy), v1 (ref), WatchModule (copy), v2 (ref), ReactorModule (copy), noop (copy), releaseEntry (copy), raiseAll (copy)
	if Inspecting.active then
		local V7 = v1 or require("./inspect")
		v1 = V7
		V7.watch(Parent)
	end
	local Boundary = Parent.boundary
	local v9 = if Boundary == nil then p19 else function(p21)
		-- upvalues: p19 (copy), Boundary (copy)
		local Success, Result = pcall(p19, p21)
		
		if not Success then
			Boundary.report(Result)
		end
	end
	
	if Callback == nil then
		local WatchScopedFunction = WatchModule.watchScoped
		local Parent1 = Parent
		local Reactor = nil
		local V = nil
		while Parent1 ~= nil do
			Reactor = Parent1.reactor
			
			if Reactor == nil then
				Parent1 = Parent1.parent
				continue
			end
			V = Reactor
			local WatchScopedResult, WatchScopedResult2 = WatchScopedFunction(V, v9, p20, Parent, Boundary ~= nil)
			
			if Parent.disposed then
				WatchScopedResult()
				
				if WatchScopedResult2 ~= nil then
					WatchScopedResult2()
				end
				return noop
			else
				local Head = { release = WatchScopedResult }
				
				if WatchScopedResult2 ~= nil then
					Head.after = WatchScopedResult2
				end
				local Head1 = Parent.head
				Head.following = Head1
				
				if Head1 ~= nil then
					Head1.previous = Head
				end
				Parent.head = Head
				
				return function()
					-- upvalues: Parent (copy), Head (copy), releaseEntry (upval), raiseAll (upval)
					if Parent.disposed or Head.release == nil then return end
					local Previous = Head.previous
					local Following = Head.following
					
					if Previous == nil then
						Parent.head = Following
					else
						Previous.following = Following
					end
					if Following ~= nil then
						Following.previous = Previous
					end
					Head.previous = nil
					Head.following = nil
					
					if Head.after ~= nil then
						local t = {}
						releaseEntry(Head, t)
						raiseAll(t)
						
						return
					end
					local ReleaseFunction: () -> () = Head.release
					Head.release = nil
					
					if ReleaseFunction ~= nil then
						ReleaseFunction()
					end
				end
			end
		end
		local V10 = v2 or ReactorModule.create()
		v2 = V10
		V = V10
	else
		local WatchScoped = WatchModule.watchScoped
		local Parent2 = Parent
		local Reactor = nil
		local V = nil
		while Parent2 ~= nil do
			Reactor = Parent2.reactor
			
			if Reactor == nil then
				Parent2 = Parent2.parent
				continue
			end
			V = Reactor
			local Success, Result = pcall(WatchScoped, V, v9, p20, Parent, Boundary ~= nil)
			
			if not Success then
				Callback()
				error(Result, 0)
			end
			if Parent.disposed then
				Result()
				
				if Callback ~= nil then
					Callback()
				end
				return noop
			else
				local Head2 = { release = Result }
				
				if Callback ~= nil then
					Head2.after = Callback
				end
				local Head3 = Parent.head
				Head2.following = Head3
				
				if Head3 ~= nil then
					Head3.previous = Head2
				end
				Parent.head = Head2
				
				return function()
					-- upvalues: Parent (copy), Head2 (copy), releaseEntry (upval), raiseAll (upval)
					if Parent.disposed or Head2.release == nil then return end
					local Previous = Head2.previous
					local Following = Head2.following
					
					if Previous == nil then
						Parent.head = Following
					else
						Previous.following = Following
					end
					if Following ~= nil then
						Following.previous = Previous
					end
					Head2.previous = nil
					Head2.following = nil
					
					if Head2.after ~= nil then
						local t = {}
						releaseEntry(Head2, t)
						raiseAll(t)
						
						return
					end
					local ReleaseFunction: () -> () = Head2.release
					Head2.release = nil
					
					if ReleaseFunction ~= nil then
						ReleaseFunction()
					end
				end
			end
		end
		local V10 = v2 or ReactorModule.create()
		v2 = V10
		V = V10
	end
end

local function disposer(p21)
	-- upvalues: Callback (ref)
	return function()
		-- upvalues: Callback (upval), p21 (copy)
		Callback(p21)
	end
end

local function scopeOwner(p21)
	-- upvalues: createChild (copy)
	local Child = p21.child
	
	if Child then
		return Child
	else
		local Child1 = createChild(assert(p21.inherited))
		p21.child = Child1
		
		return Child1
	end
end

local config = { parent = v9(), reactor = ReactorModule.create() }

return {
	createOwner = createOwner,
	holdRoot = function(Callback: () -> ())
		-- upvalues: config (ref), noop (copy), releaseEntry (copy), raiseAll (copy)
		local config1 = config
		
		if config1.disposed then
			Callback()
			
			return noop
		end
		local Head = config1.head
		local Head1 = { release = Callback, following = Head }
		
		if Head ~= nil then
			Head.previous = Head1
		end
		config1.head = Head1
		
		return function()
			-- upvalues: config1 (copy), Head1 (copy), releaseEntry (upval), raiseAll (upval)
			if config1.disposed or Head1.release == nil then return end
			local Previous = Head1.previous
			local Following = Head1.following
			
			if Previous == nil then
				config1.head = Following
			else
				Previous.following = Following
			end
			if Following ~= nil then
				Following.previous = Previous
			end
			Head1.previous = nil
			Head1.following = nil
			
			if Head1.after ~= nil then
				local t = {}
				releaseEntry(Head1, t)
				raiseAll(t)
				
				return
			end
			local ReleaseFunction: () -> () = Head1.release
			Head1.release = nil
			
			if ReleaseFunction ~= nil then
				ReleaseFunction()
			end
		end
	end,
	rootSize = function()
		-- upvalues: size (copy), config (ref)
		return (size(config))
	end,
	disposeRoots = function()
		-- upvalues: Callback (ref), config (ref), v9 (ref), ReactorModule (copy)
		Callback(config)
		config = { parent = v9(), reactor = ReactorModule.create() }
	end,
	reactorOf = reactorOf,
	isOwner = isOwner,
	raiseAll = raiseAll,
	installCurrentOwner = installCurrentOwner,
	runScopeOf = runScopeOf,
	scopeOwner = scopeOwner,
	disposer = disposer,
	api = {
		own = own,
		adopt = adopt,
		watch = watch,
		watchStatic = watchStatic,
		watchTerminal = watchTerminal,
		createChild = createChild,
		dispose = Callback,
		isDisposed = isDisposed,
		size = size,
		checkpoint = checkpoint,
		rollbackTo = rollbackTo,
		guardWith = guardWith
	},
	own = own,
	adopt = adopt,
	holdSubject = holdSubject,
	listenHeld = listenHeld,
	effectHeld = effectHeld,
	heldCount = heldCount,
	rollbackHeld = rollbackHeld,
	watch = watch,
	watchStatic = watchStatic,
	watchTerminal = watchTerminal,
	createChild = createChild,
	dispose = Callback,
	isDisposed = isDisposed,
	size = size,
	checkpoint = checkpoint,
	rollbackTo = rollbackTo,
	guardWith = guardWith
}