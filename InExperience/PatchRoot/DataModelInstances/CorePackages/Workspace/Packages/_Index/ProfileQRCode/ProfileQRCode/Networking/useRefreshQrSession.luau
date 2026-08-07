local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local useDispatch = require(profileQRCode.Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local refreshQrSessionModule = require(profileQRCode.Networking.refreshQrSession)

return function() --[[ line: 8 ]]
	-- upvalues: useDispatch (ref), refreshQrSessionModule (ref)
	local var2 = useDispatch()
	
	return function() --[[ line: 11 ]]
		-- upvalues: var2 (ref), refreshQrSessionModule (copy)
		return var2(refreshQrSessionModule.API()):catch(function() --[[ line: 12 ]] end)
	end
end