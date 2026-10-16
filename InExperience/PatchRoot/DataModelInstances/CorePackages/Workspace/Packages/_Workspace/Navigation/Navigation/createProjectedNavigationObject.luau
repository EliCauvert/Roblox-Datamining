local Parent = script.Parent.Parent
local RoactNavigationModule = require(Parent.RoactNavigation)
local GetNavigationFunction = RoactNavigationModule.getNavigation
local Actions = RoactNavigationModule.Actions
local SignalsModule = require(Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local _ = require(script.Parent.types)
local DEV = _G.__DEV__ or _G.__TESTEZ_RUNNING_TEST__

return function(p1) --[[ Line: 44 | Named "createProjectedNavigationObject" ]]
	-- upvalues: CreateSignalFunction (copy), Actions (copy), SignalsExperimentalModule (copy), DEV (copy), CreateComputedFunction (copy), GetNavigationFunction (copy)
	local t = {}
	local Signal, Signal2 = CreateSignalFunction(false)
	local Signal1, Signal2_1 = CreateSignalFunction(function() --[[ Line: 52 ]]
		-- upvalues: p1 (copy), Actions (upval)
		return (p1.getStateForAction(Actions.init()))
	end)
	local Callback = nil
	local List = {}
	
	local function setDispatch(Callback1: (any) -> ()) --[[ Line: 61 ]]
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
	
	local function clearDispatch() --[[ Line: 72 ]]
		-- upvalues: Callback (ref)
		Callback = nil
	end
	
	local function update(p2) --[[ Line: 79 ]]
		-- upvalues: SignalsExperimentalModule (upval), Signal2_1 (copy), Signal2 (copy)
		if p2 ~= nil then
			SignalsExperimentalModule.batch(function() --[[ Line: 83 ]]
				-- upvalues: Signal2_1 (upval), p2 (copy), Signal2 (upval)
				Signal2_1(p2)
				Signal2(p2.isTransitioning == true)
			end)
			
			return
		end
	end
	
	local function dispatch(p2): boolean --[[ Line: 94 ]]
		-- upvalues: DEV (upval), SignalsExperimentalModule (upval), Signal2_1 (copy), p1 (copy), Actions (upval), Signal2 (copy), Callback (ref), Signal1 (copy), List (ref)
		if DEV and p2.type == "RESET_NAVIGATION_FOR_TESTING_ONLY__DO_NOT_USE_IN_PRODUCTION" then
			SignalsExperimentalModule.batch(function() --[[ Line: 96 ]]
				-- upvalues: Signal2_1 (upval), p1 (upval), Actions (upval), Signal2 (upval)
				Signal2_1((p1.getStateForAction(Actions.init())))
				Signal2(false)
			end)
			
			return true
		end
		if Callback ~= nil then
			Callback(p2)
			
			return true
		end
		local SignalResult = Signal1(false)
		local StateForAction = p1.getStateForAction(p2, SignalResult)
		
		if StateForAction ~= nil and StateForAction ~= SignalResult then
			Signal2_1(StateForAction)
		end
		table.insert(List, p2)
		
		return true
	end
	
	local function v17() --[[ Line: 123 ]]
		return nil
	end
	
	local Computed = CreateComputedFunction(function(p2) --[[ Line: 126 ]]
		-- upvalues: Signal1 (copy), GetNavigationFunction (upval), p1 (copy), dispatch (copy), t (copy), v17 (ref)
		return GetNavigationFunction(p1, Signal1(p2), dispatch, t, function(_, p3) --[[ Line: 128 ]]
			return p3
		end, function() --[[ Line: 130 ]]
			-- upvalues: v17 (upval)
			return v17()
		end)
	end)
	v17 = Computed
	
	return {
		dispatch = dispatch,
		notifyEvents = function() --[[ Line: 118 ]] end,
		getState = Signal1,
		getNavigation = Computed,
		getIsNavigating = Signal,
		update = update,
		setDispatch = setDispatch,
		clearDispatch = clearDispatch
	}
end