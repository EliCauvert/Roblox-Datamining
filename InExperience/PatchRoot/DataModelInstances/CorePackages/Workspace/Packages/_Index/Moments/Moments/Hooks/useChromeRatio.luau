local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local SignalsModule = require(Parent.Signals)
local GetImmersiveChromeStoreModule = require(Moments.Stores.GetImmersiveChromeStore)
local config = {
	dampingRatio = 1,
	frequency = 3,
	restingVelocityLimit = 0.1,
	restingPositionLimit = 0.1
}

return function() --[[ Line: 29 | Named "useChromeRatio" ]]
	-- upvalues: GetImmersiveChromeStoreModule (copy), ReactOtterModule (copy), ReactModule (copy), SignalsModule (copy), config (copy)
	local ImmersiveChromeStoreModule = GetImmersiveChromeStoreModule(false)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(1)
	ReactModule.useEffect(function() --[[ Line: 34 ]]
		-- upvalues: SignalsModule (upval), ImmersiveChromeStoreModule (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval)
		return (SignalsModule.createEffect(function(p1) --[[ Line: 35 ]]
			-- upvalues: ImmersiveChromeStoreModule (upval), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), config (upval)
			UseAnimatedBindingResult2((ReactOtterModule.spring(if ImmersiveChromeStoreModule.getChromeVisible(p1) then 1 else 0, config)))
		end))
	end, { ImmersiveChromeStoreModule })
	
	return UseAnimatedBindingResult
end