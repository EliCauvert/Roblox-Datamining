local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local CreateOrGetProfileShareUrlModule = require(ProfileQRCode.Networking.createOrGetProfileShareUrl)
local UseDispatchFunction = require(ProfileQRCode.Parent.RoactUtils).Hooks.RoactRodux.useDispatch

return function() --[[ Line: 7 ]]
	-- upvalues: UseDispatchFunction (copy), CreateOrGetProfileShareUrlModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return function() --[[ Line: 10 ]]
		-- upvalues: UseDispatchResult (copy), CreateOrGetProfileShareUrlModule (upval)
		return UseDispatchResult(CreateOrGetProfileShareUrlModule.API()):catch(function() --[[ Line: 11 ]] end)
	end
end