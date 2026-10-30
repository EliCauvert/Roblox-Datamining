local Parent = script:FindFirstAncestor("SplitPane").Parent
local SignalsModule = require(Parent.Signals)
local OnScreenStoreModule = require(script.Parent.Parent.Stores.OnScreenStore)
local RouteIdentityModule = require(script.Parent.routeIdentity)
local GetRouteKeyIsInNavigationStateFunction = require(Parent.Navigation).getRouteKeyIsInNavigationState

local function createNavigationHandle(Callback, Callback3, Callback1)
	-- upvalues: SignalsModule (copy), GetRouteKeyIsInNavigationStateFunction (copy), OnScreenStoreModule (copy), RouteIdentityModule (copy)
	local Callback4 = if type(Callback3) == "string" then Callback3 else nil
	local Signal, Signal2 = SignalsModule.createSignal(Callback4)
	local Callback5 = if type(Callback3) == "function" then Callback3 else nil
	local Computed = SignalsModule.createComputed(function(p1)
		-- upvalues: Signal (copy), Callback (copy), GetRouteKeyIsInNavigationStateFunction (upval)
		local SignalResult = Signal(p1)
		local CallbackResult = Callback(p1)
		
		return SignalResult ~= nil and (CallbackResult ~= nil and GetRouteKeyIsInNavigationStateFunction(SignalResult, CallbackResult))
	end)
	local Computed1 = SignalsModule.createComputed(function(p1): boolean
		-- upvalues: Signal (copy), Callback (copy), OnScreenStoreModule (upval), RouteIdentityModule (upval)
		local SignalResult = Signal(p1)
		local CallbackResult = Callback(p1)
		
		if SignalResult == nil or CallbackResult == nil then
			return false
		else
			local RouteOnScreen = OnScreenStoreModule.getRouteOnScreen(p1, SignalResult)
			
			return if RouteOnScreen == nil then RouteIdentityModule.findOnFocusedPath(CallbackResult, function(p2): boolean
				-- upvalues: SignalResult (copy)
				return p2.key == SignalResult
			end) ~= nil else RouteOnScreen.isOnScreen == true
		end
	end)
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	local Computed2 = SignalsModule.createComputed(function(p1): boolean
		-- upvalues: Signal1 (copy), Computed (copy)
		return Signal1(p1) and not Computed(p1)
	end)
	local Effects = {}
	local Flag = false
	
	local function destroy()
		-- upvalues: Flag (ref), Effects (copy), Callback1 (copy)
		if Flag then return end
		Flag = true
		
		for _, effect in Effects do
			effect()
		end
		if Callback1 ~= nil then
			Callback1()
		end
	end
	
	local config = {
		key = Callback4,
		isOpen = function(p1)
			-- upvalues: Flag (ref), Computed (copy)
			return not Flag and Computed(p1)
		end,
		isFocused = function(p1)
			-- upvalues: Flag (ref), Computed1 (copy)
			return not Flag and Computed1(p1)
		end,
		onClosed = function(Callback: () -> ())
			-- upvalues: Computed2 (copy), Flag (ref), SignalsModule (upval), Effects (copy)
			if Computed2(false) then
				Callback()
				
				return function() end
			elseif Flag then
				return function() end
			else
				local Callback1 = nil
				Callback1 = SignalsModule.createEffect(function(p1)
					-- upvalues: Computed2 (upval), Callback (copy), Callback1 (ref)
					if Computed2(p1) then
						Callback()
						task.defer(function()
							-- upvalues: Callback1 (upval)
							Callback1()
						end)
					end
				end)
				table.insert(Effects, Callback1)
				
				return Callback1
			end
		end,
		onFocusChanged = function(Callback)
			-- upvalues: Flag (ref), Computed1 (copy), SignalsModule (upval), Effects (copy)
			if Flag then
				return function() end
			else
				local ComputedResult = Computed1(false)
				local Effect = SignalsModule.createEffect(function(p1)
					-- upvalues: Computed1 (upval), ComputedResult (ref), Callback (copy)
					local ComputedResult1 = Computed1(p1)
					
					if ComputedResult1 ~= ComputedResult then
						ComputedResult = ComputedResult1
						Callback(ComputedResult1)
					end
				end)
				table.insert(Effects, Effect)
				
				return Effect
			end
		end,
		destroy = destroy
	}
	
	if Callback5 ~= nil then
		local Callback2 = nil
		Callback2 = SignalsModule.createEffect(function(p1)
			-- upvalues: Signal (copy), RouteIdentityModule (upval), Callback (copy), Callback5 (copy), Signal2 (copy), config (copy), Callback2 (ref)
			if Signal(false) ~= nil then return end
			local OnFocusedPath = RouteIdentityModule.findOnFocusedPath(Callback(p1), Callback5)
			
			if OnFocusedPath ~= nil then
				Signal2(OnFocusedPath.key)
				config.key = OnFocusedPath.key
				task.defer(function()
					-- upvalues: Callback2 (upval)
					Callback2()
				end)
			end
		end)
		table.insert(Effects, Callback2)
	end
	table.insert(Effects, SignalsModule.createEffect(function(p1)
		-- upvalues: Computed (copy), Signal2_1 (copy)
		if Computed(p1) then
			Signal2_1(true)
		end
	end))
	table.insert(Effects, SignalsModule.createEffect(function(p1)
		-- upvalues: Computed2 (copy), destroy (copy)
		if Computed2(p1) then
			task.defer(destroy)
		end
	end))
	
	return config
end

return {
	new = createNavigationHandle,
	fromRoduxStore = function(p1, p2)
		-- upvalues: SignalsModule (copy), createNavigationHandle (copy)
		local function _()
			-- upvalues: p1 (copy)
			local Navigation = p1:getState().Navigation
			
			return if Navigation then Navigation.roactNavigationState else nil
		end
		
		local Navigation = p1:getState().Navigation
		local Signal, Signal2 = SignalsModule.createSignal(if Navigation then Navigation.roactNavigationState else nil)
		local ChangedConnection = if p1.changed == nil then nil else p1.changed:connect(function()
			-- upvalues: Signal2 (copy), p1 (copy)
			local Navigation = p1:getState().Navigation
			Signal2(if Navigation then Navigation.roactNavigationState else nil)
		end)
		
		return (createNavigationHandle(Signal, p2, function()
			-- upvalues: ChangedConnection (copy)
			if ChangedConnection ~= nil then
				ChangedConnection:disconnect()
			end
		end))
	end
}