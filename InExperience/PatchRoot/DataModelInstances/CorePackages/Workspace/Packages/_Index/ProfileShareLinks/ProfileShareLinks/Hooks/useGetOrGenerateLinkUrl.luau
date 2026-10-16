local ProfileShareLinks = script:FindFirstAncestor("ProfileShareLinks")
local Parent = ProfileShareLinks.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local NetworkingModule = require(ProfileShareLinks.Networking.Networking)

return function() --[[ Line: 12 ]]
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), NetworkingModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return (ReactModule.useCallback(function() --[[ Line: 15 ]]
		-- upvalues: UseDispatchResult (copy), NetworkingModule (upval)
		return UseDispatchResult(NetworkingModule.ShareLinksNetworking.GetOrGenerateLink.API({ linkType = "Profile" })):catch(function() --[[ Line: 17 ]] end)
	end, { UseDispatchResult }))
end