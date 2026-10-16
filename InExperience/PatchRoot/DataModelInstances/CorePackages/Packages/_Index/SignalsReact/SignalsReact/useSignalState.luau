local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local CreateEffectFunction = require(Parent.Signals).createEffect
local _, Result = xpcall(function() --[[ Line: 8 ]]
	return game:DefineFastFlag("SignalsReactUseMutableSource", false)
end, function(): boolean --[[ Line: 10 ]]
	return true
end)

local function getSignalVersion(Callback1: (any) -> ()) --[[ Line: 14 ]]
	local function dummyObserver() --[[ Line: 15 ]]
		-- upvalues: Callback1 (copy)
		return Callback1
	end
	
	local Callback = nil
	Callback1(function(p1) --[[ Line: 25 | Named "scope" ]]
		-- upvalues: Callback (ref), dummyObserver (copy)
		Callback = p1
		
		return dummyObserver
	end)
	Callback(dummyObserver, true)
	
	return Callback()
end

local function getSignalSnapshot(Callback) --[[ Line: 37 ]]
	return Callback(false)
end

local function subscribeToSignal(Callback1, Callback) --[[ Line: 41 ]]
	-- upvalues: CreateEffectFunction (copy)
	return CreateEffectFunction(function(p1) --[[ Line: 42 ]]
		-- upvalues: Callback (copy), Callback1 (copy)
		Callback(Callback1(p1))
	end)
end

local function useSignalState(p1) --[[ Line: 47 ]]
	-- upvalues: ReactModule (copy), getSignalVersion (copy), getSignalSnapshot (copy), subscribeToSignal (copy)
	return ReactModule.useMutableSource(ReactModule.useMemo(function() --[[ Line: 48 ]]
		-- upvalues: ReactModule (upval), p1 (copy), getSignalVersion (upval)
		return ReactModule.createMutableSource(p1, getSignalVersion)
	end, { p1 }), getSignalSnapshot, subscribeToSignal)
end

local function useSignalState_old(Callback) --[[ Line: 55 ]]
	-- upvalues: ReactModule (copy), CreateEffectFunction (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function() --[[ Line: 56 ]]
		-- upvalues: Callback (copy)
		return Callback(false)
	end)
	ReactModule.useLayoutEffect(function() --[[ Line: 60 ]]
		-- upvalues: UseStateResult2 (copy), Callback (copy), CreateEffectFunction (upval)
		UseStateResult2(Callback(false))
		
		return CreateEffectFunction(function(p1) --[[ Line: 62 ]]
			-- upvalues: UseStateResult2 (upval), Callback (upval)
			UseStateResult2(Callback(p1))
		end)
	end, { Callback })
	
	return UseStateResult
end

return if Result then useSignalState else useSignalState_old