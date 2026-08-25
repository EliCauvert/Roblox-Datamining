local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local useDispatch = require(profileQRCode.Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local refreshQrSessionModule = require(profileQRCode.Networking.refreshQrSession)

return function()
	-- upvalues: useDispatch (ref), refreshQrSessionModule (ref)
	local var2 = useDispatch()
	
	return function()
		-- upvalues: var2 (ref), refreshQrSessionModule (copy)
		return var2(refreshQrSessionModule.API()):catch(function() end)
	end
end