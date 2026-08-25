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
	useContext = function(p0, p1, ...)
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref), array (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		if reactGlobalsModule.__DEV__ then
			if p1 ~= nil then
				console.error("useContext() second argument is reserved for future use in React. Passing it is not supported. You passed: %s.%s", p1, if typeof(p1) == "number" and array.isArray({ ... }) then "\n\nDid you call Array.map(useContext)? Calling Hooks inside a loop is not supported. Learn more at https://reactjs.org/link/rules-of-hooks" else "")
			end
			if p0._context ~= nil then
				local context = p0._context
				
				if context.Consumer == p0 then
					console.error("Calling useContext(Context.Consumer) is not supported, may cause bugs, and will be removed in a future major release. Did you mean to call useContext(Context) instead?")
				elseif context.Provider == p0 then
					console.error("Calling useContext(Context.Provider) is not supported. Did you mean to call useContext(Context) instead?")
				end
			end
		end
		return current.useContext(p0, p1)
	end,
	useState = function(p2, ...)
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useState(p2, ...)
	end,
	useReducer = function(p3, p4, p5)
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useReducer(p3, p4, p5)
	end,
	useRef = function(p6)
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useRef(p6)
	end,
	useBinding = function(p7)
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useBinding(p7)
	end,
	useEffect = function(p8, p9)
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useEffect(p8, p9)
	end,
	useLayoutEffect = function(p10, p11)
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useLayoutEffect(p10, p11)
	end,
	useCallback = function(p12, p13)
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useCallback(p12, p13)
	end,
	useMemo = function(p14, p15)
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useMemo(p14, p15)
	end,
	useImperativeHandle = function(p16, p17, p18)
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useImperativeHandle(p16, p17, p18)
	end,
	useDebugValue = function(p19, p20)
		-- upvalues: reactGlobalsModule (ref), reactCurrentDispatcher (ref), console (ref)
		if not reactGlobalsModule.__DEV__ then
			return nil
		end
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useDebugValue(p19, p20)
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
	useMutableSource = function(p21, p22, p23)
		-- upvalues: reactCurrentDispatcher (ref), reactGlobalsModule (ref), console (ref)
		local current = reactCurrentDispatcher.current
		
		if reactGlobalsModule.__DEV__ and current == nil then
			console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
		end
		return current.useMutableSource(p21, p22, p23)
	end
}