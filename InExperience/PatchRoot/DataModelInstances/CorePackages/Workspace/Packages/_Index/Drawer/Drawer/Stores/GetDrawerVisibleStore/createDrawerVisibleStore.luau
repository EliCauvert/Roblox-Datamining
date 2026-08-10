local drawer = script:FindFirstAncestor("Drawer")
local parent = drawer.Parent
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local fFlagEnableDrawerAnimatingHook = require(drawer.Flags).FFlagEnableDrawerAnimatingHook

return function() --[[ line: 18 | named "createDrawerVisibleStore" ]]
	-- upvalues: signalsModule (ref), signalsReactModule (ref), fFlagEnableDrawerAnimatingHook (ref)
	local var3, var4 = signalsModule.createSignal(false)
	local var5, var6 = signalsModule.createSignal(false)
	
	local function useDrawerVisible() --[[ line: 22 ]]
		-- upvalues: signalsReactModule (copy), var3 (ref)
		return signalsReactModule.useSignalState(var3)
	end
	
	local function useDrawerShouldMount() --[[ line: 26 ]]
		-- upvalues: signalsReactModule (copy), var5 (ref)
		return signalsReactModule.useSignalState(var5)
	end
	
	local var9 = function(p0) --[[ line: 30 ]]
		-- upvalues: var4 (ref), var6 (ref)
		var4(p0)
		
		if p0 then
			var6(true)
		end
	end
	
	local var10 = nil
	local var11 = nil
	
	if fFlagEnableDrawerAnimatingHook then
		local var12, var13 = signalsModule.createSignal(false)
		var10 = var12
		var11 = var13
	end
	return {
		getDrawerVisible = var3,
		getDrawerAnimating = var10,
		setDrawerVisible = var9,
		setDrawerShouldMount = var6,
		setDrawerAnimating = var11,
		useDrawerVisible = useDrawerVisible,
		useDrawerShouldMount = useDrawerShouldMount
	}
end