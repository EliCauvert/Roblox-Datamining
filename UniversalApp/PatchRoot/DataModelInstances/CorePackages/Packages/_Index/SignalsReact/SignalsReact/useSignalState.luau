local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local CreateEffectFunction = require(Parent.Signals).createEffect
local _, Result = xpcall(function()
	return game:DefineFastFlag("SignalsReactUseMutableSource", false)
end, function(): boolean
	return true
end)

local function getSignalVersion(Callback1: (any) -> ())
	local function dummyObserver()
		-- upvalues: Callback1 (copy)
		return Callback1
	end
	
	local Callback = nil
	Callback1(function(p1)
		-- upvalues: Callback (ref), dummyObserver (copy)
		Callback = p1
		
		return dummyObserver
	end)
	Callback(dummyObserver, true)
	
	return Callback()
end

local function getSignalSnapshot(Callback)
	return Callback(false)
end

local function subscribeToSignal(Callback1, Callback)
	-- upvalues: CreateEffectFunction (copy)
	return CreateEffectFunction(function(p1)
		-- upvalues: Callback (copy), Callback1 (copy)
		Callback(Callback1(p1))
	end)
end

local function useSignalState(p1)
	-- upvalues: ReactModule (copy), getSignalVersion (copy), getSignalSnapshot (copy), subscribeToSignal (copy)
	return ReactModule.useMutableSource(ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), p1 (copy), getSignalVersion (upval)
		return ReactModule.createMutableSource(p1, getSignalVersion)
	end, { p1 }), getSignalSnapshot, subscribeToSignal)
end

local function useSignalState_old(Callback)
	-- upvalues: ReactModule (copy), CreateEffectFunction (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: Callback (copy)
		return Callback(false)
	end)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult2 (copy), Callback (copy), CreateEffectFunction (upval)
		UseStateResult2(Callback(false))
		
		return CreateEffectFunction(function(p1)
			-- upvalues: UseStateResult2 (upval), Callback (upval)
			UseStateResult2(Callback(p1))
		end)
	end, { Callback })
	
	return UseStateResult
end

return if Result then useSignalState else useSignalState_old