local profileShareLinks = script:FindFirstAncestor("ProfileShareLinks")
local parent = profileShareLinks.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local networkingModule = require(profileShareLinks.Networking.Networking)

return function()
	-- upvalues: useDispatch (ref), reactModule (ref), networkingModule (ref)
	local var3 = useDispatch()
	
	return reactModule.useCallback(function()
		-- upvalues: var3 (ref), networkingModule (copy)
		return var3(networkingModule.ShareLinksNetworking.GetOrGenerateLink.API({ linkType = "Profile" })):catch(function() end)
	end, { var3 })
end