local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local useDispatch = require(profileQRCode.Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local refreshQrSessionModule = require(profileQRCode.Networking.refreshQrSession)

return function()
	-- upvalues: useDispatch (ref), refreshQrSessionModule (ref)
	local var1 = useDispatch()
	
	return function()
		-- upvalues: var1 (ref), refreshQrSessionModule (copy)
		return var1(refreshQrSessionModule.API()):catch(function() end)
	end
end