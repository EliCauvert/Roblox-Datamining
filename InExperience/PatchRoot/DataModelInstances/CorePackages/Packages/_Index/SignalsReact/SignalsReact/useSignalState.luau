local parent = script.Parent.Parent
local reactModule = require(parent.React)
local createEffect = require(parent.Signals).createEffect
local _, status = xpcall(function()
	return game:DefineFastFlag("SignalsReactUseMutableSource", false)
end, function()
	return true
end)

local function getSignalVersion(value)
	local function dummyObserver()
		-- upvalues: value (ref)
		return value
	end
	
	local var1 = nil
	value(function(p1)
		-- upvalues: var1 (write), dummyObserver (ref)
		var1 = p1
		
		return dummyObserver
	end)
	var1(dummyObserver, true)
	
	return var1()
end

local function getSignalSnapshot(value)
	return value(false)
end

local function subscribeToSignal(value, p1)
	-- upvalues: createEffect (ref)
	return createEffect(function(p2)
		-- upvalues: p1 (ref), value (ref)
		p1(value(p2))
	end)
end

return if status then function(value)
	-- upvalues: reactModule (ref), getSignalVersion (ref), getSignalSnapshot (ref), subscribeToSignal (ref)
	return reactModule.useMutableSource(reactModule.useMemo(function()
		-- upvalues: reactModule (copy), value (ref), getSignalVersion (copy)
		return reactModule.createMutableSource(value, getSignalVersion)
	end, { value }), getSignalSnapshot, subscribeToSignal)
end else function(value)
	-- upvalues: reactModule (ref), createEffect (ref)
	local var1, var2 = reactModule.useState(function()
		-- upvalues: value (ref)
		return value(false)
	end)
	reactModule.useLayoutEffect(function()
		-- upvalues: var2 (ref), value (ref), createEffect (copy)
		var2(value(false))
		
		return createEffect(function(p1)
			-- upvalues: var2 (copy), value (copy)
			var2(value(p1))
		end)
	end, { value })
	
	return var1
end