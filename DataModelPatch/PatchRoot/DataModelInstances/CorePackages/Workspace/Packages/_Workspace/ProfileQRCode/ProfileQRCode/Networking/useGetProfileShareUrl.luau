local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local CreateOrGetProfileShareUrlModule = require(ProfileQRCode.Networking.createOrGetProfileShareUrl)
local UseDispatchFunction = require(ProfileQRCode.Parent.RoactUtils).Hooks.RoactRodux.useDispatch

return function()
	-- upvalues: UseDispatchFunction (copy), CreateOrGetProfileShareUrlModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return function()
		-- upvalues: UseDispatchResult (copy), CreateOrGetProfileShareUrlModule (upval)
		return UseDispatchResult(CreateOrGetProfileShareUrlModule.API()):catch(function() end)
	end
end