local Parent = script.Parent.Parent
local RoactNavigationModule = require(Parent.RoactNavigation)
local GetNavigationFunction = RoactNavigationModule.getNavigation
local Actions = RoactNavigationModule.Actions
local SignalsModule = require(Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local _ = require(script.Parent.types)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSignalsNavPendingLock = SharedFlagsModule.FFlagSignalsNavPendingLock
local DEV = _G.__DEV__ or _G.__TESTEZ_RUNNING_TEST__
local FIntSignalsNavPendingLockFailsafeMsRatio = SharedFlagsModule.FIntSignalsNavPendingLockFailsafeMs / 1000

return function(p1, p2)
	-- upvalues: CreateSignalFunction (copy), Actions (copy), FIntSignalsNavPendingLockFailsafeMsRatio (copy), FFlagSignalsNavPendingLock (copy), SignalsExperimentalModule (copy), DEV (copy), CreateComputedFunction (copy), GetNavigationFunction (copy)
	local OnPendingFailsafeRelease = if p2 == nil then nil else p2.onPendingFailsafeRelease
	local t = {}
	local Signal, Signal2 = CreateSignalFunction(false)
	local Signal1, Signal2_1 = CreateSignalFunction(function()
		-- upvalues: p1 (copy), Actions (upval)
		return (p1.getStateForAction(Actions.init()))
	end)
	local Callback = nil
	local List = {}
	local Signal3, Signal2_2 = CreateSignalFunction(false)
	local Tbl = {}
	
	local function clearPending(Key)
		-- upvalues: Tbl (copy), Signal2_2 (copy)
		if Key == nil then
			table.clear(Tbl)
		else
			if Tbl[Key] == nil then return end
			Tbl[Key] = nil
		end
		Signal2_2(next(Tbl) ~= nil)
	end
	
	local function markPending(Key)
		-- upvalues: Tbl (copy), Signal2_2 (copy), FIntSignalsNavPendingLockFailsafeMsRatio (upval), OnPendingFailsafeRelease (copy)
		local config = { committed = false, pendingSince = os.clock() }
		Tbl[Key] = config
		Signal2_2(true)
		task.delay(FIntSignalsNavPendingLockFailsafeMsRatio, function()
			-- upvalues: Tbl (upval), Key (copy), config (copy), Signal2_2 (upval), OnPendingFailsafeRelease (upval)
			if Tbl[Key] == config then
				repeat
					if Key == nil then
						table.clear(Tbl)
					else
						if Tbl[Key] == nil then break end
						Tbl[Key] = nil
					end
					Signal2_2(next(Tbl) ~= nil)
				until true
				if OnPendingFailsafeRelease ~= nil then
					OnPendingFailsafeRelease(Key, config.committed, config.pendingSince)
				end
			end
		end)
	end
	
	local function markPendingCommitted(p3)
		-- upvalues: Tbl (copy)
		local Entry = Tbl[p3]
		
		if Entry ~= nil then
			Entry.committed = true
		end
	end
	
	local function setDispatch(Callback1: (any) -> ())
		-- upvalues: Callback (ref), List (ref)
		Callback = Callback1
		
		if #List > 0 then
			local List1 = List
			List = {}
			
			for _, value in List1 do
				Callback1(value)
			end
		end
	end
	
	local function clearDispatch()
		-- upvalues: Callback (ref), FFlagSignalsNavPendingLock (upval), Tbl (copy), Signal2_2 (copy)
		Callback = nil
		
		if FFlagSignalsNavPendingLock then
			table.clear(Tbl)
			Signal2_2(next(Tbl) ~= nil)
		end
	end
	
	local function update(p3)
		-- upvalues: SignalsExperimentalModule (upval), Signal2_1 (copy), Signal2 (copy)
		if p3 ~= nil then
			SignalsExperimentalModule.batch(function()
				-- upvalues: Signal2_1 (upval), p3 (copy), Signal2 (upval)
				Signal2_1(p3)
				Signal2(p3.isTransitioning == true)
			end)
			
			return
		end
	end
	
	local function dispatch(p3): boolean
		-- upvalues: DEV (upval), SignalsExperimentalModule (upval), Signal2_1 (copy), p1 (copy), Actions (upval), Signal2 (copy), FFlagSignalsNavPendingLock (upval), Tbl (copy), Signal2_2 (copy), Callback (ref), Signal1 (copy), List (ref), markPending (copy)
		if DEV and p3.type == "RESET_NAVIGATION_FOR_TESTING_ONLY__DO_NOT_USE_IN_PRODUCTION" then
			SignalsExperimentalModule.batch(function()
				-- upvalues: Signal2_1 (upval), p1 (upval), Actions (upval), Signal2 (upval), FFlagSignalsNavPendingLock (upval), Tbl (upval), Signal2_2 (upval)
				Signal2_1((p1.getStateForAction(Actions.init())))
				Signal2(false)
				
				if FFlagSignalsNavPendingLock then
					table.clear(Tbl)
					Signal2_2(next(Tbl) ~= nil)
				end
			end)
			
			return true
		end
		if Callback == nil then
			local SignalResult = Signal1(false)
			local StateForAction = p1.getStateForAction(p3, SignalResult)
			
			if StateForAction ~= nil and StateForAction ~= SignalResult then
				Signal2_1(StateForAction)
			end
			table.insert(List, p3)
			
			return true
		elseif FFlagSignalsNavPendingLock then
			markPending(p3)
			local Flag = false
			task.defer(function()
				-- upvalues: Flag (ref), p3 (copy), Tbl (upval), Signal2_2 (upval)
				if not Flag then
					if p3 == nil then
						table.clear(Tbl)
					else
						if Tbl[p3] ~= nil then
							Tbl[p3] = nil
						end
					end
					Signal2_2(next(Tbl) ~= nil)
				end
			end)
			Callback(p3)
			Flag = true
			
			return true
		else
			local Flag: (any) -> () = Callback
			Flag(p3)
			Flag = true
			
			return Flag
		end
	end
	
	local function v27()
		return nil
	end
	
	local Computed = CreateComputedFunction(function(p3)
		-- upvalues: Signal1 (copy), GetNavigationFunction (upval), p1 (copy), dispatch (copy), t (copy), v27 (ref)
		return GetNavigationFunction(p1, Signal1(p3), dispatch, t, function(_, p4)
			return p4
		end, function()
			-- upvalues: v27 (upval)
			return v27()
		end)
	end)
	v27 = Computed
	
	return {
		dispatch = dispatch,
		notifyEvents = function() end,
		getState = Signal1,
		getNavigation = Computed,
		getIsNavigating = Signal,
		getIsPending = Signal3,
		update = update,
		setDispatch = setDispatch,
		clearDispatch = clearDispatch,
		clearPending = clearPending,
		markPendingCommitted = markPendingCommitted
	}
end