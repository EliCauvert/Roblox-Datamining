local profileShareLinks = script:FindFirstAncestor("ProfileShareLinks")
local parent = profileShareLinks.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local networkingModule = require(profileShareLinks.Networking.Networking)

return function() --[[ line: 12 ]]
	-- upvalues: useDispatch (ref), reactModule (ref), networkingModule (ref)
	local var3 = useDispatch()
	
	return reactModule.useCallback(function() --[[ line: 15 ]]
		-- upvalues: var3 (ref), networkingModule (copy)
		return var3(networkingModule.ShareLinksNetworking.GetOrGenerateLink.API({ linkType = "Profile" })):catch(function() --[[ line: 17 ]] end)
	end, { var3 })
end