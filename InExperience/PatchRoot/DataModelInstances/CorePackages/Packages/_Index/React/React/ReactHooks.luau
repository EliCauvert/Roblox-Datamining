local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local array = require(parent.LuauPolyfill).Array
local console = require(parent.Shared).console
local _ = require(parent.Shared)
local _ = require(parent.Shared)
local reactCurrentDispatcher = require(parent.Shared).ReactSharedInternals.ReactCurrentDispatcher

local function _()
	-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref)
	local current = reactCurrentDispatcher.current
	
	if reactGlobalsModule.__DEV__ and current == nil then
		console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
	end
	return current
end

return {
	useContext = function(p1, p2, ...)
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref), array (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		if reactGlobalsModule.__DEV__ then
			if p2 ~= nil then
				console.error("useContext() second argument is reserved for future use in React. Passing it is not supported. You passed: %s.%s", p2, if typeof(p2) == "number" and array.isArray({ ... }) then "\n\nDid you call Array.map(useContext)? Calling Hooks inside a loop is not supported. Learn more at https://reactjs.org/link/rules-of-hooks" else "")
			end
			if p1._context ~= nil then
				local context = p1._context
				
				if context.Consumer == p1 then
					console.error("Calling useContext(Context.Consumer) is not supported, may cause bugs, and will be removed in a future major release. Did you mean to call useContext(Context) instead?")
				elseif context.Provider == p1 then
					console.error("Calling useContext(Context.Provider) is not supported. Did you mean to call useContext(Context) instead?")
				end
			end
		end
		return current.useContext(p1, p2)
	end,
	useState = function(p1, ...)
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useState(p1, ...)
	end,
	useReducer = function(p1, p2, p3)
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useReducer(p1, p2, p3)
	end,
	useRef = function(p1)
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useRef(p1)
	end,
	useBinding = function(p1)
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useBinding(p1)
	end,
	useEffect = function(p1, p2)
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useEffect(p1, p2)
	end,
	useLayoutEffect = function(p1, p2)
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useLayoutEffect(p1, p2)
	end,
	useCallback = function(p1, p2)
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useCallback(p1, p2)
	end,
	useMemo = function(p1, p2)
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useMemo(p1, p2)
	end,
	useImperativeHandle = function(p1, p2, p3)
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useImperativeHandle(p1, p2, p3)
	end,
	useDebugValue = function(p1, p2)
		-- upvalues: reactGlobalsModule (ref), reactCurrentDispatcher (ref), console (ref)
		if not reactGlobalsModule.__DEV__ then
			return nil
		end
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useDebugValue(p1, p2)
	end,
	emptyObject = {},
	useOpaqueIdentifier = function()
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useOpaqueIdentifier()
	end,
	useMutableSource = function(p1, p2, p3)
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useMutableSource(p1, p2, p3)
	end
}