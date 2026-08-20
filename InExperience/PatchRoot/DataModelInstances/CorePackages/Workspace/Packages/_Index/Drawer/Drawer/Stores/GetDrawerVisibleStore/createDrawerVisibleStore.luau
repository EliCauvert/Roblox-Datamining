local parent = script:FindFirstAncestor("Drawer").Parent
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local fFlagEnableDrawerAnimatingHook = require(parent.SharedFlags).FFlagEnableDrawerAnimatingHook

return function() --[[ line: 20 | named "createDrawerVisibleStore" ]]
	-- upvalues: signalsModule (ref), signalsReactModule (ref), fFlagEnableDrawerAnimatingHook (ref)
	local var2, var3 = signalsModule.createSignal(false)
	local var4, var5 = signalsModule.createSignal(false)
	
	local function useDrawerVisible() --[[ line: 24 ]]
		-- upvalues: signalsReactModule (copy), var2 (ref)
		return signalsReactModule.useSignalState(var2)
	end
	
	local function useDrawerShouldMount() --[[ line: 28 ]]
		-- upvalues: signalsReactModule (copy), var4 (ref)
		return signalsReactModule.useSignalState(var4)
	end
	
	local var8 = function(p0) --[[ line: 32 ]]
		-- upvalues: var3 (ref), var5 (ref)
		var3(p0)
		
		if p0 then
			var5(true)
		end
	end
	
	local var9 = nil
	local var10 = nil
	local var11 = nil
	
	if fFlagEnableDrawerAnimatingHook then
		local var12, var13 = signalsModule.createSignal(false)
		var9 = var12
		var10 = var13
		
		var11 = function() --[[ line: 42 ]]
			-- upvalues: signalsReactModule (copy), var9 (write)
			return signalsReactModule.useSignalState(var9)
		end
	end
	return {
		getDrawerVisible = var2,
		getDrawerAnimating = var9,
		setDrawerVisible = var8,
		setDrawerShouldMount = var5,
		setDrawerAnimating = var10,
		useDrawerVisible = useDrawerVisible,
		useDrawerShouldMount = useDrawerShouldMount,
		useDrawerAnimating = var11
	}
end