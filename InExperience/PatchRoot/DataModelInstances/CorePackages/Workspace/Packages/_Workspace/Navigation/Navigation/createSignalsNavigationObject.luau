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

local function _(p0, p1, p2)
	-- upvalues: events (ref)
	return table.freeze({
		type = events.Action,
		action = p0,
		state = p1,
		lastState = p2
	})
end

return function(value)
	-- upvalues: createSignal (ref), fFlagSignalsNavP2NavigationPrimitives (ref), actions (ref), events (ref), dEV (ref), signalsExperimentalModule (ref), createComputed (ref), getNavigation (ref)
	local t = {}
	local t_1 = {}
	local var6, var7 = createSignal(false)
	
	local function _(p3)
		-- upvalues: t (ref)
		for i in t do
			task.spawn(i, p3)
		end
	end
	
	local function notifyEvents()
		-- upvalues: fFlagSignalsNavP2NavigationPrimitives (copy), var7 (ref), t_1 (write), t (ref)
		if fFlagSignalsNavP2NavigationPrimitives then
			var7(false)
		end
		t_1 = {}
		
		for i, v in t_1 do
			for i_1 in t do
				task.spawn(i_1, v)
			end
		end
	end
	
	local var9, var10 = createSignal(function()
		-- upvalues: actions (copy), value (ref), events (copy), t_1 (write)
		local var14 = actions.init()
		local stateForAction = value.getStateForAction(var14)
		table.insert(t_1, table.freeze({
			lastState = nil,
			type = events.Action,
			action = var14,
			state = stateForAction
		}))
		
		return stateForAction
	end)
	
	local function dispatch(p4)
		-- upvalues: dEV (copy), fFlagSignalsNavP2NavigationPrimitives (copy), var7 (ref), var10 (ref), value (ref), actions (copy), var9 (ref), events (copy), t (ref), t_1 (write), signalsExperimentalModule (copy)
		if dEV and p4.type == "RESET_NAVIGATION_FOR_TESTING_ONLY__DO_NOT_USE_IN_PRODUCTION" then
			if fFlagSignalsNavP2NavigationPrimitives then
				var7(false)
			end
			var10(value.getStateForAction(actions.init()))
			
			return true
		else
			local var16 = var9(false)
			local stateForAction = value.getStateForAction(p4, var16)
			local stateForAction_1 = stateForAction or var16
			local frozen = table.freeze({
				type = events.Action,
				action = p4,
				state = stateForAction_1,
				lastState = var16
			})
			
			if stateForAction == nil or stateForAction_1 == var16 then
				for i in t do
					task.spawn(i, frozen)
				end
				return stateForAction == nil
			else
				table.insert(t_1, frozen)
				
				if fFlagSignalsNavP2NavigationPrimitives then
					signalsExperimentalModule.batch(function()
						-- upvalues: var7 (copy), var10 (copy), stateForAction_1 (ref)
						var7(true)
						var10(stateForAction_1)
					end)
				else
					var10(stateForAction_1)
				end
				return true
			end
		end
	end
	
	local var12 = function()
		return nil
	end
	
	local var13 = createComputed(function(p5)
		-- upvalues: var9 (ref), getNavigation (copy), value (ref), dispatch (ref), t (ref), var12 (write)
		return getNavigation(value, var9(p5), dispatch, t, function(_, p6)
			return p6
		end, function()
			-- upvalues: var12 (copy)
			return var12()
		end)
	end)
	var12 = var13
	
	return {
		dispatch = dispatch,
		notifyEvents = notifyEvents,
		getState = var9,
		getNavigation = var13,
		getIsNavigating = var6
	}
end