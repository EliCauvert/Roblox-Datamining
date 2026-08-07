-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:21 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local reactModule = require(parent.React)
local createEffect = require(parent.Signals).createEffect
local _, status = xpcall(function() --[[ line: 8 ]]
	return game:DefineFastFlag("SignalsReactUseMutableSource", false)
end, function() --[[ line: 10 ]]
	return true
end)

local function getSignalVersion(value) --[[ line: 14 ]]
	local function dummyObserver() --[[ line: 15 ]]
		-- upvalues: value (ref)
		return value
	end
	
	local var5 = nil
	value(function(p0) --[[ line: 25 | named "scope" ]]
		-- upvalues: var5 (write), dummyObserver (ref)
		var5 = p0
		
		return dummyObserver
	end)
	var5(dummyObserver, true)
	
	return var5()
end

local function getSignalSnapshot(value) --[[ line: 37 ]]
	return value(false)
end

local function subscribeToSignal(value, p1) --[[ line: 41 ]]
	-- upvalues: createEffect (ref)
	return createEffect(function(p2) --[[ line: 42 ]]
		-- upvalues: p1 (ref), value (ref)
		p1(value(p2))
	end)
end

return if status then function(value) --[[ line: 47 | named "useSignalState" ]]
	-- upvalues: reactModule (ref), getSignalVersion (ref), getSignalSnapshot (ref), subscribeToSignal (ref)
	return reactModule.useMutableSource(reactModule.useMemo(function() --[[ line: 48 ]]
		-- upvalues: reactModule (copy), value (ref), getSignalVersion (copy)
		return reactModule.createMutableSource(value, getSignalVersion)
	end, { value }), getSignalSnapshot, subscribeToSignal)
end else function(value) --[[ line: 55 | named "useSignalState_old" ]]
	-- upvalues: reactModule (ref), createEffect (ref)
	local var6, var7 = reactModule.useState(function() --[[ line: 56 ]]
		-- upvalues: value (ref)
		return value(false)
	end)
	reactModule.useLayoutEffect(function() --[[ line: 60 ]]
		-- upvalues: var7 (ref), value (ref), createEffect (copy)
		var7(value(false))
		
		return createEffect(function(p3) --[[ line: 62 ]]
			-- upvalues: var7 (copy), value (copy)
			var7(value(p3))
		end)
	end, { value })
	
	return var6
end