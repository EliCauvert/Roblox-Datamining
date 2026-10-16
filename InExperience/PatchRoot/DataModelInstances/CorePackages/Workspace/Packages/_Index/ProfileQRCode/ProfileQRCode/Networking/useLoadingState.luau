local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local UseSelectorFunction = require(ProfileQRCode.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local CreateOrGetProfileShareUrlModule = require(ProfileQRCode.Networking.createOrGetProfileShareUrl)

return function() --[[ Line: 7 ]]
	-- upvalues: UseSelectorFunction (copy), CreateOrGetProfileShareUrlModule (copy)
	return UseSelectorFunction(function(p1) --[[ Line: 8 ]]
		-- upvalues: CreateOrGetProfileShareUrlModule (upval)
		return CreateOrGetProfileShareUrlModule.getStatus(p1)
	end)
end