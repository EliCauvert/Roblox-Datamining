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
	
	local var5 = nil
	value(function(p0)
		-- upvalues: var5 (write), dummyObserver (ref)
		var5 = p0
		
		return dummyObserver
	end)
	var5(dummyObserver, true)
	
	return var5()
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
	local var6, var7 = reactModule.useState(function()
		-- upvalues: value (ref)
		return value(false)
	end)
	reactModule.useLayoutEffect(function()
		-- upvalues: var7 (ref), value (ref), createEffect (copy)
		var7(value(false))
		
		return createEffect(function(p3)
			-- upvalues: var7 (copy), value (copy)
			var7(value(p3))
		end)
	end, { value })
	
	return var6
end