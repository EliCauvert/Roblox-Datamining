local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local Array = require(Parent.LuauPolyfill).Array
local Console = require(Parent.Shared).console
local _ = require(Parent.Shared)
local _ = require(Parent.Shared)
local ReactCurrentDispatcher = require(Parent.Shared).ReactSharedInternals.ReactCurrentDispatcher

local function _() --[[ Line: 46 | Named "resolveDispatcher" ]]
	-- upvalues: ReactCurrentDispatcher (copy), ReactGlobalsModule (copy), Console (copy)
	local Current = ReactCurrentDispatcher.current
	
	if ReactGlobalsModule.__DEV__ and Current == nil then
		Console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
	end
	return Current
end

return {
	useContext = function(Consumer, p1, ...) --[[ Line: 76 ]]
		-- upvalues: ReactCurrentDispatcher (copy), ReactGlobalsModule (copy), Console (copy), Array (copy)
		local Current = ReactCurrentDispatcher.current
		
		if ReactGlobalsModule.__DEV__ and Current == nil then
			Console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		if ReactGlobalsModule.__DEV__ then
			if p1 ~= nil then
				Console.error("useContext() second argument is reserved for future use in React. Passing it is not supported. You passed: %s.%s", p1, if typeof(p1) == "number" and Array.isArray({ ... }) then "\n\nDid you call Array.map(useContext)? Calling Hooks inside a loop is not supported. Learn more at https://reactjs.org/link/rules-of-hooks" else "")
			end
			if Consumer._context ~= nil then
				local Context = Consumer._context
				
				if Context.Consumer == Consumer then
					Console.error("Calling useContext(Context.Consumer) is not supported, may cause bugs, and will be removed in a future major release. Did you mean to call useContext(Context) instead?")
				elseif Context.Provider == Consumer then
					Console.error("Calling useContext(Context.Provider) is not supported. Did you mean to call useContext(Context) instead?")
				end
			end
		end
		return Current.useContext(Consumer, p1)
	end,
	useState = function(p1, ...) --[[ Line: 122 ]]
		-- upvalues: ReactCurrentDispatcher (copy), ReactGlobalsModule (copy), Console (copy)
		local Current = ReactCurrentDispatcher.current
		
		if ReactGlobalsModule.__DEV__ and Current == nil then
			Console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return Current.useState(p1, ...)
	end,
	useReducer = function(p1, p2, p3) --[[ Line: 141 ]]
		-- upvalues: ReactCurrentDispatcher (copy), ReactGlobalsModule (copy), Console (copy)
		local Current = ReactCurrentDispatcher.current
		
		if ReactGlobalsModule.__DEV__ and Current == nil then
			Console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return Current.useReducer(p1, p2, p3)
	end,
	useRef = function(p1) --[[ Line: 163 ]]
		-- upvalues: ReactCurrentDispatcher (copy), ReactGlobalsModule (copy), Console (copy)
		local Current = ReactCurrentDispatcher.current
		
		if ReactGlobalsModule.__DEV__ and Current == nil then
			Console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return Current.useRef(p1)
	end,
	useBinding = function(p1) --[[ Line: 175 ]]
		-- upvalues: ReactCurrentDispatcher (copy), ReactGlobalsModule (copy), Console (copy)
		local Current = ReactCurrentDispatcher.current
		
		if ReactGlobalsModule.__DEV__ and Current == nil then
			Console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return Current.useBinding(p1)
	end,
	useEffect = function(p1, p2) --[[ Line: 195 ]]
		-- upvalues: ReactCurrentDispatcher (copy), ReactGlobalsModule (copy), Console (copy)
		local Current = ReactCurrentDispatcher.current
		
		if ReactGlobalsModule.__DEV__ and Current == nil then
			Console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return Current.useEffect(p1, p2)
	end,
	useLayoutEffect = function(p1, p2) --[[ Line: 219 ]]
		-- upvalues: ReactCurrentDispatcher (copy), ReactGlobalsModule (copy), Console (copy)
		local Current = ReactCurrentDispatcher.current
		
		if ReactGlobalsModule.__DEV__ and Current == nil then
			Console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return Current.useLayoutEffect(p1, p2)
	end,
	useCallback = function(p1, p2) --[[ Line: 235 ]]
		-- upvalues: ReactCurrentDispatcher (copy), ReactGlobalsModule (copy), Console (copy)
		local Current = ReactCurrentDispatcher.current
		
		if ReactGlobalsModule.__DEV__ and Current == nil then
			Console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return Current.useCallback(p1, p2)
	end,
	useMemo = function(p1, p2) --[[ Line: 246 ]]
		-- upvalues: ReactCurrentDispatcher (copy), ReactGlobalsModule (copy), Console (copy)
		local Current = ReactCurrentDispatcher.current
		
		if ReactGlobalsModule.__DEV__ and Current == nil then
			Console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return Current.useMemo(p1, p2)
	end,
	useImperativeHandle = function(p1, p2, p3) --[[ Line: 261 ]]
		-- upvalues: ReactCurrentDispatcher (copy), ReactGlobalsModule (copy), Console (copy)
		local Current = ReactCurrentDispatcher.current
		
		if ReactGlobalsModule.__DEV__ and Current == nil then
			Console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return Current.useImperativeHandle(p1, p2, p3)
	end,
	useDebugValue = function(p1, p2) --[[ Line: 279 ]]
		-- upvalues: ReactGlobalsModule (copy), ReactCurrentDispatcher (copy), Console (copy)
		if not ReactGlobalsModule.__DEV__ then
			return nil
		end
		local Current = ReactCurrentDispatcher.current
		
		if ReactGlobalsModule.__DEV__ and Current == nil then
			Console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return Current.useDebugValue(p1, p2)
	end,
	emptyObject = {},
	useOpaqueIdentifier = function() --[[ Line: 304 ]]
		-- upvalues: ReactCurrentDispatcher (copy), ReactGlobalsModule (copy), Console (copy)
		local Current = ReactCurrentDispatcher.current
		
		if ReactGlobalsModule.__DEV__ and Current == nil then
			Console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return Current.useOpaqueIdentifier()
	end,
	useMutableSource = function(p1, p2, p3) --[[ Line: 309 ]]
		-- upvalues: ReactCurrentDispatcher (copy), ReactGlobalsModule (copy), Console (copy)
		local Current = ReactCurrentDispatcher.current
		
		if ReactGlobalsModule.__DEV__ and Current == nil then
			Console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return Current.useMutableSource(p1, p2, p3)
	end
}