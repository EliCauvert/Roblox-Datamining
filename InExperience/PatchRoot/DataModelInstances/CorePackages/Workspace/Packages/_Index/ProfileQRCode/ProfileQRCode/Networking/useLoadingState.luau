local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local useSelector = require(profileQRCode.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local createOrGetProfileShareUrlModule = require(profileQRCode.Networking.createOrGetProfileShareUrl)

return function() --[[ line: 7 ]]
	-- upvalues: useSelector (ref), createOrGetProfileShareUrlModule (ref)
	return useSelector(function(p0) --[[ line: 8 ]]
		-- upvalues: createOrGetProfileShareUrlModule (copy)
		return createOrGetProfileShareUrlModule.getStatus(p0)
	end)
end