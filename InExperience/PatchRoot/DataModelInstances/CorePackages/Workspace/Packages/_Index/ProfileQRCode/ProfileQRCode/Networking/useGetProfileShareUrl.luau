local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local createOrGetProfileShareUrlModule = require(profileQRCode.Networking.createOrGetProfileShareUrl)
local useDispatch = require(profileQRCode.Parent.RoactUtils).Hooks.RoactRodux.useDispatch

return function() --[[ line: 7 ]]
	-- upvalues: useDispatch (ref), createOrGetProfileShareUrlModule (ref)
	local var2 = useDispatch()
	
	return function() --[[ line: 10 ]]
		-- upvalues: var2 (ref), createOrGetProfileShareUrlModule (copy)
		return var2(createOrGetProfileShareUrlModule.API()):catch(function() --[[ line: 11 ]] end)
	end
end