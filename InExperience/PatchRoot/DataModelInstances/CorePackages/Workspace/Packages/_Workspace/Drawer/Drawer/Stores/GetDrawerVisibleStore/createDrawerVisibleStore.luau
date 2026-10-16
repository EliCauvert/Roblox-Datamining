local Parent = script:FindFirstAncestor("Drawer").Parent
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagEnableDrawerAnimatingHook = require(Parent.SharedFlags).FFlagEnableDrawerAnimatingHook

return function() --[[ Line: 20 | Named "createDrawerVisibleStore" ]]
	-- upvalues: SignalsModule (copy), SignalsReactModule (copy), FFlagEnableDrawerAnimatingHook (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	
	local function useDrawerVisible() --[[ Line: 24 ]]
		-- upvalues: SignalsReactModule (upval), Signal (copy)
		return SignalsReactModule.useSignalState(Signal)
	end
	
	local function useDrawerShouldMount() --[[ Line: 28 ]]
		-- upvalues: SignalsReactModule (upval), Signal1 (copy)
		return SignalsReactModule.useSignalState(Signal1)
	end
	
	local function SetDrawerVisible(p1) --[[ Line: 32 ]]
		-- upvalues: Signal2 (copy), Signal2_1 (copy)
		Signal2(p1)
		
		if p1 then
			Signal2_1(true)
		end
	end
	
	local GetDrawerAnimating = nil
	local SetDrawerAnimating = nil
	local UseDrawerAnimating: (() -> any)? = nil
	
	if FFlagEnableDrawerAnimatingHook then
		GetDrawerAnimating, SetDrawerAnimating = SignalsModule.createSignal(false)
		
		UseDrawerAnimating = function() --[[ Line: 42 ]]
			-- upvalues: SignalsReactModule (upval), GetDrawerAnimating (ref)
			return SignalsReactModule.useSignalState(GetDrawerAnimating)
		end
	end
	return {
		getDrawerVisible = Signal,
		getDrawerAnimating = GetDrawerAnimating,
		setDrawerVisible = SetDrawerVisible,
		setDrawerShouldMount = Signal2_1,
		setDrawerAnimating = SetDrawerAnimating,
		useDrawerVisible = useDrawerVisible,
		useDrawerShouldMount = useDrawerShouldMount,
		useDrawerAnimating = UseDrawerAnimating
	}
end