local Parent = script.Parent.Parent
local RoactNavigationModule = require(Parent.RoactNavigation)
local GetNavigationFunction = RoactNavigationModule.getNavigation
local Actions = RoactNavigationModule.Actions
local Events = RoactNavigationModule.Events
local SignalsModule = require(Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local FFlagSignalsNavP2NavigationPrimitives = require(Parent.SharedFlags).FFlagSignalsNavP2NavigationPrimitives
local DEV = _G.__DEV__ or _G.__TESTEZ_RUNNING_TEST__
local _ = require(script.Parent.types)

local function _(Action, State, LastState)
	-- upvalues: Events (copy)
	return table.freeze({
		type = Events.Action,
		action = Action,
		state = State,
		lastState = LastState
	})
end

return function(p1)
	-- upvalues: CreateSignalFunction (copy), FFlagSignalsNavP2NavigationPrimitives (copy), Actions (copy), Events (copy), DEV (copy), SignalsExperimentalModule (copy), CreateComputedFunction (copy), GetNavigationFunction (copy)
	local Callbacks = {}
	local List = {}
	local Signal, Signal2 = CreateSignalFunction(false)
	
	local function _(p2)
		-- upvalues: Callbacks (copy)
		for callback in Callbacks do
			task.spawn(callback, p2)
		end
	end
	
	local function notifyEvents()
		-- upvalues: FFlagSignalsNavP2NavigationPrimitives (upval), Signal2 (copy), List (ref), Callbacks (copy)
		if FFlagSignalsNavP2NavigationPrimitives then
			Signal2(false)
		end
		local List1 = List
		List = {}
		
		for _, value in List1 do
			for callback in Callbacks do
				task.spawn(callback, value)
			end
		end
	end
	
	local Signal1, Signal2_1 = CreateSignalFunction(function()
		-- upvalues: Actions (upval), p1 (copy), Events (upval), List (ref)
		local InitResult = Actions.init()
		local StateForAction = p1.getStateForAction(InitResult)
		table.insert(List, (table.freeze({
			lastState = nil,
			type = Events.Action,
			action = InitResult,
			state = StateForAction
		})))
		
		return StateForAction
	end)
	
	local function dispatch(Action): boolean
		-- upvalues: DEV (upval), FFlagSignalsNavP2NavigationPrimitives (upval), Signal2 (copy), Signal2_1 (copy), p1 (copy), Actions (upval), Signal1 (copy), Events (upval), Callbacks (copy), List (ref), SignalsExperimentalModule (upval)
		if DEV and Action.type == "RESET_NAVIGATION_FOR_TESTING_ONLY__DO_NOT_USE_IN_PRODUCTION" then
			if FFlagSignalsNavP2NavigationPrimitives then
				Signal2(false)
			end
			Signal2_1((p1.getStateForAction(Actions.init())))
			
			return true
		else
			local SignalResult = Signal1(false)
			local StateForAction = p1.getStateForAction(Action, SignalResult)
			local StateForAction1 = StateForAction or SignalResult
			local Frozen = table.freeze({
				type = Events.Action,
				action = Action,
				state = StateForAction1,
				lastState = SignalResult
			})
			
			if StateForAction == nil or StateForAction1 == SignalResult then
				for callback in Callbacks do
					task.spawn(callback, Frozen)
				end
				return StateForAction == nil
			else
				table.insert(List, Frozen)
				
				if FFlagSignalsNavP2NavigationPrimitives then
					SignalsExperimentalModule.batch(function()
						-- upvalues: Signal2 (upval), Signal2_1 (upval), StateForAction1 (copy)
						Signal2(true)
						Signal2_1(StateForAction1)
					end)
				else
					Signal2_1(StateForAction1)
				end
				return true
			end
		end
	end
	
	local function v19()
		return nil
	end
	
	local Computed = CreateComputedFunction(function(p3)
		-- upvalues: Signal1 (copy), GetNavigationFunction (upval), p1 (copy), dispatch (copy), Callbacks (copy), v19 (ref)
		return GetNavigationFunction(p1, Signal1(p3), dispatch, Callbacks, function(_, p4)
			return p4
		end, function()
			-- upvalues: v19 (upval)
			return v19()
		end)
	end)
	v19 = Computed
	
	return {
		dispatch = dispatch,
		notifyEvents = notifyEvents,
		getState = Signal1,
		getNavigation = Computed,
		getIsNavigating = Signal
	}
end