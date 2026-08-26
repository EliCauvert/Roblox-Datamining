local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local useSelector = require(profileQRCode.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local createOrGetProfileShareUrlModule = require(profileQRCode.Networking.createOrGetProfileShareUrl)

return function()
	-- upvalues: useSelector (ref), createOrGetProfileShareUrlModule (ref)
	return useSelector(function(p1)
		-- upvalues: createOrGetProfileShareUrlModule (copy)
		return createOrGetProfileShareUrlModule.getStatus(p1)
	end)
end