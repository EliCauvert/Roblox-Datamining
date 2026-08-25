local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local createOrGetProfileShareUrlModule = require(profileQRCode.Networking.createOrGetProfileShareUrl)
local useDispatch = require(profileQRCode.Parent.RoactUtils).Hooks.RoactRodux.useDispatch

return function()
	-- upvalues: useDispatch (ref), createOrGetProfileShareUrlModule (ref)
	local var2 = useDispatch()
	
	return function()
		-- upvalues: var2 (ref), createOrGetProfileShareUrlModule (copy)
		return var2(createOrGetProfileShareUrlModule.API()):catch(function() end)
	end
end