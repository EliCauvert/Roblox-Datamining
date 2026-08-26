local profileShareLinks = script:FindFirstAncestor("ProfileShareLinks")
local parent = profileShareLinks.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local networkingModule = require(profileShareLinks.Networking.Networking)

return function()
	-- upvalues: useDispatch (ref), reactModule (ref), networkingModule (ref)
	local var1 = useDispatch()
	
	return reactModule.useCallback(function()
		-- upvalues: var1 (ref), networkingModule (copy)
		return var1(networkingModule.ShareLinksNetworking.GetOrGenerateLink.API({ linkType = "Profile" })):catch(function() end)
	end, { var1 })
end