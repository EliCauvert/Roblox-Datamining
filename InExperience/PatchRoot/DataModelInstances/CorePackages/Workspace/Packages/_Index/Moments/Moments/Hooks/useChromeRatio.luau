local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local signalsModule = require(parent.Signals)
local getImmersiveChromeStoreModule = require(moments.Stores.GetImmersiveChromeStore)
local fFlagMomentsImmersiveChromeModule = require(moments.Flags.FFlagMomentsImmersiveChrome)
local t = {
	dampingRatio = 1,
	frequency = 3,
	restingVelocityLimit = 0.1,
	restingPositionLimit = 0.1
}

return function()
	-- upvalues: fFlagMomentsImmersiveChromeModule (ref), getImmersiveChromeStoreModule (ref), reactOtterModule (ref), reactModule (ref), signalsModule (ref), t (ref)
	local var1 = getImmersiveChromeStoreModule(false)
	local var2, var3 = reactOtterModule.useAnimatedBinding(1)
	reactModule.useEffect(function()
		-- upvalues: fFlagMomentsImmersiveChromeModule (ref), signalsModule (copy), var1 (ref), var3 (ref), reactOtterModule (copy), t (copy)
		if fFlagMomentsImmersiveChromeModule then
			return signalsModule.createEffect(function(p1)
				-- upvalues: var1 (copy), var3 (copy), reactOtterModule (copy), t (copy)
				var3(reactOtterModule.spring(if var1.getChromeVisible(p1) then 1 else 0, t))
			end)
		end
	end, { fFlagMomentsImmersiveChromeModule, var1 })
	
	return var2
end