local Parent = script.Parent.Parent
local DEV = require(Parent.ReactGlobals).__DEV__
local ReactCompilerRuntimeModule = require(Parent.ReactCompilerRuntime)
local _ = require(script.Parent.ReactInternalTypes)
local SharedModule = require(Parent.Shared)
local Console = SharedModule.console
local EnableNoCloningCompilerMemoCache = SharedModule.ReactFeatureFlags.enableNoCloningCompilerMemoCache
local ReactCurrentCompilerRuntime = SharedModule.ReactSharedInternals.ReactCurrentCompilerRuntime
local v1 = nil
local v2 = nil

local function _(p1)
	local UpdateQueue = p1.updateQueue
	local Alternate = p1.alternate
	
	if Alternate ~= nil and UpdateQueue == Alternate.updateQueue then
		UpdateQueue = table.clone(UpdateQueue)
		p1.updateQueue = UpdateQueue
	end
	return UpdateQueue
end

local function getOrCreateMemoCache(p1)
	-- upvalues: EnableNoCloningCompilerMemoCache (copy), ReactCompilerRuntimeModule (copy)
	local UpdateQueue = p1.updateQueue
	local Alternate = p1.alternate
	
	if Alternate ~= nil and UpdateQueue == Alternate.updateQueue then
		UpdateQueue = table.clone(UpdateQueue)
		p1.updateQueue = UpdateQueue
	end
	local MemoCache = UpdateQueue.memoCache
	local Alternate1 = p1.alternate
	local MemoCache1 = if Alternate1 ~= nil and Alternate1.updateQueue ~= nil then Alternate1.updateQueue.memoCache else nil
	
	if MemoCache == nil then
		MemoCache = if MemoCache1 == nil then ReactCompilerRuntimeModule.createMemoCache() elseif EnableNoCloningCompilerMemoCache then ReactCompilerRuntimeModule.shareMemoCache(MemoCache1) else ReactCompilerRuntimeModule.cloneMemoCache(MemoCache1)
	elseif MemoCache == MemoCache1 then
		if EnableNoCloningCompilerMemoCache then
			MemoCache = ReactCompilerRuntimeModule.shareMemoCache(MemoCache)
		else
			MemoCache = ReactCompilerRuntimeModule.cloneMemoCache(MemoCache)
		end
	end
	UpdateQueue.memoCache = MemoCache
	
	return MemoCache
end

local function useMemoCache(Size)
	-- upvalues: v1 (ref), v2 (ref), getOrCreateMemoCache (copy), ReactCompilerRuntimeModule (copy), DEV (copy), Console (copy)
	local v3 = v1
	
	if v3 == nil then
		error("React Compiler class memo cache can only be read while a class component is rendering.", 2)
	end
	local v4 = v2
	
	if v4 == nil then
		v4 = getOrCreateMemoCache(v3)
		v2 = v4
	end
	local v5 = v4
	local Index = v5.index
	local Entry = v5.data[Index]
	
	if Entry == nil then
		Entry = ReactCompilerRuntimeModule.createMemoCacheSlot(Size)
		v5.data[Index] = Entry
		v5.sizes[Index] = Size
	elseif DEV and v5.sizes[Index] ~= Size then
		Console.error("Expected a constant size argument for each invocation of the class memo cache. The previous cache was allocated with size %s but size %s was requested.", v5.sizes[Index], Size)
	end
	v5.index += 1
	
	return Entry
end

local function finishRendering()
	-- upvalues: ReactCurrentCompilerRuntime (copy), v1 (ref), v2 (ref)
	ReactCurrentCompilerRuntime.current = nil
	v1 = nil
	v2 = nil
end

return {
	prepareToRender = function(p1)
		-- upvalues: v1 (ref), v2 (ref), getOrCreateMemoCache (copy), ReactCompilerRuntimeModule (copy), ReactCurrentCompilerRuntime (copy), useMemoCache (copy)
		v1 = p1
		v2 = nil
		local Alternate = p1.alternate
		local UpdateQueue = if Alternate == nil then nil else Alternate.updateQueue
		
		if p1.updateQueue.memoCache ~= nil or UpdateQueue ~= nil and UpdateQueue.memoCache ~= nil then
			v2 = getOrCreateMemoCache(p1)
			ReactCompilerRuntimeModule.resetMemoCache(v2)
		end
		ReactCurrentCompilerRuntime.current = useMemoCache
	end,
	finishRendering = finishRendering,
	resetAfterThrow = finishRendering
}