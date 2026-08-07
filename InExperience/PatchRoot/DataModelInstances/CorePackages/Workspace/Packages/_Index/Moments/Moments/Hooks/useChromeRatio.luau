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

return function() --[[ line: 32 | named "useChromeRatio" ]]
	-- upvalues: fFlagMomentsImmersiveChromeModule (ref), getImmersiveChromeStoreModule (ref), reactOtterModule (ref), reactModule (ref), signalsModule (ref), t (ref)
	local var7 = getImmersiveChromeStoreModule(false)
	local var8, var9 = reactOtterModule.useAnimatedBinding(1)
	reactModule.useEffect(function() --[[ line: 38 ]]
		-- upvalues: fFlagMomentsImmersiveChromeModule (ref), signalsModule (copy), var7 (ref), var9 (ref), reactOtterModule (copy), t (copy)
		if fFlagMomentsImmersiveChromeModule then
			return signalsModule.createEffect(function(p0) --[[ line: 42 ]]
				-- upvalues: var7 (copy), var9 (copy), reactOtterModule (copy), t (copy)
				var9(reactOtterModule.spring(if var7.getChromeVisible(p0) then 1 else 0, t))
			end)
		end
	end, { fFlagMomentsImmersiveChromeModule, var7 })
	
	return var8
end