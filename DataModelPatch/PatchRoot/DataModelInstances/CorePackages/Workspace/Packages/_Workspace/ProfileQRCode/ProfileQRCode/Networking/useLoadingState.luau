local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local UseSelectorFunction = require(ProfileQRCode.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local CreateOrGetProfileShareUrlModule = require(ProfileQRCode.Networking.createOrGetProfileShareUrl)

return function()
	-- upvalues: UseSelectorFunction (copy), CreateOrGetProfileShareUrlModule (copy)
	return UseSelectorFunction(function(p1)
		-- upvalues: CreateOrGetProfileShareUrlModule (upval)
		return CreateOrGetProfileShareUrlModule.getStatus(p1)
	end)
end