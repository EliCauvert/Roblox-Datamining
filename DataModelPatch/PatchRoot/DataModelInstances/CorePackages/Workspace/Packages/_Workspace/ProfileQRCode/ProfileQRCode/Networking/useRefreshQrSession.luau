local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local UseDispatchFunction = require(ProfileQRCode.Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local RefreshQrSessionModule = require(ProfileQRCode.Networking.refreshQrSession)

return function()
	-- upvalues: UseDispatchFunction (copy), RefreshQrSessionModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return function()
		-- upvalues: UseDispatchResult (copy), RefreshQrSessionModule (upval)
		return UseDispatchResult(RefreshQrSessionModule.API()):catch(function() end)
	end
end