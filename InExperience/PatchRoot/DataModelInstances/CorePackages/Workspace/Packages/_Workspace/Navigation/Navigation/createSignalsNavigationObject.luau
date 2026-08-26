local parent = script.Parent.Parent
local roactNavigationModule = require(parent.RoactNavigation)
local getNavigation = roactNavigationModule.getNavigation
local actions = roactNavigationModule.Actions
local events = roactNavigationModule.Events
local signalsModule = require(parent.Signals)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local signalsExperimentalModule = require(parent.SignalsExperimental)
local fFlagSignalsNavP2NavigationPrimitives = require(parent.SharedFlags).FFlagSignalsNavP2NavigationPrimitives
local dEV = _G.__DEV__ or _G.__TESTEZ_RUNNING_TEST__
local _ = require(script.Parent.types)

local function _(p1, p2, p3)
	-- upvalues: events (ref)
	return table.freeze({
		type = events.Action,
		action = p1,
		state = p2,
		lastState = p3
	})
end

return function(value)
	-- upvalues: createSignal (ref), fFlagSignalsNavP2NavigationPrimitives (ref), actions (ref), events (ref), dEV (ref), signalsExperimentalModule (ref), createComputed (ref), getNavigation (ref)
	local t = {}
	local t_1 = {}
	local var1, var2 = createSignal(false)
	
	local function _(p1)
		-- upvalues: t (ref)
		for i in t do
			task.spawn(i, p1)
		end
	end
	
	local function notifyEvents()
		-- upvalues: fFlagSignalsNavP2NavigationPrimitives (copy), var2 (ref), t_1 (write), t (ref)
		if fFlagSignalsNavP2NavigationPrimitives then
			var2(false)
		end
		t_1 = {}
		
		for i, v in t_1 do
			for i_1 in t do
				task.spawn(i_1, v)
			end
		end
	end
	
	local var3, var4 = createSignal(function()
		-- upvalues: actions (copy), value (ref), events (copy), t_1 (write)
		local var5 = actions.init()
		local stateForAction = value.getStateForAction(var5)
		table.insert(t_1, table.freeze({
			lastState = nil,
			type = events.Action,
			action = var5,
			state = stateForAction
		}))
		
		return stateForAction
	end)
	
	local function dispatch(p2)
		-- upvalues: dEV (copy), fFlagSignalsNavP2NavigationPrimitives (copy), var2 (ref), var4 (ref), value (ref), actions (copy), var3 (ref), events (copy), t (ref), t_1 (write), signalsExperimentalModule (copy)
		if dEV and p2.type == "RESET_NAVIGATION_FOR_TESTING_ONLY__DO_NOT_USE_IN_PRODUCTION" then
			if fFlagSignalsNavP2NavigationPrimitives then
				var2(false)
			end
			var4(value.getStateForAction(actions.init()))
			
			return true
		else
			local var5 = var3(false)
			local stateForAction = value.getStateForAction(p2, var5)
			local stateForAction_1 = stateForAction or var5
			local frozen = table.freeze({
				type = events.Action,
				action = p2,
				state = stateForAction_1,
				lastState = var5
			})
			
			if stateForAction == nil or stateForAction_1 == var5 then
				for i in t do
					task.spawn(i, frozen)
				end
				return stateForAction == nil
			else
				table.insert(t_1, frozen)
				
				if fFlagSignalsNavP2NavigationPrimitives then
					signalsExperimentalModule.batch(function()
						-- upvalues: var2 (copy), var4 (copy), stateForAction_1 (ref)
						var2(true)
						var4(stateForAction_1)
					end)
				else
					var4(stateForAction_1)
				end
				return true
			end
		end
	end
	
	local var6 = function()
		return nil
	end
	
	local var7 = createComputed(function(p3)
		-- upvalues: var3 (ref), getNavigation (copy), value (ref), dispatch (ref), t (ref), var6 (write)
		return getNavigation(value, var3(p3), dispatch, t, function(_, p4)
			return p4
		end, function()
			-- upvalues: var6 (copy)
			return var6()
		end)
	end)
	var6 = var7
	
	return {
		dispatch = dispatch,
		notifyEvents = notifyEvents,
		getState = var3,
		getNavigation = var7,
		getIsNavigating = var1
	}
end