local Parent = script.Parent.Parent
local SharedModule = require(Parent.Shared)
local ReactSharedInternals = SharedModule.ReactSharedInternals
local ReactCurrentDispatcher = ReactSharedInternals.ReactCurrentDispatcher
local ReactCurrentCompilerRuntime = ReactSharedInternals.ReactCurrentCompilerRuntime
local REACTMEMOCACHESENTINEL = SharedModule.ReactSymbols.REACT_MEMO_CACHE_SENTINEL

local function useMemoCacheProd(p1)
	-- upvalues: ReactCurrentDispatcher (copy)
	return ReactCurrentDispatcher.current.useMemoCache(p1)
end

local function useMemoCacheDev(p1)
	-- upvalues: ReactCurrentDispatcher (copy)
	local Current = ReactCurrentDispatcher.current
	
	if Current == nil then
		error("React Compiler memo cache can only be read while a function component or custom hook is rendering.", 2)
	end
	return Current.useMemoCache(p1)
end

return {
	c = if require(Parent.ReactGlobals).__DEV__ then useMemoCacheDev else useMemoCacheProd,
	cg = function(p1, RenderingComponent)
		-- upvalues: ReactCurrentCompilerRuntime (copy), ReactCurrentDispatcher (copy), REACTMEMOCACHESENTINEL (copy)
		if RenderingComponent == nil or ReactCurrentCompilerRuntime.renderingComponent ~= RenderingComponent or ReactCurrentCompilerRuntime.guardedCacheGranted then
			return table.create(p1, REACTMEMOCACHESENTINEL)
		else
			ReactCurrentCompilerRuntime.guardedCacheGranted = true
			
			return ReactCurrentDispatcher.current.useMemoCache(p1)
		end
	end,
	cc = function(p1)
		-- upvalues: ReactCurrentCompilerRuntime (copy)
		local CurrentFunction = ReactCurrentCompilerRuntime.current
		
		if CurrentFunction == nil then
			error("React Compiler class memo cache can only be read while a class component is rendering.", 2)
		end
		return CurrentFunction(p1)
	end
}