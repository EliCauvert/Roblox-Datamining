local parent = script:FindFirstAncestor("Drawer").Parent
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local fFlagEnableDrawerAnimatingHook = require(parent.SharedFlags).FFlagEnableDrawerAnimatingHook

return function()
	-- upvalues: signalsModule (ref), signalsReactModule (ref), fFlagEnableDrawerAnimatingHook (ref)
	local var1, var2 = signalsModule.createSignal(false)
	local var3, var4 = signalsModule.createSignal(false)
	
	local function useDrawerVisible()
		-- upvalues: signalsReactModule (copy), var1 (ref)
		return signalsReactModule.useSignalState(var1)
	end
	
	local function useDrawerShouldMount()
		-- upvalues: signalsReactModule (copy), var3 (ref)
		return signalsReactModule.useSignalState(var3)
	end
	
	local var5 = function(p1)
		-- upvalues: var2 (ref), var4 (ref)
		var2(p1)
		
		if p1 then
			var4(true)
		end
	end
	
	local var6 = nil
	local var7 = nil
	local var8 = nil
	
	if fFlagEnableDrawerAnimatingHook then
		local var9, var10 = signalsModule.createSignal(false)
		var6 = var9
		var7 = var10
		
		var8 = function()
			-- upvalues: signalsReactModule (copy), var6 (write)
			return signalsReactModule.useSignalState(var6)
		end
	end
	return {
		getDrawerVisible = var1,
		getDrawerAnimating = var6,
		setDrawerVisible = var5,
		setDrawerShouldMount = var4,
		setDrawerAnimating = var7,
		useDrawerVisible = useDrawerVisible,
		useDrawerShouldMount = useDrawerShouldMount,
		useDrawerAnimating = var8
	}
end