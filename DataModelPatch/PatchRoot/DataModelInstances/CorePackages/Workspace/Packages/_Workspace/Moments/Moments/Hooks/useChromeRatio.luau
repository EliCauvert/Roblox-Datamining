local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local SignalsModule = require(Parent.Signals)
local GetImmersiveChromeStoreModule = require(Moments.Stores.GetImmersiveChromeStore)
local GetFFlagMomentsImmersiveChromeModule = require(Moments.Flags.GetFFlagMomentsImmersiveChrome)
local config = {
	dampingRatio = 1,
	frequency = 3,
	restingVelocityLimit = 0.1,
	restingPositionLimit = 0.1
}

return function()
	-- upvalues: GetFFlagMomentsImmersiveChromeModule (copy), GetImmersiveChromeStoreModule (copy), ReactOtterModule (copy), ReactModule (copy), SignalsModule (copy), config (copy)
	local FFlagMomentsImmersiveChromeModule = GetFFlagMomentsImmersiveChromeModule()
	local ImmersiveChromeStoreModule = GetImmersiveChromeStoreModule(false)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(1)
	ReactModule.useEffect(function()
		-- upvalues: FFlagMomentsImmersiveChromeModule (copy), SignalsModule (upval), ImmersiveChromeStoreModule (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval)
		if not FFlagMomentsImmersiveChromeModule then return end
		return (SignalsModule.createEffect(function(p1)
			-- upvalues: ImmersiveChromeStoreModule (upval), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), config (upval)
			UseAnimatedBindingResult2((ReactOtterModule.spring(if ImmersiveChromeStoreModule.getChromeVisible(p1) then 1 else 0, config)))
		end))
	end, {
		FFlagMomentsImmersiveChromeModule,
		ImmersiveChromeStoreModule
	})
	
	return UseAnimatedBindingResult
end