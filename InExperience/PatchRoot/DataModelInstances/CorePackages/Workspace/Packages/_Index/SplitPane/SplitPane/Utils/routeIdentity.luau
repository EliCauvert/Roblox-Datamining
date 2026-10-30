local Parent = script:FindFirstAncestor("SplitPane").Parent
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local _ = require(Parent.Navigation)
local AppNavigationRegistry = require(Parent.RobloxAppNavigation).AppNavigationRegistry

local function _(p1)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), AppNavigationRegistry (copy)
	if FFlagSignalsNavP3Dispatch then
		return if AppNavigationRegistry.isRegistered() then AppNavigationRegistry.get().getState(false) else nil
	else
		local Navigation = p1:getState().Navigation
		
		return if Navigation == nil then nil else Navigation.roactNavigationState
	end
end

local _ = function(p1, p2): boolean
	if p1.routeName == p2.name then
		local Params = p1.params
		
		return tostring(if Params == nil then nil else Params.detail) == tostring(p2.detail)
	else
		return false
	end
end

local function findOnFocusedPath(State, Callback)
	local State1 = State
	while State1 ~= nil do
		if Callback(State1) then
			return State1
		end
		local Routes = State1.routes
		
		if Routes == nil then
			return nil
		end
		State1 = Routes[State1.index]
	end
	return nil
end

return {
	findOnFocusedPath = findOnFocusedPath,
	findOpenRouteIdentity = function(p1, p2)
		-- upvalues: findOnFocusedPath (copy), FFlagSignalsNavP3Dispatch (copy), AppNavigationRegistry (copy)
		local State = nil
		if FFlagSignalsNavP3Dispatch then
			State = if AppNavigationRegistry.isRegistered() then AppNavigationRegistry.get().getState(false) else nil
		else
			local Navigation = p1:getState().Navigation
			State = if Navigation == nil then nil else Navigation.roactNavigationState
		end
		return (findOnFocusedPath(State, function(p3): boolean
			-- upvalues: p2 (copy)
			if p3.routeName == p2.name then
				local Params = p3.params
				
				return tostring(if Params == nil then nil else Params.detail) == tostring(p2.detail)
			else
				return false
			end
		end))
	end,
	snapshotRouteKeys = function(p1)
		-- upvalues: FFlagSignalsNavP3Dispatch (copy), AppNavigationRegistry (copy)
		local t = {}
		
		local function visit(p2)
			-- upvalues: t (copy), visit (copy)
			if p2 == nil then return end
			if p2.key ~= nil then
				t[p2.key] = true
			end
			if p2.routes ~= nil then
				for _, route in p2.routes do
					visit(route)
				end
			end
		end
		local State = nil
		
		if FFlagSignalsNavP3Dispatch then
			State = if AppNavigationRegistry.isRegistered() then AppNavigationRegistry.get().getState(false) else nil
		else
			local Navigation = p1:getState().Navigation
			State = if Navigation == nil then nil else Navigation.roactNavigationState
		end
		if State == nil then
			return t
		end
		if State.key ~= nil then
			t[State.key] = true
		end
		if State.routes ~= nil then
			for _, route in State.routes do
				visit(route)
			end
		end
		return t
	end
}