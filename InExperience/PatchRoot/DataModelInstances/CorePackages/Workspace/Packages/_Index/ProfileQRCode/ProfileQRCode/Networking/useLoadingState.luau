local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local useSelector = require(profileQRCode.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local createOrGetProfileShareUrlModule = require(profileQRCode.Networking.createOrGetProfileShareUrl)

return function()
	-- upvalues: useSelector (ref), createOrGetProfileShareUrlModule (ref)
	return useSelector(function(p0)
		-- upvalues: createOrGetProfileShareUrlModule (copy)
		return createOrGetProfileShareUrlModule.getStatus(p0)
	end)
end