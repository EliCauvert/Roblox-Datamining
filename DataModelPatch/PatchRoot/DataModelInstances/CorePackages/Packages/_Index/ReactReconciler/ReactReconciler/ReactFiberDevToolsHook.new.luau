local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local Console = require(Parent.Shared).console
local _ = require(Parent.LuauPolyfill)

local function _(p1): boolean
	if typeof(p1) == "function" then
		return true
	end
	if typeof(p1) == "table" then
		local Meta = getmetatable(p1)
		
		if Meta and rawget(Meta, "__call") then
			return true
		elseif p1._isMockFunction then
			return true
		end
	end
	return false
end

local EnableProfilerTimer = require(Parent.Shared).ReactFeatureFlags.enableProfilerTimer
local _ = require(script.Parent.ReactInternalTypes)
local _ = require(Parent.Shared)
local DidCapture = require(script.Parent.ReactFiberFlags).DidCapture
local InjectResult = nil
local v1 = nil
local Flag = false

return {
	isDevToolsPresent = function(): boolean
		-- upvalues: ReactGlobalsModule (copy)
		return ReactGlobalsModule.__REACT_DEVTOOLS_GLOBAL_HOOK__ ~= nil
	end,
	injectInternals = function(p1): boolean
		-- upvalues: ReactGlobalsModule (copy), Console (copy), InjectResult (ref), v1 (ref)
		if ReactGlobalsModule.__REACT_DEVTOOLS_GLOBAL_HOOK__ == nil then
			return false
		end
		local REACTDEVTOOLSGLOBALHOOK = ReactGlobalsModule.__REACT_DEVTOOLS_GLOBAL_HOOK__
		
		if REACTDEVTOOLSGLOBALHOOK.isDisabled then
			return true
		end
		if REACTDEVTOOLSGLOBALHOOK.supportsFiber then
			local Success, Result = pcall(function()
				-- upvalues: InjectResult (upval), REACTDEVTOOLSGLOBALHOOK (copy), p1 (copy), v1 (upval)
				InjectResult = REACTDEVTOOLSGLOBALHOOK.inject(p1)
				v1 = REACTDEVTOOLSGLOBALHOOK
			end)
			
			if not Success and ReactGlobalsModule.__DEV__ then
				Console.error("React instrumentation encountered an error: %s.", Result)
			end
			return true
		else
			if ReactGlobalsModule.__DEV__ then
				Console.error("The installed version of React DevTools is too old and will not work with the current version of React. Please update React DevTools. https://reactjs.org/link/react-devtools")
			end
			return true
		end
	end,
	onScheduleRoot = function(p1, p2)
		-- upvalues: ReactGlobalsModule (copy), v1 (ref), InjectResult (ref), Flag (ref), Console (copy)
		if ReactGlobalsModule.__DEV__ and v1 then
			local OnScheduleFiberRoot = v1.onScheduleFiberRoot
			local Flag1 = nil
			repeat
				if typeof(OnScheduleFiberRoot) == "function" then
					Flag1 = true
					break
				end
				if typeof(OnScheduleFiberRoot) == "table" then
					local Meta = getmetatable(OnScheduleFiberRoot)
					
					if Meta and rawget(Meta, "__call") then
						Flag1 = true
						break
					end
					if OnScheduleFiberRoot._isMockFunction then
						Flag1 = true
						break
					end
				end
				Flag1 = false
			until true
			if Flag1 then
				local Success, Result = pcall(v1.onScheduleFiberRoot, InjectResult, p1, p2)
				
				if not Success and ReactGlobalsModule.__DEV__ and not Flag then
					Flag = true
					Console.error("React instrumentation encountered an error: %s", Result)
				end
			end
		end
	end,
	onCommitRoot = function(p1, p2)
		-- upvalues: v1 (ref), DidCapture (copy), EnableProfilerTimer (copy), InjectResult (ref), ReactGlobalsModule (copy), Flag (ref), Console (copy)
		if v1 then
			local OnCommitFiberRoot = v1.onCommitFiberRoot
			local Flag1 = nil
			repeat
				if typeof(OnCommitFiberRoot) == "function" then
					Flag1 = true
					break
				end
				if typeof(OnCommitFiberRoot) == "table" then
					local Meta = getmetatable(OnCommitFiberRoot)
					
					if Meta and rawget(Meta, "__call") then
						Flag1 = true
						break
					end
					if OnCommitFiberRoot._isMockFunction then
						Flag1 = true
						break
					end
				end
				Flag1 = false
			until true
			if Flag1 then
				local Success, Result = pcall(function()
					-- upvalues: p1 (copy), DidCapture (upval), EnableProfilerTimer (upval), v1 (upval), InjectResult (upval), p2 (copy)
					local IsBitsMatch = bit32.band(p1.current.flags, DidCapture) == DidCapture
					
					if EnableProfilerTimer then
						v1.onCommitFiberRoot(InjectResult, p1, p2, IsBitsMatch)
						
						return
					else
						v1.onCommitFiberRoot(InjectResult, p1, nil, IsBitsMatch)
					end
				end)
				
				if not Success and ReactGlobalsModule.__DEV__ and not Flag then
					Flag = true
					Console.error("React instrumentation encountered an error: %s", Result)
				end
			end
		end
	end,
	onCommitUnmount = function(p1)
		-- upvalues: v1 (ref), InjectResult (ref), ReactGlobalsModule (copy), Flag (ref), Console (copy)
		if v1 then
			local OnCommitFiberUnmount = v1.onCommitFiberUnmount
			local Flag1 = nil
			repeat
				if typeof(OnCommitFiberUnmount) == "function" then
					Flag1 = true
					break
				end
				if typeof(OnCommitFiberUnmount) == "table" then
					local Meta = getmetatable(OnCommitFiberUnmount)
					
					if Meta and rawget(Meta, "__call") then
						Flag1 = true
						break
					end
					if OnCommitFiberUnmount._isMockFunction then
						Flag1 = true
						break
					end
				end
				Flag1 = false
			until true
			if Flag1 then
				local Success, Result = pcall(v1.onCommitFiberUnmount, InjectResult, p1)
				
				if not Success and ReactGlobalsModule.__DEV__ and not Flag then
					Flag = true
					Console.error("React instrumentation encountered an error: %s", Result)
				end
			end
		end
	end
}