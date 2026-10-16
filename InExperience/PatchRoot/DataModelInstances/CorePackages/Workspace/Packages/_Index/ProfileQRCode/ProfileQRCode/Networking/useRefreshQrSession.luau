local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local UseDispatchFunction = require(ProfileQRCode.Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local RefreshQrSessionModule = require(ProfileQRCode.Networking.refreshQrSession)

return function() --[[ Line: 8 ]]
	-- upvalues: UseDispatchFunction (copy), RefreshQrSessionModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return function() --[[ Line: 11 ]]
		-- upvalues: UseDispatchResult (copy), RefreshQrSessionModule (upval)
		return UseDispatchResult(RefreshQrSessionModule.API()):catch(function() --[[ Line: 12 ]] end)
	end
end