--!native

local DiagnosticsModule = require("../diagnostics")
local OwnerModule = require("./owner")
local EvaluationModule = require("../reactive/evaluation")
local _ = require("../reactive/types")
local List = {}
local CurrentThreads = {}
local List1 = {}

local function findOn(p1, CurrentThread)
	-- upvalues: EvaluationModule (copy), OwnerModule (copy), CurrentThreads (copy), List1 (copy), List (copy), DiagnosticsModule (copy)
	local ContextOnResult, ContextOnResult2, ContextOnResult3 = EvaluationModule.contextOn(CurrentThread)
	local RunScopeOfResult = if ContextOnResult == nil then nil else OwnerModule.runScopeOf(ContextOnResult)
	local CountCurrentThreads = #CurrentThreads
	
	if CurrentThreads[CountCurrentThreads] == CurrentThread and (RunScopeOfResult == nil or ContextOnResult3 ~= CurrentThread or List1[CountCurrentThreads] == ContextOnResult2) then
		return List[CountCurrentThreads]
	end
	local v1 = nil
	local v2 = nil
	local v3 = nil
	local v4 = nil
	local Flag = false
	local Flag1 = false
	
	for i = #CurrentThreads, 1, -1 do
		local CurrentThread1 = CurrentThreads[i]
		
		if CurrentThread1 == CurrentThread then
			if RunScopeOfResult ~= nil and ContextOnResult3 == CurrentThread and List1[i] ~= ContextOnResult2 then break end
			v1 = List[i]
			break
		else
			local ThreadStatus = coroutine.status(CurrentThread1)
			
			if ThreadStatus == "normal" and (v4 == nil or not v4[CurrentThread1]) then
				local V27 = v4 or {}
				v4 = V27
				V27[CurrentThread1] = true
				
				if RunScopeOfResult ~= nil and List1[i] == ContextOnResult2 then
					if v3 == nil then
						v3 = List[i]
					elseif v3 ~= List[i] then
						Flag1 = true
					end
				end
				if v2 == nil then
					v2 = List[i]
				elseif v2 ~= List[i] then
					Flag = true
				end
			else
				if ThreadStatus == "dead" then
					table.remove(CurrentThreads, i)
					table.remove(List, i)
					table.remove(List1, i)
				end
			end
		end
	end
	if RunScopeOfResult ~= nil and v1 == nil then
		if Flag1 then
			Flag = true
		else
			local Child = v3
			
			if not Child then
				if p1 then
					return (OwnerModule.scopeOwner(RunScopeOfResult))
				end
				Child = RunScopeOfResult.child or RunScopeOfResult.inherited
			end
			return Child
		end
	end
	return if v1 == nil and Flag then DiagnosticsModule.raise("owner/no-active-owner", "resumer owners are ambiguous", {
		contract = "a callback cannot infer the order of distinct resumer owners",
		fix = "bind the child callback with Compose.bindOwner or activate its owner with Compose.withOwner"
	}) else v1 or v2
end

local function current()
	-- upvalues: findOn (copy)
	return findOn(true, coroutine.running())
end

local function nearest()
	-- upvalues: findOn (copy)
	return findOn(false, coroutine.running())
end

local Cache = EvaluationModule.cache

local function resolve()
	-- upvalues: CurrentThreads (copy), Cache (copy), List (copy), List1 (copy), findOn (copy)
	local CurrentThread = coroutine.running()
	local CountCurrentThreads = #CurrentThreads
	
	if CurrentThreads[CountCurrentThreads] == CurrentThread then
		if Cache.active == 0 then
			return List[CountCurrentThreads], true
		end
		local Frame = Cache.frame
		
		if Frame ~= nil and Cache.thread == CurrentThread and Frame.order > 0 then
			local Consumer = Frame.consumer
			
			if Consumer == nil or Consumer.inherited == nil then
				return List[CountCurrentThreads], true
			elseif List1[CountCurrentThreads] == Frame.order then
				return List[CountCurrentThreads], true
			end
		end
	end
	local On = findOn(true, CurrentThread)
	local CountCurrentThreads1 = #CurrentThreads
	
	return On, On ~= nil and (CurrentThreads[CountCurrentThreads1] == CurrentThread and List[CountCurrentThreads1] == On)
end

local function push(p2)
	-- upvalues: CurrentThreads (copy), List (copy), EvaluationModule (copy), List1 (copy)
	local CurrentThread = coroutine.running()
	local v5 = #CurrentThreads + 1
	CurrentThreads[v5] = CurrentThread
	List[v5] = p2
	local _, ContextOnResult2 = EvaluationModule.contextOn(CurrentThread)
	List1[v5] = ContextOnResult2
	
	return CurrentThread
end

local function pop(p2, CurrentThread)
	-- upvalues: CurrentThreads (copy), List (copy), List1 (copy)
	local CountCurrentThreads = #CurrentThreads
	
	if CurrentThreads[CountCurrentThreads] == CurrentThread and List[CountCurrentThreads] == p2 then
		CurrentThreads[CountCurrentThreads] = nil
		List[CountCurrentThreads] = nil
		List1[CountCurrentThreads] = nil
		
		return
	end
	for i = CountCurrentThreads, 1, -1 do
		if CurrentThreads[i] ~= CurrentThread or List[i] ~= p2 then
			continue
		end
		table.remove(CurrentThreads, i)
		table.remove(List, i)
		table.remove(List1, i)
		break
	end
end

local function release(p3, CurrentThread, Success, ...)
	-- upvalues: pop (copy)
	pop(p3, CurrentThread)
	
	if not Success then
		error(select(1, ...), 0)
	end
	return ...
end

local function withOwner(p3, p4)
	-- upvalues: release (copy), CurrentThreads (copy), List (copy), EvaluationModule (copy), List1 (copy)
	local CurrentThread = coroutine.running()
	local v5 = #CurrentThreads + 1
	CurrentThreads[v5] = CurrentThread
	List[v5] = p3
	local _, ContextOnResult2 = EvaluationModule.contextOn(CurrentThread)
	List1[v5] = ContextOnResult2
	
	return release(p3, CurrentThread, pcall(p4))
end

local function bind(p3, p4)
	-- upvalues: release (copy), CurrentThreads (copy), List (copy), EvaluationModule (copy), List1 (copy)
	return function(...)
		-- upvalues: release (upval), p3 (copy), CurrentThreads (upval), List (upval), EvaluationModule (upval), List1 (upval), p4 (copy)
		local CurrentThread = coroutine.running()
		local v5 = #CurrentThreads + 1
		CurrentThreads[v5] = CurrentThread
		List[v5] = p3
		local _, ContextOnResult2 = EvaluationModule.contextOn(CurrentThread)
		List1[v5] = ContextOnResult2
		
		return release(p3, CurrentThread, pcall(p4, ...))
	end
end

local function own(p3, p4)
	-- upvalues: findOn (copy), DiagnosticsModule (copy), OwnerModule (copy)
	local On = findOn(true, coroutine.running())
	
	return if On == nil then DiagnosticsModule.raise("owner/no-active-owner", ("%s has no owner to register with"):format(p4), {
		contract = "resources must be created inside a mount, so something can release them",
		fix = "wrap the caller in runtime.mount(component, target), or pass an explicit owner"
	}) else OwnerModule.own(On, p3)
end

local function runWith(p3, p4, ...)
	-- upvalues: CurrentThreads (copy), List (copy), EvaluationModule (copy), List1 (copy), pop (copy)
	local CurrentThread = coroutine.running()
	local v5 = #CurrentThreads + 1
	CurrentThreads[v5] = CurrentThread
	List[v5] = p3
	local _, ContextOnResult2 = EvaluationModule.contextOn(CurrentThread)
	List1[v5] = ContextOnResult2
	local Success, Result = pcall(p4, ...)
	pop(p3, CurrentThread)
	
	if not Success then
		error(Result, 0)
	end
end

OwnerModule.installCurrentOwner(current)

return {
	current = current,
	nearest = nearest,
	resolve = resolve,
	withOwner = withOwner,
	bind = bind,
	runWith = runWith,
	push = push,
	pop = pop,
	own = own,
	resetForTests = function()
		-- upvalues: CurrentThreads (copy), List (copy), List1 (copy)
		table.clear(CurrentThreads)
		table.clear(List)
		table.clear(List1)
	end
}